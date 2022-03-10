package com.example.test_plugin;

import androidx.annotation.NonNull;
import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import io.flutter.plugin.common.*;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.embedding.engine.plugins.activity.*;
/** TestPlugin */
public class TestPlugin implements FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel; 
  private Activity activity; 
  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "test_plugin");
    // thisActivity = flutterPluginBinding.getApplicationContext();
    channel.setMethodCallHandler(this);
  }

  private void openBrowser(MethodCall call, Result result, String url) {
    Activity activity = this.activity;
      if (activity == null) {
         result.error("ACTIVITY_NOT_AVAILABLE",
            "Browser cannot be opened without foreground activity", null); 
         return; 
      }

    Intent intent = new Intent(Intent.ACTION_VIEW);
    intent.setData(Uri.parse(url));
    activity.startActivity(intent);
    result.success((Object) true);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else {
      String url = call.argument("url");
      if (call.method.equals("openBrowser")) {
        openBrowser(call, result, url);
      } else {
        result.notImplemented();
      }
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  public void onAttachedToActivity(ActivityPluginBinding activityPluginBinding) {
    // TODO: your plugin is now attached to an Activity
    this.activity = activityPluginBinding.getActivity();
  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {
    // TODO: the Activity your plugin was attached to was
    // destroyed to change configuration.
    // This call will be followed by onReattachedToActivityForConfigChanges().
  }

  @Override
  public void onReattachedToActivityForConfigChanges(ActivityPluginBinding activityPluginBinding) {
    // TODO: your plugin is now attached to a new Activity
    // after a configuration change.
  }

  @Override
  public void onDetachedFromActivity() {
    // TODO: your plugin is no longer associated with an Activity.
    // Clean up references.
  }


}