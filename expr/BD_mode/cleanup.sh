#!/bin/bash

rm -f *.so
for FOLDER in backpropllvm bfsllvm hotspotllvm lavaMDllvm nnllvm nwllvm srad_v2llvm bicgllvm syrkllvm syr2kllvm 
do
	echo
	echo
	echo =====================================================================================
	cd "$FOLDER"
	echo cleaning "$FOLDER" ...
	make clean
	rm -f checktime log *.so *.o logbase logwarp baseline 
#	for i in 1 
#	do
#		echo "running..."
#		./run  > log 2>>checktime
#		./runbase  > logbase 2>>checktime
#	done
	cd ..
done
#
