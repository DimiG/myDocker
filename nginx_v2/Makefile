# This Makefile to run Nginx WEB server
# Just help to Automate the compilation process
# With `make', 'make build' and `make push'
# Created by: Dmitri G.
# Date: 2019-06-21

### Check platform to execute ###
ifeq ($(OS),Windows_NT)
	detected_OS := Windows
else
	detected_OS := $(shell sh -c 'uname 2>/dev/null || echo Unknown')
endif

### VARIABLEs ###
### TOKEN_H MUST BE SPECIFIED IN YOUR LOCAL ENVIRONMENT!!!
APPNAME   := your_app_name
APPNAME_H := registry.heroku.com/$(APPNAME)/web
PAAS      := registry.heroku.com
PORT_ADDR := 8080

### Assign values depending on platform
ifeq ($(detected_OS),Windows)
  # *** Windows 7 specific ***
  SOURCE := /DM/nginx_v2/html
endif
ifeq ($(detected_OS),Darwin)
  # *** MacOS specific ***
  SOURCE := $(shell pwd)/html
endif

TARGET := /usr/share/nginx/html

.PHONY: all help run develop build push login logout

all: develop

help:
	@echo ""
	@tput setaf 3
	@echo "[HELP COMMANDS]"
	@echo " make         : Develop of the WEB server"
	@echo " make run     : Run the WEB server for checking"
	@echo " make build   : Build the container for production"
	@echo " make push    : Publish the container to PaaS"
	@echo " make login   : Login to PaaS"
	@echo " make logout  : Logout from PaaS"
	@tput sgr0

run: build/Run
	@echo "[RUN]"

develop: build/Develop
	@echo "[DEVELOP]"

build: build/Production
	@echo "[PRODUCTION]"

push: build/Publish
	@echo "[PUBLISH]"

login: build/Login
	@echo "[LOGIN]"

logout: build/Logout
	@echo "[LOGOUT]"

build/Develop:
	$(info =>>> Develop the WEB server...)
	docker run --rm --name $(APPNAME) -d -p $(PORT_ADDR):$(PORT_ADDR) \
	  -e PORT=$(PORT_ADDR) -v $(SOURCE):$(TARGET) $(APPNAME_H)

build/Run:
	$(info =>>> Run the WEB server for testing...)
	docker run --rm --name $(APPNAME) -d -p $(PORT_ADDR):$(PORT_ADDR) \
	  -e PORT=$(PORT_ADDR) $(APPNAME_H)

build/Production:
	$(info =>>> Build the Docker container for production...)
	docker build -t $(APPNAME_H) -f Dockerfile .

build/Publish:
	$(info =>>> Publish the Docker container to PaaS...)
	docker push $(APPNAME_H)

build/Login:
	$(info =>>> Login to PaaS...)
	docker login --username=_ --password=${TOKEN_H} $(PAAS)

build/Logout:
	$(info =>>> Logout from PaaS...)
	docker logout $(PAAS)

