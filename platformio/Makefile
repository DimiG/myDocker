# This is a Makefile to compile the MCU FirmWare
# By Docker and PlatformIO for ESP-8266EX
# Tested by LOLIN D1 mini (https://www.wemos.cc)
# Just help to automate the compilation process
# With `make', 'make help' and `make clean'
# Created by: Dmitri G.
# Date: 2019-05-13

### Check platform to execute ###
ifeq ($(OS),Windows_NT)
    detected_OS := Windows
else
    detected_OS := $(shell sh -c 'uname 2>/dev/null || echo Unknown')
endif

### VARIABLEs ###
PROJECT_NAME = Project
BOARD_NAME = d1_mini
CONTAINER_NAME = platformio-core
CONTAINER_VER = v1.0
IDE_NAME = vim
SOURCE_CFG = platformio-core
TARGET_CFG = /home/dockeruser/.platformio

ifeq ($(detected_OS),Windows)
  # *** Windows 7 specific    ***
  # *** Change it to your     ***
  # *** REAL Project Location ***
  SOURCE = /DM/MCU/platformio/$(PROJECT_NAME)
endif
ifeq ($(detected_OS),Darwin)
  # *** MacOS specific ***
  SOURCE =  $(shell pwd)/$(PROJECT_NAME)
endif

TARGET = /home/dockeruser/workspace
USB_DEVICE = /dev/ttyUSB0

.PHONY: all help build create new run upload erase clean cleanall

all: build

help:
	@echo "[HELP COMMANDS]"
	@echo " make         : Build MCU FirmWare"
	@echo " make create  : Create container"
	@echo " make new     : Create New PlatformIO project"
	@echo " make run     : Run container in interactive mode"
	@echo " make upload  : Upload MCU FirmWare"
	@echo " make erase   : Erase MCU FirmWare"
	@echo " make clean   : Clean all build outputs"
	@echo " make cleanall: Remove Folder"

build: build/Release
	@echo "[BUILD]"

create:
	$(info =>>> Create PlatformIO container...)
	docker build -t $(CONTAINER_NAME):$(CONTAINER_VER) .
	@echo "[CREATE]"

build/Release:
	$(info =>>> Build MCU FirmWare...)
	docker run --rm -ti --read-only -v $(SOURCE_CFG):$(TARGET_CFG) \
	  -v $(SOURCE):$(TARGET) $(CONTAINER_NAME):$(CONTAINER_VER) run

new:
	$(info =>>> Create the new PlatformIO project...)
	docker run --rm -ti --read-only -v $(SOURCE_CFG):$(TARGET_CFG) \
	  -v $(SOURCE):$(TARGET) $(CONTAINER_NAME):$(CONTAINER_VER) init -b $(BOARD_NAME) --ide $(IDE_NAME)
	@echo "[NEW]"

run:
	$(info =>>> Run container in interactive mode...)
	docker run --rm -ti --read-only -v $(SOURCE_CFG):$(TARGET_CFG) \
	  -v $(SOURCE):$(TARGET) $(CONTAINER_NAME):$(CONTAINER_VER)
	@echo "[RUN]"

upload:
	$(info =>>> Upload MCU FirmWare...)
	docker run --rm -ti --read-only --device=$(USB_DEVICE) -v $(SOURCE_CFG):$(TARGET_CFG) \
	  -v $(SOURCE):$(TARGET) $(CONTAINER_NAME):$(CONTAINER_VER) run -t upload
	@echo "[UPLOAD]"

erase:
	$(info =>>> Upload MCU FirmWare...)
	docker run --rm -ti --read-only --device=$(USB_DEVICE) -v $(SOURCE_CFG):$(TARGET_CFG) \
	  -v $(SOURCE):$(TARGET) $(CONTAINER_NAME):$(CONTAINER_VER) run -t erase
	@echo "[ERASE]"

clean:
	$(info =>>> Cleaning UP Project...)
	docker run --rm -ti --read-only -v $(SOURCE_CFG):$(TARGET_CFG) \
	  -v $(SOURCE):$(TARGET) $(CONTAINER_NAME):$(CONTAINER_VER) run -t clean
	@echo "[CLEAN]"

cleanall:
	$(info =>>> Cleaning UP ALL!!!)
	@[ -d $(PROJECT_NAME)/ ] && rm -rfv $(PROJECT_NAME)/ || true
	@echo "[CLEAN ALL]"

