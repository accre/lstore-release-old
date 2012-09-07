#!/usr/bin/env bash

[ "${1}" == "" ] && echo "${0} /install/prefix" && exit 1

export PREFIX=${1}

cd build

#Make APR
[ -d apr-[0-9]* ] || tar -zxvf ../tarballs/apr-[0-9]*.gz
cd apr-[0-9]*
../../scripts/apr-build.sh 2>&1 | tee ../../logs/apr-build.log
cd ..

#Make APR-Util
[ -d apr-util-[0-9]* ] || tar -zxvf ../tarballs/apr-util-[0-9]*.gz
cd apr-util-[0-9]*
../../scripts/apr-util-build.sh 2>&1 | tee ../../logs/apr-util-build.log
cd ..

#Make OpenSSL
[ -d openssl-[0-9]* ] || tar -zxvf ../tarballs/openssl-[0-9]*.gz
cd openssl-[0-9]*
../../scripts/openssl-build.sh 2>&1 | tee ../../logs/openssl-build.log
cd ..

#Make ProtoBuf compiler
[ -d protobuf-[0-9]* ] || tar -zxvf ../tarballs/protobuf-[0-9]*.gz
cd protobuf-[0-9]*
../../scripts/protobuf-build.sh 2>&1 | tee ../../logs/protobuf-build.log
cd ..

#Make ProtoBuf-C compiler
#You can ignorethe erros building the examples
[ -d protobuf-c-[0-9]* ] || tar -zxvf ../tarballs/protobuf-c-[0-9]*.gz
cd protobuf-c-[0-9]*
../../scripts/protobuf-c-build.sh 2>&1 | tee ../../logs/protobuf-c-build.log
cd ..

#Make HWloc
[ -d hwloc-[0-9]* ] || tar -zxvf ../tarballs/hwloc-[0-9]*.gz
cd hwloc-[0-9]*
../../scripts/hwloc-build.sh 2>&1 | tee ../../logs/hwloc-build.log
cd ..

#Make Jeraseure
[ -d Jerasure-[0-9]* ] || tar -zxvf ../tarballs/Jerasure-[0-9]*.tgz
cd Jerasure-[0-9]*
../../scripts/jerasure-build.sh 2>&1 | tee ../../logs/jerasure-build.log
cd ..

#Make ZeroMQ
[ -d zeromq-[0-9]* ] || tar -zxvf ../tarballs/zeromq-[0-9]*.tar.gz
cd zermomq-[0-9]*
../../scripts/zeromq-build.sh 2>&1 | tee ../../logs/zeromq-build.log
cd ..






