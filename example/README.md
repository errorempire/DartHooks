# How to Use 🤷

- [How to Use 🤷](#how-to-use-)
  - [How to install 📦](#how-to-install-)
    - [Install the package via pub.dev:](#install-the-package-via-pubdev)
    - [Development Installation 🛠️](#development-installation-️)
  - [Initialize the Config ⚙️](#initialize-the-config-️)
  - [Applying the Hooks 🪝](#applying-the-hooks-)
  - [Example Config File 📁](#example-config-file-)
  - [How to Uninstall 🗑️](#how-to-uninstall-️)

## How to install 📦

### Install the package via [pub.dev](https://pub.dev/packages/dart_hooks):

```sh
dart pub add dart_hooks --dev
```

### Development Installation 🛠️

For development purposes, you can install the package from the local directory.

Clone the repository and checkout the desired branch:

```sh
git clone git@github.com:errorempire/DartHooks.git
```

Add the following to your `pubspec.yaml` file:

```yaml
---
dev_dependencies:
  dart_hooks:
    path: <some_path>/DartHooks
```

Run the following command to install the package:

```sh
dart pub get
```

## Initialize the Config ⚙️

Execute the following command to create the `dart_hooks.yaml` file:

```sh
dart run dart_hooks init
```

## Applying the Hooks 🪝

You should modify the list of hooks in the `dart_hooks.yaml` file (i.e., by adding or deleting a hook), you will need to apply the updated hook.

Note that if you are only changing the commands list, executing the following command is necessary.

```sh
dart run dart_hooks apply
```

## Example Config File 📁

```yaml
---
pre-commit:
  commands:
    - dart analyze
pre-push:
  commands:
    - dart analyze
```

OR:

```yaml
---
pre-commit:
  commands: [dart analyze]
pre-push:
  commands: [dart analyze]
```

## How to Uninstall 🗑️

To remove the hooks and configuration file, execute the command below:

```sh
dart run dart_hooks destroy
```

Subsequently, you can remove the dependency by running:

```sh
dart pub remove dart_hooks
```
