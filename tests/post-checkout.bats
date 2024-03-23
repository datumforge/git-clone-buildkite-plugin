#!/usr/bin/env bats

PROJECT_DIR=$(cd "${BATS_TEST_DIRNAME}/.." && pwd)

load "$BATS_PLUGIN_PATH/load.bash"

@test "Echos repository" {
  export BUILDKITE_PLUGIN_GIT_CLONE_REPOSITORY="git@github.com:datumforge/git-clone-buildkite-plugin.git"

  stub git "clone : echo ${BUILDKITE_PLUGIN_GIT_CLONE_REPOSITORY}"

  run "${PROJECT_DIR}/hooks/post-checkout"

  assert_success
  assert_output --partial "cloning repository git@github.com:datumforge/git-clone-buildkite-plugin.git"

  unstub git


}

@test "Echos repository with branch" {
  export BUILDKITE_PLUGIN_GIT_CLONE_REPOSITORY="git@github.com:datumforge/git-clone-buildkite-plugin.git"
  export BUILDKITE_PLUGIN_GIT_CLONE_BRANCH="develop"

  stub git "clone : "

  run "${PROJECT_DIR}/hooks/post-checkout"

  assert_success
  assert_output --partial "cloning repository git@github.com:datumforge/git-clone-buildkite-plugin.git --branch develop"

  unstub git

}
