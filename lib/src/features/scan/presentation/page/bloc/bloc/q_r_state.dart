part of 'q_r_bloc.dart';

@freezed
class QRState with _$QRState {
  const factory QRState({
    String? qrCode,
    String? barcodeCode,
    String? processedQRCode,
    String? errorMessage,
    @Default(false) bool torchEnabled,
    @Default(false) bool hasScanned,
    @Default(false) bool isScanning,
    @Default(false) bool isLoading,
  }) = _QRState;
}
