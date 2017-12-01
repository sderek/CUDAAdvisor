#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<assert.h>
#include<math.h> // for ceil()
#include<vector>
#include <unordered_map>

#include "types.h"

bool NONEG = true;
bool CTATAG = false;

extern long con_whole;
extern long div_whole;

extern "C"{
	double calcRD(void*, double& avgrd, FILE*);
	double calcBD(void*, int& numBB_con, int& numBB_div);
	long calcMD(void*, long *&memBins);
	void printBBname( unsigned long long);
}


double calcBD(void* trace, int& numBB_con, int& numBB_div)
{
	if ( trace ==NULL)
	{
		printf(" !!! null pointer in calc BD() !!!\n\n");
		return -1.0;
	}

	printf(" h: >>>>>\n");
	BBlog_t* tp = (BBlog_t*) trace;

//	if (tp[0].bidx == 0)
//	int* trace = (int*) itrace;
//	short* strace = (short*) itrace;
//	long* ltrace = (long*) itrace;
		
//	if (tp[0].bidx == 0)
//		printf(" h: final dump: first few elements:  \n");
//	if (tp[0].bidx == 0)
/*		for (i = 0; i<20 ; i++)
		printf("%d\t", trace[i]);
		printf("\n");	
		
		for (i = 0; i<20 ; i++)
                printf("%d\t", strace[i]);
		printf("\n");	

		for (i = 0; i<10 ; i++)
                printf("%ld\t", ltrace[i]);
		printf("\n");	
*/	
	long length = (long)(tp[0].key);// number of entries
	printf("trace length of this CTA: %ld\n", length);

	std::unordered_map< unsigned long long, std::vector<int> > bk2tk; // Key is branch key, Value a vector of thread IDs. 
	std::unordered_map< unsigned long long, std::pair<int, int> > bk2cc; // Key is branch key, Value is source code location (cc is for code-centric). 
	
      	for (long i=1; i<length; i++)
        { //TODO this is the bottleneck

		int tkey = tp[i].tidx + tp[i].tidy*32; // this is a key for thread ID, not real id
		unsigned long long bkey = tp[i].key;

		auto pos = bk2tk.find(bkey);
		if (pos !=  bk2tk.end())
		{
			pos->second.push_back(tkey);
		}
		else {
			std::vector<int> tmp;
			tmp.push_back(tkey);
			bk2tk.insert( {bkey, tmp} );
		}

		auto pos1 = bk2cc.find(bkey);
                if (pos1 ==  bk2cc.end())
                {
                        std::pair<int, int> tmp = {tp[i].sline, tp[i].scolm};
                        bk2cc.insert( {bkey, tmp} );
                }
        }


	numBB_con = 0;
	numBB_div = 0;
        for (const auto& iter : bk2tk)
	{
		unsigned long long tk = iter.first;

		auto pos = bk2cc.find( iter.first);
		unsigned long numThreads = iter.second.size(); // the number of threads that ever passed this Basic Block;
		
		if( numThreads%32 == 0 ) //TODO
			numBB_con ++;
		else
			numBB_div ++;	

		printf(" basic block: %llu -> ", iter.first);
		printBBname(tk);
		printf(" , code loc: (%d, %d),  had %lu threads\n",  pos->second.first,  pos->second.second, numThreads );
	} 

	printf("Warp summary: \n%d convergent BB\n%d divergent BB\n",  numBB_con, numBB_div );

	con_whole += numBB_con;
	div_whole += numBB_div;	

//	if (tp[0].bidx == 0)
//	     	for (i=1; i<length; i++)
//	         	printf("%d: \t(%d,%d) (%d,%d)\t@ %p of %ld, %d bytes, line %d, col %d \n", tp[i].op,  tp[i].bidx, tp[i].bidy, tp[i].tidx, tp[i].tidy, tp[i].ea, ((long)tp[i].ea)/CACHE_LINE_SIZE,  tp[i].bytes, tp[i].sline , tp[i].scolm);


	return 0.0;
} // end of calcBD()


