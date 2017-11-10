#!/bin/bash

LIBSOURCE="$1"

cd $LIBSOURCE

# We assume this will build all the executeables
# stack build --allow-different-user --install-ghc --no-system-ghc

# Get all the dependencies and the library itself
make_dist () {
  echo $1
  LIBLOC=$(stack exec -- which $1)
  mkdir "$1.dist/"
  mkdir "$1.dist/lib"
  cp $LIBLOC "$1.dist/$1"
  echo "Copying the library and all its shared dependencies..."
  cp $(ldd "$1.dist/$1" | grep .stack | awk '{print $3}') "$1.dist/lib/"

  tar -czvf "$1.dist.tar.gz" -C "$1.dist/" .
  rm -rf "$1.dist/"
}

for lib in ${@:2}
do
  echo "Making distributable for $lib ..."
  make_dist $lib
done

# stack clean --allow-different-user --full 
# Clean up by removing all stack related.
