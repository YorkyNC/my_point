import 'package:flutter_svg/svg.dart';
import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/core/router/router.dart';

class PersonalIdentificationPage extends StatelessWidget {
  const PersonalIdentificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Spacer(),
                  TextButton(
                    onPressed: () => context.pop(),
                    child: Text(
                      context.loc.skip,
                      style: context.typography.interText12.copyWith(
                        color: context.colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 33),
              Text(
                context.loc.personalIdentification,
                style: context.typography.interTitlle20Semibold.copyWith(
                  color: context.colors.black,
                ),
              ),
              SizedBox(height: 16),
              // SvgPicture.asset(
              //   context.assetImages.personalIdentification,
              //   width: MediaQuery.of(context).size.width,
              // ),
              SizedBox(height: 16),
              Text(
                'Для вашего спокойствия и доверия в нашем сообществе, пожалуйста, пройдите подтверждение личности. Это займет не более 2 минут',
                style: context.typography.interText16.copyWith(
                  color: context.colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              Spacer(),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(),
                      onPressed: () {
                        context.push(RoutePaths.identification);
                      },
                      child: Text(
                        context.loc.continueNext,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
