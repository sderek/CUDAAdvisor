#!/bin/bash


for FOLDER in RD_mode MD_mode BD_mode 
do
	echo
	echo
	echo ===================================================
	echo ===================================================
	echo
	echo ">>>>>>>>>>>>>" entering "$FOLDER" ...
	echo
	cd "$FOLDER"
	echo ">>>>>>>>>>>>>" testing "$FOLDER" ...
	#./cleanup.sh
	./build.sh
	./run.sh
	echo
	cd ..
	echo
done
#
