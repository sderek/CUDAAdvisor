#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<assert.h>
#include<math.h> // for ceil()
#include<sys/time.h>
#include<time.h>
#include<numeric>
#include<iostream>
//#include<fstream>


#include "../common.h"
#include "types.h"
#include "calc.cpp"

double t1, t2, t3, t4, t5, t6, t7, t8, t9;
int kernelCnt = 0;

#ifdef MD_MODE
bool MDTAG = true;
bool RDTAG = false;
bool BDTAG = false;
#endif

#ifdef RD_MODE
bool MDTAG = false;
bool RDTAG = true;
bool BDTAG = false;
#endif

#ifdef BD_MODE
bool MDTAG = false;
bool RDTAG = false;
bool BDTAG = true;
#endif


long* MEMDIV = NULL;
long MEMDIV_len = 0;
int BB_append_cnt = 0;

long con_whole = 0;
long div_whole = 0;
bool ValidStack = false;

double totalElapsedTime = 0.0;

std::unordered_map < std::string, int>  mfunc; //key is function name, value is unique ID 
std::vector< CallSite_t > callStack;
std::vector< MallocEvent_t >  heapTable; //all malloc and cudaMalloc data

char funcDic[UNIQUE_FUNC_DEVICE][FUNC_NAME_LEN];       //maintains 100 unique functions and 31 chars for each
CallSite_t contextDic[UNIQUE_FUNC_DEVICE][CALL_PATH_LEN_DEVICE];

extern "C" {
	void printea(void* p, int tag);
	void print1(void);
	void print2(void);
	void print3(int a);
	void print4(long a);
	void RetMain(void);
	void appendTrace(void*, void*);
	void appendBBlog(void*, void*);
	void dumpTrace(void* itrace);
	void* getHandle(int option);
	void mymalloc(int bytes);
	void takeString(void* p, int action);
	void callFunc(void* , void* , int , int);
	void recordMEvent(void* , long, int, int);
	void gridDims(int,int, int);
	long gridGet(void);
	void gridReset(void);
	void measureKernel(int);
}

extern void printBBname(unsigned long long);

int ToTaLTHReaDS = 1;

double my_get_time(void)
{
	struct timeval time;
	if (gettimeofday(&time,NULL))
	{
        	//  Handle error
        	return 0;
    	}
    	return (double)time.tv_sec + (double)time.tv_usec * .000001;
}

void measureKernel(int pos)
{
	assert(pos==1 || pos==2);

	if (pos == 1)
		totalElapsedTime -= my_get_time();
	else if (pos==2)
		totalElapsedTime += my_get_time();
}


void gridDims(int a, int b, int c)
{
	printf("dim3: %d, %d, %d\n",  a, b, c);
	ToTaLTHReaDS *= a*b*c;
}

void gridReset(void)
{
	ToTaLTHReaDS = 1;
}

long gridGet(void)
{
	return (long)( ToTaLTHReaDS * sizeof(CallSite_t) * CALL_PATH_LEN_DEVICE + ToTaLTHReaDS * sizeof(int) );
}

void dataAttribute(void* p)
{
	long ea = (long)p;
	//printf("I am in Data Attribution, this address: %p\t%ld\n",p, ea);
	for (auto seg: heapTable)
	{
		if ( ea >= (long)seg.ea && ea <= (long)(seg.ea)+seg.bytes )
			printf("data attribute:  %d, %d\n", seg.sline, seg.scolm );
	}
}

void recordMEvent(void* p, long bytes, int sline, int scolm)
{
	void** pp = (void**)p;
	printf("I am a cudaMalloc event\n  >>>\n");

	printf("starting piont: %p\n", p);		
	printf("starting point: %p\n", *pp);
	printf("number of bytes: %ld\n", bytes);
	printf("  <<<\n");

	heapTable.push_back( {*pp, bytes, (short)sline, (short)scolm});
}

double get_time()
{
	struct timeval time;
    	if (gettimeofday(&time,NULL)){
        //  Handle error
        	return 0;
    	}
    	return (double)time.tv_sec + (double)time.tv_usec * .000001;
}

