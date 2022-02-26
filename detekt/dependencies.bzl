"""
Macros for defining dependencies.
See https://docs.bazel.build/versions/master/skylark/deploying.html#dependencies
"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def rules_detekt_dependencies():
    """Fetches `rules_detekt` dependencies.

    Declares dependencies of the `rules_detekt` workspace.
    Users should call this macro in their `WORKSPACE` file.
    """

    # Java

    rules_java_version = "5.0.0"
    rules_java_sha = "ddc9e11f4836265fea905d2845ac1d04ebad12a255f791ef7fd648d1d2215a5b"

    maybe(
        repo_rule = http_archive,
        name = "rules_java",
        url = "https://github.com/bazelbuild/rules_java/archive/refs/tags/{v}.tar.gz".format(v = rules_java_version),
        strip_prefix = "rules_java-{v}".format(v = rules_java_version),
        sha256 = rules_java_sha,
    )

    # JVM External

    rules_jvm_external_version = "4.2"
    rules_jvm_external_sha = "2cd77de091e5376afaf9cc391c15f093ebd0105192373b334f0a855d89092ad5"

    maybe(
        repo_rule = http_archive,
        name = "rules_jvm_external",
        url = "https://github.com/bazelbuild/rules_jvm_external/archive/{v}.tar.gz".format(v = rules_jvm_external_version),
        strip_prefix = "rules_jvm_external-{v}".format(v = rules_jvm_external_version),
        sha256 = rules_jvm_external_sha,
    )

    # Protocol Buffers

    rules_proto_version = "97d8af4dc474595af3900dd85cb3a29ad28cc313"
    rules_proto_sha = "602e7161d9195e50246177e7c55b2f39950a9cf7366f74ed5f22fd45750cd208"

    maybe(
        repo_rule = http_archive,
        name = "rules_proto",
        url = "https://github.com/bazelbuild/rules_proto/archive/{v}.tar.gz".format(v = rules_proto_version),
        strip_prefix = "rules_proto-{v}".format(v = rules_proto_version),
        sha256 = rules_proto_sha,
    )