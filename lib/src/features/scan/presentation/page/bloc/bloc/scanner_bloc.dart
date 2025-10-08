import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'scanner_bloc.freezed.dart';
part 'scanner_event.dart';
part 'scanner_state.dart';

@injectable
class ScannerBloc extends Bloc<ScannerEvent, ScannerState> {
  ScannerBloc() : super(const ScannerState()) {
    on<ScannerStarted>(_onScannerStarted);
    on<ScannerQRCodeDetected>(_onQRCodeDetected);
    on<ScannerTorchToggled>(_onTorchToggled);
    on<ScannerStopped>(_onScannerStopped);
    on<ScannerReseted>(_onScannerReset);
    on<ScannerBarcodeDetected>(_onBarcodeDetected);
    on<ScannerInitializingSetted>(_onInitializingSet);
  }

  void _onScannerStarted(ScannerStarted event, Emitter<ScannerState> emit) {
    emit(state.copyWith(
      qrCode: null,
      barcodeCode: null,
      processedQRCode: null,
      errorMessage: null,
      hasScanned: false,
      isScanning: true,
    ));
  }

  void _onQRCodeDetected(ScannerQRCodeDetected event, Emitter<ScannerState> emit) async {
    if (!state.hasScanned) {
      emit(state.copyWith(
        isLoading: true,
        hasScanned: true,
      ));
      await Future.delayed(const Duration(milliseconds: 1500));

      emit(state.copyWith(
        qrCode: event.qrCode,
        isLoading: false,
      ));
    }
  }

  void _onTorchToggled(ScannerTorchToggled event, Emitter<ScannerState> emit) {
    emit(state.copyWith(
      torchEnabled: !state.torchEnabled,
    ));
  }

  void _onScannerStopped(ScannerStopped event, Emitter<ScannerState> emit) {
    if (state.qrCode != null) {
      final processedMessage = state.qrCode!.length > 50
          ? 'QR Code processed: ${state.qrCode!.substring(0, 50)}...'
          : 'QR Code processed: ${state.qrCode}';

      emit(state.copyWith(
        processedQRCode: processedMessage,
        isScanning: false,
      ));
    }
  }

  void _onScannerReset(ScannerReseted event, Emitter<ScannerState> emit) {
    emit(ScannerState(
      torchEnabled: state.torchEnabled,
      isLoading: false,
    ));
  }

  void _onBarcodeDetected(ScannerBarcodeDetected event, Emitter<ScannerState> emit) async {
    if (!state.hasScanned) {
      emit(state.copyWith(
        isLoading: true,
        hasScanned: true,
      ));
      await Future.delayed(const Duration(milliseconds: 1500));

      emit(state.copyWith(
        barcodeCode: event.barcodeCode,
        isLoading: false,
      ));
    }
  }

  void _onInitializingSet(ScannerInitializingSetted event, Emitter<ScannerState> emit) {
    emit(state.copyWith(
      isInitializing: event.isInitializing,
    ));
  }
}