void printea(void* p, int tag)
{//
	if (tag==1)
	{	
		printf("h: ea: %p\n",p);
		if (p==NULL)
		{
			printf("h: ERROR: NULL pointer!\n");
			return;
		}
		return;
	} else if (tag==2)
	{
		void** pp = (void**)p;
		if (*pp==NULL)
		{
			printf("h: ERROR: NULL pointer!\n");
			return;
		}
		
                printf("h: rea: %p\n", *pp);
		return;
	}else
	{
	//	printf("h: ea: %p\n",p);
		void** pp = (void**)p;
                printf("h: rea: %p\n", *pp);
		return;
	}
	return;
}


int getFuncID( void* p)
{
	std::string fstr = std::string((char*)p);

	auto search = mfunc.find( fstr );
	if (search == mfunc.end() ) //not found
	{
//		printf("not fouod\n");
		mfunc.insert( {fstr,  mfunc.size() } );
		return mfunc.size()-1;
	}
	else
	{
//		printf("found \n");
		return (int)search->second;
	}
//	mfunc.insert( {fstr, mfunc.size() } );
}


void updateCallStack(int caller, int callee, short sline, short scolm)
{
	int height = callStack.size();
	assert(height!=1);

	if (height==0)
	{
		CallSite_t A, B;
		A.id = caller;
		A.sline = sline;
		A.scolm = scolm;
		B.id = callee;
		B.sline = -1; //-1 to mark this is a callee
		B.scolm = -1;
		callStack.push_back( A );
		callStack.push_back( B );
		return;
	} 
		
	int p_caller = callStack[height-2].id;
	int p_callee = callStack[height-1].id;

	if ( p_caller == caller && p_callee == callee)
	{	//repeated call
		callStack[height-2].sline = sline;
                callStack[height-2].scolm = scolm;
		return;
	}
	else if ( p_caller == caller && p_callee != callee)
	{	//the same parent called a different function, simply update the callee
	//	printf("same caller different callee\n");
		callStack[height-1].id = callee;
		callStack[height-2].sline = sline;
		callStack[height-2].scolm = scolm;
		return;
	}
	else if ( p_callee == caller)
	{	// a typical call path
//		printf("call squence\n");
		callStack[height-1].sline = sline;
		callStack[height-1].scolm = scolm;
		CallSite_t A;
		A.id = callee;
		A.sline = -1;
		A.scolm = -1;
		callStack.push_back(A);
		return;
	}	

	for (int i=height-1; i>=0; i--) 
	{
		if ( callStack[i].id == caller)
		{
			callStack.erase(callStack.begin()+i+1 , callStack.end() );//keeps the caller and removes the following
			CallSite_t A;
			A.id = callee;
			A.sline = -1;
			A.scolm = -1;
			callStack.push_back(A);
			callStack[i].sline = sline;
			callStack[i].scolm = scolm;
			return;
		}
	}

	// the caller exists deeply in the stack	
//	assert( (0==-1) && "!! undefined things happeened here\n");//TODO
	
}	//end of updateCallStack()


void printStack(void)
{
	int height = callStack.size();
	
	if (height<1)
		return;

	for (int i=0; i<height; i++)
		printf(" %d: call site: %d, (%d, %d)\n",i,  callStack[i].id,  callStack[i].sline,  callStack[i].scolm );
}

void printErrStack(void)
{
        int height = callStack.size();

        if (height<1)
                return;

        for (int i=0; i<height; i++)
                fprintf(stderr," %d: call site: %d, (%d, %d)\n",i,  callStack[i].id,  callStack[i].sline,  callStack[i].scolm );
}

void callFunc(void* er, void* ee, int sline, int scolm)
{
        std::string caller = std::string((char*)er);
        std::string callee = std::string((char*)ee);

	//std::cout<< " ID \t" <<  caller <<  " : " << getFuncID(er) << std::endl;
	if ( caller.find("main") != std::string::npos )
		ValidStack = true;

	if ( ! ValidStack )
		return;
	
	int caller_id = getFuncID(er);
	int callee_id = getFuncID(ee);

	if (false)
	{
	std::cerr << " \n <function> " << caller_id << " :" << caller << "   "<< sline << " " << scolm <<  std::endl;
	std::cerr << " calls " << std::endl;
	std::cerr << " <function> " << callee_id << " :" << callee << std::endl;
	}

	updateCallStack(caller_id, callee_id, (short) sline, (short) scolm);


	//printErrStack();
	//printStack();

//        printf("h: call Function: caller name: %s\n", str.str() );
}

