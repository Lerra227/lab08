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
set(CPACK_PACKAGE_CONTACT donotwriteme@bmstuisbetterthanhse.com)
set(CPACK_PACKAGE_VERSION_MAJOR \${PRINT_VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR \${PRINT_VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH \${PRINT_VERSION_PATCH})
set(CPACK_PACKAGE_VERSION_TWEAK \${PRINT_VERSION_TWEAK})
set(CPACK_PACKAGE_VERSION \${PRINT_VERSION})

set(CPACK_RESOURCE_FILE_LICENSE \${CMAKE_CURRENT_SOURCE_DIR}/LICENSE)
set(CPACK_RESOURCE_FILE_README \${CMAKE_CURRENT_SOURCE_DIR}/README.md)
set(CPACK_RPM_PACKAGE_NAME "solver_lab")
set(CPACK_RPM_PACKAGE_LICENSE "MIT")
set(CPACK_RPM_PACKAGE_GROUP "solver")
set(CPACK_RPM_PACKAGE_VERSION CPACK_PACKAGE_VERSION)
set(CPACK_DEBIAN_PACKAGE_NAME "libsolvert-lab")
set(CPACK_DEBIAN_PACKAGE_PREDEPENDS "cmake >= 3.0")
set(CPACK_DEBIAN_PACKAGE_VERSION CPACK_PACKAGE_VERSION)
include(CPack)
```
```sh
lera@Lerra:~/lab06/lab04$ cd .github/workflows
lera@Lerra:~/lab06/lab04/.github/workflows$ nano CI.yml
```

```sh
name: CMake

on:
 push:
  branches: [master]
  tags: -"v*1.*"
 pull_request:
  branches: [master]

env:

  BUILD_TYPE: Release
jobs: 
  build:

    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v3
    
    - name: Build
      run: cmake -H. -B_build -DCPACK_GENERATOR="TGZ" && cmake --build _build --target package &&
             cd _build && cpack -G "DEB" &&
             cpack -G "RPM" &&
             mkdir ../artifacts &&
             mv *.tar.gz ../artifacts/ &&
             mv *.deb ../artifacts/ &&
             mv *.rpm ../artifacts/

    - name: Publish
      uses: actions/upload-artifact@v2
      with:
        name: artifact
        path: artifacts/
```
```sh 
lera@Lerra:~/lab06/lab04/.github/workflows$ cd ..
lera@Lerra:~/lab06/lab04/.github$ cd ..
lera@Lerra:~/lab06/lab04$ git add -A
lera@Lerra:~/lab06/lab04$ git commit -m "first06"
[main cf250a4] first06
 2 files changed, 52 insertions(+), 46 deletions(-)
 rewrite .github/workflows/CI.yml (95%)
 create mode 100644 CPackConfig.cmake
lera@Lerra:~/lab06/lab04$ git push origin main
Username for 'https://github.com': Lerra227
Password for 'https://Lerra227@github.com':
Enumerating objects: 10, done.
Counting objects: 100% (10/10), done.
Delta compression using up to 20 threads
Compressing objects: 100% (4/4), done.
Writing objects: 100% (6/6), 1.02 KiB | 1.02 MiB/s, done.
Total 6 (delta 1), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To https://github.com/Lerra227/lab06
   fb40f4c..cf250a4  main -> main
lera@Lerra:~/lab06/lab04$  git tag v0.1
lera@Lerra:~/lab06/lab04$ git push origin main v0.1
Username for 'https://github.com': Lerra227
Password for 'https://Lerra227@github.com':
Total 0 (delta 0), reused 0 (delta 0), pack-reused 0
To https://github.com/Lerra227/lab06
 * [new tag]         v0.1 -> v0.1   
```
```
Copyright (c) 2015-2021 The ISC Authors
```
