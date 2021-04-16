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
    cmake -B build/macOS -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=$1 -DCMAKE_TOOLCHAIN_FILE=cmake/Toolchain/x86-64-macOS.cmake
    cd build/macOS
    # cmake --build . -- VERBOSE=1
    cmake --build .
else
    echo "macOS not detected. Run this script on macOS 64-Bit computer only."
fi