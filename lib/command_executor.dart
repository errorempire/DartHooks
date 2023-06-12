import "dart:convert";
import "dart:io";

import "package:dart_hooks/classes.dart";
import "package:dart_hooks/checks.dart";
import "package:yaml/yaml.dart";

import "globals.dart";

Future<CommandResult> startProcess(dynamic command, String hookType) async {
  if (hookType == "pre-commit") await checkStagedChanges();

  command.toString();
  List<String> parts = command.split(" ");
  String executable = parts[0];
  List<String> arguments = parts.skip(1).toList();

  Process process = await Process.start(executable, arguments);

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
  logger.cmdError("Type", type);
  logger.cmdError("Command", result.command);
  logger.cmdError("Exit Code", result.exitCode);
  logger.cmdError("Error", result.stderr);
  exit(result.exitCode);
}

void printSuccess(CommandResult result, String type) {
  logger.cmdSuccess(type, type: "Type");
  logger.cmdSuccess(result.command, type: "Command");
  logger.cmdSuccess(result.stdout);
}

Future<void> applyHooks(String hookType) async {
  var commands =
      loadYaml(await File(configFile).readAsString())[hookType]["commands"];

  Type type = commands.runtimeType;
  List<CommandResult> results = [];

  if (type == String && commands != null) {
    results.add(await startProcess(commands, hookType));
  }

  if (type == YamlList && commands.isNotEmpty) {
    for (var command in commands) {
      results.add(await startProcess(command, hookType));
    }
  }

  printInfo(results, hookType);
}

Future<void> removeHooks() async {
  await Directory(hooksDirectory()).delete(recursive: true);
  await Directory(hooksDirectory()).create();
}
