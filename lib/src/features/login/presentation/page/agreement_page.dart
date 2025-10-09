import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/features/login/presentation/components/__agreement_pdf_viewer.dart';

class AgreementPage extends StatelessWidget {
  const AgreementPage({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: AgreementPdfViewer(),
    );
  }
}
