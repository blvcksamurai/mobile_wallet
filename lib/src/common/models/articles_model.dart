import 'package:flutter/material.dart';
import 'package:mobile_wallet/src/common/utils/colors.dart';

class ArticlesModel {
  final String category;
  final String title;
  final String timestamp;
  final String image;
  final Color color;

  ArticlesModel({
    required this.category,
    required this.title,
    required this.timestamp,
    required this.image,
    required this.color,
  });
}

final articlesModel = [
  ArticlesModel(
    category: 'Overspending',
    title: 'Guide to Start To Avoiding the Habit of Overspending',
    timestamp: '9 Feb, 2025',
    image: 'thumbnail.png',
    color: AppColors.verdantSecondary,
  ),
  ArticlesModel(
    category: 'Budgeting',
    title: 'How to Successfully Manage Your Set Financial Budget',
    timestamp: '18 Feb, 2025',
    image: 'thumbnail_2.png',
    color: AppColors.sandstoneSecondary,
  ),
];
