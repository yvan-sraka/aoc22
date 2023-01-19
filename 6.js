var solve = function (msg, n) {
    var i = 0; var j = 0; var S = [];
    main: while (i < msg.length) {
        while (j < i + n) {
            var x = S[msg[j]]; S[msg[j]] = ++j;
            if (x >= i) { i = x; continue main; }
        } break;
    } return i + n;
};
console.log(solve("bvwbjplbgvbhsrlpgdmjqwftvncz", 4)); // 5
console.log(solve("mjqjpqmgbljsphdztnvjfqwrcgsmlb", 14)); // 19
