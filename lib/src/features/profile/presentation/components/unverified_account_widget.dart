import 'package:flutter_svg/svg.dart';
import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';

class UnverifiedAccountWidget extends StatelessWidget {
  const UnverifiedAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: context.colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // SvgPicture.asset(context.assetImages.emptyStatePicture, width: 40, height: 40),
              SizedBox(width: 8),
              Text(
                'Неверифицированный аккаунт',
                style: context.typography.inter16Bold.copyWith(color: context.colors.black),
              ),
            ],
          ),
          Text(
            'Для полноценного использования всех возможностей сервиса и обеспечения безопасности ваших заказов необходимо пройти верификацию.',
            style: context.typography.interText14.copyWith(color: context.colors.gray),
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(onPressed: () {}, child: Text('Пройти верификацию')),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
