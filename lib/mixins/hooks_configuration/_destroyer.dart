import 'dart:io';

import '../../extensions/colored_string.dart';
import '../exports.dart';

mixin HooksConfigurationDestroyer on Logger {
  var loadedConfig = const {};

  Future<void> removeConfiguration() async {
    loadedConfig.forEach((hook, commands) {
      final hookFile = File(".git/hooks/$hook");

      if (hookFile.existsSync()) {
        try {
          hookFile.deleteSync();
          success("$hook hook file removed successfully.");
        } catch (e) {
          error("Failed to remove $hook hook file: $e");
        }
      } else {
        info("$hook hook file not found,${"skipping...".yellow}");
      }
    });
    File("dart_hooks.yaml").deleteSync();
    info("Configuration file has been deleted");
  }
}
