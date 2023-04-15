const std = @import("std");

extern "temphia" fn log(ptr: i32, size: i32) void;

export fn action_hello(ptr: i32, size: i32) void {
    
    log(ptr, size);
}
