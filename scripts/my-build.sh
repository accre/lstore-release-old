#!/usr/bin/env bash
#
#  Generic build script for Redmine projects.  Should be run from inside the projects base directory
#

d=""
[ "${1}" == "32" ] && export CC="gcc -m32" && d="32" && echo "Making 32-bit binaries"

[ "${PREFIX}" == "" ] && PREFIX=/usr/local

../../scripts/bootstrap
make $MAKE_ARGS
make $MAKE_ARGS install

