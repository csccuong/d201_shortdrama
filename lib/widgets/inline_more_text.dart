import 'package:flutter/material.dart';

/// Displays [text] clamped to [maxLines] with an inline [moreSuffix]
/// (e.g. `... Thêm`) guaranteed to remain visible without being ellipsized.
class InlineMoreText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextStyle actionStyle;
  final String moreSuffix;
  final int maxLines;
  final VoidCallback? onTap;

  const InlineMoreText({
    super.key,
    required this.text,
    required this.style,
    required this.actionStyle,
    required this.moreSuffix,
    this.maxLines = 2,
    this.onTap,
  });

  static int _safeCutIndex(String source, int index) {
    var safe = index.clamp(0, source.length);
    if (safe > 0 && safe < source.length) {
      final prevUnit = source.codeUnitAt(safe - 1);
      // Avoid splitting a UTF-16 surrogate pair.
      if (prevUnit >= 0xD800 && prevUnit <= 0xDBFF) {
        safe--;
      }
    }
    return safe;
  }

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context);
    final resolvedStyle = defaultTextStyle.style.merge(style);
    final resolvedActionStyle = defaultTextStyle.style.merge(actionStyle);
    final textScaler = MediaQuery.textScalerOf(context);
    final textDirection = Directionality.of(context);
    final locale = Localizations.maybeLocaleOf(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final maxW = constraints.maxWidth;
        if (!maxW.isFinite || maxW <= 0) {
          return Text(
            text,
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
            style: resolvedStyle,
          );
        }

        final fullPainter = TextPainter(
          text: TextSpan(text: text, style: resolvedStyle),
          maxLines: maxLines,
          textDirection: textDirection,
          textScaler: textScaler,
          locale: locale,
          textWidthBasis: defaultTextStyle.textWidthBasis,
          textHeightBehavior: defaultTextStyle.textHeightBehavior,
        )..layout(maxWidth: maxW);

        if (!fullPainter.didExceedMaxLines) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onTap,
            child: Text(text, style: resolvedStyle),
          );
        }

        // Leave a 1px subpixel margin so RenderParagraph never wraps the final
        // suffix onto an extra line compared to TextPainter measurement.
        final layoutW = (maxW - 1.0).clamp(1.0, maxW);

        var lo = 0;
        var hi = text.length;
        var best = 0;
        var fitsWithSuffix = false;
        while (lo <= hi) {
          final mid = (lo + hi) >> 1;
          final safeMid = _safeCutIndex(text, mid);
          final candidate = text.substring(0, safeMid).trimRight();
          final testPainter = TextPainter(
            text: TextSpan(
              children: [
                TextSpan(text: candidate, style: resolvedStyle),
                TextSpan(text: moreSuffix, style: resolvedActionStyle),
              ],
            ),
            maxLines: maxLines,
            textDirection: textDirection,
            textScaler: textScaler,
            locale: locale,
            textWidthBasis: defaultTextStyle.textWidthBasis,
            textHeightBehavior: defaultTextStyle.textHeightBehavior,
          )..layout(maxWidth: layoutW);

          if (!testPainter.didExceedMaxLines) {
            best = safeMid;
            fitsWithSuffix = true;
            lo = mid + 1;
          } else {
            hi = mid - 1;
          }
        }

        final clipped = text.substring(0, best).trimRight();
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(text: clipped, style: resolvedStyle),
                TextSpan(text: moreSuffix, style: resolvedActionStyle),
              ],
            ),
            maxLines: maxLines,
            locale: locale,
            textScaler: textScaler,
            textWidthBasis: defaultTextStyle.textWidthBasis,
            textHeightBehavior: defaultTextStyle.textHeightBehavior,
            overflow: fitsWithSuffix
                ? TextOverflow.clip
                : TextOverflow.ellipsis,
          ),
        );
      },
    );
  }
}
