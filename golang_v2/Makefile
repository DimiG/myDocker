# This is a Makefile to compile the application
# For Golang by Docker
# Just help to Automate the compilation process
# With `make', 'make release' and `make clean'
# Created by: Dmitri G.
# Date: 2019-07-17

### VARIABLEs ###
# For your environment change SOURCE path to $(pwd)
TARGET_NAME  := mywebgoapp
SOURCE       := /DM/golang_v2/src/
TARGET       := /usr/src/
SOURCE_CFG   := golang-data
TARGET_CFG1  := /tmp
TARGET_CFG2  := /home/dockeruser/.cache
APPNAME_DEV  := golang-mywebapp-dev
APPNAME_PROD := golang-mywebapp-prod
PORT_ADDR    := 8080
CONT_VER     := v1.0

.PHONY: all help c b run p cl

all: run

help:
	@echo ""
	@tput setaf 3
	@echo "[HELP COMMANDS]"
	@echo " make    : Run the compiled program"
	@echo " make c  : Build the container"
	@echo " make b  : Run compilation"
	@echo " make p  : Create minimal docker container for current program"
	@echo " make cl : Clean all build outputs"
	@tput sgr0

c:
	$(info =>>> Build the container for further compilation...)
	docker build --target builder --build-arg MYWORKDIR=$(TARGET) \
	  -t $(APPNAME_DEV):$(CONT_VER) -f Dockerfile .
	@echo "[BUILD]"

b: build/Compile
	@echo "[COMPILE]"

run: build/Run
	@echo "[RUN]"

p: build/Production
	@echo "[PRODUCTION]"

build/Compile:
	$(info =>>> Go lang compilation...)
	docker run --rm -ti --read-only --name $(APPNAME_DEV) \
	  -v $(SOURCE_CFG):$(TARGET_CFG1) -v $(SOURCE_CFG):$(TARGET_CFG2) \
	  -v $(SOURCE):$(TARGET) $(APPNAME_DEV):$(CONT_VER) go build -o $(TARGET_NAME)

build/Run:
	$(info =>>> Run the Go program...)
	docker run --rm -ti -d --read-only --name $(APPNAME_DEV) -p $(PORT_ADDR):$(PORT_ADDR) \
	  -v $(SOURCE):$(TARGET) --entrypoint "./$(TARGET_NAME)" $(APPNAME_DEV):$(CONT_VER)

build/Production:
	$(info =>>> Optimized PRODUCTION version inside the minimum container...)
	docker build --target production --build-arg PROGNAME=$(TARGET_NAME) \
	  --build-arg MYWORKDIR=$(TARGET) -t $(APPNAME_PROD):$(CONT_VER) -f Dockerfile .
	docker run --rm -ti -d --read-only --name $(APPNAME_PROD) -p $(PORT_ADDR):$(PORT_ADDR) \
	  $(APPNAME_PROD):$(CONT_VER)

cl:
	$(info =>>> Cleaning UP...)
	@[ -f src/$(TARGET_NAME) ] && rm -v src/$(TARGET_NAME) || true
	@echo "[CLEAN]"

