part of 'scanner_bloc.dart';

@freezed
class ScannerState with _$ScannerState {
  const factory ScannerState({
    String? qrCode,
    String? barcodeCode,
    String? processedQRCode,
    String? errorMessage,
    @Default(false) bool torchEnabled,
    @Default(false) bool hasScanned,
    @Default(false) bool isScanning,
    @Default(false) bool isLoading,
    @Default(false) bool isInitializing,
  }) = _ScannerState;
}
