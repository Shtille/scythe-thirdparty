project(png)

#set(SRC_DIRS src)
set(include_directories 
  include 
  src
  ../zlib/include
  ../zlib/src
)
set(defines
  PNG_USER_WIDTH_MAX=16384
  PNG_USER_HEIGHT_MAX=16384
)

set(SRC_FILES
  src/png.c
  src/pngerror.c
  src/pngget.c
  src/pngmem.c
  src/pngpread.c
  src/pngread.c
  src/pngrio.c
  src/pngrtran.c
  src/pngrutil.c
  src/pngset.c
  src/pngtrans.c
  src/pngwio.c
  src/pngwrite.c
  src/pngwtran.c
  src/pngwutil.c
)

#foreach(DIR ${SRC_DIRS})
#  file(GLOB DIR_SOURCE ${CMAKE_CURRENT_SOURCE_DIR}/${DIR}/*.c)
#  set(SRC_FILES ${SRC_FILES} ${DIR_SOURCE})
#endforeach(DIR)

add_library(${PROJECT_NAME} STATIC ${SRC_FILES})
target_include_directories(${PROJECT_NAME} PRIVATE ${include_directories})
target_compile_definitions(${PROJECT_NAME} PRIVATE ${defines})