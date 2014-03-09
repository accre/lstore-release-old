#!/bin/bash

[ "${1}" == "" ] && echo "${0} /install/prefix" && exit 1

# need libxml2
cd build
[[ -d gridftp-lfs ]] || git clone https://github.com/PerilousApricot/gridftp-lfs.git
cd gridftp-lfs
cmake28 .
make
make install

