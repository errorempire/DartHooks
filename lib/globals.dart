import "dart:io";

import "package:yaml/yaml.dart";

import "classes/logger.dart";

const String configFile = "dart_hooks.yaml";
final Map yamlMap = loadYaml(File(configFile).readAsStringSync()) as Map;

File config = File(configFile);
Logger logger = Logger();

String hooksDirectory([String? key]) {
  if (key == null) return ".git/hooks";
  return ".git/hooks/$key";
}
