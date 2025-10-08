part of 'scanner_bloc.dart';

sealed class ScannerEvent {}

final class ScannerPermissionChecked extends ScannerEvent {}

final class ScannerPermissionRequested extends ScannerEvent {}

final class ScannerStarted extends ScannerEvent {}

final class ScannerQRCodeDetected extends ScannerEvent {
  final String qrCode;

  ScannerQRCodeDetected(this.qrCode);
}

final class ScannerBarcodeDetected extends ScannerEvent {
  final String barcodeCode;

  ScannerBarcodeDetected(this.barcodeCode);
}

final class ScannerTorchToggled extends ScannerEvent {}

final class ScannerStopped extends ScannerEvent {}

final class ScannerReseted extends ScannerEvent {}

final class ScannerInitializingSetted extends ScannerEvent {
  final bool isInitializing;

  ScannerInitializingSetted(this.isInitializing);
}
