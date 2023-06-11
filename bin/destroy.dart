import "dart:io";

import "package:dart_hooks/classes.dart";
import "package:dart_hooks/dart_hooks.dart";

import "apply.dart";

void main() {
  _removeHooks();
  _removeConfiguration();
}

void _removeConfiguration() async {
  var file = File(configFile);

  if (await file.exists()) {
    await file.delete();
    print("");
    print("${Colorize.blue("[ INFO ]")} Configuration file has been deleted");
    print("");
  } else {
    print("");
    print("${Colorize.red("[ ERROR ]")} Configuration file does not exist");
    print("");
  }
}

void _removeHooks() async {
  for (var key in keys) {
    await File(".git/hooks/$key").delete();
  }
  print("");
  print("${Colorize.blue("[ INFO ]")} Hooks have been deleted");
  print("");
}
