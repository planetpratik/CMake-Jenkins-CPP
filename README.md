[![Build Status](https://563cb77d7f12.ngrok.io/buildStatus/icon?job=CMake-Jenkins-CPP%2Fmaster)](https://563cb77d7f12.ngrok.io/job/CMake-Jenkins-CPP/job/master/)

# CMake-Jenkins-CPP Framework  

### A Cross-Platform Modern C++ Project Framework Set Up Using CMake, Jenkins & Vcpkg  
### Build And Test Modern C++ Project Concurrently on macOS, Linux and Windows

#
### Features :-
* **Bootstrap Cross-Platform modern C++ project** with minimum efforts. 
* Supports **Continuous Integration ( CI ) using Jenkins**.
* Supports **Better C++ dependency management using Vcpkg** as a package manager. 

### Project Structure :-
    .  
    ├── build                                  # Build Directory for Project
    │   ├── Linux                              # Linux build  
    │   │   ├── aarch64                        # Linux ( ARM64 ) build ( Raspberry Pi )
    │   ├── macOS                              # macOS ( 64-bit ) build    
    │   ├── Windows                            # Windows build  
    │   │   ├── Win32                          # Windows ( 32-bit ) build   
    │   │   ├── Win64                          # Windows ( 64-bit ) build   
    ├── cmake                                  # CMake related files     
    │   ├── Toolchain                          # Toolchain files for different platforms   
    ├── include                                # Header Files    
    │   ├── Library.Shared                     # Header files for shared library project  
    ├── source                                 # All source files goes here
    │   ├── CMakeLists.txt   
    │   ├── App                                # This project contains .cpp file with main() function    
    │   │   ├── CMakeLists.txt       
    │   │   ├── ...                            # Source files for App project   
    │   ├── Library.Shared                     # Shared Library  
    │   │   ├── CMakeLists.txt       
    │   │   ├── ...                            # Source files for Shared Library     
    │   └── ...                                # Other Libraries  
    └── build.sh  
    └── build.bat
    └── run.sh
    └── run.bat
    └── build.groovy  
    └── vcpkg                                  # This Package manager will be installed as a build step
    └── vcpkg.json                             # Manifest file for Vcpkg to enable versioning
    └── CMakeLists.txt                         # Root CMakeLists file  
    └── Jenkinsfile  
    └── LICENSE    
    └── README.md  

### Prerequisites :-
This Project Requires following Tools to be installed

* [CMake 3.16 (or Above)](https://cmake.org/download/) — Cross-Platform Build Environment
* [Jenkins](https://www.jenkins.io/download) — Latest Jenkins Server for CI / CD
* Your Favorite Compiler Toolchain - GCC, Clang or Mingw64. Also setup your environment PATH variable so compiler toolchain can be accessed by CMake and Jenkins.
* [Mingw64](https://www.msys2.org/) - To use gcc / g++ on Windows, download MSYS2 and follow instructions given on page to install Mingw64.
* [Ninja](https://ninja-build.org/) - To use Ninja build system. Download, Install and Update environment PATH variable to access Ninja from command line.
* [Vcpkg](https://github.com/microsoft/vcpkg) — Latest Vcpkg package manager for dependency management **( Will be installed automatically ).**

### How to Run :-

Before running project, Go to CMake Toolchain folder and update compiler **TOOLCHAIN_PATH** for every required platform toolchain as per your installation location.

This project uses Ninja buildsystem but you can use any other build system easily by modifying **build.sh** or **build.bat** files. Example build systems are **"Unix Makefiles", "MinGW Makefiles"** etc.

Now You're ready to run this project. Clone this repository using following command
```sh
git clone https://github.com/planetpratik/CMake-Jenkins-CPP
```
Add your code under **source**  folder.

Once complete you can build Project manually by running **build&#46;sh** script ( macOS or Linux ) or **build.bat** ( Windows ).
Then you can run project by running **run&#46;sh** script ( macOS or Linux ) or **run&#46;bat** script ( Windows ).

#### You must pass commandline arguments DEBUG or RELEASE while running build script as currently its parameterized to use with Jenkins.

**Jenkinsfile** is coded to do above tasks automatically. You can build this project in jenkins using **"Build with parameters"** option when you open master branch in dashboard / Blue Ocean and it will do everything automatically.

### Notes :-
* To streamline package management process, **vcpkg.json ( vcpkg manifest )** file is used. Once you set appropriate baseline using vcpkg commit history, you can use **"Overrides" or "Constraints"** to freeze dependency(ies) to particular version or set up minimum version constraints. Using baselines, you can also conveniently upgrade all dependencies at once. For more info, you can read this excellent article on Microsoft's website [here](https://devblogs.microsoft.com/cppblog/take-control-of-your-vcpkg-dependencies-with-versioning-support/).

* In this project, glfw3 library is managed using Vcpkg for demonstration purpose. For your project, you most probably won't need it hence you should remove glfw3 entry inside **vcpkg.json** as well as App **CMakeLists.txt** and specify whichever libraries you need along with their versions. Also make sure to link your libraries using **find_package() & target_link_libraries().**


## License:
MIT License

Copyright (c) 2022 Pratik Chougule

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
