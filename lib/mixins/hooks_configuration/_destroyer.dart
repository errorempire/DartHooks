import 'dart:io';

import '../../extensions/colored_string.dart';
import '../exports.dart';

mixin HooksConfigurationDestroyer
    on Logger, HooksConfigurationAnalyzer, HooksConfigurationLoader {
  Future<void> removeAppliedHooks() async {
    final List loadedConfig = await loadConfigurationFile();

    for (var hookCommands in loadedConfig) {
      final hook = hookCommands.keys.first;

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
    }
  }

  Future<void> removeConfigurationFile() async {
    if (await checkDartHooksConfigFile()) {
      await configFile.delete().then((_) {
        success("Configuration file has been deleted.");
      }).catchError((e) {
        error("Failed to delete configuration file: $e");
      });
    }
  }
}
