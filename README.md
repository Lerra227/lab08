## Laboratory work IV

```sh
lera@Lerra:~/lab031$ git clone https://github.com/Lerra227/lab03
Cloning into 'lab03'...
remote: Enumerating objects: 216, done.
remote: Counting objects: 100% (216/216), done.
remote: Compressing objects: 100% (99/99), done.
remote: Total 216 (delta 111), reused 201 (delta 105), pack-reused 0
Receiving objects: 100% (216/216), 91.49 KiB | 296.00 KiB/s, done.
Resolving deltas: 100% (111/111), done.
lera@Lerra:~/lab04$ git remote remove origin
lera@Lerra:~/lab04$ git remote add origin https://github.com/Lerra227/lab04
lera@Lerra:~/lab04$ mkdir .github
lera@Lerra:~/lab04$ cd .github
lera@Lerra:~/lab04/.github$ mkdir workflows
lera@Lerra:~/lab04/.github/workflows$ cat > CI.yml
name: CMake

on:
 push:
  branches: [main]
 pull_request:
  branches: [main]

jobs:
 build_Linux:

  runs-on: ubuntu-latest

  steps:
  - uses: actions/checkout@v3

  - name: Configure Solver
    run: cmake ${{github.workspace}}/solver_application/ -B ${{github.workspace}}/solver_application/build

  - name: Build Solver
    run: cmake --build ${{github.workspace}}/solver_application/build

  - name: Configure HelloWorld
    run: cmake ${{github.workspace}}/hello_world_application/ -B ${{github.workspace}}/hello_world_application/build

  - name: Build HelloWorld
    run: cmake --build ${{github.workspace}}/hello_world_application/build

 build_Windows:

  runs-on: windows-latest

  steps:
  - uses: actions/checkout@v3

  - name: Configure Solver
    run: cmake ${{github.workspace}}/solver_application/ -B ${{github.workspace}}/solver_application/build

  - name: Build Solver
    run: cmake --build ${{github.workspace}}/solver_application/build

  - name: Configure HelloWorld
    run: cmake ${{github.workspace}}/hello_world_application/ -B ${{github.workspace}}/hello_world_application/build

  - name: Build HelloWorld
    run: cmake --build ${{github.workspace}}/hello_world_application/build^Z
[1]+  Stopped                 cat > CI.yml
lera@Lerra:~/lab04/.github/workflows$ nano  CI.yml
lera@Lerra:~/lab04/.github/workflows$ cd ..
lera@Lerra:~/lab04/.github$ cd ..
lera@Lerra:~/lab04$ git add .github
lera@Lerra:~/lab04$ git commit -m "added CI.yml"
[main 22b184b] added CI.yml
 1 file changed, 46 insertions(+)
 create mode 100644 .github/workflows/CI.yml
 lera@Lerra:~/lab04$ git push origin main
Username for 'https://github.com': Lerra227
Password for 'https://Lerra227@github.com':
Enumerating objects: 213, done.
Counting objects: 100% (213/213), done.
Delta compression using up to 20 threads
Compressing objects: 100% (93/93), done.
Writing objects: 100% (213/213), 89.38 KiB | 44.69 MiB/s, done.
Total 213 (delta 108), reused 205 (delta 106), pack-reused 0
remote: Resolving deltas: 100% (108/108), done.
To https://github.com/Lerra227/lab04
 * [new branch]      main -> main
```

```
Copyright (c) 2015-2021 The ISC Authors
```
