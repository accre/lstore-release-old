#!/usr/bin/env bash
#
#  Builds the OpenSSL libraries.  Should be run from the base directory.
#
#  Dependencies:
#

d=""
target=""
[ "${1}" == "32" ] && export CC="gcc -m32" && export CXX="g++ -m32" && d="32" && \
   export target="linux-generic32" && export CFLAGS="-m32" && echo "Making 32-bit binaries"

[ "${PREFIX}" == "" ] && PREFIX=/usr/local

./config ${target} threads no-shared --prefix=${PREFIX}${d}

make $MAKE_ARGS
make $MAKE_ARGS test
make $MAKE_ARGS install

