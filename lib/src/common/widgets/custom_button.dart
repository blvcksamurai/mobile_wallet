import 'package:flutter/material.dart';
import 'package:mobile_wallet/src/common/utils/colors.dart';
import 'package:mobile_wallet/src/common/utils/text_style.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  Color? color;
  CustomButton({super.key, this.onPressed, this.text = 'Button', this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 32,
        decoration: BoxDecoration(
          color: color ?? AppColors.fillSecondary,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Text(text, style: AppTextStyles.bodyMedium),
      ),
    );
  }
}
