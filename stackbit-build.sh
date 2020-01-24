#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e2ac9188b60c5001e09966d/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e2ac9188b60c5001e09966d
curl -s -X POST https://api.stackbit.com/project/5e2ac9188b60c5001e09966d/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5e2ac9188b60c5001e09966d/webhook/build/publish > /dev/null
