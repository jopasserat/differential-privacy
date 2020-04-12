#!/bin/bash

DP_DIR=$(readlink -f $(dirname $0)/../../)

mkdir -p python
cp main.py carrots.py animals_and_carrots.csv python/

swig -I../../ -I../../bazel-differential-privacy/external/com_google_protobuf/src -I../../bazel-out/k8-fastbuild/bin -python -cpperraswarn -c++ -outdir python -o python/carrot_wrap.cxx carrot.i

cd python

g++ -c -fpic carrot_wrap.cxx -I ${DP_DIR}/ -I ${DP_DIR}/bazel-differential-privacy/external/com_google_absl -I ${DP_DIR}/bazel-differential-privacy/external/com_google_protobuf/src -I ${DP_DIR}/bazel-out/k8-fastbuild/bin -I/usr/include/python3.8

g++ -shared carrot_wrap.o -L ${DP_DIR}/bazel-bin/differential_privacy/swig -o _carrot.so -ldifferential-privacy

LD_LIBRARY_PATH=${DP_DIR}/bazel-bin/differential_privacy/swig python3 main.py

