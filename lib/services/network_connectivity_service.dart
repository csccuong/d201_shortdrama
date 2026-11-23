import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/widgets.dart';

import '../core/constants/app_constants.dart';

/// Monitors real-time network & internet reachability across the app.
///
/// Combines `connectivity_plus` transport events, app lifecycle resume checks,
/// and lightweight DNS lookups so Wi-Fi connections without actual internet
/// access are still caught reliably.
class NetworkConnectivityService with WidgetsBindingObserver {
  NetworkConnectivityService._();

  static final NetworkConnectivityService instance =
      NetworkConnectivityService._();

  final ValueNotifier<bool> isOnline = ValueNotifier<bool>(true);
  final ValueNotifier<bool> isChecking = ValueNotifier<bool>(false);

  StreamSubscription<List<ConnectivityResult>>? _connectivitySub;
  Timer? _offlineRetryTimer;
  Future<bool>? _inFlightCheck;
  Completer<void>? _onlineCompleter;
  bool _started = false;
  bool _observerAttached = false;

  @visibleForTesting
  Future<bool> Function()? debugProbeOverride;

  @visibleForTesting
  Stream<List<ConnectivityResult>>? debugConnectivityStreamOverride;

  /// Starts listening to connectivity and lifecycle changes, and runs an
  /// immediate initial connectivity check.
  Future<void> start() async {
    if (_started) return;
    if (AppConstants.isFlutterTest &&
        debugProbeOverride == null &&
        debugConnectivityStreamOverride == null) {
      isOnline.value = true;
      return;
    }

    _started = true;
    if (!_observerAttached) {
      WidgetsBinding.instance.addObserver(this);
      _observerAttached = true;
    }

    final stream =
        debugConnectivityStreamOverride ?? Connectivity().onConnectivityChanged;
    _connectivitySub = stream.listen((results) {
      final hasTransport = results.any((r) => r != ConnectivityResult.none);
      if (!hasTransport) {
        _setOnline(false);
        return;
      }
      unawaited(checkNow());
    });

    await checkNow();
  }

  /// Checks whether the device currently has working internet connectivity.
  Future<bool> checkNow() {
    final existing = _inFlightCheck;
    if (existing != null) return existing;

    final future = _performCheck().whenComplete(() {
      _inFlightCheck = null;
    });
    _inFlightCheck = future;
    return future;
  }

  Future<bool> _performCheck() async {
    if (AppConstants.isFlutterTest && debugProbeOverride == null) {
      _setOnline(true);
      return true;
    }

    isChecking.value = true;
    try {
      final probe = debugProbeOverride;
      if (probe != null) {
        final ok = await probe();
        _setOnline(ok);
        return ok;
      }

      List<ConnectivityResult> results = const [];
      try {
        results = await Connectivity()
            .checkConnectivity()
            .timeout(const Duration(seconds: 2));
      } catch (e) {
        debugPrint('NetworkConnectivityService checkConnectivity error: $e');
      }

      if (results.isNotEmpty &&
          results.every((r) => r == ConnectivityResult.none)) {
        _setOnline(false);
        return false;
      }

      final hasInternet = await _hasInternetReachability();
      _setOnline(hasInternet);
      return hasInternet;
    } finally {
      isChecking.value = false;
    }
  }

  Future<bool> _hasInternetReachability() async {
    final checks = await Future.wait<bool>([
      _canResolveHost('api.dramota.com'),
      _canResolveHost('dns.google'),
    ]);
    return checks.any((ok) => ok);
  }

  Future<bool> _canResolveHost(String host) async {
    try {
      final addresses = await InternetAddress.lookup(host).timeout(
        const Duration(seconds: 3),
      );
      return addresses.isNotEmpty && addresses.first.rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  void _setOnline(bool online) {
    if (isOnline.value != online) {
      isOnline.value = online;
    }

    if (online) {
      _stopOfflineRetryTimer();
      final completer = _onlineCompleter;
      if (completer != null && !completer.isCompleted) {
        completer.complete();
      }
      _onlineCompleter = null;
    } else {
      _startOfflineRetryTimer();
    }
  }

  void _startOfflineRetryTimer() {
    if (_offlineRetryTimer != null || AppConstants.isFlutterTest) return;
    _offlineRetryTimer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (isOnline.value) {
        _stopOfflineRetryTimer();
        return;
      }
      unawaited(checkNow());
    });
  }

  void _stopOfflineRetryTimer() {
    _offlineRetryTimer?.cancel();
    _offlineRetryTimer = null;
  }

  /// Waits until internet connectivity is restored.
  Future<void> waitUntilOnline() async {
    if (isOnline.value) return;
    final completer = _onlineCompleter ??= Completer<void>();
    await completer.future;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      unawaited(checkNow());
    }
  }

  /// Stops listeners and clears state (primarily for unit/widget tests).
  @visibleForTesting
  Future<void> resetForTest() async {
    _started = false;
    _stopOfflineRetryTimer();
    await _connectivitySub?.cancel();
    _connectivitySub = null;
    if (_observerAttached) {
      WidgetsBinding.instance.removeObserver(this);
      _observerAttached = false;
    }
    _inFlightCheck = null;
    if (_onlineCompleter != null && !_onlineCompleter!.isCompleted) {
      _onlineCompleter!.complete();
    }
    _onlineCompleter = null;
    debugProbeOverride = null;
    debugConnectivityStreamOverride = null;
    isChecking.value = false;
    isOnline.value = true;
  }
}
