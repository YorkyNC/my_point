import 'package:logger/logger.dart';

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
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
    overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom],
  );

  try {} catch (e) {
    debugPrint('Plugin registration error: $e');
  }

  await storageService.init();

  runApp(
    AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Material(
        child: const MainApp(
          flavor: AppFlavor.production,
        ),
      ),
    ),
  );

  await _initializeApp();
}

Future<void> _initializeApp() async {
  try {
    await configureDependencies();
    // await FirebaseManager.initialize();
    // Initialize chat service
    // await ChatService.initializeChat();
    // Prevent landscape mode
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  } catch (e) {
    debugPrint('App initialization error: $e');
  }
}
