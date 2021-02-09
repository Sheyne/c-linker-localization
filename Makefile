# compile a.c
a.o: a.c
	gcc -c a.c

# compile b.c
b.o: b.c
	gcc -c b.c

# join the object code for a.c and b.c into 
# a single object file, ab.o
ab.o: a.o b.o
	ld -r -o ab.o a.o b.o

# convert the ab object file into an archive
# and localize the symbol `foo'
libfoo.a: ab.o
	ar -rc libfoo.a ab.o
	objcopy -L foo libfoo.a

# compile main.c as `main' including the libraries
# it depends on, note this handles that both
# a.c and c.c export `foo' and b.c depends on a.c's
# version of foo. 
main: c.c main.c libfoo.a
	gcc c.c main.c libfoo.a -o main

.PHONY: clean
clean:
	rm *.o *.a