void takeString(void* p, int action)
{
	return;//TODO
	if (action==1)
		printf("h: caller: %s\n",(char*)p);
	else if (action==2)
		printf("h: callee: %s\n",(char*)p);
	else if (action==3)
		printf("h: return: %s\n",(char*)p);
	else
		printf("h: undefined: %s\n",(char*)p);
}


void** PTR = NULL;
int lines = 0;
int Counter4Main = 0; 
int CNTappend = 0;
int traceOffset =  1; // the first ONE ENTRY is reserved for the total length
int* trace_On_HoST;
int* buffer_On_HoST;


void mymalloc(int bytes)
{
	trace_On_HoST = (int*) malloc((long)TRACESIZE);
	buffer_On_HoST = (int*) malloc((long)BUFFERSIZE);
}

void* getHandle(int option)
{
	if (buffer_On_HoST == NULL ||  trace_On_HoST == NULL)
		mymalloc(1);

	assert( option == 1 || option == 2);
	assert( buffer_On_HoST != NULL &&  trace_On_HoST != NULL);

//	printf("getHandle: pointers: %p\t %p\n", buffer_On_HoST, trace_On_HoST);
	if (option==1)
	{
		printf("getHandle: pointers: %p\n", buffer_On_HoST);
		fflush(stdout);
		return (void*)buffer_On_HoST;
	}
	else if(option ==2)
	{
		printf("getHandle: pointers: %p\n", trace_On_HoST);
		fflush(stdout);
		return (void*)trace_On_HoST;
	}
	return NULL;	
}

void storeLines(void* p)
{
	PTR[lines] = p;
	lines++;
}

void dumpLines(void)
{
	int ii;
	for(ii=0; ii< lines; ii++)
		printf("h: PTR[%d] = %p\t", ii,  PTR[ii] );
	printf("\n" );
/*	const char* ss = "this is the end";
	void *ps = ss;
	takeString(ps);
*/
}

