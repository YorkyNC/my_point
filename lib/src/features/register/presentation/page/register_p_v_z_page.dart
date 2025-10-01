import 'package:flutter/cupertino.dart';
import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/features/login/presentation/components/unregistered_user_text_field.dart';
import 'package:my_point/src/features/register/presentation/components/register_p_v_z_page.dart';

class RegisterPVZPage extends StatefulWidget {
  const RegisterPVZPage({super.key});

  @override
  State<RegisterPVZPage> createState() => _RegisterPVZPageState();
}

class _RegisterPVZPageState extends State<RegisterPVZPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _totalAreaController = TextEditingController();
  final TextEditingController _entranceController = TextEditingController();
  final TextEditingController _apartmentController = TextEditingController();
  final TextEditingController _floorController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(
            CupertinoIcons.chevron_left,
            color: context.colors.textprimary,
          ),
        ),
        backgroundColor: context.colors.white,
        title: Text('Шаг 1'),
        titleTextStyle: context.typography.mediumParagraph.copyWith(color: context.colors.black),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text(
              'закрыть'.toUpperCase(),
              style: context.typography.smallParagraphMedium2.copyWith(
                color: context.colors.accent2,
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: LinearProgressIndicator(
            color: context.colors.mainAccent,
            backgroundColor: context.colors.gray100,
            minHeight: 2,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 14),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text('Общие сведения',
                      style: context.typography.title.copyWith(color: context.colors.textprimary)),
                ),
                SizedBox(height: 20),
                UnregisteredUserTextField(hintText: 'Наименование ПВЗ', controller: _nameController),
                SizedBox(height: 20),
                UnregisteredUserTextField(hintText: 'Общая площадь', controller: _totalAreaController),
                SizedBox(height: 40),
                UnregisteredListTile(title: 'Населенный пункт', subtitle: 'г. Алматы'),
                SizedBox(height: 24),
                UnregisteredListTile(title: 'улица, дом', subtitle: 'Введите адрес'),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(child: UnregisteredUserTextField(hintText: 'Подъезд', controller: _entranceController)),
                    SizedBox(width: 16),
                    Expanded(
                        child:
                            UnregisteredUserTextField(hintText: '№ квартиры/офиса', controller: _apartmentController)),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(child: UnregisteredUserTextField(hintText: 'Этаж', controller: _floorController)),
                    SizedBox(width: 16),
                    Expanded(child: UnregisteredUserTextField(hintText: 'Домофон', controller: _phoneController)),
                  ],
                ),
                SizedBox(height: 20),
                UnregisteredUserTextField(hintText: 'Комментарии', controller: _commentController),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                            onPressed: _phoneController.text.isNotEmpty ? () {} : null, child: Text('Далее'))),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
