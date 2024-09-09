import 'dart:io';

import 'package:yaml/yaml.dart';

import '../exports.dart';

mixin HooksConfigurationLoader on HooksConfigurationAnalyzer {
  Future<List> loadConfigurationFile() async {
    final List entries = [];

    final String yamlString = configFile.readAsStringSync();

    if (yamlString.isEmpty) {
      error("Configuration file is empty.");
      exit(1);
    }

    final dynamic yamlData = loadYaml(yamlString);

    if (yamlData is Map) {
      yamlData.forEach((dynamic key, dynamic value) {
        final String stageName = key as String;
        final List commandsList = value["commands"] as List;
        entries.add({stageName: commandsList});
      });
    }
    return entries;
  }
}
