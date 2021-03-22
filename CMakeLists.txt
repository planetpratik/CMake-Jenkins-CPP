# Works with CMake 3.12 onwards through 3.16
cmake_minimum_required(VERSION 3.12...3.16)

# Basic project information
project(
    HelloWorld
    VERSION 0.0.1
    DESCRIPTION "A HelloWorld project with CMake"
    LANGUAGES CXX)

if(CMAKE_CXX_COMPILER_ID MATCHES GNU)
    string(APPEND CMAKE_CXX_FLAGS " -fno-rtti " " -fno-exceptions ")
    string(APPEND CMAKE_CXX_FLAGS_DEBUG " -Wsuggest-final-types " " -Wsuggest-final-methods " " -Wsuggest-override ")
    string(APPEND CMAKE_CXX_FLAGS_RELEASE " -O3 " " -Wno-unused ")
endif()
  
if(CMAKE_CXX_COMPILER_ID MATCHES Clang)  
    string(APPEND CMAKE_CXX_FLAGS " -fno-rtti" " -fno-exceptions " " -Qunused-arguments " " -fcolor-diagnostics ")
    string(APPEND CMAKE_CXX_FLAGS_DEBUG " -Wdocumentation ")
    string(APPEND CMAKE_CXX_FLAGS_RELEASE " -O3" " -Wno-unused ")
endif()

# Print C++ compiler flags.
message("C++ compiler flags:  ${CMAKE_CXX_FLAGS}")

# Only execute this block if this is the main project, and not if it is included through add_subdirectory
if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)

    # set CMake C++ standard to C++17
    set(CMAKE_CXX_STANDARD 17)

    # To ensure -std=c++xx instead of -std=g++xx
    set(CMAKE_CXX_EXTENSIONS OFF)

    # To support folders in IDEs
    set_property(GLOBAL PROPERTY USE_FOLDERS ON)
endif()

# The compiled library code is here
add_subdirectory(source)
