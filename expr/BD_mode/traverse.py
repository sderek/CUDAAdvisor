#!/env 
#import 

import subprocess, shlex
import os 

dp = []

class data:
	def __init__(self, a):
		self.inp = float(a[0]) #insertion, prepare
		self.ini = float(a[1]) #insertion, incremental
		self.inr = float(a[2]) #insertion, recomp
		self.dlp = float(a[3]) #deletion, prepare 
		self.dli = float(a[4]) #deletion, incremental
		self.dlr = float(a[5]) #deletion, recomp
		self.lo = int(a[6]) #level, orignial
		self.li = int(a[7]) #level, intercept
		self.ls = int(a[8]) #level, streaming


def create_data(lines):
	del dp[:]
	assert(len(lines) % 9 == 0)
	cnt = int(len(lines)/9)
	for i in range(0, cnt):
		dp.append(data(lines[ i*9: i*9+9]))

	return cnt


def read_file(file_name):
	with open(file_name) as f:
		return create_data(f.readlines())



def main():
	global dp

#	cmd = "find . -type -d"#-name \"*llvm\""
	

	path = '.'
	for root, dirs, files in os.walk(path):
		for subname in dirs:
			if 'llvm' in subname:
				print ("========")
				print subname
				for filename in files:
					print filename
					if 'akefile' in filename:
						print filename

	'''	
        path = '.'
        for root, dirs, files in os.walk(path):
                for filename in files:
                        if 'checktime' in filename:
                                print filename
	'''


main()
