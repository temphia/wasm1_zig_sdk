const std = @import("std");
const fs = std.fs;
const Builder = std.build.Builder;
const LibExeObjStep = std.build.LibExeObjStep;
const CrossTarget = std.zig.CrossTarget;
const Mode = std.builtin.Mode;
const builtin = @import("builtin");

pub fn build(b: *Builder) void {
    var target = b.standardTargetOptions(.{});
    const mode = b.standardOptimizeOption(.{});

    target.os_tag = .freestanding;

    b.addPackagePath("wasm1-zig-sdk", "src");

    const wlib = b.addStaticLibrary(.{
        .name = "wasm_zig_sdk",
        .target = target,
        .optimize = mode,
        .root_source_file = .{ .path = "example/main.zig" },
    });

    wlib.force_pic = true;


    wlib.addPackage("wasm1-zig-sdk");

    b.installArtifact(wlib);
}
