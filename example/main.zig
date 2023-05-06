const std = @import("std");
const sdk = @import("wasm1-zig-sdk");
const core = sdk.core;

pub export fn action_hello(ptr: i32, size: i32) void {
    core.log(ptr + 42, size);
}
