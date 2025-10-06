import 'package:flutter/material.dart';

class CustomScanWindowOverlay extends CustomPainter {
  final Rect scanWindow;
  final double borderRadius;

  CustomScanWindowOverlay({
    required this.scanWindow,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final overlayPaint = Paint()
      ..color = Colors.black.withValues(alpha: 0.3)
      ..style = PaintingStyle.fill;

    final outerPath = Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height));
    final innerPath = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          scanWindow,
          Radius.circular(borderRadius),
        ),
      );

    final overlayPath = Path.combine(PathOperation.difference, outerPath, innerPath);
    canvas.drawPath(overlayPath, overlayPaint);

    final borderPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    _drawDottedRRect(canvas, scanWindow, borderRadius, borderPaint);
  }

  void _drawDottedRRect(Canvas canvas, Rect rect, double radius, Paint paint) {
    const dashLength = 40.0;

    canvas.drawLine(
      Offset(rect.left + radius, rect.top),
      Offset(rect.left + radius + dashLength, rect.top),
      paint,
    );
    canvas.drawLine(
      Offset(rect.center.dx - dashLength / 2, rect.top),
      Offset(rect.center.dx + dashLength / 2, rect.top),
      paint,
    );
    canvas.drawLine(
      Offset(rect.right - radius - dashLength, rect.top),
      Offset(rect.right - radius, rect.top),
      paint,
    );

    canvas.drawLine(
      Offset(rect.right, rect.top + radius),
      Offset(rect.right, rect.top + radius + dashLength),
      paint,
    );
    canvas.drawLine(
      Offset(rect.right, rect.center.dy - dashLength / 2),
      Offset(rect.right, rect.center.dy + dashLength / 2),
      paint,
    );
    canvas.drawLine(
      Offset(rect.right, rect.bottom - radius - dashLength),
      Offset(rect.right, rect.bottom - radius),
      paint,
    );

    canvas.drawLine(
      Offset(rect.left + radius, rect.bottom),
      Offset(rect.left + radius + dashLength, rect.bottom),
      paint,
    );
    canvas.drawLine(
      Offset(rect.center.dx - dashLength / 2, rect.bottom),
      Offset(rect.center.dx + dashLength / 2, rect.bottom),
      paint,
    );
    canvas.drawLine(
      Offset(rect.right - radius - dashLength, rect.bottom),
      Offset(rect.right - radius, rect.bottom),
      paint,
    );

    canvas.drawLine(
      Offset(rect.left, rect.top + radius),
      Offset(rect.left, rect.top + radius + dashLength),
      paint,
    );
    canvas.drawLine(
      Offset(rect.left, rect.center.dy - dashLength / 2),
      Offset(rect.left, rect.center.dy + dashLength / 2),
      paint,
    );
    canvas.drawLine(
      Offset(rect.left, rect.bottom - radius - dashLength),
      Offset(rect.left, rect.bottom - radius),
      paint,
    );

    final arcPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromLTWH(rect.left, rect.top, radius * 2, radius * 2),
      3.14159,
      1.5708,
      false,
      arcPaint,
    );

    canvas.drawArc(
      Rect.fromLTWH(rect.right - radius * 2, rect.top, radius * 2, radius * 2),
      -1.5708,
      1.5708,
      false,
      arcPaint,
    );

    canvas.drawArc(
      Rect.fromLTWH(rect.right - radius * 2, rect.bottom - radius * 2, radius * 2, radius * 2),
      0,
      1.5708,
      false,
      arcPaint,
    );

    canvas.drawArc(
      Rect.fromLTWH(rect.left, rect.bottom - radius * 2, radius * 2, radius * 2),
      1.5708,
      1.5708,
      false,
      arcPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
