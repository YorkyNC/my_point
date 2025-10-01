import 'package:flutter/cupertino.dart';
import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/core/services/injectable/injectable_service.dart';
import 'package:my_point/src/features/login/presentation/bloc/authorization_bloc.dart';
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
  late AnimationController _logoController;
  late Animation<double> _logoAnimation;
  @override
  void initState() {
    super.initState();
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
            onPressed: () => context.pop(),
            icon: Icon(
              CupertinoIcons.chevron_left,
              color: context.colors.black,
            ),
          ),
        ),
        backgroundColor: context.colors.white,
        body: BlocConsumer<AuthorizationBloc, AuthorizationState>(
          listener: (context, state) {
            if (state.success) {
              _logoController.forward();
            }
          },
          builder: (context, state) {
            final bloc = context.read<AuthorizationBloc>();
            return state.isLoading
                ? Center(child: CircularProgressIndicator())
                : state.success
                    ? SuccessRegisterMessageWidget(logoAnimation: _logoAnimation)
                    : SafeArea(
                        child: Column(
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                physics: ClampingScrollPhysics(),
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
                                              hintText: 'Фамилия', controller: _surnameController),
                                          UnregisteredUserTextField(hintText: 'Имя', controller: _nameController),
                                          UnregisteredUserTextField(hintText: 'Email', controller: _emailController),
                                          UnregisteredUserTextField(
                                              hintText: 'Пароль', controller: _passwordController),
                                          UnregisteredUserTextField(
                                              hintText: 'Подтверждение пароля', controller: _confirmPasswordController),
                                        ],
                                      ),
                                      SizedBox(height: 24),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: ElevatedButton(
                                              onPressed: state.isValidate
                                                  ? null
                                                  : () {
                                                      bloc.add(
                                                        SignUp(
                                                          _surnameController.text,
                                                          _nameController.text,
                                                          _emailController.text,
                                                          _passwordController.text,
                                                          _confirmPasswordController.text,
                                                        ),
                                                      );
                                                    },
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
