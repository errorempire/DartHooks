import 'dart:io';

import '../exports.dart';

mixin HooksConfigurationAnalyzer on Logger {
  final File configFile = File("dart_hooks.yaml");

  Future<bool> checkDartHooksConfigFile() async {
    if (configFile.existsSync()) {
      success("Configuration file already exists.");
      return true;
    } else {
      warning("Configuration file does not exist.");
      return false;
    }
  }

  Future<void> checkGitDirectory() async {
    if (!Directory(".git").existsSync()) {
      warning("Directory does not appear to be a git repository.");
      exit(1);
    }
  }
}
