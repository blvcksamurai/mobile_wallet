import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_wallet/src/common/models/articles_model.dart';
import 'package:mobile_wallet/src/common/utils/app_assets.dart';
import 'package:mobile_wallet/src/common/utils/colors.dart';
import 'package:mobile_wallet/src/common/utils/text_style.dart';

class ArticlesItem extends StatelessWidget {
  final ArticlesModel articlesModel;
  const ArticlesItem({super.key, required this.articlesModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: Image.asset(AppAssets.image(articlesModel.image)),
          ),
          Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  articlesModel.category,
                  style: AppTextStyles.labelMedium.copyWith(
                    color: articlesModel.color,
                  ),
                ),
                Gap(8),
                SizedBox(
                  width: 250,
                  child: Text(
                    articlesModel.title,
                    style: AppTextStyles.titleSmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Gap(8),
                Text(
                  articlesModel.timestamp,
                  style: AppTextStyles.labelMedium.copyWith(
                    color: AppColors.textTertiary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
