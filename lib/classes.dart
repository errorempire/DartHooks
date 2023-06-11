class CommandResult {
  final String command;
  final String stdout;
  final String stderr;
  final int exitCode;

  CommandResult({
    required this.command,
    required this.stdout,
    this.stderr = "",
    this.exitCode = 0,
  });
}

class Colorize {
  static const _red = "\x1B[31m";
  static const _green = "\x1B[32m";
  static const _blue = "\x1B[34m";
  static const _reset = "\x1B[0m";

  static String red(dynamic input) => "$_red$input$_reset";
  static String green(dynamic input) => "$_green$input$_reset";
  static String blue(dynamic input) => "$_blue$input$_reset";
}
