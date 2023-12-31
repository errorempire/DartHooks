import "dart:convert";
import "dart:io";

import "classes.dart";
import "globals.dart";
import "package:yaml/yaml.dart";

Future<CommandResult> startProcess(String command, String hookType) async {
  // if (hookType == "pre-commit") await checkStagedChanges();

  final List<String> parts = command.split(" ");
  final String executable = parts[0];
  final List<String> arguments = parts.skip(1).toList();

  final Process process = await Process.start(executable, arguments);

  return CommandResult(
    command: command,
    stdout: await process.stdout.transform(utf8.decoder).join(),
    stderr: await process.stderr.transform(utf8.decoder).join(),
    exitCode: await process.exitCode,
  );
}

void printInfo(List<CommandResult> results, String type) {
  print("");
  print("--------------------------");
  print("        Dart Hooks        ");
  print("--------------------------");
  print("");

  for (var result in results) {
    if (result.stderr.isNotEmpty && result.exitCode != 0) {
      printError(result, type);
    } else {
      printSuccess(result, type);
    }
  }
}

void printError(CommandResult result, String type) {
  logger
    ..cmdError("Type", type)
    ..cmdError("Command", result.command)
    ..cmdError("Exit Code", result.exitCode)
    ..cmdError("Error", result.stderr);
  exit(result.exitCode);
}

void printSuccess(CommandResult result, String type) {
  logger
    ..cmdSuccess(type, type: "Type")
    ..cmdSuccess(result.command, type: "Command")
    ..cmdSuccess(result.stdout);
}

Future<void> applyHooks(String hookType) async {
  final Map<dynamic, dynamic> yamlFile =
      loadYaml(await File(configFile).readAsString()) as Map<dynamic, dynamic>;
  final commands = yamlFile[hookType]["commands"];

  final List<CommandResult> results = [];

  if (commands is String) results.add(await startProcess(commands, hookType));

  if (commands is YamlList && commands.isNotEmpty) {
    for (var command in commands) {
      results.add(await startProcess(command as String, hookType));
    }
  }
  printInfo(results, hookType);
}

Future<void> removeHooks() async {
  await Directory(hooksDirectory()).delete(recursive: true);
  await Directory(hooksDirectory()).create();
}
