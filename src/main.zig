const std = @import("std");

const core = @import("./core.zig");

export fn action_hello(ptr: i32, size: i32) void { 
    core.log(ptr, size);
}
