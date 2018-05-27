# Makefile for scythe thirdparty

SUBDIRS = zlib libpng libjpeg freetype script

ifeq ($(OS),Windows_NT)
	SUBDIRS += glew
endif

all: $(SUBDIRS)

clean:
	@for dir in {$(SUBDIRS)} do ($(MAKE) -C $dir clean) done

$(SUBDIRS):
	@echo Get down to $@
	@$(MAKE) -C $@

.PHONY: $(SUBDIRS)