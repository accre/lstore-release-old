#!/usr/bin/env bash

[ "${1}" == "" ] && echo "${0} /install/prefix" && exit 1

export PREFIX=${1}
export MAKE_ARGS="-j 10"

cd build

#Make APR
[ -d apr-[0-9]* ] || tar --no-same-owner --no-same-permissions -zxvf ../tarballs/apr-[0-9]*.gz
cd apr-[0-9]*
#../../scripts/apr-build.sh 2>&1 | tee ../../logs/apr-build.log
cat ../../scripts/apr-build.sh | sed -e "s|PREFIX=/usr/local|PREFIX=${PREFIX}|" > my-build.sh
chmod +x my-build.sh
./my-build.sh 2>&1 | tee ../../logs/apr-build.log
cd ..

#Make APR-Util
[ -d apr-util-[0-9]* ] || tar --no-same-owner --no-same-permissions -zxvf ../tarballs/apr-util-[0-9]*.gz
cd apr-util-[0-9]*
cat ../../scripts/apr-util-build.sh | sed -e "s|PREFIX=/usr/local|PREFIX=${PREFIX}|" > my-build.sh
chmod +x my-build.sh
./my-build.sh 2>&1 | tee ../../logs/apr-util-build.log
cd ..

#Make OpenSSL
[ -d openssl-[0-9]* ] || tar --no-same-owner --no-same-permissions -zxvf ../tarballs/openssl-[0-9]*.gz
cd openssl-[0-9]*
cat ../../scripts/openssl-build.sh | sed -e "s|PREFIX=/usr/local|PREFIX=${PREFIX}|" > my-build.sh
chmod +x my-build.sh
./my-build.sh 2>&1 | tee ../../logs/openssl-build.log
cd ..

#Make HWloc
[ -d hwloc-[0-9]* ] || tar --no-same-owner --no-same-permissions -zxvf ../tarballs/hwloc-[0-9]*.gz
cd hwloc-[0-9]*
cat ../../scripts/hwloc-build.sh | sed -e "s|PREFIX=/usr/local|PREFIX=${PREFIX}|" > my-build.sh
chmod +x my-build.sh
./my-build.sh 2>&1 | tee ../../logs/hwloc-build.log
cd ..

#Make Jeraseure
[ -d Jerasure-[0-9]* ] || tar --no-same-owner --no-same-permissions -zxvf ../tarballs/Jerasure-[0-9]*.tgz
cd Jerasure-[0-9]*
cat ../../scripts/jerasure-build.sh | sed -e "s|PREFIX=/usr/local|PREFIX=${PREFIX}|" > my-build.sh
chmod +x my-build.sh
./my-build.sh 2>&1 | tee ../../logs/jerasure-build.log
cd ..

#Make ZeroMQ
[ -d zeromq-[0-9]* ] || tar --no-same-owner --no-same-permissions -zxvf ../tarballs/zeromq-[0-9]*.tar.gz
cd zeromq-[0-9]*
cat ../../scripts/zeromq-build.sh | sed -e "s|PREFIX=/usr/local|PREFIX=${PREFIX}|" > my-build.sh
chmod +x my-build.sh
./my-build.sh 2>&1 | tee ../../logs/zeromq-build.log
cd ..

#Make C-ZeroMQ (C-bindings)
[ -d czmq-[0-9]* ] || tar --no-same-owner --no-same-permissions -zxvf ../tarballs/czmq-[0-9]*.tar.gz
cd czmq-[0-9]*
cat ../../scripts/czmq-build.sh | sed -e "s|PREFIX=/usr/local|PREFIX=${PREFIX}|" > my-build.sh
chmod +x my-build.sh
./my-build.sh 2>&1 | tee ../../logs/czmq-build.log
cd ..

#Make Zlib
[ -d zlib-[0-9]* ] || tar --no-same-owner --no-same-permissions -zxvf ../tarballs/zlib-[0-9]*.tar.gz
cd zlib-[0-9]*
cat ../../scripts/zlib-build.sh | sed -e "s|PREFIX=/usr/local|PREFIX=${PREFIX}|" > my-build.sh
chmod +x my-build.sh
./my-build.sh 2>&1 | tee ../../logs/zlib-build.log
cd ..