void printBBname( unsigned long long tk)
{
	char str[30];
	int i;
 	for (i=0; tk>48 && i<30; i++)//the remaining in tk will be
	{
                //              printf("%llu -> %c\t", tk%(128-48)+48, tk%(128-48)+48);
                        char tmp_ch = tk%(128-0)+0;
        //              printf("%c", tmp_ch);
                        tk = tk/(128-0);
                        str[i] = tmp_ch;
	}

	str[i] = '\0';
	printf(": %s", str);
}


double calcRD(void* itrace, double &avgrd, FILE* fout)
{
	int i;

	if ( itrace ==NULL)
	{
		printf(" !!! null pointer in calcRD() !!!\n\n");
		return -1.0;
	}

	fprintf(fout, " >>>>>\n");
	Entry_t* tp = (Entry_t*) itrace;

//	if (tp[0].bidx == 0)
//	int* trace = (int*) itrace;
//	short* strace = (short*) itrace;
//	long* ltrace = (long*) itrace;
		
//	if (tp[0].bidx == 0)
//		printf(" h: final dump: first few elements:  \n");
//	if (tp[0].bidx == 0)
/*		for (i = 0; i<20 ; i++)
		printf("%d\t", trace[i]);
		printf("\n");	
		
		for (i = 0; i<20 ; i++)
                printf("%d\t", strace[i]);
		printf("\n");	

		for (i = 0; i<10 ; i++)
                printf("%ld\t", ltrace[i]);
		printf("\n");	
*/	
	long length = (long)(tp[0].ea);// number of entries
	printf("trace length of this CTA: %ld\n", length);

//	if (tp[0].bidx == 0)
	long* rd = (long*) calloc(sizeof(long), length);

	std::unordered_map< void*, std::vector<long> > T4V; // Key is effective address, Value is a vector of reuse distance 
	std::unordered_map< void*, long > uniR; // a map that record unique addresses that are ever read
	std::unordered_map< void*, long > uniW; // a map that record unique addresses that are ever written
	std::unordered_map< void*, long > uniRW; //a map that record unique addresses that are ever written
	std::unordered_map< long, std::unordered_map<long, short> > cacheLines; // outer Key is a func(line, column), inner Key is effective address,

	std::unordered_map< void*, long> mystack; //stack for RD computing
	std::unordered_map< void*, long> streamStack; //stack for streaming counter
	
	// compute reuse distance
	rd[1] = -1;
	int streamCnt = 0;
      	for (i=1; i<length; i++)
        { //TODO this is the bottleneck

		auto pos = mystack.find(tp[i].ea);
//         	printf("next entry: %d to %p\n", tp[i].op, tp[i].ea);
		if(tp[i].op == 2 )
		{
			rd[i] = -2;//we don't care about writes
			if (pos !=  mystack.end())
			{
				long prevLoc = pos -> second;
				for ( auto &iter : mystack)
                                        if ( iter.second > prevLoc)
                                                iter.second--;

				mystack.erase( pos ); // pop out if found, otherwise do nothing
			}

			auto pos2 = streamStack.find( tp[i].ea );
			if (pos2 != streamStack.end() )
			{
				streamStack.erase( pos2 );
				streamCnt ++;
			}
		}

		if(tp[i].op == 1 )
		{
			if (pos ==  mystack.end())
			{
				rd[i] = -1;
				mystack.insert( {tp[i].ea, mystack.size()} );
				streamStack.insert( {tp[i].ea, 0} );
			}
			else
			{
				long prevLoc = pos -> second;
				long currLoc = mystack.size();
				for ( auto &iter : mystack)
					if ( iter.second > prevLoc)
						iter.second--;	

				rd[i] = currLoc - prevLoc - 1 ;

//				assert( rd[i] >= -1);
//				printf("%p found,  pre %d\t curr %d \n", tp[i].ea, prevLoc, currLoc);
				mystack.erase( pos);
				mystack.insert( {tp[i].ea, mystack.size() } );

				auto pos2 = streamStack.find( tp[i].ea );
                        	if (pos2 != streamStack.end() )
                                	pos2 -> second ++;
				else 
					printf("undefined case\n");	
			}
		}

		if(tp[i].op == 1 )
			uniR.insert( {tp[i].ea, (long)tp[i].bytes} );//it will auto-merge duplicated keys, record the number of bytes 

                if(tp[i].op == 2 )
                        uniW.insert( {tp[i].ea, (long)tp[i].bytes} );//it will auto-merge duplicated keys, record the number of bytes

  		uniRW.insert( {tp[i].ea, (long)tp[i].bytes} );//it will auto-merge duplicated keys, record the number of bytes

/////
//         	printf("next entry: %d to %p, rd=%d\n", tp[i].op, tp[i].ea, rd[i]);
//		for (const auto& el : mystack)
//			printf("%p : %ld\n", el.first, el.second);
//		dumpStack(tp, rd, tag, i);

		if(false)
			if ( rd[i] <= 0 )// -1 or 0
				rd[i] = 1;
			else 
				rd[i]++;
		else {}

		if( NONEG)
		{
			if( rd[i] == -1)
				rd[i] = 1;
			else if (rd[i] < -1)
				continue;
		}

		auto search = T4V.find( tp[i].ea );
		if ( search != T4V.end() ) // yes, found
			search->second.push_back( rd[i] ); //faster than insert
		else
		{
			std::vector<long> temp = { rd[i] };
			T4V.insert( {tp[i].ea, temp } );
		}

        }

//	if (tp[0].bidx == 0)
//	     	for (i=1; i<length; i++)
//	         	printf("%d: \t(%d,%d) (%d,%d)\t@ %p of %ld, %d bytes, line %d, col %d \n", tp[i].op,  tp[i].bidx, tp[i].bidy, tp[i].tidx, tp[i].tidy, tp[i].ea, ((long)tp[i].ea)/CACHE_LINE_SIZE,  tp[i].bytes, tp[i].sline , tp[i].scolm);

	std::vector<double> rdPerElement;//maintains average RD of each element
	double sumOfWarp=0;

	for (const auto& element : T4V)
	{	
		long sum4element=0;
//			printf("element=%p:\t", element.first);
		for(long rds : element.second)
		{
//			printf("%ld\t", rds);
			sum4element += rds;
		}
		double avg4element = (double)(sum4element)/element.second.size();
		sumOfWarp += avg4element;
		rdPerElement.push_back( avg4element );
//			printf("\naverage RD : %f\n", avg4element);
	}			

	printf("number of unique elemnts of this %s: %lu\naverage RD of whole %s: %f\n", CTATAG? "CTA":"warp", rdPerElement.size(), CTATAG? "CTA":"warp", sumOfWarp/(double)rdPerElement.size());
	fprintf(fout, "number of unique elemnts of this %s: %lu\naverage RD of whole %s: %f\n", CTATAG? "CTA":"warp", rdPerElement.size(), CTATAG? "CTA":"warp", sumOfWarp/(double)rdPerElement.size());

///
///
	long sumrd=0;
	long maxrd=-1;
	int cnt=0;
	for (i=1; i<length; i++)
	{
		if ( rd[i] ==-1)
			continue;
		cnt++; 
		sumrd += rd[i];
		if (rd[i] > maxrd)
			maxrd = rd[i];
	}

	avgrd = (double)sumrd / cnt;
        printf(" average rd = %f\n", avgrd);
        fprintf(fout, " average rd = %f\n", avgrd);
        printf(" max rd = %ld\n", maxrd);
        fprintf(fout, " max rd = %ld\n", maxrd);

	long sumbytes=0;
	for (i=1; i<length; i++)
        {
		if ( rd[i] ==-1)
                        continue;
		sumbytes += tp[i].bytes;
	}
        printf(" average bytes per access = %f\n", ((double)sumbytes)/cnt);
        fprintf(fout, " average bytes per access = %f\n", ((double)sumbytes)/cnt);

///
/// distribution of reuse distance
	int sizeDist = maxrd+2;
	int* distb = (int*) calloc( sizeof(int) , sizeDist ); //you need one extra spot for "-1", at the tail
	for (i=1; i<length; i++)
        {
		if (rd[i]>-1)
			distb[rd[i]] ++;
		else if (rd[i]==-1)
			distb[maxrd+1] ++;
		else if (rd[i] !=-2)
			fprintf(stderr, "undefined rd value\n");
	}

/*//Du: output
        printf(" distribution: rd value\n");
	for(i=0; i < sizeDist; i++)
		if ( distb[i]>0)
			if ( i==sizeDist-1)
				printf("-1\n");
			else
				printf("%d\n", i);
				

	printf(" distribution: rd cnt\n");
        for(i=0; i < sizeDist; i++)
        {
                if ( distb[i]>0)
                        printf("%d\n", distb[i]);

        }
*/

	int bins;
	if (maxrd==-1)
		bins = 1;
	else if (maxrd==0)
		bins = 2;
	else
		bins = ceil(log2(maxrd)) + 2;
	int* distbin = (int*) calloc( sizeof(int), bins);

	for (i=1; i<length; i++)
	{
		long t = rd[i];
		if (t==-2)
			continue;
		if (t==-1)
			distbin[bins-1] ++;
		else if (t==0)
			distbin[0] ++;
		else 
		{
			int loc = floor( log2(t) ) +1;
			distbin[loc] ++;
		}
	}

        fprintf(fout, " number of bins: %d\n", bins);
        fprintf(fout, " bin distribution starts from\n");
	for (i=0; i<bins; i++)
	{
		if (i==0 && maxrd ==-1)
			fprintf(fout, "-1\n");
		else if (i==0 && maxrd>-1)
			fprintf(fout, "0\n");
		else if (i>0 && i < bins-1)
			fprintf(fout, "%d\n", (int)pow(2, i-1));
		else 
			fprintf(fout, "-1\n");
	}

        fprintf(fout, " bin distribution: rd\n");
        for (i=0; i<bins-1; i++)
                fprintf(fout, "%d\n", distbin[i]);

//        printf(" infinity case: all -1 minus unique address: %d\n", distbin[bins-1] - T4V.size() );
//        printf(" infinity case: all -1 minus unique read address: %d\n", distbin[bins-1] - uniR.size() );

 //       printf(" streaming case: pre collected:  %d\n", streamCnt );
	for (const auto& iter : streamStack)
        {
		if( iter.second == 0)
		{
        	//	printf(" %p\n", iter.first);
			streamCnt ++;
		}
	}
//        printf(" infinity case: streaming case: total: %d\n", streamCnt );
        fprintf(fout, "%d\n", streamCnt );

//        printf(" unique read address:\n");
	long bytesR = 0, bytesW=0, bytesRW=0;
	for (const auto& ele : uniR)
		bytesR += ele.second;
        for (const auto& ele : uniW)
                bytesW += ele.second;
        for (const auto& ele : uniRW)
                bytesRW += ele.second;

	fprintf(fout, "unique addresses that are loaded:\t %lu elements, a total of %ld bytes\n", uniR.size(), bytesR);
	fprintf(fout, "unique addresses that are stored:\t %lu elements, a total of %ld bytes\n", uniW.size(), bytesW);
	fprintf(fout, "unique addresses that are loaded OR stored\t %lu elements, a total of %ld bytes\n", uniRW.size(), bytesRW);
//	printf("unique addresses that are RW-ed\t %lu, a total of %ld bytes\n", uniW.size()+uniR.size()-uniRW.size());
        fprintf(fout, " <<<<<\n\n");

	return sumOfWarp/(double)rdPerElement.size();
	
} // end of calcRD()


