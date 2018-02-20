#include "motorcycle.hpp"

cMotorcycle::cMotorcycle(string merk, string type, string serialNum, string regNum) :
    mMerk(merk), mType(type), mSerialNum(serialNum), mRegNum(regNum)
{

}

string cMotorcycle::merk() const {
    return mMerk;
}

string cMotorcycle::type() const {
    return mType;
}

string cMotorcycle::serialNum() const {
    return mSerialNum;
}

string cMotorcycle::regNum() const {
    return mRegNum;
}

void cMotorcycle::setMerk(string merk) {
    mMerk = merk;
}

void cMotorcycle::setType(string type) {
    mType = type;
}

void cMotorcycle::setSerialNum(string serialNum) {
    mSerialNum = serialNum;
}

void cMotorcycle::setRegNum(string regNum) {
    mRegNum = regNum;
}

cMotorcycle& cMotorcycle::operator>>(ostream &out) {
    out << "Motorcycle " << merk() << endl
        << "Type: " << type() << endl
        << "SN  : " << serialNum() << endl
        << "RN  : " << regNum() << endl;

    return *this;
}