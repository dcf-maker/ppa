#!/bin/bash


if [ -z "$1" ] 
then 
	echo "[ERROR] Falta parametro."; 
	exit 1
fi

dpkg-sig --sign builder m4bs-$1_armhf.deb
reprepro --ask-passphrase -Vb . includedeb buster m4bs-$1_armhf.deb

if [ $?=0 ] 
then 
        echo "subida correcta. Borramos m4bs-$1_armhf.deb"
	    rm $1
        exit 0
else
	echo "ERROR en la subida"
	exit 1
fi

#git add .
#git commit -m "Subida a repositorio de:  m4bs-$1_armhf.deb"
#git push