long calcMD(void* itrace, long *&memBins, FILE* outfile)
{
	assert ( itrace != NULL);

	int i;
	printf(" h: >>>>>\n");
	fprintf(outfile, " >>>>>\n");
	Entry_t* tp = (Entry_t*) itrace;
	

	long length = (long)(tp[0].ea);// number of entries
	int blockdimx = tp[0].tidx;
	fprintf(outfile, "trace length of this CTA: %ld\n", length);

	std::unordered_map< long, std::unordered_map<long, short> > cacheLines; // outer Key is a func(line, column), inner Key is cache line
	std::unordered_map<long, int*> instCnts ; // outer Key is a func(line, column), value is a array of counters used to distinguish repeated iterations 

      	for (i=1; i<length; i++)
        {
		if ( tp[i].op == 2)
			continue;// we don't care about store access for MD 
		
		int tid =  (tp[i].tidy * blockdimx  + tp[i].tidx)%32;  //TODO//offset thread id

		long srcloc = tp[i].sline*10000+tp[i].scolm;
		auto s = instCnts.find( srcloc );
		int iter;
		if ( s==instCnts.end() )
		{
			int* cnts = (int*) calloc( sizeof(int), 32);
			cnts[tid] ++;
			instCnts.insert( { srcloc, cnts} );
			iter=cnts[tid];
		}
		else
		{
			int* cnts = s->second;
			cnts[tid] ++;
			iter=cnts[tid];
		}

     //    	printf("%d: \t(%d,%d) (%d,%d)\t@ %p of %ld, %d bytes, line %d, col %d , iter= %d\n", tp[i].op,  tp[i].bidx, tp[i].bidy, tp[i].tidx, tp[i].tidy, tp[i].ea, ((long)tp[i].ea)/CACHE_LINE_SIZE,  tp[i].bytes, tp[i].sline , tp[i].scolm, iter);
		long ea =  (long) tp[i].ea;
		long cl = (long)ea / CACHE_LINE_SIZE;
		auto searchL = cacheLines.find( tp[i].sline*1e6+tp[i].scolm*1e4+iter); //MEM DIVERGENCE
		if (searchL == cacheLines.end() )
		{ 	//didn't find this source line, totally new
			std::unordered_map<long, short> tnew;
			tnew.insert({cl, 1} );
			cacheLines.insert( { tp[i].sline*1e6+tp[i].scolm*1e4+iter, tnew} );
		}
		else
		{
			std::unordered_map<long, short> & tt = searchL->second; //indirect reference
			auto searchc = tt.find( cl);
			if (searchc == tt.end())
				tt.insert({cl,1});
			else
				searchc->second++; 
		}
        }

//	if (tp[0].bidx == 0)
//	     	for (i=1; i<length; i++)
//	         	printf("%d: \t(%d,%d) (%d,%d)\t@ %p of %ld, %d bytes, line %d, col %d \n", tp[i].op,  tp[i].bidx, tp[i].bidy, tp[i].tidx, tp[i].tidy, tp[i].ea, ((long)tp[i].ea)/CACHE_LINE_SIZE,  tp[i].bytes, tp[i].sline , tp[i].scolm);

	fprintf(outfile, "number of memory access instructions: %lu\n", cacheLines.size());

	unsigned int maxCL = 0;
	for (const auto& inst : cacheLines)
	{
		long accesses = 0;
		int localcnt=0;
		for ( const auto & searchC : inst.second)
		{
			accesses += searchC.second;
			localcnt++;
		}
		if ( maxCL < inst.second.size() )
    			maxCL = inst.second.size();
		fprintf(outfile, "source code at  (%ld, %ld, %ld) \taccesses %lu cache Lines \tin %ld times, avg = %f \n", 
				inst.first/1000000, 
				(inst.first%(1000000))/10000, 
				inst.first%10000, 
				inst.second.size(),  
				accesses, 
				(float)localcnt/(float)accesses );
	}

	fprintf(outfile, "some instructin accesses\t%u cache line in this %s\n", maxCL, CTATAG ?"CTA":"warp");

	memBins = (long*) calloc( sizeof(long) , maxCL+1);
	for (const auto& inst : cacheLines)
        {
		int tmp = inst.second.size();
		memBins[tmp] ++;
	}

//	unsigned ii;
//	for (ii=1; ii <= maxCL; ii++)
//		printf("%d: %ld\n", ii, memBins[ii]);

        printf(" <<<<<\n\n");
        fprintf(outfile, " <<<<<\n\n");
	return maxCL;
} // end of calcMD()



/// /// 
/// ///
//EOF
