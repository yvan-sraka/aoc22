S[1]="ZN"
S[2]="MCD"
S[3]="P"

function move { # $1 from $3 to $5
    S[$5]="${S[$5]}${S[$3]:0-$1}"
    S[$3]="${S[$3]:0:${#S[$3]}-$1}"
}

move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2

r=""
for ((i=1; i<=${#S[@]}; i++))
do
    r="$r${S[$i]:0-1}"
done
echo "$r"