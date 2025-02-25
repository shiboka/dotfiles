#!/bin/sh
npm create vite@latest $1 -- --template react -y
cd $1
cp -r ~/.local/templates/crow-react/* . && rm init.sh
cat > CMakeLists.txt <<- EOM
cmake_minimum_required(VERSION 3.15)
project($1 CXX)
find_package(Crow REQUIRED)
add_executable(\${PROJECT_NAME} src/main.cpp)
target_link_libraries(\${PROJECT_NAME} Crow::Crow)
EOM
conan install . --output-folder=build --build=missing
mv build.sh build/
npm install
npm run build
cd build
./build.sh
