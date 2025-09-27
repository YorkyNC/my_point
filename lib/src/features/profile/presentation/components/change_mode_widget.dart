import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/core/widgets/popups/sheet_popup.dart';
import 'package:my_point/src/features/profile/presentation/components/bullet_point_text.dart';

class ChangeModeWidget extends StatelessWidget {
  const ChangeModeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: context.colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Режим перевозчика', style: context.typography.inter16Bold.copyWith(color: context.colors.black)),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    showSheetPopup(
                      context,
                      builder: (context) {
                        return SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: 20),
                              Text(
                                'Вы хотите переключиться в режим перевозчика?',
                                textAlign: TextAlign.center,
                                style: context.typography.inter16Bold.copyWith(color: context.colors.black),
                              ),
                              SizedBox(height: 16),
                              BulletPointText(text: 'Максимальный размер: до формата А4 (21×29,7 см), толщина до 2 см'),
                              BulletPointText(text: 'Зарабатывать дополнительный доход во время поездок'),
                              BulletPointText(text: 'Общаться напрямую с отправителями и выбирать удобные заказы'),
                              BulletPointText(
                                text: 'Использовать удобный интерфейс для управления доставками и оплатой',
                              ),
                              SizedBox(height: 16),
                              Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        context.pop();
                                      },
                                      child: Text('Перейти в режим перевозчика'),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.sync, size: 16),
                      SizedBox(width: 4),
                      Flexible(child: Text('Переключиться в режим перевозчика', textAlign: TextAlign.center)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Text(
            'Переключитесь в режим перевозчика и начните получать дополнительный доход, перевозив посылки вместе с собой',
            style: context.typography.interText12.copyWith(color: context.colors.gray),
          ),
        ],
      ),
    );
  }
}
