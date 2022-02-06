@echo off
:: Check if user's windows os is 32-bit or 64-bit.
reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set CURRENT_OS=32BIT || set CURRENT_OS=64BIT
:: If OS is 32-Bit, following code is executed.
if %CURRENT_OS%==32BIT (
    cd build/Windows/Win32/source/App/
    REM Executing GUI app will run it as a service on slave and test will fail hence disabled.
    REM app
 ) else (
    :: If OS is 64-Bit, following code is executed.
    if %CURRENT_OS%==64BIT (
    cd build/Windows/Win64/source/App/
    REM Executing GUI app will run it as a service on slave and test will fail hence disabled.
    REM app
    ) 
 )
