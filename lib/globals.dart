import "dart:io";

import "classes.dart";
import "package:yaml/yaml.dart";

const String configFile = "dart_hooks.yaml";
final Map yamlMap = loadYaml(File(configFile).readAsStringSync()) as Map;

File config = File(configFile);
Logger logger = Logger();

String hooksDirectory([String? key]) {
  if (key == null) return ".git/hooks";
  return ".git/hooks/$key";
}
