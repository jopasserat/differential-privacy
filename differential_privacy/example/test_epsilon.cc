//
// Copyright 2019 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#include "absl/flags/flag.h"
#include "absl/strings/str_format.h"
#include "differential_privacy/algorithms/confidence-interval.pb.h"
#include "differential_privacy/algorithms/util.h"
#include "differential_privacy/example/animals_and_carrots.h"
#include "differential_privacy/proto/data.pb.h"
#include "differential_privacy/proto/util.h"

using absl::PrintF;
using differential_privacy::BoundingReport;
using differential_privacy::ConfidenceInterval;
using differential_privacy::DefaultEpsilon;
using differential_privacy::GetValue;
using differential_privacy::Output;
using differential_privacy::example::CarrotReporter;
using differential_privacy::base::StatusOr;

ABSL_FLAG(std::string, CarrotsDataFile,
          "differential_privacy/example/animals_and_carrots.csv",
          "Path to the datafile where the data is stored on the number of "
          "carrots each animal has eaten.");

int main(int argc, char **argv) {

  PrintF(
      "\nDefaultEpsilon = %f",
      DefaultEpsilon()
      );
  PrintF(
      "\nXorStrings = %x",
      differential_privacy::XorStrings("aaaa", "aa")
      );
}

