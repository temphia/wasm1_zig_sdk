const std = @import("std");
const utils = @import("./utils");
const result = @import("./result.zig");
const Result = result.Result;

extern fn self_list_resources(respOffset: usize, respLen: usize) bool;
extern fn self_get_resource(nPtr: usize, nLen: usize, respOffset: usize, respLen: usize) bool;
extern fn self_in_links(respOffset: usize, respLen: usize) bool;
extern fn self_out_links(respOffset: usize, respLen: usize) bool;
extern fn self_link_exec(nPtr: usize, nLen: usize, mPtr: usize, mLen: usize, dPtr: usize, dLen: usize, asynk: usize, detached: usize, respOffset: usize, respLen: usize) bool;
extern fn self_new_module(nPtr: usize, nLen: usize, dPtr: usize, dLen: usize, respOffset: usize, respLen: usize) usize;
extern fn self_module_exec(mid: usize, mPtr: usize, mLen: usize, dPtr: usize, dLen: usize, respOffset: usize, respLen: usize) bool;
extern fn self_fork_exec(mPtr: usize, mLen: usize, dPtr: usize, dLen: usize, respOffset: usize, respLen: usize) bool;

pub inline fn raw_self_list_resources(respOffset: usize, respLen: usize) bool {
    return self_list_resources(respOffset, respLen);
}

pub inline fn raw_self_get_resource(nPtr: usize, nLen: usize, respOffset: usize, respLen: usize) bool {
    return self_get_resource(nPtr, nLen, respOffset, respLen);
}

pub inline fn raw_self_in_links(respOffset: usize, respLen: usize) bool {
    return self_in_links(respOffset, respLen);
}

pub inline fn raw_self_out_links(respOffset: usize, respLen: usize) bool {
    return self_out_links(respOffset, respLen);
}

pub inline fn raw_self_link_exec(nPtr: usize, nLen: usize, mPtr: usize, mLen: usize, dPtr: usize, dLen: usize, asynk: usize, detached: usize, respOffset: usize, respLen: usize) bool {
    return self_link_exec(nPtr, nLen, mPtr, mLen, dPtr, dLen, asynk, detached, respOffset, respLen);
}

pub inline fn raw_self_new_module(nPtr: usize, nLen: usize, dPtr: usize, dLen: usize, respOffset: usize, respLen: usize) usize {
    return self_new_module(nPtr, nLen, dPtr, dLen, respOffset, respLen);
}

pub inline fn raw_self_module_exec(mid: usize, mPtr: usize, mLen: usize, dPtr: usize, dLen: usize, respOffset: usize, respLen: usize) bool {
    return self_module_exec(mid, mPtr, mLen, dPtr, dLen, respOffset, respLen);
}

pub inline fn raw_self_fork_exec(mPtr: usize, mLen: usize, dPtr: usize, dLen: usize, respOffset: usize, respLen: usize) bool {
    return self_fork_exec(mPtr, mLen, dPtr, dLen, respOffset, respLen);
}

pub const Self = struct {
    pub fn selfListResources() Result {
        const roffset: usize = 0;
        const rlen: usize = 0;

        if (raw_self_list_resources(@ptrToInt(&roffset), @ptrToInt(&rlen))) {
            return result.fromErrBytes(utils.ptrToBytes(roffset, rlen));
        }
        
        return result.fromErrBytes(utils.ptrToBytes(roffset, rlen));
    }
};
