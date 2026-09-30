import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_wallet/src/common/models/articles_model.dart';
import 'package:mobile_wallet/src/common/models/expense_categories_model.dart';
import 'package:mobile_wallet/src/common/models/money_flow.dart';
import 'package:mobile_wallet/src/common/models/recent_transactions_model.dart';
import 'package:mobile_wallet/src/common/models/upcoming_bills_model.dart';
import 'package:mobile_wallet/src/common/utils/colors.dart';
import 'package:mobile_wallet/src/common/utils/text_style.dart';
import 'package:mobile_wallet/src/common/widgets/articles_item.dart';
import 'package:mobile_wallet/src/common/widgets/custom_app_bar.dart';
import 'package:mobile_wallet/src/common/widgets/custom_bar_chart.dart';
import 'package:mobile_wallet/src/common/widgets/custom_button.dart';
import 'package:mobile_wallet/src/common/widgets/custom_header_subHeader.dart';
import 'package:mobile_wallet/src/common/widgets/expense_category_item.dart';
import 'package:mobile_wallet/src/common/widgets/money_flow_chart.dart';
import 'package:mobile_wallet/src/common/widgets/recent_transaction_item.dart';
import 'package:mobile_wallet/src/common/widgets/striped_bar.dart';
import 'package:mobile_wallet/src/common/widgets/upcoming_bills_item.dart';
import 'package:mobile_wallet/src/features/budget/budget_home/articles_screen.dart';
import 'package:mobile_wallet/src/features/budget/budget_home/expense_categories_screen.dart';
import 'package:mobile_wallet/src/features/budget/budget_home/recent_transactions_screen.dart';
import 'package:remixicon/remixicon.dart';

class BudgetHome extends StatefulWidget {
  const BudgetHome({super.key});

  @override
  State<BudgetHome> createState() => _BudgetHomeState();
}

class _BudgetHomeState extends State<BudgetHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        backgroundColor: AppColors.verdantPrimary,
        child: Icon(Icons.add, color: AppColors.borderPrimary),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            CustomAppBar(title: 'Budget'),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(20),
                    Row(
                      children: [
                        Container(
                          height: 32,
                          decoration: BoxDecoration(
                            color: AppColors.surfacePrimary,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          child: Text(
                            'February',
                            style: AppTextStyles.bodyMedium,
                          ),
                        ),
                        Gap(5),
                        Container(
                          height: 32,
                          decoration: BoxDecoration(
                            color: AppColors.surfacePrimary,
                            shape: BoxShape.circle,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          child: Icon(
                            RemixIcons.pencil_line,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                    Gap(10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text("\$2,219.50", style: AppTextStyles.displaySmall),
                        Gap(5),
                        Text(
                          'Left',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                    Gap(20),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 18,
                            width: 18,
                            decoration: BoxDecoration(
                              color: AppColors.fillEmberPrimary,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                        Gap(5),
                        //Striped Bar
                        SizedBox(
                          width: 110,
                          child: StripedBar(
                            height: 18,
                            borderRadius: 4,
                            stripeColor: AppColors.fillEmberPrimary.withValues(
                              alpha: 0.5,
                            ),
                            stripeThickness: 2,
                            stripePeriod: 5,
                            phase: 5.5,
                          ),
                        ),
                      ],
                    ),
                    Gap(12),
                    Text(
                      "\$1,285 / \$3,500 spent",
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    Gap(20),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 370,
                width: double.infinity,
                color: AppColors.surfacePrimary,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomHeaderSubHeader(
                      header: 'Spending Insight',
                      subHeader:
                          "You've exceeded your average spend this month compared\nto last 6 months.",
                    ),
                    Gap(20),
                    CustomBarChart(),
                    Gap(20),
                    //Learn more button
                    CustomButton(onPressed: () {}, text: 'Learn more'),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Expense Category Section
                    CustomHeaderSubHeader(
                      header: 'Expense Categories',
                      subHeader: "See where your money went",
                    ),
                    Gap(20),

                    //Expense Categories List
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: expenseCategories.length,
                      itemBuilder: (context, index) {
                        final category = expenseCategories[index];
                        return ExpenseCategoriesItem(category: category);
                      },
                    ),
                    Gap(20),
                    CustomButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExpenseCategoriesScreen(),
                          ),
                        );
                      },
                      text: 'See All',
                      color: AppColors.surfacePrimary,
                    ),
                    Gap(24),
                    //Cash Flow Section
                    CustomHeaderSubHeader(
                      header: 'Cash Flow',
                      subHeader: "See how your money moved",
                    ),
                    Gap(20),
                    //Cash Flow Graph
                    MoneyFlowChart(
                      flow: MoneyFlow(moneyIn: 453, moneyOut: 1285),
                      chartHeight: 160,
                    ),
                    Gap(24),
                    //Upcoming Bills Section
                    CustomHeaderSubHeader(
                      header: 'Upcoming Bills',
                      subHeader: '2 due',
                    ),
                    Gap(20),
                    Text('\$29.97', style: AppTextStyles.titleLarge),
                    //Upcoming Bills Item Builder
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: upcomingBills.length,
                      itemBuilder: (context, index) {
                        final upcomingBill = upcomingBills[index];
                        return UpcomingBillsItem(upcomingBill: upcomingBill);
                      },
                    ),

                    Gap(24),
                    //Recent Transactions Section
                    CustomHeaderSubHeader(
                      header: 'Recent Transactions',
                      subHeader: '23 total',
                    ),
                    //Recent Transactions List
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: recentTransactions.length,
                      itemBuilder: (context, index) {
                        final recentTransaction = recentTransactions[index];
                        return RecentTransactionItem(
                          recentTransaction: recentTransaction,
                        );
                      },
                    ),
                    Gap(24),
                    CustomButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RecentTransactionsScreen(),
                          ),
                        );
                      },
                      text: 'See all',
                      color: AppColors.surfacePrimary,
                    ),
                    //Articles Section
                    Gap(24),
                    CustomHeaderSubHeader(
                      header: 'Articles',
                      subHeader: 'Learn the fundamentals of budgeting',
                    ),
                    Gap(24),
                    //Articles Item Builder
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: articlesModel.length,
                      itemBuilder: (context, index) {
                        final articlesItem = articlesModel[index];
                        return ArticlesItem(articlesModel: articlesItem);
                      },
                    ),
                    Gap(20),
                    CustomButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ArticlesScreen(),
                          ),
                        );
                      },
                      text: 'See more',
                      color: AppColors.surfacePrimary,
                    ),
                  ],
                ),
              ),
            ),
            // SliverList(
            //   delegate: SliverChildBuilderDelegate((
            //     BuildContext context,
            //     int index,
            //   ) {
            //     return ListTile(title: Text('Item #$index'));
            //   }, childCount: 20),
            // ),
            //Divider(height: 1, thickness: 1)
          ],
        ),
      ),
    );
  }
}
