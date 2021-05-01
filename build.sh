#!/bin/zsh
if [[ "$OSTYPE" == "darwin"* ]]; then
    if [ ! -d build/macOS ]; then
    mkdir build/macOS
    fi
    # As we are using vcpkg package manager, download and bootstrap it before using.
    if [ ! -d vcpkg/vcpkg ]; then
    git clone https://github.com/microsoft/vcpkg.git
    ./vcpkg/bootstrap-vcpkg.sh
    fi
    # To enable versioning support in vcpkg, this flag must be set before.
    export VCPKG_FEATURE_FLAGS=versions
    # Save project root directory as we will need it to correctly provide vcpkg path in toolchain
    export HELLOWORLD_ROOT_DIRECTORY=$PWD
    # Specifiy correct triplet you wish to use. If not specified, vcpkg will choose tirplet automatically based on compiler. 
    export VCPKG_TARGET_TRIPLET=x64-osx
    cmake -B build/macOS -G "Ninja" -DCMAKE_BUILD_TYPE=$1 -DCMAKE_TOOLCHAIN_FILE=cmake/Toolchain/x86-64-macOS.cmake
    cd build/macOS
    # cmake --build . -- VERBOSE=1
    cmake --build .
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if [ ! -d build/Linux/aarch64 ]; then
    mkdir build/Linux/aarch64
    fi
    # As we are using vcpkg package manager, download and bootstrap it before using.
    if [ ! -d vcpkg/vcpkg ]; then
    git clone https://github.com/microsoft/vcpkg.git
    ./vcpkg/bootstrap-vcpkg.sh
    fi
    # To enable versioning support in vcpkg, this flag must be set before.
    export VCPKG_FEATURE_FLAGS=versions
    # Save project root directory as we will need it to correctly provide vcpkg path in toolchain
    export HELLOWORLD_ROOT_DIRECTORY=$PWD
    # Specifiy correct triplet you wish to use. If not specified, vcpkg will choose tirplet automatically based on compiler. 
    export VCPKG_TARGET_TRIPLET=arm64-linux
    # Environment variable VCPKG_FORCE_SYSTEM_BINARIES must be set on ARM and s390x platforms.
    export VCPKG_FORCE_SYSTEM_BINARIES=1
    cmake -B build/Linux/aarch64 -G "Ninja" -DCMAKE_BUILD_TYPE=$1 -DCMAKE_TOOLCHAIN_FILE=cmake/Toolchain/x64-ARM-Linux.cmake
    cd build/Linux/aarch64
    # cmake --build . -- VERBOSE=1
    cmake --build .
else
    echo "macOS ( 64-bit ) or Linux ( ARM-64 ) not detected. For windows platform, run build.bat file."
fi