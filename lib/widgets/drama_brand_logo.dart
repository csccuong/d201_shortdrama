import 'package:flutter/material.dart';
import '../core/utils/screen_utils.dart';

/// Luxury gold & obsidian "Drama" brand wordmark.
class DramaBrandLogo extends StatelessWidget {
  const DramaBrandLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 1.h),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (bounds) => const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.45, 1.0],
              colors: [
                AppColors.primaryLight,
                AppColors.primaryBright,
                AppColors.primary,
              ],
            ).createShader(bounds),
            child: Text('D', style: AppTextStyles.brandLogoD),
          ),
          ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (bounds) => const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.65, 1.0],
              colors: [
                AppColors.textPrimary,
                AppColors.textPrimary,
                Color(0xFFF3ECDD),
              ],
            ).createShader(bounds),
            child: Text('rama', style: AppTextStyles.brandLogoRest),
          ),
        ],
      ),
    );
  }
}
