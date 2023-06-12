import "package:dart_hooks/command_executor.dart";
import "package:dart_hooks/globals.dart";

void main() async {
  await removeHooks();
  await _removeConfiguration();
}

Future<void> _removeConfiguration() async {
  if (await config.exists()) {
    await config.delete();
    logger.info("Configuration file has been deleted");
  } else {
    logger.error("Configuration file does not exist");
  }
}
