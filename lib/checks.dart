import "dart:io";

import "globals.dart";

Future<void> checkConfigurationFile() async {
  if (!await File(configFile).exists()) {
    logger.error("No configuration file found");
    exit(1);
  }
}

Future<void> checkStagedChanges() async {
  final ProcessResult result = await Process.run(
      "git", ["diff-index", "--cached", "--quiet", "HEAD", "--"]);

  if (result.exitCode != 0) {
    logger.error("No changes to be committed");
    exit(result.exitCode);
  }
}
