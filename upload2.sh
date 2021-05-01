#!/bin/bash


if [ -z "$1" ] 
then 
	echo "[ERROR] Falta parametro."; 
	exit 1
fi

dpkg-sig --sign builder $1
reprepro --ask-passphrase -Vb . includedeb buster $1

if [ $?=0 ] 
then 
        echo "subida correcta. Borramos $1"
	    #rm $1
        exit 0
else
	echo "ERROR en la subida"
	exit 1
fi

git add .
git commit -m "Subida a repositorio de:  $1"
git push
