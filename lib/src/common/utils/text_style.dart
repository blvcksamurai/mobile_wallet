//Style Class to access text styles easily
import 'package:flutter/material.dart';
import 'package:mobile_wallet/src/common/utils/text_theme.dart';

class AppTextStyles {
  static TextStyle get displayLarge => appTextTheme.displayLarge!;
  static TextStyle get displayMedium => appTextTheme.displayMedium!;
  static TextStyle get displaySmall => appTextTheme.displaySmall!;

  static TextStyle get headlineLarge => appTextTheme.headlineLarge!;
  static TextStyle get headlineMedium => appTextTheme.headlineMedium!;
  static TextStyle get headlineSmall => appTextTheme.headlineSmall!;

  static TextStyle get titleLarge => appTextTheme.titleLarge!;
  static TextStyle get titleMedium => appTextTheme.titleMedium!;
  static TextStyle get titleSmall => appTextTheme.titleSmall!;

  static TextStyle get bodyLarge => appTextTheme.bodyLarge!;
  static TextStyle get bodyMedium => appTextTheme.bodyMedium!;
  static TextStyle get bodySmall => appTextTheme.bodySmall!;

  static TextStyle get labelLarge => appTextTheme.labelLarge!;
  static TextStyle get labelMedium => appTextTheme.labelMedium!;
  static TextStyle get labelSmall => appTextTheme.labelSmall!;
}
