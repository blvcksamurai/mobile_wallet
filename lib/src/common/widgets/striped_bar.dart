import 'dart:math' as math;
import 'package:flutter/material.dart';

/// A rounded bar filled with 45° diagonal stripes ("/" direction).
///
/// Stripe metrics are in logical pixels, so the stripe size stays constant
/// and a wider bar simply shows more stripes.
class StripedBar extends StatelessWidget {
  const StripedBar({
    super.key,
    this.height = 189,
    this.borderRadius = 30,
    this.stripeColor = const Color(0xFFF5D0B5),
    this.stripeThickness = 10.6, // perpendicular thickness (15 px horizontal)
    this.stripePeriod = 35.4, // perpendicular period (50 px horizontal)
    this.phase = 24.5, // horizontal shift along the top edge
  });

  final double height;
  final double borderRadius;
  final Color stripeColor;
  final double stripeThickness;
  final double stripePeriod;
  final double phase;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: SizedBox(
        width: double.infinity,
        height: height,
        child: CustomPaint(
          painter: _StripePainter(
            borderRadius: borderRadius,
            color: stripeColor,
            thickness: stripeThickness,
            period: stripePeriod,
            phase: phase,
          ),
        ),
      ),
    );
  }
}

class _StripePainter extends CustomPainter {
  _StripePainter({
    required this.borderRadius,
    required this.color,
    required this.thickness,
    required this.period,
    required this.phase,
  });

  final double borderRadius;
  final Color color;
  final double thickness;
  final double period;
  final double phase;

  @override
  void paint(Canvas canvas, Size size) {
    if (size.isEmpty || period <= 0) return;

    // 1. Clip to the rounded rectangle.
    final rrect = RRect.fromRectAndRadius(
      Offset.zero & size,
      Radius.circular(borderRadius),
    );
    canvas.clipRRect(rrect, doAntiAlias: true);

    // 2. Horizontal distance between neighbouring stripes at 45°.
    final double hStep = period * math.sqrt2;
    final double h = size.height;
    final double overshoot = thickness; // hides butt-cap ends outside the clip

    // 3. Build one path containing every stripe centre line.
    //    x = where the centre line crosses the top edge (y = 0).
    //    Going down by h shifts the line left by h (45°).
    final path = Path();
    for (
      double x = (phase % hStep) - hStep;
      x <= size.width + h + hStep;
      x += hStep
    ) {
      path.moveTo(x + overshoot, -overshoot);
      path.lineTo(x - h - overshoot, h + overshoot);
    }

    // 4. Stroke once.
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = thickness
      ..strokeCap = StrokeCap.butt
      ..isAntiAlias = true
      ..color = color;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_StripePainter old) =>
      old.borderRadius != borderRadius ||
      old.color != color ||
      old.thickness != thickness ||
      old.period != period ||
      old.phase != phase;
}
