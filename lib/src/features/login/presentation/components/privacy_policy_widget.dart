import 'package:flutter/cupertino.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';

class PrivacyPolicyWidget extends StatelessWidget {
  const PrivacyPolicyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Продолжая авторизацию, вы соглашаетесь со \nвсеми пунктами документов ',
            style: context.typography.extraSmallParagraph.copyWith(
              color: context.colors.lightSecondaryText,
            ),
          ),
          TextSpan(
            text: '«Условия пользования» и «Политика конфиденциальности»',
            style: context.typography.extraSmallParagraph.copyWith(
              color: context.colors.textprimary,
            ),
          ),
        ],
      ),
    );
  }
}
