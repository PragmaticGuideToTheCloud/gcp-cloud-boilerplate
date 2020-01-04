#!/usr/bin/env bash

set -o errexit -o nounset -o pipefail
set -x

apt-get update -y && apt-get install -y python && exit 0
