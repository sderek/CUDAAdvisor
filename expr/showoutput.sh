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
	#./cleanup.sh
	python showoutput.py
	echo
	cd ..
	echo
done
#
