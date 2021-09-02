# Makefile for scythe thirdparty

TARGET = thirdparty

# Main routine
SUBDIRS = zlib libpng libjpeg freetype script bullet googletest

ifeq ($(OS),Windows_NT)
	SUBDIRS += glew
endif

all: $(TARGET)

.PHONY: clean
clean:
	@$(foreach directory, $(SUBDIRS), $(MAKE) -C $(directory) clean ;)

.PHONY: help
help:
	@echo available targets: all clean

$(TARGET): $(SUBDIRS)

.PHONY: $(SUBDIRS)
$(SUBDIRS):
	@$(MAKE) -C $@ $@
