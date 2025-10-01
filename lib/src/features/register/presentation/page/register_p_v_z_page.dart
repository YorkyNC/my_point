import 'package:my_point/src/app/imports.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';

class RegisterPVZPage extends StatelessWidget {
  const RegisterPVZPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.white,
      appBar: AppBar(
        backgroundColor: context.colors.white,
        title: Text('Шаг 1'),
        titleTextStyle: context.typography.title.copyWith(color: context.colors.black),
      ),
      body: const Center(
        child: Text('Register PVZ Page'),
      ),
    );
  }
}
