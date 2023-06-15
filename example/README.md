# How to Use

- [How to Use](#how-to-use)
  - [Initialize the Config](#initialize-the-config)
  - [Applying the Hooks](#applying-the-hooks)
- [Example Config File](#example-config-file)
- [How to Uninstall](#how-to-uninstall)


## Initialize the Config

Execute the following command to create the `dart_hooks.yaml` file:

```sh
dart run dart_hooks:init
```

## Applying the Hooks

You should modify the list of hooks in the `dart_hooks.yaml` file (i.e., by adding or deleting a hook), you will need to apply the updated hook.

Note that if you are only changing the commands list, executing the following command is not necessary.

```sh
dart run dart_hooks:apply
```

# Example Config File

```yaml
---
pre-commit:
  commands:
    - dart analyze
pre-push:
  commands:
    - dart analyze

---
pre-commit:
  commands: dart analyze
pre-push:
  commands: dart analyze
```

# How to Uninstall

To remove the hooks and configuration file, execute the command below:

```sh
dart run dart_hooks:destroy
```

Subsequently, you can remove the dependency by running:

```sh
dart pub remove dart_hooks
```
