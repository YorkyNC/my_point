// import '../../../../main.dart';
// import '../../../app/imports.dart';
// import '../../../core/base/base_bloc/bloc/base_bloc_widget.dart';
// import '../../../core/extensions/build_context_extension.dart';
// import '../../../core/router/router.dart';
// import '../../../core/services/storage/storage_service_impl.dart';
// import 'bloc/auth_bloc.dart';
// import 'components/password_text_form_field.dart';
// import 'custom_snack_bar.dart';

// import '../../../core/services/injectable/injectable_service.dart';

// class SetNewPasswordView extends StatefulWidget {
//   const SetNewPasswordView({super.key, required this.email});

//   final String email;

//   @override
//   State<SetNewPasswordView> createState() => _SetNewPasswordViewState();
// }

// class _SetNewPasswordViewState extends State<SetNewPasswordView> {
//   bool isPasswordVisible = false;
//   bool isConfirmPasswordVisible = false;
//   bool hasMinLength = false;
//   bool hasUpperAndLowerCase = false;
//   bool hasDigit = false;
//   bool passwordsMatch = false;
//   bool isLoading = false;
//   bool _hasAttemptedSubmit = false;

//   AuthBloc authBloc = getIt<AuthBloc>();

//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController =
//       TextEditingController();
//   final PageController pageController = PageController();

//   StorageServiceImpl storageService = StorageServiceImpl();

//   @override
//   void initState() {
//     super.initState();
//     passwordController.addListener(_checkPasswordRequirements);
//     confirmPasswordController.addListener(_checkPasswordsMatch);
//     passwordController.addListener(_checkPasswordsMatch);
//   }

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
//           passwordController.text.contains(RegExp(r'[A-Z]')) &&
//               passwordController.text.contains(RegExp(r'[a-z]'));
//       hasDigit = passwordController.text.contains(RegExp(r'[0-9]'));
//     });
//   }

//   void _checkPasswordsMatch() {
//     setState(() {
//       passwordsMatch =
//           passwordController.text == confirmPasswordController.text &&
//               passwordController.text.isNotEmpty &&
//               confirmPasswordController.text.isNotEmpty;
//     });
//   }

//   bool get isFormValid {
//     return hasMinLength &&
//         hasUpperAndLowerCase &&
//         hasDigit &&
//         passwordsMatch &&
//         !isLoading;
//   }

//   bool _isButtonEnabled() {
//     if (_hasAttemptedSubmit &&
//         passwordController.text.isNotEmpty &&
//         confirmPasswordController.text.isNotEmpty &&
//         !passwordsMatch) {
//       return false;
//     }

