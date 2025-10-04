import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/core/widgets/popups/sheet_popup.dart';
import 'package:my_point/src/features/login/presentation/components/unregistered_user_text_field.dart';
import 'package:my_point/src/features/register/presentation/components/address_picker.dart';
import 'package:my_point/src/features/register/presentation/components/city_picker.dart';
import 'package:my_point/src/features/register/presentation/components/unregistered_list_tile.dart';
import 'package:my_point/src/features/register/presentation/page/bloc/register_pvz_bloc.dart';

class FirstStepView extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController totalAreaController;
  final TextEditingController entranceController;
  final TextEditingController apartmentController;
  final TextEditingController floorController;
  final TextEditingController phoneController;
  final TextEditingController commentController;
  final VoidCallback onNext;

  const FirstStepView({
    super.key,
    required this.nameController,
    required this.totalAreaController,
    required this.entranceController,
    required this.apartmentController,
    required this.floorController,
    required this.phoneController,
    required this.commentController,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterPvzBloc, RegisterPvzState>(
      builder: (context, state) {
        final bloc = context.read<RegisterPvzBloc>();
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 14),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      'Общие сведения',
                      style: context.typography.title.copyWith(
                        color: context.colors.textprimary,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  UnregisteredUserTextField(
                    hintText: 'Наименование ПВЗ',
                    controller: nameController,
                    onChanged: (value) => bloc.add(RegisterPvzNameChanged(value)),
                  ),
                  SizedBox(height: 20),
                  UnregisteredUserTextField(
                    hintText: 'Общая площадь',
                    controller: totalAreaController,
                    onChanged: (value) => bloc.add(RegisterPvzTotalAreaChanged(value)),
                  ),
                  SizedBox(height: 40),
                  UnregisteredListTile(
                    title: 'Населенный пункт',
                    subtitle: state.city?.isNotEmpty == true ? state.city! : 'Выберите город',
                    onTap: () async {
                      final city = await showSheetPopup(
                        context,
                        title: Text('Выберите город'),
                        builder: (context) {
                          return CityPicker();
                        },
                      );
                      if (city != null) {
                        bloc.add(RegisterPvzCityChanged(city));
                      }
                    },
                  ),
                  SizedBox(height: 24),
                  UnregisteredListTile(
                    title: 'улица, дом',
                    subtitle: state.address?.isNotEmpty == true ? state.address! : 'Введите адрес',
                    onTap: () async {
                      final address = await showSheetPopup(
                        context,
                        title: Text('Введите адрес'),
                        builder: (context) {
                          return AddressPicker();
                        },
                      );
                      if (address != null) {
                        bloc.add(RegisterPvzAddressChanged(address));
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: UnregisteredUserTextField(
                          hintText: 'Подъезд',
                          controller: entranceController,
                          onChanged: (value) => bloc.add(RegisterPvzEntranceChanged(value)),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: UnregisteredUserTextField(
                          hintText: '№ квартиры/офиса',
                          controller: apartmentController,
                          onChanged: (value) => bloc.add(RegisterPvzApartmentChanged(value)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: UnregisteredUserTextField(
                          hintText: 'Этаж',
                          controller: floorController,
                          onChanged: (value) => bloc.add(RegisterPvzFloorChanged(value)),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: UnregisteredUserTextField(
                          hintText: 'Домофон',
                          controller: phoneController,
                          onChanged: (value) => bloc.add(RegisterPvzIntercomChanged(value)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  UnregisteredUserTextField(
                    hintText: 'Комментарии',
                    controller: commentController,
                    onChanged: (value) => bloc.add(RegisterPvzCommentChanged(value)),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: state.isFirstStepValid
                              ? () {
                                  bloc.add(ValidateFirstStep(
                                    nameController.text,
                                    totalAreaController.text,
                                    'г. Алматы',
                                    '',
                                    entranceController.text,
                                    apartmentController.text,
                                    floorController.text,
                                    phoneController.text,
                                    commentController.text,
                                  ));
                                  onNext();
                                }
                              : null,
                          child: Text('Далее'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
