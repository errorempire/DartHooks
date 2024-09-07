import 'dart:io';

import 'package:yaml_writer/yaml_writer.dart';

import '../exports.dart';

mixin HooksConfigurationWriter on Logger, HooksConfigurationCheck {
  Future<void> createConfigurationFile() async {
    if (await checkDartHooksConfigFile()) {
      if (_promptOverwriteConfigFile()) {
        info("Creating configuration file...");
        _writeYamlConfiguration();
        success("Configuration file has been created");
      }
    } else {
      info("Creating configuration file...");
      _writeYamlConfiguration();
      success("Configuration file has been created");
    }
  }

  bool _promptOverwriteConfigFile() {
    question("Do you want to overwrite it the configuration file? (y/n)");

    if (stdin.readLineSync() == "y") return true;

    info("Configuration file has not been overwritten");
    return false;
  }

  void _writeYamlConfiguration() {
    final Map<String, Map<String, List<String>>> exampleConfig = {
      "pre-commit": {
        "commands": ["dart --version", "flutter --version"]
      },
      "pre-push": {
        "commands": ["dart --version", "flutter --version"]
      }
    };
    YamlWriter().write(exampleConfig);
  }
}
