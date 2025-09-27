import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/features/profile/domain/enum/currency_type.dart';
import 'package:my_point/src/features/profile/presentation/components/currency_tile_widget.dart';

class CurrencySelectionPage extends StatelessWidget {
  const CurrencySelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.bgWhite,
      appBar: AppBar(
        backgroundColor: context.colors.bgWhite,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(context.icons.chevron_left, color: context.colors.black),
        ),
        title: Text(
          'Валюта',
          style: context.typography.inter16Bold.copyWith(color: context.colors.black),
        ), // Fixed title
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Scrollable content with ListView
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return CurrencyTileWidget(
                      title: CurrencyType.values[index].name,
                      value: CurrencyType.values[index].name,
                      groupValue: CurrencyType.values[index].name,
                      onChanged: (value) {
                        value;
                      },
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(height: 16),
                  itemCount: CurrencyType.values.length,
                ),
              ),
              // Fixed button at bottom
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Сохранить',
                        style: context.typography.interText16.copyWith(color: context.colors.white),
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
