const std = @import("std");
const utils = @import("./utils");
const result = @import("./result.zig");
const models = @import("./models.zig");
const Allocator = std.mem.Allocator;

const Result = result.Result;

pub const Self = struct {
    pub fn list_resources() Result {
        const roffset: usize = 0;
        const rlen: usize = 0;

        if (raw_self_list_resources(0, @ptrToInt(&roffset), @ptrToInt(&rlen))) {
            return result.fromErrBytes(utils.ptrToBytes(roffset, rlen));
        }

        return result.fromErrBytes(utils.ptrToBytes(roffset, rlen));
    }

    pub fn get_resource(alloc: Allocator, name: []const u8) !Resource {
        const roffset: usize = 0;
        const rlen: usize = 0;

        const nptr = utils.stringToPtr(name);

        if (raw_self_get_resource(0, fresp.ptr, fresp.len, @ptrToInt(&roffset), @ptrToInt(&rlen))) {
            const rjson = utils.ptrToBytes(roffset, rlen);
            return std.json.parseFromSlice(models.Resource, std.testing.allocator, rjson, .{});
        }
    }

    pub fn in_links() bool {}
    pub fn out_links() bool {}
    pub fn link_exec(name: []const u8, method: []const u8, usize, data: []const u8, asynk: bool, detached: bool) bool {}
    pub fn new_module(name: []const u8, usize, data: []const u8) usize {}
    pub fn module_exec(mid: usize, name: []const u8, method: []const u8, usize, data: []const u8) bool {}
    pub fn fork_exec(name: []const u8, method: []const u8, usize, data: []const u8) bool {}
};

// raw

pub inline fn raw_self_list_resources(ctxid: usize, respOffset: usize, respLen: usize) bool {
    return self_list_resources(respOffset, respLen);
}

pub inline fn raw_self_get_resource(ctxid: usize, nPtr: usize, nLen: usize, respOffset: usize, respLen: usize) bool {
    return self_get_resource(nPtr, nLen, respOffset, respLen);
}

pub inline fn raw_self_in_links(ctxid: usize, respOffset: usize, respLen: usize) bool {
    return self_in_links(respOffset, respLen);
}

pub inline fn raw_self_out_links(ctxid: usize, respOffset: usize, respLen: usize) bool {
    return self_out_links(respOffset, respLen);
}

pub inline fn raw_self_link_exec(ctxid: usize, nPtr: usize, nLen: usize, mPtr: usize, mLen: usize, dPtr: usize, dLen: usize, asynk: usize, detached: usize, respOffset: usize, respLen: usize) bool {
    return self_link_exec(nPtr, nLen, mPtr, mLen, dPtr, dLen, asynk, detached, respOffset, respLen);
}

pub inline fn raw_self_new_module(ctxid: usize, nPtr: usize, nLen: usize, dPtr: usize, dLen: usize, respOffset: usize, respLen: usize) usize {
    return self_new_module(nPtr, nLen, dPtr, dLen, respOffset, respLen);
}

pub inline fn raw_self_module_exec(ctxid: usize, mid: usize, mPtr: usize, mLen: usize, dPtr: usize, dLen: usize, respOffset: usize, respLen: usize) bool {
    return self_module_exec(mid, mPtr, mLen, dPtr, dLen, respOffset, respLen);
}

pub inline fn raw_self_fork_exec(ctxid: usize, mPtr: usize, mLen: usize, dPtr: usize, dLen: usize, respOffset: usize, respLen: usize) bool {
    return self_fork_exec(mPtr, mLen, dPtr, dLen, respOffset, respLen);
}

// abi

extern "temphia1" fn self_list_resources(ctxid: usize, respOffset: usize, respLen: usize) bool;
extern "temphia1" fn self_get_resource(ctxid: usize, nPtr: usize, nLen: usize, respOffset: usize, respLen: usize) bool;
extern "temphia1" fn self_in_links(ctxid: usize, respOffset: usize, respLen: usize) bool;
extern "temphia1" fn self_out_links(ctxid: usize, respOffset: usize, respLen: usize) bool;
extern "temphia1" fn self_link_exec(ctxid: usize, nPtr: usize, nLen: usize, mPtr: usize, mLen: usize, dPtr: usize, dLen: usize, asynk: usize, detached: usize, respOffset: usize, respLen: usize) bool;
extern "temphia1" fn self_new_module(ctxid: usize, nPtr: usize, nLen: usize, dPtr: usize, dLen: usize, respOffset: usize, respLen: usize) usize;
extern "temphia1" fn self_module_exec(ctxid: usize, mid: usize, mPtr: usize, mLen: usize, dPtr: usize, dLen: usize, respOffset: usize, respLen: usize) bool;
extern "temphia1" fn self_fork_exec(ctxid: usize, mPtr: usize, mLen: usize, dPtr: usize, dLen: usize, respOffset: usize, respLen: usize) bool;
