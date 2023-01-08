cmake_minimum_required(VERSION 3.14)
project(stmc LANGUAGES Fortran CXX)
set(VERSION_MAJOR 1)
set(VERSION_MINOR 0)
set(CMAKE_EXPORT_COMPILE_COMMANDS true)
set(CMAKE_CXX_INCLUDE_WHAT_YOU_USE "/usr/bin/include-what-you-use")
set(CMAKE_CXX_STANDARD 11) # GoogleTest requires at least C++11
set(CMAKE_CXX_FLAGS="-g -O0 -Wall -W -Wshadow -Wunused-variable -Wunused-parameter -Wunused-function -Wunused -Wno-system-headers -Wno-deprecated -Woverloaded-virtual -Wwrite-strings -fprofile-arcs -ftest-coverage")
set(CMAKE_C_FLAGS="-g -O0 -Wall -W -fprofile-arcs -ftest-coverage")
set(CMAKE_SHARED_LINKER_FLAGS="-fprofile-arcs -ftest-coverage")
set(CMAKE_EXE_LINKER_FLAGS="-fprofile-arcs -ftest-coverage")

#build the test runner
include_directories(external/googletest/googletest/include)
include_directories(external/googletest/googlemock/include)
add_subdirectory(external/googletest)
link_directories(external/googletest/build/lib)

# build a fortran library
include_directories(src/ForLib)
FILE(GLOB ForLibSources src/ForLib/get_double.f src/ForLib/rmafun.f)
add_library(forlib SHARED ${ForLibSources})
set_target_properties(forlib PROPERTIES LINKER_LANGUAGE Fortran)
link_directories(${CMAKE_CURRENT_BINARY_DIR})

# build a test
FILE(GLOB testSources tests/test-forlib/test-01-sampling-statistics/*.cpp)
add_executable(test-01-sampling-statistics ${testSources} )
target_link_libraries(test-01-sampling-statistics gtest_main gtest gmock forlib)

# use ctest to run tests
enable_testing ()
add_test(run-test-01-sampling-statistics test-01-sampling-statistics)

# # build an installer
# include (InstallRequiredSystemLibraries)
# install(TARGETS dspack RUNTIME DESTINATION "/usr/share/lib" )
# SET(CPACK_DEBIAN_PACKAGE_MAINTAINER "wilsonify")
# SET(CPACK_PACKAGE_NAME "libdspack")
# SET(CPACK_PACKAGE_VERSION_MAJOR "${VERSION_MAJOR}")
# SET(CPACK_PACKAGE_VERSION_MINOR "${VERSION_MINOR}")
# #SET(CPACK_SOURCE_GENERATOR "TGZ")
# SET(CPACK_GENERATOR "DEB")
# INCLUDE(CPack)