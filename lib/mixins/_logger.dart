import '../extensions/colored_string.dart';

mixin Logger {
  void error(String message) {
    _log("ERROR".red, message);
  }

  void info(String message) {
    _log("INFO".blue, message);
  }

  void question(String message) {
    _log("QUESTION".magenta, message);
  }

  void success(String message) {
    _log("SUCCESS".green, message);
  }

  void warning(String message) {
    _log("WARNING".yellow, message);
  }

  void _log(String? type, String message) {
    final typeString = type != null ? "$type: " : '';
    print("$typeString$message");
  }
}
