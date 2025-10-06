import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'q_r_bloc.freezed.dart';
part 'q_r_event.dart';
part 'q_r_state.dart';

@injectable
class QRBloc extends Bloc<QREvent, QRState> {
  QRBloc() : super(const QRState()) {
    on<ScanQRCode>(_onScanQRCode);
    on<QRCodeDetected>(_onQRCodeDetected);
    on<ToggleTorch>(_onToggleTorch);
    on<StopScanning>(_onStopScanning);
    on<ResetScanner>(_onResetScanner);
    on<BarcodeCodeDetected>(_onBarcodeCodeDetected);
  }

  void _onScanQRCode(ScanQRCode event, Emitter<QRState> emit) {
    emit(state.copyWith(
      qrCode: null,
      processedQRCode: null,
      errorMessage: null,
      hasScanned: false,
      isScanning: true,
    ));
  }

  void _onQRCodeDetected(QRCodeDetected event, Emitter<QRState> emit) async {
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

  void _onToggleTorch(ToggleTorch event, Emitter<QRState> emit) {
    emit(state.copyWith(
      torchEnabled: !state.torchEnabled,
    ));
  }

  void _onStopScanning(StopScanning event, Emitter<QRState> emit) {
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

  void _onResetScanner(ResetScanner event, Emitter<QRState> emit) {
    emit(QRState(
      torchEnabled: state.torchEnabled,
      isLoading: false,
    ));
  }

  void _onBarcodeCodeDetected(BarcodeCodeDetected event, Emitter<QRState> emit) async {
    emit(state.copyWith(
      barcodeCode: event.barcodeCode,
    ));
    emit(state.copyWith(
      isLoading: true,
      hasScanned: true,
    ));
    await Future.delayed(const Duration(milliseconds: 1500));
    emit(state.copyWith(
      isLoading: false,
    ));
  }
}
