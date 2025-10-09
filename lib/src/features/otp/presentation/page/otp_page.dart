import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/core/services/injectable/injectable_service.dart';
import 'package:my_point/src/features/login/domain/request/request_otp_code.dart';
import 'package:my_point/src/features/login/domain/request/verify_otp_request.dart';
import 'package:my_point/src/features/login/presentation/bloc/authorization_bloc.dart';
import 'package:my_point/src/features/login/presentation/components/success_register_message_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({
    super.key,
    required this.phone,
    required this.phoneCode,
    required this.pinId,
  });
  final String phoneCode;
  final String phone;
  final String pinId;

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> with TickerProviderStateMixin {
  final TextEditingController _otpController = TextEditingController();
  late AnimationController _logoController;
  late Animation<double> _logoAnimation;
  @override
  void dispose() {
    _otpController.dispose();
    _logoController.dispose();
    super.dispose();
  }

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
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthorizationBloc>()..add(StartTimer()),
      child: BlocListener<AuthorizationBloc, AuthorizationState>(
        listenWhen: (previous, current) {
          return !previous.isVerifyOtpSuccess && current.isVerifyOtpSuccess;
        },
        listener: (context, state) {
          _logoController.forward();

          // TODO: check if user is registered
          // WidgetsBinding.instance.addPostFrameCallback((_) {
          //   if (context.mounted) {
          //     context.push(RoutePaths.unregisteredUser);
          //   }
          // });
        },
        child: BlocBuilder<AuthorizationBloc, AuthorizationState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: context.colors.white,
                leading: IconButton(
                  onPressed: () => context.pop(),
                  icon: Icon(
                    context.icons.chevron_left,
                    color: context.colors.black,
                  ),
                ),
              ),
              backgroundColor: context.colors.white,
              body: state.isVerifyOtpLoading
                  ? Center(child: CircularProgressIndicator())
                  : state.isVerifyOtpSuccess
                      ? SuccessRegisterMessageWidget(
                          logoAnimation: _logoAnimation,
                          isSignUpVerified: false,
                        )
                      : SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 24,
                              horizontal: 16,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Подтвердите номер',
                                  style: context.typography.title.copyWith(
                                    color: context.colors.black,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                const SizedBox(height: 24),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${widget.phoneCode} ${widget.phone}',
                                      style: context.typography.title.copyWith(
                                        color: context.colors.textprimary,
                                      ),
                                    ),
                                    Text(
                                      'Введите код из SMS сообщения',
                                      style: context.typography.smallParagraph.copyWith(
                                        color: context.colors.textprimary,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: PinCodeTextField(
                                            controller: _otpController,
                                            autoDisposeControllers: false,
                                            appContext: context,
                                            length: 4,
                                            hintCharacter: '•',
                                            textStyle: context.typography.smallParagraph.copyWith(
                                              color: context.colors.black,
                                            ),
                                            hintStyle: context.typography.smallParagraph.copyWith(
                                              color: context.colors.gray500,
                                            ),
                                            animationType: AnimationType.none,
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            keyboardType: TextInputType.number,
                                            onCompleted: (value) {
                                              context.read<AuthorizationBloc>().add(VerifyOtpRequested(VerifyOtpRequest(
                                                    pinId: widget.pinId,
                                                    pin: value,
                                                  )));
                                            },
                                            pinTheme: PinTheme(
                                              disabledBorderWidth: 1.0,
                                              activeBorderWidth: 1.0,
                                              inactiveBorderWidth: 1.0,
                                              selectedBorderWidth: 1.0,
                                              shape: PinCodeFieldShape.underline,
                                              fieldWidth: MediaQuery.of(context).size.width * 0.175,
                                              borderWidth: 1.0,
                                              selectedColor: state.isVerifyOtpError
                                                  ? context.colors.lightErrorBorder
                                                  : context.colors.textprimary,
                                              selectedFillColor: context.colors.white,
                                              inactiveColor: state.isVerifyOtpError
                                                  ? context.colors.lightErrorBorder
                                                  : context.colors.gray500,
                                              inactiveFillColor: context.colors.white,
                                              activeColor: state.isVerifyOtpError
                                                  ? context.colors.lightErrorBorder
                                                  : context.colors.lightSecondaryText,
                                              activeFillColor: context.colors.white,
                                              disabledColor: state.isVerifyOtpError
                                                  ? context.colors.lightErrorBorder
                                                  : context.colors.textprimary,
                                              errorBorderWidth: 1.0,
                                              errorBorderColor: state.isVerifyOtpError
                                                  ? context.colors.lightErrorBorder
                                                  : context.colors.lightErrorBorder,
                                            ),
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (state.isVerifyOtpError)
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8.0),
                                        child: Text(
                                          'Неверный код',
                                          style: context.typography.smallParagraph.copyWith(
                                            color: context.colors.lightErrorBorder,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          TextButton(
                                            style: TextButton.styleFrom(
                                              textStyle: context.typography.smallParagraph.copyWith(
                                                color: context.colors.lightSecondaryText,
                                              ),
                                            ),
                                            onPressed: state.canRequestCode
                                                ? () => context.read<AuthorizationBloc>().add(
                                                      OtpCodeRequested(
                                                        RequestOtpCode(
                                                          phoneNumber: widget.phoneCode + widget.phone,
                                                        ),
                                                      ),
                                                    )
                                                : null,
                                            child: state.canRequestCode
                                                ? Text(
                                                    'Отправить SMS-код повторно',
                                                    style: context.typography.smallParagraphMedium.copyWith(
                                                      color: context.colors.textprimary,
                                                    ),
                                                  )
                                                : RichText(
                                                    text: TextSpan(
                                                      style: context.typography.smallParagraph,
                                                      children: [
                                                        TextSpan(
                                                          text: 'Новый код через ',
                                                          style: TextStyle(
                                                            color: context.colors.lightSecondaryText,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text: '${state.remainingSeconds} секунд',
                                                          style: context.typography.smallParagraphMedium.copyWith(
                                                            color: context.colors.textprimary,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 16),
                                      // TextButton(
                                      //   onPressed: () {},
                                      //   child: Text(
                                      //     'Отправить код по WhatsApp',
                                      //     style: context.typography.smallParagraphMedium.copyWith(
                                      //       color: context.colors.accent2,
                                      //     ),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
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
