#include <iostream>
#include "../../include/Library.Shared/Num.hpp"

using namespace HelloWorld;

int main(int, char**) 
{
        Num n(10);
        std::cout <<"Hello World, "<<n.getNum()<<std::endl;
        return 0;
}