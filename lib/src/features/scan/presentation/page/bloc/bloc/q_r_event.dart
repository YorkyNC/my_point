part of 'q_r_bloc.dart';

sealed class QREvent {}

final class CheckPermission extends QREvent {}

final class RequestPermission extends QREvent {}

final class ScanQRCode extends QREvent {}

final class QRCodeDetected extends QREvent {
  final String qrCode;

  QRCodeDetected(this.qrCode);
}

final class BarcodeCodeDetected extends QREvent {
  final String barcodeCode;

  BarcodeCodeDetected(this.barcodeCode);
}

final class ToggleTorch extends QREvent {}

final class StopScanning extends QREvent {}

final class ResetScanner extends QREvent {}

final class SetInitializing extends QREvent {
  final bool isInitializing;

  SetInitializing(this.isInitializing);
}
