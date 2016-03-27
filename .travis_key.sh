#!/bin/bash

set -e

if [ ! "${TRAVIS:-}" = 'true' ]; then
  echo 'This is not running on Travis CI. Exiting!'
  exit 0
fi

if [ ! "${TRAVIS_PULL_REQUEST:-}" = 'false' ]; then
  echo 'Skipping deploy step for pull request.'
  exit 0
fi

if [ "${SKIP_DEPLOY:-}" = "true" ] && [ "${REQUIRE_KEY:-}" != "true" ]; then
  echo 'Skip deploy explicitly set.'
  exit 0
fi

if [ -z ${DEPLOY_KEY} ] && [ -e '.deploy_key.enc' ]; then
  eval "openssl aes-256-cbc -K \$encrypted_${1}_key -iv \$encrypted_${1}_iv -in .deploy_key.enc -out .deploy_key -d"
fi
