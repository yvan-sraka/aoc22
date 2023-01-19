let input =
  [
    ("R", 4);
    ("U", 4);
    ("L", 3);
    ("D", 1);
    ("R", 4);
    ("D", 1);
    ("L", 5);
    ("R", 2);
  ]

let touch (h, t) =
  let x = h.(0) - t.(0) in
  let y = h.(1) - t.(1) in
  1 >= x && x >= -1 && 1 >= y && y >= -1

let move_head (h, dir) =
  match dir with
  | "U" -> h.(0) <- h.(0) + 1
  | "D" -> h.(0) <- h.(0) - 1
  | "R" -> h.(1) <- h.(1) + 1
  | "L" -> h.(1) <- h.(1) - 1
  | _ -> ()

let visited = ref [ (0, 0) ]

let move_tail (h, t, mark) =
  while not (touch (h, t)) do
    if h.(0) > t.(0) then t.(0) <- t.(0) + 1;
    if h.(0) < t.(0) then t.(0) <- t.(0) - 1;
    if h.(1) > t.(1) then t.(1) <- t.(1) + 1;
    if h.(1) < t.(1) then t.(1) <- t.(1) - 1;
    if mark && not (List.mem (t.(0), t.(1)) !visited) then
      visited := (t.(0), t.(1)) :: !visited
  done

let h = [| 0; 0 |]
let t1 = [| 0; 0 |]
let t2 = [| 0; 0 |]
let t3 = [| 0; 0 |]
let t4 = [| 0; 0 |]
let t5 = [| 0; 0 |]
let t6 = [| 0; 0 |]
let t7 = [| 0; 0 |]
let t8 = [| 0; 0 |]
let t9 = [| 0; 0 |]

let () =
  List.iter
    (fun (dir, len) ->
      for i = 1 to len do
        move_head (h, dir);
        (* Part 1 *)
        move_tail (h, t1, true)
        (* Part 2 *)
        (* move_tail (h, t1, false);
           move_tail (t1, t2, false);
           move_tail (t2, t3, false);
           move_tail (t3, t4, false);
           move_tail (t4, t5, false);
           move_tail (t5, t6, false);
           move_tail (t6, t7, false);
           move_tail (t7, t8, false);
           move_tail (t8, t9, true) *)
      done)
    input;
  print_int (List.length !visited)
