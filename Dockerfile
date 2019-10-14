FROM ubuntu:trusty

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        bc \
        build-essential \
        ca-certificates \
        git \
        pxz \
        python \
        rsync \
        tmux \
        unzip \
        vim \
        wget \
    && \
    rm -rf /var/lib/apt/lists/*

