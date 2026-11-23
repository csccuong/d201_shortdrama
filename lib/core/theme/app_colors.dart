import 'package:flutter/material.dart';

/// Centralized Color Palette & Gradients for DXX ShortDrama.
class AppColors {
  AppColors._();

  // ===========================================================================
  // 1. BACKGROUNDS & SURFACES
  // ===========================================================================
  static const Color black = Colors.black;
  static const Color transparent = Colors.transparent;
  static const Color background = Color(0xFF0D0B08);
  static const Color scaffoldDark = Color(0xFF0D0B08);
  static const Color surface = Color(0xFF1B1710);
  static const Color surfaceCard = Color(0xFF1B1710);
  static const Color surfaceLockedCard = Color(0xFF1B1710);
  static const Color surfacePopularPack = Color(0xFF292216);
  static const Color secondaryBackground = Color(0xFF292216);
  static const Color surfaceBannerFallback = Color(0xFF1B1710);
  static const Color surfaceSheet = Color(0xFF1B1710);
  static const Color searchBarBg = Color(0xFF1B1710);
  static const Color bottomBarBg = Color(0xFF1B1710);
  static const Color profileTileBg = Color(0xFF1B1710);
  static const Color adLoadingBg = Color(0xFF0D0B08);
  static const Color languageLoadingScrim = Color(0xCC0D0B08);
  static const Color languageCardBg = Color(0xFF1B1710);
  static const Color languageCardBorder = Color(0xFF393126);
  static const Color languageRadioUnselected = Color(0xFFA9A39A);
  static const Color languageGroupCircleBg = Color(0xFF292216);
  static const Color languageBubbleBlue = Color(0xFF2878FF);
  static const Color languageBubbleDarkText = Color(0xFF0D0B08);
  static const Color languageTreeLine = Color(0xFFA9A39A);
  static const Color languageHandFill = Color(0xFFFFFFFF);
  static const Color languageHandStroke = Color(0xFF0D0B08);
  static const Color languageHandRipple = Color(0x52FFF0B3);
  static const Color onboardDotInactive = Color(0xFF292216);
  static const Color splashGlassBase = Color(0x8C1B1710);
  static const Color splashGlassRim = Color(0x47FFF0B3);
  static const Color splashGlassInnerSheenFill = Color(0x26FFF0B3);
  static const Color splashGlassDropShadow = Color(0xB8000000);
  static const Color splashCrimsonGlowShadow = Color(0x6BFFC629);
  static const Color splashRubyTriangleGlow = Color(0x8FFFC629);
  static const Color splashRubyCoralTop = Color(0xFFFFF0B3);
  static const Color splashRubyMid = Color(0xFFFFD95A);
  static const Color splashRubyDeep = Color(0xFFFFC629);
  static const Color splashRubyRimLight = Color(0x99FFF0B3);
  static const Color splashRubyUpperFacet = Color(0x42FFF0B3);
  static const Color splashProgressTrack = Color(0x2BFFFFFF);
  static const Color splashSparkCore = Color(0xFFFFF0B3);
  static const Color splashSparkMidGlow = Color(0xFFFFD95A);
  static const Color splashSparkOuterGlow = Color(0xCCFFC629);
  static const Color splashPosterTileBorder = Color(0x33393126);
  static const Color floatingAdCardBg = Color(0xFF1B1710);
  static const Color floatingAdCardBorder = Color(0xFF393126);
  static const Color floatingAdCloseBg = Color(0x8A0D0B08);
  static const Color floatingAdDragHandle = Color(0xFF393126);
  static const Color floatingAdShadow = Color(0x9E000000);
  static const Color floatingAdHeadlineDark = Color(0xFFFFFFFF);
  static const Color floatingAdPreviewMediaBg = Color(0xFF292216);
  static const Color floatingAdDivider = Color(0xFF393126);

  // ===========================================================================
  // 2. BRAND & ACCENT COLORS
  // ===========================================================================
  static const Color primary = Color(0xFFFFC629);
  static const Color primaryBright = Color(0xFFFFD95A);
  static const Color primaryLight = Color(0xFFFFF0B3);
  static const Color primaryDark = Color(0xFFD99E00);
  static const Color onPrimary = Color(0xFF0D0B08);
  static const Color gradientRedStart = Color(0xFFFFD95A);
  static const Color gradientRedEnd = Color(0xFFFFC629);
  static const Color secondaryOrange = Color(0xFFFFD95A);
  static const Color gold = Color(0xFFFFC629);
  static const Color cyan = Color(0xFFFFF0B3);
  static const Color success = Color(0xFF00E676);
  static const Color error = Colors.redAccent;

