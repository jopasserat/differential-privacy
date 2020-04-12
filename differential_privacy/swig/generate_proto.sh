#!/bin/bash


PROTO_FILES="differential_privacy/algorithms/confidence-interval.proto differential_privacy/proto/data.proto differential_privacy/proto/summary.proto"

run_dir=$(dirname $(readlink -f $0))

cd ${run_dir}/../..

PROTOBUF_TARGET_DIR=differential_privacy/swig/protobuf

protoc --cpp_out ${PROTOBUF_TARGET_DIR} --proto_path . ${PROTO_FILES}
protoc --java_out ${PROTOBUF_TARGET_DIR} --proto_path . ${PROTO_FILES}
protoc --python_out ${PROTOBUF_TARGET_DIR} --proto_path . ${PROTO_FILES}

