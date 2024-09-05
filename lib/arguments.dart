import 'classes/hooks.dart';

final Map<String, Map<String, dynamic>> cliArguments = {
  'help': {
    'description': 'Show help',
    'command': () => Hooks().help(),
  },
  'init': {
    'description': 'Initialize configuration',
    'command': () => Hooks().init(),
  },
  'apply': {
    'description': 'Edit configuration',
    'command': () => Hooks().apply(),
  },
  'destroy': {
    'description': 'Remove configuration',
    'command': () => Hooks().destroy(),
  },
};
