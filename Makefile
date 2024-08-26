#!/usr/bin/make -f

# Copyright 2024 Authors of spidernet-io
# SPDX-License-Identifier: Apache-2.0

include Makefile.defs

.PHONY: all
all: e2e e2e_clean

PROJECT ?=

.PHONY: e2e
e2e:
	make -C test e2e -e PROJECT="$(PROJECT)"

.PHONY: e2e_init
e2e_init:
	make -C test kind-init

.PHONY: e2e_clean
e2e_clean:
	make -C test clean