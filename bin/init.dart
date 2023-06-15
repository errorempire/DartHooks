import "dart:io";

import "package:dart_hooks/classes.dart";
import "package:dart_hooks/globals.dart";

void main() async {
  await _createConfigFile();
}

Future<void> _createConfigFile() async {
  const Stage data = Stage(stages: {
    "pre-commit": Command(commands: {
      "commands": ["dart --version", "flutter --version"]
    }),
    "pre-push": Command(commands: {
      "commands": ["dart --version", "flutter --version"]
    })
  });

  File(configFile).writeAsStringSync(YamlConverter().toYaml(data));
  logger.info("Configuration file have been created");
}
