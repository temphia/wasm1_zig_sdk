const std = @import("std");

pub const Resource = struct {
    value: []const u8,
    type: []const u8,
    payload: []const u8,
    meta: std.StringHashMap([]const u8),
};

pub const Link = struct {
    name: []const u8,
    type: []const u8,
    plug_id: []const u8,
    agent_id: []const u8,
};

pub const HttpRequest = struct {
    method: []const u8,
    path: []const u8,
    headers: std.StringHashMap([]const u8),
    body: []const u8,
};


pub const HttpResponse = struct {
    status_code: usize,
    headers: std.StringHashMap([]const u8),
    body: []const u8,
};

pub const PValue = struct {
    key: []const u8,
    value: []const u8,
    version: i64,
    tag1: ?[]const u8,
    tag2: ?[]const u8,
    tag3: ?[]const u8,
};