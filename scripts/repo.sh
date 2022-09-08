#!/bin/bash
cd ../ &&
if [ $# -lt 1 ]
then
	for i in pkgs/*/*.pkg.tar.zst
	do
		name=$(echo $i | awk -F"/" '{print $NF}') &&
		cp ./$i ./repo/ &&
		cp ./$i.sig ./repo/ &&
		repo-add ./repo/chainos-repo.db.tar.xz ./repo/$name
	done
	rm repo/chainos-repo.db repo/chainos-repo.files
	mv repo/chainos-repo.db.tar.xz repo/chainos-repo.db
	mv repo/chainos-repo.files.tar.xz repo/chainos-repo.files
else
	name=$(echo $1 | awk -F"/" '{print $NF}') &&
	cp ./$1 ./repo/ &&
	cp ./$1.sig ./repo/ &&
	repo-add ./repo/chainos-repo.db.tar.xz ./repo/$name
	rm repo/chainos-repo.db repo/chainos-repo.files
	mv repo/chainos-repo.db.tar.xz repo/chainos-repo.db
	mv repo/chainos-repo.files.tar.xz repo/chainos-repo.files
fi
