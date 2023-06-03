## Laboratory work VIII

```sh
lera@Lerra:~$ git clone https://github.com/Lerra227/lab06 lab08
lera@Lerra:~/lab08$ cat >> Dockerfile <<EOF
.......

```
```sh
lera@Lerra:~/lab08$ sudo apt update
lera@Lerra:~/lab08$ sudo apt install apt-transport-https ca-certificates curl software-properties-common
lera@Lerra:~/lab08$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
lera@Lerra:~/lab08$ echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
lera@Lerra:~/lab08$ docker --version
Docker version 24.0.2, build cb74dfc
lera@Lerra:~/lab08$ sudo service docker status
[sudo] password for lera:
 * Docker is not running
lera@Lerra:~/lab08$ sudo service docker start
 * Starting Docker: docker                                                                                                [ OK ]
lera@Lerra:~/lab08$ sudo service docker status
 * Docker is running
```
```sh 
CMakeLists.txt
```
```sh
cmake_minimum_required(VERSION 3.4)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

option(BUILD_TESTS "Build tests" OFF)

project(print)
set(PRINT_VERSION_MAJOR 0)
set(PRINT_VERSION_MINOR 1)
set(PRINT_VERSION_PATCH 0)
set(PRINT_VERSION_TWEAK 1)
set(PRINT_VERSION
  ${PRINT_VERSION_MAJOR}.${PRINT_VERSION_MINOR}.${PRINT_VERSION_PATCH}.${PRINT_VERSION_TWEAK})
set(PRINT_VERSION_STRING "v${PRINT_VERSION}")

add_library(print STATIC ${CMAKE_CURRENT_SOURCE_DIR}/sources/print.cpp)

target_include_directories(print PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:include>
)

install(TARGETS print
    EXPORT print-config
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib
)

install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/include/ DESTINATION include)
install(EXPORT print-config DESTINATION cmake)

if(BUILD_TESTS)
    enable_testing()
    file(GLOB ${PROJECT_NAME}_TEST_SOURCES tests/*.cpp)
    add_executable(check ${${PROJECT_NAME}_TEST_SOURCES})
    target_link_libraries(check ${PROJECT_NAME} GTest::main)
    add_test(NAME check COMMAND check)
endif()

include(CPackConfig.cmake)
```
```sh
CI.yml
```
```sh
name: CMake

on:
 push:
  branches: [master]
 pull_request:
  branches: [master]

jobs: 
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v3
    
    - name: Configure Solver
      run: cmake ${{github.workspace}}/solver_application/ -B ${{github.workspace}}/solver_application/build

    - name: Build Solver
      run: cmake --build ${{github.workspace}}/solver_application/build
    
    - name: Build docker
      run: docker build -t logger .
```
```sh
lera@Lerra:~/lab08$ sudo docker build -t logger .
```
<!-- [+] Building 8.3s (14/14) FINISHED
 => [internal] load .dockerignore                                                                                           0.0s
 => => transferring context: 2B                                                                                             0.0s
 => [internal] load build definition from Dockerfile                                                                        0.0s
 => => transferring dockerfile: 379B                                                                                        0.0s
 => [internal] load metadata for docker.io/library/ubuntu:18.04                                                             0.6s
 => [1/9] FROM docker.io/library/ubuntu:18.04@sha256:152dc042452c496007f07ca9127571cb9c29697f42acbfad72324b2bb2e43c98       0.0s
 => [internal] load build context                                                                                           0.0s
 => => transferring context: 3.42kB                                                                                         0.0s
 => CACHED [2/9] RUN apt update                                                                                             0.0s
 => CACHED [3/9] RUN apt install -yy gcc g++ cmake                                                                          0.0s
 => [4/9] COPY . print/                                                                                                     0.0s
 => [5/9] WORKDIR print                                                                                                     0.0s
 => [6/9] RUN cmake -H. -B_build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=_install                                 1.8s
 => [7/9] RUN cmake --build _build                                                                                          1.3s
 => [8/9] RUN cmake --build _build --target install                                                                         0.7s
 => [9/9] WORKDIR _install/bin                                                                                              0.0s
 => exporting to image                                                                                                      3.6s
 => => exporting layers                                                                                                     3.6s
 => => writing image sha256:4b35a9f879b0167e67f3315a331619172c2d0392561db1c9c2de22ef67fad848                                0.0s
 => => naming to docker.io/library/logger -->


