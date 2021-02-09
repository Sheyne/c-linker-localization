#include <stdio.h>

char foo_b(void);
char foo(void);

int main() {
    printf("foo: %c\nfoo_b: %c\n", foo(), foo_b());
}