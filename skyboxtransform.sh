#!/bin/bash

if [ -z $1 ]; then
	echo Usage: first and only argument specifies the sky name to transform
	echo cwd should be the folder with skyboxes, like
	echo      Valve/game/gfx/env/
	echo where game is dod, cstrike etc.
	exit 1
fi

for i in {up,dn,ft,bk,rt,lf}; do
	cp -v $1$i.tga $10$i.tga;
	done

convert -verbose $10up.tga -rotate 90 $11up.tga
convert -verbose $10dn.tga -rotate 270 $11dn.tga
cp -v $10rt.tga $11bk.tga
cp -v $10lf.tga $11ft.tga
cp -v $10ft.tga $11rt.tga
cp -v $10bk.tga $11lf.tga

convert -verbose $10up.tga -rotate 270 $13up.tga
convert -verbose $10dn.tga -rotate 90 $13dn.tga
cp -v $10rt.tga $13ft.tga
cp -v $10lf.tga $13bk.tga
cp -v $10ft.tga $13lf.tga
cp -v $10bk.tga $13rt.tga

convert -verbose $10up.tga -rotate 180 $12up.tga
convert -verbose $10dn.tga -rotate 180 $12dn.tga
cp -v $10rt.tga $12lf.tga
cp -v $10lf.tga $12rt.tga
cp -v $10ft.tga $12bk.tga
cp -v $10bk.tga $12ft.tga

for j in {0..3}; do
	let m=$j+4
	convert -verbose $1${j}bk.tga -flop $1${m}ft.tga
	convert -verbose $1${j}ft.tga -flop $1${m}bk.tga
	for k in {up,dn,rt,lf}; do
		convert -verbose $1$j$k.tga -flop $1$m$k.tga
		done
	done
