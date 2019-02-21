# Makefile for bullet

TARGET = bullet
STATIC_LIB = lib$(TARGET)$(STATIC_LIB_EXT)
SHARED_LIB = lib$(TARGET)$(SHARED_LIB_EXT)

ifeq ($(IS_STATIC),NO)
TARGET_TYPE = dynamic
TARGET_FILE = $(SHARED_LIB)
else
TARGET_TYPE = static
TARGET_FILE = $(STATIC_LIB)
endif

include sources.mk

INCLUDE += -Isrc

CFLAGS = -g -Wall -O3 -std=c++0x
CFLAGS += $(INCLUDE)
CFLAGS += $(DEFINES)

SRC_FILES = $(foreach dir,$(SRC_DIRS),$(wildcard $(dir)/*.cpp))

OBJECTS = $(SRC_FILES:.cpp=.o)

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
	@$(CXX) $(LDFLAGS) -o $(SHARED_LIB) $^ $(LIBRARIES)

%.o : %.cpp
	@echo compiling file $<
	@$(CXX) $(CFLAGS) -c $< -o $@
