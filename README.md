# Assembly

### Compile
```bash
nasm -f elf32 file.asm -o file.o
ld -m elf_i386 file.o -o file
```