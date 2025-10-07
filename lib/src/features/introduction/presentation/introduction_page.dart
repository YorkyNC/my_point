import 'package:flutter_svg/svg.dart';
import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/core/router/router.dart';
import 'package:my_point/src/core/widgets/animated_overlay_cards.dart';
import 'package:my_point/src/features/introduction/presentation/components/build_action_icon.dart';
import 'package:my_point/src/features/introduction/presentation/components/build_metric_box.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({super.key});

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/app_images/introduction_page.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  context.assetImages.myPointSecond,
                ),
                Text(
                  'Зарабатывай больше — твоя точка, твои правила',
                  style: context.typography.introTitle.copyWith(
                    color: context.colors.textSecondary,
                  ),
                ),
                Spacer(),
                Column(
                  children: [
                    AnimatedOverlayCards(
                      cards: [
                        OverlayCardData(
                          offset: const Offset(-5, 10),
                          rotation: -5.0,
                          backgroundColor: context.colors.introBackground1,
                          borderRadius: 8,
                          padding: const EdgeInsets.all(30),
                          hasBlur: false,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              BuildMetricBox(context: context, icon: context.icons.box, value: "20"),
                              BuildMetricBox(context: context, icon: context.icons.chart_line, value: "35%"),
                              BuildMetricBox(context: context, icon: context.icons.shopping_bag, value: "400"),
                            ],
                          ),
                        ),
                        OverlayCardData(
                          offset: const Offset(-5, -90),
                          rotation: 5.0,
                          backgroundColor: context.colors.introBackground2,
                          borderRadius: 8,
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Посылка',
                                        style: context.typography.extraSmallParagraph
                                            .copyWith(color: context.colors.lightGray),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        'AF302B',
                                        style: context.typography.title.copyWith(color: context.colors.textprimary),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 55,
                                    width: 120,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          right: 20,
                                          top: 0,
                                          child: Transform.rotate(
                                            angle: -8 * (3.14159 / 180),
                                            child: BuildActionIcon(
                                              icon: Icons.location_on,
                                              iconColor: context.colors.white,
                                              backgroundColor: context.colors.black,
                                              rotation: 0,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          right: 45,
                                          bottom: 0,
                                          child: Transform.rotate(
                                            angle: 5 * (3.14159 / 180),
                                            child: BuildActionIcon(
                                              icon: context.icons.delivery,
                                              iconColor: context.colors.white,
                                              backgroundColor: context.colors.gray700,
                                              rotation: 0,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          right: 0,
                                          bottom: 0,
                                          child: Transform.rotate(
                                            angle: 3 * (3.14159 / 180),
                                            child: BuildActionIcon(
                                              icon: context.icons.refresh,
                                              iconColor: context.colors.black,
                                              backgroundColor: context.colors.white,
                                              rotation: 0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              overlayColor: context.colors.mainAccent.withValues(alpha: 0.1),
                              backgroundColor: context.colors.mainAccent,
                            ),
                            onPressed: () {
                              context.go(RoutePaths.login);
                              st.setHasSeenIntroduction(true);
                            },
                            child: Row(
                              spacing: 8,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(context.loc.continueNext),
                                Icon(
                                  context.icons.arrow_right,
                                  color: context.colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
