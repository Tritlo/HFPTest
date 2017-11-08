# HaskellFromPython

An example of how Haskell can be called directly from Python.
Try it out with:

    stack build && python3 HaskellFromPythonExample.py $(stack exec -- which HFPTest.so)
