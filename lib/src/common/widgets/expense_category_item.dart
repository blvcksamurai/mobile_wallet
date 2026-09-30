import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_wallet/src/common/models/expense_categories_model.dart';
import 'package:mobile_wallet/src/common/utils/app_assets.dart';
import 'package:mobile_wallet/src/common/utils/colors.dart';
import 'package:mobile_wallet/src/common/utils/text_style.dart';
import 'package:mobile_wallet/src/common/widgets/spending_progress_bar.dart';

class ExpenseCategoriesItem extends StatelessWidget {
  final ExpenseCategory category;

  const ExpenseCategoriesItem({required this.category, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: ConstrainedBox(
              // Row is at least as wide as the available space, so on wide
              // screens spaceBetween pushes the two groups to the edges.
              // If the content is wider, FittedBox scales it down uniformly.
              constraints: BoxConstraints(minWidth: constraints.maxWidth),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _Leading(category: category),
                  const Gap(12),
                  _Trailing(category: category),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _Leading extends StatelessWidget {
  const _Leading({required this.category});
  final ExpenseCategory category;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
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
      ],
    );
  }
}

class _Trailing extends StatelessWidget {
  const _Trailing({required this.category});
  final ExpenseCategory category;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SpendingProgressBar(progress: category.progress, color: category.color),
        const Gap(16),
        Text(
          '\$${category.spent.toStringAsFixed(0)} / \$${category.total.toStringAsFixed(0)}',
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
          maxLines: 1,
          softWrap: false,
        ),
      ],
    );
  }
}
