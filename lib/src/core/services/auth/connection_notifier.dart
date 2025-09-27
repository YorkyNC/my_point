// import 'dart:async';

// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import '../../extensions/build_context_extension.dart';
// import '../../theme/typography.dart';
// import 'package:provider/provider.dart';

// enum ConnectionCheckState { initial, checking, success, failure }

// class ConnectionStatusNotifier extends ChangeNotifier {
//   bool _hasConnection = true;
//   ConnectionCheckState _checkState = ConnectionCheckState.initial;
//   final Connectivity _connectivity = Connectivity();
//   StreamSubscription? _subscription;
//   Timer? _stateResetTimer;

//   bool get hasConnection => _hasConnection;
//   ConnectionCheckState get checkState => _checkState;

//   ConnectionStatusNotifier() {
//     _initConnectivity();
//     _subscription = _connectivity.onConnectivityChanged
//         .listen((List<ConnectivityResult> results) {
//       _updateConnectionStatus(results);
//     });
//   }

//   Future<void> checkConnectivity() async {
//     _checkState = ConnectionCheckState.checking;
//     notifyListeners();

//     try {
//       final results = await _connectivity.checkConnectivity();
//       final hasConnection =
//           results.any((result) => result != ConnectivityResult.none);

//       _checkState = hasConnection
//           ? ConnectionCheckState.success
//           : ConnectionCheckState.failure;
//       _hasConnection = hasConnection;
//       notifyListeners();

//       // Reset state after 2 seconds if still no connection
//       _stateResetTimer?.cancel();
//       _stateResetTimer = Timer(const Duration(seconds: 2), () {
//         if (!_hasConnection &&
//             (_checkState == ConnectionCheckState.success ||
//                 _checkState == ConnectionCheckState.failure)) {
//           _checkState = ConnectionCheckState.initial;
//           notifyListeners();
//         }
//       });
//     } on PlatformException catch (_) {
//       _hasConnection = false;
//       _checkState = ConnectionCheckState.failure;
//       notifyListeners();

//       _stateResetTimer?.cancel();
//       _stateResetTimer = Timer(const Duration(seconds: 2), () {
//         _checkState = ConnectionCheckState.initial;
//         notifyListeners();
//       });
//     }
//   }

//   Future<void> _initConnectivity() async {
//     try {
//       final results = await _connectivity.checkConnectivity();
//       _updateConnectionStatus(results);
//     } on PlatformException catch (_) {
//       _hasConnection = false;
//       notifyListeners();
//     }
//   }

//   void _updateConnectionStatus(List<ConnectivityResult> results) {
//     _hasConnection = results.any((result) => result != ConnectivityResult.none);
//     _checkState = ConnectionCheckState.initial;
//     notifyListeners();
//   }

//   @override
//   void dispose() {
//     _subscription?.cancel();
//     _stateResetTimer?.cancel();
//     super.dispose();
//   }
// }

// class ConnectionStatusModal extends StatelessWidget {
//   const ConnectionStatusModal({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return PopScope(
//       canPop: false,
//       child: GestureDetector(
//         onTap: () {},
//         child: Container(
//           color: Colors.black.withValues(alpha: 0.5),
//           child: Center(
//             child: Container(
//               margin: const EdgeInsets.symmetric(horizontal: 32),
//               padding: const EdgeInsets.all(24),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const SizedBox(height: 16),
//                   const Icon(
//                     Icons.wifi_off_rounded,
//                     size: 48,
//                     color: Colors.grey,
//                   ),
//                   const SizedBox(height: 16),
//                   Text(
//                     context.loc.networkIssues,
//                     style: const FigmaTextStyles()
//                         .typography4Medium
//                         .copyWith(color: context.colors.black),
//                   ),
//                   const SizedBox(height: 8),
//                   Consumer<ConnectionStatusNotifier>(
//                     builder: (context, connectionStatus, _) {
//                       final message = switch (connectionStatus.checkState) {
//                         ConnectionCheckState.checking =>
//                           context.loc.checkingConnection,
//                         ConnectionCheckState.success =>
//                           context.loc.connectionRestored,
//                         ConnectionCheckState.failure =>
//                           context.loc.noConnection,
//                         _ => context.loc.poorInternetConnection,
//                       };

//                       return Text(
//                         message,
//                         textAlign: TextAlign.center,
//                         style: const FigmaTextStyles()
//                             .typography2Regular
//                             .copyWith(color: context.colors.gray600),
//                       );
//                     },
//                   ),
//                   const SizedBox(height: 16),
//                   Consumer<ConnectionStatusNotifier>(
//                     builder: (context, connectionStatus, _) {
//                       final isChecking = connectionStatus.checkState ==
//                           ConnectionCheckState.checking;

//                       return InkWell(
//                         splashColor: Colors.transparent,
//                         highlightColor: Colors.transparent,
//                         onTap: isChecking
//                             ? null
//                             : () => connectionStatus.checkConnectivity(),
//                         child: Container(
//                           width: MediaQuery.of(context).size.width,
//                           decoration: BoxDecoration(
//                             color: context.colors.blue100,
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           child: Center(
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                 vertical: 8.0,
//                                 horizontal: 16,
//                               ),
//                               child: isChecking
//                                   ? SizedBox(
//                                       height: 20,
//                                       width: 20,
//                                       child: CircularProgressIndicator(
//                                         strokeWidth: 2,
//                                         valueColor:
//                                             AlwaysStoppedAnimation<Color>(
//                                           context.colors.blue500,
//                                         ),
//                                       ),
//                                     )
//                                   : Text(
//                                       context.loc.tryAgain,
//                                       style: const FigmaTextStyles()
//                                           .typography3Bold
//                                           .copyWith(
//                                             color: context.colors.blue500,
//                                           ),
//                                     ),
//                             ),
//                           ),
//                         ),
//                       );
//                     },
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

// class ConnectionAwareWidget extends StatelessWidget {
//   final Widget child;

//   const ConnectionAwareWidget({
//     super.key,
//     required this.child,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         child,
//         Consumer<ConnectionStatusNotifier>(
//           builder: (context, connectionStatus, _) {
//             if (!connectionStatus.hasConnection) {
//               return const ConnectionStatusModal();
//             }
//             return const SizedBox.shrink();
//           },
//         ),
//       ],
//     );
//   }
// }
