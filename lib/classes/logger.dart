import '../extensions/colored_string.dart';

class Logger {
  void cmdError(String type, String message) {
    print("$type: ".blue + message.red);
  }

  void cmdSuccess(String type, String message) {
    print("$type: ".blue + message.green);
  }

  void error(String message) {
    print("");
    print("[ ERROR ] ".red + message);
    print("");
  }

  void info(String message) {
    print("");
    print("[ INFO ] ".blue + message);
    print("");
  }

  void warning(String message) {
    print("");
    print("[ WARNING ] ".yellow + message);
    print("");
  }
}
