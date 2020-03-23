#!/bin/bash

GTEST_PATH="lib/googletest-master/release"

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

cd $GTEST_PATH

echo ">> running make in ${GTEST_PATH}..."
if ! make install; then
	echo ">> error running make install!"
	exit 1
fi

cd ../../..
