// import '../../../../main.dart';
// import '../../../app/imports.dart';
// import '../../../core/base/base_bloc/bloc/base_bloc_widget.dart';
// import '../../../core/extensions/build_context_extension.dart';
// import '../../../core/services/injectable/injectable_service.dart';
// import 'forgot_password_app_bar.dart';
// import '../../login/presentation/bloc/auth_bloc.dart';
// import '../../login/presentation/custom_snack_bar.dart';

// import '../../../core/router/router.dart';
// import 'components/forgot_password_first_page.dart';
// import 'components/forgot_password_second_page.dart';
// import 'components/forgot_password_third_page.dart';

// class ForgotPasswordPage extends StatefulWidget {
//   const ForgotPasswordPage({super.key});

//   @override
//   State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
// }

// class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   final TextEditingController emailController = TextEditingController();
//   final authBloc = getIt<AuthBloc>();
//   final PageController pageController = PageController();

//   String email = '';
//   int? passwordResetId;

//   @override
//   void dispose() {
//     emailController.dispose();
//     pageController.dispose();
//     super.dispose();
//   }

//   void _handleOtpVerification(String otpCode) {
//     if (passwordResetId == null) {
//       ScaffoldMessenger.of(context).hideCurrentSnackBar();
//       ScaffoldMessenger.of(context).showSnackBar(
//         CustomSnackBar.show(
//           title:
//               context.loc.sessionExpiredPleaseRestartThePasswordRecoveryProcess,
//           context: context,
//           color: context.colors.error500,
//           seconds: 3,
//         ),
//       );
//       return;
//     }

//     log.d('Sending OTP verification with passwordResetId: $passwordResetId');

//     ScaffoldMessenger.of(context).hideCurrentSnackBar();
//     ScaffoldMessenger.of(context).showSnackBar(
//       CustomSnackBar.show(
//           color: context.colors.gray500,
//           title: context.loc.pleaseWait,
//           seconds: 30,
//           context: context),
//     );

//     authBloc
//         .add(AuthEvent.setPasswordResetId(passwordResetId: passwordResetId!));
//     authBloc.add(
//       AuthEvent.verify(code: otpCode),
//     );
//   }

//   void _resendOtpCode() {
//     ScaffoldMessenger.of(context).hideCurrentSnackBar();
//     ScaffoldMessenger.of(context).showSnackBar(
//       CustomSnackBar.show(
//           color: context.colors.gray500,
//           title: context.loc.pleaseWait,
//           seconds: 30,
//           context: context),
//     );

//     authBloc.add(
//       AuthEvent.forgotPassword(
//         email: email,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BaseBlocWidget<AuthBloc, AuthEvent, AuthState>(
//       bloc: authBloc,
//       listenWhen: (previous, current) => true,
//       listener: (context, state) {
//         state.maybeMap(
//           loading: (_) {
//             ScaffoldMessenger.of(context).hideCurrentSnackBar();
//             ScaffoldMessenger.of(context).showSnackBar(
//               CustomSnackBar.show(
//                   color: context.colors.gray500,
//                   title: context.loc.pleaseWait,
//                   seconds: 30,
//                   context: context),
//             );
//           },
//           loaded: (loadedState) {
//             ScaffoldMessenger.of(context).hideCurrentSnackBar();

//             if (loadedState.viewModel.passwordResetId != null) {
//               passwordResetId = loadedState.viewModel.passwordResetId;
//               log.d('Received passwordResetId: $passwordResetId');
//             }

//             if (pageController.page == 0) {
//               WidgetsBinding.instance.addPostFrameCallback((_) {
//                 pageController.animateToPage(
//                   1,
//                   duration: const Duration(milliseconds: 300),
//                   curve: Curves.easeInOut,
//                 );
//               });
//             }
//           },
//           verified: (_) {
//             ScaffoldMessenger.of(context).hideCurrentSnackBar();

