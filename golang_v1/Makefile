# This is a Makefile to compile the application
# For Golang by Docker
# Just help to Automate the compilation process
# With `make', 'make release' and `make clean'
# Created by: Dmitri G.
# Date: 2019-06-15

### VARIABLEs ###
# For your environment change SOURCE path to $(pwd)
TARGET_NAME  := myapp
SOURCE       := /DM/golang_v2/mytstapp
TARGET       := /usr/src/$(TARGET_NAME)
SOURCE_CFG   := golang-data
TARGET_CFG1  := /tmp
TARGET_CFG2  := /home/appuser/.cache
APPNAME_DEV  := golang-mytstapp-dev
APPNAME_PROD := golang-mytstapp-prod
CONT_VER     := v1.0

.PHONY: all help dev prod build run clean

all: dev

help:
	@echo ""
	@tput setaf 3
	@echo "[HELP COMMANDS]"
	@echo " make       : Run develop compilation"
	@echo " make build : Build the container"
	@echo " make run   : Run the compiled program"
	@echo " make prod  : Create minimal docker container for current program"
	@echo " make clean : Clean all build outputs"
	@tput sgr0

dev: build/Develop
	@echo "[DEVELOP]"

prod: build/Production
	@echo "[PRODUCTION]"

build:
	$(info =>>> Build the container for further compilation...)
	docker build --target builder -t $(APPNAME_DEV):$(CONT_VER) -f Dockerfile .
	@echo "[BUILD]"

run:
	$(info =>>> Run the program...)
	docker run --rm -ti --read-only --name $(APPNAME_DEV) -v $(SOURCE):$(TARGET) \
	  --entrypoint "./$(TARGET_NAME)" $(APPNAME_DEV):$(CONT_VER)
	@echo "[RUN]"

build/Develop:
	$(info =>>> Run the Go lang compilation...)
	docker run --rm -ti --read-only --name $(APPNAME_DEV) \
	  -v $(SOURCE_CFG):$(TARGET_CFG1) -v $(SOURCE_CFG):$(TARGET_CFG2) \
	  -v $(SOURCE):$(TARGET) $(APPNAME_DEV):$(CONT_VER) go build -ldflags="-w -s" -v

build/Production:
	$(info =>>> Optimized PRODUCTION version inside minimum container...)
	docker build --target production -t $(APPNAME_PROD):$(CONT_VER) -f Dockerfile .
	docker run --rm -ti --read-only --name $(APPNAME_PROD) $(APPNAME_PROD):$(CONT_VER)

clean:
	$(info =>>> Cleaning UP...)
	@[ -f mytstapp/$(TARGET_NAME) ] && rm -v mytstapp/$(TARGET_NAME) || true
	@echo "[CLEAN]"

