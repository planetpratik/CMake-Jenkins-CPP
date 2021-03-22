#pragma once

namespace HelloWorld
{
  class Num 
  {
      private:
          int num;
      public:
          Num();
          Num(int n);
          int getNum() const;
  };
}