#!/bin/bash

for FOLDER in backpropllvm bfsllvm hotspotllvm lavaMDllvm nnllvm nwllvm srad_v2llvm bicgllvm syrkllvm syr2kllvm 
do
	echo ============================
	echo ============================
	echo
	echo I am in "$FOLDER"
	echo
	cd "$FOLDER"
	cat checktime
	cd ..
done

