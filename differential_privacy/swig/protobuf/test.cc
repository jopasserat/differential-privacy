#include "differential_privacy/proto/data.pb.h"
#include "proto_utils.h"

#include <iostream>
using differential_privacy::ValueType;
using differential_privacy::Output;

int main() {

  ValueType v = ValueType();
  v.set_int_value(42);

  std::cout << v.int_value() << std::endl;

  Output o = Output();

  return 0;
}

