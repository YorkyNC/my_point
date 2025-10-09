import 'dart:developer';

import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/core/router/router.dart';
import 'package:my_point/src/core/services/injectable/injectable_service.dart';
import 'package:my_point/src/features/login/domain/request/request_otp_code.dart';
import 'package:my_point/src/features/login/presentation/bloc/authorization_bloc.dart';
import 'package:my_point/src/features/login/presentation/components/error_register_message_widget.dart';
import 'package:my_point/src/features/login/presentation/components/number_selection_widget.dart';
import 'package:my_point/src/features/login/presentation/components/privacy_policy_widget.dart';

class VerificationView extends StatefulWidget {
  const VerificationView({super.key});

  @override
  State<VerificationView> createState() => _VerificationViewState();
}

class _VerificationViewState extends State<VerificationView> with TickerProviderStateMixin {
  final TextEditingController _phoneController = TextEditingController();
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
  }

  @override
  void dispose() {
    _errorController.dispose();
    super.dispose();
  }

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
          actions: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: IconButton(
                onPressed: () {
                  // context.pop();
                },
                icon: Icon(context.icons.close, color: context.colors.black),
              ),
            ),
          ],
        ),
        body: BlocBuilder<AuthorizationBloc, AuthorizationState>(
          builder: (context, state) {
            final bloc = context.read<AuthorizationBloc>();
            return BlocListener<AuthorizationBloc, AuthorizationState>(
              listenWhen: (previous, current) => previous.isOtpSuccess != current.isOtpSuccess,
              listener: (context, state) {
                if (state.isOtpSuccess) {
                  context.push(
                    RoutePaths.otp,
                    extra: {
                      'phone': _phoneController.text,
                      'phoneCode': state.phoneCode!,
                      'pinId': state.pinId!,
                    },
                  );
                }
                if (state.isOtpError) {
                  _errorController.forward();
                }
              },
              child: state.isOtpLoading
                  ? Center(child: CircularProgressIndicator())
                  : state.isOtpError
                      ? ErrorRegisterMessageWidget(logoAnimation: _errorAnimation)
                      : SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Введите номер телефона',
                                  style: context.typography.title.copyWith(
                                    color: context.colors.textprimary,
                                  ),
                                ),
                                SizedBox(height: 24),
                                Text(
                                  'Мы отправим код подтверждения на ваш номер',
                                  style: context.typography.smallParagraph.copyWith(
                                    color: context.colors.textprimary,
                                  ),
                                ),
                                SizedBox(height: 8),
                                NumberSelectionWidget(
                                    bloc: bloc, phoneNumberController: _phoneController, state: state),
                                SizedBox(height: 24),
                                Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: state.phoneCode == null || _phoneController.text.isEmpty
                                            ? null
                                            : () {
                                                log('phoneNumber: ${state.phoneCode! + _phoneController.text}',
                                                    name: 'VerificationView');
                                                bloc.add(OtpCodeRequested(RequestOtpCode(
                                                    phoneNumber: state.phoneCode! + _phoneController.text)));
                                                // RequestOtpCode(phoneNumber: '+77086272471')));
                                              },
                                        child: Text('Получить код'),
                                      ),
                                    ),
                                  ],
                                ),
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
