
# Libasm
A simple library in 64-bit assembly using Intel syntax.
  
## Compile
Create the library:
```console
make
```
Compile the library with `main.c` to test:
```console
make test
```
  
>  **MacOS:** The library uses `__errno_location` to check errors, but on MacOS, you need to use `__error`. Since I haven't tested it, I don't know if it will work with only this change.

## Run
To run tests:
```console
./test
```
This will automatically run the tests, except for the `read` function that reads from the standard input, so you will need to input values manually.

> You can use the library like any `.a` file: compile your program with the `.a` and include `libasm.h`.

## Assembly Utils and Explanations

### Sections:

There are three sections in assembly:

| Section       | What is it?                        |
|---------------|------------------------------------|
| `.data`       | To declare constant values         |
| `.bss`        | To declare variables               |
| `.text`       | To write the code                  |

> I don't use variables or constants my libasm, so only the `.text` section is used.

### Registers:
Registers are small storage locations within the CPU.  
Here is a list of all registers used in my libasm:

| Registers | What is it?                          |
|-----------|--------------------------------------|
| `RAX`     | Most important, used as return value |
| `RDI`     | First argument given to the function |
| `RSI`     | Second argument given to the function |
| `RDX`     | Third argument given to the function  |
| `RCX`     | Used as index (i)                    |
| `AL`      | The lower 8 bits of `RAX`            |
| `BL`      | The lower 8 bits of `RBX`            |
  
### Instructions:

| Instructions     | What is it?                                                           |
|------------------|-----------------------------------------------------------------------|
| **Data Movement**|                                                                       |
| `mov`            | Moves data from source to destination.                                |
| `push`           | Pushes a value onto the stack.                                        |
| `pop`            | Pops the top value off the stack into a register.                     |
| **Arithmetic and Bitwise** |                                                            |
| `inc`            | Increments the value of a register or memory location by 1.           |
| `xor`            | Performs a bitwise XOR operation; often used to zero out a register.  |
| `neg`            | Negates a value, effectively multiplying it by -1.                    |
| **Comparison and Testing** |                                                            |
| `cmp`            | Compares two values and sets flags for conditional jumps.             |
| `test`           | Performs a bitwise AND operation without changing the operands; sets flags for conditional jumps. |
| **Control Flow** |                                                                       |
| `jne`            | Jumps to a label if the values compared are not equal.                |
| `jl`             | Jumps if the comparison indicates the first value is less than the second. |
| `jg`             | Jumps if the comparison indicates the first value is greater than the second. |
| `call`           | Calls a function and pushes the return address onto the stack.        |
| `ret`            | Returns control to the calling function.                              |


### Syscall:

most basic and commonly used syscalls in Linux:

| Number    |Name       | What is it?                                                   |
|-----------|-----------|---------------------------------------------------------------|
| `0`       | **read**  |Reads data from a file descriptor into a buffer.               |
| `1`       | **write** |Writes data from a buffer to a file descriptor.                |
| `2`       | open      |Opens a file and returns a file descriptor.                    |
| `3`       | close     |Closes an open file descriptor.                                |
| `9`       | mmap      |Maps files or devices into memory.                             |
| `11`      | munmap    |Unmaps a memory region.                                        |
| `39`      | getpid    |Gets the process ID of the calling process.                    |
| `60`      | exit      |Exits the process with a specified status code.                |
| `63`      | uname     |Gets system information (e.g., system name, version).          |
| `7`	    | unlink    |Deletes a file.                                                |


Registers used by a syscall:

| Register  |Usage                           |
|-----------|--------------------------------|
| `rax`	    | **Syscall number**             |
| `rdi`	    | First argument                 |
| `rsi`	    | Second argument                |
| `rdx`	    | Third argument                 |
| `r10`	    | Fourth argument                |
| `r8`	    | Fifth argument                 |
| `r9`	    | Sixth argument                 |
| `rax`	    | Return value (after syscall)   |
