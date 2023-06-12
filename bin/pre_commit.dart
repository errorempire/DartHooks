import "package:dart_hooks/checks.dart";
import "package:dart_hooks/command_executor.dart";

void main() async {
  await checkConfigurationFile();
  await applyHooks("pre-commit");
}
