#!/bin/bash

DP_DIR=$(readlink -f $(dirname $0))/..

mkdir -p jvm
cp main.java reuse_jvm.scala jvm/

swig -java -c++ -outdir jvm -o jvm/carrot_wrap.cxx carrot.i

cd jvm

g++ -c -fpic carrot_wrap.cxx -I ${DP_DIR}/ -I ${DP_DIR}/bazel-differential-privacy/external/com_google_absl -I /usr/lib/jvm/java-8-openjdk-amd64/include/ -I /usr/lib/jvm/java-8-openjdk-amd64/include/linux

g++ -shared carrot_wrap.o \
  -L ${DP_DIR}/bazel-out/k8-fastbuild/bin/differential_privacy/algorithms -L ${DP_DIR}/bazel-differential-privacy/bazel-out/k8-fastbuild/bin/differential_privacy/base -L ${DP_DIR}/bazel-out/k8-fastbuild/bin/external/com_google_absl/absl/container -L ${DP_DIR}/bazel-out/k8-fastbuild/bin/external/com_google_absl/absl/synchronization -L ${DP_DIR}/bazel-out/k8-fastbuild/bin/external/com_google_absl/absl/debugging -L ${DP_DIR}/bazel-out/k8-fastbuild/bin/external/com_google_absl/absl/base -L ${DP_DIR}/bazel-out/k8-fastbuild/bin/external/com_google_absl/absl/time -L ${DP_DIR}/bazel-out/k8-fastbuild/bin/external/com_google_absl/absl/numeric -L ${DP_DIR}/bazel-out/k8-fastbuild/bin/external/com_google_absl/absl/strings -L ${DP_DIR}/bazel-out/k8-fastbuild/bin/external/com_google_absl/absl/time/internal/cctz -L ${DP_DIR}/bazel-out/k8-fastbuild/bin/external/com_google_absl/absl/hash -L ${DP_DIR}/bazel-out/k8-fastbuild/bin/external/com_google_absl/absl/container \
  -o libcarrot.so \
  -lhashtablez_sampler -lsynchronization -lsymbolize -lmalloc_internal -lraw_logging_internal -lbase -lspinlock_wait -ldemangle_internal -ldebugging_internal -ldynamic_annotations -lstacktrace -ltime -lint128 -lstrings -lthrow_delegate  -linternal -lcivil_time -ltime_zone -lgraphcycles_internal -lhash -lutil -lcanonical_errors -lbase -lstatus -lcity -lraw_hash_set -lstatusor -llogging

javac *.java

LD_LIBRARY_PATH=${DP_DIR}/bazel-out/k8-fastbuild/bin/differential_privacy/algorithms:${DP_DIR}/bazel-differential-privacy/bazel-out/k8-fastbuild/bin/differential_privacy/base:${DP_DIR}/bazel-out/k8-fastbuild/bin/external/com_google_absl/absl/container:${DP_DIR}/bazel-out/k8-fastbuild/bin/external/com_google_absl/absl/synchronization:${DP_DIR}/bazel-out/k8-fastbuild/bin/external/com_google_absl/absl/debugging:${DP_DIR}/bazel-out/k8-fastbuild/bin/external/com_google_absl/absl/base:${DP_DIR}/bazel-out/k8-fastbuild/bin/external/com_google_absl/absl/time:${DP_DIR}/bazel-out/k8-fastbuild/bin/external/com_google_absl/absl/numeric:${DP_DIR}/bazel-out/k8-fastbuild/bin/external/com_google_absl/absl/time/internal/cctz:${DP_DIR}/bazel-out/k8-fastbuild/bin/external/com_google_absl/absl/strings:${DP_DIR}/bazel-out/k8-fastbuild/bin/external/com_google_absl/absl/time/internal/cctz:${DP_DIR}/bazel-out/k8-fastbuild/bin/external/com_google_absl/absl/hash:${DP_DIR}/bazel-out/k8-fastbuild/bin/external/com_google_absl/absl/container:.:${LD_LIBRARY_PATH} java main

### test reuse in Scala

LD_LIBRARY_PATH=${DP_DIR}/bazel-out/k8-fastbuild/bin/differential_privacy/algorithms:${DP_DIR}/bazel-differential-privacy/bazel-out/k8-fastbuild/bin/differential_privacy/base:${DP_DIR}/bazel-out/k8-fastbuild/bin/external/com_google_absl/absl/container:${DP_DIR}/bazel-out/k8-fastbuild/bin/external/com_google_absl/absl/synchronization:${DP_DIR}/bazel-out/k8-fastbuild/bin/external/com_google_absl/absl/debugging:${DP_DIR}/bazel-out/k8-fastbuild/bin/external/com_google_absl/absl/base:${DP_DIR}/bazel-out/k8-fastbuild/bin/external/com_google_absl/absl/time:${DP_DIR}/bazel-out/k8-fastbuild/bin/external/com_google_absl/absl/numeric:${DP_DIR}/bazel-out/k8-fastbuild/bin/external/com_google_absl/absl/time/internal/cctz:${DP_DIR}/bazel-out/k8-fastbuild/bin/external/com_google_absl/absl/strings:${DP_DIR}/bazel-out/k8-fastbuild/bin/external/com_google_absl/absl/time/internal/cctz:${DP_DIR}/bazel-out/k8-fastbuild/bin/external/com_google_absl/absl/hash:${DP_DIR}/bazel-out/k8-fastbuild/bin/external/com_google_absl/absl/container:.:${LD_LIBRARY_PATH} scala reuse_jvm.scala


