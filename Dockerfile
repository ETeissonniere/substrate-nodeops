FROM phusion/baseimage:0.11 as builder

LABEL maintainer="eliott@nuclei.studio"

ARG RUST_VERSION=nightly-2020-06-01
ARG PROFILE=release
ARG GIT_REPO=https://github.com/NodleCode/chain
ARG BINARY_NAME=nodle-chain
ARG PACKAGE_NAME=${BINARY_NAME}

RUN apt-get update && apt-get install -y \
    clang \
    cmake \
    git \
    libssl-dev \
    pkg-config

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y && \
    export PATH=$PATH:$HOME/.cargo/bin && \
    rustup default stable && \
    rustup uninstall nightly && \
    rustup toolchain install ${RUST_VERSION} && \
    rustup target add wasm32-unknown-unknown --toolchain ${RUST_VERSION}

WORKDIR /node
RUN git clone ${GIT_REPO} source

WORKDIR /node/source && \
    cargo build -p ${PACKAGE_NAME} --${PROFILE} && \
    cp target/${PROFILE}}/${BINARY_NAME} /node/node