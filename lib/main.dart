import 'package:logger/logger.dart';
import 'package:my_point/src/core/network/network_status_notifier.dart';
import 'package:provider/provider.dart';

import 'src/app/application.dart';
import 'src/app/imports.dart';
import 'src/core/services/injectable/injectable_service.dart';
import 'src/core/services/storage/storage_service_impl.dart';

class CustomFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}

final StorageServiceImpl storageService = StorageServiceImpl();
final log = Logger(
  filter: CustomFilter(),
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 5,
    lineLength: 120,
    printEmojis: true,
    levelColors: {
      Level.error: AnsiColor.none(),
      Level.warning: AnsiColor.none(),
      Level.info: AnsiColor.none(),
      Level.debug: AnsiColor.none(),
      Level.fatal: AnsiColor.none(),
    },
    levelEmojis: {
      Level.error: '🚨',
      Level.warning: '⚠️',
      Level.info: '💡',
      Level.fatal: '💀',
    },
    noBoxingByDefault: false,
    excludeBox: {
      Level.trace: true,
    },
  ),
);

void main([List<String>? args, AppFlavor flavor = AppFlavor.development]) async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Initialize storage first to avoid late initialization errors
  await storageService.init();

  // Start with loading screen
  runApp(
    Material(
      child: const MainApp(
        flavor: AppFlavor.production,
      ),
    ),
  );

  // Initialize remaining services in background
  await _initializeApp();
}

Future<void> _initializeApp() async {
  try {
    await configureDependencies();
    // await FirebaseManager.initialize();
    // Initialize chat service
    // await ChatService.initializeChat();
    // Prevent landscape mode
    UIHelpers.statusBarTheme();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  } catch (e) {
    debugPrint('App initialization error: $e');
  }
}
