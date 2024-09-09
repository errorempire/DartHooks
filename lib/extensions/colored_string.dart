extension ColoredStringExtension on String {
  static const _red = "\x1B[31m";
  static const _green = "\x1B[32m";
  static const _blue = "\x1B[34m";
  static const _yellow = "\x1B[33m";
  static const _reset = "\x1B[0m";
  static const _magenta = "\x1B[35m";

  String get blue => '$_blue$this$_reset';
  String get green => '$_green$this$_reset';
  String get magenta => '$_magenta$this$_reset';
  String get red => '$_red$this$_reset';
  String get yellow => '$_yellow$this$_reset';
}
