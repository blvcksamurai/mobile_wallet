import 'dart:math' as math;

class MoneyFlow {
  const MoneyFlow({required this.moneyIn, required this.moneyOut});

  final double moneyIn;
  final double moneyOut;

  /// Positive = saved, negative = overspent.
  double get difference => moneyIn - moneyOut;

  double get maxValue => math.max(moneyIn, moneyOut);
}

/// 1285.4 -> "1,285"
String _group(int whole) => whole.toString().replaceAllMapped(
  RegExp(r'\B(?=(\d{3})+(?!\d))'),
  (_) => ',',
);

/// 1285.4 -> "$1,285"
String formatMoney(double value) => '\$${_group(value.round().abs())}';

/// Nearest whole number, "-" when negative, nothing extra when positive.
/// -832.4 -> "-$832", 120.6 -> "$121"
String formatDifference(double value) {
  final rounded = value.round();
  return '${rounded < 0 ? '-' : ''}\$${_group(rounded.abs())}';
}
