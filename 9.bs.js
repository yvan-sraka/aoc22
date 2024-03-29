// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var List = require("rescript/lib/js/list.js");
var Caml_array = require("rescript/lib/js/caml_array.js");
var Pervasives = require("rescript/lib/js/pervasives.js");

var input = {
  hd: [
    "R",
    4
  ],
  tl: {
    hd: [
      "U",
      4
    ],
    tl: {
      hd: [
        "L",
        3
      ],
      tl: {
        hd: [
          "D",
          1
        ],
        tl: {
          hd: [
            "R",
            4
          ],
          tl: {
            hd: [
              "D",
              1
            ],
            tl: {
              hd: [
                "L",
                5
              ],
              tl: {
                hd: [
                  "R",
                  2
                ],
                tl: /* [] */0
              }
            }
          }
        }
      }
    }
  }
};

function touch(h, t) {
  var x = Caml_array.get(h, 0) - Caml_array.get(t, 0) | 0;
  var y = Caml_array.get(h, 1) - Caml_array.get(t, 1) | 0;
  if (1 >= x && x >= -1 && 1 >= y) {
    return y >= -1;
  } else {
    return false;
  }
}

function move_head(h, dir) {
  switch (dir) {
    case "D" :
        return Caml_array.set(h, 0, Caml_array.get(h, 0) - 1 | 0);
    case "L" :
        return Caml_array.set(h, 1, Caml_array.get(h, 1) - 1 | 0);
    case "R" :
        return Caml_array.set(h, 1, Caml_array.get(h, 1) + 1 | 0);
    case "U" :
        return Caml_array.set(h, 0, Caml_array.get(h, 0) + 1 | 0);
    default:
      return ;
  }
}

var visited = {
  contents: {
    hd: [
      0,
      0
    ],
    tl: /* [] */0
  }
};

function move_tail(h, t, mark) {
  while(!touch(h, t)) {
    if (Caml_array.get(h, 0) > Caml_array.get(t, 0)) {
      Caml_array.set(t, 0, Caml_array.get(t, 0) + 1 | 0);
    }
    if (Caml_array.get(h, 0) < Caml_array.get(t, 0)) {
      Caml_array.set(t, 0, Caml_array.get(t, 0) - 1 | 0);
    }
    if (Caml_array.get(h, 1) > Caml_array.get(t, 1)) {
      Caml_array.set(t, 1, Caml_array.get(t, 1) + 1 | 0);
    }
    if (Caml_array.get(h, 1) < Caml_array.get(t, 1)) {
      Caml_array.set(t, 1, Caml_array.get(t, 1) - 1 | 0);
    }
    if (mark && !List.mem([
            Caml_array.get(t, 0),
            Caml_array.get(t, 1)
          ], visited.contents)) {
      visited.contents = {
        hd: [
          Caml_array.get(t, 0),
          Caml_array.get(t, 1)
        ],
        tl: visited.contents
      };
    }
    
  };
}

var h = [
  0,
  0
];

var t1 = [
  0,
  0
];

var t2 = [
  0,
  0
];

var t3 = [
  0,
  0
];

var t4 = [
  0,
  0
];

var t5 = [
  0,
  0
];

var t6 = [
  0,
  0
];

var t7 = [
  0,
  0
];

var t8 = [
  0,
  0
];

var t9 = [
  0,
  0
];

List.iter((function (param) {
        var dir = param[0];
        for(var _for = 1 ,_for_finish = param[1]; _for <= _for_finish; ++_for){
          move_head(h, dir);
          move_tail(h, t1, true);
        }
      }), input);

Pervasives.print_int(List.length(visited.contents));

exports.input = input;
exports.touch = touch;
exports.move_head = move_head;
exports.visited = visited;
exports.move_tail = move_tail;
exports.h = h;
exports.t1 = t1;
exports.t2 = t2;
exports.t3 = t3;
exports.t4 = t4;
exports.t5 = t5;
exports.t6 = t6;
exports.t7 = t7;
exports.t8 = t8;
exports.t9 = t9;
/*  Not a pure module */
