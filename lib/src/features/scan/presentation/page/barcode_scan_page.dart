// import 'package:my_point/src/app/imports.dart';
// import 'package:my_point/src/core/extensions/build_context_extension.dart';
// import 'package:my_point/src/core/services/injectable/injectable_service.dart';
// import 'package:my_point/src/features/login/presentation/components/custom_snack_bar.dart';

// import '../components/barcode_scanner_widget.dart';
// import 'bloc/bloc/q_r_bloc.dart';

// class BarcodeScanPage extends StatelessWidget {
//   const BarcodeScanPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => getIt<QRBloc>()..add(ScanQRCode()),
//       child: BlocListener<QRBloc, QRState>(
//         listener: (context, state) {
//           if (state.qrCode != null && state.processedQRCode == null && !state.isLoading) {
//             _showBarcodeResult(context, state.qrCode!);
//           }

//           if (state.processedQRCode != null) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               CustomSnackBar.show(
//                 color: context.colors.success500,
//                 title: state.processedQRCode!,
//                 seconds: 3,
//                 context: context,
//               ),
//             );
//             context.read<QRBloc>().add(ResetScanner());
//             context.read<QRBloc>().add(ScanQRCode());
//           }
//           if (state.errorMessage != null) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               CustomSnackBar.show(
//                 color: context.colors.error500,
//                 title: state.errorMessage!,
//                 seconds: 3,
//                 context: context,
//               ),
//             );
//           }
//         },
//         child: BarcodeScannerWidget(
//           onClose: () => context.pop(),
//         ),
//       ),
//     );
//   }

//   void _showBarcodeResult(BuildContext context, String barcode) {
//     showDialog(
//       context: context,
//       builder: (dialogContext) => AlertDialog(
//         title: const Text('Штрих-код обнаружен'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text('Содержание:'),
//             const SizedBox(height: 8),
//             Container(
//               padding: const EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 color: Colors.grey[200],
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Text(
//                 barcode,
//                 style: const TextStyle(fontFamily: 'monospace'),
//               ),
//             ),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               dialogContext.pop();
//               context.read<QRBloc>().add(ResetScanner());
//               context.read<QRBloc>().add(ScanQRCode());
//             },
//             child: const Text('Закрыть'),
//           ),
//           TextButton(
//             onPressed: () {
//               dialogContext.pop();
//               context.read<QRBloc>().add(StopScanning());
//             },
//             child: const Text('Действие'),
//           ),
//         ],
//       ),
//     );
//   }
// }
