import 'dart:async';

import 'package:args/command_runner.dart';

import '../mixins/exports.dart';

class DestroyCommand extends Command<String>
    with
        Logger,
        HooksConfigurationAnalyzer,
        HooksConfigurationLoader,
        HooksConfigurationDestroyer {
  @override
  String get description => 'Remove configuration';

  @override
  String get name => 'destroy';

  @override
  FutureOr<String>? run() async {
    await checkGitDirectory();
    await removeConfigurationFile();
    await removeAppliedHooks();
    return '';
  }
}
