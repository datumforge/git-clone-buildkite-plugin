[![Build status](https://badge.buildkite.com/1751c82941040b420a90c8f54ffe1d09b81231e73f06b875a4.svg)](https://buildkite.com/datum/git-clone-buildkite-plugin)

# git-clone

A buildkite plugin which performs a git clone post-checkout

## Example

Add the following to your `pipeline.yml`:

```yml
steps:
  - command: ls
    plugins:
      - datumforge/git-clone#v1.0.0:
          repository: git@github.com:datumforge/git-clone-buiodkite-pluginn.git
```

Example with branch:

```yml
steps:
  - command: ls
    plugins:
      - datumforge/git-clone#v1.0.0:
        branch: mitb
```  

## Developing

Requires [taskfile](https://taskfile.dev/installation/) - `task lint` and `task test` to validate updates to the plugin
