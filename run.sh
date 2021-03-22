#!/bin/zsh
if [[ "$OSTYPE" == "darwin"* ]]; then
    cd build/macOS/source/App/
    ./app
else
    echo "macOS not detected. Run this script on macOS computer only."
fi