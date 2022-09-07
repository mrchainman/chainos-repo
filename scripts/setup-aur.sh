#!/bin/bash
cd ../ &&
cd pkgs &&
paru -G $(cat aur-packages.lst)
