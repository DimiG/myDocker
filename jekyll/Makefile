# This is a Makefile to compile the Jekyll application
# By Docker
# Just help to automate the compilation process
# With `make', 'make help' and `make clean'
# Created by: Dmitri G.
# Date: 2019-04-19

### VARIABLEs ###
SOURCE  = /DM/Jekyll/Blog
TARGET  = /srv/jekyll
JEKYLL_VERSION = latest
CONTAINER_NAME = myblog

.PHONY: all help build start cont update new clean

all: start

help:
	@echo "[HELP COMMANDS]"
	@echo " make         : Starting container"
	@echo " make cont    : Create container and Debug"
	@echo " make build   : Build Jekyll site"
	@echo " make update  : Update Jekyll bundle"
	@echo " make new     : Create new Jekyll site"
	@echo " make clean   : Clean all build outputs"

build: build/Release
	@echo "[build]"

start:
	$(info =>>> Starting container...)
	docker start -i $(CONTAINER_NAME)
	@echo "[start]"

cont:
	$(info =>>> Create container and DEBUG...)
	docker run --name $(CONTAINER_NAME) -it -v $(SOURCE):$(TARGET) -w $(TARGET) -p 4000:4000 jekyll/jekyll:$(JEKYLL_VERSION) jekyll serve --watch --drafts
	@echo "[cont]"

build/Release:
	$(info =>>> Build Jekyll site...)
	docker run --rm -it -v $(SOURCE):$(TARGET) -w $(TARGET) jekyll/jekyll:$(JEKYLL_VERSION) jekyll build

update:
	$(info =>>> Update Jekyll bundle...)
	docker run --rm -it -v $(SOURCE):$(TARGET) jekyll/jekyll:$(JEKYLL_VERSION) bundle update
	@echo "[update]"

new:
	$(info =>>> Create the Jekyll site...)
	docker run --rm -it -v $(SOURCE):$(TARGET) jekyll/jekyll:$(JEKYLL_VERSION) jekyll new .
	@echo "[new]"

clean:
	$(info =>>> Cleaning UP...)
	@[ -d Blog/ ] && rm -rfv Blog/ || true
	@echo "[CLEAN]"

