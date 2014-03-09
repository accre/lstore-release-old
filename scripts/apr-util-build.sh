#!/usr/bin/env bash
#
#  Builds the APR Apache Portable Runtime *util* libraries.  Should be run from inside the base directory
#
d=""
[ "${1}" == "32" ] && export CC="gcc -m32" && d="32" && echo "Making 32-bit binaries"

[ "${PREFIX}" == "" ] && PREFIX=/usr/local

#Apply the patch
patch -p1 < ../../tarballs/apr-util.patch
if [[ $? -ne 0 ]]; then
    echo "Patch failed"
    exit 1
fi
./configure --prefix=${PREFIX}${d} --with-apr=${PREFIX}${d}/bin/apr-ACCRE-1-config
make $MAKE_ARGS
make $MAKE_ARGS test
make $MAKE_ARGS install

