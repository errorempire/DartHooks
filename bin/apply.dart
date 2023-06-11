import 'dart:io';

import 'package:dart_hooks/classes.dart';
import 'package:dart_hooks/dart_hooks.dart';
import 'package:yaml/yaml.dart';

final Iterable<dynamic> keys =
    loadYaml(File(configFile).readAsStringSync()).keys;

void main() async {
  _updateHook();
}

void _updateHook() async {
  for (var key in keys) {
    String cmd = "${key.substring(0, 3)}_${key.substring(3 + 1)}";
    _updateGitHook(cmd, key);
  }
  print("");
  print("${Colorize.blue("[ INFO]")} Git hook(s) have been applied");
  print("");
}

void _updateGitHook(String cmd, String key) async {
  var templateScript = """
#!/usr/bin/env sh

dart run dart_hooks:$cmd
""";

  await File('.git/hooks/$key').writeAsString(templateScript);
  await Process.run("chmod", ["755", ".git/hooks/$key"]);
}
