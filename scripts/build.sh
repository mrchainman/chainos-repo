#!/bin/bash
cd ../pkgs &&
if [ $# -lt 1 ]
then
	for i in ./*
	do
		cd $i && makepkg -c -C -f --sign --key F818840FB1CDD7C4CCAB06A41F08899E4EB9D50B && cd ..|| cd ..
	done
else
	cd $1 && makepkg -c -C -f --sign --key F818840FB1CDD7C4CCAB06A41F08899E4EB9D50B
fi

