#!/bin/bash
set -e

if [ "$TRAVIS_PULL_REQUEST" != "false" ]; then
    echo "Skipping deploy; just doing a build."
    exit 0
fi

# Deployment to firebase for master branch
if [ "$TRAVIS_BRANCH" == "master" ]; then
    echo "Deploying to firebase in case of master too"
    firebase deploy --token "$FIREBASE_TOKEN"
fi


# Deploy each branch to staging, a mirror of master will be deployed on surge,
# cos it's already being deployed on firebase too
surge --domain "hannan-fascinations-""$TRAVIS_BRANCH"".surge.sh" --project ./_site
