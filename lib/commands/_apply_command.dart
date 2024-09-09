import 'dart:async';

import 'package:args/command_runner.dart';

import '../mixins/exports.dart';

class ApplyCommand extends Command<String>
    with
        Logger,
        HooksConfigurationAnalyzer,
        HooksConfigurationLoader,
        HooksConfigurationWriter,
        HooksConfigurationApplier {
  @override
  String get description => 'Apply hooks configuration';

  @override
  String get name => 'apply';

  @override
  FutureOr<String>? run() async {
    await checkGitDirectory();
    await applyHooks();
    // NOTE: Delete old hooks if removed from the configuration file
    return '';
  }
}
