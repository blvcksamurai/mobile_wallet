import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_wallet/src/common/utils/colors.dart';
import 'package:mobile_wallet/src/common/utils/text_style.dart';

class CustomHeaderSubHeader extends StatelessWidget {
  final String? header;
  final String? subHeader;
  const CustomHeaderSubHeader({
    this.header = 'Header',
    this.subHeader = 'Sub Header',
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(24),
        Text(header!, style: AppTextStyles.bodyMedium),
        Gap(5),
        Text(
          subHeader!,
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.textTertiary,
          ),
        ),
      ],
    );
  }
}
