@echo off
:: Windows uses back slash ( \ ) for paths. %~dp0 will return path with back slashes, which we need to replace with forward slashes ( / )
:: Get Current batch file directory which is project root directory and replace \ with / for compatibility with CMake.
set Batch_File_Path=%~dp0
set Batch_File_Path=%Batch_File_Path:\=/%
:: Check if user's windows os is 32-bit or 64-bit.
reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set CURRENT_OS=32BIT || set CURRENT_OS=64BIT
:: If OS is 32-Bit, following code is executed.
if %CURRENT_OS%==32BIT (
 if not exist "%~dp0\build\Windows\Win32" (
     mkdir "%~dp0\build\Windows\Win32"
 ) 
 :: As we are using vcpkg package manager, download and bootstrap it before using.
 if not exist "%~dp0\vcpkg\vcpkg" (
     git clone https://github.com/microsoft/vcpkg.git
    .\vcpkg\bootstrap-vcpkg.bat -disableMetrics
 ) 
 :: To enable versioning support in vcpkg, this flag must be set before.
 set VCPKG_FEATURE_FLAGS=versions
 :: Save project root directory as we will need it to correctly provide vcpkg path in toolchain
 set HELLOWORLD_ROOT_DIRECTORY=%Batch_File_Path%
 ::Specifiy correct triplet you wish to use. If not specified, vcpkg will choose tirplet automatically based on compiler. 
 set VCPKG_TARGET_TRIPLET=x86-windows
 cmake -B build/Windows/Win32 -G "Ninja" -DCMAKE_BUILD_TYPE=%1 -DCMAKE_TOOLCHAIN_FILE=cmake/Toolchain/x86-32-Windows.cmake
 cd build\Windows\Win32
 :: cmake --build . -- VERBOSE=1
 cmake --build .
)
:: If OS is 64-Bit, following code is executed.
if %CURRENT_OS%==64BIT (
 if not exist "%~dp0\build\Windows\Win64" (
     mkdir "%~dp0\build\Windows\Win64"
 ) 
 :: As we are using vcpkg package manager, download and bootstrap it before using.
 if not exist "%~dp0\vcpkg\vcpkg" (
     git clone https://github.com/microsoft/vcpkg.git
    .\vcpkg\bootstrap-vcpkg.bat -disableMetrics
 ) 
 :: To enable versioning support in vcpkg, this flag must be set before.
 set VCPKG_FEATURE_FLAGS=versions
 :: Save project root directory as we will need it to correctly provide vcpkg path in toolchain
 set HELLOWORLD_ROOT_DIRECTORY=%Batch_File_Path%
 ::Specifiy correct triplet you wish to use. If not specified, vcpkg will choose tirplet automatically based on compiler. 
 set VCPKG_TARGET_TRIPLET=x64-windows
 cmake -B build/Windows/Win64 -G "Ninja" -DCMAKE_BUILD_TYPE=%1 -DCMAKE_TOOLCHAIN_FILE=cmake/Toolchain/x86-64-Windows.cmake
 cd build\Windows\Win64
 :: cmake --build . -- VERBOSE=1
 cmake --build .
)