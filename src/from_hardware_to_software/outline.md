# FROM HARDWARE TO SOFTWARE ##
## Computer hardware
  - Components - motherboard, SoC ("system on chip")
    - CPU
      - ALU: Arithmetic Logic Unit (aka Execution Unit, Processing Unit)
        - performs all computations
        - integer and floating-point computations are usually separate parts
          of the ALU (or, perhapes, separate ALU's)
        - Modern processors have many ALU's, called "cores"
      - Control Unit: handles control flow
      - Registers: one word of memory in ALU, used to hold transitory data
        needed for computation
        - Processor-specific; different architectures have different approaches
        - General-purpose registers: can hold any value (data or address),
          meaning determined by program (not CPU)
        - Special-purpose registers: data has special meaning to CPU
          - instruction pointer/program counter: address of next instruction
            to perform
          - stack pointer: address of the start of stack memory (see below)
          - others: segment (memory), control, program status, interrupt
            - highly architecture-dependent
            - not handled by programmers (outside of ASM)
      - cache memory: small amount of memory stored directly on processor
        - used to hold instructions or data that are commonly used, so it
          won't have to be repeatedly copied from RAM
        - organized by levels: L1, L2, (sometimes) L3 - lower number means
          less memory, but faster
    - RAM (random-access memory): volatile (erased after powered off)
      - when most CS people say "memory," they really mean "RAM";
        most programmers won't have to worry about other kinds
    - I/O (Input/Output): keyboard, mouse, GPU, USB, network card, etc.
      - Including hard drives, CD/DVD/Blu-Ray, memory cards, and other
        varieties of persistent storage
    - Clock generator
      - synchronizes the system
      - square wave; at each edge, a new cycle of operations is performed
    - Bus: handles data transfer between components

## Representation of a program in hardware
    - "program" is simply a set of electronic signals in memory
      - Often thought of as sequence of 1's and 0's - but this is an
        abstraction! Really, it's +5V (high, "1") or 0V (low, "0"), +/-
    - Machine instruction set: set of commands that a processor can run;
      pre-defined by CPU manufacturer
      (commands: "instruction codes" or "processor instructions")
      - very simple: math operations, compare, jump, move to/from reg.
    - Machine code: a binary representation of machine instructions

## Processes, threads, and the OS
### OS:
    hardware I/O, executing programs, memory, security
    - Types questions the OS must answer:
      - Which program responds to UI's (mouse/keyboard/screen touch)?
      - If more than 1 prog, which one should be running on the CPU?
      - When should memory be reclaimed/paged (swapped to disk)?
      - Can this user/program write to this file?
    - GUI technically not part of OS, but most OS's come with one
### process
    instance of a running program
    - "program" does not mean "launched by user, with UI" - process
      can create ("spawn") other processes; so does OS
    - each process has its own allocated memory
    - most OS's are multi-process (even iOS devices)
### thread
    a "lightweight" process
    - same code as parent, but independent execution
    - shares parts of memory with parent process (see below)
    - "Thread safe:" operations in one thread don't interfere with
      operations in another thread (or parent process)
      - One thread operates on shared data in memory. Does it change
        that data in another thread? If yes, the operation is thread-safe;
        if not, it's not thread-safe

## Process memory structure
### static memory
    - essentially a copy of the executable file
    - usually, fills up lower part of memory; never grows/shrinks (hence the name)
    - shared with threads (not copied on thread creation)
    - parts ("segments"):
      - code (.text): executable instructions - read-only (OS enforced?)
      - read-only (.rodata): constants (e.g. PI) - read-only (duh)
      - initialized (non-null) data (.data): global var's
      - uninitialized data (.bss): global var's
### stack memory
    - automatically created/destroyed with fn call/return (fn's later)
    - usually, starts at end of allocated memory, "grows downwards"
    - easy to manage; only need to increase/decrease stack pointer
    - NOT shared with threads
### heap memory (aka free store)
    - creation/destruction is not automatic
    - POSIX: starts just past static memory, "grows upwards"
      - Windows is more complicated; there can be multiple heaps
        http://advancedwindowsdebugging.com/ch06.pdf
    - harder to manage
    - shared with threads