void dumpTrace(void* itrace)
{
	int i;

	printf(" Tool: about to dump this trace\n   ");
	printf(" hhh: final dump: first few elements:   ");
//	for (i = 0; i<10 ; i++)
//		printf("%d\t", trace[i]);	
//	printf("\n");	
	
	Entry_t* tp = (Entry_t*) itrace;
	
	printf("%d\t", tp[0].bidx);
	printf("%d\t", tp[0].tidx);
	printf("%d\t", tp[0].bidy);
	printf("%d\t", tp[0].tidy);
	printf("%ld\t", (long)tp[0].ea);
	printf("%d\t", tp[0].bytes);
	printf("%d\t", tp[0].sline);
	printf("%d\t", tp[0].scolm);
	printf("%d\t", tp[0].op);
	printf("\n");

        long length = (long) tp[0].ea; // number of entries 
        short blockdimx = tp[0].bidx; // number of threads along block x-axis 
        short blockdimy = tp[0].bidy; // number of threads along block y-axis
        short griddimx = tp[0].tidx; // number of blocks along grid x-axis
        short griddimy = tp[0].tidy; // number of blocks along grid y-axis
	printf("blockDim.x: %d\n", blockdimx);
	printf("blockDim.y: %d\n", blockdimy);		
	printf("gridDim.x: %d\n", griddimx);		
	printf("gridDim.y: %d\n", griddimy);		
	printf("trace length: %ld\n", length);		
	
	int maxwarpid = 2000000;//TODO adaptive allocation
	Trace_t* agg = (Trace_t*) calloc(maxwarpid, sizeof(Trace_t) );

	t1 = get_time();

	for (i=1; i<length; i++)
	{
		int tid = tp[i].tidy*blockdimx + tp[i].tidx;
        	int bid = tp[i].bidy*griddimx + tp[i].bidx;
		int warpsPerBlock = ceil( (double)(blockdimx*blockdimy)/32.0 ); 
        	int warpid = bid* warpsPerBlock +  (blockdimx*tp[i].tidy + tp[i].tidx)/32;
	
		if (CTATAG)
			warpid = bid; //regroup traces for each CTA, instead of warp
	//	printf(" bid %d=(%d,%d) \ttid %d=(%d,%d) \t%p\t%d,%d\t%d\n",bid, tp[i].bidx, tp[i].bidy, tid, tp[i].tidx, tp[i].tidy, tp[i].ea, tp[i].sline, tp[i].scolm, tp[i].op);
		//dataAttribute(tp[i].ea);//DEBUG

		if (warpid>maxwarpid)
			printf(" bid %d=(%d,%d) \ttid %d=(%d,%d)\t%d \t-> %d \n",bid, tp[i].bidx, tp[i].bidy, tid, tp[i].tidx, tp[i].tidy,  warpsPerBlock, warpid );

//		if (warpid%599==0)
//	         	printf("%d: \t%d = (%d, %d)\t@ %p, %d bytes\n", tp[i].op,warpid,  tp[i].bidx, tp[i].tidx, tp[i].ea, tp[i].bytes);
/*		if (false)
		{
			printf("I am in re alloc: %d, %d\n", warpid, maxwarpid );
			Trace_t* newagg =  (Trace_t*) calloc(warpid, sizeof(Trace_t) );
			memcpy( newagg, agg,  sizeof(Trace_t) * maxwarpid );
			maxwarpid = warpid;
			agg = newagg;
			printf("I am out of re alloc: %d, %d\n", warpid, maxwarpid );
		}
*/
		if (warpid > maxwarpid)
                {
                        printf("I am in re alloc: %d, %d\n", warpid, maxwarpid );
                        agg = (Trace_t*) realloc(agg, warpid* sizeof(Trace_t) );
			if (agg==NULL)
				printf("realloc() returns null...\n");
			int j;
			for (j=maxwarpid; j<warpid; j++)
				agg[j].length=0;
			maxwarpid = warpid;
                        printf("I am out of re alloc: %d, %d\n", warpid, maxwarpid );
                }

		long cnt = agg[warpid].length;

//		if ( cnt >1) //MERGE the consecutive accesses to the same location
//			if (  agg[warpid].handle[cnt-1].ea ==  tp[i].ea && agg[warpid].handle[cnt-1].op == 1 && tp[i].op == 1   )
//			continue;

		if (cnt==0)
		{
			agg[warpid].capacity = 1024*400; // initial capacity //4K entries // 96K Bytes
			agg[warpid].handle = (Entry_t*) malloc(sizeof(Entry_t) * agg[warpid].capacity );
			cnt++;	//first entry is reserved for metadata
			agg[warpid].length++; //first entry is reserved for metadata
			agg[warpid].handle[0].bidx = warpid; //first entry is reserved for metadata
			agg[warpid].handle[0].tidx = blockdimx;
		}	
	
		agg[warpid].handle[cnt] = tp[i];
		agg[warpid].length++;
		agg[warpid].handle[0].ea = (void*)agg[warpid].length;

		if ( agg[warpid].length == agg[warpid].capacity-2)
		{	
			agg[warpid].capacity = 2*agg[warpid].capacity;
			agg[warpid].handle = (Entry_t*)realloc( agg[warpid].handle, agg[warpid].capacity* sizeof(Entry_t) ); //built-in memcpy
			if (agg[warpid].handle == NULL)
				printf("!!! error: null handle \n");
		}
	}

	t2 = get_time();
/*	long ii;
	int aa=1, bb=2, cc=3, dd=4;
	Entry_t* tr = (Entry_t*) calloc( sizeof(Entry_t) , 20 );
	tr[0].op = 19;
	for (ii=1; ii<20; ii++)
	{
		tr[ii].op = 1;
		if (ii<=10 || ii>=4)
			tr[ii].ea = &aa;
	}

		tr[2].ea = &bb;
		tr[3].ea = &cc;
		tr[11].ea = &bb;
		tr[12].ea = &dd;
		tr[13].ea = &cc;
		tr[14].ea = &aa;
		tr[15].ea = &aa;
		tr[16].ea = &bb;
		tr[17].ea = &cc;
		tr[18].ea = &bb;
		tr[14].op = 2;
		tr[17].op = 2;
*/

	t3 = get_time();
	if (RDTAG)
	{
		//std::ofstream fout;
		//fout.open("RD.output.txt");
		FILE * fout; 	fout = fopen("output.RD.txt", "w");
		std::vector<double> avg4kernel;
		std::vector<double> avgX;
		for (i=0; i<maxwarpid; i++)
		{
			if ( agg[i].length==0)
				continue;
			printf(" \n%s id: %d\n",CTATAG? "CTA":"warp", i);
			fprintf(fout, " \n%s id: %d\n",CTATAG? "CTA":"warp", i);
			
			double avgrd;	
			double a = calcRD( (void*)agg[i].handle, avgrd, fout);
			if( !isnan(a) )
				avg4kernel.push_back(a);

			printf("return value :%f\n", avgrd);
			fprintf(fout,"return value :%f\n", avgrd);
			if( !isnan(avgrd) )
                                avgX.push_back(avgrd);
		}

		printf("average RD of each %s in kernel\n", CTATAG ? "CTA":"warp");
		fprintf(fout, "average RD of each %s in kernel\n", CTATAG ? "CTA":"warp");
		for(double a : avg4kernel)
		{
			printf("%f\t", a);
			fprintf(fout, "%f\t", a);

		}
		
		printf("\n");
		printf("average RD of each %s in kernel %f\n", CTATAG ? "CTA":"warp", std::accumulate(avg4kernel.begin(), avg4kernel.end(), 0.0)/avg4kernel.size() );
		printf("average RD of across whole execution %f\n", std::accumulate(avgX.begin(), avgX.end(), 0.0)/avgX.size() );
		printf("\n");
		fprintf(fout, "\naverage RD of each %s in kernel %f\n", CTATAG ? "CTA":"warp", std::accumulate(avg4kernel.begin(), avg4kernel.end(), 0.0)/avg4kernel.size() );
		fprintf(fout, "average RD of across whole execution %f\n\n", std::accumulate(avgX.begin(), avgX.end(), 0.0)/avgX.size() );
		//fout.close();
		fclose(fout);
	}
	t4 = get_time();	

////
//// Mem Divergence for each trace
	if (MDTAG)
	{
		FILE * outfile;	outfile = fopen("output.MD.txt", "w");
		long md_dist_length = 32;
		long *MD_dist = (long*) calloc( sizeof(long) ,  md_dist_length+1);//aggregated distribution for all warps/CTAs //first elemient is left blank
		printf("Mem Divergence in this kernel\n");
		fprintf(outfile, "Mem Divergence in this kernel\n");
		for (i=0; i<maxwarpid; i++)
		{
			if ( agg[i].length==0)
				continue;

			printf(" \n%s id: %d\n",CTATAG? "CTA":"warp", i);
			fprintf(outfile, " \n%s id: %d\n",CTATAG? "CTA":"warp", i);

			long* memBins;
			long maxcl = calcMD( (void*)agg[i].handle, memBins, outfile);

			if (maxcl >  md_dist_length)
			{
				MD_dist = (long*) realloc( MD_dist,  (maxcl+1)*sizeof(long) );
				int j;
				for (j=md_dist_length+1; j<=maxcl; j++)
					MD_dist[j]=0;

				md_dist_length = maxcl;
			}

			int j;
			for (j=1; j <= maxcl ; j++)
				MD_dist[j] += memBins[j];

		}
		fclose(outfile);

//		printf(" Tool: mem bins over all warps/CTAs.\n");
//		for (i=1; i<= md_dist_length; i++)
//			printf(" %ld\n",  MD_dist[i] );

		if (MEMDIV==NULL)
		{
			MEMDIV_len =  md_dist_length;
			MEMDIV = (long*) calloc( md_dist_length+1, sizeof(long) );
		} else if ( MEMDIV_len < md_dist_length)
		{
			MEMDIV = (long*) realloc(MEMDIV, (md_dist_length+1)*sizeof(long) );
			for(i=MEMDIV_len+1; i<=md_dist_length; i++)
				MEMDIV[i] = 0;
			MEMDIV_len = md_dist_length;
		}

		for(i=1; i<=md_dist_length; i++)
			MEMDIV[i] += MD_dist[i];
		
	}
/*
	printf(" Tool: I am satisfied with one kernel return.\n");
	printf(" Tool stats:\n");
	printf(" regrouping for-loop: \t%f s\n", t2-t1);
	printf(" calc MD: \t%f s\n", t4-t3);
	printf(" calculating for-loop: \t%f s\n", t6-t5);
	printf(" all other in calc RD: \t%f s\n", t7-t6);
*/
//	exit(0);
}

