#!/bin/zsh
if [[ "$OSTYPE" == "darwin"* ]]; then
    cd build/macOS/source/App/
    ./app
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    cd build/Linux/aarch64/source/App/
    # Disable running executable until Headless rendering is set up.
    #./app
else
    echo "macOS ( 64-bit ) or Linux ( ARM-64 ) not detected. For windows platform, use run.bat file."
fi