#!/bin/bash
printf "Git? (y/n)\n"
read -r git
printf "Name?\n"
read -r name
if [ $git = y ]
then
	mkdir ../pkgs/$name-git
	cp ../templates/INSTALL.tmpl ../pkgs/$name-git/INSTALL
	cp ../templates/PKGBUILD-git.tmpl ../pkgs/$name-git/PKGBUILD
	cd ../pkgs/$name-git
	nvim PKGBUILD
elif [ $git = n ]
then
	mkdir ../pkgs/$name
	cp ../templates/INSTALL.tmpl ../pkgs/$name/INSTALL
	cp ../templates/PKGBUILD.tmpl ../pkgs/$name/PKGBUILD
	cd ../pkgs/$name
	nvim PKGBUILD
else
	printf "Invalid option provided, exiting\n"
	exit 0
fi
