const std = @import("std");

var gpa = std.heap.GeneralPurposeAllocator(.{}){};

pub export fn allocBytes(size: i32) [*]u8 {
    return gpa.alloc(u8, size) catch unreachable;
}

pub export fn freeBytes(addr: i32) void {
    gpa.destroy(addr);
}
