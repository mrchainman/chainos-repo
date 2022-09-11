#!/bin/bash
cd ../pkgs &&
if [ $# -lt 1 ]
then
	printf "
Usage:\n
./build.sh all - Build all packages\n
./build.sh git - Build all git packages\n
./build.sh <pkg> - Build <pkg>\n
	"
else
	case $1 in
		all)
			for i in ./*
			do
				cd $i && makepkg -c -C -f --sign --key F818840FB1CDD7C4CCAB06A41F08899E4EB9D50B && cd ..|| cd ..
			done
			;;
		git)
			for i in ./*-git
			do
				cd $i && makepkg -c -C -f --sign --key F818840FB1CDD7C4CCAB06A41F08899E4EB9D50B && cd ..|| cd ..
			done
			;;
		*)
			cd $1 && makepkg -c -C -f --sign --key F818840FB1CDD7C4CCAB06A41F08899E4EB9D50B
			;;
	esac
fi
