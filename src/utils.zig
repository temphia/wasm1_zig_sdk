const std = @import("std");
const result = @import("./result.zig");

var general_purpose_allocator = std.heap.GeneralPurposeAllocator(.{}){};
const gpa = general_purpose_allocator.allocator();

pub fn getAllocator() *std.mem.Allocator {
    return gpa;
}

pub export fn allocBytes(size: usize) usize {
    const baddr = gpa.alloc(u8, size) catch unreachable;
    return @ptrToInt(&baddr[0]);
}

pub export fn freeBytes(addr: usize) void {
    gpa.destroy(@intToPtr([*]u8, addr));
}

pub fn freeBytes2(bytes: []const u8) void {
    gpa.destroy(&bytes[0]);
}

pub fn freeResult(r: result.Result) void {
    gpa.destroy(&r.inner_bytes[0]);
}


pub fn stringToPtr(s: []const u8) struct { ptr: usize, len: usize } {
    const sptr = &s[0];

    return .{
        .ptr = @ptrToInt(sptr),
        .len = s.len,
    };
}

pub fn ptrToBytes(ptr: usize, len: usize) []u8 {
    const ptr_u8 = @intToPtr([*]u8, ptr);
    return ptr_u8[0..len];
}
