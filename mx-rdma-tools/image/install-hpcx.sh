#!/bin/bash

# Copyright 2024 Authors of spidernet-io
# SPDX-License-Identifier: Apache-2.0

set -x
set -o xtrace
set -o errexit
set -o pipefail
set -o nounset

echo "--------------- install nvbandwidth -------------------"
echo "build nvbandwidth: ${ENV_VERSION_NVBANDWIDTH}"
apt install -y --no-install-recommends wget cmake
