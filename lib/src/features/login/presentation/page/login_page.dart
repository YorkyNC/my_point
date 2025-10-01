import 'package:flutter/cupertino.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/core/router/router.dart';
import 'package:my_point/src/core/services/injectable/injectable_service.dart';
import 'package:my_point/src/core/widgets/popups/sheet_popup.dart';
import 'package:my_point/src/features/login/presentation/bloc/authorization_bloc.dart';
import 'package:my_point/src/features/login/presentation/components/authorization_text_field_widget.dart';
import 'package:my_point/src/features/login/presentation/components/number_search_modal.dart';
import 'package:my_point/src/features/login/presentation/components/privacy_policy_widget.dart';

import '../../../../app/imports.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();

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
                icon: Icon(context.icons.delete_1__remove_add_button_buttons_delete_cross_x_mathematics_multiply_math,
                    color: context.colors.black),
              ),
            ),
          ],
        ),
        body: BlocBuilder<AuthorizationBloc, AuthorizationState>(
          builder: (context, state) {
            final bloc = context.read<AuthorizationBloc>();
            return BlocListener<AuthorizationBloc, AuthorizationState>(
              listener: (context, state) {
                if (state.success) {
                  context.push(
                    RoutePaths.otp,
                    extra: {
                      'phone': _phoneController.text,
                    },
                  );
                }
              },
              child: state.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
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
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 9),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: context.colors.lightSecondaryText,
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        final result = await showSheetPopup(context, title: Text('Выберите страну'),
                                            builder: (context) {
                                          return NumberSearchModal(state: state);
                                        });

                                        if (result != null && result is CountrySelection) {
                                          final bloc = context.read<AuthorizationBloc>();
                                          bloc.add(PhoneCodeChanged(
                                            result.dialCode,
                                            result.flag,
                                          ));
                                        }
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        spacing: 8,
                                        children: [
                                          state.flag != null
                                              ? Text(
                                                  state.flag!,
                                                  style: context.typography.smallParagraph
                                                      .copyWith(color: context.colors.black, fontSize: 24),
                                                )
                                              : Text(
                                                  '🇰🇿',
                                                  style: context.typography.smallParagraph
                                                      .copyWith(color: context.colors.black, fontSize: 24),
                                                ),
                                          Text(
                                            state.phoneCode ?? '+7',
                                            style: context.typography.smallParagraph.copyWith(
                                              color: context.colors.textprimary,
                                            ),
                                          ),
                                          Icon(
                                            CupertinoIcons.chevron_down,
                                            size: 16,
                                            color: context.colors.textprimary,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: context.colors.lightSecondaryText,
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: AuthorizationTextFieldWidget(
                                      bloc: bloc,
                                      phoneController: _phoneController,
                                      onChanged: (String value) {
                                        bloc.add(PhoneNumberChanged(value));
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 24),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: _phoneController.text.isEmpty
                                        ? null
                                        : () {
                                            bloc.add(SignIn(state.phoneCode ?? '+7', _phoneController.text, ''));
                                          },
                                    child: Text('Войти'),
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
