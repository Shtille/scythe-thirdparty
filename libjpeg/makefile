# Makefile for libjpeg

TARGET = jpeg
STATIC_LIB = lib$(TARGET)$(STATIC_LIB_EXT)
SHARED_LIB = lib$(TARGET)$(SHARED_LIB_EXT)

include sources.mk

ifeq ($(IS_STATIC),NO)
TARGET_TYPE = dynamic
TARGET_FILE = $(SHARED_LIB)
else
TARGET_TYPE = static
TARGET_FILE = $(STATIC_LIB)
endif

INCLUDE += -Iinclude -Isrc

CFLAGS = -g -Wall -O3 -std=c99
CFLAGS += $(INCLUDE)
CFLAGS += $(DEFINES)

OBJECTS = $(SRC_FILES:.c=.o)

LIBRARIES =

ifeq ($(OS),Windows_NT)
	CLEAN = del /Q /F /S "src\*.o"
else
	CLEAN = find src -name "*.o" -type f -delete
endif

all: $(TARGET)
	@echo $(TARGET_FILE) is done!

$(TARGET): $(TARGET_TYPE)

.PHONY: clean
clean:
	@$(CLEAN)

static: $(OBJECTS)
	@echo making static library
	@$(AR) $(STATIC_LIB) $(OBJECTS)
	
dynamic: $(OBJECTS)
	@echo making shared library
	@$(CC) $(LDFLAGS) -o $(SHARED_LIB) $^ $(LIBRARIES)

%.o : %.c
	@echo compiling file $<
	@$(CC) $(CFLAGS) -c $< -o $@
