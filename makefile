# Makefile for scythe thirdparty

TARGET = thirdparty
SUBDIRS = zlib libpng libjpeg freetype script bullet

ifeq ($(OS),Windows_NT)
	SUBDIRS += glew
endif

all: $(TARGET)

.PHONY: clean
clean:
	@$(foreach directory, $(SUBDIRS), $(MAKE) -C $(directory) clean ;)

$(TARGET): $(SUBDIRS)

$(SUBDIRS):
	@echo Get down to $@
	@$(MAKE) -C $@

.PHONY: $(SUBDIRS)
