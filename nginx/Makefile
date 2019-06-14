# This Makefile to run Nginx WEB server
# Just help to Automate the compilation process
# With `make', 'make develop' and `make production'
# Created by: Dmitri G.
# Date: 2019-06-15

### Check platform to execute ###
ifeq ($(OS),Windows_NT)
	detected_OS := Windows
else
	detected_OS := $(shell sh -c 'uname 2>/dev/null || echo Unknown')
endif

### VARIABLEs ###
APPNAME_DEV  := nginx_tst_dev
APPNAME_PROD := nginx_tst_prod
PORT_ADDR    := 8080:8080
CONT_VER     := v1.0

ifeq ($(detected_OS),Windows)
  # *** Windows 7 specific ***
  SOURCE = /DM/Nginx/html
endif
ifeq ($(detected_OS),Darwin)
  # *** MacOS specific ***
  SOURCE = $(shell pwd)/html
endif

TARGET = /usr/share/nginx/html

.PHONY: all help run develop production

all: run

help:
	@echo ""
	@tput setaf 3
	@echo "[HELP COMMANDS]"
	@echo " make            : Run the WEB server"
	@echo " make develop    : Build the container for develop"
	@echo " make production : Build the container for production"
	@tput sgr0

run: build/Run
	@echo "[RUN]"

develop: build/Develop
	@echo "[DEVELOP]"

production: build/Production
	@echo "[PRODUCTION]"

build/Develop:
	$(info =>>> Build the Docker container for develop)
	docker build -t $(APPNAME_DEV):$(CONT_VER) -f Dockerfile.develop .

build/Production:
	$(info =>>> Build the Docker container for production)
	docker build -t $(APPNAME_PROD):$(CONT_VER) -f Dockerfile.production .

build/Run:
	$(info =>>> Run the WEB server for develop)
	docker run --rm --name $(APPNAME_DEV) -d -p $(PORT_ADDR) -v $(SOURCE):$(TARGET) $(APPNAME_DEV):$(CONT_VER)

