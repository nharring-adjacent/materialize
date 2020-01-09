#!/usr/bin/env bash

# Copyright 2019 Materialize, Inc. All rights reserved.
#
# This file is part of Materialize. Materialize may not be used or
# distributed without the express permission of Materialize, Inc.
#
# slt-fast.sh — runs fast subset of sqllogictests in CI.

set -euo pipefail

if [[ ! "${BUILDKITE-}" ]]; then
    sqllogictest() {
        cargo run --release --bin sqllogictest -- "$@"
    }
fi

export RUST_BACKTRACE=full

sqllogictest -v "$("$(dirname "$0")"/slt-fast-files.sh)"
