import 'package:my_point/src/core/services/injectable/injectable_service.dart';
import 'package:my_point/src/features/login/presentation/bloc/authorization_bloc.dart';
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
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthorizationBloc>()..add(StartTimer()),
      child: BlocListener<AuthorizationBloc, AuthorizationState>(
        listener: (context, state) {
          // Handle OTP verification success
          // if (state.isOtpVerified) {
          //   ScaffoldMessenger.of(context).showSnackBar(
          //     SnackBar(
          //       content: Text('OTP verified successfully'),
          //       backgroundColor: Colors.green,
          //     ),
          //   );
          //   // Navigate to next step or back
          //   context.pop();
          // }

          // // Handle error messages
          // if (state.errorMessage != null && state.errorMessage!.isNotEmpty) {
          //   ScaffoldMessenger.of(context).showSnackBar(
          //     SnackBar(
          //       content: Text(state.errorMessage!),
          //       backgroundColor: Colors.red,
          //     ),
          //   );
          // }
        },
        child: BlocBuilder<AuthorizationBloc, AuthorizationState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: context.colors.white,
                leading: IconButton(
                  onPressed: () => context.pop(),
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
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
                        'Проверка идентификации',
                        style: context.typography.interTitlle20Semibold.copyWith(
                          color: context.colors.black,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Введите 4-значный код, который мы выслали вам на ваш номер ${widget.phone}',
                        style: context.typography.interText16.copyWith(
                          color: context.colors.gray500,
                        ),
                      ),
                      const SizedBox(height: 20),
                      PinCodeTextField(
                        key: ValueKey('password_input'),
                        autoDisposeControllers: false,
                        appContext: context,
                        length: 4,
                        textStyle: context.typography.interText16.copyWith(
                          color: context.colors.black,
                        ),
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        enableActiveFill: true,
                        autoFocus: false,
                        focusNode: FocusNode(),
                        enablePinAutofill: false,
                        errorTextSpace: 0.0,
                        hintStyle: context.typography.interText16.copyWith(
                          color: context.colors.black,
                        ),
                        showCursor: false,
                        cursorColor: context.colors.blue,
                        obscureText: false,
                        hintCharacter: '•',
                        keyboardType: TextInputType.number,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.underline,
                        ),
                        onChanged: (_) {},
                        autovalidateMode: AutovalidateMode.onUnfocus,
                      ),
                      // Row(
                      //   spacing: 16,
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: List.generate(
                      //     4,
                      //     (index) => CustomOTPWidget(
                      //       controller: controllers[index],
                      //       focusNode: focusNodes[index],
                      //       nextFocusNode: index < 3 ? focusNodes[index + 1] : null,
                      //       currentIndex: index,
                      //       onBackspace: moveToPreviousField,
                      //       onChanged: (value) {
                      //         setState(() {
                      //           otpCode = controllers.map((c) => c.text).join();
                      //         });

                      //         if (value.isNotEmpty && index < 3) {
                      //           FocusScope.of(context).requestFocus(focusNodes[index + 1]);
                      //         }

                      //         if (otpCode.length == 4) {
                      //           context.read<AuthorizationBloc>().add(VerifyOtp());
                      //           Future.delayed(Duration(milliseconds: 500), () {
                      //             context.push(RoutePaths.personalIdentification);
                      //           });
                      //         }
                      //       },
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: context.colors.blue,
                              textStyle: context.typography.interText16.copyWith(
                                color: context.colors.blue,
                              ),
                            ),
                            onPressed:
                                state.canRequestCode ? () => context.read<AuthorizationBloc>().add(ResendOtp()) : null,
                            child: state.canRequestCode
                                ? Text(
                                    'Получить код повторно',
                                    style: context.typography.interText16.copyWith(
                                      color: context.colors.blue,
                                    ),
                                  )
                                : RichText(
                                    text: TextSpan(
                                      style: context.typography.interText16,
                                      children: [
                                        TextSpan(
                                          text: 'Запросить код через ',
                                          style: TextStyle(
                                            color: context.colors.gray500,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '${state.remainingSeconds} секунд',
                                          style: TextStyle(
                                            color: context.colors.blue,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                          ),
                        ],
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
