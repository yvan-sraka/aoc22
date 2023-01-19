const std = @import("std");

const wood = [5][5]i32{
    [_]i32{ 3, 0, 3, 7, 3 },
    [_]i32{ 2, 5, 5, 1, 2 },
    [_]i32{ 6, 5, 3, 3, 2 },
    [_]i32{ 3, 3, 5, 4, 9 },
    [_]i32{ 3, 5, 3, 9, 0 },
};

pub fn main() !void {
    var visible: [5][5]bool = undefined;
    {
        var i: usize = 0;
        while (i < wood.len) {
            {
                var height: i32 = -1;
                var j: usize = 0;
                while (j < wood[i].len) {
                    var x = wood[i][j];
                    if (x > height) {
                        height = x;
                        visible[i][j] = true;
                    }
                    j += 1;
                }
            }
            {
                var height: i32 = -1;
                var j: usize = 0;
                while (j < wood[i].len) {
                    var x = wood[j][i];
                    if (x > height) {
                        height = x;
                        visible[j][i] = true;
                    }
                    j += 1;
                }
            }
            {
                var height: i32 = -1;
                var j: usize = wood[i].len - 1;
                while (j > 0) {
                    var x = wood[i][j];
                    if (x > height) {
                        height = x;
                        visible[i][j] = true;
                    }
                    j -= 1;
                }
            }
            {
                var height: i32 = -1;
                var j: usize = wood[i].len - 1;
                while (j > 0) {
                    var x = wood[j][i];
                    if (x > height) {
                        height = x;
                        visible[j][i] = true;
                    }
                    j -= 1;
                }
            }
            i += 1;
        }
    }

    var count: i32 = 0;
    for (wood) |_, i| {
        for (wood[i]) |_, j| {
            if (visible[i][j]) {
                count += 1;
            }
        }
    }

    std.debug.print("{}\n", .{count});
}
