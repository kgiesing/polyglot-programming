# Polyglot Programming with C-Style Syntax Languages #

This repo is going to hold a book that I am writing. As you probably have
guessed, the working title is "Polyglot Programming with C-Style Syntax
Languages." (Let me know if you have a better one.)

My intent is that this book will serve as:

* An introduction to coding, for relative beginners, in programming languages
    that share their basic syntax with C.

* A compare-and-contrast between how these languages work, for those who are
    familiar with one language (e.g. JavaScript) but not the others.

* An introduction to the different programming paradigms and semantics that
    these languages support, e.g. procedural vs. object-oriented vs. functional.

* A way to broaden my own knowledge.

I will be releasing the book under an open license.
This way, it can be extensively quoted, remixed, and built upon by others.
If it turns out to be good enough, I'm hoping that it could also serve as
teaching materials or a textbook for lower-level computer science courses.

A big reason that I am writing this book is because I would love to have
learned to program from a book like this. It would have saved me a lot of time
when moving from one language to another. It also would have made it *much*
easier to learn programming languages like Scheme, where both the syntax *and*
semantics are fundamentally different than, say, C or Java.
But as far as I know, no book of this nature currently exists.

## Using the Repo ##
The book is written in Markdown syntax. This will make it easier to read here
on GitHub, and the Markdown syntax can easily be converted into other formats
as needed.

The Markdown files for the book itself are in a directory called `src`.
Each sub-directory represents a different chapter of the book, and each
chapter has a table of contents, called `toc.md`. The sections of the
chapter are named by order and section title.

The intent is to serve two purposes:
1. Each section can be updated separately as necessary.
2. For remixing: sections can be moved to different chapters, repeated, or
    removed altogether.

For example, there is a chapter devoted to basic definitions of terms. I put
this at the beginning of the book, by general subject. Others may not like this,
and instead want different definitions to be at the beginning of one chapter.
Once this change is made, they could then combine the different parts into
their own "edition," to use or distribute as they please.
I'm hoping that the organization will make this sort of thing easier.

## Creating a Full Book ##
For those who want to create an entire book out of the Markdown files, I have
included a simple Makefile that will use Pandoc to create the book. 
This is provided as a convenience, and you may use whatever method you like,
and/or modify the Makefile to suit your own purposes.

This currently has two targets: `html` and `pdf`. These targets will produce
HTML and PDF versions of the book (respectively) in the `output` directory.
The book's filename will be `polyglot_programming` with the appropriate
extension.

Obviously, to use the Makefile, you will need to install both
[GNU Make](https://www.gnu.org/software/make/) and
[Pandoc](http://pandoc.org/).

Note that PDF creation requires a version of LaTeX to be installed. If you
don't have it already, [Pandoc recommends](http://pandoc.org/installing.html):
* Windows: [MiKTeX](http://miktex.org/)
* OS X: [Basic TeX](http://www.tug.org/mactex/morepackages.html)
* Linux: [TeX Live](https://www.tug.org/texlive/)

## Content changes ##
If you have found a mistake in any part of the book, I would appreciated it if
you raised an issue in the GitHub issue tracker. Grammar Nazis are welcome.

If it's a conceptual issue (e.g. a bad definition of "function"), then I would
*really* appreciate a cite of some trustworthy source, so that I know exactly
why I'm wrong. Sources are not required to be online, though it is more
convenient if they are.

I am not looking for help in writing the book itself, but on the off chance that
you are interested, you are more than welcome to either make your own branch
and issue a pull request, or simply fork the repo.
I believe the former is better for the book, but that's up to you to decide.
