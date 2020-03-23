#!/bin/bash

GMOCK_MASTER="master"
LIB_DIR="lib"
GMOCK_DIR="$LIB_DIR/googletest-master"
GMOCK_ZIP="${GMOCK_MASTER}.zip"
GMOCK_ZIP_URL="https://github.com/google/googletest/archive/master.zip"

function setup_build_directory()
{
    cd ${GMOCK_DIR}
    build_name=$1
    dir_name=$(echo $build_name | tr '[:upper:]' '[:lower:]')
    if [ ! -d "$dir_name" ]; then
        echo ">> creating $dir_name directory..."
        mkdir $dir_name
    fi
    echo ">> running cmake in ${GMOCK_DIR}/${dir_name}..."
    cd $dir_name 
    if ! cmake .. -DCMAKE_BUILD_TYPE=$build_name > /dev/null; then
        echo ">> error running cmake!"
        exit 1
    fi
    echo ">> running make in ${GMOCK_DIR}/${dir_name}..."
    if ! make > /dev/null; then
        echo ">> error running make!"
        exit 1
    fi
    cd ../../..
}

function setup_gmock()
{
    if [ ! -d "$GMOCK_DIR" ]; then
        echo ">> downloading gmock..."
        cd "$LIB_DIR"
        if ! wget $GMOCK_ZIP_URL > /dev/null; then
            echo ">> error running wget!"
            exit 1
        fi
        echo ">> uncompressing zip..."
        if ! unzip $GMOCK_ZIP > /dev/null; then
            echo ">> error running unzip!"
            exit 1
        fi
        cd ..
    fi
}

setup_gmock
setup_build_directory "Release"

exit 0