  // ===========================================================================
  // 3. TEXT & ICON COLORS
  // ===========================================================================
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textWhite70 = Colors.white70;
  static const Color textWhite60 = Colors.white60;
  static const Color textWhite54 = Colors.white54;
  static const Color textWhite38 = Colors.white38;
  static const Color textWhite24 = Colors.white24;
  static const Color textSecondary = Color(0xFFA9A39A);
  static const Color textMuted = Color(0xFFA9A39A);
  static const Color textHint = Color(0xFFA9A39A);
  static const Color navInactive = Color(0xFFA9A39A);
  static const Color profileIdText = Color(0xFFA9A39A);
  static const Color profileChevron = Color(0xFFA9A39A);
  static const Color vipGoldTextDark = Color(0xFF0D0B08);
  static const Color vipGoldSubtextDark = Color(0xFF292216);
  static const Color vipActivateBtnBg = Color(0xFF292216);
  static const Color vipActivateBtnText = Color(0xFFFFF0B3);
  static const Color rewardHeroRedTitle = Color(0xFFFFD95A);
  static const Color rewardPlanCardBg = Color(0xFF1B1710);
  static const Color rewardPlanRadioInactive = Color(0xFFA9A39A);
  static const Color rewardPriceYellow = Color(0xFFFFD95A);

  // ===========================================================================
  // 4. BORDERS, OVERLAYS & DIVIDERS
  // ===========================================================================
  static const Color borderSubtle = Color(0xFF393126);
  static const Color borderLight = Color(0xFF393126);
  static const Color borderMedium = Color(0x66FFC629);
  static const Color divider = Color(0xFF393126);
  static const Color glassFill = Color(0xFF292216);
  static const Color playerGlassCircle = Color(0x4D292216);
  static const Color playerGlassButton = Color(0x80292216);
  static const Color playerProgressPlayed = Color(0xFFFFD95A);
  static const Color playerProgressTrack = Color(0x4D393126);
  static const Color overlayMedium = Color(0x8C0D0B08);
  static const Color overlayDark = Color(0xA60D0B08);
  static const Color overlayHeavy = Color(0xD10D0B08);

