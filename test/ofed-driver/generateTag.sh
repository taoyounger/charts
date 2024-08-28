# Copyright 2024 Authors of spidernet-io
# SPDX-License-Identifier: Apache-2.0

#!/bin/bash
set -x

CURRENT_FILENAME=$( basename "$0" )
CURRENT_DIR_PATH=$(cd `dirname $0` ; pwd )

FILE_PATH=${CURRENT_DIR_PATH}/../../ofed-driver/chart/values.yaml

driverVersion=$(grep 'driverVersion:' "$FILE_PATH" | awk '{print $2}') || exit 1
OSName=$(grep 'OSName:' "$FILE_PATH" | awk '{print $2}' | tr -d '"') || exit 1
OSVer=$(grep 'OSVer:' "$FILE_PATH" | awk '{print $2}' | tr -d '"') || exit 1
Arch=$(grep 'Arch:' "$FILE_PATH" | awk '{print $2}' | tr -d '"')|| exit 1

tag="${driverVersion}-${OSName}${OSVer}-${Arch}"

awk -v tag="$tag" '/repository:/ {print; print "  tag: " tag; next}1' "$FILE_PATH" > temp.yaml && mv temp.yaml "$FILE_PATH" || exit 1

exit 0