import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/core/widgets/popups/sheet_popup.dart' show showSheetPopup;
import 'package:my_point/src/features/login/presentation/bloc/authorization_bloc.dart';
import 'package:my_point/src/features/login/presentation/components/authorization_text_field_widget.dart';
import 'package:my_point/src/features/login/presentation/components/number_search_modal.dart';

class NumberSelectionWidget extends StatelessWidget {
  const NumberSelectionWidget({
    super.key,
    required this.bloc,
    required TextEditingController phoneNumberController,
    required this.state,
  }) : _phoneNumberController = phoneNumberController;

  final AuthorizationBloc bloc;
  final TextEditingController _phoneNumberController;
  final AuthorizationState state;

  @override
  Widget build(BuildContext context) {
    return Row(
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
                final result = await showSheetPopup(context, title: Text('Выберите страну'), builder: (context) {
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
                          style: context.typography.smallParagraph.copyWith(color: context.colors.black, fontSize: 24),
                        )
                      : Text(
                          '🇰🇿',
                          style: context.typography.smallParagraph.copyWith(color: context.colors.black, fontSize: 24),
                        ),
                  Expanded(
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      state.phoneCode ?? '+7',
                      maxLines: 1,
                      style: context.typography.smallParagraph.copyWith(
                        color: context.colors.textprimary,
                      ),
                    ),
                  ),
                  Icon(
                    context.icons.chevron_down,
                    size: 18,
                    color: context.colors.textprimary,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          flex: 2,
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
              phoneController: _phoneNumberController,
              onSuffixIconTap: () {
                _phoneNumberController.clear();
                bloc.add(PhoneNumberChanged(''));
              },
              onChanged: (String value) {
                bloc.add(PhoneNumberChanged(_phoneNumberController.text));
              },
            ),
          ),
        ),
      ],
    );
  }
}
