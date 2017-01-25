#!/bin/bash
set -e

SOURCE_BRANCH="master"
TARGET_BRANCH="gh-pages"

if ["$TRAVIS_PULL_REQUEST" != "false" -o "$TRAVIS_BRANCH" != "$SOURCE_BRANCH"]; then
    echo "Skipping deploy, the source branch is not" $SOURCE_BRANCH
    exit 0
fi
