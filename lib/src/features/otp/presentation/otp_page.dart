// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:my_point/src/core/services/injectable/injectable_service.dart';

// import 'package:my_point/src/features/otp/presentation/components/custom_o_t_p_widget.dart';

// import '../../../app/imports.dart';
// import '../../../core/extensions/build_context_extension.dart';
// import '../../../core/router/router.dart';

// class OtpPage extends StatefulWidget {
//   const OtpPage({
//     super.key,
//     required this.phone,
//   });

//   final String phone;

//   @override
//   State<OtpPage> createState() => _OtpPageState();
// }

// class _OtpPageState extends State<OtpPage> with TickerProviderStateMixin {
//   String otpCode = '';
//   final List<TextEditingController> controllers = List.generate(
//     4,
//     (index) => TextEditingController(),
//   );
//   final List<FocusNode> focusNodes = List.generate(
//     4,
//     (index) => FocusNode(),
//   );

//   String? errorMessage;
//   late AnimationController _timerController;
//   int _remainingSeconds = 60;
//   bool _canRequestCode = false;

//   @override
//   void initState() {
//     super.initState();
//     _timerController = AnimationController(
//       duration: const Duration(seconds: 60),
//       vsync: this,
//     );
//     _startTimer();
//   }

//   @override
//   void dispose() {
//     _timerController.dispose();
//     for (var controller in controllers) {
//       controller.dispose();
//     }
//     for (var node in focusNodes) {
//       node.dispose();
//     }
//     super.dispose();
//   }

//   void _startTimer() {
//     _remainingSeconds = 60;
//     _canRequestCode = false;
//     _timerController.reset();
//     _timerController.forward();

//     _timerController.addListener(() {
//       setState(() {
//         _remainingSeconds = (60 * (1 - _timerController.value)).round();
//         if (_remainingSeconds <= 0) {
//           _canRequestCode = true;
//         }
//       });
//     });
//   }

//   void _requestNewCode() {
//     if (_canRequestCode) {
//       _startTimer();
//     }
//   }

//   void moveToPreviousField(int currentIndex) {
//     if (currentIndex > 0) {
//       FocusScope.of(context).requestFocus(focusNodes[currentIndex - 1]);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => getIt<AuthorizationBloc>(),
//       child: BlocListener<AuthorizationBloc, AuthorizationState>(
//         listener: (context, state) {
//           // Handle OTP verification success
//           // if (state.isOtpVerified) {
//           //   ScaffoldMessenger.of(context).showSnackBar(
//           //     SnackBar(
//           //       content: Text('OTP verified successfully'),
//           //       backgroundColor: Colors.green,
//           //     ),
//           //   );
//           //   // Navigate to next step or back
//           //   context.pop();
//           // }

//           // // Handle error messages
//           // if (state.errorMessage != null && state.errorMessage!.isNotEmpty) {
//           //   ScaffoldMessenger.of(context).showSnackBar(
//           //     SnackBar(
//           //       content: Text(state.errorMessage!),
//           //       backgroundColor: Colors.red,
//           //     ),
//           //   );
//           // }
//         },
//         child: BlocBuilder<AuthorizationBloc, AuthorizationState>(
//           builder: (context, state) {
//             return Scaffold(
//               appBar: AppBar(
//                 backgroundColor: context.colors.white,
//                 leading: IconButton(
//                   onPressed: () => context.pop(),
//                   icon: Icon(
//                     Icons.arrow_back_ios_new_rounded,
//                     color: context.colors.black,
//                   ),
//                 ),
//               ),
//               backgroundColor: context.colors.white,
//               body: SafeArea(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(
//                     vertical: 24,
//                     horizontal: 16,
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Проверка идентификации',
//                         style: context.typography.interTitlle20Semibold.copyWith(
//                           color: context.colors.black,
//                         ),
//                         textAlign: TextAlign.left,
//                       ),
//                       const SizedBox(height: 4),
//                       Text(
//                         'Введите 4-значный код, который мы выслали вам на ваш номер ${widget.phone}',
//                         style: context.typography.interText16.copyWith(
//                           color: context.colors.gray500,
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       Row(
//                         spacing: 16,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: List.generate(
//                           4,
//                           (index) => CustomOTPWidget(
//                             controller: controllers[index],
//                             focusNode: focusNodes[index],
//                             nextFocusNode: index < 3 ? focusNodes[index + 1] : null,
//                             currentIndex: index,
//                             onBackspace: moveToPreviousField,
//                             onChanged: (value) {
//                               setState(() {
//                                 otpCode = controllers.map((c) => c.text).join();
//                               });

//                               if (value.isNotEmpty && index < 3) {
//                                 FocusScope.of(context).requestFocus(focusNodes[index + 1]);
//                               }

//                               if (otpCode.length == 4) {
//                                 context.read<AuthorizationBloc>().add(VerifyOtp());
//                                 // Automatically navigate to next page when last digit is added
//                                 Future.delayed(Duration(milliseconds: 500), () {
//                                   context.push(RoutePaths.personalIdentification);
//                                 });
//                               }
//                             },
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       Row(
//                         children: [
//                           TextButton(
//                             style: TextButton.styleFrom(
//                               foregroundColor: context.colors.blue,
//                               textStyle: context.typography.interText16.copyWith(
//                                 color: context.colors.blue,
//                               ),
//                             ),
//                             onPressed: _canRequestCode ? _requestNewCode : null,
//                             child: _canRequestCode
//                                 ? Text(
//                                     'Получить код повторно',
//                                     style: context.typography.interText16.copyWith(
//                                       color: context.colors.blue,
//                                     ),
//                                   )
//                                 : RichText(
//                                     text: TextSpan(
//                                       style: context.typography.interText16,
//                                       children: [
//                                         TextSpan(
//                                           text: 'Запросить код через ',
//                                           style: TextStyle(
//                                             color: context.colors.gray500,
//                                           ),
//                                         ),
//                                         TextSpan(
//                                           text: '$_remainingSeconds секунд',
//                                           style: TextStyle(
//                                             color: context.colors.blue,
//                                             fontWeight: FontWeight.w600,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                           ),
//                         ],
//                       ),
//                       if (state.isVerifying)
//                         const Padding(
//                           padding: EdgeInsets.only(top: 16),
//                           child: Center(
//                             child: CircularProgressIndicator(),
//                           ),
//                         ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
