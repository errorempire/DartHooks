# Dart Hooks

- [Dart Hooks](#dart-hooks)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Destroy](#destroy)
  - [Example Config File](#example-config-file)

Supported SDK: **Dart** only

Supported hooks:
  - `pre-commit`
  - `pre-push`

## Installation

```sh
dart pub add dart_hooks --dev
dart pub get
```

## Usage

Initialize the hook config file

```sh
dart run dart_hooks:init
```

Modify the `dart_hooks.yaml` file then run the following command to apply the hooks

```sh
dart run dart_hooks:apply
```

## Destroy

The following command will delete the hooks and the config file

```sh
dart run dart_hooks:destroy
```

Uninstall the package

```sh
dart pub remove dart_hooks
```

## Example Config File

```yaml
pre-commit:
  commands:
    - dart analyze
pre-push:
  commands:
    - dart analyze
```