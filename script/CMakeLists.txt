project(script)

set(CMAKE_CXX_STANDARD 14)
set(SRC_DIRS src)
set(include_directories 
  src
)
#set(defines )

foreach(DIR ${SRC_DIRS})
  file(GLOB DIR_SOURCE ${CMAKE_CURRENT_SOURCE_DIR}/${DIR}/*.cpp)
  set(SRC_FILES ${SRC_FILES} ${DIR_SOURCE})
endforeach(DIR)

add_library(${PROJECT_NAME} STATIC ${SRC_FILES})
target_include_directories(${PROJECT_NAME} PRIVATE ${include_directories})
#target_compile_definitions(${PROJECT_NAME} PRIVATE ${defines})