void dumpStack(void* stack, long* rd, long* tag, int height)
{
	int i;
        Entry_t* tp = (Entry_t*) stack;

	printf(" >>\n");
	for (i=1; i<=height; i++)
	{
		if ( tag[i] == 0)
			continue;
	      	printf("i=%d: %d: \t(%d, %d)\t@ %p, %d bytes, tag: %ld\t\t%ld\n", i, tp[i].op,  tp[i].bidx, tp[i].tidx, tp[i].ea, tp[i].bytes, tag[i], rd[i]);
	}
	printf(" <<\n");
}


char* getFuncChars(int id)
{
	return funcDic[id];
}


void printContext(int id)
{
	printf("I am a context with id=%d\n", id);

	for (int i=0; contextDic[id][i].id != -1 && i < CALL_PATH_LEN_DEVICE; i++)
		printf(" %d:: id %d->%s :%d,%d \n", i, contextDic[id][i].id, getFuncChars(contextDic[id][i].id), contextDic[id][i].sline, contextDic[id][i].scolm );
}


void dumpBBlog(void* trace)
{
	BBlog_t* tp = (BBlog_t*) trace;
        printf("h : I am in dumpBBlog()\n");
        long length = tp[0].key; // number of entries
        short blockdimx = tp[0].bidx; // number of threads along block x-axis
        short blockdimy = tp[0].bidy; // number of threads along block y-axis
        short griddimx = tp[0].tidx; // number of blocks along grid x-axis
        short griddimy = tp[0].tidy; // number of blocks along grid y-axis
        printf("blockDim.x: %d\n", blockdimx);
        printf("blockDim.y: %d\n", blockdimy);
        printf("gridDim.x: %d\n", griddimx);
        printf("gridDim.y: %d\n", griddimy);
        printf("trace length: %ld\n", length);

	int maxwarpid = 2000000;//TODO adaptive allocation
	BBTrace_t* agg = (BBTrace_t*) calloc(maxwarpid, sizeof(Trace_t) );

	for (int i=1; i<length; i++)
	{
		int tid = tp[i].tidy*blockdimx + tp[i].tidx;
        	int bid = tp[i].bidy*griddimx + tp[i].bidx;
		int warpsPerBlock = ceil( (double)(blockdimx*blockdimy)/32.0 ); 
        	int warpid = bid* warpsPerBlock +  (blockdimx*tp[i].tidy + tp[i].tidx)/32;
	
		//printf(" bid %d=(%d,%d) \ttid %d=(%d,%d) %d,%d, context id=%d\n",bid, tp[i].bidx, tp[i].bidy, tid, tp[i].tidx, tp[i].tidy, tp[i].sline, tp[i].scolm, tp[i].cid);
                if ( tp[i].cid > -1)
		{
		//	printf(" \nbid %d=(%d,%d) \ttid %d=(%d,%d) %d,%d, source loc= %d, %d, BB: ",bid, tp[i].bidx, tp[i].bidy, tid, tp[i].tidx, tp[i].tidy, tp[i].sline, tp[i].scolm, tp[i].sline, tp[i].scolm );
			printBBname( tp[i].key);
			printf("\n");
                        printContext(tp[i].cid);//TODO//DEBUG
		}

		if (warpid>maxwarpid)
			printf(" bid %d=(%d,%d) \ttid %d=(%d,%d)\t%d \t-> %d \n",bid, tp[i].bidx, tp[i].bidy, tid, tp[i].tidx, tp[i].tidy,  warpsPerBlock, warpid );

//		if (warpid%599==0)
//	         	printf("%d: \t%d = (%d, %d)\t@ %p, %d bytes\n", tp[i].op,warpid,  tp[i].bidx, tp[i].tidx, tp[i].ea, tp[i].bytes);
	
		if (warpid > maxwarpid)
                {
                        printf("I am in re alloc: %d, %d\n", warpid, maxwarpid );
                        agg = (BBTrace_t*) realloc(agg, warpid* sizeof(BBTrace_t) );
			if (agg==NULL)
				printf("realloc() returns null...\n");
			int j;
			for (j=maxwarpid; j<warpid; j++)
				agg[j].length=0;
			maxwarpid = warpid;
                        printf("I am out of re alloc: %d, %d\n", warpid, maxwarpid );
                }

		long cnt = agg[warpid].length;

//		if ( cnt >1) //MERGE the consecutive accesses to the same location
//			if (  agg[warpid].handle[cnt-1].ea ==  tp[i].ea && agg[warpid].handle[cnt-1].op == 1 && tp[i].op == 1   )
//			continue;

		if (cnt==0)
		{
			agg[warpid].capacity = 1024*400; // initial capacity //4K entries // 96K Bytes
			agg[warpid].handle = (BBlog_t*) malloc(sizeof(BBlog_t) * agg[warpid].capacity );
			cnt++;	//first entry is reserved for metadata
			agg[warpid].length++; //first entry is reserved for metadata
			agg[warpid].handle[0].bidx = warpid; //first entry is reserved for metadata
			agg[warpid].handle[0].tidx = blockdimx;
		}	
	
		agg[warpid].handle[cnt] = tp[i];
		agg[warpid].length++;
		agg[warpid].handle[0].key = agg[warpid].length;

		if ( agg[warpid].length == agg[warpid].capacity-2)
		{	
			agg[warpid].capacity = 2*agg[warpid].capacity;
			agg[warpid].handle = (BBlog_t*)realloc( agg[warpid].handle, agg[warpid].capacity* sizeof(BBlog_t) ); //built-in memcpy
			if (agg[warpid].handle == NULL)
				printf("!!! error: null handle \n");
		}
	}


        if (BDTAG)
        {
                std::vector<int> con_bb;
                std::vector<int> div_bb;
                for (int i=0; i<maxwarpid; i++)
                {
                        if ( agg[i].length==0)
                                continue;
                        printf(" \nwarp id: %d\n", i);

			int numBB_con = 0;
			int numBB_div = 0;
                        calcBD( (void*)agg[i].handle, numBB_con, numBB_div);

                        if( !isnan(numBB_con) )
                                con_bb.push_back(numBB_con);

			if( !isnan(numBB_div) )
                        	div_bb.push_back(numBB_div);

                }

		printf("\nTotal convergent BB: \t%d\n", std::accumulate( con_bb.begin(), con_bb.end(), 0) );
		printf("Total divergent BB: \t%d\n", std::accumulate( div_bb.begin(), div_bb.end(), 0) );
		printf("Total number of BB: \t%d\n", std::accumulate( div_bb.begin(), div_bb.end(), 0) +  std::accumulate( con_bb.begin(), con_bb.end(), 0) );

                printf("\n");
        }
}



