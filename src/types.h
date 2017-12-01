#ifndef ONLYONCE 
#define ONLYONCE

#define UNIQUE_FUNC_DEVICE 15
#define FUNC_NAME_LEN 31
#define CALL_PATH_LEN_DEVICE 15 
#define TOTAL_NUMBER_CONTEXT 20 


#include "../common.h"

typedef struct MallocEvent_t{
	void* ea;
	long bytes;        
        short sline;
        short scolm;
} MallocEvent_t;


typedef struct CallSite_t{
	int id; //function id
	short sline;
	short scolm;
} CallSite_t;


typedef struct Entry_t{
        short bidx;
	short bidy;
        short tidx;
        short tidy;
        void* ea;
        short bytes;
	short sline; //source line
	short scolm; //source coln
	short op;  //1 for load, 2 for store
}  Entry_t;

typedef struct BBlog_t{
        short bidx;
        short bidy;
        short tidx;
        short tidy;
        unsigned long long key; //I just cant understand
	int sline; //source line
        int scolm; //source coln
        int cid; 	//context id
//DO NOT change the order of fields 
}  BBlog_t;


typedef struct Trace_t{
	long length;
	int capacity; //for dynamically adjusting length
	Entry_t* handle;
} Trace_t;


typedef struct BBTrace_t{
        long length;
        int capacity; //for dynamically adjusting length
        BBlog_t* handle;
} BBTrace_t;


#endif

/// /// 
/// ///
//EOF
