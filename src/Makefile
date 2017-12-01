all: sbsi

DEBUG = -g 
OPTAPP = -O0
OPT = -O2 -std=c++11
GC = g++ -std=c++11 #for unordered_map
include ../env.mk
include testtask.mk

SRC = axpy.cu
EXE =axpy
CFLAGS = # -I/usr/lib/gcc/x86_64-linux-gnu/4.8/include/ -std=c++11
ANSF =$(UPATH)/ansf.cu
HOST_SO =libprint.so

#INSTRU = -instru-kernel-basic  -instru-kernel-memory
#INSTRU = -instru-kernel-sig  -instru-kernel-basic -instru-kernel-call-path  -constmerge  
#INSTRU = -instru-kernel-sig -instru-kernel-basic -instru-kernel-call-path -instru-kernel-memory -constmerge
INSTRU = -instru-kernel-sig -instru-kernel-basic -instru-kernel-call-path $(INSTRU_TASK) -constmerge
#INSTRU = -instru-kernel-sig -instru-kernel-basic -instru-kernel-call-path -instru-kernel-branch -constmerge

AUXSRC = 
AUXOBJ =

$(PASS) : $(UPATH)/../LLVM_advisor.cpp $(UPATH)/../common.h
	#cd  $(UPATH)/..; sh auto.sh;

ll : device.clean.ll ansf.ll device.link.ll device.ll device.ll device.ll host.ll hosttmp.ll hosti.ll

rsm: hosti.bc
	llvm-as < hosti.ll > hosti.bc 
	clang++ hosti.bc -c
	clang++ hosti.o -o axpy -L/usr/local/cuda/lib64 -lcudart -ldl -lrt -pthread -L. -lprint

AUXOBJ: $(AUXSRC)
	gcc -c < $< 

%.ll:  %.bc
	llvm-dis < $< > $@ 

native:	$(SRC)
	nvcc $(DEBUG) $(OPTAPP) $(SRC) -o native -L. -lprint --gpu-architecture=$(SM)

clang: $(SRC)
	clang++ $(DEBUG) -G $(OPTAPP) $(SRC) -o clang --cuda-gpu-arch=$(SM) -L/usr/local/cuda/lib64 -lcudart -ldl -lrt -pthread #-save-temps

bc:
	clang++ $(DEBUG) $(OPT) $(SRC) -emit-llvm -c -save-temps

device.bc instru: device.link.bc $(PASS) 
	opt -load $(PASS) $(INSTRU) < device.link.bc > device.bc

clean: 
	rm -f *.o *.bc *.ll *.s  native_ax* *.cubin *.ptx *.fatbin a.out *.cui *cudafe* *cpp*.i* *fatbin.c *module_id *.reg.c $(EXE) native clang

$(HOST_SO) : $(UPATH)/print.cpp  $(UPATH)/../common.h $(UPATH)/types.h $(UPATH)/calc.cpp
	$(GC) -c $(DEBUG) $(OPT) -Wall -D $(ANA_TASK) -fPIC -lm -fopenmp $(UPATH)/print.cpp -o $(UPATH)/print.o
	$(GC) $(UPATH)/print.o -shared -o $(HOST_SO)

wayin:
	cp device.clean.bc device.bc

sbs: wayin device.fatbin host.bc
	clang++ host.bc -c
	clang++ host.o -o $(EXE) -L/usr/local/cuda/lib64 -lcudart -ldl -lrt -pthread 

aux:

sbsi: hosti.o $(HOST_SO) 
	clang++ $(DEBUG) $(AUXOBJ) hosti.o -o $(EXE) -L/usr/local/cuda/lib64 -lcudart -ldl -lrt -lm -pthread -L$(UPATH) -lprint
	
hosti.o: hosti.bc
	clang++ hosti.bc -c

hosttmp.bc: host.bc  $(PASS)  
	opt -load $(PASS) -instru-host-sig < host.bc > hosttmp.bc	

hosti.bc: hosttmp.bc  $(PASS)
	opt -load $(PASS) -instru-host -instru-host-measure -constmerge < hosttmp.bc > hosti.bc

#	opt -load $(PASS) -instru-global-var < hosttmp.bc > hosttmp2.bc	
#	opt -load $(PASS) -instru-host < hosttmp2.bc > hosti.bc	

host.o : host.bc
	clang++ host.bc -c

host.bc: device.fatbin host.cui
	clang -cc1 -triple x86_64-unknown-linux-gnu -aux-triple nvptx64-nvidia-cuda -emit-llvm-bc -emit-llvm-uselists -disable-free -main-file-name axpy.cu -mrelocation-model static -mthread-model posix -mdisable-fp-elim -fmath-errno -masm-verbose -mconstructor-aliases -munwind-tables -fuse-init-array -target-cpu x86-64 -v -dwarf-column-info -debug-info-kind=limited -dwarf-version=4 -debugger-tuning=gdb -resource-dir $(LLVM)/../lib/clang/4.0.0 $(OPT) -fdeprecated-macro -ferror-limit 19 -fmessage-length 0 -pthread -fobjc-runtime=gcc -fcxx-exceptions -fexceptions -fdiagnostics-show-option -disable-llvm-passes -o host.bc -x cuda-cpp-output host.cui -fcuda-include-gpubinary device.fatbin
#	clang++ -cc1 $(OPT) -triple x86_64-unknown-linux-gnu -aux-triple nvptx64-nvidia-cuda -emit-llvm-bc -emit-llvm-uselists -disable-free -main-file-name $(SRC) -o host.bc -x cuda-cpp-output host.cui -fcuda-include-gpubinary device.fatbin	

device.ptx: device.bc
	llc device.bc -filetype=asm -o device.ptx

device.o :  device.ptx
	ptxas --gpu-name $(SM) device.ptx -o device.o -v -maxrregcount=31 #for verbose, resources check

device.fatbin: device.o host.cui 
	fatbinary --cuda -64 --create device.fatbin --image=profile=$(SM),file=device.o --image=profile=$(CP),file=device.ptx  

host.cui: $(SRC)
	clang++ $(DEBUG) $(OPTAPP) $(CFLAGS) -E --cuda-host-only $(SRC) -o host.cui
	clang++ $(DEBUG) $(OPTAPP) $(CFLAGS) -c --cuda-host-only -emit-llvm $(SRC) -o host.clean.bc
	clang++ $(DEBUG) $(OPTAPP) $(CFLAGS) -c -S --cuda-host-only -emit-llvm $(SRC) -o host.clean.ll

device.clean.bc:  $(SRC)
	clang++ $(DEBUG) $(OPTAPP) $(CFLAGS) -c --cuda-device-only -emit-llvm $(SRC) -o device.clean.bc

ansf.bc :  $(ANSF) $(UPATH)/../common.h  $(UPATH)/types.h
	clang++ $(DEBUG) $(OPT) -c --cuda-device-only -emit-llvm $(ANSF) -o ansf.bc

device.link.bc: device.clean.bc ansf.bc 
	llvm-link device.clean.bc ansf.bc -o=device.link.bc