void peelDics(void* trace)
{
	unsigned long offset1 = ((UNIQUE_FUNC_DEVICE*FUNC_NAME_LEN*sizeof(char))/1024+1)*1024;
	char* funcDicSeg = (char*)trace + BUFFERSIZE  - offset1;

//	printf("peeling\n");

	memcpy( funcDic, funcDicSeg, UNIQUE_FUNC_DEVICE*FUNC_NAME_LEN*sizeof(char) );

	if (false)
	for (int i=0; i<UNIQUE_FUNC_DEVICE; i++)
	{
		printf("%s\n", funcDic[i]);
	}

	
	unsigned long offset2 = ((UNIQUE_FUNC_DEVICE* CALL_PATH_LEN_DEVICE* sizeof(CallSite_t))/1024+1)*1024 + offset1;
	CallSite_t* contextDicSeg = (CallSite_t*) ((char*)trace + BUFFERSIZE  - offset2);
	memcpy( contextDic, contextDicSeg, UNIQUE_FUNC_DEVICE* CALL_PATH_LEN_DEVICE*sizeof(CallSite_t) );

	if (false)
	for (int i=0; i< UNIQUE_FUNC_DEVICE; i++)
	{
		printf("next context i=%d\n",i);
		for (int j=0; j< CALL_PATH_LEN_DEVICE ; j++)
        	{
			if (contextDic[i][j].id == -1)
				break;
                	printf("%d, %d, %d\n", contextDic[i][j].id, contextDic[i][j].sline, contextDic[i][j].scolm );
        	}
	
	}
//	printf("out of peel\n");
}