//             if (pageController.page! < 2) {
//               WidgetsBinding.instance.addPostFrameCallback((_) {
//                 pageController.animateToPage(
//                   2,
//                   duration: const Duration(milliseconds: 300),
//                   curve: Curves.easeInOut,
//                 );
//               });
//             }
//           },
//           passwordReset: (_) {
//             ScaffoldMessenger.of(context).hideCurrentSnackBar();
//             WidgetsBinding.instance.addPostFrameCallback((_) {
//               context.go(RoutePaths.login);
//             });
//           },
//           error: (errorState) {
//             emailController.clear();
//             WidgetsBinding.instance.addPostFrameCallback((_) {
//               ScaffoldMessenger.of(context).hideCurrentSnackBar();
//               ScaffoldMessenger.of(context).showSnackBar(
//                 CustomSnackBar.show(
//                   color: context.colors.error500,
//                   title: 'Incorrect login, please try again.',
//                   seconds: 3,
//                   context: context,
//                 ),
//               );
//             });
//           },
//           errorVerify: (errorState) {
//             WidgetsBinding.instance.addPostFrameCallback((_) {
//               ScaffoldMessenger.of(context).hideCurrentSnackBar();
//               ScaffoldMessenger.of(context).showSnackBar(
//                 CustomSnackBar.show(
//                   color: context.colors.error500,
//                   title: context.loc.incorrectCode,
//                   seconds: 3,
//                   context: context,
//                 ),
//               );
//             });
//           },
//           orElse: () {},
//         );
//       },
//       builder: (context, state, bloc) {
//         return Scaffold(
//           appBar: const ForgotPasswordAppBar(),
//           backgroundColor: context.colors.gray100,
//           resizeToAvoidBottomInset: false,
//           body: SafeArea(
//             child: SingleChildScrollView(
//               child: SizedBox(
//                 height: MediaQuery.of(context).size.height -
//                     AppBar().preferredSize.height -
//                     MediaQuery.of(context).padding.top,
//                 child: Stack(
//                   alignment: Alignment.topCenter,
//                   children: [
//                     PageView(
//                       physics: const NeverScrollableScrollPhysics(),
//                       scrollDirection: Axis.horizontal,
//                       controller: pageController,
//                       onPageChanged: (value) {},
//                       children: [
//                         ForgotPasswordFirstPage(
//                           formKey: _formKey,
//                           emailController: emailController,
//                           pageController: pageController,
//                           callback: () {
//                             if (_formKey.currentState!.validate()) {
//                               setState(() {
//                                 email = emailController.text;
//                               });
//                               ScaffoldMessenger.of(context)
//                                   .hideCurrentSnackBar();
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 CustomSnackBar.show(
//                                     color: context.colors.gray500,
//                                     title: context.loc.pleaseWait,
//                                     seconds: 30,
//                                     context: context),
//                               );

//                               authBloc.add(
//                                 AuthEvent.forgotPassword(
//                                   email: emailController.text,
//                                 ),
//                               );
//                             }
//                           },
//                         ),
//                         ForgotPasswordSecondPage(
//                           email: email,
//                           pageController: pageController,
//                           callback: (otpCode) {
//                             if (otpCode.length == 6) {
//                               _handleOtpVerification(otpCode);
//                             } else {
//                               _resendOtpCode();
//                             }
//                           },
//                         ),
//                         ForgotPasswordThirdPage(
//                           email: email,
//                           callback: (password, confirmPassword) {
//                             ScaffoldMessenger.of(context).hideCurrentSnackBar();
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               CustomSnackBar.show(
//                                   color: context.colors.gray500,
//                                   title: context.loc.pleaseWait,
//                                   seconds: 30,
//                                   context: context),
//                             );

//                             if (passwordResetId != null) {
//                               authBloc.add(AuthEvent.setPasswordResetId(
//                                   passwordResetId: passwordResetId!));
//                             }

//                             authBloc.add(
//                               AuthEvent.verify(
//                                 password: password,
//                                 confirmPassword: confirmPassword,
//                               ),
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
