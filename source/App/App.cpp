/*
This sample main() function uses code copied directly from GLFW documentation.
Purpose of this code is to verify whether Vcpkg has setup dependency correctly or not.
You can find same example on following website.
https://www.glfw.org/docs/3.1/quick.html
*/

#include <GLFW/glfw3.h>
#include <iostream>
#include "../../include/Library.Shared/Num.hpp"

using namespace HelloWorld;

static void error_callback(int error, const char* description)
{
    fputs(description, stderr);
}
static void key_callback(GLFWwindow* window, int key, int scancode, int action, int mods)
{
    if (key == GLFW_KEY_ESCAPE && action == GLFW_PRESS)
        glfwSetWindowShouldClose(window, GL_TRUE);
}

int main(int, char**) 
{
        // Checking Shared library linking by using getNum() function defined in it.
        Num n(10);
        std::cout <<"Hello World, "<<n.getNum()<<std::endl;

        // Checking GLFW linking by creating simple window using sample code.
        GLFWwindow* window;
        glfwSetErrorCallback(error_callback);
        if (!glfwInit())
                exit(EXIT_FAILURE);
        window = glfwCreateWindow(640, 480, "Simple example", NULL, NULL);
        if (!window)
        {
                glfwTerminate();
                exit(EXIT_FAILURE);
        }
        glfwMakeContextCurrent(window);
        glfwSwapInterval(1);
        glfwSetKeyCallback(window, key_callback);
        while (!glfwWindowShouldClose(window))
        {
                float ratio;
                int width, height;
                glfwGetFramebufferSize(window, &width, &height);
                ratio = width / (float) height;
                glViewport(0, 0, width, height);
                glClear(GL_COLOR_BUFFER_BIT);
                glMatrixMode(GL_PROJECTION);
                glLoadIdentity();
                glOrtho(-ratio, ratio, -1.f, 1.f, 1.f, -1.f);
                glMatrixMode(GL_MODELVIEW);
                glLoadIdentity();
                glRotatef((float) glfwGetTime() * 50.f, 0.f, 0.f, 1.f);
                glBegin(GL_TRIANGLES);
                glColor3f(1.f, 0.f, 0.f);
                glVertex3f(-0.6f, -0.4f, 0.f);
                glColor3f(0.f, 1.f, 0.f);
                glVertex3f(0.6f, -0.4f, 0.f);
                glColor3f(0.f, 0.f, 1.f);
                glVertex3f(0.f, 0.6f, 0.f);
                glEnd();
                glfwSwapBuffers(window);
                glfwPollEvents();
        }
        glfwDestroyWindow(window);
        glfwTerminate();
        return 0;
}