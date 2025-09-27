import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

/// Colorized logger service that provides beautiful colored logs in VS Code debug console
/// Based on the approach from: https://dev.to/mikehanna/colorized-logging-for-flutter-development-with-vs-code-3afj
class ColorizedLoggerService {
  static bool _initialized = false;

  /// Initialize the colorized logging system
  static void initRootLogger() {
    if (_initialized) return;

    // Only enable logging for debug mode
    if (kDebugMode) {
      Logger.root.level = Level.ALL;
    } else {
      Logger.root.level = Level.OFF;
    }

    hierarchicalLoggingEnabled = true;

    Logger.root.onRecord.listen((record) {
      if (!kDebugMode) {
        return;
      }

      // ANSI color codes for different log levels
      var start = '\x1b[90m'; // Gray for default
      const end = '\x1b[0m'; // Reset
      const white = '\x1b[37m'; // White for timestamp

      switch (record.level.name) {
        case 'FINEST':
        case 'FINER':
        case 'FINE':
          start = '\x1b[90m'; // Gray - blend into background
          break;
        case 'INFO':
          start = '\x1b[94m'; // Bright blue - matches our VS Code color scheme
          break;
        case 'WARNING':
          start = '\x1b[93m'; // Bright yellow - matches our warning color
          break;
        case 'SEVERE':
          start = '\x1b[91m'; // Bright red - matches our error color
          break;
        case 'SHOUT':
          start = '\x1b[41m\x1b[93m'; // Red background + yellow text
          break;
        default:
          start = '\x1b[95m'; // Magenta for debug/trace
          break;
      }

      final message =
          '$white${record.time}:$end$start${record.level.name}: ${record.message}$end';

      developer.log(
        message,
        name: record.loggerName.padRight(25),
        level: record.level.value,
        time: record.time,
      );
    });

    _initialized = true;
  }

  /// Create a named logger for a specific class
  static Logger getLogger(String className) {
    return Logger(className);
  }

  /// Set specific logging level for a class (useful for debugging specific areas)
  static void setLoggerLevel(String className, Level level) {
    Logger(className).level = level;
  }

  /// Generate example logs for testing
  static void generateExampleLogs(Logger logger) {
    if (!kDebugMode) return;

    logger.finest('FINEST: Very detailed debug info');
    logger.finer('FINER: Detailed debug info');
    logger.fine('FINE: Debug info');
    logger.info('INFO: General information');
    logger.warning('WARNING: Something might be wrong');
    logger.severe('SEVERE: Something is definitely wrong');
    logger.shout('SHOUT: Critical error!');
  }
}

/// Extension to make logging more convenient
extension LoggerExtensions on Logger {
  /// Log a debug message (maps to fine level)
  void debug(String message) => fine(message);

  /// Log a trace message (maps to finest level)
  void trace(String message) => finest(message);

  /// Log an error with optional error object and stack trace
  void error(String message, [Object? error, StackTrace? stackTrace]) {
    severe(message, error, stackTrace);
  }
}
