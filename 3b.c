#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define priority(x) ((65 <= x && x <= 90) ? (x - 38) : ((97 <= x && x <= 122) ? (x - 96) : 0))
// char priority(char x) {
//     if (65 <= x && x <= 90)
//         return (x - 38);
//     if (97 <= x && x <= 122)
//         return (x - 96);
//     exit(EXIT_FAILURE);
// }

int main(void) {
    int r = 0; char *line = NULL; size_t len = 0; ssize_t n;
    bool items[52][3] = {false};
    for (size_t i = 0; (n = getline(&line, &len, stdin)) != -1; ++i) {
        for (size_t j = 0; j < n-1; ++j)
            items[priority(line[j])-1][i % 3] = true;
        if (i % 3 == 2) {
            for (size_t j = 0; j < 52; ++j)
               if (items[j][0] && items[j][1] && items[j][2]) { r += j+1; break; }
            memset(items, false, 52 * 3);
        }
    }
    printf("%d\n", r);
    free(line);
    exit(EXIT_SUCCESS);
}
