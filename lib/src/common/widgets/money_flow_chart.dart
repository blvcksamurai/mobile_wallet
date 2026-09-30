import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_wallet/src/common/models/money_flow.dart';
import 'package:mobile_wallet/src/common/utils/colors.dart';
import 'package:mobile_wallet/src/common/utils/text_style.dart';
import 'package:mobile_wallet/src/common/widgets/striped_bar.dart';

class MoneyFlowChart extends StatelessWidget {
  const MoneyFlowChart({
    required this.flow,
    this.chartHeight = 216,
    this.headroom = 1.14,
    this.inColor = const Color(0xFF5B8570),
    this.outColor = const Color(0xFFEDAE5B),
    super.key,
  });

  final MoneyFlow flow;
  final double chartHeight;

  /// axisMax = tallest value × headroom (tallest bar lands at 1 / headroom).
  final double headroom;
  final Color inColor;
  final Color outColor;

  static const _ticks = [0, 50, 100];
  static const _labelWidth = 36.0;
  static const _barInset = 16.0;
  static const _barGap = 4.0;
  static const _barRadius = 12.0;

  @override
  Widget build(BuildContext context) {
    final axisMax = flow.maxValue <= 0 ? 1.0 : flow.maxValue * headroom;
    double barHeight(double v) =>
        (v / axisMax * chartHeight).clamp(0.0, chartHeight);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Vertical padding leaves room for the 100 and 0 labels, which
        // are centered on their gridlines and overflow the plot by half
        // their height.
        Text(
          formatDifference(flow.difference),
          style: AppTextStyles.titleLarge,
        ),
        Gap(20),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: SizedBox(
            height: chartHeight,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                for (final tick in _ticks)
                  Positioned(
                    left: 0,
                    right: 0,
                    top: chartHeight * (1 - tick / 100) - 8,
                    height: 16,
                    child: Row(
                      children: [
                        SizedBox(
                          width: _labelWidth,
                          child: Text(
                            '$tick',

                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.textSecondary,
                              height: 1,
                            ),
                          ),
                        ),
                        const Expanded(child: Divider(height: 1, thickness: 1)),
                      ],
                    ),
                  ),
                Positioned.fill(
                  left: _labelWidth + _barInset,
                  right: _barInset,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Container(
                          height: barHeight(flow.moneyIn),
                          decoration: BoxDecoration(
                            color: inColor,
                            borderRadius: BorderRadius.circular(_barRadius),
                          ),
                        ),
                      ),
                      const Gap(_barGap),
                      Expanded(
                        child: StripedBar(
                          height: barHeight(flow.moneyOut),
                          borderRadius: _barRadius,
                          stripeColor: outColor,
                          stripeThickness: 2,
                          stripePeriod: 4,
                          phase: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const Gap(24),
        _LegendRow(
          swatch: Container(
            width: 13,
            height: 25,
            decoration: BoxDecoration(
              color: inColor,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          label: 'Money In',
          amount: formatMoney(flow.moneyIn),
        ),
        const Gap(16),
        _LegendRow(
          swatch: SizedBox(
            width: 13,
            height: 25,
            child: StripedBar(
              height: 25,
              borderRadius: 4,
              stripeColor: outColor,
              stripeThickness: 2,
              stripePeriod: 4,
              phase: 0,
            ),
          ),
          label: 'Money Out',
          amount: formatMoney(flow.moneyOut),
        ),
        // const Gap(12),
        // Align(
        //   alignment: Alignment.centerRight,
        //   child: Text(
        //     'Difference: ${formatDifference(flow.difference)}',
        //     style: AppTextStyles.bodyMedium.copyWith(
        //       color: AppColors.textSecondary,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

class _LegendRow extends StatelessWidget {
  const _LegendRow({
    required this.swatch,
    required this.label,
    required this.amount,
  });

  final Widget swatch;
  final String label;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        swatch,
        const Gap(12),
        Text(label, style: AppTextStyles.bodyMedium),
        const Spacer(),
        Text(amount, style: AppTextStyles.bodyMedium),
      ],
    );
  }
}
