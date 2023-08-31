$(f): $(f).o
	ld -m elf_i386 $(f).o -o $(f)

$(f).o: $(f).asm
	nasm -f elf32 $(f).asm -o $(f).o

clean:
	rm -rf $(f) $(f).o