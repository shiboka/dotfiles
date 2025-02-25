#!/bin/sh
cp -r ~/.local/templates/c $1 && rm $1/init.sh
cd $1
cat > CMakeLists.txt <<- EOM
cmake_minimum_required(VERSION 3.15)
project($1 C)
add_executable(\${PROJECT_NAME} src/main.c)
EOM
conan install . --output-folder=build --build=missing
mv build.sh build/
cd build
./build.sh
