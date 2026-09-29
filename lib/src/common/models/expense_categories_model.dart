import 'package:flutter/material.dart';
import 'package:mobile_wallet/src/common/utils/colors.dart';

class ExpenseCategory {
  final String name;
  final String image;
  final double spent;
  final double total;
  final Color color;

  const ExpenseCategory({
    required this.name,
    required this.image,
    required this.spent,
    required this.total,
    required this.color,
  });
}

final expenseCategories = [
  ExpenseCategory(
    name: 'Food Stuffs',
    image: 'foodstuff.png',
    spent: 367,
    total: 700,
    color: AppColors.verdantPrimary,
  ),
  ExpenseCategory(
    name: 'Transportation',
    image: 'transportation.png',
    spent: 615,
    total: 1000,
    color: AppColors.fillEmberPrimary,
  ),
  ExpenseCategory(
    name: 'Shopping',
    image: 'shopping.png',
    spent: 200,
    total: 500,
    color: AppColors.fillSandstonePrimary,
  ),
  ExpenseCategory(
    name: 'Investments',
    image: 'stocks.png',
    spent: 100,
    total: 350,
    color: AppColors.fillRubyPrimary,
  ),
];
