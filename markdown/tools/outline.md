# Programming Tools #

## Text Editors ##
- "Vanilla" text editors (usually bundled with OS)
    - Notepad (Windows)
    - TextEdit (OSX)
    - vi/vim (Linux) - can be specialized

- Source code editors
    - More features:
        - Syntax highlighting
        - Automatic indentation
        - Code auto-completion
        - "Code folding" - ability to show/hide blocks of code at a time
        - Extensible, by plugins or scripts
    - Popular source code editors
        - Notepad++ (Windows; proprietary)
        - SublimeText (OSX, started porting to other OS's; proprietary)
        - Atom (cross-platform, open source)
        - GNU Emacs (Linux, ported to other OS's; open source)
            - Note: Emacs is not a source code editor out of the box, and must
                be customized; but it is highly customizable, and many
                programmers use it for source code

## Integrated Development Environments ##
Include all the features of a source code editor, plus:
- One-click build and run of a project
- Integrated command-line interface
- Hierarchical view of classes, objects, methods, etc.
- Wizards for creation of source code files
- GUI code creation (for e.g. programming graphical interfaces)
- Specialized for a particular language (either by design, or through "flavors")
- Integration with VCS

### Popular IDE's ###
- Visual Studio (Microsoft; proprietary)
    - Xamarin Studio
- Eclipse (open source, cross-platform)
    - Spring Tools Suite
    - Aptana
    - ADT (deprecated Android IDE)
- IntelliJ IDEA
    - Android Studio
- XCode (OSX; proprietary)
- NetBeans (open source, cross-platform)

## Version Control Systems ##
- A directed acyclical graph (DAG) in graph theory
- include image here

### Centralized vs. Distributed ###
- Centralized: client-server approach
    - Single server acts as the *repository* (a.k.a. "repo") of source code
    - Each programmer's machine is a client
    - Centralized VCS's:
        - CVS
        - Subversion
- Distributed: peer-to-peer approach
    - Each programmer's machine holds an entire copy of the repo
    - Distributed VCS's:
        - Git
            - GitHub
            - Atlassian Bitbucket
        - Mercurial

### Repos and Local Copies ###
- repository (aka "repo"): a location where the source code and its complete
    revision history is held
- local copy/working copy: the copy of the code on the user's machine
    - "working copy" may also refer to a local copy at a specific time
- pull: to retrieve all revisions from a repo to a local copy
- push: to submit all revisions from a local copy to a repo
- clone vs. check out
    - clone: to initially create a local copy of a repo
        - Term is usually used with distributed VCS's like Git; centralized
            VCS's don't copy the revision history (just code)
    - check out: to update a local copy
- commit: a set of revisions added to the repo at one time
    - Commits are done manually, not when files are changed on disk
    - Commits include messages, to explain what changes were made
    - For centralized VCS's, commits must be pushed when made; for distributed
        VCS's, commits only affect the local copy of the repo until pushed

### Branching and Merging ###
- branch: a separate "track" of code; exists separately from other branches,
    so that they can be revised separately, without conflicts
    - Example: a "main" branch for software that represents a released version,
        and another branch for working on a specific feature
- merge: to take the code from one branch, and include it into another branch
    - Most commonly, you merge a branch into the master branch (but not always)
    - merge vs. rebase (Git)

### Further Reading ###
*Note:* These books are all released under open licenses, such as the 
[GNU GPL](https://www.gnu.org/copyleft/gpl.html)
or a [Creative Commons](https://creativecommons.org/) license.
See each link for details.

- [Open Source Development with CVS](http://cvsbook.red-bean.com/)
- [Version Control with Subversion](http://svnbook.red-bean.com/)
- [Pro Git](https://git-scm.com/book)
- [Mercurial: The Definitive Guide](http://hgbook.red-bean.com/)
