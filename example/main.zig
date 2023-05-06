const std = @import("std");
const sdk = @import("wasm1-zig-sdk");
const core = sdk.Core;

pub const std_options = struct {
    pub fn logFn(
        comptime _: std.log.Level,
        comptime _: @Type(.EnumLiteral),
        comptime _: []const u8,
        _: anytype,
    ) void {}
};

pub export fn action_hello(ptr: i32, size: i32) void {
    _ = ptr;
    _ = size;
    
    core.log("HEYYYYY");

    // _ = sdk.utils.stringToPtr("Hello");
}
