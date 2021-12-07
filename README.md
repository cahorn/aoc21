Advent of Code 2021
===================

See: [adventofcode.com](https://adventofcode.com/)

Dependencies
------------

* The [Glorious Haskell Compiler](https://www.haskell.org/ghc/)
* \[Optional\] [Python 3](https://www.python.org/)

Build
-----

Compile everything:

    $ make

Compile a specific solution:

    $ make d01p1

Clear build artifacts:

    $ make clean

Use
---

Solutions are built into executables that (in good UNIX form) act as filters;
they accept input from standard input and provide (terse) responses on standard
output.

Example:

    $ ./d01p1 < d01.txt
    1342

Python example:

    $ python d06p1.py < test.txt
    5934
