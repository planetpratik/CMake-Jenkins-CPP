# Optionally glob, but only for CMake 3.12 or later:

file(GLOB LIBRARY_SHARED_HEADER_FILES CONFIGURE_DEPENDS "${HelloWorld_SOURCE_DIR}/include/Library.Shared/*.hpp")
#set(LIBRARY_SHARED_HEADER_FILES "${HelloWorld_SOURCE_DIR}/include/Library.Shared/example.hpp")

# Make an automatic library - will be static or dynamic based on user setting
add_library(Library.Shared Num.cpp ${LIBRARY_SHARED_HEADER_FILES})

# We need this directory, and users of our library will need it too
target_include_directories(Library.Shared PUBLIC ../../include)

# This depends on (header only) library e.g., boost
#target_link_libraries(Library.Shared PRIVATE Boost::boost)

# All users of this library will need at least C++17
target_compile_features(Library.Shared PUBLIC cxx_std_17)

# IDEs should put the headers in a nice place
source_group(
  TREE "${PROJECT_SOURCE_DIR}/include/Library.Shared"
  PREFIX "Header Files"
  FILES ${LIBRARY_SHARED_HEADER_FILES})