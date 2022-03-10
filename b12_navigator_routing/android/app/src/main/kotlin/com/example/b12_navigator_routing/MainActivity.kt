package com.example.b12_navigator_routing

import android.os.Build
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "BACH_CHANNEL"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler(
                MethodChannel.MethodCallHandler { call, result ->
                    if (call.method == "getVersion") {
                        result.success("Android: " + Build.VERSION.RELEASE)
                    } else result.notImplemented()
                })
    }
}
