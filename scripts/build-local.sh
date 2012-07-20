#!/bin/bash

[ "${1}" == "" ] && echo "${0} /install/prefix [git user-id|tar]  **Default is to use tar**" && exit 1

export PREFIX=${1}

from="tar"
if [ "${2}" == "git" ] ; then
   from=git
   [ "${3}" == "" ] && echo "Pulling project from GIT but missing user id!" && exit 1
   user=${3}
fi

cd build

for p in toolbox gop ibp lio; do
  if [ ! -d ${p} ] ; then
     if [ "${from}" == "git" ]; then
        echo "Checking out repository.  May be asked for password..."
        git clone https://${user}@redmine.accre.vanderbilt.edu/git/${p}.git
     else
        tar -zxvf ../tarballs/${p}.tgz
     fi
  fi

  cd ${p}
  ../../scripts/my-build.sh 2>&1 | tee ../../logs/${p}-build.log
  cd ..
done







