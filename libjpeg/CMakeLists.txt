project(jpeg)

#set(SRC_DIRS src)
set(include_directories 
  include 
  src
)
#set(defines )

set(SRC_FILES
  src/jaricom.c
  src/jcapimin.c
  src/jcapistd.c
  src/jcarith.c
  src/jccoefct.c
  src/jccolor.c
  src/jcdctmgr.c
  src/jchuff.c
  src/jcinit.c
  src/jcmainct.c
  src/jcmarker.c
  src/jcmaster.c
  src/jcomapi.c
  src/jcparam.c
  src/jcprepct.c
  src/jcsample.c
  src/jctrans.c
  src/jdapimin.c
  src/jdapistd.c
  src/jdarith.c
  src/jdatadst.c
  src/jdatasrc.c
  src/jdcoefct.c
  src/jdcolor.c
  src/jddctmgr.c
  src/jdhuff.c
  src/jdinput.c
  src/jdmainct.c
  src/jdmarker.c
  src/jdmaster.c
  src/jdmerge.c
  src/jdpostct.c
  src/jdsample.c
  src/jdtrans.c
  src/jerror.c
  src/jfdctflt.c
  src/jfdctfst.c
  src/jfdctint.c
  src/jidctflt.c
  src/jidctfst.c
  src/jidctint.c
  src/jmemmgr.c
  src/jmemnobs.c
  src/jquant1.c
  src/jquant2.c
  src/jutils.c
  src/transupp.c
)

#foreach(DIR ${SRC_DIRS})
#  file(GLOB DIR_SOURCE ${CMAKE_CURRENT_SOURCE_DIR}/${DIR}/*.c)
#  set(SRC_FILES ${SRC_FILES} ${DIR_SOURCE})
#endforeach(DIR)

add_library(${PROJECT_NAME} STATIC ${SRC_FILES})
target_include_directories(${PROJECT_NAME} PRIVATE ${include_directories})
#target_compile_definitions(${PROJECT_NAME} PRIVATE ${defines})