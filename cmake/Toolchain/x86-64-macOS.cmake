set(CMAKE_SYSTEM_NAME Darwin)
set(CMAKE_SYSTEM_VERSION 10.15)
set(CMAKE_SYSTEM_PROCESSOR x86_64)
set(TOOLCHAIN_PATH /usr/local/bin)
set(CMAKE_CXX_STANDARD 17)

set(CMAKE_C_COMPILER     "${TOOLCHAIN_PATH}/gcc")
set(CMAKE_CXX_COMPILER   "${TOOLCHAIN_PATH}/g++")

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_CROSS_COMPILING TRUE)

# ${CMAKE_SOURCE_DIR} & ${PROJECT_SOURCE_DIR} are not useful as a input to include statement
# Hence its better to define our own environment variable indicating root directory and use it wherever required.
# Here, we are using variable that we set earlier in build.sh file. Its temporary variable so doesnt pollute env variables.
# We have appended vpckg toolchain at the end of our toolchain ( As per suggested by vcpkg docs )

message(" Project Root Dir :-  $ENV{HELLOWORLD_ROOT_DIRECTORY}")
include($ENV{HELLOWORLD_ROOT_DIRECTORY}/vcpkg/scripts/buildsystems/vcpkg.cmake)