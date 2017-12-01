#!/bin/bash


for FOLDER in backpropllvm bfsllvm hotspotllvm lavaMDllvm nnllvm nwllvm srad_v2llvm bicgllvm syrkllvm syr2kllvm 
do
	echo
	echo
	echo ===================================================
	echo
	echo ===================================================
	echo
	echo ===================================================
	echo
	echo ">>>>>>>>>>>>>" entering "$FOLDER" ...
	echo
	cd "$FOLDER"
	echo ">>>>>>>>>>>>>" building "$FOLDER" ...
	make
	make clang
	cd ..
	echo
done
#
