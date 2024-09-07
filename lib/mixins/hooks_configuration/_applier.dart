import 'dart:io';

import '../exports.dart';

mixin HooksConfigurationApplier on Logger, HooksConfigurationLoader {
  Future<void> applyHooks() async {
    if (await checkDartHooksConfigFile()) {
      final List loadedConfig = await loadConfigurationFile();
      if (loadedConfig.isEmpty) error("Configuration file is empty.");

      for (var entry in loadedConfig) {
        final String key = entry.keys.first as String;
        final List commands = entry[key] as List;

        await File(hooksDirectory(key)).writeAsString("""
#!/usr/bin/env sh

${commands.join("\n")}
""");
        await Process.run("chmod", ["755", hooksDirectory(key)]);

        info("[$key] Hooks have been updated");
      }
    } else {
      print("Configuration file is empty or does not exist.");
    }
  }

  static String hooksDirectory([String? key]) => key == null ? ".git/hooks" : ".git/hooks/$key";
}
