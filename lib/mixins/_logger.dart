import 'dart:io';

import '../classes/command_result.dart';
import '../extensions/colored_string.dart';

mixin Logger {
  void commandError(String type, CommandResult result) {
    _printCommandResult(type, result, true);
  }

  void commandSuccess(String type, CommandResult result) {
    _printCommandResult(type, result, false);
  }

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

  void _printCommandResult(String type, CommandResult result, bool isError) {
    if (isError) {
      _log("TYPE".red, type);
      _log("COMMAND".red, result.command);
      _log("EXIT CODE".red, result.exitCode.toString());
      _log("ERROR".red, result.stderr);
      exit(result.exitCode);
    } else {
      _log("TYPE".green, type);
      _log("COMMAND".green, result.command);
      _log("OUTPUT".green, result.stdout);
    }
  }
}
