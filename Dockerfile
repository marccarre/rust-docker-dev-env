FROM debian:jessie-slim
ARG rust_version
ENV RUST_VERSION ${rust_version}
ENV RUST_ARCH unknown-linux-gnu
ENV RUST_CPU x86_64
LABEL version ${rust_version}
LABEL description "Rust development environment"
LABEL maintainer "Marc Carre <carre.marc@gmail.com>"
RUN apt-get update && apt-get install -y \
        curl \
        gcc \
        inotify-tools && \
    gpg --keyserver pgp.mit.edu --recv-key 85AB96E6FA1BE5FE && \
    curl -fsSO https://static.rust-lang.org/dist/rust-"$RUST_VERSION"-"$RUST_CPU"-"$RUST_ARCH".tar.gz.asc && \
    curl -fsSO https://static.rust-lang.org/dist/rust-"$RUST_VERSION"-"$RUST_CPU"-"$RUST_ARCH".tar.gz && \
    gpg --verify rust-"$RUST_VERSION"-"$RUST_CPU"-"$RUST_ARCH".tar.gz.asc && \
    tar zxf rust-"$RUST_VERSION"-"$RUST_CPU"-"$RUST_ARCH".tar.gz && \
    ./rust-"$RUST_VERSION"-"$RUST_CPU"-"$RUST_ARCH"/install.sh && \
    rm -fr rust-"$RUST_VERSION"-"$RUST_CPU"-"$RUST_ARCH"* && \
    apt-get --purge -y autoremove curl && \
    rm -rf /var/lib/apt/lists/*
COPY ./build-continuously.sh /usr/local/bin/build-continuously.sh
VOLUME /home/rust
WORKDIR /home/rust
