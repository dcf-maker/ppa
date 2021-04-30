#!/bin/bash

set -e
set -v

export KEYNAME=98CA0B0E4D0D9A26733EF87A9133C3D646E93F5E

(
    set -e
    set -v

    cd ./raspbian/

    # Packages & Packages.gz
    dpkg-scanpackages --multiversion . > Packages
    gzip -k -f Packages

    # Release, Release.gpg & InRelease
    apt-ftparchive release . > Release
    gpg --default-key "${KEYNAME}" -abs -o - Release > Release.gpg
    gpg --default-key "${KEYNAME}" --clearsign -o - Release > InRelease
)


# if [ -z "$1" ] 
# then 
# 	echo "[ERROR] Falta parametro."; 
# 	exit 1
# fi

# dpkg-sig --sign builder $1
# reprepro --ask-passphrase -Vb . includedeb buster $1

# if [ $?=0 ] 
# then 
#         echo "subida correcta. Borramos $1
# 	rm $1
#         exit 0
# else
# 	echo "ERROR en la subida"
# 	exit 1
# fi

# git add .
# git commit -m "Subida a repositorio de:  $1"
# git push
