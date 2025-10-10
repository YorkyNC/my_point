import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_point/src/features/scan/domain/entities/barcode_scan_entity.dart';
import 'package:my_point/src/features/scan/domain/entities/qr_scan_entity.dart';
import 'package:my_point/src/features/scan/domain/request/barcode_scan_request.dart';
import 'package:my_point/src/features/scan/domain/request/qr_scan_request.dart';
import 'package:my_point/src/features/scan/domain/usecases/barcode_scan_use_case.dart';
import 'package:my_point/src/features/scan/domain/usecases/qr_code_scan_use_case.dart';

part 'scanner_bloc.freezed.dart';
part 'scanner_event.dart';
part 'scanner_state.dart';

@injectable
class ScannerBloc extends Bloc<ScannerEvent, ScannerState> {
  ScannerBloc(this._barcodeScanUseCase, this._qrCodeScanUseCase) : super(const ScannerState()) {
    setUpHandlers();
  }

  final BarcodeScanUseCase _barcodeScanUseCase;
  final QrCodeScanUseCase _qrCodeScanUseCase;

  void setUpHandlers() {
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
      final result = await _qrCodeScanUseCase.execute(event.qrCode);
      result.fold(
        (error) {
          emit(state.copyWith(
            isSuccess: false,
            errorMessage: error.message,
            isLoading: false,
          ));
        },
        (response) {
          emit(state.copyWith(
            qrScanEntity: response,
            isSuccess: true,
            isLoading: false,
          ));
        },
      );
    }
  }

  void _onTorchToggled(ScannerTorchToggled event, Emitter<ScannerState> emit) {
    emit(state.copyWith(
      torchEnabled: !state.torchEnabled,
    ));
  }

  void _onScannerStopped(ScannerStopped event, Emitter<ScannerState> emit) {
    emit(state.copyWith(
      isScanning: false,
    ));
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
      final result = await _barcodeScanUseCase.execute(event.barcodeScanRequest);
      result.fold(
        (error) {
          emit(state.copyWith(
            isSuccess: false,
            errorMessage: error.message,
            isLoading: false,
          ));
        },
        (response) {
          emit(state.copyWith(
            barcodeScanEntity: response,
            isSuccess: true,
            isLoading: false,
          ));
        },
      );
    }
  }

  void _onInitializingSet(ScannerInitializingSetted event, Emitter<ScannerState> emit) {
    emit(state.copyWith(
      isInitializing: event.isInitializing,
    ));
  }
}
