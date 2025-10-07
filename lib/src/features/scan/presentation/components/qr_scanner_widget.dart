import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:my_point/src/features/scan/presentation/components/custom_scan_window_overlay.dart';
import 'package:my_point/src/features/scan/presentation/components/scanner_loading_state_widget.dart';
import 'package:my_point/src/features/scan/presentation/components/scanner_text_widget.dart';
import 'package:my_point/src/features/scan/presentation/components/torch_toggle_widget.dart';
import 'package:my_point/src/features/scan/presentation/page/bloc/bloc/q_r_bloc.dart';

class QRScannerWidget extends StatefulWidget {
  final VoidCallback? onClose;

  const QRScannerWidget({
    super.key,
    this.onClose,
  });

  @override
  State<QRScannerWidget> createState() => _QRScannerWidgetState();
}

class _QRScannerWidgetState extends State<QRScannerWidget> with AutomaticKeepAliveClientMixin {
  MobileScannerController? controller;
  bool _isActive = true;

  static const double _scanAreaWidthPercent = 0.7;
  static const double _borderRadius = 16.0;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _initController();
  }

  void _initController() {
    controller = MobileScannerController(
      autoStart: false,
      detectionSpeed: DetectionSpeed.normal,
      detectionTimeoutMs: 250,
      formats: [
        BarcodeFormat.qrCode,
      ],
      returnImage: false,
      torchEnabled: false,
      invertImage: false,
      autoZoom: false,
      facing: CameraFacing.back,
    );
    if (_isActive) {
      controller?.start();
    }
  }

  void startScanning() {
    if (!_isActive && mounted) {
      _isActive = true;
      controller?.start();
    }
  }

  void stopScanning() {
    if (_isActive) {
      _isActive = false;
      controller?.stop();
    }
  }

  @override
  Future<void> dispose() async {
    _isActive = false;
    await controller?.dispose();
    controller = null;
    super.dispose();
  }

  void _onDetect(BuildContext context, BarcodeCapture capture) {
    final qrBloc = context.read<QRBloc>();

    if (!qrBloc.state.hasScanned && capture.barcodes.isNotEmpty) {
      final barcode = capture.barcodes.first;
      final String? code = barcode.rawValue;
      log('📸 QR Scanner detected: format=${barcode.format}, code=$code');
      if (code != null) {
        qrBloc.add(QRCodeDetected(code));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final screenSize = MediaQuery.of(context).size;
    final scanAreaSize = screenSize.width * _scanAreaWidthPercent;

    final scanWindow = Rect.fromCenter(
      center: screenSize.center(Offset.zero),
      width: scanAreaSize,
      height: scanAreaSize,
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
                      useAppLifecycleState: true,
                      scanWindow: scanWindow,
                      tapToFocus: true,
                      controller: controller,
                      onDetect: (capture) => _onDetect(context, capture),
                      fit: BoxFit.cover,
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
                    ScannerTextWidget(
                        screenSize: screenSize,
                        scanAreaSize: scanAreaSize,
                        text: 'Скан QR-кода',
                        subtitle: 'Направьте камеру на QR-код'),
                    TorchToggleWidget(
                      screenSize: screenSize,
                      scanAreaHeight: scanAreaSize,
                      torchEnabled: state.torchEnabled,
                    ),
                    // Loading overlay
                    if (state.isLoading) ScannerLoadingStateWidget(text: 'Обработка QR-кода...'),
                  ],
                );
              },
            ),
    );
  }
}
