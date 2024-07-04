import 'dart:developer' as developer;

class LogUtil {
  static const String APP_TAG = "FLUTTERBLOCAPP";
  // Method to log the start of a method
  static void start(String methodName) {
    final timeStamp = DateTime.now().toIso8601String();
    developer.log("[$APP_TAG] START: $methodName", time: DateTime.now());
  }

  // Method to log the end of a method
  static void end(String methodName) {
    final timeStamp = DateTime.now().toIso8601String();
    developer.log("[$APP_TAG] END: $methodName", time: DateTime.now());
  }
  
}
