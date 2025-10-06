import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:my_point/src/features/scan/presentation/components/barcode_scan_window_overlay.dart';
import 'package:my_point/src/features/scan/presentation/components/scanner_loading_state_widget.dart';
import 'package:my_point/src/features/scan/presentation/components/scanner_text_widget.dart';
import 'package:my_point/src/features/scan/presentation/components/torch_toggle_widget.dart';
import 'package:my_point/src/features/scan/presentation/page/bloc/bloc/q_r_bloc.dart';

class BarcodeScannerWidget extends StatefulWidget {
  final VoidCallback? onClose;

  const BarcodeScannerWidget({
    super.key,
    this.onClose,
  });

  @override
  State<BarcodeScannerWidget> createState() => _BarcodeScannerWidgetState();
}

class _BarcodeScannerWidgetState extends State<BarcodeScannerWidget> {
  MobileScannerController? controller;

  static const double _scanAreaWidthPercent = 0.85;
  static const double _scanAreaHeightRatio = 0.5;
  static const double _borderRadius = 16.0;

  @override
  void initState() {
    super.initState();
    controller = MobileScannerController(
      autoStart: true,
      detectionSpeed: DetectionSpeed.normal,
      detectionTimeoutMs: 250,
      formats: [
        BarcodeFormat.ean13,
        BarcodeFormat.ean8,
        BarcodeFormat.code128,
        BarcodeFormat.code39,
        BarcodeFormat.code93,
        BarcodeFormat.upcA,
        BarcodeFormat.upcE,
        BarcodeFormat.codabar,
        BarcodeFormat.itf,
      ],
      returnImage: false,
      torchEnabled: false,
      invertImage: false,
      autoZoom: false,
      facing: CameraFacing.back,
    );
  }

  @override
  Future<void> dispose() async {
    super.dispose();
    await controller?.dispose();
    controller = null;
  }

  void _onDetect(BuildContext context, BarcodeCapture capture) {
    final qrBloc = context.read<QRBloc>();

    if (!qrBloc.state.hasScanned && capture.barcodes.isNotEmpty) {
      final String? code = capture.barcodes.first.rawValue;
      if (code != null) {
        qrBloc.add(BarcodeCodeDetected(code));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final scanAreaWidth = screenSize.width * _scanAreaWidthPercent;
    final scanAreaHeight = scanAreaWidth * _scanAreaHeightRatio;

    final scanWindow = Rect.fromCenter(
      center: screenSize.center(Offset.zero),
      width: scanAreaWidth,
      height: scanAreaHeight,
    );

    return BlocListener<QRBloc, QRState>(
      listenWhen: (previous, current) => previous.torchEnabled != current.torchEnabled,
      listener: (context, state) {
        controller?.toggleTorch();
      },
      child: controller == null
          ? const Center(child: CircularProgressIndicator())
          : BlocBuilder<QRBloc, QRState>(
              builder: (context, state) {
                return Stack(
                  children: [
                    MobileScanner(
                      scanWindow: scanWindow,
                      tapToFocus: true,
                      controller: controller,
                      onDetect: (capture) => _onDetect(context, capture),
                      fit: BoxFit.cover,
                    ),
                    IgnorePointer(
                      child: CustomPaint(
                        painter: BarcodeScanWindowOverlay(
                          scanWindow: scanWindow,
                          borderRadius: _borderRadius,
                        ),
                        child: Container(),
                      ),
                    ),
                    ScannerTextWidget(
                        screenSize: screenSize,
                        scanAreaSize: scanAreaHeight,
                        text: 'Скан штрих-кода',
                        subtitle: 'Направьте камеру на штрих-код'),
                    TorchToggleWidget(
                      screenSize: screenSize,
                      scanAreaHeight: scanAreaHeight,
                      torchEnabled: state.torchEnabled,
                    ),
                    if (state.isLoading) ScannerLoadingStateWidget(text: 'Обработка штрих-кода...'),
                  ],
                );
              },
            ),
    );
  }
}
