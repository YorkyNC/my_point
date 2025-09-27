import 'package:flutter_svg/svg.dart';
import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/features/review/presentation/components/accepted_order_widget.dart';
import 'package:my_point/src/features/review/presentation/components/initial_order_widget.dart';

class SenderReviewPage extends StatelessWidget {
  const SenderReviewPage({super.key});

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
                      context.loc.sender,
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
              padding: const EdgeInsets.all(16),
              child: Text(
                context.loc.myOrders,
                style: context.typography.inter16Bold.copyWith(color: context.colors.black),
              ),
            ),
            AcceptedOrderWidget(),
            SizedBox(height: 16),
            InitialOrderWidget(),
          ],
        ),
      ),
    );
  }
}
