with builtins;
trace (length (filter (xs:
  ((elemAt xs 2) <= (elemAt xs 0) && (elemAt xs 1) <= (elemAt xs 3))
  || ((elemAt xs 0) <= (elemAt xs 2) && (elemAt xs 3) <= (elemAt xs 1)))
  (map (map (n: fromJSON "${n}")) (filter (x: !(isString x))
    (split "([0-9]*)-([0-9]*),([0-9]*)-([0-9]*)" (readFile ./input.txt)))))) { }