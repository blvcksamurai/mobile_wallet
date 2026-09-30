import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_wallet/src/common/models/upcoming_bills_model.dart';
import 'package:mobile_wallet/src/common/utils/app_assets.dart';
import 'package:mobile_wallet/src/common/utils/colors.dart';
import 'package:mobile_wallet/src/common/utils/text_style.dart';
import 'package:mobile_wallet/src/common/widgets/custom_header_subHeader.dart';

class UpcomingBillsItem extends StatelessWidget {
  final UpcomingBillsModel upcomingBill;
  const UpcomingBillsItem({super.key, required this.upcomingBill});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.borderSecondary),
              ),
              child: Image.asset(AppAssets.image(upcomingBill.image)),
            ),
            Gap(12),
            CustomHeaderSubHeader(
              header: upcomingBill.name,
              subHeader: upcomingBill.due,
            ),
          ],
        ),
        Text(
          '\$${upcomingBill.amount.toStringAsFixed(2)}',
          style: AppTextStyles.bodyMedium,
        ),
      ],
    );
  }
}
