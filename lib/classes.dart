class CommandResult {
  final String command;
  final String stdout;
  final String stderr;
  final int exitCode;

  const CommandResult({
    required this.command,
    required this.stdout,
    this.stderr = "",
    this.exitCode = 0,
  });
}

class Logger {
  void info(String message) {
    print("");
    print(Colorize.blue("[ INFO ] ") + Colorize._reset + message);
    print("");
  }

  void warning(String message) {
    print("");
    print(Colorize.yellow("[ WARNING ] ") + Colorize._reset + message);
    print("");
  }

  void error(String message) {
    print("");
    print(Colorize.red("[ ERROR ] ") + Colorize._reset + message);
    print("");
  }

  void cmdSuccess(String message, {String? type = ""}) {
    if (type != "") type = "$type: ";
    print(Colorize.blue(type) + Colorize.green(message));
  }

  void cmdError(String type, dynamic message) {
    print(Colorize.blue("$type: ") + Colorize.red(message));
  }
}

class Command {
  final Map<String, List<String>> commands;
  const Command({required this.commands});
}

class Stage {
  final Map<String, Command> stages;
  const Stage({required this.stages});
}

class YamlConverter {
  String toYaml(dynamic data, [int indentLevel = 0]) {
    final indent = " " * indentLevel;

    if (data is Command) {
      return data.commands.entries.map((e) {
        final value = e.value.map((v) => "$indent  - $v").join("\n");
        return "$indent${e.key}:\n$value";
      }).join("\n");
    } else if (data is Stage) {
      return data.stages.entries.map((e) {
        final value = toYaml(e.value, indentLevel + 2);
        return "$indent${e.key}:\n$value";
      }).join("\n");
    }
    throw ArgumentError("Unsupported data type for YAML conversion");
  }
}
