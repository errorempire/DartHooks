import 'dart:io';

import '../exports.dart';

mixin HooksConfigurationCheck on Logger {
  Future<bool> checkDartHooksConfigFile() async {
    if (File("dart_hooks.yaml").existsSync()) {
      success("Configuration file already exists");
      return true;
    } else {
      warning("Configuration file does not exist");
      return false;
    }
  }

  Future<void> checkGitDirectory() async {
    if (!Directory(".git").existsSync()) {
      warning("Directory does not appear to be a git repository");
      exit(1);
    } else {
      success("Directory is a git repository");
    }
  }
}
