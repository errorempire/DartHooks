import 'dart:async';

import 'package:args/command_runner.dart';

import '../mixins/exports.dart';

class InitCommand extends Command<String> with Logger, HooksConfigurationCheck, HooksConfigurationWriter, HooksConfigurationLoader {
  @override
  String get description => 'Initialize configuration';

  @override
  String get name => 'init';

  @override
  FutureOr<String>? run() async {
    await checkGitDirectory();
    await createConfigurationFile();
    return '';
  }
}
