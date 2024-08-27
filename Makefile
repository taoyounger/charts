#!/usr/bin/make -f

# Copyright 2022 Authors of spidernet-io
# SPDX-License-Identifier: Apache-2.0

include Makefile.defs

.PHONY: all
all: build_chart

PROJECT ?=

.PHONY: build_chart
build_chart:
	@ project=$(PROJECT) ; [ -z "$(PROJECT)" ] && project=`ls` ; \
		echo "build chart for $${project}" ; \
		for ITEM in $${project} ; do\
			echo "===================== build $${ITEM} ====================" ; \
			./test/scripts/generateChart.sh $${ITEM} ; \
		done

.PHONY: e2e
e2e:
	make -C test e2e -e PROJECT="$(PROJECT)"

.PHONY: e2e_init
e2e_init:
	make -C test kind-init

.PHONY: e2e_clean
e2e_clean:
	make -C test clean