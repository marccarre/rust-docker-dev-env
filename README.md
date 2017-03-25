[![Build Status](https://travis-ci.org/marccarre/rust-docker-dev-env.svg?branch=master)](https://travis-ci.org/marccarre/rust-docker-dev-env)
[![Docker Pulls on Quay](https://quay.io/repository/marccarre/rust-dev-env/status "Docker Repository on Quay")](https://quay.io/repository/marccarre/rust-dev-env)
[![Docker Pulls on DockerHub](https://img.shields.io/docker/pulls/marccarre/rust-dev-env.svg?maxAge=604800)](https://hub.docker.com/r/marccarre/rust-dev-env/)

# rust-docker-dev-env
Rust development environment based on Docker.

### Features

- Image is based on the latest slim version of Debian Jessie.
- Image is kept as small as possible.
- Rust binaries are verified using GPG.
- Rust binaries are pulled from the official repository, hence are based on `glibc`, *NOT* `musl`: you will therefore *NOT* be able to compile static Rust binaries.
- `inotify-tools` is pre-installed to allow continuous compilation scripts -- see below example.

### Usage

    $ docker pull marccarre/rust-dev-env

or

    $ docker pull quay.io/marccarre/rust-dev-env

and then either re-use in other images or run one of the below commands:

1. Interactive shell:

        $ docker run -ti marccarre/rust-dev-env

2. Interactive shell with current directory mounted:

        $ docker run -ti -v $(pwd):/home/rust marccarre/rust-dev-env

3. Continuous build with current directory mounted, and assuming directory contains `src/main.rs`:

        $ docker run -ti -v $(pwd):/home/rust marccarre/rust-dev-env ./build-continuously.sh
        Setting up watches.  Beware: since -r was given, this may take a while!
        Watches established.
        [2017-03-25 20:55:58] MODIFY on main.rs. Rebuilding now...
        Compiling hello v1.0.0 (file:///home/rust)
        Finished dev [unoptimized + debuginfo] target(s) in 1.59 secs

4. Continuous build with current directory mounted, and assuming directory contains `path/to/src/main.rs`:

        $ docker run -ti -v $(pwd):/home/rust marccarre/rust-dev-env ./build-continuously.sh path/to
        Setting up watches.  Beware: since -r was given, this may take a while!
        Watches established.
        [2017-03-25 20:56:25] MODIFY on main.rs. Rebuilding now...
        Compiling hello v1.0.0 (file:///home/rust)
        Finished dev [unoptimized + debuginfo] target(s) in 1.97 secs

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