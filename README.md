###Generic Base Image##

Simple base image (inherited from Ubuntu 14.04 image) pre-installed with essential tools:
```
software-properties-common build-essential wget curl make gcc git less unzip zip python python-pip python-dev
```

Usage:
```
FROM morz/generic-base
```
