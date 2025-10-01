// import 'package:provider/provider.dart';

// import '../../../app/imports.dart';
// import '../enum/network_check_state_enum.dart';
// import '../network_status_notifier.dart';

// class NetworkStatusPopUp extends StatelessWidget {
//   const NetworkStatusPopUp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return PopScope(
//       child: GestureDetector(
//         onTap: () {},
//         child: Container(
//           color: Colors.black.withAlpha(50),
//           child: Center(
//             child: Container(
//               margin: const EdgeInsets.symmetric(horizontal: 16),
//               padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Icon(Icons.abc_outlined),
//                   SizedBox(height: 16),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Слабое интернет соединение',
//                       ),
//                       const SizedBox(height: 16),
//                       Text(
//                         'Проверьте подключение к интернету и повторите попытку',
//                       ),
//                       const SizedBox(height: 16),
//                       Consumer<NetworkStatusNotifier>(
//                         builder: (context, connectionStatus, _) {
//                           final networkStatus = Provider.of<NetworkStatusNotifier>(context, listen: false);
//                           final isChecking = networkStatus.checkState == NetworkCheckStateEnum.checking;

//                           return OutlinedButton(
//                             style: OutlinedButton.styleFrom(
//                               side: BorderSide(),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.all(
//                                   Radius.circular(8),
//                                 ),
//                               ),
//                             ),
//                             onPressed: isChecking
//                                 ? () {
//                                     if (networkStatus.hasConnection == true) {
//                                       context.pop();
//                                     }
//                                   }
//                                 : () {
//                                     networkStatus.checkConnectivity();
//                                   },
//                             child: Center(
//                               child: isChecking
//                                   ? SizedBox(
//                                       height: 20,
//                                       width: 20,
//                                       child: CircularProgressIndicator(
//                                         strokeWidth: 2,
//                                         valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
//                                       ),
//                                     )
//                                   : Text(
//                                       'Повторить',
//                                     ),
//                             ),
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
