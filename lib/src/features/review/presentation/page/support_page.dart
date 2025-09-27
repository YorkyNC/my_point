import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/features/review/presentation/components/support_item_widget.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.bgWhite,
      appBar: AppBar(
        backgroundColor: context.colors.white,
        title: Text('Поддержка'),
        titleTextStyle: context.typography.inter16Bold.copyWith(color: context.colors.black),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(color: context.colors.gray25, shape: BoxShape.circle),
              child: Icon(Icons.close_outlined, size: 16, color: context.colors.black),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: context.colors.white, borderRadius: BorderRadius.circular(16)),
              child: Column(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('FAQ', style: context.typography.inter14Bold.copyWith(color: context.colors.gray)),
                  SupportItemWidget(title: 'Как быстро доставят товар?', subtitle: '123'),
                  SupportItemWidget(
                    title: 'Сколько стоит перевозка?',
                    subtitle:
                        'Цена перевозки указана и обговорена заранее, вы можете ее посмотреть в деталях вашей перевозки.',
                  ),
                  SupportItemWidget(title: 'Что делать если перевозчик не отвечает?', subtitle: '123'),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: context.colors.white, borderRadius: BorderRadius.circular(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  Text('Чат с поддержкой', style: context.typography.inter16Bold.copyWith(color: context.colors.black)),
                  Text(
                    'Не нашли нужного вам ответа? Обратитесь на прямую к нашему ассистенту поддержки.',
                    style: context.typography.interText14.copyWith(color: context.colors.gray),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Связаться с поддержкой',
                            style: context.typography.inter16Bold.copyWith(color: context.colors.white),
                          ),
                        ),
                      ),
                    ],
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
