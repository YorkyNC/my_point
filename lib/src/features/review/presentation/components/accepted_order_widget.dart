import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/core/router/router.dart';
import 'package:my_point/src/features/review/presentation/components/fly_and_code_widget.dart';
import 'package:my_point/src/features/review/presentation/components/order_info_wdget.dart';
import 'package:my_point/src/features/review/presentation/components/order_info_widget.dart';

class AcceptedOrderWidget extends StatelessWidget {
  const AcceptedOrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(RoutePaths.acceptedOrderDetails);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: context.colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: Column(
              children: [
                Text(
                  'Ваша посылка в пути',
                  style: context.typography.inter14Bold.copyWith(color: context.colors.black),
                ),
                SizedBox(height: 16),
                Row(
                  spacing: 6.5,
                  children: [
                    OrderInfoWdget(isImage: true, subtitle: 'Иван Иванов'),
                    OrderInfoWdget(isImage: false, subtitle: 'Чат с водителем', icon: Icons.chat, onTap: () {}),
                    OrderInfoWdget(
                      isImage: false,
                      subtitle: 'Поддержка',
                      icon: Icons.support_agent,
                      onTap: () {
                        context.push(RoutePaths.support);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Container(width: double.infinity, height: 1, color: context.colors.dividerColor),
                SizedBox(height: 16),
                OrderInfoWidget(
                  title: 'Документы, до 2 кг',
                  subtitle: 'Иван Иванов',
                  from: 'РК, Астана',
                  to: 'РК, Алматы',
                  date: 'до 06.10.2025',
                  price: '5000 ₸',
                ),
                SizedBox(height: 16),
                FlyAndCodeWidget(title: 'Рейс', flyName: 'FlyArystan', flyNumber: 'IQ 360 ₸'),
                SizedBox(height: 16),
                FlyAndCodeWidget(title: 'Код подтверждения', isCode: true),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(onPressed: () {}, child: Text(context.loc.shareWithReciver)),
                    ),
                  ],
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
