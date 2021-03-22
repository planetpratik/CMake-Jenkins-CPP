#!/bin/zsh
if [[ "$OSTYPE" == "darwin"* ]]; then
    if [ ! -d build/macOS ]; then
    mkdir build/macOS
    fi
    cmake -B build/macOS -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=$1 -DCMAKE_TOOLCHAIN_FILE=cmake/Toolchain/x86-64-macOS.cmake
    cd build/macOS
    # cmake --build . -- VERBOSE=1
    cmake --build .
else
    echo "macOS not detected. Run this script on macOS computer only."
fi