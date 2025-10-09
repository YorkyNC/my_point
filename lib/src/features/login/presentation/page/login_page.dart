import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/core/router/router.dart';
import 'package:my_point/src/core/services/injectable/injectable_service.dart';
import 'package:my_point/src/features/login/presentation/bloc/authorization_bloc.dart';
import 'package:my_point/src/features/login/presentation/components/custom_snack_bar.dart';
import 'package:my_point/src/features/login/presentation/components/login_text_field_widget.dart';
import 'package:my_point/src/features/login/presentation/components/privacy_policy_widget.dart';

import '../../../../app/imports.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthorizationBloc>(),
      child: Scaffold(
        backgroundColor: context.colors.white,
        appBar: AppBar(
          backgroundColor: context.colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: !st.hasSeenIntroduction()
              ? [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: Icon(context.icons.close, color: context.colors.black),
                    ),
                  )
                ]
              : [],
        ),
        body: BlocBuilder<AuthorizationBloc, AuthorizationState>(
          builder: (context, state) {
            final bloc = context.read<AuthorizationBloc>();
            return BlocListener<AuthorizationBloc, AuthorizationState>(
              listenWhen: (previous, current) {
                return previous.success != current.success || previous.error != current.error;
              },
              listener: (context, state) {
                if (state.success) {
                  _emailController.clear();
                  _passwordController.clear();
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    CustomSnackBar.show(
                      color: context.colors.brand500,
                      title: 'Вход выполнен успешно',
                      seconds: 3,
                      context: context,
                    ),
                  );
                  context.push(RoutePaths.home);
                }
                if (state.error != null && state.error!.isNotEmpty) {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    CustomSnackBar.show(
                      color: context.colors.error500,
                      title: 'Неверный email или пароль',
                      seconds: 3,
                      context: context,
                    ),
                  );
                }
              },
              child: state.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Вход',
                              style: context.typography.title.copyWith(
                                color: context.colors.textprimary,
                              ),
                            ),
                            SizedBox(height: 24),

                            LoginTextFieldWidget(
                                error: state.error != null && state.error!.isNotEmpty,
                                controller: _emailController,
                                bloc: bloc,
                                formKey: _formKey1,
                                onChanged: (value) {
                                  bloc.add(EmailChanged(value));
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return null;
                                  }
                                  if (!state.isEmailValid) {
                                    return 'Неверный формат';
                                  }
                                  return null;
                                },
                                hint: 'Email',
                                suffixIcon: context.icons.mail,
                                keyboardType: TextInputType.emailAddress),
                            SizedBox(height: 24),
                            LoginTextFieldWidget(
                                error: state.error != null && state.error!.isNotEmpty,
                                controller: _passwordController,
                                bloc: bloc,
                                formKey: _formKey2,
                                onChanged: (value) {
                                  bloc.add(PasswordChanged(value));
                                },
                                hint: 'Пароль',
                                suffixIcon: state.isObscurePassword ? context.icons.views_off : context.icons.views,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: state.isObscurePassword,
                                onSuffixIconTap: () {
                                  bloc.add(PasswordVisibilityChanged(!state.isObscurePassword));
                                }),
                            SizedBox(height: 24),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: context.colors.mainAccent,
                                      foregroundColor: context.colors.white,
                                    ),
                                    onPressed: state.isLoginVerified && state.isEmailValid
                                        ? () {
                                            final currentState = bloc.state;
                                            bloc.add(SignIn(currentState.email ?? '', currentState.password ?? ''));
                                          }
                                        : null,
                                    child: Text(
                                      'Продолжить',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 24),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  context.push(RoutePaths.unregisteredUser);
                                },
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Нет аккаунта?',
                                        style: context.typography.extraSmallParagraphMedium.copyWith(
                                          color: context.colors.lightSecondaryText,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' Зарегистрироваться',
                                        style: context.typography.extraSmallParagraphMedium.copyWith(
                                          color: context.colors.mainAccent,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            // Row(
                            //   mainAxisSize: MainAxisSize.max,
                            //   children: [
                            //     Expanded(
                            //       flex: 1,
                            //       child: Container(
                            //         padding: const EdgeInsets.symmetric(vertical: 9),
                            //         decoration: BoxDecoration(
                            //           border: Border(
                            //             bottom: BorderSide(
                            //               color: context.colors.lightSecondaryText,
                            //               width: 1.0,
                            //             ),
                            //           ),
                            //         ),
                            //         child: InkWell(
                            //           splashColor: Colors.transparent,
                            //           highlightColor: Colors.transparent,
                            //           onTap: () async {
                            //             final result = await showSheetPopup(context, title: Text('Выберите страну'),
                            //                 builder: (context) {
                            //               return NumberSearchModal(state: state);
                            //             });

                            //             if (result != null && result is CountrySelection) {
                            //               final bloc = context.read<AuthorizationBloc>();
                            //               bloc.add(PhoneCodeChanged(
                            //                 result.dialCode,
                            //                 result.flag,
                            //               ));
                            //             }
                            //           },
                            //           child: Row(
                            //             mainAxisSize: MainAxisSize.min,
                            //             spacing: 8,
                            //             children: [
                            //               state.flag != null
                            //                   ? Text(
                            //                       state.flag!,
                            //                       style: context.typography.smallParagraph
                            //                           .copyWith(color: context.colors.black, fontSize: 24),
                            //                     )
                            //                   : Text(
                            //                       '🇰🇿',
                            //                       style: context.typography.smallParagraph
                            //                           .copyWith(color: context.colors.black, fontSize: 24),
                            //                     ),
                            //               Text(
                            //                 state.phoneCode ?? '+7',
                            //                 style: context.typography.smallParagraph.copyWith(
                            //                   color: context.colors.textprimary,
                            //                 ),
                            //               ),
                            //               Icon(
                            //                 context.icons.chevron_down,
                            //                 size: 18,
                            //                 color: context.colors.textprimary,
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //     SizedBox(width: 16),
                            //     Expanded(
                            //       flex: 3,
                            //       child: Container(
                            //         decoration: BoxDecoration(
                            //           border: Border(
                            //             bottom: BorderSide(
                            //               color: context.colors.lightSecondaryText,
                            //               width: 1.0,
                            //             ),
                            //           ),
                            //         ),
                            //         child: AuthorizationTextFieldWidget(
                            //           bloc: bloc,
                            //           phoneController: _phoneController,
                            //           onSuffixIconTap: () {
                            //             _phoneController.clear();
                            //             bloc.add(PhoneNumberChanged(''));
                            //           },
                            //           onChanged: (String value) {
                            //             bloc.add(PhoneNumberChanged(value));
                            //           },
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),

                            SizedBox(height: 24),
                            // Row(
                            //   children: [
                            //     Expanded(
                            //       child: ElevatedButton(
                            //         onPressed: state.isLoginVerified
                            //             ? () {
                            //                 bloc.add(SignIn(state.phoneCode ?? '+7', _phoneController.text, ''));
                            //               }
                            //             : null,
                            //         child: Text('Войти'),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            Spacer(),
                            PrivacyPolicyWidget()
                          ],
                        ),
                      ),
                    ),
            );
          },
        ),
      ),
    );
  }
}
