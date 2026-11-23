import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/constants/app_constants.dart';
import '../core/utils/screen_utils.dart';
import '../providers/app_providers.dart';
import '../services/network_connectivity_service.dart';
import 'no_internet_dialog.dart';

/// Global connectivity gate mounted at the root `MaterialApp` builder.
///
/// Automatically presents a non-dismissible [NoInternetDialog] over the active
/// `Navigator` whenever internet access is lost, removes it once connectivity
/// recovers, and refreshes session/feed state if needed.
class NoInternetGate extends ConsumerStatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final Widget child;

  const NoInternetGate({
    super.key,
    required this.navigatorKey,
    required this.child,
  });

  @override
  ConsumerState<NoInternetGate> createState() => _NoInternetGateState();
}

class _NoInternetGateState extends ConsumerState<NoInternetGate> {
  final NetworkConnectivityService _connectivity =
      NetworkConnectivityService.instance;

  RawDialogRoute<void>? _activeRoute;
  bool _syncScheduled = false;
  bool _wasOffline = false;

  @override
  void initState() {
    super.initState();
    _connectivity.isOnline.addListener(_onOnlineChanged);
    unawaited(_connectivity.start());
    _scheduleSync();
  }

  @override
  void dispose() {
    _connectivity.isOnline.removeListener(_onOnlineChanged);
    _dismissDialogRoute();
    super.dispose();
  }

  void _onOnlineChanged() {
    _scheduleSync();
  }

  void _scheduleSync() {
    if (_syncScheduled || !mounted) return;
    _syncScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _syncScheduled = false;
      if (!mounted) return;
      _syncDialogState();
    });
    WidgetsBinding.instance.ensureVisualUpdate();
  }

  void _syncDialogState() {
    final online = _connectivity.isOnline.value;
    if (!online) {
      _wasOffline = true;
      _showDialogRoute();
    } else {
      _dismissDialogRoute();
      if (_wasOffline) {
        _wasOffline = false;
        unawaited(_recoverAfterReconnect());
      }
    }
  }

  void _showDialogRoute() {
    if (_activeRoute != null) return;
    final navigator = widget.navigatorKey.currentState;
    if (navigator == null) {
      // Navigator may not be attached on the very first frame; retry next frame.
      _scheduleSync();
      return;
    }

    final route = RawDialogRoute<void>(
      barrierDismissible: false,
      barrierColor: AppColors.overlayHeavy,
      barrierLabel: 'NoInternet',
      settings: const RouteSettings(name: 'NoInternetDialog'),
      transitionDuration: const Duration(milliseconds: 180),
      pageBuilder: (_, _, _) => const NoInternetDialog(),
    );
    _activeRoute = route;
    navigator.push(route);
    route.popped.whenComplete(() {
      if (identical(_activeRoute, route)) {
        _activeRoute = null;
      }
    });
  }

  void _dismissDialogRoute() {
    final route = _activeRoute;
    if (route == null) return;
    _activeRoute = null;
    final nav = route.navigator;
    if (nav != null && route.isActive) {
      nav.removeRoute(route);
    }
  }

  Future<void> _recoverAfterReconnect() async {
    if (AppConstants.isFlutterTest) return;
    if (!mounted) return;

    final initialized =
        await ref.read(sessionProvider.notifier).ensureInitialized();
    if (!mounted || !initialized) return;

    final lang = AppConstants.selectedLanguageCode;
    final homeAsync = ref.read(homeProvider);
    if (homeAsync.hasError || homeAsync.asData?.value.homeData == null) {
      unawaited(ref.read(homeProvider.notifier).fetchHome(lang));
    }

    final feedState = ref.read(feedProvider);
    if (feedState.items.isEmpty || feedState.error != null) {
      unawaited(ref.read(feedProvider.notifier).fetchInitialFeed(lang));
    }

    final rewardsAsync = ref.read(rewardsProvider);
    if (rewardsAsync.hasError || rewardsAsync.asData?.value.overview == null) {
      unawaited(ref.read(rewardsProvider.notifier).fetchOverview(lang));
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
