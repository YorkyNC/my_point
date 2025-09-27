import 'package:flutter_svg/svg.dart';
import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/core/widgets/popups/sheet_popup.dart';
import 'package:my_point/src/features/create_delivery/presentation/components/image_upload_sheet.dart';
import 'package:my_point/src/features/profile/presentation/components/account_details_widget.dart';

class AccountDetailsPage extends StatelessWidget {
  const AccountDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.bgWhite,
      appBar: AppBar(
        backgroundColor: context.colors.bgWhite,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(context.icons.chevron_left, color: context.colors.black),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: InkWell(
                      onTap: () {
                        showSheetPopup(
                          context,
                          title: Text('Загрузить фото'),
                          builder: (context) => ImageUploadSheet(),
                        );
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Column(
                        children: [
                          // SvgPicture.asset(context.assetImages.emptyStatePicture, width: 60, height: 60),
                          SizedBox(height: 8),
                          Text(
                            'Загрузить фото',
                            style: context.typography.interText14.copyWith(color: context.colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Личные данные',
                        style: context.typography.inter16Bold.copyWith(color: context.colors.black),
                      ),
                      SizedBox(height: 16),
                      Column(
                        spacing: 8,
                        children: [
                          AccountDetailsWidget(title: 'Полное имя', value: 'MAGZHAN SATPAYEV'),
                          AccountDetailsWidget(title: 'Дата рождения', value: '1996-08-27'),
                          AccountDetailsWidget(title: 'Документ, удостоверение личности', value: '04********45'),
                          AccountDetailsWidget(title: 'Адрес', value: 'Алматы, Казахстан'),
                        ],
                      ),
                    ],
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
