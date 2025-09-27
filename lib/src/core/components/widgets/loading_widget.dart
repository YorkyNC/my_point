import 'dart:math';

import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {
  final double size;
  const LoadingWidget({super.key, this.size = 75});

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> with TickerProviderStateMixin {
  late AnimationController _rotationController; // For rotating the arcs
  late AnimationController _breathingController; // For breathing effect on inner circle and nodes
  late AnimationController
      _outerBreathingController; // For breathing effect on inner circle and nodes

  @override
  void initState() {
    super.initState();
    // Controller for rotating the arcs - continuous loop
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Adjust for rotation speed
    )..repeat();

    // Controller for breathing (inner circle and nodes) - oscillates
    _breathingController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true); // Oscillate for breathing effect
    _outerBreathingController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true); // Oscillate for breathing effect
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _breathingController.dispose();
    _outerBreathingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: widget.size,
        height: widget.size,
        child: AnimatedBuilder(
          animation: Listenable.merge([_rotationController, _breathingController]),
          builder: (context, child) {
            return InkWell(
              onTap: () {
                _rotationController.stop();
                _breathingController.stop();
              },
              child: CustomPaint(
                painter: LoadingPainter(
                  rotationValue: _rotationController.value,
                  breathingValue: _breathingController.value,
                  outerBreathingValue: _outerBreathingController.value,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class LoadingPainter extends CustomPainter {
  final double rotationValue; // For rotating the arcs
  final double? breathingValue; // For breathing effect on inner circle and nodes

  final double? outerBreathingValue; // For breathing effect on outer circle

  LoadingPainter({required this.rotationValue, this.breathingValue, this.outerBreathingValue});

  static const Color loadingColor = Color(0xFF2CB1B9); // Teal color from reference
  static const double arcAngle = pi * 5 / 6; // 160° (5/6 of π radians)

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final double baseRadius = size.width * 0.40; // Base radius for arcs
    final double strokeWidth = size.width * 0.05; // Thickness of the arc
    final double nodeRadius = size.width * 0.075; // Size of circular nodes at arc ends

    // Setup paints
    final Paint strokePaint = Paint()
      ..color = loadingColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.bevel;

    final Paint fillPaint = Paint()
      ..color = loadingColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // Draw the inner circle with breathing effect (now as a stroked circle)
    if (breathingValue != null) {
      final double innerCircleScale =
          0.2 + (0.2 * breathingValue!); // Scales between 0.2x and 0.4x of baseRadius
      final double innerCircleRadius = baseRadius * innerCircleScale;
      canvas.drawCircle(
          center, innerCircleRadius, strokePaint); // Changed to stroke instead of fill
    } else {
      canvas.drawCircle(center, baseRadius * 0.3, strokePaint); // Default radius, stroked
    }

    // Apply rotation to the arcs
    canvas.save();
    final double rotationAngle = 2 * pi * rotationValue; // Rotate based on rotationValue (0 to 2π)
    canvas.translate(center.dx, center.dy);
    canvas.rotate(rotationAngle); // Rotate the canvas
    canvas.translate(-center.dx, -center.dy);

    // First arc (originally at -110°, now rotated)
    const double firstArcBaseStart = -pi * 11 / 18; // -110° (-11/18 * π radians)
    _drawArcWithNode(
      canvas,
      center,
      baseRadius,
      strokeWidth,
      strokePaint,
      fillPaint,
      firstArcBaseStart,
      arcAngle,
      nodeRadius,
    );

    // Second arc (originally at 70°, now rotated)
    const double secondArcBaseStart = pi * 7 / 18; // 70° (7/18 * π radians)
    _drawArcWithNode(
      canvas,
      center,
      baseRadius,
      strokeWidth,
      strokePaint,
      fillPaint,
      secondArcBaseStart,
      arcAngle,
      nodeRadius,
    );

    canvas.restore();
  }

  void _drawArcWithNode(Canvas canvas, Offset center, double radius, double strokeWidth,
      Paint strokePaint, Paint fillPaint, double startAngle, double sweepAngle, double nodeRadius) {
    // Draw the arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle, // Starting angle (already rotated by the canvas)
      sweepAngle, // Sweep angle (160°)
      false, // Don't include center
      strokePaint..strokeWidth = strokeWidth * (outerBreathingValue!) + 1,
    );

    // Calculate the end angle of the arc to position the node
    final double endAngle = startAngle + sweepAngle;

    // Calculate direction vectors for the node position (at the end of the arc)
    final double dirX = cos(endAngle);
    final double dirY = sin(endAngle);

    // Node center position (positioned to touch the outer edge of the arc)
    final Offset nodeCenter = Offset(
      center.dx + radius * dirX,
      center.dy + radius * dirY,
    );

    // Draw the circular node at the end of the arc
    if (outerBreathingValue != null) {
      final double breathingScale =
          0.5 + (0.7 * outerBreathingValue!); // Scales between 0.9x and 1.0x
      canvas.drawCircle(
        nodeCenter,
        nodeRadius * breathingScale,
        fillPaint,
      );
      canvas.drawCircle(
        nodeCenter,
        nodeRadius * 0.8 * breathingScale,
        Paint()..color = Colors.white,
      );
    } else {
      canvas.drawCircle(nodeCenter, nodeRadius, fillPaint);
    }
  }

  @override
  bool shouldRepaint(covariant LoadingPainter oldDelegate) {
    return oldDelegate.rotationValue != rotationValue ||
        oldDelegate.breathingValue != breathingValue;
  }
}
