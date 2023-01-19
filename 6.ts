import "wasi"
const s = new Set<u8>(); // AS100: Not implemented: Closures
const solve = (msg: string, n: i32): i32 => {
    let i = n;
    while (i < msg.length) {
        s.clear();
        msg.slice(i - n, i).split("")
           .forEach(x => s.add(x.charCodeAt(0) as u8));
        const x = n - s.size;
        if (x == 0) { return i; }
        i += x;
    }
    return 0;
}
console.log(`${solve("bvwbjplbgvbhsrlpgdmjqwftvncz", 4)}`); // 5
console.log(`${solve("mjqjpqmgbljsphdztnvjfqwrcgsmlb", 14)}`); // 19
