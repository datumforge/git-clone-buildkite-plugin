#!/usr/bin/env bats

PROJECT_DIR=$(cd "${BATS_TEST_DIRNAME}/.." && pwd)

load "$BATS_PLUGIN_PATH/load.bash"

@test "repository clone" {
  export BUILDKITE_PLUGIN_GIT_CLONE_REPOSITORY="git@github.com:datumforge/git-clone-buildkite-plugin.git"

  stub git 'clone "$BUILDKITE_PLUGIN_GIT_CLONE_REPOSITORY" "" : echo cloned repo'

  run "${PROJECT_DIR}/hooks/post-checkout"

  assert_success
  assert_output --partial "cloning repository git@github.com:datumforge/git-clone-buildkite-plugin.git "
  assert_output --partial "cloned repo"

  unstub git
}

@test "repository clone with branch" {
  export BUILDKITE_PLUGIN_GIT_CLONE_REPOSITORY="git@github.com:datumforge/git-clone-buildkite-plugin.git"
  export BUILDKITE_PLUGIN_GIT_CLONE_BRANCH="develop"

  stub git 'clone "$BUILDKITE_PLUGIN_GIT_CLONE_REPOSITORY" "--branch $BUILDKITE_PLUGIN_GIT_CLONE_BRANCH" : echo cloned repo'

  run "${PROJECT_DIR}/hooks/post-checkout"

  assert_success
  assert_output --partial "cloning repository git@github.com:datumforge/git-clone-buildkite-plugin.git --branch develop"
  assert_output --partial "cloned repo"

  unstub git
}