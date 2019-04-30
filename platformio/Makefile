# This is a Makefile to compile the MCU FirmWare
# By Docker and PlatformIO for ESP-8266EX
# Tested by LOLIN D1 mini (https://www.wemos.cc)
# Just help to automate the compilation process
# With `make', 'make help' and `make clean'
# Created by: Dmitri G.
# Date: 2019-05-01

### VARIABLEs ###
# Change the SOURCE specific for your system
PROJECT_NAME = Project
BOARD_NAME = d1_mini
CONTAINER_NAME = platformio-core
CONTAINER_VER = v1.0
IDE_NAME = vim
SOURCE_CFG = platformio-core
TARGET_CFG = /root/.platformio
SOURCE = /DM/MCU/esp8266_blink/$(PROJECT_NAME)
TARGET = /workspace
USB_DEVICE = /dev/ttyUSB0

# Not Used in Current configuration
# USER_ID  = $(shell id -u)
# GROUP_ID = $(shell id -g)

.PHONY: all help build create new upload erase clean cleanall

all: build

help:
	@echo "[HELP COMMANDS]"
	@echo " make         : Build MCU FirmWare"
	@echo " make create  : Create container"
	@echo " make new     : Create New PlatformIO project"
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
	docker run --rm -ti -v $(SOURCE_CFG):$(TARGET_CFG) \
	  -v $(SOURCE):$(TARGET) $(CONTAINER_NAME):$(CONTAINER_VER) run

new:
	$(info =>>> Create the new PlatformIO project...)
	docker run --rm -ti -v $(SOURCE_CFG):$(TARGET_CFG) \
	  -v $(SOURCE):$(TARGET) $(CONTAINER_NAME):$(CONTAINER_VER) init -b $(BOARD_NAME) --ide $(IDE_NAME)
	@echo "[NEW]"

upload:
	$(info =>>> Upload MCU FirmWare...)
	docker run --rm -ti --device=$(USB_DEVICE) -v $(SOURCE_CFG):$(TARGET_CFG) \
	  -v $(SOURCE):$(TARGET) $(CONTAINER_NAME):$(CONTAINER_VER) run -t upload
	@echo "[UPLOAD]"

erase:
	$(info =>>> Upload MCU FirmWare...)
	docker run --rm -ti --device=$(USB_DEVICE) -v $(SOURCE_CFG):$(TARGET_CFG) \
	  -v $(SOURCE):$(TARGET) $(CONTAINER_NAME):$(CONTAINER_VER) run -t erase
	@echo "[ERASE]"

clean:
	$(info =>>> Cleaning UP Project...)
	docker run --rm -ti -v $(SOURCE_CFG):$(TARGET_CFG) \
	  -v $(SOURCE):$(TARGET) $(CONTAINER_NAME):$(CONTAINER_VER) run -t clean
	@echo "[CLEAN]"

cleanall:
	$(info =>>> Cleaning UP ALL!!!)
	@[ -d $(PROJECT_NAME)/ ] && rm -rfv $(PROJECT_NAME)/ || true
	@echo "[CLEAN ALL]"

