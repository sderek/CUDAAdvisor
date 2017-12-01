#!/env 
#import 

import os 


def main():

	path = '.'
	for root, dirs, files in os.walk(path):
		for f in files:
			if 'output' in f:
				print f


main()
