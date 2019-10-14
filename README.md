# bazel-buildroot-toolchain

This is a C++ toolchain for Bazel based on the [Buildroot project](https://buildroot.org/).
After setting it up in your Bazel project, you'll be able to use an up-to-date compiler
and C++ library (currently gcc 9.2) that are completely isolated from your host system.

The toolchain uses [musl](https://www.musl-libc.org/) as a C library so that Bazel
can build fully static executables that run on any Linux machine.

## Usage

Start with the [example](https://github.com/nicolov/bazel-cpp-starter) or make the
following changes to your existing project:

### `WORKSPACE`

```
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "bazel_buildroot_toolchain",
    urls = [
        # Set the correct version here.
        "https://github.com/nicolov/bazel-buildroot-toolchain/archive/${some_version}.tar.gz",
    ],
)

load("@bazel_buildroot_toolchain//:deps.bzl", "bazel_buildroot_toolchain_deps")

bazel_buildroot_toolchain_deps()
```

### `.bazelrc`

```
# Define the toolchain
build:buildroot-toolchain --crosstool_top=@bazel_buildroot_toolchain//toolchain:buildroot
build:buildroot-toolchain --host_crosstool_top=@bazel_buildroot_toolchain//toolchain:buildroot
build:buildroot-toolchain --cpu=x86_64

# Set the toolchain as default (optional, you can omit and use --config buildroot-toolchain instead)
build --config buildroot-toolchain
```
