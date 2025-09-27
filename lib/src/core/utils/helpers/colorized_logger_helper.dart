import 'package:logging/logging.dart';

import '../../services/logging/colorized_logger_service.dart';

/// Helper class for easy colorized logging throughout the app
/// Usage: ColorizedLoggerHelper.info('MyClass', 'My message');
class ColorizedLoggerHelper {
  static final Map<String, Logger> _loggers = {};

  /// Get or create a logger for a specific class/service
  static Logger _getLogger(String className) {
    return _loggers.putIfAbsent(
      className,
      () => ColorizedLoggerService.getLogger(className),
    );
  }

  /// Log a trace message (finest level - very detailed debug info)
  static void trace(String className, String message) {
    _getLogger(className).trace(message);
  }

  /// Log a debug message (fine level - debug info)
  static void debug(String className, String message) {
    _getLogger(className).debug(message);
  }

  /// Log an info message (info level - general information)
  static void info(String className, String message) {
    _getLogger(className).info(message);
  }

  /// Log a warning message (warning level - something might be wrong)
  static void warning(String className, String message) {
    _getLogger(className).warning(message);
  }

  /// Log an error message (severe level - something is wrong)
  static void error(String className, String message,
      [Object? error, StackTrace? stackTrace]) {
    _getLogger(className).error(message, error, stackTrace);
  }

  /// Log a critical error (shout level - critical error)
  static void critical(String className, String message,
      [Object? error, StackTrace? stackTrace]) {
    _getLogger(className).shout(message, error, stackTrace);
  }

  /// Set logging level for a specific class (useful for debugging)
  /// Example: ColorizedLoggerHelper.setLevel('MyClass', Level.ALL);
  static void setLevel(String className, Level level) {
    ColorizedLoggerService.setLoggerLevel(className, level);
  }

  /// Generate example logs for testing the colorized output
  static void generateExamples(String className) {
    final logger = _getLogger(className);
    ColorizedLoggerService.generateExampleLogs(logger);
  }
}
