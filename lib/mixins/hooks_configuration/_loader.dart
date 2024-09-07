import 'dart:io';

import 'package:yaml/yaml.dart';

import '../exports.dart';

mixin HooksConfigurationLoader on HooksConfigurationCheck {
  Future<List> loadConfigurationFile() async {
    final List entries = [];

    final String yamlString = File("dart_hooks.yaml").readAsStringSync();
    final dynamic yamlData = loadYaml(yamlString);

    if (yamlData is Map) {
      yamlData.forEach((dynamic key, dynamic value) {
        if (value is List) {
          final String stageName = key as String;
          final List commandsList = value;
          entries.add({stageName: commandsList});
        }
      });
    }
    return entries;
  }
}
