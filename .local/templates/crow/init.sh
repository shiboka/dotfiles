#!/bin/sh
cp -r ~/.local/templates/crow $1 && rm $1/init.sh
cd $1
cat > CMakeLists.txt <<- EOM
cmake_minimum_required(VERSION 3.15)
project($1 CXX)
find_package(Crow REQUIRED)
add_executable(\${PROJECT_NAME} src/main.cpp)
target_link_libraries(\${PROJECT_NAME} Crow::Crow)
EOM
conan install . --output-folder=build --build=missing
mv build.sh build/
cd build
./build.sh
