pub const utils = @import("./utils.zig");
pub const result = @import("./result.zig");
pub const models = @import("./models.zig");

// actual ABI
pub const core = @import("./abi_core.zig");
pub const self = @import("./abi_self.zig");

// ABI Wrappers
pub const Core = core.Core;
pub const Self = self.Self;

pub const Result = result.Result;

pub fn freeAlloc(obj: anytype) void {
    switch (@TypeOf(obj)) {
        []const u8 => {
            utils.freeBytes2(obj);
        },
        usize => {
            utils.freeBytes(obj);
        },
        Result => {
            utils.freeResult(obj);
        },
    }
}
