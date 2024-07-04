import 'dart:developer' as developer;

class LogUtil {
  static const String APP_TAG = "FLUTTERBLOCAPP";
  // Method to log the start of a method
  static void start() {
    final timeStamp = DateTime.now().toIso8601String();
    final methodName = _getMethodName();
    developer.log("[$APP_TAG] START: $methodName", time: DateTime.now());
  }

  // Method to log the end of a method
  static void end() {
    final timeStamp = DateTime.now().toIso8601String();
    final methodName = _getMethodName();
    developer.log("[$APP_TAG] END: $methodName", time: DateTime.now());
  }

  // Private method to get the method name from the stack trace
  static String _getMethodName() {
    try {
      throw Exception();
    } catch (e, stackTrace) {
      var frames = stackTrace.toString().split('\n');
      var methodFrame = frames[1];
      var methodName = methodFrame.split(' ')[3];
      return methodName;
    }
  }
}
