import 'dart:async';

import 'package:args/command_runner.dart';

import '../mixins/exports.dart';

class DestroyCommand extends Command<String> with Logger, HooksConfigurationCheck {
  @override
  String get description => 'Remove configuration';

  @override
  String get name => 'destroy';

  @override
  FutureOr<String>? run() async {
    await checkGitDirectory();
    // await checkConfigurationFile(toRemove: true, toApply: false, toExecute: false);
    return '';
  }
}
