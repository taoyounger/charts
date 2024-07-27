#!/bin/bash

# Copyright 2024 Authors of spidernet-io
# SPDX-License-Identifier: Apache-2.0

set -x
set -o xtrace
set -o errexit
set -o pipefail
set -o nounset

packages=(
  iproute2
  # ibv_rc_pingpong
  ibverbs-utils
  # ib_send_lat
  perftest
  # ibstat
  infiniband-diags
  smc-tools
  lshw
  #lspci
  pciutils
  vim
  wget
  # ibdiagnet ibnetdiscover
  ibutils
  iperf3
  # ping
  iputils-ping
)


export DEBIAN_FRONTEND=noninteractive
apt-get update

# tzdata is one of the dependencies and a timezone must be set
# to avoid interactive prompt when it is being installed
ln -fs /usr/share/zoneinfo/UTC /etc/localtime

apt-get install -y --no-install-recommends "${packages[@]}"

apt-get purge --auto-remove
apt-get clean
rm -rf /var/lib/apt/lists/*
