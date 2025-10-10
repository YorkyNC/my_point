import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:my_point/src/features/scan/presentation/components/barcode_scan_window_overlay.dart';
import 'package:my_point/src/features/scan/presentation/components/scanner_loading_state_widget.dart';
import 'package:my_point/src/features/scan/presentation/components/scanner_result_dialog_widget.dart';
import 'package:my_point/src/features/scan/presentation/components/scanner_text_widget.dart';
import 'package:my_point/src/features/scan/presentation/components/torch_toggle_widget.dart';
import 'package:my_point/src/features/scan/presentation/page/bloc/bloc/scanner_bloc.dart';

class BarcodeScannerWidget extends StatefulWidget {
  final VoidCallback? onClose;

  const BarcodeScannerWidget({
    super.key,
    this.onClose,
  });

  @override
  State<BarcodeScannerWidget> createState() => BarcodeScannerWidgetState();
}

class BarcodeScannerWidgetState extends State<BarcodeScannerWidget> with AutomaticKeepAliveClientMixin {
  MobileScannerController? controller;
  bool _isActive = true;

  static const double _scanAreaWidthPercent = 0.85;
  static const double _scanAreaHeightRatio = 0.5;
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
    final qrBloc = context.read<ScannerBloc>();

    if (qrBloc.state.isScanning && !qrBloc.state.hasScanned && capture.barcodes.isNotEmpty) {
      final barcode = capture.barcodes.first;
      final String? code = barcode.rawValue;
      if (code != null) {
        qrBloc.add(ScannerStopped());

        ScannerResultDialogWidget.show(
          context,
          code: code,
          isQRCode: false,
          scannerBloc: qrBloc,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final screenSize = MediaQuery.of(context).size;
    final scanAreaWidth = screenSize.width * _scanAreaWidthPercent;
    final scanAreaHeight = scanAreaWidth * _scanAreaHeightRatio;

    final scanWindow = Rect.fromCenter(
      center: screenSize.center(Offset.zero),
      width: scanAreaWidth,
      height: scanAreaHeight,
    );

    return BlocListener<ScannerBloc, ScannerState>(
      listenWhen: (previous, current) => previous.torchEnabled != current.torchEnabled,
      listener: (context, state) {
        controller?.toggleTorch();
      },
      child: controller == null
          ? const Center(child: CircularProgressIndicator())
          : BlocBuilder<ScannerBloc, ScannerState>(
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
                      overlayBuilder: (context, constraints) => CustomPaint(
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
                      isBarcode: true,
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
