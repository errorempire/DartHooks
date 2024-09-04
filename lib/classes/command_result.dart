class CommandResult {
  final String command;
  final String stdout;
  final String stderr;
  final int exitCode;

  const CommandResult({
    required this.command,
    required this.stdout,
    this.stderr = "",
    this.exitCode = 0,
  });
}
