#
# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# The files in this directory offer an example of how to use the C++
# Differential Privacy library.

licenses(["notice"])  # Apache v2.0


cc_binary(
    name = "libdifferential-privacy.so",
    linkshared = 1,
    srcs = ["animals_and_carrots.cc", "animals_and_carrots.h"],
    deps = [
        "//differential_privacy/algorithms:algorithm",
        "//differential_privacy/algorithms:approx-bounds",
        "//differential_privacy/algorithms:binary-search",
        "//differential_privacy/algorithms:bounded-algorithm",
        "//differential_privacy/algorithms:bounded-mean",
        "//differential_privacy/algorithms:bounded-standard-deviation",
        "//differential_privacy/algorithms:bounded-sum",
        "//differential_privacy/algorithms:bounded-variance",
        "//differential_privacy/algorithms:count",
        "//differential_privacy/algorithms:numerical-mechanisms",
        "//differential_privacy/algorithms:order-statistics",
        "//differential_privacy/algorithms:rand",
        "//differential_privacy/algorithms:util",
        "//differential_privacy/base:canonical_errors",
        "//differential_privacy/base:logging",
        "//differential_privacy/base:percentile",
        "//differential_privacy/base:status",
        "//differential_privacy/base:statusor",
        "//differential_privacy/base:statusor_internals",
        "//differential_privacy/proto:data_cc_proto",
        "//differential_privacy/proto:summary_cc_proto",
        "//differential_privacy/proto:util-lib"
        ],
    )

