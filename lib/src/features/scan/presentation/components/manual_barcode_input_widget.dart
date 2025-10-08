import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/features/login/presentation/components/unregistered_user_text_field.dart'
    show UnregisteredUserTextField;

class ManualBarcodeInputWidget extends StatelessWidget {
  const ManualBarcodeInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController barcodeController = TextEditingController();
    return Scaffold(
      backgroundColor: context.colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Сканирование посылок'),
        titleTextStyle: context.typography.mediumParagraph.copyWith(color: context.colors.black),
        backgroundColor: context.colors.white,
        foregroundColor: context.colors.black,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(context.icons.chevron_left),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              context.icons.help,
              size: 24,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UnregisteredUserTextField(
              keyboardType: TextInputType.number,
              hintText: 'Штрих-код',
              controller: barcodeController,
              onChanged: (value) {},
            ),
            SizedBox(height: 7),
            Text(
              'Введите штрих-код',
              style: context.typography.interlinear.copyWith(
                color: context.colors.black,
              ),
            ),
            SizedBox(height: 40),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.colors.mainAccent,
                      foregroundColor: context.colors.white,
                    ),
                    onPressed: barcodeController.text.isEmpty ? null : () {},
                    child: Text('Завершить приемку посылки'),
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
