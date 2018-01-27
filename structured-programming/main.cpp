#include <iostream>

using namespace std;

#include "motorcycle.hpp"

int main() {
    cMotorcycle mine("Family", "Sport Roda 3", "1001", "RI 1");

    mine >> cout;

    return 0;
}