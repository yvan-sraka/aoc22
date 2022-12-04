#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

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
    while ((n = getline(&line, &len, stdin)) != -1) {
        bool items[52] = {false};
        for (size_t i = 0; i < n/2; ++i)
            items[priority(line[i])-1] = true;
        for (size_t i = n/2; i < n-1; ++i) {
            char x = priority(line[i]);
            if (items[x-1]) { r += x; break; }
        }
    }
    printf("%d\n", r);
    free(line);
    exit(EXIT_SUCCESS);
}
