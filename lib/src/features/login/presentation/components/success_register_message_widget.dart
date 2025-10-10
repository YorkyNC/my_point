import 'package:flutter_svg/svg.dart';
import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/core/router/router.dart';

class SuccessRegisterMessageWidget extends StatelessWidget {
  const SuccessRegisterMessageWidget({
    super.key,
    required Animation<double> logoAnimation,
    required this.isSignUpVerified,
  }) : _logoAnimation = logoAnimation;
  final bool isSignUpVerified;
  final Animation<double> _logoAnimation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _logoAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _logoAnimation.value,
                  child: SvgPicture.asset(context.assetImages.successSvg),
                );
              },
            ),
            SizedBox(height: 16),
            Text(
              textAlign: TextAlign.center,
              'Поздравляю, вы \nзарегистрированы!',
              style: context.typography.title.copyWith(
                color: context.colors.textprimary,
                height: 1.2,
              ),
            ),
            SizedBox(height: 8),
            Text(
              textAlign: TextAlign.center,
              'теперь осталось заполнить данные о вашем пункте выдачи заказов',
              style: context.typography.smallParagraph.copyWith(
                color: context.colors.textprimary,
              ),
            ),
            SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      // context.pop(); // maybe delete this line

                      isSignUpVerified ? context.push(RoutePaths.agreement) : context.push(RoutePaths.home);
                    },
                    child: Text('Далее'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
