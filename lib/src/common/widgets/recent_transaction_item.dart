import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_wallet/src/common/models/recent_transactions_model.dart';
import 'package:mobile_wallet/src/common/utils/app_assets.dart';
import 'package:mobile_wallet/src/common/utils/colors.dart';
import 'package:mobile_wallet/src/common/widgets/custom_header_subHeader.dart';

class RecentTransactionItem extends StatelessWidget {
  final RecentTransactionsModel recentTransaction;

  const RecentTransactionItem({super.key, required this.recentTransaction});

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
              child: Image.asset(AppAssets.image(recentTransaction.image)),
            ),
            Gap(12),
            CustomHeaderSubHeader(
              header: recentTransaction.name,
              subHeader: recentTransaction.transactionType,
            ),
          ],
        ),
        CustomHeaderSubHeader(
          header: '\$${recentTransaction.amount.toStringAsFixed(2)}',
          subHeader: recentTransaction.timestamp,
          headerColor: AppColors.rubySecondary,
        ),
        // Text(
        //   '\$19.99',
        //   // '\$${recentTransaction.amount.toStringAsFixed(2)}',
        //   style: AppTextStyles.bodyMedium.copyWith(
        //     color: AppColors.rubySecondary,
        //   ),
        // ),
      ],
    );
  }
}
