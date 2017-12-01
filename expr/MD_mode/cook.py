#!/env 
#import 


# this script reads in each time file, and compute speedups and overhead, and "fraction"


import glob

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

	path = './time_n*'
	allfiles = glob.glob(path)
	for inputName in allfiles:
		cnt = read_file(inputName)
		outputName = "nums" + inputName.split("time")[1]

		of = open( outputName, "w")
	
		for i in range(cnt):
			of.write( str.format("{0:.4f}", dp[i].inr / (dp[i].ini + dp[i].inp*0.0 )) + "\n") #don't need inp or dlp
		of.write( "\n" );

		for i in range(cnt):
			of.write( str.format("{0:.4f}", dp[i].dlr / (dp[i].dli + dp[i].dlp*0.0 )) + "\n")
		of.write( "\n" );

		for i in range(cnt):
			of.write( str.format("{0:.6f}", dp[i].inp / dp[i].ini ) + "\n")
		of.write( "\n" );

		for i in range(cnt):
			of.write( str.format("{0:.6f}", dp[i].dlp / dp[i].dli ) + "\n")
		of.write( "\n" );

		for i in range(cnt):
			of.write( str.format("{0:.3f}", float(dp[i].li) / float(dp[i].lo) ) + "\n")
		of.write( "\n" );
			

		of.close()


main()