```sh
lera@Lerra:~/lab08$ sudo docker images
REPOSITORY   TAG       IMAGE ID       CREATED          SIZE
logger       latest    4b35a9f879b0   59 seconds ago   334MB
lera@Lerra:~/lab08$ mkdir logs
lera@Lerra:~/lab08$ sudo docker run -it -v "$(pwd)/logs/:/home/logs/' logger
text1
text2
text3
<C-D>
> ^C
lera@Lerra:~/lab08$ sudo docker inspect logger
```
<!-- [
    {
        "Id": "sha256:4b35a9f879b0167e67f3315a331619172c2d0392561db1c9c2de22ef67fad848",
        "RepoTags": [
            "logger:latest"
        ],
        "RepoDigests": [],
        "Parent": "",
        "Comment": "buildkit.dockerfile.v0",
        "Created": "2023-06-03T12:45:49.239117142+03:00",
        "Container": "",
        "ContainerConfig": {
            "Hostname": "",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": null,
            "Cmd": null,
            "Image": "",
            "Volumes": null,
            "WorkingDir": "",
            "Entrypoint": null,
            "OnBuild": null,
            "Labels": null
        },
        "DockerVersion": "",
        "Author": "",
        "Config": {
            "Hostname": "",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
                "LOG_PATH=/home/logs/log.txt"
            ],
            "Cmd": null,
            "Image": "",
            "Volumes": {
                "/home/logs": {}
            },
            "WorkingDir": "/print/_install/bin",
            "Entrypoint": [
                "/bin/sh",
                "-c",
                "./demo"
            ],
            "OnBuild": null,
            "Labels": {
                "org.opencontainers.image.ref.name": "ubuntu",
                "org.opencontainers.image.version": "18.04"
            }
        },
        "Architecture": "amd64",
        "Os": "linux",
        "Size": 333784231,
        "VirtualSize": 333784231,
        "GraphDriver": {
            "Data": {
                "LowerDir": "/var/lib/docker/overlay2/97im5ozsukzf7nrpcrh8q5e0w/diff:/var/lib/docker/overlay2/us33d9cr87325443n6xzloln1/diff:/var/lib/docker/overlay2/71bomvsm5u1z541wqcotfnfqu/diff:/var/lib/docker/overlay2/izxhq6smxzw2e9bnskthlvkfj/diff:/var/lib/docker/overlay2/w6dogbvadanubf7oftuotnqj1/diff:/var/lib/docker/overlay2/nhp5s9k7y35rzvysleh6khshr/diff:/var/lib/docker/overlay2/iip2ev2noe4sh0d6qqnuer4iu/diff:/var/lib/docker/overlay2/a50cee9edda3be3bf5ac99d588a70bc2ba62538454a313e9399d0afd5f7bbb2d/diff",
                "MergedDir": "/var/lib/docker/overlay2/4mo7t2e4xxibq6f3xjey97chj/merged",
                "UpperDir": "/var/lib/docker/overlay2/4mo7t2e4xxibq6f3xjey97chj/diff",
                "WorkDir": "/var/lib/docker/overlay2/4mo7t2e4xxibq6f3xjey97chj/work"
            },
            "Name": "overlay2"
        },
        "RootFS": {
            "Type": "layers",
            "Layers": [
                "sha256:548a79621a426b4eb077c926eabac5a8620c454fb230640253e1b44dc7dd7562",
                "sha256:81735417d158a38738d3a432ec769032051f3e21225283f154d621389fb58998",
                "sha256:3e5224b6e027bc697d0e7649cdeefa16ad153322c55de809846a36f2fca60a37",
                "sha256:2025759a294a76e57a0944309e5fea6aaea3088169ac15af8c45bed1547f41d5",
                "sha256:5f70bf18a086007016e948b04aed3b82103a36bea41755b6cddfaf10ace3c6ef",
                "sha256:e94599161e6ea30ec34b77df81f24150af0fb289c401b33d6af19ac3d6bda7de",
                "sha256:f6bfdf4f171438783ff407c27624183dc134335a6dcdc24cfc294dbfd16fc611",
                "sha256:c2946408e42b0f40d5b2f2dd39e6e8927a2558390b7613aa44710fe546f4013e",
                "sha256:505bd804541e28634a3413733133c2993928442e756aaa3cec43c3cb290aea13"
            ]
        },
        "Metadata": {
            "LastTagTime": "2023-06-03T12:45:52.850197942+03:00"
        }
    }
] -->
```sh 
lera@Lerra:~/lab08$ git add Dockerfile
lera@Lerra:~/lab08$ git add logs
lera@Lerra:~/lab08$ git commit -m"adding Dockerfile"
[main 6199eec] adding Dockerfile
 2 files changed, 23 insertions(+)
 create mode 100644 Dockerfile
 create mode 100644 logs/log.txt
lera@Lerra:~/lab08$ git push origin main
Username for 'https://github.com': Lerra227
Password for 'https://Lerra227@github.com':
Enumerating objects: 283, done.
Counting objects: 100% (283/283), done.
Delta compression using up to 20 threads
Compressing objects: 100% (124/124), done.
Writing objects: 100% (283/283), 105.43 KiB | 35.14 MiB/s, done.
Total 283 (delta 136), reused 277 (delta 135), pack-reused 0
remote: Resolving deltas: 100% (136/136), done.
To https://github.com/Lerra227/lab08
 * [new branch]      main -> main
```
```
Copyright (c) 2015-2021 The ISC Authors
```
