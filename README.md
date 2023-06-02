## Laboratory work VI


## Homework

```sh
lera@Lerra:~$ mkdir lab06
lera@Lerra:~$ cd lab06
lera@Lerra:~/lab06$ git clone https://github.com/Lerra227/lab04
Cloning into 'lab04'...
remote: Enumerating objects: 242, done.
remote: Counting objects: 100% (242/242), done.
remote: Compressing objects: 100% (120/120), done.
remote: Total 242 (delta 121), reused 213 (delta 108), pack-reused 0
Receiving objects: 100% (242/242), 97.63 KiB | 438.00 KiB/s, done.
Resolving deltas: 100% (121/121), done.
lera@Lerra:~/lab06/lab04$ git remote remove origin
lera@Lerra:~/lab06/lab04$ git remote add origin https://github.com/Lerra227/lab06
```
```sh
lera@Lerra:~/lab06/lab04$ nano CPackConfig.cmake
```
```sh
include(InstallRequiredSystemLibraries)

set(CPACK_PACKAGE_CONTACT donotdisturb@yandex.ru)
set(CPACK_PACKAGE_VERSION_MAJOR ${PRINT_VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR ${PRINT_VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH ${PRINT_VERSION_PATCH})
set(CPACK_PACKAGE_VERSION_TWEAK ${PRINT_VERSION_TWEAK})
set(CPACK_PACKAGE_VERSION ${PRINT_VERSION})

set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "static C++ library for printing")

set(CPACK_RESOURCE_FILE_README \${CMAKE_CURRENT_SOURCE_DIR}/README.md)

set(CPACK_RPM_PACKAGE_NAME "solver")
set(CPACK_RPM_PACKAGE_LICENSE "MIT")
set(CPACK_RPM_PACKAGE_GROUP "print-solver")
set(CPACK_RPM_PACKAGE_VERSION CPACK_PACKAGE_VERSION)

set(CPACK_DEBIAN_PACKAGE_NAME "solver")
set(CPACK_DEBIAN_PACKAGE_PREDEPENDS "cmake >= 3.0")
set(CPACK_DEBIAN_PACKAGE_VERSION CPACK_PACKAGE_VERSION)

include(CPack)
```
```sh
lera@Lerra:~/lab06/lab04$ nano CMakeLists.txt
```
```sh
cmake_minimum_required(VERSION 3.4)
project(lab06)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include_directories("formatter_lib")
include_directories("formatter_ex_lib")
include_directories("solver_lib")

add_library(formatter_lib STATIC "formatter_lib/formatter.cpp")
add_library(formatter_ex_lib STATIC "formatter_ex_lib/formatter_ex.cpp")
add_library(solver_lib STATIC "solver_lib/solver.cpp")

add_executable(solver "solver_application/equation.cpp")

target_link_libraries(solver solver_lib formatter_ex_lib formatter_lib)

include(CPackConfig.cmake)

```
```sh
lera@Lerra:~/lab06/lab04$ cd .github/workflows
lera@Lerra:~/lab06/lab04/.github/workflows$ nano CI.yml
```

```sh
name: CMake

on:
  push:
    branches: [main]
    tags: -"v*0.*"
  pull_request:
    branches: [main]
    
env:
  BUILD_TYPE: Release

jobs:
  build_Linux:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v3

      - name: Configure Solver
        run: cmake -H. -B_build -DCPACK_GENERATOR="TGZ"

      - name: Build Solver
        run: cmake --build _build --target package

      - name: Make Solver Package
        run: cd _build && cpack -G "DEB" &&
             cpack -G "RPM" &&
             mkdir ../artifacts &&
             mv *.tar.gz ../artifacts/ &&
             mv *.deb ../artifacts/ &&
             mv *.rpm ../artifacts/
      - name: Publish
        uses: actions/upload-artifact@v2
        with:
          name: DebRpm
          path: artifacts/
```
```sh 
lera@Lerra:~/lab06/lab04/.github/workflows$ cd ..
lera@Lerra:~/lab06/lab04/.github$ cd ..
lera@Lerra:~/lab06/lab04$ git add -A
lera@Lerra:~/lab06/lab04$ git commit -m "ohgod"
[main ee03bef] ohgod
 3 files changed, 39 insertions(+), 31 deletions(-)
lera@Lerra:~/lab06/lab04$ git tag v0.5
lera@Lerra:~/lab06/lab04$ git push origin main --tags
Username for 'https://github.com': Lerra227
Password for 'https://Lerra227@github.com':
Enumerating objects: 13, done.
Counting objects: 100% (13/13), done.
Delta compression using up to 20 threads
Compressing objects: 100% (5/5), done.
Writing objects: 100% (7/7), 956 bytes | 478.00 KiB/s, done.
Total 7 (delta 4), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (4/4), completed with 4 local objects.
To https://github.com/Lerra227/lab06
   bf154ea..ee03bef  main -> main
 * [new tag]         v0.5 -> v0.5
```
```
Copyright (c) 2015-2021 The ISC Authors
```
