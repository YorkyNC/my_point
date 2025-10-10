import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/services/storage/storage_service_impl.dart';
import 'package:my_point/src/features/scan/domain/request/barcode_scan_request.dart';
import 'package:my_point/src/features/scan/domain/request/qr_scan_request.dart';
import 'package:my_point/src/features/scan/presentation/page/bloc/bloc/scanner_bloc.dart';

class ScannerResultDialogWidget extends StatelessWidget {
  final String code;
  final String? encodedData;
  final bool isQRCode;
  final ScannerBloc scannerBloc;

  const ScannerResultDialogWidget({
    super.key,
    required this.code,
    this.encodedData,
    required this.isQRCode,
    required this.scannerBloc,
  });

  static Future<void> show(
    BuildContext context, {
    required String code,
    String? encodedData,
    required bool isQRCode,
    required ScannerBloc scannerBloc,
  }) {
    return showDialog(
      context: context,
      builder: (dialogContext) => ScannerResultDialogWidget(
        code: code,
        encodedData: encodedData,
        isQRCode: isQRCode,
        scannerBloc: scannerBloc,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(isQRCode ? 'QR-код обнаружен' : 'Штрих-код обнаружен'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Тип: ${isQRCode ? "QR-код" : "Штрих-код"}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          const Text('Содержание:'),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: SelectableText(
              code,
              style: const TextStyle(fontFamily: 'monospace'),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            scannerBloc.add(ScannerStarted());
          },
          child: const Text('Закрыть'),
        ),
        TextButton(
          onPressed: () {
            context.pop();
            if (isQRCode) {
              final dataToSend = encodedData ?? code;
              scannerBloc.add(ScannerQRCodeDetected(
                QrScanRequest(
                  encodedData: dataToSend,
                  currentPvzId: StorageServiceImpl().getPvzId() ?? '1',
                ),
              ));
            } else {
              scannerBloc.add(ScannerBarcodeDetected(
                BarcodeScanRequest(
                  barcode: code,
                  pvzId: StorageServiceImpl().getPvzId() ?? '1',
                ),
              ));
            }
          },
          child: const Text('Отправить запрос'),
        ),
      ],
    );
  }
}
