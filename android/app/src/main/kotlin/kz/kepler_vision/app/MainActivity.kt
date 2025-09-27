package kz.my_point.app

import android.os.Bundle
import android.view.WindowManager
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.plugins.GeneratedPluginRegistrant

// Use standard FlutterActivity without Play Store integration
class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        
        // TODO: Uncomment this to prevent screenshots on Android
        // window.setFlags(
        //     WindowManager.LayoutParams.FLAG_SECURE,
        //     WindowManager.LayoutParams.FLAG_SECURE
        // )
    }
    
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        // Register plugins with the Flutter standard approach
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        
        // Add our extra handling
        FlutterHelper.ensurePluginsRegistered(flutterEngine)
    }
    
    // Use cached engine if available
    override fun getCachedEngineId(): String? {
        return "default_engine_id"
    }
} 