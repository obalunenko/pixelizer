#!/usr/bin/env bash
set -e

# Get new tags from the remote
git fetch --tags -f

# Get the latest tag name
# shellcheck disable=SC2046
latestTag=$(git describe --tags $(git rev-list --tags --max-count=1))
echo "${latestTag}"

export GOVERSION=$(go version | awk '{print $3;}')

goreleaser --snapshot --skip-publish --rm-dist
