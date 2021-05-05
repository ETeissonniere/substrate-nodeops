FROM ubuntu as builder

LABEL maintainer="eliott@nuclei.studio"

ARG PROFILE=release
ARG GIT_REPO
ARG GIT_BRANCH
ARG BINARY_NAME
ARG PACKAGE_NAME

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    clang \
    cmake \
    curl \
    git \
    libssl-dev \
    pkg-config

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y && \
    export PATH=$PATH:$HOME/.cargo/bin && \
    git clone ${GIT_REPO} source && \
    cd source && \
    git checkout ${GIT_BRANCH} && \
    git submodule update --init --recursive && \
    rustup default stable && \
    rustup toolchain install nightly && \	
    rustup target add wasm32-unknown-unknown --toolchain nightly && \
    cargo build -p ${PACKAGE_NAME} --${PROFILE} && \
    cp target/${PROFILE}/${BINARY_NAME} /node

# ===== SECOND STAGE ======

FROM ubuntu

COPY --from=builder /node /usr/local/bin

# install curl in the event we want to interact with the local rpc
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y curl
RUN useradd --create-home runner

USER runner
EXPOSE 30333 9933 9944

ENTRYPOINT ["node"]
