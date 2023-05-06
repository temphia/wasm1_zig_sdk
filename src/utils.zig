const std = @import("std");

var general_purpose_allocator = std.heap.GeneralPurposeAllocator(.{}){};
const gpa = general_purpose_allocator.allocator();

pub fn getSDKAllocator() *std.mem.Allocator {
    return gpa;
}

pub export fn allocBytes(size: usize) usize {
    const baddr = gpa.alloc(u8, size) catch unreachable;
    return @ptrToInt(&baddr[0]);
}

pub export fn freeBytes(addr: usize) void {
    gpa.destroy(@intToPtr([*]u8, addr));
}

pub fn stringToPtr(s: []const u8) struct { ptr: usize, len: usize } {
    const sptr = &s[0];

    return .{
        .ptr = @ptrToInt(sptr),
        .len = s.len,
    };
}