void appendBBlog(void* trace, void* buffer)
{
	BB_append_cnt++;
	printf("\n\nI am %d append BB log.\n", BB_append_cnt);

	peelDics(buffer);

	BBlog_t* tmpbb = (BBlog_t*) buffer;
	unsigned long long length = tmpbb[0].key;
	memcpy(trace , buffer, length*sizeof(BBlog_t) );

/*	for (int i = 0; i<10 ; i++)
	{
		printf(" %d\t", tmpbb[i].bidx);
		printf(" %d\t", tmpbb[i].bidy);
		printf(" %d\t", tmpbb[i].tidx);
		printf(" %d\t", tmpbb[i].tidy);
		printf(" %llu\t", tmpbb[i].key);
		printf(" %d\t", tmpbb[i].sline);
		printf(" %d\t", tmpbb[i].scolm);
		printf("\n");
	}
*/		
		
	dumpBBlog(trace);

	//tpdst[0].tag  = traceOffset; //overwrite total length

/*	int* ttmp = (int*)trace;
	printf(" h: dst: appdend() first few elements:  \n");
        for (i = 0; i<10 ; i++)
                printf("%d\t", ttmp[i]);
        printf("\n");
*/
//	if (kernelCnt == 4)

}

void appendTrace(void* trace, void* buffer)
{
	if(BDTAG)
	{
		appendBBlog(trace, buffer);
		return;
	}

	CNTappend++;
	printf("I am %d append action.\n", CNTappend);

	peelDics(buffer);
	printf(" h: src: appdend() first few elements, fresh off the GPU:  \n");
	int* tmp = (int*) buffer;
	for (int i = 0; i<10 ; i++)
		printf("%d\t", tmp[i]);	
	printf("\n");	

	Entry_t* tpsrc = (Entry_t*) buffer;
	long length = (long)tpsrc[0].ea ; // number of entries 

	//memcpy(trace /* + traceOffset*sizeof(Entry_t)*/, buffer+sizeof(Entry_t), (length-1)*sizeof(Entry_t) );	
	memcpy(trace , buffer, length*sizeof(Entry_t) );
	traceOffset = length -1 ;

	Entry_t* tpdst = (Entry_t*) trace;
	tpdst[0]  = tpsrc[0]; //copy in metadata
	//tpdst[0].tag  = traceOffset; //overwrite total length

/*	int* ttmp = (int*)trace;
	printf(" h: dst: appdend() first few elements:  \n");
        for (i = 0; i<10 ; i++)
                printf("%d\t", ttmp[i]);
        printf("\n");
*/
	dumpTrace(trace);
//	if (kernelCnt == 4)
//		exit(0);
}

