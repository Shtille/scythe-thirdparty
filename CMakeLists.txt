cmake_minimum_required(VERSION 3.5.0 FATAL_ERROR)

project(thirdparty)

add_subdirectory(bullet)
add_subdirectory(freetype)
if (WIN32)
	add_subdirectory(glew)
endif()
add_subdirectory(googletest)
add_subdirectory(libjpeg)
add_subdirectory(libpng)
add_subdirectory(script)
add_subdirectory(zlib)