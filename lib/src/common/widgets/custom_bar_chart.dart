import 'package:flutter/material.dart';
import 'package:mobile_wallet/src/common/utils/colors.dart';
import 'package:mobile_wallet/src/common/widgets/custom_bar_month.dart';

class CustomBarChart extends StatelessWidget {
  const CustomBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: CustomBarMonth(barHeight: 70, month: 'Aug')),
        Expanded(child: CustomBarMonth(barHeight: 50, month: 'Sep')),
        Expanded(child: CustomBarMonth(barHeight: 34, month: 'Oct')),
        Expanded(child: CustomBarMonth(barHeight: 75, month: 'Nov')),
        Expanded(child: CustomBarMonth(barHeight: 100, month: 'Dec')),
        Expanded(child: CustomBarMonth(barHeight: 60, month: 'Jan')),
        Expanded(
          child: CustomBarMonth(
            barHeight: 140,
            month: 'Feb',
            barColor: AppColors.fillSandstonePrimary,
            textActiveColor: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
