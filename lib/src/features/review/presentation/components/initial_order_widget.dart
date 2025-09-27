import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/core/router/router.dart';
import 'package:my_point/src/features/review/presentation/components/custom_alert_dialog.dart';
import 'package:my_point/src/features/review/presentation/components/order_info_widget.dart';

class InitialOrderWidget extends StatelessWidget {
  const InitialOrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: context.colors.white, borderRadius: const BorderRadius.all(Radius.circular(12))),
      child: Column(
        children: [
          OrderInfoWidget(
            title: 'Документы, до 2 кг',
            subtitle: 'Иван Иванов',
            from: 'РК, Астана',
            to: 'РК, Алматы',
            date: 'до 06.10.2025',
            price: '5000 ₸',
          ),
          SizedBox(height: 16),
          OrderStatusWidget(title: 'Откликов: 1', subtitle: 'Просмотров: 10'),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => CustomAlertDialog(
                        backgorundColor: context.colors.white,
                        iconColor: context.colors.black,
                        title: context.loc.cancelOrder,
                        subtitle: context.loc.areYouSureYouWantToCancelTheOrder,
                      ),
                    );
                  },
                  child: Text(context.loc.cancelOrder, textAlign: TextAlign.center),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    context.push(RoutePaths.orderDetails);
                  },
                  child: Text(context.loc.editOrder),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    context.push(RoutePaths.responses);
                  },
                  child: Text(context.loc.responses),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: context.colors.blue.withValues(alpha: 0.6),
              borderRadius: const BorderRadius.all(Radius.circular(16)),
            ),
            child: Text(
              context.loc.yourOrderIsVisibleToCarriers,
              style: context.typography.interText14.copyWith(color: context.colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class OrderStatusWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  const OrderStatusWidget({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: context.typography.interText14.copyWith(color: context.colors.gray)),
        Text(subtitle, style: context.typography.interText14.copyWith(color: context.colors.gray)),
      ],
    );
  }
}
