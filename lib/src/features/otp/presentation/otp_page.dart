import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:my_point/src/core/router/router.dart';
import 'package:my_point/src/core/services/injectable/injectable_service.dart';
import 'package:my_point/src/features/login/presentation/bloc/authorization_bloc.dart';
import 'package:my_point/src/features/login/presentation/custom_snack_bar.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../app/imports.dart';
import '../../../core/extensions/build_context_extension.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({
    super.key,
    required this.phone,
  });

  final String phone;

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _otpController.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthorizationBloc>()..add(StartTimer()),
      child: BlocListener<AuthorizationBloc, AuthorizationState>(
        listenWhen: (previous, current) {
          return !previous.isOtpSuccess && current.isOtpSuccess;
        },
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            CustomSnackBar.show(
              color: context.colors.brand500,
              title: 'Код подтвержден',
              seconds: 3,
              context: context,
            ),
          );

          Future.delayed(Duration(seconds: 1), () {
            // TODO: check if user is registered
            context.push(RoutePaths.unregisteredUser);
          });
        },
        child: BlocBuilder<AuthorizationBloc, AuthorizationState>(
          builder: (context, state) {
            return Scaffold(
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
              body: SafeArea(
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
                            widget.phone,
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
                      Row(
                        children: [
                          Expanded(
                            child: PinCodeTextField(
                              appContext: context,
                              length: 4,
                              hintCharacter: '•',
                              textStyle: context.typography.smallParagraph.copyWith(
                                color: context.colors.black,
                              ),
                              hintStyle: context.typography.smallParagraph.copyWith(
                                color: context.colors.gray500,
                              ),
                              controller: _otpController,
                              animationType: AnimationType.none,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              keyboardType: TextInputType.number,
                              onCompleted: (value) {
                                context.read<AuthorizationBloc>().add(OtpChanged(value));
                                log(state.success.toString());
                                log(state.isOtpFilled.toString());
                                log(state.isLoading.toString());

                                log(state.otp.toString());
                              },
                              pinTheme: PinTheme(
                                disabledBorderWidth: 1.0,
                                activeBorderWidth: 1.0,
                                inactiveBorderWidth: 1.0,
                                selectedBorderWidth: 1.0,
                                shape: PinCodeFieldShape.underline,
                                fieldWidth: MediaQuery.of(context).size.width * 0.175,
                                borderWidth: 1.0,
                                selectedColor: context.colors.textprimary,
                                selectedFillColor: context.colors.white,
                                inactiveColor: context.colors.gray500,
                                inactiveFillColor: context.colors.white,
                                activeColor: context.colors.lightSecondaryText,
                                activeFillColor: context.colors.white,
                                disabledColor: context.colors.textprimary,
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                              ],
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
                                      ? () => context.read<AuthorizationBloc>().add(ResendOtp())
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
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Отправить код по WhatsApp',
                                style: context.typography.smallParagraphMedium.copyWith(
                                  color: context.colors.accent2,
                                ),
                              ),
                            ),
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

class UnregisteredUserView extends StatelessWidget {
  const UnregisteredUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
