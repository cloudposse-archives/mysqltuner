export DOCKER_IMAGE ?= cloudposse/mysqltuner
export DOCKER_TAG ?= dev
export DOCKER_IMAGE_NAME ?= $(DOCKER_IMAGE):$(DOCKER_TAG)
export DOCKER_BUILD_FLAGS = 

SHELL = /bin/bash
export BUILD_HARNESS_PATH ?= $(shell until [ -d "build-harness" ] || [ "`pwd`" == '/' ]; do cd ..; done; pwd)/build-harness
-include $(BUILD_HARNESS_PATH)/Makefile

APP := wp-cli
COPYRIGHT_SOFTWARE := mysqltuner
COPYRIGHT_SOFTWARE_DESCRIPTION := MySQLTuner is a script written in Perl that will assist you with your MySQL configuration and make recommendations for increased performance and stability.

.PHONY : init
## Init build-harness
init:
	@curl --retry 5 --retry-delay 1 https://raw.githubusercontent.com/cloudposse/build-harness/master/bin/install.sh | bash

.PHONY : deps
## Instal deps
deps:
	@exit 0

