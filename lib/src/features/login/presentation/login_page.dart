import '../../../app/imports.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('LoginPage build method called');

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login Page',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Welcome to My Point',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//       bloc: authBloc,
//       listenWhen: (previous, current) {
//         return current.maybeMap(
//           error: (_) => true,
//           loaded: (_) => true,
//           orElse: () => false,
//         );
//       },
//       listener: (context, state) {
//         state.whenOrNull(
//           error: (passwordErrorText) {
//             _passwordController.clear();
//             _emailController.clear();
//             _formKey.currentState!.validate();
//             ScaffoldMessenger.of(context).removeCurrentSnackBar();
//             ScaffoldMessenger.of(context).showSnackBar(
//               CustomSnackBar.show(
//                 color: context.colors.error500,
//                 title: passwordErrorText,
//                 seconds: 3,
//                 context: context,
//               ),
//             );
//           },
//           loaded: (viewModel) {
//             ScaffoldMessenger.of(context).removeCurrentSnackBar();
//             ScaffoldMessenger.of(context).showSnackBar(
//               CustomSnackBar.show(
//                 color: context.colors.success500,
//                 title: context.loc.loggedInSuccessfully,
//                 seconds: 3,
//                 context: context,
//               ),
//             );

//             // Tokens are already set in AuthBloc, no need to set them again here
//             log.d(viewModel.hasTempPassword.toString());

//             if (viewModel.hasTempPassword) {
//               log.d(
//                 'Temporary password detected, navigating to set new password page',
//               );
//               context.go(RoutePaths.setNewPassword);
//             } else {
//               log.i('Regular user logged in, redirecting to review page');
//               context.go(RoutePaths.review);
//             }
//           },
//         );
//       },
//       builder: (context, state, bloc) {
//         return Scaffold(
//           backgroundColor: context.colors.gray100,
//           floatingActionButtonLocation:
//               FloatingActionButtonLocation.centerFloat,
//           floatingActionButton: kIsWeb
//               ? SizedBox(
//                   height: 90,
//                   child: Center(
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: InkWell(
//                         key: const Key('install_app_inkwell'),
//                         onTap: () {
//                           final jsService = JsInteropService();
//                           jsService.initialize();

//                           jsService.manuallyShowInstallPrompt();
//                         },
//                         borderRadius: BorderRadius.circular(8),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: context.colors.brand400,
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 vertical: 12, horizontal: 16),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Icon(
//                                     Icons.add_to_home_screen,
//                                     size: 32,
//                                     color: context.colors.white,
//                                   ),
//                                 ),
//                                 const SizedBox(width: 12),
//                                 Expanded(
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         'Установить приложение',
//                                         style: context.typography.textmdSemibold
//                                             .copyWith(
//                                           color: context.colors.white,
//                                         ),
//                                       ),
//                                       Text(
//                                         'Добавить на главный экран',
//                                         style: context.typography.textsmRegular
//                                             .copyWith(
//                                           color: context.colors.white,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//               : null,
//           body: SafeArea(
//             top: true,
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 8,
//                 ),
//                 child: Container(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
//                   decoration: BoxDecoration(
//                     color: context.colors.white,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Form(
//                     key: _formKey,
//                     child: Column(
//                       mainAxisSize: MainAxisSize.max,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Column(
//                           children: [
//                             Text(
//                               context.loc.loginToAccount,
//                               style: context.typography.textxlBold.copyWith(
//                                 color: context.colors.black,
//                               ),
//                             ),
//                             const SizedBox(height: 4),
//                             Text(
//                               context.loc.theAccountIsIssuedByTheSchool,
//                               style: context.typography.textmdRegular.copyWith(
//                                 color: context.colors.gray500,
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 20),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               context.loc.mail,
//                               style: context.typography.textsmMedium.copyWith(
//                                 color: context.colors.gray700,
//                               ),
//                             ),
//                             const SizedBox(height: 6),
//                             EmailTextFormField(
//                               emailController: _emailController,
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 12),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               context.loc.password,
//                               style: context.typography.textsmMedium.copyWith(
//                                 color: context.colors.gray700,
//                               ),
//                             ),
//                             const SizedBox(height: 6),
//                             PasswordTextFormField(
//                               passwordController: _passwordController,
//                               isPasswordVisible: _isPasswordVisible,
//                               errorText: context.loc.pleaseEnterYourPassword,
//                               onPasswordVisibilityChanged: () {
//                                 setState(() {
//                                   _isPasswordVisible = !_isPasswordVisible;
//                                 });
//                               },
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 20),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: GestureDetector(
//                                 key: const Key('login_button'),
//                                 onTap: () {
//                                   if (_formKey.currentState!.validate()) {
//                                     setState(() {
//                                       passwordErrorText =
//                                           context.loc.incorrectLoginOrPassword;
//                                     });
//                                     authBloc.add(
//                                       AuthEvent.login(
//                                         username: _emailController.text,
//                                         password: _passwordController.text,
//                                       ),
//                                     );
//                                     ScaffoldMessenger.of(context).showSnackBar(
//                                         CustomSnackBar.show(
//                                             color: context.colors.gray500,
//                                             title: context.loc.pleaseWait,
//                                             seconds: 1,
//                                             context: context));
//                                   } else {
//                                     setState(() {
//                                       passwordErrorText =
//                                           context.loc.pleaseEnterYourPassword;
//                                     });
//                                   }
//                                 },
//                                 child: Container(
//                                   width: double.infinity,
//                                   padding: const EdgeInsets.symmetric(
//                                       vertical: 12, horizontal: 24),
//                                   decoration: BoxDecoration(
//                                     color: context.colors.brand500,
//                                     borderRadius: BorderRadius.circular(8),
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color:
//                                             Colors.black.withValues(alpha: 0.1),
//                                         blurRadius: 4,
//                                         offset: const Offset(0, 2),
//                                       ),
//                                     ],
//                                   ),
//                                   child: Center(
//                                     child: Text(
//                                       context.loc.login,
//                                       style: const TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w600,
//                                         color: Colors.white,
//                                         inherit: true,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 8),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 10.0),
//                           child: GestureDetector(
//                             onTap: () {
//                               context.pushNamed(RouteNames.forgotPassword);
//                             },
//                             child: Text(
//                               context.loc.forgotYourPassword,
//                               style: context.typography.textsmSemibold.copyWith(
//                                 color: context.colors.gray600,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
