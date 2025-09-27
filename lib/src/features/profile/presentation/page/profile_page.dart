import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/features/profile/presentation/components/change_mode_widget.dart';
import 'package:my_point/src/features/profile/presentation/components/settings_widget.dart';
import 'package:my_point/src/features/profile/presentation/components/verified_account_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colors.bgWhite,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(context.loc.profile, style: context.typography.inter16Bold.copyWith(color: context.colors.black)),
      ),
      backgroundColor: context.colors.bgWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 8),
              Column(
                children: [
                  // UnverifiedAccountWidget(),
                  VerifiedAccountWidget(),
                  SizedBox(height: 8),
                  ChangeModeWidget(),
                  SizedBox(height: 8),
                  SettingsWidget(),
                  SizedBox(height: 28),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      // context.pop();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.logout, color: context.colors.red),
                        SizedBox(width: 8),
                        Text(
                          context.loc.logout,
                          style: context.typography.inter16Bold.copyWith(color: context.colors.red),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
