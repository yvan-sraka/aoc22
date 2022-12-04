SCORES = {
    "A": {"X": 3 + 1, "Y": 6 + 2, "Z": 0 + 3},
    "B": {"X": 0 + 1, "Y": 3 + 2, "Z": 6 + 3},
    "C": {"X": 6 + 1, "Y": 0 + 2, "Z": 3 + 3},
}

def score(line):
    [a, b] = line.split()
    return SCORES[a][b]

print(sum(map(score, open(0).readlines())))
