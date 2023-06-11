import 'dart:convert';
import 'dart:io';

import 'package:dart_hooks/classes.dart';
import 'package:yaml/yaml.dart';

final String configFile = './dart_hooks.yaml';

void check() {
  if (!File(configFile).existsSync()) {
    print('No configuration file found.');
    exit(1);
  }
}

Future<CommandResult> startProcess(dynamic command) async {
  command.toString();
  List<String> parts = command.split(' ');
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

void info(List<CommandResult> results, String type) {
  print("");
  print("--------------------------");
  print("        Dart Hooks        ");
  print("--------------------------");
  print("");

  for (var result in results) {
    if (result.stderr.isNotEmpty && result.exitCode != 0) {
      print(Colorize.blue("Type: ") + Colorize.red(type));
      print(Colorize.blue("Command: ") + Colorize.red(result.command));
      print(Colorize.blue("Exit Code: ") + Colorize.red(result.exitCode));
      print(Colorize.blue("Error: ") + Colorize.red(result.stderr));
      exit(result.exitCode);
    } else {
      print(Colorize.blue("Type: ") + Colorize.green(type));
      print(Colorize.blue("Command: ") + Colorize.green(result.command));
      print(Colorize.green(result.stdout));
    }
  }
}

void performHook(String hookType) async {
  var commands =
      loadYaml(File(configFile).readAsStringSync())[hookType]["commands"];

  Type type = commands.runtimeType;

  List<CommandResult> results = [];

  if (type == String && commands != null) {
    results.add(await startProcess(commands));
  }

  if (type == YamlList && commands.isNotEmpty) {
    for (var command in commands) {
      results.add(await startProcess(command));
    }
  }

  info(results, hookType);
}
