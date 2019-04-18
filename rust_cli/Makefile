# This is a Makefile to compile the application
# For Linux platform by Docker
# Just help to Automate the compilation process
# With `make', 'make minimal' and `make clean'
# Created by: Dmitri G.
# Date: 2019-04-17

### VARIABLEs ###
SOURCE  = "/DM/Rust/rust_cli"
TARGET  = "/home/rust/src"
APPNAME = rust_cli

.PHONY: all help release minimal clean

all: release

help:
	@echo "[HELP COMMANDS]"
	@echo " make         : Run Release build for Linux"
	@echo " make minimal : Create minimal docker image for current program"
	@echo " make clean   : Clean all build outputs"

release: build/Release
	@echo "[RELEASE]"

build/Release:
	$(info =>>> Optimized release version for Linux)
	docker run --rm -it -v $(SOURCE):$(TARGET) -w $(TARGET) ekidd/rust-musl-builder cargo build --release 

minimal:
	$(info =>>> Create the Docker image and run the program inside of it)
	docker build -t $(APPNAME) .
	docker run --rm --name $(APPNAME) $(APPNAME)
	@echo "[minimal]"

clean:
	$(info =>>> Cleaning UP...)
	@[ -f Cargo.lock ] && rm -v Cargo.lock || true
	@[ -d target/ ] && rm -rfv target/ || true
	@echo "[CLEAN]"

