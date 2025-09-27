import 'package:flutter_svg/svg.dart';
import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/features/review/presentation/components/transporter_filter_widget.dart';

class TransporterReviewPage extends StatelessWidget {
  const TransporterReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.bgWhite,
      appBar: AppBar(
        // title: SvgPicture.asset(context.assetImages.appBarLogo),
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: context.colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              spacing: 8,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 4,
                  children: [
                    Text(context.loc.mode, style: context.typography.interText8.copyWith(color: context.colors.gray)),
                    Text(
                      context.loc.transporter,
                      style: context.typography.interText10Semibold.copyWith(color: context.colors.black),
                    ),
                  ],
                ),
                // Center(child: SvgPicture.asset(context.assetImages.emptyStatePicture, width: 24, height: 24)),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4,
                children: [
                  Text(
                    context.loc.yourRoute,
                    style: context.typography.inter16Bold.copyWith(color: context.colors.black),
                  ),
                  Text(
                    'Настройте параметры вашего маршрута, чтоб видеть посылки, которые вы можете взять с собой',
                    style: context.typography.interText12.copyWith(color: context.colors.textGray),
                  ),
                ],
              ),
            ),
            // TransporterFilterWidget(),
          ],
        ),
      ),
    );
  }
}
