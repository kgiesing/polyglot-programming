# Programming Overview #
## Single-purpose vs. general-purpose computers
  - Single-purpose: the computer has one program, and can only run that
    program - also called fixed-program computer
  - General-purpose: the computer can take a program as input data - also
    called stored program computer
    - Since a program is data, a general-purpose computer can also give
      back another program as output; important when we talk about compilers
      and interpreters
## Programming languages
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

## Basic programming terminology
### Syntax-related:
  - Keyword: a sequence of characters that have special meaning in a language;
    part of the language syntax. (Can't be used as a name for anything else.)
  - Reserved word: seq. of chars. that have special meaning in a language,
    but are not necessarily part of the syntax. Examples: "goto" in Java,
    "super" in JavaScript.
    - In nearly all lang's, keywords are subset of reserved words
### Data-related:
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
### Manipulation-related:
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

## C-style syntax
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

## [ADVANCED] Programming paradigms

### imperative vs. declarative
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

### Common programming paradigms
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
