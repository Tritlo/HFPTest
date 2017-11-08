#! /usr/bin/env python

from haskell import Haskell

import sys

with Haskell(sys.argv[1]) as lib:
    print(lib.someFunc(2))
    ranli = [2, 1, 4, 5, 1]
    print("pre sorting {}".format(ranli))
    print(lib.sortIt(ranli))
