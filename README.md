[![Build Status](https://travis-ci.org/marccarre/rust-docker-dev-env.svg?branch=master)](https://travis-ci.org/marccarre/rust-docker-dev-env)
[![Docker Pulls](https://img.shields.io/docker/pulls/marccarre/rust-dev-env.svg?maxAge=604800)](https://hub.docker.com/r/marccarre/rust-dev-env/)

# rust-docker-dev-env
Rust development environment based on Docker.

### Features

- Image is based on the latest slim version of Debian Jessie.
- Image is kept as small as possible.
- Rust binaries are verified using GPG.
- Rust binaries are pulled from the official repository, hence are based on `glibc`, *NOT* `musl`: you will therefore *NOT* be able to compile static Rust binaries.
- `inotify-tools` is pre-installed to allow continuous compilation scripts.

### Usage

    $ docker pull marccarre/rust-dev-env

or

    $ docker pull quay.io/marccarre/rust-dev-env

and then either re-use in other images or run one of the below commands::

    # Interactive shell:
    $ docker run -ti marccarre/rust-dev-env

    # Interactive shell with current directory mounted:
    $ docker run -ti -v $(pwd):/home/rust marccarre/rust-dev-env

### Build & Release

#### Pre-requisites
- Docker
- `make`
- Internet connection

#### Build
```
$ make
```

#### Release
```
$ docker login
$ docker login quay.io
$ make release
```