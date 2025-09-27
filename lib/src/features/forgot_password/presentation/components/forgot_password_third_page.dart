// import 'package:flutter/material.dart';
// import '../../../../core/extensions/build_context_extension.dart';
// import '../../../../core/services/injectable/injectable_service.dart';
// import '../../../../core/services/storage/storage_service_impl.dart';
// import '../../../login/presentation/bloc/auth_bloc.dart';
// import '../../../login/presentation/components/password_text_form_field.dart';

// class ForgotPasswordThirdPage extends StatefulWidget {
//   const ForgotPasswordThirdPage({
//     super.key,
//     required this.callback,
//     required this.email,
//   });

//   final Function(String password, String confirmPassword) callback;
//   final String email;

//   @override
//   State<ForgotPasswordThirdPage> createState() => _ForgotPasswordThirdPageState();
// }

// class _ForgotPasswordThirdPageState extends State<ForgotPasswordThirdPage> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController = TextEditingController();
//   final PageController pageController = PageController();
//   AuthBloc authBloc = getIt<AuthBloc>();
//   StorageServiceImpl storageService = StorageServiceImpl();
//   bool isPasswordVisible = false;
//   bool isConfirmPasswordVisible = false;
//   bool hasMinLength = false;
//   bool hasUpperAndLowerCase = false;
//   bool hasDigit = false;
//   bool passwordsMatch = false;
//   bool isLoading = false;
//   @override
//   void dispose() {
//     passwordController.removeListener(_checkPasswordRequirements);
//     confirmPasswordController.removeListener(_checkPasswordsMatch);
//     passwordController.removeListener(_checkPasswordsMatch);
//     passwordController.dispose();
//     confirmPasswordController.dispose();
//     pageController.dispose();
//     super.dispose();
//   }

//   void _checkPasswordRequirements() {
//     setState(() {
//       hasMinLength = passwordController.text.length >= 8;
//       hasUpperAndLowerCase =
//           passwordController.text.contains(RegExp(r'[A-Z]')) && passwordController.text.contains(RegExp(r'[a-z]'));
//       hasDigit = passwordController.text.contains(RegExp(r'[0-9]'));
//     });
//   }

//   void _checkPasswordsMatch() {
//     setState(() {
//       passwordsMatch = passwordController.text == confirmPasswordController.text &&
//           passwordController.text.isNotEmpty &&
//           confirmPasswordController.text.isNotEmpty;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     passwordController.addListener(_checkPasswordRequirements);
//     confirmPasswordController.addListener(_checkPasswordsMatch);
//     passwordController.addListener(_checkPasswordsMatch);
//   }

//   bool get isFormValid {
//     return hasMinLength && hasUpperAndLowerCase && hasDigit && passwordsMatch && !isLoading;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       top: true,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 8),
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
//               decoration: BoxDecoration(
//                 color: context.colors.white,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       context.loc.updatePassword,
//                       style: context.typography.textxlBold.copyWith(
//                         color: context.colors.black,
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                     Text(
//                       'Установите новый пароль для ${widget.email}',
//                       style: context.typography.textmdRegular.copyWith(
//                         color: context.colors.gray500,
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Пароль',
//                           style: context.typography.textsmMedium.copyWith(color: context.colors.gray700),
//                         ),
//                         const SizedBox(height: 6),
//                         PasswordTextFormField(
//                           passwordController: passwordController,
//                           isPasswordVisible: isPasswordVisible,
//                           onPasswordVisibilityChanged: () => setState(() => isPasswordVisible = !isPasswordVisible),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 12),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Повторите пароль',
//                           style: context.typography.textsmMedium.copyWith(color: context.colors.gray700),
//                         ),
//                         const SizedBox(height: 6),
//                         PasswordTextFormField(
//                           passwordController: confirmPasswordController,
//                           isPasswordVisible: isConfirmPasswordVisible,
//                           onPasswordVisibilityChanged: () =>
//                               setState(() => isConfirmPasswordVisible = !isConfirmPasswordVisible),
//                           confirm: true,
//                         ),
//                         if (confirmPasswordController.text.isNotEmpty &&
//                             passwordController.text.isNotEmpty &&
//                             !passwordsMatch)
//                           Padding(
//                             padding: const EdgeInsets.only(top: 8),
//                             child: Text(
//                               'Пароли не совпадают',
//                               style: context.typography.textmdRegular.copyWith(
//                                 color: context.colors.error500,
//                               ),
//                             ),
//                           ),
//                       ],
//                     ),
//                     const SizedBox(height: 20),
//                     _buildPasswordRequirement(
//                         context, 'Не менее 8 символов', passwordController.text.isNotEmpty && hasMinLength),
//                     const SizedBox(height: 8),
//                     _buildPasswordRequirement(context, 'Заглавные и строчные буквы',
//                         passwordController.text.isNotEmpty && hasUpperAndLowerCase),
//                     const SizedBox(height: 8),
//                     _buildPasswordRequirement(
//                         context, 'Не менее одной цифры', passwordController.text.isNotEmpty && hasDigit),
//                     const SizedBox(height: 20),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: ElevatedButton(
//                               onPressed: () {
//                                 widget.callback(
//                                   passwordController.text,
//                                   confirmPasswordController.text,
//                                 );
//                               },
//                               style: ElevatedButton.styleFrom(
//                                 disabledBackgroundColor: context.colors.brand50,
//                                 disabledForegroundColor: context.colors.white,
//                               ),
//                               child: Text('Готово')),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildPasswordRequirement(BuildContext context, String text, bool isMet) {
//     return Row(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(4.75),
//           child: Container(
//             width: 14.5,
//             height: 14.5,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: isMet ? context.colors.success500 : context.colors.gray300,
//             ),
//             child: Icon(
//               Icons.check,
//               size: 14,
//               color: context.colors.white,
//             ),
//           ),
//         ),
//         const SizedBox(width: 8),
//         Text(
//           text,
//           style: context.typography.textsmRegular.copyWith(
//             color: isMet ? context.colors.success500 : context.colors.black,
//           ),
//         ),
//       ],
//     );
//   }
// }
