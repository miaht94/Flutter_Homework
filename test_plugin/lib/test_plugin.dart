
import 'dart:async';

import 'package:flutter/services.dart';

class TestPlugin {
  static const MethodChannel _channel = MethodChannel('test_plugin');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
  
  static Future<void> openBrowser(String urlString) async { 
   try {
      final bool result = await _channel.invokeMethod(
         'openBrowser', <String, String>{ 'url': urlString }
      );
   }
   on PlatformException catch (e) { 
      // Unable to open the browser print(e); 
   } 
}

}

