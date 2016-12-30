# POLYGLOT PROGRAMMING IN C-SYNTAX LANGUAGES #

## PRELIMINARIES ##

### ORGANIZATION ###
- "Bottom to top": least abstract to most abstract
  - "Abstract:" relative to the physical computer
  - "Abstract" is not necessarily "complex" (to humans)
- Theory and code
  1. General concepts - terminology, etc.
  2. Syntax - common, then lang-specific
  3. Advanced concepts
     - Beginning programmers don't need to know to write code, but will need
       to learn eventually
     - Put at the end, to be less confusing
     - Often language-specific
- Use of analogies
  - remember that they're only analogies; there to help clarify concepts
  - math (basic), cooking, everyday items (biased towards Americans...)

### A BRIEF OVERVIEW ###
- Single-purpose vs. general-purpose computers
  - Single-purpose: the computer has one program, and can only run that
    program - also called fixed-program computer
  - General-purpose: the computer can take a program as input data - also
    called stored program computer
    - Since a program is data, a general-purpose computer can also give
      back another program as output; important when we talk about compilers
      and interpreters
- Programming languages
  - A language that is used to create a program for a general-purpose computer
    - Why not "duh?"
  - What a program does
    - represents data and metadata ("nouns" and "adjectives")
    - operates upon that data ("verbs")
    - input and output
      - input data; operate on that data; output (new) data
      - "input" and "output" are abstract concepts
        - UI (keyboard, mouse, (touch)screen); hard disk; DB; tape drive;
          call to Web API; etc.
  - Program follows an *algorithm* for its operations
    - sequence of instructions that perform a task
      - Recipe analogy
    - Flow control
      - branching, iteration
      - termination condition(s)
  - Relationship between syntax and semantics
    - *Syntax:* determines what constitutes a well-formed string in a specific
      programming language
      - Example: infix - `2 + 3` is syntactically correct; `+ 2 3` is not
    - *Semantics:* deals with the meaning of programming languages; how the
      syntax is interpreted in an abstract sense
      - originates with advanced theories of computation; won't cover that
        (largely due to Robert W. Floyd, 1936 - 2001)
      - *Static semantics:* whether a well-formed string has meaning
        - Example: `2 + '5'` is syntactically correct, but what does it mean?
          a) `'25'` (2 converted to char)
          b) `7` ('5' converted to number)
          c) `55` (2 + ASCII value of '5')
          d) Nothing; `+` requires numbers on both sides, so it's semantically
             incorrect
      - *Language semantics:* what the meaning of a semantically correct string
        actually is
        - In above example, language semantics would choose between a, b, and
          c; d cannot be part of language semantics (since it's incorrect)
- Basic programming terminology
  Syntax-related:
  - Keyword: a sequence of characters that have special meaning in a language;
    part of the language syntax. (Can't be used as a name for anything else.)
  - Reserved word: seq. of chars. that have special meaning in a language,
    but are not necessarily part of the syntax. Examples: "goto" in Java,
    "super" in JavaScript.
    - In nearly all lang's, keywords are subset of reserved words
  Data-related:
  - State: the values of data represented by the program (usually in memory),
    at a particular point in the program's execution
    - "state" can also refer to the state of execution itself, i.e. which
      operations have been done, and which are next - but most languages can't
      access this information
    - Global state: the data that is available throughout the entire code
  - Literal: direct representation of data in source code (`5`, `3.14159`, `"Sam"`)
  - Variable: named representation of data, whose value can change
    - similar to math variables, but can represent more than numbers
  - Constant: named representation of data, whose value cannot change
    - analogies from natural sciences: pi, e (Euler's number), c (speed of
      light in a vacuum), number of protons in a carbon atom, etc.
  - Scope: the parts of a program where a name has meaning (visible)
    - two identical names will not conflict, only if they have different scopes
    - global: available throughout the entire code (e.g. "global variable,"
      "global state")
  Manipulation-related:
  - Operator: simple operation on data - e.g. numeric operations in math
    - Operand: a piece of data that an operator works on
      Example: "2 + 3" - "+" is operator, "2" and "3" are operands
  - Function: named, complex operation on data, often consisting of multiple
    statements
    - similar to math functions, but can have same output for different input
    - method: a function that is associated with an object (see below)
    - call: what you do when you use a function
      - caller: the code that calls a function
      - invoke: generally, a synonym; colloquially, sometimes functions are
        "called" while methods are "invoked"
    - pass: communicate value(s) between caller and function
    - argument: a value passed into a function by the caller
    - parameter: a representation of an argument, for use inside function
      - You can think of them as variables
    - body: the "interior" of a function - the code that accomplishes the
      complex operation; not available to the caller
    - return value: the result of the function's operation, passed back to
      the caller
    - recursion: generally, when a function calls itself (but also: mutual
      recursion)
      - Why: a problem can be solved by finding the solution to smaller
        subsets of the problem; function calls itself with subset as arg(s)
    - more in section on functions
  - Object
    - "theoretical" definition: representation of abstract entity in memory
      (e.g. "functions are first-class objects")
    - OOP definition:
      - holds data that represent state (member variables, fields)
      - has methods that operate according to state (member functions)
      more in section on OOP
- C-style syntax
  - Why C-style?
    - It's the most common "family" of syntaxes
    - Different semantics for same syntax, so we can discuss semantics
      separately
    - I know it better than anything else...
  - What constitutes a "C-style syntax?"
    - Statements end with a semicolon
    - Statement blocks delimited by curly braces ("Curly-bracket languages"),
      not indentation ("off-side rule")
    - Uses infix operator notation (not e.g. Hungarian)
    - Extra whitespace is ignored
    - Uses C syntax for calling functions
  - Which languages?
    - C, C++, C#, Java, JavaScript, PHP
    - Almost but not quite: Swift, Perl
    - Not C-style: BASIC, Lua, Pascal, Python, Ruby, Smalltalk, Objective-C,
      F#, most functional languages (Scheme, Lisp, Haskell), XSLT

- [ADVANCED] Programming paradigms
  - imperative vs. declarative
    - imperative: program is an explicit sequence of steps that alter state
      - focuses on the "how" of algorithms
      - imperative process is the basis for algorithms
      - majority of programming paradigms are imperative
    - declarative: "program" is a sequence of declarations about what the
      program should do
      - focuses on the "what" of algorithms; "how" is handled by language
        semantics, and program state is not managed directly
      - control flow is secondary or even absent altogether
      - based on "declarative knowledge" - statements about the world that are
        true or false (i.e. "5 is a prime number")
      - adds a layer of abstraction; often based on formal logic
    - the difference between the two is gray - OOP languages are usually
      considered "imperative," even though they're very abstract
    - Example:
      You are given a list of numbers (n), and you want to sum them.
      Pseudocode: CAPS are language constructs, lower-case are variables;
        "RESULT:" ends the execution and gives the right-hand-side as result
      Imperative:
        LET sum BE 0
        LET len BE (LENGTH-OF n)
        LET i BE 0
        WHILE i IS-LESS-THAN len:
          LET sum BE sum PLUS (VALUE-OF n AT-POSITION i)
        RESULT: sum
      Declarative:
        RESULT: (WITH-EACH-VALUE-OF n
          ACCUMULATE (CURRENT-VALUE-OF n)
          USING-OPERATION PLUS)
  - Common programming paradigms
    - Procedural
      - Program is a sequence of function calls, which may alter global state
      - Imperative
      - Languages: C, PHP 4
    - Object-oriented (OOP)
      - Program is a collection of objects, each with their own state, that
        interact with each other
      - Imperative
      - Languages: C++, C#, Java, JavaScript, PHP 5
    - Functional
      Note: need to read section on functions to truly understand this
      - Has roots in Church's Lambda Calculus, a formal system in math. logic;
        first functional language was Lisp (by John McCarthey, 1958-1960)
      - Declarative
      - Common features:
        - Focus on immutable data, lack of program state
          - Functions are pure functions (to the degree possible)
          - vars discouraged; "mutation" is achieved by passing the result of
            fn call (e.g. "add") to another fn as arg.
        - Uses tail recursion instead of iteration
        - Functions are first-class objects: may be assigned to vars, passed
          to other fn's, returned from other fn's
        - Function passing and returning allows:
          - Closures
          - Function currying/partial application (not quite the same)
          - Delayed evaluation/continuations
          These will be briefly discussed in section on functions.
      - Languages: Lisp family (incl. Scheme), Haskell, XSLT
      - None of the C-syntax languages are purely functional, but JavaScript
        can implement most of these features; others can achieve similar
        features with different implementations

## FROM HARDWARE TO SOFTWARE ##
- Computer hardware
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
  - Representation of program
    - "program" is simply a set of electronic signals in memory
      - Often thought of as sequence of 1's and 0's - but this is an
        abstraction! Really, it's +5V (high, "1") or 0V (low, "0"), +/-
    - Machine instruction set: set of commands that a processor can run;
      pre-defined by CPU manufacturer
      (commands: "instruction codes" or "processor instructions")
      - very simple: math operations, compare, jump, move to/from reg.
    - Machine code: a binary representation of machine instructions
- Processes, threads, and the OS
  - OS: hardware I/O, executing programs, memory, security
    - Types questions the OS must answer:
      - Which program responds to UI's (mouse/keyboard/screen touch)?
      - If more than 1 prog, which one should be running on the CPU?
      - When should memory be reclaimed/paged (swapped to disk)?
      - Can this user/program write to this file?
    - GUI technically not part of OS, but most OS's come with one
  - process: instance of a running program
    - "program" does not mean "launched by user, with UI" - process
      can create ("spawn") other processes; so does OS
    - each process has its own allocated memory
    - most OS's are multi-process (even iOS devices)
  - thread: a "lightweight" process
    - same code as parent, but independent execution
    - shares parts of memory with parent process (see below)
    - "Thread safe:" operations in one thread don't interfere with
      operations in another thread (or parent process)
      - One thread operates on shared data in memory. Does it change
        that data in another thread? If yes, the operation is thread-safe;
        if not, it's not thread-safe
- Process memory
  - static memory
    - essentially a copy of the executable file
    - usually, fills up lower part of memory; never grows/shrinks (hence the name)
    - shared with threads (not copied on thread creation)
    - parts ("segments"):
      - code (.text): executable instructions - read-only (OS enforced?)
      - read-only (.rodata): constants (e.g. PI) - read-only (duh)
      - initialized (non-null) data (.data): global var's
      - uninitialized data (.bss): global var's
  - stack memory
    - automatically created/destroyed with fn call/return (fn's later)
    - usually, starts at end of allocated memory, "grows downwards"
    - easy to manage; only need to increase/decrease stack pointer
    - NOT shared with threads
  - heap memory (aka free store)
    - creation/destruction is not automatic
    - POSIX: starts just past static memory, "grows upwards"
      - Windows is more complicated; there can be multiple heaps
        http://advancedwindowsdebugging.com/ch06.pdf
    - harder to manage
    - shared with threads

## FROM SOURCE CODE TO EXECUTION ##
- source code: string of code written in prog. language
  - source file: plaintext file containing source code
- parsing: analyzing the source code
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
  - Stages:
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
  - preprocessing
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
- compilation vs. interpretation
  - compile time vs. runtime
    - in general, it's better to catch errors at compile time
  - programming language specification defines syntax and runtime behavior,
    but that's it; could be compiled or interpreted
  - but in practice, most use one technique
- interpretation: JavaScript, Perl, PHP
  - Interpreter: takes code as input, parses and executes it
    - Interpreter acts as environment for code execution; e.g. memory management
  - Code is executed "on the fly"
    - As soon as a statement is parsed, that statement is executed
  - Advantages and disadvantages
    - Advantages: cross-platform, easier development, managed environment,
      may be very high-level/programmer-friendly
    - Disadvantages: runtime validation, slower, overhead, must distribute
      source code
- compilation: C, C++
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
- VM compilation: JVM (Java), CLR & Mono (C#)
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
- Source-to-source compilation (aka transpiling)
  - Takes one higher-level language, compiles it to another higher-level
    language (or even the same language)
  - Uses: refactor legacy code, add additional functionality, minimization
  - Common use today is to compile to JavaScript for Web applications:
    Google Dart, Google Closure compiler, CoffeeScript, TypeScript
    https://github.com/jashkenas/coffeescript/wiki/list-of-languages-that-compile-to-JS

## COMMENTS ##
- Why?
  - Always comment your code!
  - 90% of programming does not involve writing code;
    mainly algorithms, design - turn these into comments first
- Syntax:
  - multiline, C-style: `/* */`
  - single-line, C++ style: `//`
    - Comment lasts from comment token, to end of line
    - Not supported by C
  - single-line, shell-style: `#` (pound/hash)
    - Not supported by most C-style languages; only Perl and PHP
      (and discouraged in PHP) - but common in non-C-style lang's
- comments for automatic documentation generators
  - how it works
    - Documentation generator scans code for comments, outputs human-readable
      documentation: HTML, Linux `man` files, etc.
    - Google Closure uses these comments for transpiling
  - brands:
    - Javadoc
    - Doxygen (NOTE: multiple syntaxes - "Javadoc" style is only one of many)
    - PHPDoc/phpDocumentor
    - JSdoc
      - Google Closure compiler
  - common tags:
    @author: author of code (usually file, could be block)
    @deprecated: deprecated code
      "deprecated" = code that is old, and discouraged, but still present
      (usually for backwards compatibility)
    @param: param type/description
    @return: return type/description
    @see: "see also" link
    @throws: if function/method/etc. throws error type
    @version: version number
- tags in comments (for IDE highlighting)
  - `TODO`: task needs to be started/finished
  - `FIXME`: code needs fixing
  - `NOTE`: notes for other programmers (usually about implementation)
  - `XXX`: problematic code
  - I use `DEBUG`

## REPRESENTING DATA ##
see also:
[POD Types](http://www.fnal.gov/docs/working-groups/fpcltf/Pkg/ISOcxx/doc/POD.html)

### TYPE SYSTEMS ###
- A type is metadata
  - Data is simply bits in memory; type specifies how bits are interpreted
  - Type supplies meaning to the data
- Apply to anything that represents data
  - variables
  - function/method parameters
  - function/method return values
- mutable vs. immutable types
  - Mutable: value can be changed after initialization (read/write)
  - Immutable: value cannot be changed after initialization (read-only)
    - Operations on the value create a new value if possible; fail if not
    - Many languages have modifiers that specify immutability; see section
      on constants & variables
- value types and reference types
  - Value types: represent the data itself
    - often represent scalar data (numbers, single letters, true/false)
  - Reference types: represent the data's location in memory
    - often represent a compound data type (array, hash, object)
    - some languages (Python, Ruby) consider all types to be reference types;
      but all C-style languages use value types
- lvalues and rvalues (from C++ terminology)
  - lvalue: anything that is capable of having data assigned to it
    ("location value" or "left-hand-side value")
    - usually a variable
  - rvalue: anything that is not an lvalue (hence immutable)
    - literals
    - temporary results of expressions, e.g. 2 + 5
- type manipulation: casting and coercion
  - treat values of one type as if it were another
  - may be applied to anything with a type - variable, result of expression,
    return value of function, etc.

### Literals ###
- direct representation of rvalue in source code
  e.g. `2`, `3.14159`, `'x'`,` "Hello, world!"`
  - literals are immutable, being rvalues
  - string vs. char literals (lang. dependent)

### Named Data ###

#### Explicit vs. Implicit Typing ####
[](TODO: Moar research!)
- explicit typing (aka manifest typing)
  - representation of data must specify a data type
  - usually, static typed: types determined at compile time (when parsed)
    commonly used in compiled languages
  - usually, strongly typed: variables may only represent data that matches its
    explicit type
  - Languages: C, C++, Java, C#
- implicit typing (aka latent typing)
  - representation of data does not have a type
    - data itself, however, always has a type
  - usually, dynamically typed: types determined at runtime
    - commonly used in interpreted languages
  - usually, weakly typed: variables may represent any type of data
  - Languages: JavaScript, PHP

#### Variables ####
- variables: named, mutable lvalues
  - similar to variables in mathematics:
    `y = 2x + 5 (here, "x" and "y" are variables)`
  - identifier: variable's name
  - value: data that variable represents
  - variable identifier is lvalue; data it stores is rvalue
  - when var used as rvalue, the data it represents is used
  - sigil: special character to signify that a string of char's is a variable
    - PHP: `$`
    - Perl: `$`, `#` (hash), `%` (array)

#### Constants ####
- constants: named, immutable lvalues
  - signify a constant using a type qualifier
    - `const`: C99, C++, C#, PHP > 5.3.0
        - JavaScript ES6 will add `const` qualifier
    - `final`: Java
    - C (before C99) used `#define` preprocessor directive

#### Static Data ####
- only one copy of data exists in memory; kept with global variables in
    compiled lang's
- however, still follows scope rules
- `static` keyword: C, C++, Java

- naming identifiers - applies not only to vars, but fn's/methods
  - general rules:
    1. only upper/lower letters, numbers, underscore
      - no whitespace (space, tab, return, etc.)
      - no operator tokens (+, -, =, ., etc)
      - identifiers are case sensitive (car is not Car)
    2. cannot start with number
    3. cannot be reserved word
        - Exception: modern JavaScript allows *object property names*
            to be reserved words, e.g. `dog.catch()`
    Language-specific rules:
    - JavaScript: in addition to #1, can use most Unicode chars (but, don't)
      - Many JS lib's use `$` as fn. name (JQuery, etc.)
    - PHP: start with `$` sigil
    - Perl: start with sigil, depending upon type (see section on types):
        `$` (scalar), `@` (array),  `%` (hash)
  - conventions:
    - const: all upper-case, with underscores separating words
    - variable names:
      - *usually* start with lower-case letter
        - Exception: user-defined types - class names, interfaces (Java),
            constructor functions (JavaScript) - more on these later
        - Microsoft often starts method names with upper case
      - start with underscore only for "library" or "private" identifiers
        - symbolizes that client code shouldn't use it
      - representing two or more words:
        - procedural: underscore - `two_words`
        - OOP: camel case - `twoWords`
  - guidelines:
    - names should be semantic - describe what the variable (&etc.) represents
    - names should be as short as practical
    - borrow names from math when applicable
      i, j: iteration, position (from sigma notation, linear algebra, etc.)
      x, y, z: numbers (from algebra, calculus, etc.)
    - follow conventions for language's libraries
    - all of these rules can be overridden by teachers, employers, teams, etc.

- declaration, initialization, assignment
  - declaration: identifier (& type) of variable is introduced
    - not all languages require declaration (PHP doesn't)
    - explicitly typed: preceded by type name
    - implicitly typed: preceded by "var" keyword (or similar)
  - initialization: variable is given initial value
    - Often, but not always, done
  - assignment: variable is given value (initial or not)
  - Both initialization and assignment use the assignment operator: =
    - Don't confuse this with testing for equality! Rookie mistake.
  - Language support
    - Default values (declared but uninitialized)
      - C/C++: garbage - whatever value was previously at memory location
      - C#, Java: zero (primitive), false (Boolean), or null (reference)
      - JavaScript: undefined
    - C++: init and assign are separate operations
    - PHP does not have separate declaration; declared when initialized
- Syntax
  - declare variable x (as an integer) without initialization
    C/C++/Java:
      `int x;`
    JavaScript:
      `var x;`
  - declare variable x (as an integer), initialize to 5
    C/C++/Java:
      `int x = 5;`
    JavaScript:
      `var x = 5;`
    PHP:
      `$x = 5;`
  - assign 7 to that variable
    C/C++/Java/JavaScript:
      `x = 7;`
    PHP:
      `$x = 7;`

### PRIMITIVE TYPES ###
- Primitive types are value types
- Explicitly typed languages (C/C++/C#/Java):
  - `bool`: true/false
    - C is only language w/out this; most lib's implement TRUE=1, FALSE=0
  - `char`: single letter - "letter" lang-dep.
    - ASCII: 1 byte,
    - non-ASCII (e.g. UTF-8) have byte type
      - C/C++ support wchar_t ("wide char type") - 2/4 bytes
  - `int`: integer (whole number) - usually 4 bytes
  - `float`: floating-point (w/decimal) - usually 4 bytes
  - `double`: "double-precision floating point" - usually 8 bytes
  - Type specifiers
    - `signed`/`unsigned`:
      - "signed" is redundant
      - `unsigned` = no neg. values
      - last bit is sign bit; if we don't use it, we can hold
        larger values
      - Java doesn't have unsigned numeric types at all
      - C#: `sbyte`, `uint`, `ushort`, `ulong`
    - `long`/`short`: implies double/half #bytes
      - "implies" = C/C++ are system-dependent; Java standardizes
        - most implement "long double" as just "double" (8 bytes)
      - if no type specified, `int` assumed
- Implicitly typed languages:
  - Simplified numeric types
    - No distinction between signed and unsigned
    - No distinction between integer and floating-point
  - Usually no `char` type; string only

### STRINGS ###
- lang. semantics
  - C/C++: null-terminated array of char elements ("C-string")
  - others (managed): immutable object
    - can still access as array, but can't assign to it
    - JavaScript, PHP: string LITERALS are also objects
      `"Hello, world"[5]; // Comma`
      - Also: Python, Ruby
- Syntax
  - Double quotes: all interpret as multi-char string
  - single quotes:
    - C/C++/C#/Java: must be single char or escape sequence
    - PHP: single-quotes do not interpret escape sequences
    - JavaScript: no difference (convention is single quotes)
- Escape sequences
  - Often used to represent control characters
  - Table:
    https://en.wikipedia.org/wiki/Escape_sequences_in_C#Table_of_escape_sequences
- String formatting (syntax)
  https://en.wikipedia.org/wiki/Printf_format_string#Format_placeholder_specification

### POINTERS AND REFERENCES ###
Note: This entire section is fairly language-specific.
- pointers: C, C++
  - Value is a memory location (usually size of int in system)
  - Must still have type (incl. modifiers)
    - void*: type returned by memory allocation call; rarely used otherwise
  Syntax:
    ```
    int* x; // declare ptr to int, with ID of x - "\*" may be grouped w/name
    x = &y; // value of x is y's memory address
    *x = 5; // dereference
    ```
- references: C++, PHP
  - an alias for another variable
  - behave like const ptr's that are automatically dereferenced
    - PHP: alias to another var. in symbol table
      http://php.net/manual/en/language.references.php
  - reference is fixed when initialized; cannot be re-assigned
  Syntax:
  - C++: & type specifier
    ```
    int& rx = x; // reference to x - "&" may be grouped w/name
    rx = 5;      // assigns 5 to rx AND x
    // reference must be initialized with an lvalue!
    int& r = 5;     // Error - 5 is a literal
    int& r = x + 2; // Error - x + 2 is temporary
    ```
  - PHP: =& operator (assign-by-reference)
    ```
    $rx =& $x; // reference to $x
    $rx = 5;   // assigns 5 to $rx AND $x
    ```
- handles and resources: C, PHP
  - similar to ptr, but value is number representing location of something
    other than a memory location
    (database connection, file descriptor, socket, etc.)
  - No special syntax
    C: handle is pointer:
      `FILE* fp = fopen("filename.txt");`
    PHP: handle is returned from built-in fn, assigned to var:
      `$conn = ftp_connect($ftp_server);`
  - OOP languages use objects to represent resources

- Reference types in other languages
  - Reference types behave like ptr's (and are likely implemented as ptr's)
    - BUT, no special syntax; same as value types
  - Reference types in most languages do NOT behave like C++ references;
    details later (fn's and objects)

- Null and void
  - "null" is reference type; signifies that nothing is referenced
    - Evaluates to false in Boolean expression
    - C/C++: NULL is macro (#define) for integer 0 - not type safe!
    - C++11: nullptr
    - C#/Java/JavaScript: null keyword
    - JavaScript also has undefined
  - uninitialized variables
    - C/C++: garbage (whatever was previously in memory)
    - C#/Java: reference types are null, primitive types are "zero"
    - JavaScript: undefined
      - var's must be explicitly assigned the value null
  - void:
    - explicitly typed lang's: return type of fn that doesn't return value
    - C: void*
      - pointer with no explicit type ("raw" pointer)
      - Uses:
        - returned from memory allocation functions (malloc, calloc)
        - may be used in compound data structures
      - must be cast to actual type when dereferenced:
        char* str = (char*) malloc(LENGTH * sizeof(char));

### COMPOUND TYPES ###

#### Arrays ####
- array: numerically-ordered sequence of values
- Terminology
    - element: the data that is stored at one position
    - index: the position number of the element
- indexes:
    - arrays are always zero-indexed
    - index must be integer type (`char`, `byte` or `int`, w/modifiers)
    - index must be positive (negative = runtime error)
- elements:
    - elements are mutable
    - Homogeneous vs. heterogeneous arrays
      - Homogeneous: elements must be of same type
        C, C++
      - Heterogeneous: elements may be of different types
        Java, JavaScript
    - C++: cannot be references - use pointers instead
      (reference types in other lang's behave like ptrs, so they're OK)
- array lengths (sizes):
    - in static (usually compiled) languages, must be explicitly fixed
    - in dynamic (usually interpreted) languages, is not fixed
- Syntax
    - array literals
      - C/C++/C#/Java:
        `int[] arr = {5, 4, 3, 2, 1}; // length fixed at 5`
      - JavaScript:
        `var arr = [5, 4, 3, 2, 1];`
      - PHP:
        ```
        $arr = array(5, 4, 3, 2, 1); // All versions
        $arr = [5, 4, 3, 2, 1];      // PHP >= 5.4
        ```
    - accessing elements
      - access array element by its index: square brackets
        `x = arr[1]; // x has value of 4`
        `$x = $arr[1];   // PHP (and Perl)`
      - each element can be assigned a value independently
        `arr[2] = 6;  // arr is now [5, 4, 6, 2, 1]`
        `$arr[2] = 6; // PHP (and Perl)`
- Semantics
    - C/C++:
      - array value is location of base address: `(&arr[0])`
        - "simulated reference" - ptr that doesn't use ptr notation
      - array access uses pointer arithmetic
        `arr[2] == *(arr + 2 * sizeof(arr[0]))`
      - Danger! No bounds checking!
        `arr[100] = 5; // C/C++ will do this w/out error`
        - Especially dangerous for C-string functions
        - May be exploited for buffer overflow attacks
    - C#/Java/JavaScript: arrays are objects
      - Out-of-bounds access/assignment caught & handled
        - JavaScript: access -> 'undefined', assignment -> expands array
        - Others: results in runtime error
      - Arrays have methods/properties - see sect. on objects
    - PHP: arrays are dictionaries (see below)
      ```
      $arr[1];   // 4
      $arr["1"]; // also 4 - string is cast to integer
      ```
#### Associative arrays ####
(JavaScript/PHP)
- Theoretically correct term is "dictionary," but a.a. is widely used
- Collection of key/value pairs, where key is string
    - Value can be any type
- Like arrays, dictionaries are mutable
- arrays and dictionaries share syntax
    - key is accessed like index:` arr["hello"]`
    - each element can be assigned: `arr["hello"] = "world"`
- PHP: all arrays are associative
    ```
    $dict = array("foo" => "bar", "baz" => "bash"); // all versions
    $dict = ["foo" => "bar", "baz" => "bash"];      // PHP >= 5.4
    ```
- JavaScript: Dictionaries are objects - see below
    `dict = {"foo" : "bar", "baz" : "bash"};`
  - C/C++: <map> library
  - Java: java.util.Hashtable
    `Hashtable<String, String> $dict = new Hashtable<String, Integer>();`
    - Key can be any serializable object
    - Value must be object type - use boxing for primitive types
  - C#: System.Collections.Generic.Dictionary
    `Dictionary<string, string> dictionary = new Dictionary<string, string>();`

#### struct: "structure" ####
[](TODO: put in section on OOP?)

  - Used widely in C (and available in C++/C#) - why talk about it?
    - Classes have their origins in structs (C -> C++ -> Java -> C#)
    - You should know about them anyway
  - Named collection of variables, of any type
    - Similar to associative array, but "keys" are variable identifiers
    - a struct's variables are called members or fields
  - Member access operator: "dot operator"
  - structs are value types! All fields copied on assignment
  - Pointers to structs:
    - Unwieldy syntax: `*(point).x`
    - "Arrow operator:" another member access operator, specifically for ptrs
      `point->x`
      - PHP uses this operator to access properties of objects; more later
  - Syntax:
    - creating struct: (Remember semicolon!)
      ```c
      struct Point {
          int x;
          int y;
      } a, b, c; // Declares variables of "struct Point" type - optional
      ```
    - using struct:
      `struct Point min = {1, 1}; // Declaration and initialization`
  - Using typedef with structs:
    ```
    typedef struct {
        int x;
        int y;
    } Point; // Point is type identifier, not variable declaration!
    ```
    - Why?
      `Point min = {1, 1}; // No "struct" keyword`
  - Using forward declarations
    - when you need struct to contain pointer to its own type:
      ```
      typedef struct {
          Node* next;  // Won't compile! "Node" isn't yet declared
      } Node;
      // Solution:
      typedef struct N {
          N* next;     // "N" declared - will compile
      } Node;
      ```

#### Enums ####
- enum: "enumerated type"/"enumeration"
- collection of named values, usually immutable
- Rationale: type safety
- Referred to by name - value itself is not important
- Value is considered "numeric" type (can be used in switch, etc.)
- Examples: days of the week, suit in deck of cards
    ```
    if (day == Days.MONDAY) ...
    if (suit == Suits.HEARTS) ...
    ```
- Syntax:
    - Basic definition (C/C++/C#/Java):
      ```
      enum Day {
          SUNDAY, MONDAY, TUESDAY, WEDNESDAY,
          THURSDAY, FRIDAY, SATURDAY
      }; // Semicolon necessary in C/C++; not Java/C#
      ```
    - C/C++: can use `typedef` to avoid typing "enum":

#### Objects ####
Note: defining objects in code will wait until section on OOP

- Like structs, but encapsulate *behavior* as well as data
- fields/member var's: variables that hold data (just like a struct)
    - represent an object's state
- methods/member fn's: functions that operate on, or return data from,
    the object's state
- accessing fields or methods is done with member access operator
    - C++/Java/JavaScript:
      `x = obj.field;`
      `y = obj.method();`
    - C++: use arrow operator with pointer to object
      `x = ptrToObj->field;`
      `y = ptrToObj->method();`
    - PHP uses arrow operator exclusively ("dot operator" is string
      concatenation operator)
      `$x = $obj->field;`
      `$y = $obj->method();`

- JavaScript object literals
  - basis for JSON (JavaScript Object Notation), a message format
  - Syntax:
    - Creating
    ```
    var obj = {
        x: 5,
        y: 7 // Note: comma on last member isn't required
    };
    // "Associative arrays" are just objects:
    var dict = {
        "foo" : "bar",
        "baz" : "bash"
    }
    // Objects can contain other objects
    var point = {
        x: 0,
        y: 0,
        details: {
            'name': 'origin',
            'description': 'the origin of a two-dimensional graph'
        }
    }
    ```
    - Accessing
      - May be accessed with the dot operator:
        `f = dict.foo; // retrieves value of foo`
        `dict.foo = f; // sets value of foo`
      - May also be accessed as assoc.array:
        `f = dict['foo']; // retrieves value of foo`
        `dict['foo'] = f; // sets value of foo`

### PARAMETERIZED TYPES ###
- Purpose: type safety - so only used with explicitly typed languages
  - Commonly used with "container" objects
  - Example: Stack data structure (explain)
      `push(value`): what type is value?
      `pop()`: what type is returned?
    - Without parameterized types, it would have to be a "generic" object
      (e.g. type "Object" in Java), with all the implied casting; both
      inconvenient, and not type-safe (compiler won't catch)
- Java (>= 5.0)/C# (>= 2.0): generics
  - Type parameters must be reference types; no primitives - use wrapper
    classes (`Integer`, `Float`, etc.)
- C++: templates
  - Type parameters may also be primitive types
- Creating parametrized objects:
  `Hashtable<String, String> dict = new Hashtable<String, String>();`

## Operators ##
- Tokens that represent operations on values (like math symbols)
- Arity: # of operands
    - unary, binary, or ternary (1, 2, or 3 respectively) - most are binary
- Associativity (RTL vs. LTR)
- Operator precedence
- Operator overloading: same token may represent different operation,
    depending upon operand types
    - A variety of ad hoc polymorphism
    - in many C-style languages, "+" can mean either numeric addition,
      or string concatenation (but not PHP)
    - C++ allows programmers to overload operators; others don't (the
      overloading is part of the language specification)

### Operators, by Category ###

- assignment: `=`
      - Assigns value to a variable, and returns that value
        - Can be chained; RTL associativity
          `var x = y = z = 0;`
      - compound assignment ops: append "=" to end
      - non-numeric values; pitfalls
- comma: `,`
      - evaluates expressions, LTR, returns results of last one, discards
        the other results
      - most common use is declaring multiple variables (of same type) at
        once
      - not to be confused with comma as separator (e.g. fn. params)
- mathematical: `+, -, *, /, %, ++, --` (pre/post-fix)
      - pitfalls: string concatenation, type promotion
- logical: `&&, ||, !`
      - In strongly typed languages, result is always Boolean (true/false)
      - In loosely typed languages, result is *the value of the final operand*
        - Example: JavaScript - setting a default value
            `x = x || 'hello'; // If x is undefined, it will now be "hello"`
            This **will not work** in strongly-typed lang.'s like Java or C++!
      - short-circuiting
- comparison: `==, ===, <, <=, >, >=, !=, !==, (some) <>`
      - result is always Boolean (true/false)
      - no assign. variations
      - JavaScript: "equality" vs. "equivalence:" `===` vs. `==`
- conditional: `?:`
      - only ternary operator in C-style languages
      - useful for conditional assignment
      - in strongly-typed languages, must return same type
- bitwise:` &, |, ^, ~, <<, >>, >>>` (Java), assign.
- string concatenation: `+` (most), `.` (PHP), assign.
- array access: `[]`
- member resolution: `.`, `->`, `::` (language-dependent)
- type operators
      - comparison: `typeof`, `instanceof` (language-dependent)
      - cast operator: `(type) exp`
      - object creation: `new`
        - creates object on heap
      - object destruction: `delete`, `delete[]`
        - C++ only - other lang's have memory management
- other operators
      - PHP: \' (execution), `@` (error control)
      - C/C++: `sizeof`

## Flow of Execution ##

### Expressions and statements ###
- Expression: any piece of code that will produce a result when executed
    (could be a literal, the result of an operation, fn call, etc.)
    - Analogy: a "clause" or "sentence fragment"
- Statement: a "line" of code that does something
    - Analogy: a "sentence"
    - Statements can contain multiple expressions
    - If a statement results in a value, that value is usually ignored;
      thus, statements usually have side effects
    - In C-style languages, statements are followed by a semicolon (";")
    - Some languages (e.g. C#) place limits on what can be considered a
      statement, by the last operation
    - Some people (who?) call statements "commands"
- Statement blocks: `{ }`
    - Defines a separate block of code
    - Used in control structures, functions, etc.
    - In most languages, a block creates a separate scope
        - but not JavaScript - see functions
    - Many languages allow stand-alone blocks

### Control structures ###

#### Testing and branching ####
- if statement:
    ```
      if (expression) {
          // Statement(s) to evaluate if expression is true
      }
    ```
    - `expression` is anything that evaluates to a Boolean
- else statement:
    ```
    if (expression) {
        // Statement(s) to evaluate if expression is true
    }
    else {
        // Statement(s) to evaluate if expression is false
    }
    ```
- "else if" also possible, but must come before final "else"

#### Iteration (Looping) ####
    - `while`
    - `do`/`while`
    - `for`
    - "foreach"
      - iterate over all members of collection/array
      - only works with iterable types; lang. specific
      C: none (some non-std libs implement)
      C++: only in std lib (not lang. construct)
        ```
        // x must be iterable; callback is single-arg fn)
        std::for_each(x.begin(), x.end(), callback);
        ```
      - Added in C++11:
        `for (int elem : arr) {...} // same as Java`
      C#:
        `foreach (int elem in arr) {...}`
      Java:
        `for (int elem : arr) {...}`
      JavaScript:
        `for (prop in obj) {...} // Objects only! Use "for" with arrays`
      PHP:
        ```
        foreach (arr as $elem) {...} // Numeric array
        foreach (arr as $key => $value) {...} // Assoc. array
        ```

### Handling errors ###
- `throw`
- `try`/`catch`
- `finally`
- assertion checking
    - assertions are checked at runtime
    - usually need a library: `assert.h` (C), `<cassert>` (C++);
      Java 7 is native;
    - assert fn: throws an error if expression evals. to false
      `assert(x > 0); // If x is 0 or less, throws exception`

# Functions #

## Decomposition and abstraction ##
- Decomposition: breaking a complex problem/system into smaller parts
    (sometimes called "modules," but this is has a different meaning)
    - creates structure
    - self-contained
    - promotes code re-use
- Abstraction: suppressed details of implementation
    - code is "black box:" takes inputs, responds with output, but how it
      produces that output is immaterial (provided it's correct)

## Terminology ##
### Using functions ###
    call: to use a function in the code
    - caller: the part of the code that calls a function
    invoke: synonym for "call," usually used with methods
    pass: to communciate values between the caller and the function
    - example: `pow(2, 5)` => "raise 2 to the 5th power"
      2 and 5 are passed to the function
    return: to pass a value back from fn to caller (as result/output)
    - example: `pow(2, 5)` => 32 is return value
    - return value is used as rvalue "in place of" function call:
      x = pow(2, 5); // x is now 32
### Functions, procedures, subroutines, methods ###
    (not official, but widely used)
    subroutine: named location where program execution can jump
      - e.g. `goto` statement
      - nowadays, term is mostly used with assembly-language programming
    function: a named piece of code, that is called with arguments,
      and returns a value
      - pure function:
        - return value determined solely by args (not system state)
   	    - does not change system state (I/O, globals)
   	    - does not change value of args
   	    - returns the same value when passed the same arguments
          (so not e.g. random number generator)
      - impure function: any function that is not a pure function
    procedure: a function that does not return a value
      - all procedures are impure functions (no reason to write one otherwise)
      - procedures cannot be used as rvalues (fn's can)
      - unfortunately, functional programmers use "procedure" for any
        function; ironically don't use "function" very often
    method: a function that is associated with an object
      - called "member functions" in C++
      - sometimes called a "message"
      - usually impure fn's:
        - methods can modify object's state
        - return value depends upon object's state
### Parts of a function ###
  - identifier: name
  - formal parameters: variables that represent the function's input values
    - parameters vs. arguments
    - variadic: variable # of args ("varargs")
  - return type: value representing the function's output value; passed back
    to caller
    - omitted in implicitly-typed languages: JavaScript, PHP
    - "void functions"
  - body: statements that are executed when the function is called
    - body may include any kind of statements: variable definitions, operations,
      or other function calls
    - however, except for JavaScript, functions cannot be DEFINED inside another
      function
### Declaration and definition ###
- signature (prototype)
    Includes:
        - name
        - number of params
        - type of params
    Does not include:
        - return type
        - param type modifiers (const, reference, etc.)
        - body

## Syntax ##
- Calling a function: name, parentheses, comma-separated argument list
    ```
    func1(arg1, arg2) // two arguments
    func2()           // no arguments - note parentheses are not optional!
    ```
- Explicitly typed langs:
    ```
    ret_type fn_id(param_type param_id) {
        // ...body
    }
    ```
    - C and C++: function prototypes
      `ret_type fn_id(param_type); // No body; no var names, only types`
      - Usually, function prototypes kept in .h (header) files; function
        definitions kept in .c (C) or .cpp (C++) files
      - Definition files are compiled to object code separately; hides
        implementation details, avoids re-compilation
- Implicitly typed langs:
    ```
    function fn_id(param_id) {
        // ...body
    }
    ```
    - PHP: note no `$`
    - JavaScript: fns as vars - see below

## Function Scope ##
- local vars and params are not available outside function body
- vars defined in calling function are not available inside function body
- vars defined in enclosing scope ARE available inside function body
    What is an enclosing scope? The scope in which the function is DEFINED.
    - Globals - vars/consts defined outside any other functions
    - If function is a member of a class: class variables
    - If function is part of a namespace: namespace variables
    - If function is defined within another function: vars
        available in "parent" function
        - Only C-style language that allows such definitions is JavaScript;
          see section about functions as first-class objects
    - If a local variable is declared with the *same name* as a variable in the
        enclosing scope, the local variable *shadows* the other variable
        - Not possible in PHP, because variables aren't declared
- Returning values from functions
  - `return` keyword: defines a return statement, which returns to the caller
  - if an expression follows the return keyword, the result of that expression
    is returned to the caller
  - in explicitly typed languages, the result of the expression must match the
    declared return type; or a type that can be implicitly converted
      - void functions cannot return any type, so no expression can follow the
        `return` keyword
    - in languages without explicit types, return value can be anything
      - if no value is returned, the function "returns" a null value
        PHP: NULL; JavaScript: undefined
  - return statement is optional
    - In C-style languages, equivalent to "return;" at the end of the body
    - In some other languages, the resulting value of the last expression
        in the body is returned; the resulting value of all other expressions
        are ignored

## Argument passing and evaluation ##
- Arguments can be any expression that produces a value:
    literal, variable, operation(s), result of another function call
- Strict evaluation
    - Argument expressions are evaluated before the function is called;
      the resulting value is passed to the fn.
    - The vast majority of languages, and all C-style languages, use strict eval
      for functions
- Pass (call) by value vs. by reference
    - Pass by value: argument's value is copied to parameter
      - Good, because argument won't be changed if parameter is altered inside
        function
      - Bad, because value must be copied in memory (e.g. big obj.)
    - Pass by reference: argument's memory location copied to parameter
      - Good, because you only need to copy a memory location (not entire obj.)
      - Bad, because argument is shared
        - change to param will also change arg - ignores scope
          semantics, automatically makes fn. an impure fn.
      - Some languages (Clu) refer to this as "call-by-sharing;"
        but the term is not widely used
    - C/C++ reference semantics
      - Start with these, because they are the basis for other lang's, and the
        explicit differences will make understanding other lang's easier
      - C/C++: Pointers
        - When passing by pointer, the pointer itself is passed by value;
          that is, the memory address is copied
        - Pass a value type by pointer:
            ```
            void f(int* param); // function prototype
            // in caller:
            int arg = 5;
            f(&arg);            // note address-of operator
            f(&5);              // won't compile - must be addr of lvalue
            ```
        - Arrays are just "syntactic sugar" for pointer:
            ```
            // Function declaration (prototype):
            int f(int[] arr);    // Formal parameter is array of int's
            int f(int* arr);     // Identical behavior!
            // in caller:
            int result;
            int[] arr = {5, 6, 7. 8, 9};
            result = f(arr);     // Note: no address-of operator
            result = f(&arr[0]); // Identical behavior!
            ```
          - The C/C++ term for this is a "simulated reference"
            Semantically identical to pointer, but does not use pointer syntax
      - C++: References
        - When passing by reference, the parameter becomes an alias of the
          argument value
        - Pass a value type by reference:
          ```
          void f(int& x); // function prototype
          // in caller:
          int arg = 5;
          f(arg);         // no address-of operator!
          f(5);           // won't compile - reference must be mutable
          ```
      - References vs. pointers: semantically different
        Assigning a new object to a pointer vs. a reference:
          ```
          // Pass by pointer function definition
          void passPtr(int* p)
          {
              int x = 5;
              p = &x;
          }
          // Pass by reference function definition
          void passRef(int& r)
          {
              int x = 5;
              r = x;
          }
          // In caller:
          int a = 3;
          passPtr(&a);  // a has value 3; its mem loc was passed by value
          passRef(a);   // a has value 5!
          // What about using a pointer?
          a = 3;        // reset back to 3
          int* b = &a;
          passPtr(b);   // a has value 3; b was passed by value
          passRef(*b);  // a has value 5!
          ```
      - const params: making shared arguments immutable
        - Pointers:
          ```
          void f1(const int* param);       // *param is const; no assignment
          void f2(int* const param);       // param is const; *param is not!
          void f3(const int* const param); // param and *param are const
          // in caller:
          int arg = 5;
          f1(&arg); // arg can't change (param can be re-referenced)
          f2(&arg); // arg can change! (param can't be re-referenced)
          f3(&arg); // arg can't change value (param can't be re-referenced)
          ```
        - References:
          ```
          int f(const int& param); // param is completely immutable
          // in caller:
          int arg = 5;
          f(arg); // arg can't change
          f(5);   // this will compile! arg is reference to immutable rvalue
          ```
    - Other C-style languages:
      - Value types are *always* passed by value
      - Reference types are passed by reference, but a "reference" is
        semantically identical to a pointer - i.e. they are what C/C++ calls
        "pass by simulated reference"
      - In PHP, references are aliases to symbol table entries:
          http://php.net/manual/en/language.references.php
        HOWEVER, they behave semantically like pass-by-pointer

### Non-strict evaluation strategies ###
    - Argument expressions are not evaluated until/unless they are used in the
      function body
    - Example problem: mimic if/then/else statement with function
       ```
       // Function definition
       int if_then_else(bool if_exp, int then_exp, int else_exp) {
           if (if_exp) {
               return then_exp;
           }
           else {
               return else_exp;
           }
       }
       // Function call - parentheses are for clarity
       a = 1;
       b = 0;
       if_then_else((b > 0), (5 / b), (5 / a));
       ```
     Strict evaluation produces a divide-by-zero error at runtime!
     This shouldn't happen, because `(5 / b)` should not be evaluated.
     (Other example: sort-circuiting for `||` and `&&` operators)

     Non-strict evaluation can "fix" this behavior.
     - Variations:
       - Call-by-macro-expansion: the argument expression code is literally
         substituted for the parameter when it is used. Example:
         ```
         // function call as before:
         if_then_else((b > 0), (5 / b), (5 / a));
         // The body of the function literally becomes:
         int if_then_else(bool if_exp, int then_exp, int else_exp) {
            if ((b > 0)) {
                return (5 / b);
            }
            else {
                return (5 / a);
            }
        }
        ```
        - But, call-by-macro-expansion needs a way for f() to know values for
          a and b; only possible if they have global scope
      - Call-by-name: similar to call-by-macro-expansion, but language
        automatically keeps reference to caller's scope
      - Call-by-need: similar to call-by-name, but the language holds a record
        of the results of a function call with specific parameters; so the
        function is only evaluated once (per set of parameter values), and is
        returned from the record on subsequent calls
        - Memoization
        - Won't work for impure functions (e.g. random number generator)

## Function paradigms ##
- Functions as imperative language constructs
    - Function declaration; function signature
    - Functions and stack memory
      - Params/local vars are located in stack memory
      - Stack frame: data that is created when fn is called - creates context
        (Note: OS's have different implementations)
        - argument values (parameters)
        - instruction pointer (location of caller)
        - local vars
        - space for return val can be part of stack frame, but often it is
          a register (OS dependent)
- Functions as first-class objects - JavaScript
    - May be assigned to variable, passed to function as argument, returned
      from function as a return value
    - May be anonymous; "function literal"
    - Instead of stack frame, function is "object"
      - Context object is allocated when fn is called, garbage collected when
        no more references to it
      - Probably stored in heap memory (implementation detail)

# OBJECT-ORIENTED PROGRAMMING #
## Principles ##
  encapsulation: related data and functions are grouped together into one
    data structure
  information hiding: data in an object may not be available to client code
    - fields and methods have object scope, not function or global scope
    - strongly related to encapsulation, but encapsulated info may not
      necessarily be hidden (C/C++ struct, JavaScript object)
  inheritance: an object or type may reuse the behavior of another object or
    type (it inherits the behavior)
  polymorphism: object of a subtype can be used as if it were an object of
    its supertype
    - subclass polymorphism is technical term (but most people mean this);
      occasionally called "inclusion polymorphism"
    - not the same as inheritance; inheritance is necessary for polymorphism,
      but the reverse is not true
- Other terms
  class: a kind of "blueprint" for creating an object
  - a class defines a data type
  instance: an object that is created and resides in memory; usually an object
    of a class type (e.g. "an instance of the String class")
  member: general term for any data or functionality that is associated with a
    class or object, and can be referred to by name
  field: a variable that is a member of an object or class
  - other terms: member variable (C++), attribute
  - if a field is specific to an instance, it is called an instance variable;
    if it is shared among all instances, it is called a class variable
    (most fields are instance variables)
  method: a function that is a member of an object or class
  - other terms: member function (C++), message (Objective-C)
  - Accessor and mutator methods
    - accessor ("getter"): a method that returns the value of a field;
      usually does not take any arguments
    - mutator ("setter"): a method that assigns a value to a field;
      usually returns nothing (void)
    - used when fields aren't directly accessible (see below)
  property: two different meanings
    1. an object member that is accessed like a field, syntactically;
       but "behind the scenes," these are getter/setter calls
       - supporting languages: C#, PHP
    2. JavaScript: any member of an object
## Flavors of OOP ##
1. Classical OOP:
    ("Classical" refers to the use of classes; not like "classical music")
    - most common form: C++, C#, Java; JavaScript simulates it
        - ECMAScript 2014 (aka ES6) has "syntactic sugar" that allows JavaScript
            syntax to mimic classical OOP syntax
    - objects are instances of a class (abstract data type)
    - objects are instantiated using a class's constructor
    - inheritance relationships must be explicitly declared when declaring the
      class - esp. for explicitly typed languages
2. Prototypal OOP:
    (Note: no relation at all to function prototypes!)
    - objects are "cloned" from another object (their prototype)
      - "cloning" may not be copying; obj. may contain reference
      - once cloned, a specific object may be given its own properties
      - prototyping achieves inheritance
    - JavaScript is only C-syntax lang. Lua is another; lib support in
      Perl, Python, R

## Classical OOP ##
("Classical" refers to the use of classes; not like "classical music")

Languages: C++, Java, PHP; JavaScript adopts some of it (more later)

- most common form: C++, C#, Java; JavaScript simulates it
    - ECMAScript 2014 (aka ES6) has "syntactic sugar" that allows JavaScript
        syntax to mimic classical OOP syntax
- objects are instances of a class (abstract data type)
- objects are instantiated using a class's constructor
- inheritance relationships must be explicitly declared when declaring the
  class - esp. for explicitly typed languages

- Creating and deleting objects using classes
  - Constructor: a special function that is used to create an object
    - Constructors can take arguments, or not
  C++: objects can be created on stack or on heap
  - Create on stack:
    ```
    // create with parameters
    MyObj obj(5);
    // this is actually a call to the constructor, with no args
    MyObj obj; // Creates the object; not merely a declaration!
    ```
  - Create on heap:
    ```
    // C++: create on heap - use "new" keyword; will return ptr
    MyObj* obj = new MyObj(5);
    // C++ does not have memory mgmt, so heap objects need to be deleted
    delete obj;
    ```
  Java/JavaScript/PHP: objects always created on heap
  - Also uses "new" keyword:
    `MyObj obj = new MyObj(5);`

## JavaScript and Prototypal OOP ##
(Note: no relation at all to function prototypes!)
- objects are "cloned" from another object (their prototype)
  - "cloning" may not be copying; obj. may contain reference
  - once cloned, a specific object may be given its own properties
  - prototyping achieves inheritance
- JavaScript is only C-syntax lang. Lua is another; lib support in
  Perl, Python, R

- Defining methods in JavaScript object literals
    ```
    var pt = {
        x: 4,
        y: 3,
        // Distance from the origin (0, 0)
        distance: function() {
            // The Math library is a standard JavaScript library
            return Math.sqrt((this.x * this.x) + (this.y * this.y));
        }
    };
    // usage:
    var dist = pt.distance(); // dist is 5
    ```
- Constructor functions
- The Prototype Chain
    - Declaring methods on the prototype
    - Single Inheritance via the Prototype Chain
    - `hasOwnProperty`
- Simulating "Multiple Inheritance"
    - Mixins: copy mixin methods as properties
- "Duck Typing"
    - "If it walks like a duck..."
    - Loosely typed, so no way to define an interface
    - Instead, don't check for "type," check for *behavior* (i.e. existence of
        a method on an object)
- ES6 Classes
    - Merely "syntactic sugar" for the above
    - ES6 class:
        ```
        class Point {
            constructor(x, y) {
                this.x = x || 0;
                this.y = y || 0;
            }

            distance() {
                return Math.sqrt((this.x * this.x) + (this.y * this.y));
            }
        }
        // Usage:
        let pt = new Point(4, 3);
        let dist = pt.distance(); // dist is 5
        ```
        Syntactic sugar for (something like) this:
        ```
        function Point(x, y) {
            this.x = x || 0;
            this.y = y || 0;
        }
        Point.prototype.distance = function() {
            return Math.sqrt((this.x * this.x) + (this.y * this.y));
        }
        ```
        (Note: this is deliberately simplistic; no guards against function
            being called without the `new` keyword, etc.)

# Namespaces and Packages #
- Grouping of identifiers (names) under one, overarching identifier (name)
- Purpose:
  - Reduce naming conflicts (scope)
  - Conceptual convenience
  - Effecient inclusion - include/require only what is needed
  - Information hiding (somewhat)
  - File system organization - each is its own file or sub-folder
- What's the difference between these and classes?
  - You can't instantiate them
  - In compiled languages, they often signify a scope, so the compiler can
    optimize them away (they aren't in bytecode)
  - In interpreted languages,

# Appendix A: Language Specifications, with References, Guides, and Tutorials #
Links are to English language versions. Other languages are usually available
on the same site.

## C ##
### Specification ###
- [ISO/IEC 9899:201x](http://www.open-std.org/JTC1/SC22/WG14/www/docs/n1570.pdf) (PDF)
    *Note:* This is the final working draft before the specification became
    final. It is provided free of charge from
    [Open Standards](http://www.open-std.org/).
    The final specification is not openly available, and must be purchased from
    [ANSI](http://webstore.ansi.org/default.aspx).

### References, Guides, Tutorials ###
- [C Language Reference (MSDN)](https://msdn.microsoft.com/en-us/library/fw5abdx6.aspx)
- [GNU C Reference Manual](https://www.gnu.org/software/gnu-c-manual/)
- [IBM C/C++ Language Reference](http://www-01.ibm.com/support/docview.wss?uid=swg27002103&aid=1)
- [C reference (cppreference.com)](http://en.cppreference.com/w/c)

## C++ ##
### Specification ###
- [ISO/IEC 14882:2014](http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2014/n4296.pdf)
    *Note:* This is the final working draft before the specification became
    final. It is provided free of charge from
    [Open Standards](http://www.open-std.org/).
    The final specification is not openly available, and must be purchased from
    [ANSI](http://webstore.ansi.org/default.aspx).

### References, Guides, Tutorials ###
- [C++ Language Reference (MSDN)](https://msdn.microsoft.com/en-us/library/3bstk3k5.aspx)
- [IBM C/C++ Language Reference](http://www-01.ibm.com/support/docview.wss?uid=swg27002103&aid=1)
- [C++ reference (cppreference.com)](http://en.cppreference.com/w/cpp/language)
- [cplusplus.com](http://www.cplusplus.com/reference/)

## C# ##
### Specification ###
- [C# Language Specification (MSDN)](https://msdn.microsoft.com/en-us/library/ms228593.aspx)
- [ECMA-334](http://www.ecma-international.org/publications/files/ECMA-ST/Ecma-334.pdf) (PDF)

### References, Guides, Tutorials ###
- [C# Reference (MSDN)](https://msdn.microsoft.com/en-us/library/618ayhy6.aspx)
- [C# Programming Guide (MSDN)](https://msdn.microsoft.com/en-us/library/67ef8sbd.aspx)

## Java ##
### Specification ###
- [Java Language and Virtual Machine Specifications (Oracle)](https://docs.oracle.com/javase/specs/)

### References, Guides, Tutorials ###
- [The Java Tutorials](http://docs.oracle.com/javase/tutorial/index.html)

## JavaScript ##
### Specification ###
[- ECMAScript 2016 Language Specification](http://www.ecma-international.org/publications/standards/Ecma-262.htm)

### References, Guides, Tutorials ###
- [JavaScript reference (MDN)](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference)
- [JavaScript Language Reference (MSDN)](https://msdn.microsoft.com/en-us/library/yek4tbz0.aspx)
- [JavaScript and HTML DOM Reference (w3schools)](http://www.w3schools.com/jsref/)

## PHP ##
- [PHP Manual](http://us3.php.net/manual/en/index.php)
    *Note:* This is the closest thing PHP has to an official specification.
    A WIP specification can be found [here](https://github.com/php/php-langspec).

- [PHP Language Reference](http://us3.php.net/manual/en/langref.php)
    The portion of the PHP Manual that covers only the language reference.
