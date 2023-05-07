pub export const Result = struct {
    inner_bytes: []const u8,
    rtype: enum { Ok, Err },

    const self = @This();

    pub fn fromErrBytes(bytes: []const u8) self {
        return .{
            .inner_bytes = bytes,
            .rtype = .Err,
        };
    }

    pub fn fromOkBytes(bytes: []const u8) self {
        return .{
            .inner_bytes = bytes,
            .rtype = .Ok,
        };
    }


    pub fn ok(s: *self) bool {
        switch (s.rtype) {
            .Ok => {
                return true;
            },
            .Err => {
                return false;
            },
        }
    }
};
