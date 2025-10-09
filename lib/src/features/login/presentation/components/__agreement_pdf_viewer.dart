import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/api/client/endpoints.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/core/router/router.dart';
import 'package:my_point/src/features/login/presentation/components/privacy_policy_widget.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';

class AgreementPdfViewer extends StatefulWidget {
  const AgreementPdfViewer({super.key});

  @override
  State<AgreementPdfViewer> createState() => AgreementPdfViewerState();
}

class AgreementPdfViewerState extends State<AgreementPdfViewer> {
  final PdfViewerController _pdfController = PdfViewerController();
  @override
  void dispose() {
    _pdfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final pdfPreviewHeight = screenHeight * 0.6;

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Подписание договора на открытие ПВЗ',
                style: context.typography.title.copyWith(color: context.colors.textprimary),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: pdfPreviewHeight,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SfPdfViewer.asset(
                    'assets/documents/agreement.pdf',
                    controller: _pdfController,
                    pageLayoutMode: PdfPageLayoutMode.single,
                    enableDoubleTapZooming: false,
                    canShowScrollHead: false,
                    canShowScrollStatus: false,
                    enableTextSelection: false,
                    interactionMode: PdfInteractionMode.pan,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  final Uri url = Uri.parse(EndPoints.agreement);
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
                },
                style: ElevatedButton.styleFrom(),
                child: Text('Посмотреть договор'),
              ),
              const SizedBox(height: 24),
              // Continue Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.colors.mainAccent,
                  foregroundColor: context.colors.white,
                ),
                onPressed: () {
                  context.push(RoutePaths.verification);
                },
                child: Text(
                  'Дальше',
                ),
              ),
              const SizedBox(height: 24),
              PrivacyPolicyWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
