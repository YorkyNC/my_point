package kz.my_point.app

import android.content.Context
import androidx.multidex.MultiDexApplication
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor

// Using MultiDexApplication for better compatibility
class Application : MultiDexApplication() {
    lateinit var flutterEngine: FlutterEngine

    override fun onCreate() {
        super.onCreate()
        
        try {
            // Pre-warm the Flutter engine
            flutterEngine = FlutterEngine(this)
            flutterEngine.dartExecutor.executeDartEntrypoint(
                DartExecutor.DartEntrypoint.createDefault()
            )
            
            // Cache the pre-warmed engine
            FlutterEngineCache.getInstance().put("default_engine_id", flutterEngine)
        } catch (e: Exception) {
            // Log the error and continue - don't crash the app
            android.util.Log.e("Application", "Error initializing Flutter engine", e)
        }
    }
    
    override fun attachBaseContext(base: Context) {
        super.attachBaseContext(base)
        // Initialize MultiDex
        androidx.multidex.MultiDex.install(this)
    }
} 