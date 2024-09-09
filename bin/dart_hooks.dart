import 'package:args/command_runner.dart';
import 'package:dart_hooks/commands/exports.dart';

void main(List<String> args) async {
  CommandRunner<String>('dart_hooks',
      'DartHooks - Automating the integration and management of Git Hooks in Dart projects')
    ..addCommand(InitCommand())
    ..addCommand(ApplyCommand())
    ..addCommand(DestroyCommand())
    ..run(args);
}
