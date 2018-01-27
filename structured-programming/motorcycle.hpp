#include <iostream>
#include <string>

using namespace std;

class cMotorcycle {
    string mMerk;
    string mType;
    string mSerialNum;
    string mRegNum;
public:
    cMotorcycle(string merk, string type, string serialNum, string regNum);

    string merk() const;
    string type() const;
    string serialNum() const;
    string regNum() const;

    void setMerk(string merk);
    void setType(string type);
    void setSerialNum(string serialNum);
    void setRegNum(string regNum);

    cMotorcycle& operator>>(ostream &out);
};
