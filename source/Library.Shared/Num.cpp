#include "../../include/Library.Shared/Num.hpp"

namespace HelloWorld
{
    Num::Num() : num(10) { }
    Num::Num(int n): num(n) {}
    int Num::getNum() const
    {
        return num; 
    }
}