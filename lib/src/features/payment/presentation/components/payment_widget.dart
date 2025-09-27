import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/core/widgets/popups/sheet_popup.dart';
import 'package:my_point/src/features/payment/presentation/popup/payment_sheet.dart';
import 'package:my_point/src/features/profile/presentation/components/other_payment_method_item.dart';
import 'package:my_point/src/features/profile/presentation/components/payment_item_widget.dart';

class PaymentWidget extends StatelessWidget {
  const PaymentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Карты', style: context.typography.inter16Bold.copyWith(color: context.colors.black)),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PaymentItemWidget(
                  title: 'Привязать карту',
                  isAdd: true,
                  onTap: () {
                    showSheetPopup(
                      context,
                      backgroundColor: context.colors.white,
                      builder: (context) {
                        return PaymentSheet();
                      },
                    );
                  },
                ),
                SizedBox(height: 16),
                Divider(color: context.colors.gray, thickness: 1),
              ],
            ),
          ),
          SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Другие способы', style: context.typography.inter16Bold.copyWith(color: context.colors.black)),
              SizedBox(height: 16),
              OtherPaymentMethodItem(
                title: 'Google pay',
                image: 'assets/app_images/GooglePay.svg',
                value: 'google',
                groupValue: 'google',
                onChanged: (String? value) {},
              ),
              OtherPaymentMethodItem(
                title: 'Apple pay',
                image: 'assets/app_images/ApplePay.svg',
                value: 'apple',
                groupValue: 'apple',
                onChanged: (String? value) {},
              ),
              SizedBox(height: 16),
            ],
          ),
        ],
      ),
    );
  }
}
