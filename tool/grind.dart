import 'dart:io';

import 'package:grinder/grinder.dart';

main(List<String> args) => grind(args);

@Task("Compile dart code to exe")
compile() {
  Process.run("dart", ["compile", "exe", "bin/dart_hooks.dart"]).then((result) {
    print(result.stdout);
    print(result.stderr);
  });
}

@Task("Get dependencies")
deps() => Pub.get();

@Task('Run gh action pull_request')
pullRequest() async {
  try {
    await Process.run("act", ["-l"]).then((_) async {
      final process = await Process.start("act", ['pull_request']);

      process.stdout
          .transform(const SystemEncoding().decoder)
          .listen((data) => print(data));

      process.stderr
          .transform(const SystemEncoding().decoder)
          .listen((data) => print('ERROR: $data'));

      print('Process exited with code: ${await process.exitCode}');
    });
  } catch (e) {
    print("'act' not found, trying 'gh act'");
  }

  try {
    await Process.run("gh", ["act", "-l"]).then((_) async {
      final process = await Process.start("gh", ['act', 'pull_request']);

      process.stdout
          .transform(const SystemEncoding().decoder)
          .listen((data) => print(data));

      process.stderr
          .transform(const SystemEncoding().decoder)
          .listen((data) => print('ERROR: $data'));

      print('Process exited with code: ${await process.exitCode}');
    });
  } catch (e) {
    print("Please install act or gh act");
  }
}

@Task("Update dependencies")
update() => Pub.upgrade();
