import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injectable_service.config.dart';
import 'manual_register_services.dart';

final GetIt getIt = GetIt.instance;
@InjectableInit()
Future<void> configureDependencies() async {
  await getIt.init();
  manualRegisterServices();
}
