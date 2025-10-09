import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_point/src/core/api/client/endpoints.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPolicyWidget extends StatelessWidget {
  const PrivacyPolicyWidget({
    super.key,
  });

  Future<void> _openPrivacyPolicy() async {
    final Uri url = Uri.parse(EndPoints.privacyPolicy);
    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: LaunchMode.inAppWebView,
        webViewConfiguration: const WebViewConfiguration(
          enableJavaScript: true,
          enableDomStorage: true,
        ),
      );
    }
  }

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
            recognizer: TapGestureRecognizer()..onTap = _openPrivacyPolicy,
          ),
        ],
      ),
    );
  }
}
