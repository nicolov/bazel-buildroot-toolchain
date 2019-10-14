#!/usr/bin/env bash

set -euxo pipefail

wget -O buildroot.tar.bz2 https://buildroot.org/downloads/buildroot-2019.08.1.tar.bz2
tar -xvf buildroot.tar.bz2

# Copy configuration file
cp .config buildroot-*

cd buildroot-*

make

# This recursive symlinks crashes Bazel, remove it
rm output/host/usr

# Archive the SDK (toolchain binaries + sysroot)
cd output
mkdir /tmp/artifacts
tar -I pxz -cf "/tmp/artifacts/bazel-buildroot-toolchain-$(git describe --always --dirty).tar.xz" host
