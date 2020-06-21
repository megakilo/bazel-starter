#include <iostream>
#include <string>

#include "range/v3/all.hpp" // get everything

int main() {
  std::string s{"hello"};
  // output: h e l l o
  ranges::for_each(s, [](char c) { std::cout << c << ' '; });
  std::cout << std::endl;
}