  // ===========================================================================
  // 5. GRADIENTS
  // ===========================================================================
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [gradientRedStart, gradientRedEnd],
  );

  static const LinearGradient badgePrimaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [gradientRedStart, gradientRedEnd],
  );

  static const LinearGradient exploreCtaGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [gradientRedStart, gradientRedEnd],
  );

  static const RadialGradient emptyArtworkMaskGradient = RadialGradient(
    radius: 0.52,
    stops: [0.0, 0.78, 1.0],
    colors: [
      Colors.white,
      Colors.white,
      Colors.transparent,
    ],
  );

  static const LinearGradient brandIconGradient = LinearGradient(
    colors: [primaryLight, primary],
  );

  static const LinearGradient vipCardGradient = LinearGradient(
    colors: [Color(0xFF292216), Color(0xFF1B1710)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient profileAvatarGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF393126),
      Color(0xFFA9A39A),
    ],
  );

  static const LinearGradient profileVipGoldGradient = LinearGradient(
    begin: Alignment(-0.85, 0.95),
    end: Alignment(0.75, -0.95),
    stops: [0.0, 0.42, 0.78, 1.0],
    colors: [
      Color(0xFFFFC629),
      Color(0xFFFFD95A),
      Color(0xFFFFF0B3),
      Color(0xFFFFC629),
    ],
  );

  static const LinearGradient vipPlanHighlightGradient = LinearGradient(
    colors: [Color(0xFF292216), Color(0xFF1B1710)],
  );

  static const LinearGradient rewardFeatureIconBoxGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF292216),
      Color(0xFF1B1710),
    ],
  );

  /// Selected VIP package inner radial edge glow overlaid on [rewardPlanCardBg] (#1B1710):
  /// Center is #FFC629 at 0% opacity; outer edges glow #FFC629 along an angled ellipse.
  static const RadialGradient rewardSelectedPlanGradient = RadialGradient(
    center: Alignment.center,
    radius: 1.0,
    stops: [0.0, 0.42, 0.72, 1.0],
    colors: [
      Color(0x00FFC629),
      Color(0x00FFC629),
      Color(0x24FFC629),
      Color(0x4DFFC629),
    ],
    transform: _EllipticalPlanGlowTransform(),
  );

  /// Selected VIP package 1px inner linear gradient border (#FFF0B3 -> #FFC629).
  static const LinearGradient rewardSelectedPlanBorderGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 0.5, 1.0],
    colors: [
      Color(0xFFFFF0B3),
      Color(0xCCFFD95A),
      Color(0xCCFFC629),
    ],
  );

  static const LinearGradient vipPosterBadgeGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFFF0B3),
      Color(0xFFFFC629),
    ],
  );

  static const LinearGradient rewardHeroLeftScrim = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: [0.0, 0.28, 0.62, 1.0],
    colors: [
      Color(0xFF0D0B08),
      Color(0xEB0D0B08),
      Color(0x590D0B08),
      Colors.transparent,
    ],
  );

  static const LinearGradient rewardHeroBottomScrim = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 0.45, 0.82, 1.0],
    colors: [
      Color(0x550D0B08),
      Colors.transparent,
      Color(0xCC0D0B08),
      Color(0xFF0D0B08),
    ],
  );

  static const LinearGradient walletBannerGradient = LinearGradient(
    colors: [Color(0xFF292216), Color(0xFF1B1710)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static LinearGradient heroBannerGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: const [0.0, 0.48, 0.78, 1.0],
    colors: [
      const Color(0xFF0D0B08).withValues(alpha: 0.96),
      const Color(0xFF1B1710).withValues(alpha: 0.82),
      const Color(0xFF292216).withValues(alpha: 0.35),
      Colors.transparent,
    ],
  );

  static LinearGradient posterBottomGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: const [0.6, 1.0],
    colors: [
      Colors.transparent,
      Colors.black.withValues(alpha: 0.35),
    ],
  );

  static LinearGradient bottomScrimGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.transparent,
      const Color(0xFF0D0B08).withValues(alpha: 0.88),
    ],
  );

  static LinearGradient topHeaderScrimGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      const Color(0xFF0D0B08).withValues(alpha: 0.62),
      Colors.transparent,
    ],
  );

  static const LinearGradient languageTileBgGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFF1B1710),
      Color(0xFF1B1710),
    ],
  );

  static const LinearGradient languageTileSelectedGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFF292216),
      Color(0xFF1B1710),
    ],
  );

  static const LinearGradient splashBackdropGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 0.45, 1.0],
    colors: [
      Color(0x990D0B08),
      Color(0xD90D0B08),
      Color(0xFF0D0B08),
    ],
  );

  static const LinearGradient splashPosterFallbackGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF292216),
      Color(0xFF1B1710),
    ],
  );

  static const LinearGradient splashPosterWallVignette = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 0.26, 0.54, 0.80, 1.0],
    colors: [
      Color(0xE00D0B08),
      Color(0x940D0B08),
      Color(0x8F0D0B08),
      Color(0xD60D0B08),
      Color(0xFA0D0B08),
    ],
  );

  static const RadialGradient splashPosterSideVignette = RadialGradient(
    center: Alignment(0.0, -0.06),
    radius: 0.95,
    stops: [0.0, 0.62, 1.0],
    colors: [
      Colors.transparent,
      Color(0x380D0B08),
      Color(0xB80D0B08),
    ],
  );

  static const RadialGradient splashCrimsonCenterGlow = RadialGradient(
    center: Alignment(0.06, -0.08),
    radius: 0.56,
    stops: [0.0, 0.36, 0.72, 1.0],
    colors: [
      Color(0x6BFFC629),
      Color(0x38FFD95A),
      Color(0x14FFC629),
      Colors.transparent,
    ],
  );

  static const LinearGradient splashGlassSurfaceGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 0.48, 1.0],
    colors: [
      Color(0x3DFFF0B3),
      Color(0x1AFFFFFF),
      Color(0x14FFC629),
    ],
  );

  static const LinearGradient splashShimmerBandGradient = LinearGradient(
    begin: Alignment(-1.0, -0.45),
    end: Alignment(1.0, 0.45),
    stops: [0.0, 0.38, 0.50, 0.62, 1.0],
    colors: [
      Colors.transparent,
      Color(0x08FFF0B3),
      Color(0x47FFF0B3),
      Color(0x08FFF0B3),
      Colors.transparent,
    ],
  );

  static const LinearGradient onboardImageBottomGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 0.58, 1.0],
    colors: [
      Colors.transparent,
      Color(0x660D0B08),
      Color(0xFF0D0B08),
    ],
  );
}

class _EllipticalPlanGlowTransform extends GradientTransform {
  const _EllipticalPlanGlowTransform();

  // Precomputed cos(-0.76 rad) and sin(-0.76 rad) for Figma angled radial ellipse:
  // Major axis (sx = 1.16) along bottom-left <-> top-right,
  // Minor axis (sy = 0.72) along top-left <-> bottom-right.
  static const double _c = 0.724836;
  static const double _s = -0.688921;
  static const double _sx = 1.16;
  static const double _sy = 0.72;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    final cx = bounds.center.dx;
    final cy = bounds.center.dy;
    const m00 = _sx * _c;
    const m10 = _sx * _s;
    const m01 = -_sy * _s;
    const m11 = _sy * _c;
    final tx = cx - cx * m00 - cy * m01;
    final ty = cy - cx * m10 - cy * m11;
    return Matrix4(
      m00, m10, 0.0, 0.0,
      m01, m11, 0.0, 0.0,
      0.0, 0.0, 1.0, 0.0,
      tx,  ty,  0.0, 1.0,
    );
  }
}
