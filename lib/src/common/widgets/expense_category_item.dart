import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_wallet/src/common/models/expense_categories_model.dart';
import 'package:mobile_wallet/src/common/utils/app_assets.dart';
import 'package:mobile_wallet/src/common/utils/colors.dart';
import 'package:mobile_wallet/src/common/utils/text_style.dart';
import 'package:mobile_wallet/src/common/widgets/striped_bar.dart';

class ExpenseCategoriesItem extends StatelessWidget {
  final ExpenseCategory category;

  const ExpenseCategoriesItem({required this.category, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Row(
        children: [
          Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(AppAssets.image(category.image)),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Gap(12),

          Text(
            category.name,
            style: AppTextStyles.bodyMedium,
            maxLines: 1,
            softWrap: false,
          ),
          const Gap(12),

          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 100),
                child: Row(
                  children: [
                    Expanded(
                      flex: 60,
                      child: Container(
                        height: 4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: category.color,
                        ),
                      ),
                    ),
                    const Gap(4),
                    Expanded(
                      flex: 36,
                      child: StripedBar(
                        height: 4,
                        borderRadius: 4,
                        stripeColor: category.color.withValues(alpha: 0.5),
                        stripeThickness: 2,
                        stripePeriod: 5,
                        phase: 5.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Gap(16),

          Text(
            '\$${category.spent.toStringAsFixed(0)} / \$${category.total.toStringAsFixed(0)}',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
