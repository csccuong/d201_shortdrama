import 'package:flutter/material.dart';
import '../utils/screen_utils.dart';

export 'app_colors.dart';
export 'app_text_styles.dart';

/// Global Theme Configuration for Android & iOS.
class AppTheme {
  AppTheme._();

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: AppTextStyles.defaultFontFamily,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        onPrimary: AppColors.onPrimary,
        secondary: AppColors.primaryBright,
        onSecondary: AppColors.onPrimary,
        surface: AppColors.surfaceSheet,
        onSurface: AppColors.textPrimary,
      ),
      dividerColor: AppColors.divider,
      pageTransitionsTheme: AppScreenUtils.pageTransitionsTheme,
      splashFactory: AppScreenUtils.isIOS
          ? NoSplash.splashFactory
          : InkSparkle.splashFactory,
      useMaterial3: true,
    );
  }
}
