#!/bin/bash

# Check LAB_HOME is set
if [ -z "$LAB_HOME" ]; then
  echo "[ERROR] LAB_HOME is not set. Please set it before running this script."
  exit 1
fi
cd "$LAB_HOME" || exit 1

echo $LAB_HOME

TARGET="$1"
TEST_SCRIPT="${LAB_HOME}/test/test_${TARGET}.exp"
XV_HOME="${LAB_HOME}/xv6-riscv"
cd ${XV_HOME} || exit 1

# if expect is not exist, install it. sudo apt install -y expect

make clean
make

${TEST_SCRIPT}
