# Localized C Linker Symbols

The goal here is to have a library (`libfoo.a`) that interanally depends on
a function `foo` while our main program also exports that symbol. That is,
given: 

```c
char foo(void) {
    return 'a';
}
char foo_b(void) {
    return foo();
}
```

and

```c
char foo(void) {
    return 'c';
}

int main() {
    printf("foo: %c\nfoo_b: %c\n", foo(), foo_b());
}
```

we want to print:

```
foo: c
foo_b: a
```

and not to print:

```
foo: c
foo_b: c
```

The main tricks that achieve this are in the Makefile