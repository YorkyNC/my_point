import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/core/router/router.dart';
import 'package:my_point/src/core/services/injectable/injectable_service.dart';
import 'package:my_point/src/features/login/domain/request/sign_up_request.dart';
import 'package:my_point/src/features/login/presentation/bloc/authorization_bloc.dart';
import 'package:my_point/src/features/login/presentation/components/error_register_message_widget.dart';
import 'package:my_point/src/features/login/presentation/components/number_selection_widget.dart';
import 'package:my_point/src/features/login/presentation/components/privacy_policy_widget.dart';
import 'package:my_point/src/features/login/presentation/components/success_register_message_widget.dart';
import 'package:my_point/src/features/login/presentation/components/unregistered_user_text_field.dart';

class UnregisteredUserView extends StatefulWidget {
  const UnregisteredUserView({super.key});

  @override
  State<UnregisteredUserView> createState() => _UnregisteredUserViewState();
}

class _UnregisteredUserViewState extends State<UnregisteredUserView> with TickerProviderStateMixin {
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late AnimationController _logoController;
  late Animation<double> _logoAnimation;
  late Animation<double> _errorAnimation;
  late AnimationController _errorController;
  @override
  void initState() {
    super.initState();
    _errorController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _errorAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _errorController,
      curve: Curves.elasticOut,
    ));
    _logoController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _logoAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _logoController,
      curve: Curves.elasticOut,
    ));
  }

  @override
  void dispose() {
    _logoController.dispose();
    _errorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthorizationBloc>(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: context.colors.white,
          leading: IconButton(
            onPressed: () => context.go(RoutePaths.login),
            icon: Icon(
              context.icons.chevron_left,
              color: context.colors.black,
            ),
          ),
        ),
        backgroundColor: context.colors.white,
        body: BlocConsumer<AuthorizationBloc, AuthorizationState>(
          listener: (context, state) {
            if (state.success) {
              _logoController.forward();
            } else if (state.error != null && state.error!.isNotEmpty) {
              _errorController.forward();
            }
          },
          builder: (context, state) {
            final bloc = context.read<AuthorizationBloc>();

            if (state.isLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (state.success) {
              return SuccessRegisterMessageWidget(logoAnimation: _logoAnimation, isSignUpVerified: true);
            }

            if (state.error != null && state.error!.isNotEmpty) {
              return ErrorRegisterMessageWidget(logoAnimation: _errorAnimation);
            }

            return SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      // physics: ClampingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Хочу открыть ПВЗ у себя',
                              style: context.typography.title.copyWith(
                                color: context.colors.black,
                              ),
                            ),
                            SizedBox(height: 24),
                            Column(
                              spacing: 24,
                              children: [
                                UnregisteredUserTextField(
                                    onChanged: (value) => bloc.add(SurnameChanged(value)),
                                    hintText: 'Фамилия',
                                    controller: _surnameController),
                                UnregisteredUserTextField(
                                  onChanged: (value) => bloc.add(NameChanged(value)),
                                  hintText: 'Имя',
                                  controller: _nameController,
                                ),
                                UnregisteredUserTextField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return null;
                                    }
                                    if (!state.isEmailValid) {
                                      return 'Неверный формат';
                                    }
                                    return null;
                                  },
                                  formKey: formKey,
                                  onChanged: (value) => bloc.add(EmailChanged(value)),
                                  hintText: 'Email',
                                  controller: _emailController,
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                NumberSelectionWidget(
                                    bloc: bloc, phoneNumberController: _phoneNumberController, state: state),
                                UnregisteredUserTextField(
                                  onChanged: (value) => bloc.add(PasswordChanged(value)),
                                  hintText: 'Пароль',
                                  controller: _passwordController,
                                  obscureText: true,
                                ),
                                UnregisteredUserTextField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return null;
                                    }
                                    if (!state.isPasswordMatch) {
                                      return 'Пароли не совпадают';
                                    }
                                    return null;
                                  },
                                  onChanged: (value) => bloc.add(ConfirmPasswordChanged(value)),
                                  hintText: 'Подтверждение пароля',
                                  controller: _confirmPasswordController,
                                  obscureText: true,
                                ),
                              ],
                            ),
                            SizedBox(height: 24),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: state.isSignUpVerified
                                        ? () {
                                            bloc.add(
                                              SignUp(
                                                SignUpRequest(
                                                  surname: _surnameController.text,
                                                  name: _nameController.text,
                                                  email: _emailController.text,
                                                  password: _passwordController.text,
                                                  phoneNumber: state.phoneCode! + _phoneNumberController.text,
                                                ),
                                              ),
                                            );
                                          }
                                        : null,
                                    child: Text(
                                      'Создать',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: PrivacyPolicyWidget(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
