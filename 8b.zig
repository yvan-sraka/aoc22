const std = @import("std");

const wood = [5][5]u32{
    [_]u32{ 3, 0, 3, 7, 3 },
    [_]u32{ 2, 5, 5, 1, 2 },
    [_]u32{ 6, 5, 3, 3, 2 },
    [_]u32{ 3, 3, 5, 4, 9 },
    [_]u32{ 3, 5, 3, 9, 0 },
};

pub fn main() !void {
    var best: u32 = 0;
    var i: u32 = 1;
    while (i < wood.len - 1) {
        var j: u32 = 1;
        while (j < wood[i].len - 1) {
            best = std.math.max(best, score(i, j));
            j += 1;
        }
        i += 1;
    }
    std.debug.print("{}\n", .{best});
}

fn score(x: usize, y: usize) u32 {
    const house = wood[x][y];

    var N: u32 = 1;
    {
        var i = x - 1;
        while (i > 0) {
            if (wood[i][y] >= house) {
                break;
            } else {
                N += 1;
            }
            i -= 1;
        }
    }

    var S: u32 = 1;
    {
        var i = x + 1;
        while (i < wood.len - 1) {
            if (wood[i][y] >= house) {
                break;
            } else {
                S += 1;
            }
            i += 1;
        }
    }

    var E: u32 = 1;
    {
        var j = y + 1;
        while (j < wood.len - 1) {
            if (wood[x][j] >= house) {
                break;
            } else {
                E += 1;
            }
            j += 1;
        }
    }

    var W: u32 = 1;
    {
        var j = y - 1;
        while (j > 0) {
            if (wood[x][j] >= house) {
                break;
            } else {
                W += 1;
            }
            j -= 1;
        }
    }
    return N * S * E * W;
}
