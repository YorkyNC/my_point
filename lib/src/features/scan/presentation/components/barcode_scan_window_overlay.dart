import 'package:flutter/material.dart';

class BarcodeScanWindowOverlay extends CustomPainter {
  final Rect scanWindow;
  final double borderRadius;

  BarcodeScanWindowOverlay({
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

    _drawBarcodeFrame(canvas, scanWindow, borderRadius, borderPaint);
  }

  void _drawBarcodeFrame(Canvas canvas, Rect rect, double radius, Paint paint) {
    const cornerLength = 40.0;

    canvas.drawLine(
      Offset(rect.left, rect.top + radius),
      Offset(rect.left, rect.top + radius + cornerLength),
      paint,
    );

    canvas.drawLine(
      Offset(rect.left + radius, rect.top),
      Offset(rect.left + radius + cornerLength, rect.top),
      paint,
    );

    // Top middle line
    canvas.drawLine(
      Offset(rect.center.dx - cornerLength / 1, rect.top),
      Offset(rect.center.dx + cornerLength / 1, rect.top),
      paint,
    );

    canvas.drawLine(
      Offset(rect.right, rect.top + radius),
      Offset(rect.right, rect.top + radius + cornerLength),
      paint,
    );

    canvas.drawLine(
      Offset(rect.right - radius, rect.top),
      Offset(rect.right - radius - cornerLength, rect.top),
      paint,
    );

    canvas.drawLine(
      Offset(rect.left, rect.bottom - radius),
      Offset(rect.left, rect.bottom - radius - cornerLength),
      paint,
    );

    canvas.drawLine(
      Offset(rect.left + radius, rect.bottom),
      Offset(rect.left + radius + cornerLength, rect.bottom),
      paint,
    );

    canvas.drawLine(
      Offset(rect.center.dx - cornerLength / 1, rect.bottom),
      Offset(rect.center.dx + cornerLength / 1, rect.bottom),
      paint,
    );

    canvas.drawLine(
      Offset(rect.right, rect.bottom - radius),
      Offset(rect.right, rect.bottom - radius - cornerLength),
      paint,
    );

    canvas.drawLine(
      Offset(rect.right - radius, rect.bottom),
      Offset(rect.right - radius - cornerLength, rect.bottom),
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
