package kz.my_point.app

import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.plugins.FlutterPlugin

/**
 * Helper class for Flutter plugin registration.
 * This helps avoid issues with deferred components and Play Core libraries.
 */
class FlutterHelper {
    companion object {
        /**
         * Ensures all plugins are registered with the Flutter engine.
         * This method should be called after the usual plugin registration process.
         */
        fun ensurePluginsRegistered(flutterEngine: FlutterEngine) {
            // The default plugin registration is handled by Flutter itself
            // This is just a hook to add any extra handling if needed
        }
    }
} 