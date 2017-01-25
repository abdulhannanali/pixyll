#!/bin/bash
set -e

SOURCE_BRANCH="master"

if [ "$TRAVIS_PULL_REQUEST" != "false"]; then
    echo "Skipping deploy; just doing a build."
    exit 0
fi

# Deploy each branch to staging
surge --domain "hannan-fascinations-""$TRAVIS_BRANCH"".surge.sh" --project ./_site

