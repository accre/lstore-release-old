#!/usr/bin/env bash
#
#  Builds the APR Apache Portable Runtime *util* libraries.  Should be run from inside the base directory
#
d=""
[ "${1}" == "32" ] && export CC="gcc -m32" && d="32" && echo "Making 32-bit binaries"

[ "${PREFIX}" == "" ] && PREFIX=/usr/local

./configure --prefix=${PREFIX}${d} --with-apr=${PREFIX}${d} --enable-shared --enable-static
make
make test
make install

