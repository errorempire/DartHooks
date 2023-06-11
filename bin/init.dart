import 'dart:convert';
import 'dart:io';

import 'package:dart_hooks/classes.dart';
import 'package:json2yaml/json2yaml.dart';

void main() async {
  _createConfigFile();
  _checkHooksDirectory();
}

void _createConfigFile() {
  File("dart_hooks.yaml").writeAsStringSync(json2yaml(json.decode(json.encode({
    "pre-commit": {
      "commands": ["dart analyze"]
    },
    "pre-push": {
      "commands": ["dart analyze"]
    }
  }))));
  print("");
  print("${Colorize.blue("[ INFO ]")} Configuration file have been created");
  print("");
}

void _checkHooksDirectory() async {
  if (!(await Directory('.git/hooks').exists())) {
    print("");
    print(
        "${Colorize.red("[ ERROR ]")} Directory does not appear to be a git repository.");
    print("");
    exit(1);
  }
}
