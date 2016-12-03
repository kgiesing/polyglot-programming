## FROM SOURCE CODE TO EXECUTION ##
### Terminology
  - source code: string of code written in prog. language
  - source file: plaintext file containing source code
### parsing
    : analyzing the source code
  - Done by anything that "recognizes" code: compiler, intepreter, some
    syntax highlighters
  - Format and language used by parser has nothing to do with language of
    source code; e.g. parser for Java can be written in C
  - Input is string of characters; result is syntax tree (usually), and symbol
    table
    - syntax tree: tree-like data structure, representing code's syntax in an
      abstract way
      Example: "2 + 3" is something like:
            (operator +)
           /            \
      (literal 2)   (literal 3)
      - If tree is more closely related to a specific language, it's called
        a "parse tree"
      - Interpreted languages may use a simpler internal data structure, to
        improve performance
    - symbol table: a map of all the identifiers (names of vars, fns,
      classes, etc.) to what they represent
#### Parsing steps
    - Lexical analysis (scanning): characters -> tokens
      e.g. "+" -> "addition" token
      - Identifiers (names of vars, functions, consts, classes, etc.) placed
        in symbol table
    - Syntactical analysis: tokens -> syntax tree (parse tree, AST)
      - syntax errors are caught; semantic errors are not
        e.g. "+ 2 3" won't be caught
      - technically, this is the part that is really "parsing"
    - Semantic analysis: syntax tree -> semantically-correct syntax tree
      - static semantic errors are caught
      - type checking performed
### preprocessing
    - handled while parsing
     - lexical preprocessor: handled during lexical analysis (C/C++)
     - syntactic preprocessor: handled during later stages of parsing, e.g.
       semantic analysis (Lisp family, XSLT, OCaml, etc.)
    - preprocessor directives (mainly used in C/C++)
      - include other source files:
        #include "somefile.h"
      - text substitution macros:
        #define ARRAY_SIZE 100
      - conditional compilation (e.g. preventing mult. includes):
        #ifndef MYLIB_H
        #define MYLIB_H
        //.. Your code here
        #endif
      - pragma: compiler-specific directive
        #pragma once; // common in Windows; prevents multiple includes
### compilation vs. interpretation
  - compile time vs. runtime
    - in general, it's better to catch errors at compile time
  - programming language specification defines syntax and runtime behavior,
    but that's it; could be compiled or interpreted
  - but in practice, most use one technique
### interpretation: JavaScript, Perl, PHP
  - Interpreter: takes code as input, parses and executes it
    - Interpreter acts as environment for code execution; e.g. memory management
  - Code is executed "on the fly"
    - As soon as a statement is parsed, that statement is executed
  - Advantages and disadvantages
    - Advantages: cross-platform, easier development, managed environment,
      may be very high-level/programmer-friendly
    - Disadvantages: runtime validation, slower, overhead, must distribute
      source code
### compilation: C, C++
  - Translated into bytecode
    - AST from parser is "walked" to generate machine code
    - Machine code is determined by compilation target (e.g. computer architecture)
    - Linking
      - Not all of the program needs to be compiled at once (e.g. one file is
        compiled)
      - When executable is created, different compiled sources are linked
      - Re-compilation can be avoided if code hasn't changed
  - Advantages and disadvantages
    - Advantages: compile-time code validation, faster, distribute binary file
    - Disadvantages: executable is specific to architecture/OS
  - Many vendors; compete for speed, architecture optimization, etc.
### VM compilation: JVM (Java), CLR & Mono (C#)
  - Code is compiled to VM-specific bytecode (not native machine code)
  - VM takes its own bytecode, translates to native machine code while running
    - VM bytecode instructions very close to native machine instructions
    - Often done at runtime; "Just-In-Time" (JIT)
    - Blocks of machine code can be cached (improves performance)
  - Memory is managed; unused objects are destroyed
    - garbage collection (GC): destroying objects that are not referenced
    - usually, GC is done by a "mark-and-sweep" algorithm
    - takes time, and predicting when it happens often difficult/impossible
  - Advantages and disadvantages
    - compiled adv.: compile-time validation, bin. file dist.
    - interpreted adv.: cross-platform, managed environment
    - disadvantages: still needs compilation stage (no on-the-fly execution),
      slower(?) than native-machine compilation, overhead from VM & GC
  - Note that these VM's are not hypervisors (like VMWare or VirtualBox)
### Source-to-source compilation (aka transpiling)
  - Takes one higher-level language, compiles it to another higher-level
    language (or even the same language)
  - Uses: refactor legacy code, add additional functionality, minimization
  - Common use today is to compile to JavaScript for Web applications:
    Google Dart, Google Closure compiler, CoffeeScript, TypeScript
    https://github.com/jashkenas/coffeescript/wiki/list-of-languages-that-compile-to-JS
