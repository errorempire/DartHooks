import "dart:convert";
import "dart:io";

import "package:dart_hooks/globals.dart";
import "package:json2yaml/json2yaml.dart";

void main() async {
  await _createConfigFile();
}

Future<void> _createConfigFile() async {
  await File(configFile).writeAsString(json2yaml(json.decode(json.encode({
    "pre-commit": {
      "commands": ["dart --version", "flutter --version"]
    },
    "pre-push": {
      "commands": ["dart --version", "flutter --version"]
    }
  }))));
  logger.info("Configuration file have been created");
}
