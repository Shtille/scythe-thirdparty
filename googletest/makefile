# Makefile for googletest

ifeq ($(LIBRARY_PATH),)
	$(error LIBRARY_PATH should be set by parent makefile with absolute path)
endif

TARGET = googletest
TARGET_NAME = googletest
STATIC_LIB = $(LIBRARY_PATH)/lib$(TARGET_NAME)$(STATIC_LIB_EXT)
SHARED_LIB = $(LIBRARY_PATH)/lib$(TARGET_NAME)$(SHARED_LIB_EXT)

ifeq ($(IS_STATIC),NO)
TARGET_TYPE = dynamic
TARGET_FILE = $(SHARED_LIB)
else
TARGET_TYPE = static
TARGET_FILE = $(STATIC_LIB)
endif

INCLUDE = -Iinclude -I.
DEFINES =

include sources.mk

# intermediate directory for generated object files
OBJDIR := .o
# intermediate directory for generated dependency files
DEPDIR := .d

# object files, auto generated from source files
OBJECTS := $(patsubst %,$(OBJDIR)/%.o,$(basename $(SRC_FILES)))
# dependency files, auto generated from source files
DEPS := $(patsubst %,$(DEPDIR)/%.d,$(basename $(SRC_FILES)))

# compilers (at least gcc and clang) don't create the subdirectories automatically
ifeq ($(OS),Windows_NT)
$(foreach dir,$(subst /,\\,$(dir $(OBJECTS))),$(shell if not exist $(dir) mkdir $(dir)))
$(foreach dir,$(subst /,\\,$(dir $(DEPS))),$(shell if not exist $(dir) mkdir $(dir)))
else
$(shell mkdir -p $(dir $(OBJECTS)) >/dev/null)
$(shell mkdir -p $(dir $(DEPS)) >/dev/null)
endif

# C flags
CFLAGS := -std=c99
# C++ flags
CXXFLAGS := -std=c++0x
# C/C++ flags
CPPFLAGS := -g -Wall -O3
#CPPFLAGS += -Wextra -pedantic
CPPFLAGS += $(INCLUDE)
CPPFLAGS += $(DEFINES)
# linker flags
LDFLAGS +=
LDLIBS =
# flags required for dependency generation; passed to compilers
DEPFLAGS = -MT $@ -MD -MP -MF $(DEPDIR)/$*.Td

# compile C source files
COMPILE.c = $(CC) $(DEPFLAGS) $(CFLAGS) $(CPPFLAGS) -c -o $@
# compile C++ source files
COMPILE.cc = $(CXX) $(DEPFLAGS) $(CXXFLAGS) $(CPPFLAGS) -c -o $@
# link object files to static/shared library
ifeq ($(IS_STATIC),NO)
	LINK.o = $(CXX) $(LDFLAGS) $(LDLIBS) -o $@
else
	LINK.o = $(AR) $@
endif
# precompile step
PRECOMPILE =
# postcompile step
ifeq ($(OS),Windows_NT)
	POSTCOMPILE = MOVE /Y $(DEPDIR)\\$(subst /,\\,$*.Td) $(DEPDIR)\\$(subst /,\\,$*.d)
else
	POSTCOMPILE = mv -f $(DEPDIR)/$*.Td $(DEPDIR)/$*.d
endif

ifeq ($(OS),Windows_NT)
	CLEAN = rmdir /Q /S $(OBJDIR) && rmdir /Q /S $(DEPDIR)
else
	CLEAN = rm -r $(OBJDIR) $(DEPDIR)
endif

all: $(TARGET)

.PHONY: clean
clean:
	@$(CLEAN)

.PHONY: install
install:
	@echo no install tasks configured

.PHONY: uninstall
uninstall:
	@echo no uninstall tasks configured

.PHONY: help
help:
	@echo available targets: all clean

$(TARGET): $(TARGET_FILE)

$(TARGET_FILE): $(OBJECTS)
	@echo linking $@
	@$(LINK.o) $(OBJECTS)

$(OBJDIR)/%.o: %.cc
$(OBJDIR)/%.o: %.cc $(DEPDIR)/%.d
	@$(PRECOMPILE)
	@echo compiling $<
	@$(COMPILE.cc) $<
	@$(POSTCOMPILE)

.PRECIOUS = $(DEPDIR)/%.d
$(DEPDIR)/%.d: ;

-include $(DEPS)