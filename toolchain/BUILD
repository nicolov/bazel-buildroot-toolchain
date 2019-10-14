package(default_visibility = ["//visibility:public"])

load(":cc_toolchain_config.bzl", "cc_toolchain_config")

cc_toolchain_suite(
    name = "buildroot",
    toolchains = {
        "x86_64": ":x86_64-toolchain",
    },
)

filegroup(name = "empty")

filegroup(
    name = "all",
    srcs = [
        ":wrappers/gcc",
        "@bazel_buildroot_toolchain_files//:all",
    ],
)

cc_toolchain(
    name = "x86_64-toolchain",
    toolchain_identifier = "x86_64-toolchain",
    toolchain_config = ":x86_64-toolchain-config",
    all_files = ":all",
    compiler_files = ":all",
    dwp_files = ":empty",
    linker_files = ":all",
    objcopy_files = ":empty",
    strip_files = ":empty",
    supports_param_files = False,
)

cc_toolchain_config(
    name = "x86_64-toolchain-config",
)