//     return passwordController.text.isNotEmpty &&
//         confirmPasswordController.text.isNotEmpty &&
//         hasMinLength &&
//         hasUpperAndLowerCase &&
//         hasDigit &&
//         (passwordsMatch || !_hasAttemptedSubmit) &&
//         !isLoading;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BaseBlocWidget<AuthBloc, AuthEvent, AuthState>(
//       bloc: authBloc,
//       listener: (context, state) {
//         state.whenOrNull(
//           error: (_) {
//             setState(() {
//               isLoading = false;
//             });
//             ScaffoldMessenger.of(context).removeCurrentSnackBar();
//             ScaffoldMessenger.of(context).showSnackBar(
//               CustomSnackBar.show(
//                 title: context.loc.appIssuesContactUs,
//                 seconds: 3,
//                 context: context,
//                 color: context.colors.error500,
//               ),
//             );
//             context.pushReplacement(RoutePaths.login);
//           },
//           loaded: (viewModel) {
//             setState(() {
//               isLoading = false;
//             });
//             log.i('Password changed');
//             ScaffoldMessenger.of(context).removeCurrentSnackBar();
//             ScaffoldMessenger.of(context).showSnackBar(
//               CustomSnackBar.show(
//                 title: context.loc.passwordChangedSuccessfully,
//                 seconds: 3,
//                 context: context,
//                 color: context.colors.success500,
//               ),
//             );
//             context.pushReplacement(RoutePaths.review);
//           },
//         );
//       },
//       builder: (context, state, bloc) => Stack(
//         children: [
//           Scaffold(
//             backgroundColor: const Color(0xFFF1F5F9),
//             body: SafeArea(
//               top: true,
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 8),
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 16, vertical: 40),
//                         decoration: BoxDecoration(
//                           color: context.colors.white,
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: Form(
//                           key: _formKey,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Создать пароль',
//                                 style: context.typography.textxlBold.copyWith(
//                                   color: context.colors.black,
//                                 ),
//                               ),
//                               const SizedBox(height: 4),
//                               Text(
//                                 'Вы вошли с временным паролем. Придумайте и установите новый пароль',
//                                 style:
//                                     context.typography.textmdRegular.copyWith(
//                                   color: context.colors.gray500,
//                                 ),
//                               ),
//                               const SizedBox(height: 20),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     'Пароль',
//                                     style: context.typography.textsmMedium
//                                         .copyWith(
//                                             color: context.colors.gray700),
//                                   ),
//                                   const SizedBox(height: 6),
//                                   PasswordTextFormField(
//                                     passwordController: passwordController,
//                                     isPasswordVisible: isPasswordVisible,
//                                     onPasswordVisibilityChanged: () => setState(
//                                         () => isPasswordVisible =
//                                             !isPasswordVisible),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(height: 12),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     'Повторите пароль',
//                                     style: context.typography.textsmMedium
//                                         .copyWith(
//                                             color: context.colors.gray700),
//                                   ),
//                                   const SizedBox(height: 6),
//                                   PasswordTextFormField(
//                                     passwordController:
//                                         confirmPasswordController,
//                                     isPasswordVisible: isConfirmPasswordVisible,
//                                     onPasswordVisibilityChanged: () => setState(
//                                         () => isConfirmPasswordVisible =
//                                             !isConfirmPasswordVisible),
//                                     confirm: true,
//                                   ),
//                                   if (_hasAttemptedSubmit &&
//                                       confirmPasswordController
//                                           .text.isNotEmpty &&
//                                       passwordController.text.isNotEmpty &&
//                                       !passwordsMatch)
//                                     Padding(
//                                       padding: const EdgeInsets.only(top: 6),
//                                       child: Text(
//                                         'Пароли не совпадают',
//                                         style: context.typography.textmdRegular
//                                             .copyWith(
//                                           color: context.colors.error500,
//                                         ),
//                                       ),
//                                     ),
//                                 ],
//                               ),
//                               const SizedBox(height: 20),
//                               _buildPasswordRequirement(
//                                   context,
//                                   'Не менее 8 символов',
//                                   passwordController.text.isNotEmpty &&
//                                       hasMinLength),
//                               const SizedBox(height: 8),
//                               _buildPasswordRequirement(
//                                   context,
//                                   'Заглавные и строчные буквы',
//                                   passwordController.text.isNotEmpty &&
//                                       hasUpperAndLowerCase),
//                               const SizedBox(height: 8),
//                               _buildPasswordRequirement(
//                                   context,
//                                   'Не менее одной цифры',
//                                   passwordController.text.isNotEmpty &&
//                                       hasDigit),
//                               const SizedBox(height: 20),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: ElevatedButton(
//                                         // style: ElevatedButton.styleFrom(
//                                         //   backgroundColor:
//                                         //       _isButtonEnabled() ? context.colors.brand500 : context.colors.gray300,
//                                         //   foregroundColor:
//                                         //       _isButtonEnabled() ? context.colors.white : context.colors.gray500,
//                                         // ),
//                                         onPressed: _isButtonEnabled()
//                                             ? () {
//                                                 final doPasswordsMatch =
//                                                     passwordController.text ==
//                                                         confirmPasswordController
//                                                             .text;

//                                                 setState(() {
//                                                   _hasAttemptedSubmit = true;
//                                                   passwordsMatch =
//                                                       doPasswordsMatch;
//                                                 });

//                                                 if (doPasswordsMatch) {
//                                                   setState(() {
//                                                     isLoading = true;
//                                                   });
//                                                   Future.delayed(
//                                                       const Duration(
//                                                           seconds: 2), () {
//                                                     authBloc.add(AuthEvent
//                                                         .changeTemporaryPassword(
//                                                       password:
//                                                           passwordController
//                                                               .text,
//                                                       confirmPassword:
//                                                           confirmPasswordController
//                                                               .text,
//                                                     ));
//                                                   });
//                                                 }
//                                               }
//                                             : null,
//                                         child: Text('Готово')),
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           if (isLoading)
//             SafeArea(
//               child: Container(
//                 color: Colors.white,
//                 child: Center(
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: context.colors.white,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Center(
//                       child: SizedBox(
//                         width: 100,
//                         height: 100,
//                         child: CircularProgressIndicator(
//                           strokeWidth: 8,
//                           strokeCap: StrokeCap.round,
//                           color: context.colors.brand100,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }

//   Widget _buildPasswordRequirement(
//       BuildContext context, String text, bool isMet) {
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
