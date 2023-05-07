const std = @import("std");
const fs = std.fs;
const Builder = std.build.Builder;
const LibExeObjStep = std.build.LibExeObjStep;
const CrossTarget = std.zig.CrossTarget;
const Mode = std.builtin.Mode;
const builtin = @import("builtin");

pub fn build(b: *Builder) void {
    const mode = b.standardOptimizeOption(.{});


    const wlib = b.addSharedLibrary(.{
        .name = "wasm_zig_sdk",
        .target = .{
            .cpu_arch = .wasm32,
            .os_tag = .freestanding,
            .abi = .musl,
        },
        .optimize = mode,
        .root_source_file = .{ .path = "example/main.zig" },
    });

    wlib.addAnonymousModule("wasm1-zig-sdk", .{
        .source_file = .{ .path = "src/lib.zig" },
    });

    wlib.export_symbol_names = &.{"action_hello", "allocBytes", "freeBytes" };
    wlib.force_pic = true;
    wlib.rdynamic = true;
    wlib.strip = false;

    b.installArtifact(wlib);
}
