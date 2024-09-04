import 'command.dart';
import 'stage.dart';

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
