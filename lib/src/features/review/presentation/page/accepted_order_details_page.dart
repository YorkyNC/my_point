import 'package:flutter_svg/svg.dart';
import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/features/create_delivery/presentation/components/builde_selectable_field.dart';
import 'package:my_point/src/features/review/presentation/components/initial_order_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AcceptedOrderDetailsPage extends StatefulWidget {
  const AcceptedOrderDetailsPage({super.key});

  @override
  State<AcceptedOrderDetailsPage> createState() => _AcceptedOrderDetailsPageState();
}

class _AcceptedOrderDetailsPageState extends State<AcceptedOrderDetailsPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.bgWhite,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(context.icons.chevron_left, color: context.colors.black),
        ),
        title: Text(
          context.loc.acceptedOrderDetails,
          style: context.typography.inter16Medium.copyWith(color: context.colors.black),
        ),
        backgroundColor: context.colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(color: context.colors.white),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    child: Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Stack(
                            children: [
                              PageView(
                                controller: _pageController,
                                onPageChanged: (index) {
                                  setState(() {
                                    _currentPage = index;
                                  });
                                },
                                children: [
                                  ClipRRect(child: Image.asset('assets/app_images/example.jpg', fit: BoxFit.cover)),
                                  ClipRRect(child: Image.asset('assets/app_images/example.jpg', fit: BoxFit.cover)),
                                  ClipRRect(child: Image.asset('assets/app_images/example.jpg', fit: BoxFit.cover)),
                                ],
                              ),
                              // Page indicator positioned at bottom of image
                              Positioned(
                                bottom: 16,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: SmoothPageIndicator(
                                    controller: _pageController,
                                    count: 3,
                                    effect: WormEffect(
                                      dotHeight: 8,
                                      dotWidth: 8,
                                      spacing: 8,
                                      dotColor: context.colors.gray,
                                      activeDotColor: context.colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            spacing: 16,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  // SvgPicture.asset(context.assetImages.docSvg),
                                  SizedBox(width: 8),
                                  Text(
                                    'Документы, до 2 кг',
                                    style: context.typography.inter14Bold.copyWith(color: context.colors.black),
                                  ),
                                ],
                              ),
                              BuildeSelectableField(placeholder: 'Предлагаемая цена', isOnlyRead: true, value: '123'),
                              BuildeSelectableField(placeholder: 'Доставить', isOnlyRead: true, value: '123'),
                              BuildeSelectableField(placeholder: 'Куда доставить', isOnlyRead: true, value: '123'),
                              Text(
                                'Комментарий',
                                style: context.typography.inter14Bold.copyWith(color: context.colors.black),
                              ),
                              BuildeSelectableField(placeholder: 'Небольшая папка с документами', isOnlyRead: true),
                              OrderStatusWidget(title: 'Откликов: 1', subtitle: 'Просмотров: 10'),
                              Row(
                                children: [
                                  Expanded(
                                    child: OutlinedButton(onPressed: () {}, child: Text(context.loc.shareWithReciver)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
