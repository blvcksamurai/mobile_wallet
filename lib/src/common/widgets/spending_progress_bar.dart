import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_wallet/src/common/widgets/striped_bar.dart';

/// Solid segment = spent, striped segment = remaining.
/// The two segments plus the gap always add up to [width].
class SpendingProgressBar extends StatelessWidget {
  const SpendingProgressBar({
    required this.progress,
    required this.color,
    this.width = 100,
    this.height = 4,
    this.gap = 4,
    super.key,
  });

  final double progress; // 0..1
  final Color color;
  final double width;
  final double height;
  final double gap;

  @override
  Widget build(BuildContext context) {
    final p = progress.clamp(0.0, 1.0);
    final hasSpent = p > 0;
    final hasRemaining = p < 1;

    double spentWidth;
    double remainingWidth;

    if (hasSpent && hasRemaining) {
      // Split the width left over after the gap.
      final usable = width - gap;
      // Keep each segment at least as wide as it is tall, so a tiny
      // percentage still shows a visible rounded pill.
      spentWidth = (usable * p).clamp(height, usable - height);
      remainingWidth = usable - spentWidth;
    } else {
      // Fully spent or nothing spent: one segment, no gap.
      spentWidth = hasSpent ? width : 0;
      remainingWidth = hasRemaining ? width : 0;
    }

    return SizedBox(
      width: width,
      height: height,
      child: Row(
        children: [
          if (spentWidth > 0)
            Container(
              width: spentWidth,
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(height),
                color: color,
              ),
            ),
          if (spentWidth > 0 && remainingWidth > 0) Gap(gap),
          if (remainingWidth > 0)
            SizedBox(
              width: remainingWidth,
              child: StripedBar(
                height: height,
                borderRadius: height,
                stripeColor: color.withValues(alpha: 0.5),
                stripeThickness: 2,
                stripePeriod: 5,
                phase: 5.5,
              ),
            ),
        ],
      ),
    );
  }
}
