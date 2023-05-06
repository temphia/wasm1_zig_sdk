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

    const wlib = b.addStaticLibrary(.{
        .name = "wasm_zig_sdk",
        .target = target,
        .optimize = mode,
        .root_source_file = .{ .path = "src/main.zig" },
    });

    wlib.force_pic = true;

    b.installArtifact(wlib);
}
