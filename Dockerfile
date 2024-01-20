FROM debian:bookworm
LABEL org.opencontainers.image.authors="malderete@gmail.com"
LABEL description="MySQL DEV environment"


WORKDIR /development/

RUN apt-get update && apt-get -y --no-install-recommends install \
    ca-certificates \
    build-essential \
    libssl-dev \
    libaio-dev \
    libncurses-dev \
    bison \ 
    git \
    pkg-config \
    vim \
    clang \
    cmake \
    gdb \
    wget \
&& rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["sleep", "infinity"]
