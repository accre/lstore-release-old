#!/bin/bash

[ "${1}" == "" ] && echo "${0} redmine-user" && exit 1

user=${1}

cd tarballs

../scripts/make_tarball.sh tacketar toolbox
../scripts/make_tarball.sh tacketar gop
../scripts/make_tarball.sh tacketar ibp
../scripts/make_tarball.sh tacketar lio


