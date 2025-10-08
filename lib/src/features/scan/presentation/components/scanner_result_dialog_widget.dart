import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_point/src/features/scan/presentation/page/bloc/bloc/scanner_bloc.dart';

class ScannerResultDialogWidget extends StatelessWidget {
  final String code;
  final bool isQRCode;

  const ScannerResultDialogWidget({
    super.key,
    required this.code,
    required this.isQRCode,
  });

  static Future<void> show(
    BuildContext context, {
    required String code,
    required bool isQRCode,
  }) {
    return showDialog(
      context: context,
      builder: (dialogContext) => ScannerResultDialogWidget(
        code: code,
        isQRCode: isQRCode,
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
          },
          child: const Text('Закрыть'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            // Process the code (implement your logic here)
            context.read<ScannerBloc>().add(ScannerStopped());
          },
          child: const Text('Действие'),
        ),
      ],
    );
  }
}
