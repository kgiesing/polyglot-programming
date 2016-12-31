# Documenting your Code #
- Why start here?
  - Always comment your code!
  - 90% of programming does not involve writing code;
    mainly algorithms, design - turn these into comments first

- Who documentation is for
    - Other programmers (on your team, open-source collaborators, etc.)
    - Users of your code (whether programmers or anyone else)
    - Code parsers: automatic documentation generators, IDE's, etc.
    - Yourself in a week

## COMMENTS ##
- human-readable documentation in code
    - Included in the source code itself
    - Stripped out or ignored by parser
- Syntax:
  - multiline, C-style: `/* */`
  - single-line, C++ style: `//`
    - Comment lasts from comment token, to end of line
    - Not supported by C
  - single-line, shell-style: `#` (pound/hash)
    - Not supported by most C-style languages; only Perl and PHP
      (and discouraged in PHP) - but common in non-C-style lang's

### Automatic documentation creation from comments ###
- how it works
- Documentation generator scans code for comments, outputs documentation
    in readable file format: HTML, Linux `man` files, etc.
- brands:
    - Javadoc
    - Doxygen (NOTE: multiple syntaxes - "Javadoc" style is only one of many)
    - PHPDoc/phpDocumentor
    - JSdoc
        - Google Closure compiler
        - ESDoc: like JSDoc, but specializes in ES6/ECMAScript 2014 syntax
-
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

### Comments recognized by IDE's ###
- Many IDE's (e.g. Eclipse) recognize Javadoc and similar syntaxes, and include
    tools to automatically generate the comments in code
- tags in comments (for IDE highlighting)
  - `TODO`: task needs to be started/finished
  - `FIXME`: code needs fixing
  - `NOTE`: notes for other programmers (usually about implementation)
  - `XXX`: problematic code
  - I use `DEBUG`

## Project Documentation ##
- README files
    - Traditionally, plain text
    - Many people (including GitHub) today use Markdown syntax
    - Some people use reStructuredText
- User manuals

## UML ##
