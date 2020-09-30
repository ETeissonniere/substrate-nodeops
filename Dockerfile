FROM ubuntu as builder

LABEL maintainer="eliott@nuclei.studio"

ARG RUST_VERSION=nightly-2020-06-01
ARG PROFILE=release
ARG GIT_REPO=https://github.com/NodleCode/chain
ARG BINARY_NAME=nodle-chain
ARG PACKAGE_NAME=${BINARY_NAME}

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    clang \
    cmake \
    curl \
    git \
    libssl-dev \
    pkg-config

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y && \
    export PATH=$PATH:$HOME/.cargo/bin && \
    rustup default stable && \
    rustup uninstall nightly && \
    rustup toolchain install ${RUST_VERSION} && \
    rustup target add wasm32-unknown-unknown --toolchain ${RUST_VERSION} && \
    git clone ${GIT_REPO} source && \
    cd source && \
    cargo build -p ${PACKAGE_NAME} --${PROFILE} && \
    cp target/${PROFILE}}/${BINARY_NAME} /node

# ===== SECOND STAGE ======

FROM ubuntu

COPY --from=builder /node /usr/local/bin

RUN mv /usr/share/ca* /tmp && \
    rm -rf /usr/share/*  && \
    mv /tmp/ca-certificates /usr/share/ && \
    rm -rf /usr/lib/python* && \
    groupadd -g 4242 runner && \
    useradd -r -u 4242 -g runner runner

USER runner
EXPOSE 30333 9933 9944

ENTRYPOINT ["node"]