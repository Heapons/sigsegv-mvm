#!/bin/bash

CONFIGURE=$(realpath configure.py)
PROJECT_DIR=$(dirname $(realpath $0))
echo $PROJECT_DIR
PATHS="--hl2sdk-root=$PROJECT_DIR/../alliedmodders --mms-path=$PROJECT_DIR/../alliedmodders/metamod-source --sm-path=$PROJECT_DIR/../alliedmodders/sourcemod"

mkdir -p build
cd build
 	CC=gcc CXX=g++ $CONFIGURE $PATHS --sdks=tf2 --enable-debug --exclude-mods-debug --enable-optimize --exclude-mods-visualize --exclude-vgui
cd ..

mkdir -p build/release
pushd build/release
	CC=gcc CXX=g++ $CONFIGURE $PATHS --targets=x86_64,x86 --sdks=tf2,css,sdk2013 --build-all --enable-optimize --exclude-mods-debug --exclude-mods-visualize --exclude-vgui
popd

mkdir -p build/x86
pushd build/x86
	CC=gcc CXX=g++ $CONFIGURE $PATHS --targets=x86 --sdks=tf2 --enable-optimize --exclude-mods-debug --exclude-mods-visualize --exclude-vgui
popd

mkdir -p build/x64
pushd build/x64
	CC=gcc CXX=g++ $CONFIGURE $PATHS --targets=x86_64 --sdks=tf2 --enable-optimize --exclude-mods-debug --exclude-mods-visualize --exclude-vgui
popd

#mkdir -p build/clang
#pushd build/clang
#	CC=clang CXX=clang++ $CONFIGURE $PATHS --sdks=tf2 --enable-debug
#popd
