import "dart:io";

import "package:dart_hooks/checks.dart";
import "package:dart_hooks/command_executor.dart";
import "package:dart_hooks/globals.dart";

void main() async {
  await checkHooksDirectory();
  await removeHooks();
  await _applyHooks();
}

Future<void> _applyHooks() async {
  for (String key in keys) {
    final String cmd = "${key.substring(0, 3)}_${key.substring(3 + 1)}";
    await _updateGitHook(cmd, key);
  }
  logger.info("Hooks have been updated");
}

Future<void> _updateGitHook(String cmd, String key) async {
  final templateScript = """
#!/usr/bin/env sh

dart run dart_hooks:$cmd
""";

  await File(hooksDirectory(key)).writeAsString(templateScript);
  await Process.run("chmod", ["755", hooksDirectory(key)]);
}
