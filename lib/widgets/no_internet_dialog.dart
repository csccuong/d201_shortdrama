import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/utils/screen_utils.dart';
import '../providers/app_providers.dart';
import '../services/network_connectivity_service.dart';

/// Non-dismissible popup displayed whenever the device has no internet access.
///
/// The app requires an online connection to stream videos and load content,
/// so back navigation and tap-outside dismissal are disabled until network
/// connectivity is restored.
class NoInternetDialog extends ConsumerWidget {
  const NoInternetDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    final connectivity = NetworkConnectivityService.instance;

    return PopScope(
      canPop: false,
      child: Dialog(
        key: const ValueKey('no_internet_dialog'),
        backgroundColor: AppColors.surfaceSheet,
        insetPadding: EdgeInsets.symmetric(horizontal: 28.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.r),
          side: const BorderSide(color: AppColors.borderLight),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 20.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 58.w,
                height: 58.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary.withValues(alpha: 0.14),
                  border: Border.all(
                    color: AppColors.primary.withValues(alpha: 0.34),
                  ),
                ),
                child: Icon(
                  Icons.wifi_off_rounded,
                  color: AppColors.primary,
                  size: 28.sp,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                locale.tr('no_internet_title'),
                textAlign: TextAlign.center,
                style: AppTextStyles.h2,
              ),
              SizedBox(height: 8.h),
              Text(
                locale.tr('no_internet_desc'),
                textAlign: TextAlign.center,
                style: AppTextStyles.dialogBody,
              ),
              SizedBox(height: 22.h),
              ValueListenableBuilder<bool>(
                valueListenable: connectivity.isChecking,
                builder: (context, checking, _) {
                  return SizedBox(
                    width: double.infinity,
                    child: GestureDetector(
                      key: const ValueKey('no_internet_retry_button'),
                      behavior: HitTestBehavior.opaque,
                      onTap: checking ? null : () => connectivity.checkNow(),
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 150),
                        opacity: checking ? 0.72 : 1.0,
                        child: Container(
                          height: 44.h,
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            gradient: AppColors.primaryGradient,
                            borderRadius: BorderRadius.circular(22.r),
                          ),
                          child: checking
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      width: 16.w,
                                      height: 16.w,
                                      child: const CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: AppColors.onPrimary,
                                      ),
                                    ),
                                    SizedBox(width: 8.w),
                                    Flexible(
                                      child: Text(
                                        locale.tr('no_internet_checking'),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: AppTextStyles.exploreButtonText,
                                      ),
                                    ),
                                  ],
                                )
                              : Text(
                                  locale.tr('retry_btn'),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextStyles.exploreButtonText,
                                ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
