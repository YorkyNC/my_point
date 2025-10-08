part of 'scanner_bloc.dart';

sealed class ScannerEvent {}

final class ScannerPermissionChecked extends ScannerEvent {}

final class ScannerPermissionRequested extends ScannerEvent {}

final class ScannerStarted extends ScannerEvent {}

final class ScannerBarcodeDetected extends ScannerEvent {
  final BarcodeScanRequest barcodeScanRequest;

  ScannerBarcodeDetected(this.barcodeScanRequest);
}

final class ScannerQRCodeDetected extends ScannerEvent {
  final QrScanRequest qrCode;

  ScannerQRCodeDetected(this.qrCode);
}

final class ScannerTorchToggled extends ScannerEvent {}

final class ScannerStopped extends ScannerEvent {}

final class ScannerReseted extends ScannerEvent {}

final class ScannerInitializingSetted extends ScannerEvent {
  final bool isInitializing;

  ScannerInitializingSetted(this.isInitializing);
}
