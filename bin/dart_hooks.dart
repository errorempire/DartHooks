import 'package:dart_hooks/arguments.dart';
import 'package:dart_hooks/classes/hooks.dart';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    Hooks().help();
    return;
  }

  final String command = arguments[0];

  if (cliArguments.containsKey(command)) {
    cliArguments[command]?['command']();
  } else {
    Hooks().help();
    return;
  }
}
