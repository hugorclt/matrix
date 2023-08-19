#include "Vector.hpp"


int main() {
    mat::Vector<int> vec1(std::vector<int> (2, 2));
    mat::Vector<int> vec2(std::vector<int> (2, 2));

    vec1.compareVector(vec2);
}