# This is a Makefile for work with MicroPython
# Tested by LOLIN D1 mini (https://www.wemos.cc)
# Just help to automate the compilation process
# With `make', 'make help' and `make clean'
# Created by: Dmitri G.
# Date: 2019-07-17

### Check platform to execute ###
ifeq ($(OS),Windows_NT)
    detected_OS := Windows
else
    detected_OS := $(shell sh -c 'uname 2>/dev/null || echo Unknown')
endif

### VARIABLEs ###
PROJECT_NAME = Project
CONTAINER_NAME = micropython-core
CONTAINER_VER = v1.0

ifeq ($(detected_OS),Windows)
  # *** Windows 7 specific    ***
  # *** Change it to your     ***
  # *** REAL Project Location ***
  SOURCE = /DM/MCU/micropython/$(PROJECT_NAME)
endif
ifeq ($(detected_OS),Darwin)
  # *** MacOS Specific ***
  SOURCE =  $(shell pwd)/$(PROJECT_NAME)
endif

TARGET = /home/dockeruser/workspace
USB_DEVICE = /dev/ttyUSB0

.PHONY: all help build connect run

all: connect

help:
	@echo ""
	@tput setaf 3
	@echo "[HELP COMMANDS]"
	@echo " make       : Connect to MCU by Rshell"
	@echo " make run   : Run container in interactive mode"
	@echo " make build : Create container"
	@tput sgr0

build:
	$(info =>>> Create MicroPython container...)
	docker build -t $(CONTAINER_NAME):$(CONTAINER_VER) .
	@echo "[CREATE]"

connect:
	$(info =>>> Connect to MCU by Rshell...)
	docker run --rm -ti --read-only --device=$(USB_DEVICE) \
	  -v $(SOURCE):$(TARGET) $(CONTAINER_NAME):$(CONTAINER_VER) -p $(USB_DEVICE)
	@echo "[CONNECT]"

run:
	$(info =>>> Run container in interactive mode...)
	docker run --rm -ti --read-only --device=$(USB_DEVICE) \
	  -v $(SOURCE):$(TARGET) $(CONTAINER_NAME):$(CONTAINER_VER)
	@echo "[RUN]"

