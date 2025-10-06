import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';

class QRScannerWidget extends StatefulWidget {
  final Function(String) onQRCodeDetected;
  final VoidCallback? onClose;

  const QRScannerWidget({
    super.key,
    required this.onQRCodeDetected,
    this.onClose,
  });

  @override
  State<QRScannerWidget> createState() => _QRScannerWidgetState();
}

class _QRScannerWidgetState extends State<QRScannerWidget> {
  MobileScannerController? controller;

  bool useScanWindow = false;

  bool autoZoom = false;
  bool invertImage = false;
  bool returnImage = false;
  bool tapToFocus = true;

  DetectionSpeed detectionSpeed = DetectionSpeed.normal;
  int detectionTimeoutMs = 250;

  bool useBarcodeOverlay = false;
  BoxFit boxFit = BoxFit.cover;
  bool enableLifecycle = false;

  bool hideMobileScannerWidget = false;

  List<BarcodeFormat> selectedFormats = [];

  bool _hasScanned = false;

  static const double _scanAreaWidthPercent = 0.7;
  static const double _borderRadius = 16.0;

  MobileScannerController initController() => MobileScannerController(
        autoStart: true,
        detectionSpeed: detectionSpeed,
        detectionTimeoutMs: detectionTimeoutMs,
        formats: selectedFormats,
        returnImage: returnImage,
        torchEnabled: false,
        invertImage: invertImage,
        autoZoom: autoZoom,
        facing: CameraFacing.back,
      );

  @override
  void initState() {
    super.initState();
    controller = initController();
  }

  @override
  Future<void> dispose() async {
    super.dispose();
    await controller?.dispose();
    controller = null;
  }

  void _onDetect(BarcodeCapture capture) {
    if (!_hasScanned && capture.barcodes.isNotEmpty) {
      final String? code = capture.barcodes.first.rawValue;
      if (code != null) {
        setState(() {
          _hasScanned = true;
        });
        widget.onQRCodeDetected(code);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final scanAreaSize = screenSize.width * _scanAreaWidthPercent;

    final scanWindow = Rect.fromCenter(
      center: screenSize.center(Offset.zero),
      width: scanAreaSize,
      height: scanAreaSize,
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: controller == null || hideMobileScannerWidget
          ? const Placeholder()
          : Stack(
              children: [
                MobileScanner(
                  scanWindow: scanWindow,
                  tapToFocus: true,
                  controller: controller,
                  onDetect: _onDetect,
                  fit: boxFit,
                ),
                IgnorePointer(
                  child: CustomPaint(
                    painter: CustomScanWindowOverlay(
                      scanWindow: scanWindow,
                      borderRadius: _borderRadius,
                    ),
                    child: Container(),
                  ),
                ),
                Positioned(
                  bottom: screenSize.height / 2 + scanAreaSize / 2 + 40,
                  left: 0,
                  right: 0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Скан QR-кода',
                        style: context.typography.title.copyWith(
                          color: context.colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Направьте камеру на QR-код',
                        style: context.typography.smallParagraph.copyWith(
                          color: context.colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: screenSize.height / 2 + scanAreaSize / 2 + 40,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.black54,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.flash_on, color: Colors.white, size: 28),
                          onPressed: () => controller?.toggleTorch(),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.black54,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.cameraswitch, color: Colors.white, size: 28),
                          onPressed: () => controller?.switchCamera(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

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
