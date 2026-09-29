import 'package:flutter/material.dart';
import 'package:mobile_wallet/src/common/utils/colors.dart';
import 'package:remixicon/remixicon.dart';

class CustomAppBar extends StatelessWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.bgColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      pinned: true,
      floating: true,
      snap: true,
      title: Text(title, style: Theme.of(context).textTheme.headlineMedium),
      leading: IconButton(
        icon: const Icon(
          size: 21,
          RemixIcons.user_line,
          color: AppColors.textSecondary,
        ),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: const Icon(
            size: 21,
            RemixIcons.notification_line,
            color: AppColors.textSecondary,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
