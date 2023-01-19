const input: [string, number][] = [
   ["R", 4],
   ["U", 4],
   ["L", 3],
   ["D", 1],
   ["R", 4],
   ["D", 1],
   ["L", 5],
   ["R", 2],
];

const touch = (H: number[], T: number[]) => {
    const x = (H[0] - T[0]);
    const y = (H[1] - T[1]);
    return (1 >= x && x >= -1 && 1 >= y && y >= -1);
};

const moveHead = (head: number[], dir: string) => {
    if (dir == "U") head[0] += 1;
    if (dir == "D") head[0] -= 1;
    if (dir == "R") head[1] += 1;
    if (dir == "L") head[1] -= 1;
};

let visited = ["0,0"];
const moveTail = (head: number[], tail: number[], mark = false) => {
    while (!touch(head, tail)) {
        if (head[0] > tail[0]) tail[0] += 1;
        if (head[0] < tail[0]) tail[0] -= 1;
        if (head[1] > tail[1]) tail[1] += 1;
        if (head[1] < tail[1]) tail[1] -= 1;
        if (mark) visited.push(`${tail[0]},${tail[1]}`);
    }
};

let H = [0, 0];
let T1 = [0, 0];
let T2 = [0, 0];
let T3 = [0, 0];
let T4 = [0, 0];
let T5 = [0, 0];
let T6 = [0, 0];
let T7 = [0, 0];
let T8 = [0, 0];
let T9 = [0, 0];
input.forEach(move => {
    const [dir, len] = move;
    for (let i = 0; i < len; ++i) {
        moveHead(H, dir);
        // Part 1
        moveTail(H, T1, true);
        // Part 2
        // moveTail(H, T1);
        // moveTail(T1, T2);
        // moveTail(T2, T3);
        // moveTail(T3, T4);
        // moveTail(T4, T5);
        // moveTail(T5, T6);
        // moveTail(T6, T7);
        // moveTail(T7, T8);
        // moveTail(T8, T9, true);
    }
});
console.log([...new Set(visited)].length);