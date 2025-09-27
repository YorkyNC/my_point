// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../core/extensions/build_context_extension.dart';
// import '../../../login/presentation/bloc/auth_bloc.dart';

// import '../../../../app/imports.dart';

// class ForgotPasswordSecondPage extends StatefulWidget {
//   const ForgotPasswordSecondPage({
//     super.key,
//     required this.email,
//     required this.pageController,
//     required this.callback,
//   });

//   final String email;
//   final PageController pageController;
//   final Function(String otpCode) callback;

//   @override
//   State<ForgotPasswordSecondPage> createState() => _ForgotPasswordSecondPageState();
// }

// class _ForgotPasswordSecondPageState extends State<ForgotPasswordSecondPage> {
//   String otpCode = '';
//   final List<TextEditingController> controllers = List.generate(
//     6,
//     (index) => TextEditingController(),
//   );
//   final List<FocusNode> focusNodes = List.generate(
//     6,
//     (index) => FocusNode(),
//   );

//   String? errorMessage;

//   @override
//   void dispose() {
//     for (var controller in controllers) {
//       controller.dispose();
//     }
//     for (var node in focusNodes) {
//       node.dispose();
//     }
//     super.dispose();
//   }

//   void _verifyOtp() {
//     if (otpCode.length == 6) {
//       widget.callback(otpCode);
//     }
//   }

//   // For moving to the previous field when backspace is pressed
//   void moveToPreviousField(int currentIndex) {
//     if (currentIndex > 0) {
//       FocusScope.of(context).requestFocus(focusNodes[currentIndex - 1]);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<AuthBloc, AuthState>(
//       listener: (context, state) {
//         state.maybeMap(
//           errorVerify: (errorState) {
//             setState(() {
//               errorMessage = errorState.error;
//               for (var controller in controllers) {
//                 controller.clear();
//               }
//               FocusScope.of(context).requestFocus(focusNodes[0]);
//               otpCode = '';
//             });
//           },
//           verified: (_) {
//             setState(() {
//               errorMessage = null;
//             });
//           },
//           orElse: () {},
//         );
//       },
//       child: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(
//             vertical: 8,
//           ),
//           child: Container(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 16,
//               vertical: 40,
//             ),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Введите код, отправленный на вашу почту ',
//                   style: context.typography.textxlBold.copyWith(
//                     color: context.colors.black,
//                   ),
//                   textAlign: TextAlign.left,
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   'Если письмо не пришло, проверьте папку «Спам»',
//                   style: context.typography.textmdRegular.copyWith(
//                     color: context.colors.gray500,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: List.generate(
//                     6,
//                     (index) => CustomOTPWidget(
//                       controller: controllers[index],
//                       focusNode: focusNodes[index],
//                       nextFocusNode: index < 5 ? focusNodes[index + 1] : null,
//                       currentIndex: index,
//                       onBackspace: moveToPreviousField,
//                       onChanged: (value) {
//                         // Update the OTP code when any digit changes
//                         setState(() {
//                           // Collect all digits from controllers
//                           otpCode = controllers.map((c) => c.text).join();
//                         });

//                         // If the current field has a value and there's a next field, focus it
//                         if (value.isNotEmpty && index < 5) {
//                           FocusScope.of(context).requestFocus(focusNodes[index + 1]);
//                         }

//                         // If all digits are filled, verify the OTP
//                         if (otpCode.length == 6) {
//                           _verifyOtp();
//                         }
//                       },
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: ElevatedButton(
//                         onPressed: () {
//                           // Request a new OTP - pass empty string to signal resend
//                           widget.callback("");
//                         },
//                         child: const Text(
//                           'Получить код повторно',
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CustomOTPWidget extends StatelessWidget {
//   const CustomOTPWidget({
//     super.key,
//     required this.onChanged,
//     required this.controller,
//     required this.focusNode,
//     required this.currentIndex,
//     required this.onBackspace,
//     this.nextFocusNode,
//   });

//   final Function(String value) onChanged;
//   final TextEditingController controller;
//   final FocusNode focusNode;
//   final FocusNode? nextFocusNode;
//   final int currentIndex;
//   final Function(int) onBackspace;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 48,
//       height: 52,
//       decoration: BoxDecoration(
//         shape: BoxShape.rectangle,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: KeyboardListener(
//         focusNode: FocusNode(),
//         onKeyEvent: (KeyEvent event) {
//           if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.backspace && controller.text.isEmpty) {
//             onBackspace(currentIndex);
//           }
//         },
//         child: TextField(
//           controller: controller,
//           focusNode: focusNode,
//           onChanged: (value) {
//             // Handle input changes
//             if (value.isNotEmpty) {
//               // Keep only the last character if someone enters multiple
//               if (value.length > 1) {
//                 controller.text = value.substring(value.length - 1);
//                 controller.selection = TextSelection.fromPosition(
//                   TextPosition(offset: controller.text.length),
//                 );
//               }
//             } else if (value.isEmpty && currentIndex > 0) {
//               // If the current field has been cleared with backspace, move to previous field
//               onBackspace(currentIndex);
//             }

//             onChanged(controller.text);
//           },
//           textAlign: TextAlign.center,
//           inputFormatters: [
//             LengthLimitingTextInputFormatter(1),
//             FilteringTextInputFormatter.digitsOnly,
//           ],
//           keyboardType: TextInputType.number,
//           style: context.typography.displaysmMedium.copyWith(
//             color: context.colors.black,
//           ),
//           cursorColor: context.colors.brand500,
//           decoration: InputDecoration(
//             contentPadding: const EdgeInsets.symmetric(
//               vertical: 7,
//               horizontal: 8,
//             ),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide(color: context.colors.gray300),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide(color: context.colors.gray300),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide(color: context.colors.brand300),
//             ),
//             errorBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide(color: context.colors.error300),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
