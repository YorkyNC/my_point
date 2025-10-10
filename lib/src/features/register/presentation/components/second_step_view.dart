import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/features/register/domain/request/register_pvz_request.dart';
import 'package:my_point/src/features/register/presentation/components/register_picture_paragraph_widget.dart';
import 'package:my_point/src/features/register/presentation/page/bloc/register_pvz_bloc.dart';

class SecondStepView extends StatelessWidget {
  const SecondStepView({
    super.key,
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
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                children: [
                  RegisterPictureParagraphWidget(
                    title: 'Фото входа в помещение*',
                    subtitle:
                        'Вы можете добавить от 4 до 10 фотографий - сфокусируйтесь на особенностях для полного понимания',
                    photos: state.photoOfTheEntranceToTheRoom ?? [],
                    onPhotosChanged: (photos) {
                      bloc.add(RegisterPvzPhotoOfTheEntranceToTheRoomChanged(photos));
                    },
                  ),
                  RegisterPictureParagraphWidget(
                    title: 'Общее фото помещения*',
                    subtitle:
                        'Вы можете добавить от 4 до 10 фотографий - сфокусируйтесь на особенностях для полного понимания',
                    photos: state.photoOfTheRoom ?? [],
                    onPhotosChanged: (photos) {
                      bloc.add(RegisterPvzPhotoOfTheRoomChanged(photos));
                    },
                  ),
                  RegisterPictureParagraphWidget(
                    isSecond: true,
                    title: 'Место для стелажа*',
                    subtitle: 'Добавьте фото места для брендированного стелажа',
                    photos: state.photoOfThePlaceForShelving ?? [],
                    onPhotosChanged: (photos) {
                      bloc.add(RegisterPvzPhotoOfThePlaceForShelvingChanged(photos));
                    },
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: state.isLoading || !state.isSecondStepValid || !state.isFirstStepValid
                              ? null
                              : () {
                                  bloc.add(
                                    Submit(
                                      RegisterPvzRequest(
                                        name: state.name ?? '',
                                        square: state.totalArea ?? '',
                                        city: state.city ?? '',
                                        address: state.address ?? '',
                                        files: [
                                          ...state.photoOfTheEntranceToTheRoom ?? [],
                                          ...state.photoOfTheRoom ?? [],
                                          ...state.photoOfThePlaceForShelving ?? [],
                                        ],
                                        latitude: 43.25152134030066,
                                        longitude: 76.85152134030066,
                                      ),
                                    ),
                                  );
                                },
                          child: state.isLoading
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(strokeWidth: 2),
                                )
                              : Text('Отправить'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
