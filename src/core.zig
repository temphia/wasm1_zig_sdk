const std = @import("std");
const utils = @import("./utils.zig");
const Result = @import("./result.zig").Result;

extern "temphia1" fn log(ptr: usize, size: usize) void;
extern "temphia1" fn sleep(msec: u32) void;
extern "temphia1" fn get_self_file(fptr: usize, fsize: usize, respptr: usize, resplen: usize, modPtr: usize) void;

pub inline fn raw_log(ptr: usize, size: usize) void {
    log(ptr, size);
}

pub inline fn raw_sleep(msec: u32) void {
    sleep(msec);
}

pub inline fn raw_get_self_file(fptr: usize, fsize: usize, respptr: usize, resplen: usize, modPtr: usize) void {
    get_self_file(fptr, fsize, respptr, resplen, modPtr);
}

pub const Core = struct {
    pub fn log(s: []const u8) void {
        const resp = utils.stringToPtr(s);
        raw_log(resp.ptr, resp.len);
    }

    pub fn sleep(msec: usize) void {
        raw_sleep(msec);
    }

    pub fn get_self_file(file: []const u8) Result {
        const rPtr = 0;
        const rSize = 0;
        const modPtr = 0;
        const fresp = utils.stringToPtr(file);

        const ok = raw_get_self_file(
            fresp.ptr,
            fresp.len,
            @ptrToInt(&rPtr),
            @ptrToInt(&rSize),
            @ptrToInt(&modPtr),
        );

        if (ok) {
            return Result.fromOkBytes(utils.ptrToBytes(rPtr, rSize));
        }
        
        return Result.fromErrBytes(utils.ptrToBytes(rPtr, rSize));
    }
};
