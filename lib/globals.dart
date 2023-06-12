import "dart:io";

import "package:dart_hooks/classes.dart";
import "package:yaml/yaml.dart";

final String configFile = "dart_hooks.yaml";
final Iterable keys = loadYaml(File(configFile).readAsStringSync()).keys;

File config = File(configFile);
Logger logger = Logger();

String hooksDirectory({String? key}) {
  if (key == null) return ".git/hooks";
  return ".git/hooks/$key";
}
