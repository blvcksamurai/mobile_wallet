import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_wallet/src/common/utils/colors.dart';
import 'package:mobile_wallet/src/common/utils/text_style.dart';
import 'package:mobile_wallet/src/common/widgets/striped_bar.dart';

class CustomBarMonth extends StatelessWidget {
  final double barHeight;
  final String month;
  final Color? barColor;
  final Color? textActiveColor;

  const CustomBarMonth({
    super.key,
    required this.barHeight,
    required this.month,
    this.barColor,
    this.textActiveColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      margin: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          // Fixed area for the bars
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 32,
                child: StripedBar(
                  height: barHeight,
                  borderRadius: 6,
                  stripeColor:
                      barColor ?? AppColors.textDisabled.withValues(alpha: 0.5),
                  stripeThickness: 2,
                  stripePeriod: 5,
                  phase: 5.5,
                ),
              ),
            ),
          ),

          const Gap(8),

          Text(
            month,
            style: AppTextStyles.bodySmall.copyWith(
              color: textActiveColor ?? AppColors.textTertiary,
            ),
          ),
        ],
      ),
    );
  }
}
