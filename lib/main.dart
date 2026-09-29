import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_wallet/src/common/utils/colors.dart';
import 'package:mobile_wallet/src/common/utils/text_theme.dart';
import 'package:mobile_wallet/src/features/budget/budget_home/budget_home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Orientation lock
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // System Overlay Style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Wallet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.bgColor,
        // fontFamily: 'Inter',
        colorSchemeSeed: AppColors.verdantPrimary,
        textTheme: appTextTheme,
      ),
      home: BudgetHome(),
    );
  }
}
