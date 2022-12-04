SCORES = {
    "A": {"X": 0 + 3, "Y": 3 + 1, "Z": 6 + 2},
    "B": {"X": 0 + 1, "Y": 3 + 2, "Z": 6 + 3},
    "C": {"X": 0 + 2, "Y": 3 + 3, "Z": 6 + 1},
}

def score(line):
    [a, b] = line.split()
    return SCORES[a][b]

print(sum(map(score, open(0).readlines())))
