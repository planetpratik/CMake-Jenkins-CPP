add_executable(app app.cpp)
target_compile_features(app PRIVATE cxx_std_17)
# we can use find_package() command as we have set up vcpkg correctly earlier.
find_package(glfw3 3.3.1 REQUIRED)
if(APPLE)
    target_link_libraries(app PRIVATE glfw Library.Shared "-framework OpenGL")
else()
    target_link_libraries(app PRIVATE glfw Library.Shared)
endif()