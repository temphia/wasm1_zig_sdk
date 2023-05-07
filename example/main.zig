const std = @import("std");
const sdk = @import("wasm1-zig-sdk");
const core = sdk.Core;

const allocator = std.heap.page_allocator;

pub const std_options = struct {
    pub fn logFn(comptime lvl: std.log.Level, comptime _: @Type(.EnumLiteral), comptime msg: []const u8, args: anytype) void {
        var buffer = std.ArrayList(u8).init(allocator);

        std.fmt.format(buffer.writer(), "{s} {s} {any}\n", .{ lvl.asText(), msg, args }) catch unreachable;
        core.log(buffer.items);

        buffer.deinit();
    }
};

pub export fn action_hello(ptr: usize, size: usize) void {
    core.log("HEYYYYY");

    var passedctx = sdk.utils.ptrToBytes(ptr, size);

    core.log(passedctx);

    passedctx[0] = 'a';
    passedctx[1] = 'b';
    passedctx[2] = 'c';

    core.log(passedctx);

    // std.debug.print("HEY", .{});

}
