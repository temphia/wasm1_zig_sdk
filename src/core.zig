const std = @import("std");

pub extern "temphia1" fn log(ptr: i32, size: i32) void;
pub extern "temphia1" fn sleep(msec: u32) void;
pub extern "temphia1" fn get_self_file(fptr: i32, fsize: i32, respptr: i32, resplen: i32, modPtr: i32) void;