void print1()
{
	printf("h: load\n");
}

void print2()
{
        printf("h: store\n");
}

void print3(int a)
{
        printf("h: print3: %d\n",a);
}

void print4(long a)
{
//        void* p = (void*) a;
	printf("h: long: %ld\n",a);
//	printf("so: ea: %p\n",p);
}

void RetMain(void)
{
	Counter4Main ++;

	if(MDTAG)
	{
		FILE * outfile;
		outfile = fopen("output.MD.txt","a");
		fprintf(outfile, " Memory Divergence for whole execution\n" );
		
		for(int i=1; i<=MEMDIV_len; i++)
		{
			fprintf(outfile, " \t%d: \t%ld\n", i, MEMDIV[i]);
			//printf(" %ld\n", MEMDIV[i]);
		}

		fclose(outfile);
	}
	printf("h: End of main() = %d\n", Counter4Main);
	printf("h: # of convergent bb = %ld\n", con_whole);
	printf("h: # of divergent bb = %ld\n", div_whole);
	fprintf(stderr, "%f\n", totalElapsedTime);
	printf("%f\n", totalElapsedTime);

//	printf("End of main() = %d, BTW \n%p\n%p\n", Counter4Main, getHandle(1), getHandle(2));
//	dumpLines();
}



/// /// 
/// ///
//EOF
