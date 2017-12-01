; ModuleID = 'srad.cu'
source_filename = "srad.cu"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }
%struct.dim3 = type { i32, i32, i32 }
%struct.CUstream_st = type opaque

@duration = local_unnamed_addr global double 0.000000e+00, align 8, !dbg !0
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [67 x i8] c"Usage: %s <rows> <cols> <y1> <y2> <x1> <x2> <lamda> <no. of iter>\0A\00", align 1
@.str.1 = private unnamed_addr constant [28 x i8] c"\09<rows>   - number of rows\0A\00", align 1
@.str.2 = private unnamed_addr constant [29 x i8] c"\09<cols>    - number of cols\0A\00", align 1
@.str.3 = private unnamed_addr constant [35 x i8] c"\09<y1> \09 - y1 value of the speckle\0A\00", align 1
@.str.4 = private unnamed_addr constant [38 x i8] c"\09<y2>      - y2 value of the speckle\0A\00", align 1
@.str.5 = private unnamed_addr constant [39 x i8] c"\09<x1>       - x1 value of the speckle\0A\00", align 1
@.str.6 = private unnamed_addr constant [39 x i8] c"\09<x2>       - x2 value of the speckle\0A\00", align 1
@.str.7 = private unnamed_addr constant [27 x i8] c"\09<lamda>   - lambda (0,1)\0A\00", align 1
@.str.8 = private unnamed_addr constant [41 x i8] c"\09<no. of iter>   - number of iterations\0A\00", align 1
@.str.9 = private unnamed_addr constant [29 x i8] c"WG size of kernel = %d X %d\0A\00", align 1
@.str.10 = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1
@.str.11 = private unnamed_addr constant [39 x i8] c"rows and cols must be multiples of 16\0A\00", align 1
@.str.15 = private unnamed_addr constant [6 x i8] c"%.5f \00", align 1
@str = private unnamed_addr constant [29 x i8] c"Randomizing the input matrix\00"
@str.18 = private unnamed_addr constant [25 x i8] c"Start the SRAD main loop\00"
@str.19 = private unnamed_addr constant [17 x i8] c"Printing Output:\00"
@str.20 = private unnamed_addr constant [17 x i8] c"Computation Done\00"

; Function Attrs: uwtable
define void @_Z11srad_cuda_1PfS_S_S_S_S_iif(float* %E_C, float* %W_C, float* %N_C, float* %S_C, float* %J_cuda, float* %C_cuda, i32 %cols, i32 %rows, float %q0sqr) #0 !dbg !590 {
entry:
  %E_C.addr = alloca float*, align 8
  %W_C.addr = alloca float*, align 8
  %N_C.addr = alloca float*, align 8
  %S_C.addr = alloca float*, align 8
  %J_cuda.addr = alloca float*, align 8
  %C_cuda.addr = alloca float*, align 8
  %cols.addr = alloca i32, align 4
  %rows.addr = alloca i32, align 4
  %q0sqr.addr = alloca float, align 4
  tail call void @llvm.dbg.value(metadata float* %E_C, i64 0, metadata !595, metadata !604), !dbg !605
  store float* %E_C, float** %E_C.addr, align 8, !tbaa !606
  tail call void @llvm.dbg.value(metadata float* %W_C, i64 0, metadata !596, metadata !604), !dbg !610
  store float* %W_C, float** %W_C.addr, align 8, !tbaa !606
  tail call void @llvm.dbg.value(metadata float* %N_C, i64 0, metadata !597, metadata !604), !dbg !611
  store float* %N_C, float** %N_C.addr, align 8, !tbaa !606
  tail call void @llvm.dbg.value(metadata float* %S_C, i64 0, metadata !598, metadata !604), !dbg !612
  store float* %S_C, float** %S_C.addr, align 8, !tbaa !606
  tail call void @llvm.dbg.value(metadata float* %J_cuda, i64 0, metadata !599, metadata !604), !dbg !613
  store float* %J_cuda, float** %J_cuda.addr, align 8, !tbaa !606
  tail call void @llvm.dbg.value(metadata float* %C_cuda, i64 0, metadata !600, metadata !604), !dbg !614
  store float* %C_cuda, float** %C_cuda.addr, align 8, !tbaa !606
  tail call void @llvm.dbg.value(metadata i32 %cols, i64 0, metadata !601, metadata !604), !dbg !615
  store i32 %cols, i32* %cols.addr, align 4, !tbaa !616
  tail call void @llvm.dbg.value(metadata i32 %rows, i64 0, metadata !602, metadata !604), !dbg !618
  store i32 %rows, i32* %rows.addr, align 4, !tbaa !616
  tail call void @llvm.dbg.value(metadata float %q0sqr, i64 0, metadata !603, metadata !604), !dbg !619
  store float %q0sqr, float* %q0sqr.addr, align 4, !tbaa !620
  %0 = bitcast float** %E_C.addr to i8*, !dbg !622
  %1 = call i32 @cudaSetupArgument(i8* nonnull %0, i64 8, i64 0), !dbg !622
  %2 = icmp eq i32 %1, 0, !dbg !622
  br i1 %2, label %setup.next, label %setup.end, !dbg !622

setup.next:                                       ; preds = %entry
  %3 = bitcast float** %W_C.addr to i8*, !dbg !623
  %4 = call i32 @cudaSetupArgument(i8* nonnull %3, i64 8, i64 8), !dbg !623
  %5 = icmp eq i32 %4, 0, !dbg !623
  br i1 %5, label %setup.next1, label %setup.end, !dbg !623

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast float** %N_C.addr to i8*, !dbg !625
  %7 = call i32 @cudaSetupArgument(i8* nonnull %6, i64 8, i64 16), !dbg !625
  %8 = icmp eq i32 %7, 0, !dbg !625
  br i1 %8, label %setup.next2, label %setup.end, !dbg !625

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast float** %S_C.addr to i8*, !dbg !627
  %10 = call i32 @cudaSetupArgument(i8* nonnull %9, i64 8, i64 24), !dbg !627
  %11 = icmp eq i32 %10, 0, !dbg !627
  br i1 %11, label %setup.next3, label %setup.end, !dbg !627

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast float** %J_cuda.addr to i8*, !dbg !629
  %13 = call i32 @cudaSetupArgument(i8* nonnull %12, i64 8, i64 32), !dbg !629
  %14 = icmp eq i32 %13, 0, !dbg !629
  br i1 %14, label %setup.next4, label %setup.end, !dbg !629

setup.next4:                                      ; preds = %setup.next3
  %15 = bitcast float** %C_cuda.addr to i8*, !dbg !631
  %16 = call i32 @cudaSetupArgument(i8* nonnull %15, i64 8, i64 40), !dbg !631
  %17 = icmp eq i32 %16, 0, !dbg !631
  br i1 %17, label %setup.next5, label %setup.end, !dbg !631

setup.next5:                                      ; preds = %setup.next4
  %18 = bitcast i32* %cols.addr to i8*, !dbg !633
  %19 = call i32 @cudaSetupArgument(i8* nonnull %18, i64 4, i64 48), !dbg !633
  %20 = icmp eq i32 %19, 0, !dbg !633
  br i1 %20, label %setup.next6, label %setup.end, !dbg !633

setup.next6:                                      ; preds = %setup.next5
  %21 = bitcast i32* %rows.addr to i8*, !dbg !635
  %22 = call i32 @cudaSetupArgument(i8* nonnull %21, i64 4, i64 52), !dbg !635
  %23 = icmp eq i32 %22, 0, !dbg !635
  br i1 %23, label %setup.next7, label %setup.end, !dbg !635

setup.next7:                                      ; preds = %setup.next6
  %24 = bitcast float* %q0sqr.addr to i8*, !dbg !637
  %25 = call i32 @cudaSetupArgument(i8* nonnull %24, i64 4, i64 56), !dbg !637
  %26 = icmp eq i32 %25, 0, !dbg !637
  br i1 %26, label %setup.next8, label %setup.end, !dbg !637

setup.next8:                                      ; preds = %setup.next7
  %27 = call i32 @cudaLaunch(i8* bitcast (void (float*, float*, float*, float*, float*, float*, i32, i32, float)* @_Z11srad_cuda_1PfS_S_S_S_S_iif to i8*)), !dbg !639
  br label %setup.end, !dbg !639

setup.end:                                        ; preds = %setup.next8, %setup.next7, %setup.next6, %setup.next5, %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !641
}

declare i32 @cudaSetupArgument(i8*, i64, i64) local_unnamed_addr

declare i32 @cudaLaunch(i8*) local_unnamed_addr

; Function Attrs: uwtable
define void @_Z11srad_cuda_2PfS_S_S_S_S_iiff(float* %E_C, float* %W_C, float* %N_C, float* %S_C, float* %J_cuda, float* %C_cuda, i32 %cols, i32 %rows, float %lambda, float %q0sqr) #0 !dbg !642 {
entry:
  %E_C.addr = alloca float*, align 8
  %W_C.addr = alloca float*, align 8
  %N_C.addr = alloca float*, align 8
  %S_C.addr = alloca float*, align 8
  %J_cuda.addr = alloca float*, align 8
  %C_cuda.addr = alloca float*, align 8
  %cols.addr = alloca i32, align 4
  %rows.addr = alloca i32, align 4
  %lambda.addr = alloca float, align 4
  %q0sqr.addr = alloca float, align 4
  tail call void @llvm.dbg.value(metadata float* %E_C, i64 0, metadata !646, metadata !604), !dbg !656
  store float* %E_C, float** %E_C.addr, align 8, !tbaa !606
  tail call void @llvm.dbg.value(metadata float* %W_C, i64 0, metadata !647, metadata !604), !dbg !657
  store float* %W_C, float** %W_C.addr, align 8, !tbaa !606
  tail call void @llvm.dbg.value(metadata float* %N_C, i64 0, metadata !648, metadata !604), !dbg !658
  store float* %N_C, float** %N_C.addr, align 8, !tbaa !606
  tail call void @llvm.dbg.value(metadata float* %S_C, i64 0, metadata !649, metadata !604), !dbg !659
  store float* %S_C, float** %S_C.addr, align 8, !tbaa !606
  tail call void @llvm.dbg.value(metadata float* %J_cuda, i64 0, metadata !650, metadata !604), !dbg !660
  store float* %J_cuda, float** %J_cuda.addr, align 8, !tbaa !606
  tail call void @llvm.dbg.value(metadata float* %C_cuda, i64 0, metadata !651, metadata !604), !dbg !661
  store float* %C_cuda, float** %C_cuda.addr, align 8, !tbaa !606
  tail call void @llvm.dbg.value(metadata i32 %cols, i64 0, metadata !652, metadata !604), !dbg !662
  store i32 %cols, i32* %cols.addr, align 4, !tbaa !616
  tail call void @llvm.dbg.value(metadata i32 %rows, i64 0, metadata !653, metadata !604), !dbg !663
  store i32 %rows, i32* %rows.addr, align 4, !tbaa !616
  tail call void @llvm.dbg.value(metadata float %lambda, i64 0, metadata !654, metadata !604), !dbg !664
  store float %lambda, float* %lambda.addr, align 4, !tbaa !620
  tail call void @llvm.dbg.value(metadata float %q0sqr, i64 0, metadata !655, metadata !604), !dbg !665
  store float %q0sqr, float* %q0sqr.addr, align 4, !tbaa !620
  %0 = bitcast float** %E_C.addr to i8*, !dbg !666
  %1 = call i32 @cudaSetupArgument(i8* nonnull %0, i64 8, i64 0), !dbg !666
  %2 = icmp eq i32 %1, 0, !dbg !666
  br i1 %2, label %setup.next, label %setup.end, !dbg !666

setup.next:                                       ; preds = %entry
  %3 = bitcast float** %W_C.addr to i8*, !dbg !667
  %4 = call i32 @cudaSetupArgument(i8* nonnull %3, i64 8, i64 8), !dbg !667
  %5 = icmp eq i32 %4, 0, !dbg !667
  br i1 %5, label %setup.next1, label %setup.end, !dbg !667

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast float** %N_C.addr to i8*, !dbg !669
  %7 = call i32 @cudaSetupArgument(i8* nonnull %6, i64 8, i64 16), !dbg !669
  %8 = icmp eq i32 %7, 0, !dbg !669
  br i1 %8, label %setup.next2, label %setup.end, !dbg !669

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast float** %S_C.addr to i8*, !dbg !671
  %10 = call i32 @cudaSetupArgument(i8* nonnull %9, i64 8, i64 24), !dbg !671
  %11 = icmp eq i32 %10, 0, !dbg !671
  br i1 %11, label %setup.next3, label %setup.end, !dbg !671

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast float** %J_cuda.addr to i8*, !dbg !673
  %13 = call i32 @cudaSetupArgument(i8* nonnull %12, i64 8, i64 32), !dbg !673
  %14 = icmp eq i32 %13, 0, !dbg !673
  br i1 %14, label %setup.next4, label %setup.end, !dbg !673

setup.next4:                                      ; preds = %setup.next3
  %15 = bitcast float** %C_cuda.addr to i8*, !dbg !675
  %16 = call i32 @cudaSetupArgument(i8* nonnull %15, i64 8, i64 40), !dbg !675
  %17 = icmp eq i32 %16, 0, !dbg !675
  br i1 %17, label %setup.next5, label %setup.end, !dbg !675

setup.next5:                                      ; preds = %setup.next4
  %18 = bitcast i32* %cols.addr to i8*, !dbg !677
  %19 = call i32 @cudaSetupArgument(i8* nonnull %18, i64 4, i64 48), !dbg !677
  %20 = icmp eq i32 %19, 0, !dbg !677
  br i1 %20, label %setup.next6, label %setup.end, !dbg !677

setup.next6:                                      ; preds = %setup.next5
  %21 = bitcast i32* %rows.addr to i8*, !dbg !679
  %22 = call i32 @cudaSetupArgument(i8* nonnull %21, i64 4, i64 52), !dbg !679
  %23 = icmp eq i32 %22, 0, !dbg !679
  br i1 %23, label %setup.next7, label %setup.end, !dbg !679

setup.next7:                                      ; preds = %setup.next6
  %24 = bitcast float* %lambda.addr to i8*, !dbg !681
  %25 = call i32 @cudaSetupArgument(i8* nonnull %24, i64 4, i64 56), !dbg !681
  %26 = icmp eq i32 %25, 0, !dbg !681
  br i1 %26, label %setup.next8, label %setup.end, !dbg !681

setup.next8:                                      ; preds = %setup.next7
  %27 = bitcast float* %q0sqr.addr to i8*, !dbg !683
  %28 = call i32 @cudaSetupArgument(i8* nonnull %27, i64 4, i64 60), !dbg !683
  %29 = icmp eq i32 %28, 0, !dbg !683
  br i1 %29, label %setup.next9, label %setup.end, !dbg !683

setup.next9:                                      ; preds = %setup.next8
  %30 = call i32 @cudaLaunch(i8* bitcast (void (float*, float*, float*, float*, float*, float*, i32, i32, float, float)* @_Z11srad_cuda_2PfS_S_S_S_S_iiff to i8*)), !dbg !685
  br label %setup.end, !dbg !685

setup.end:                                        ; preds = %setup.next9, %setup.next8, %setup.next7, %setup.next6, %setup.next5, %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !687
}

; Function Attrs: nounwind uwtable
define double @_Z8get_timev() local_unnamed_addr #1 !dbg !688 {
entry:
  %time = alloca %struct.timeval, align 8
  %0 = bitcast %struct.timeval* %time to i8*, !dbg !701
  call void @llvm.lifetime.start(i64 16, i8* nonnull %0) #9, !dbg !701
  tail call void @llvm.dbg.value(metadata %struct.timeval* %time, i64 0, metadata !692, metadata !702), !dbg !703
  %call = call i32 @gettimeofday(%struct.timeval* nonnull %time, %struct.timezone* null) #9, !dbg !704
  %tobool = icmp eq i32 %call, 0, !dbg !704
  br i1 %tobool, label %if.end, label %cleanup, !dbg !706

if.end:                                           ; preds = %entry
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %time, i64 0, i32 0, !dbg !707
  %1 = load i64, i64* %tv_sec, align 8, !dbg !707, !tbaa !708
  %conv = sitofp i64 %1 to double, !dbg !711
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %time, i64 0, i32 1, !dbg !712
  %2 = load i64, i64* %tv_usec, align 8, !dbg !712, !tbaa !713
  %conv1 = sitofp i64 %2 to double, !dbg !714
  %mul = fmul double %conv1, 1.000000e-06, !dbg !715
  %add = fadd double %mul, %conv, !dbg !716
  br label %cleanup, !dbg !717

cleanup:                                          ; preds = %entry, %if.end
  %retval.0 = phi double [ %add, %if.end ], [ 0.000000e+00, %entry ]
  call void @llvm.lifetime.end(i64 16, i8* nonnull %0) #9, !dbg !718
  ret double %retval.0, !dbg !718
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #2

; Function Attrs: nounwind
declare i32 @gettimeofday(%struct.timeval* nocapture, %struct.timezone* nocapture) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #2

; Function Attrs: noreturn nounwind uwtable
define void @_Z5usageiPPc(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #4 !dbg !719 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !723, metadata !604), !dbg !725
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !724, metadata !604), !dbg !726
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !727, !tbaa !606
  %1 = load i8*, i8** %argv, align 8, !dbg !728, !tbaa !606
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str, i64 0, i64 0), i8* %1) #10, !dbg !729
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !730, !tbaa !606
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.1, i64 0, i64 0), i64 27, i64 1, %struct._IO_FILE* %2) #10, !dbg !731
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !732, !tbaa !606
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.2, i64 0, i64 0), i64 28, i64 1, %struct._IO_FILE* %4) #10, !dbg !733
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !734, !tbaa !606
  %7 = tail call i64 @fwrite(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.3, i64 0, i64 0), i64 34, i64 1, %struct._IO_FILE* %6) #10, !dbg !735
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !736, !tbaa !606
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.4, i64 0, i64 0), i64 37, i64 1, %struct._IO_FILE* %8) #10, !dbg !737
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !738, !tbaa !606
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.5, i64 0, i64 0), i64 38, i64 1, %struct._IO_FILE* %10) #10, !dbg !739
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !740, !tbaa !606
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.6, i64 0, i64 0), i64 38, i64 1, %struct._IO_FILE* %12) #10, !dbg !741
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !742, !tbaa !606
  %15 = tail call i64 @fwrite(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.7, i64 0, i64 0), i64 26, i64 1, %struct._IO_FILE* %14) #10, !dbg !743
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !744, !tbaa !606
  %17 = tail call i64 @fwrite(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.8, i64 0, i64 0), i64 40, i64 1, %struct._IO_FILE* %16) #10, !dbg !745
  tail call void @exit(i32 1) #11, !dbg !746
  unreachable, !dbg !746
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #5

; Function Attrs: norecurse uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #6 !dbg !747 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !751, metadata !604), !dbg !753
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !752, metadata !604), !dbg !754
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.9, i64 0, i64 0), i32 16, i32 16), !dbg !755
  tail call void @_Z7runTestiPPc(i32 %argc, i8** %argv), !dbg !756
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !757, !tbaa !606
  %1 = load double, double* @duration, align 8, !dbg !758, !tbaa !759
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.10, i64 0, i64 0), double %1) #10, !dbg !761
  ret i32 0, !dbg !762
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: uwtable
define void @_Z7runTestiPPc(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 !dbg !763 {
entry:
  %time.i299 = alloca %struct.timeval, align 8
  %time.i = alloca %struct.timeval, align 8
  %J_cuda = alloca float*, align 8
  %C_cuda = alloca float*, align 8
  %E_C = alloca float*, align 8
  %W_C = alloca float*, align 8
  %N_C = alloca float*, align 8
  %S_C = alloca float*, align 8
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !765, metadata !604), !dbg !839
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !766, metadata !604), !dbg !840
  tail call void @llvm.dbg.value(metadata i32 10, i64 0, metadata !771, metadata !604), !dbg !841
  %call = tail call i32 @cudaDeviceSetLimit(i32 2, i64 629145600), !dbg !842
  %0 = bitcast float** %J_cuda to i8*, !dbg !843
  call void @llvm.lifetime.start(i64 8, i8* nonnull %0) #9, !dbg !843
  %1 = bitcast float** %C_cuda to i8*, !dbg !844
  call void @llvm.lifetime.start(i64 8, i8* nonnull %1) #9, !dbg !844
  %2 = bitcast float** %E_C to i8*, !dbg !845
  call void @llvm.lifetime.start(i64 8, i8* nonnull %2) #9, !dbg !845
  %3 = bitcast float** %W_C to i8*, !dbg !845
  call void @llvm.lifetime.start(i64 8, i8* nonnull %3) #9, !dbg !845
  %4 = bitcast float** %N_C to i8*, !dbg !845
  call void @llvm.lifetime.start(i64 8, i8* nonnull %4) #9, !dbg !845
  %5 = bitcast float** %S_C to i8*, !dbg !845
  call void @llvm.lifetime.start(i64 8, i8* nonnull %5) #9, !dbg !845
  %cmp = icmp eq i32 %argc, 9, !dbg !846
  br i1 %cmp, label %if.then, label %if.else, !dbg !848

if.then:                                          ; preds = %entry
  %arrayidx = getelementptr inbounds i8*, i8** %argv, i64 1, !dbg !849
  %6 = load i8*, i8** %arrayidx, align 8, !dbg !849, !tbaa !606
  tail call void @llvm.dbg.value(metadata i8* %6, i64 0, metadata !311, metadata !604) #9, !dbg !851
  %call.i = tail call i64 @strtol(i8* nocapture nonnull %6, i8** null, i32 10) #9, !dbg !853
  %conv.i = trunc i64 %call.i to i32, !dbg !853
  tail call void @llvm.dbg.value(metadata i32 %conv.i, i64 0, metadata !767, metadata !604), !dbg !854
  %arrayidx15 = getelementptr inbounds i8*, i8** %argv, i64 2, !dbg !855
  %7 = load i8*, i8** %arrayidx15, align 8, !dbg !855, !tbaa !606
  tail call void @llvm.dbg.value(metadata i8* %7, i64 0, metadata !311, metadata !604) #9, !dbg !856
  %call.i279 = tail call i64 @strtol(i8* nocapture nonnull %7, i8** null, i32 10) #9, !dbg !858
  %conv.i280 = trunc i64 %call.i279 to i32, !dbg !858
  tail call void @llvm.dbg.value(metadata i32 %conv.i280, i64 0, metadata !768, metadata !604), !dbg !859
  %8 = or i64 %call.i279, %call.i, !dbg !860
  %9 = and i64 %8, 15, !dbg !860
  %10 = icmp eq i64 %9, 0, !dbg !860
  br i1 %10, label %if.end34, label %if.then20, !dbg !860

if.then20:                                        ; preds = %if.then
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !862, !tbaa !606
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.11, i64 0, i64 0), i64 38, i64 1, %struct._IO_FILE* %11) #10, !dbg !864
  tail call void @exit(i32 1) #11, !dbg !865
  unreachable, !dbg !865

if.else:                                          ; preds = %entry
  tail call void @_Z5usageiPPc(i32 undef, i8** %argv), !dbg !866
  unreachable

if.end34:                                         ; preds = %if.then
  %arrayidx22 = getelementptr inbounds i8*, i8** %argv, i64 3, !dbg !868
  %13 = load i8*, i8** %arrayidx22, align 8, !dbg !868, !tbaa !606
  tail call void @llvm.dbg.value(metadata i8* %13, i64 0, metadata !311, metadata !604) #9, !dbg !869
  %call.i281 = tail call i64 @strtol(i8* nocapture nonnull %13, i8** null, i32 10) #9, !dbg !871
  %conv.i282 = trunc i64 %call.i281 to i32, !dbg !871
  tail call void @llvm.dbg.value(metadata i32 %conv.i282, i64 0, metadata !788, metadata !604), !dbg !872
  %arrayidx24 = getelementptr inbounds i8*, i8** %argv, i64 4, !dbg !873
  %14 = load i8*, i8** %arrayidx24, align 8, !dbg !873, !tbaa !606
  tail call void @llvm.dbg.value(metadata i8* %14, i64 0, metadata !311, metadata !604) #9, !dbg !874
  %call.i283 = tail call i64 @strtol(i8* nocapture nonnull %14, i8** null, i32 10) #9, !dbg !876
  %conv.i284 = trunc i64 %call.i283 to i32, !dbg !876
  tail call void @llvm.dbg.value(metadata i32 %conv.i284, i64 0, metadata !789, metadata !604), !dbg !877
  %arrayidx26 = getelementptr inbounds i8*, i8** %argv, i64 5, !dbg !878
  %15 = load i8*, i8** %arrayidx26, align 8, !dbg !878, !tbaa !606
  tail call void @llvm.dbg.value(metadata i8* %15, i64 0, metadata !311, metadata !604) #9, !dbg !879
  %call.i285 = tail call i64 @strtol(i8* nocapture nonnull %15, i8** null, i32 10) #9, !dbg !881
  %conv.i286 = trunc i64 %call.i285 to i32, !dbg !881
  tail call void @llvm.dbg.value(metadata i32 %conv.i286, i64 0, metadata !790, metadata !604), !dbg !882
  %arrayidx28 = getelementptr inbounds i8*, i8** %argv, i64 6, !dbg !883
  %16 = load i8*, i8** %arrayidx28, align 8, !dbg !883, !tbaa !606
  tail call void @llvm.dbg.value(metadata i8* %16, i64 0, metadata !311, metadata !604) #9, !dbg !884
  %call.i287 = tail call i64 @strtol(i8* nocapture nonnull %16, i8** null, i32 10) #9, !dbg !886
  %conv.i288 = trunc i64 %call.i287 to i32, !dbg !886
  tail call void @llvm.dbg.value(metadata i32 %conv.i288, i64 0, metadata !791, metadata !604), !dbg !887
  %arrayidx30 = getelementptr inbounds i8*, i8** %argv, i64 7, !dbg !888
  %17 = load i8*, i8** %arrayidx30, align 8, !dbg !888, !tbaa !606
  tail call void @llvm.dbg.value(metadata i8* %17, i64 0, metadata !305, metadata !604) #9, !dbg !889
  %call.i289 = tail call double @strtod(i8* nocapture nonnull %17, i8** null) #9, !dbg !891
  %conv = fptrunc double %call.i289 to float, !dbg !892
  tail call void @llvm.dbg.value(metadata float %conv, i64 0, metadata !775, metadata !604), !dbg !893
  %arrayidx32 = getelementptr inbounds i8*, i8** %argv, i64 8, !dbg !894
  %18 = load i8*, i8** %arrayidx32, align 8, !dbg !894, !tbaa !606
  tail call void @llvm.dbg.value(metadata i8* %18, i64 0, metadata !311, metadata !604) #9, !dbg !895
  %call.i290 = tail call i64 @strtol(i8* nocapture nonnull %18, i8** null, i32 10) #9, !dbg !897
  %conv.i291 = trunc i64 %call.i290 to i32, !dbg !897
  tail call void @llvm.dbg.value(metadata i32 %conv.i291, i64 0, metadata !771, metadata !604), !dbg !841
  tail call void @llvm.dbg.value(metadata i32 %conv.i, i64 0, metadata !767, metadata !604), !dbg !854
  tail call void @llvm.dbg.value(metadata i32 %conv.i280, i64 0, metadata !768, metadata !604), !dbg !859
  tail call void @llvm.dbg.value(metadata i32 %conv.i291, i64 0, metadata !771, metadata !604), !dbg !841
  tail call void @llvm.dbg.value(metadata float %conv, i64 0, metadata !775, metadata !604), !dbg !893
  tail call void @llvm.dbg.value(metadata i32 %conv.i282, i64 0, metadata !788, metadata !604), !dbg !872
  tail call void @llvm.dbg.value(metadata i32 %conv.i284, i64 0, metadata !789, metadata !604), !dbg !877
  tail call void @llvm.dbg.value(metadata i32 %conv.i286, i64 0, metadata !790, metadata !604), !dbg !882
  tail call void @llvm.dbg.value(metadata i32 %conv.i288, i64 0, metadata !791, metadata !604), !dbg !887
  %mul = mul nsw i32 %conv.i280, %conv.i, !dbg !898
  tail call void @llvm.dbg.value(metadata i32 %mul, i64 0, metadata !769, metadata !604), !dbg !899
  %sub = sub i32 1, %conv.i282, !dbg !900
  %add = add i32 %sub, %conv.i284, !dbg !901
  %sub35 = sub i32 1, %conv.i286, !dbg !902
  %add36 = add i32 %sub35, %conv.i288, !dbg !903
  %mul37 = mul i32 %add36, %add, !dbg !904
  tail call void @llvm.dbg.value(metadata i32 %mul37, i64 0, metadata !770, metadata !604), !dbg !905
  %conv38 = sext i32 %mul to i64, !dbg !906
  %mul39 = shl nsw i64 %conv38, 2, !dbg !907
  %call40 = tail call noalias i8* @malloc(i64 %mul39) #9, !dbg !908
  %19 = bitcast i8* %call40 to float*, !dbg !909
  tail call void @llvm.dbg.value(metadata float* %19, i64 0, metadata !773, metadata !604), !dbg !910
  %call43 = tail call noalias i8* @malloc(i64 %mul39) #9, !dbg !911
  %20 = bitcast i8* %call43 to float*, !dbg !912
  tail call void @llvm.dbg.value(metadata float* %20, i64 0, metadata !774, metadata !604), !dbg !913
  %21 = bitcast float** %J_cuda to i8**, !dbg !914
  %call49 = call i32 @cudaMalloc(i8** nonnull %21, i64 %mul39), !dbg !915
  %22 = bitcast float** %C_cuda to i8**, !dbg !916
  %call52 = call i32 @cudaMalloc(i8** nonnull %22, i64 %mul39), !dbg !917
  %23 = bitcast float** %E_C to i8**, !dbg !918
  %call55 = call i32 @cudaMalloc(i8** nonnull %23, i64 %mul39), !dbg !919
  %24 = bitcast float** %W_C to i8**, !dbg !920
  %call58 = call i32 @cudaMalloc(i8** nonnull %24, i64 %mul39), !dbg !921
  %25 = bitcast float** %S_C to i8**, !dbg !922
  %call61 = call i32 @cudaMalloc(i8** nonnull %25, i64 %mul39), !dbg !923
  %26 = bitcast float** %N_C to i8**, !dbg !924
  %call64 = call i32 @cudaMalloc(i8** nonnull %26, i64 %mul39), !dbg !925
  %puts = call i32 @puts(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @str, i64 0, i64 0)), !dbg !926
  call void @llvm.dbg.value(metadata float* %19, i64 0, metadata !927, metadata !604) #9, !dbg !940
  call void @llvm.dbg.value(metadata i32 %conv.i, i64 0, metadata !932, metadata !604) #9, !dbg !942
  call void @llvm.dbg.value(metadata i32 %conv.i280, i64 0, metadata !933, metadata !604) #9, !dbg !943
  call void @srand(i32 7) #9, !dbg !944
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !934, metadata !604) #9, !dbg !945
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !934, metadata !604) #9, !dbg !945
  %cmp17.i = icmp sgt i32 %conv.i, 0, !dbg !946
  br i1 %cmp17.i, label %for.cond1.preheader.lr.ph.i, label %for.cond.preheader, !dbg !948

for.cond1.preheader.lr.ph.i:                      ; preds = %if.end34
  %cmp215.i = icmp sgt i32 %conv.i280, 0
  %sext = shl i64 %call.i279, 32, !dbg !948
  %27 = ashr exact i64 %sext, 32, !dbg !948
  %wide.trip.count.i = and i64 %call.i279, 4294967295
  %wide.trip.count23.i = and i64 %call.i, 4294967295
  br label %for.cond1.preheader.i, !dbg !948

for.cond1.preheader.i:                            ; preds = %for.cond.cleanup3.i, %for.cond1.preheader.lr.ph.i
  %indvars.iv20.i = phi i64 [ 0, %for.cond1.preheader.lr.ph.i ], [ %indvars.iv.next21.i, %for.cond.cleanup3.i ]
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !936, metadata !604) #9, !dbg !950
  br i1 %cmp215.i, label %for.body4.lr.ph.i, label %for.cond.cleanup3.i, !dbg !951

for.body4.lr.ph.i:                                ; preds = %for.cond1.preheader.i
  %28 = mul nsw i64 %indvars.iv20.i, %27
  br label %for.body4.i, !dbg !951

for.cond.cleanup3.i.loopexit:                     ; preds = %for.body4.i
  br label %for.cond.cleanup3.i, !dbg !953

for.cond.cleanup3.i:                              ; preds = %for.cond.cleanup3.i.loopexit, %for.cond1.preheader.i
  %indvars.iv.next21.i = add nuw nsw i64 %indvars.iv20.i, 1, !dbg !953
  %exitcond24.i = icmp eq i64 %indvars.iv.next21.i, %wide.trip.count23.i, !dbg !946
  br i1 %exitcond24.i, label %for.cond.preheader.loopexit, label %for.cond1.preheader.i, !dbg !948, !llvm.loop !955

for.cond.preheader.loopexit:                      ; preds = %for.cond.cleanup3.i
  br label %for.cond.preheader, !dbg !958

for.cond.preheader:                               ; preds = %for.cond.preheader.loopexit, %if.end34
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !793, metadata !604), !dbg !958
  %cmp67350 = icmp sgt i32 %mul, 0, !dbg !959
  br i1 %cmp67350, label %for.body.preheader, label %for.cond.cleanup, !dbg !962

for.body.preheader:                               ; preds = %for.cond.preheader
  %wide.trip.count = zext i32 %mul to i64
  br label %for.body, !dbg !964

for.body4.i:                                      ; preds = %for.body4.i, %for.body4.lr.ph.i
  %indvars.iv.i = phi i64 [ 0, %for.body4.lr.ph.i ], [ %indvars.iv.next.i, %for.body4.i ]
  %call.i292 = call i32 @rand() #9, !dbg !966
  %conv.i293 = sitofp i32 %call.i292 to float, !dbg !966
  %div.i = fmul float %conv.i293, 0x3E00000000000000, !dbg !969
  %29 = add nsw i64 %indvars.iv.i, %28, !dbg !970
  %arrayidx.i = getelementptr inbounds float, float* %19, i64 %29, !dbg !971
  store float %div.i, float* %arrayidx.i, align 4, !dbg !972, !tbaa !620
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !973
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, %wide.trip.count.i, !dbg !975
  br i1 %exitcond.i, label %for.cond.cleanup3.i.loopexit, label %for.body4.i, !dbg !951, !llvm.loop !977

for.cond.cleanup.loopexit:                        ; preds = %for.body
  br label %for.cond.cleanup, !dbg !980

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %for.cond.preheader
  %puts274 = call i32 @puts(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @str.18, i64 0, i64 0)), !dbg !980
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !772, metadata !604), !dbg !981
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !772, metadata !604), !dbg !981
  %cmp76348 = icmp sgt i32 %conv.i291, 0, !dbg !982
  br i1 %cmp76348, label %for.cond79.preheader.lr.ph, label %for.cond.cleanup.for.end138_crit_edge, !dbg !984

for.cond.cleanup.for.end138_crit_edge:            ; preds = %for.cond.cleanup
  %sext364 = shl i64 %call.i279, 32, !dbg !986
  %.pre = ashr exact i64 %sext364, 32, !dbg !986
  br label %for.end138, !dbg !984

for.cond79.preheader.lr.ph:                       ; preds = %for.cond.cleanup
  %cmp80342 = icmp ugt i32 %conv.i282, %conv.i284
  %conv101 = sitofp i32 %mul37 to float
  %div109 = sdiv i32 %conv.i280, 16
  %div111 = sdiv i32 %conv.i, 16
  %30 = bitcast %struct.timeval* %time.i299 to i8*
  %tv_sec.i302 = getelementptr inbounds %struct.timeval, %struct.timeval* %time.i299, i64 0, i32 0
  %tv_usec.i304 = getelementptr inbounds %struct.timeval, %struct.timeval* %time.i299, i64 0, i32 1
  %dimGrid.sroa.0.sroa.5.0.insert.ext = zext i32 %div111 to i64
  %dimGrid.sroa.0.sroa.5.0.insert.shift = shl nuw i64 %dimGrid.sroa.0.sroa.5.0.insert.ext, 32
  %dimGrid.sroa.0.sroa.0.0.insert.ext = zext i32 %div109 to i64
  %dimGrid.sroa.0.sroa.0.0.insert.insert = or i64 %dimGrid.sroa.0.sroa.5.0.insert.shift, %dimGrid.sroa.0.sroa.0.0.insert.ext
  %31 = bitcast %struct.timeval* %time.i to i8*
  %tv_sec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %time.i, i64 0, i32 0
  %tv_usec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %time.i, i64 0, i32 1
  %cmp85337 = icmp ugt i32 %conv.i286, %conv.i288
  %sext365 = shl i64 %call.i285, 32, !dbg !984
  %32 = ashr exact i64 %sext365, 32, !dbg !984
  %sext366 = shl i64 %call.i281, 32, !dbg !984
  %33 = ashr exact i64 %sext366, 32, !dbg !984
  %sext367 = shl i64 %call.i279, 32, !dbg !984
  %34 = ashr exact i64 %sext367, 32, !dbg !984
  br label %for.cond79.preheader, !dbg !984

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv361 = phi i64 [ %indvars.iv.next362, %for.body ], [ 0, %for.body.preheader ]
  %arrayidx68 = getelementptr inbounds float, float* %19, i64 %indvars.iv361, !dbg !964
  %35 = load float, float* %arrayidx68, align 4, !dbg !964, !tbaa !620
  %conv69 = fpext float %35 to double, !dbg !964
  %call70 = call double @exp(double %conv69) #9, !dbg !988
  %conv71 = fptrunc double %call70 to float, !dbg !988
  %arrayidx73 = getelementptr inbounds float, float* %20, i64 %indvars.iv361, !dbg !989
  store float %conv71, float* %arrayidx73, align 4, !dbg !990, !tbaa !620
  %indvars.iv.next362 = add nuw nsw i64 %indvars.iv361, 1, !dbg !991
  %exitcond363 = icmp eq i64 %indvars.iv.next362, %wide.trip.count, !dbg !959
  br i1 %exitcond363, label %for.cond.cleanup.loopexit, label %for.body, !dbg !962, !llvm.loop !993

for.cond79.preheader:                             ; preds = %_Z8get_timev.exit, %for.cond79.preheader.lr.ph
  %iter.0349 = phi i32 [ 0, %for.cond79.preheader.lr.ph ], [ %inc137, %_Z8get_timev.exit ]
  call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !777, metadata !604), !dbg !996
  call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !778, metadata !604), !dbg !997
  call void @llvm.dbg.value(metadata i32 %conv.i282, i64 0, metadata !795, metadata !604), !dbg !998
  br i1 %cmp80342, label %for.cond.cleanup81, label %for.cond84.preheader.preheader, !dbg !999

for.cond84.preheader.preheader:                   ; preds = %for.cond79.preheader
  br label %for.cond84.preheader, !dbg !996

for.cond84.preheader:                             ; preds = %for.cond84.preheader.preheader, %for.cond.cleanup86
  %indvars.iv357 = phi i64 [ %indvars.iv.next358, %for.cond.cleanup86 ], [ %33, %for.cond84.preheader.preheader ]
  %sum.0345 = phi float [ %sum.1.lcssa, %for.cond.cleanup86 ], [ 0.000000e+00, %for.cond84.preheader.preheader ]
  %sum2.0344 = phi float [ %sum2.1.lcssa, %for.cond.cleanup86 ], [ 0.000000e+00, %for.cond84.preheader.preheader ]
  call void @llvm.dbg.value(metadata float %sum.0345, i64 0, metadata !777, metadata !604), !dbg !996
  call void @llvm.dbg.value(metadata float %sum2.0344, i64 0, metadata !778, metadata !604), !dbg !997
  call void @llvm.dbg.value(metadata i32 %conv.i286, i64 0, metadata !800, metadata !604), !dbg !1001
  br i1 %cmp85337, label %for.cond.cleanup86, label %for.body87.lr.ph, !dbg !1002

for.body87.lr.ph:                                 ; preds = %for.cond84.preheader
  %36 = mul nsw i64 %indvars.iv357, %34
  br label %for.body87, !dbg !1002

for.cond.cleanup81.loopexit:                      ; preds = %for.cond.cleanup86
  br label %for.cond.cleanup81, !dbg !1004

for.cond.cleanup81:                               ; preds = %for.cond.cleanup81.loopexit, %for.cond79.preheader
  %sum2.0.lcssa = phi float [ 0.000000e+00, %for.cond79.preheader ], [ %sum2.1.lcssa, %for.cond.cleanup81.loopexit ]
  %sum.0.lcssa = phi float [ 0.000000e+00, %for.cond79.preheader ], [ %sum.1.lcssa, %for.cond.cleanup81.loopexit ]
  %div = fdiv float %sum.0.lcssa, %conv101, !dbg !1004
  call void @llvm.dbg.value(metadata float %div, i64 0, metadata !780, metadata !604), !dbg !1005
  %div103 = fdiv float %sum2.0.lcssa, %conv101, !dbg !1006
  %mul104 = fmul float %div, %div, !dbg !1007
  %sub105 = fsub float %div103, %mul104, !dbg !1008
  call void @llvm.dbg.value(metadata float %sub105, i64 0, metadata !781, metadata !604), !dbg !1009
  %div107 = fdiv float %sub105, %mul104, !dbg !1010
  call void @llvm.dbg.value(metadata float %div107, i64 0, metadata !776, metadata !604), !dbg !1011
  call void @llvm.dbg.value(metadata i32 %div109, i64 0, metadata !804, metadata !604), !dbg !1012
  call void @llvm.dbg.value(metadata i32 %div111, i64 0, metadata !805, metadata !604), !dbg !1013
  call void @llvm.dbg.value(metadata %struct.dim3* undef, i64 0, metadata !806, metadata !702), !dbg !1014
  call void @llvm.dbg.value(metadata %struct.dim3* undef, i64 0, metadata !830, metadata !702), !dbg !1015
  %37 = load i8*, i8** %21, align 8, !dbg !1016, !tbaa !606
  %call116 = call i32 @cudaMemcpy(i8* %37, i8* %call43, i64 %mul39, i32 1), !dbg !1017
  %call117 = call i32 @cudaDeviceSynchronize(), !dbg !1018
  call void @llvm.lifetime.start(i64 16, i8* nonnull %30) #9, !dbg !1019
  call void @llvm.dbg.value(metadata %struct.timeval* %time.i299, i64 0, metadata !692, metadata !702) #9, !dbg !1021
  %call.i300 = call i32 @gettimeofday(%struct.timeval* nonnull %time.i299, %struct.timezone* null) #9, !dbg !1022
  %tobool.i301 = icmp eq i32 %call.i300, 0, !dbg !1022
  br i1 %tobool.i301, label %if.end.i308, label %_Z8get_timev.exit310, !dbg !1023

if.end.i308:                                      ; preds = %for.cond.cleanup81
  %38 = load i64, i64* %tv_sec.i302, align 8, !dbg !1024, !tbaa !708
  %conv.i303 = sitofp i64 %38 to double, !dbg !1025
  %39 = load i64, i64* %tv_usec.i304, align 8, !dbg !1026, !tbaa !713
  %conv1.i305 = sitofp i64 %39 to double, !dbg !1027
  %mul.i306 = fmul double %conv1.i305, 1.000000e-06, !dbg !1028
  %add.i307 = fadd double %mul.i306, %conv.i303, !dbg !1029
  br label %_Z8get_timev.exit310, !dbg !1030

_Z8get_timev.exit310:                             ; preds = %for.cond.cleanup81, %if.end.i308
  %retval.0.i309 = phi double [ %add.i307, %if.end.i308 ], [ 0.000000e+00, %for.cond.cleanup81 ]
  call void @llvm.lifetime.end(i64 16, i8* nonnull %30) #9, !dbg !1031
  call void @llvm.dbg.value(metadata double %retval.0.i309, i64 0, metadata !831, metadata !604), !dbg !1032
  %call121 = call i32 @cudaConfigureCall(i64 %dimGrid.sroa.0.sroa.0.0.insert.insert, i32 1, i64 68719476752, i32 1, i64 0, %struct.CUstream_st* null), !dbg !1033
  %tobool = icmp eq i32 %call121, 0, !dbg !1033
  br i1 %tobool, label %kcall.configok, label %kcall.end, !dbg !1034

for.cond.cleanup86.loopexit:                      ; preds = %for.body87
  br label %for.cond.cleanup86, !dbg !1035

for.cond.cleanup86:                               ; preds = %for.cond.cleanup86.loopexit, %for.cond84.preheader
  %sum2.1.lcssa = phi float [ %sum2.0344, %for.cond84.preheader ], [ %add94, %for.cond.cleanup86.loopexit ]
  %sum.1.lcssa = phi float [ %sum.0345, %for.cond84.preheader ], [ %add92, %for.cond.cleanup86.loopexit ]
  %indvars.iv.next358 = add i64 %indvars.iv357, 1, !dbg !1035
  call void @llvm.dbg.value(metadata float %sum.1.lcssa, i64 0, metadata !777, metadata !604), !dbg !996
  call void @llvm.dbg.value(metadata float %sum2.1.lcssa, i64 0, metadata !778, metadata !604), !dbg !997
  %40 = trunc i64 %indvars.iv.next358 to i32, !dbg !1037
  %cmp80 = icmp ugt i32 %40, %conv.i284, !dbg !1037
  br i1 %cmp80, label %for.cond.cleanup81.loopexit, label %for.cond84.preheader, !dbg !999, !llvm.loop !1039

for.body87:                                       ; preds = %for.body87.lr.ph, %for.body87
  %indvars.iv354 = phi i64 [ %32, %for.body87.lr.ph ], [ %indvars.iv.next355, %for.body87 ]
  %sum.1340 = phi float [ %sum.0345, %for.body87.lr.ph ], [ %add92, %for.body87 ]
  %sum2.1339 = phi float [ %sum2.0344, %for.body87.lr.ph ], [ %add94, %for.body87 ]
  %41 = add nsw i64 %indvars.iv354, %36, !dbg !1042
  %arrayidx91 = getelementptr inbounds float, float* %20, i64 %41, !dbg !1045
  %42 = load float, float* %arrayidx91, align 4, !dbg !1045, !tbaa !620
  call void @llvm.dbg.value(metadata float %42, i64 0, metadata !779, metadata !604), !dbg !1046
  %add92 = fadd float %sum.1340, %42, !dbg !1047
  call void @llvm.dbg.value(metadata float %add92, i64 0, metadata !777, metadata !604), !dbg !996
  %mul93 = fmul float %42, %42, !dbg !1048
  %add94 = fadd float %sum2.1339, %mul93, !dbg !1049
  call void @llvm.dbg.value(metadata float %add94, i64 0, metadata !778, metadata !604), !dbg !997
  %indvars.iv.next355 = add i64 %indvars.iv354, 1, !dbg !1050
  call void @llvm.dbg.value(metadata float %add92, i64 0, metadata !777, metadata !604), !dbg !996
  call void @llvm.dbg.value(metadata float %add94, i64 0, metadata !778, metadata !604), !dbg !997
  %43 = trunc i64 %indvars.iv.next355 to i32, !dbg !1052
  %cmp85 = icmp ugt i32 %43, %conv.i288, !dbg !1052
  br i1 %cmp85, label %for.cond.cleanup86.loopexit, label %for.body87, !dbg !1002, !llvm.loop !1054

kcall.configok:                                   ; preds = %_Z8get_timev.exit310
  %44 = load float*, float** %E_C, align 8, !dbg !1057, !tbaa !606
  call void @llvm.dbg.value(metadata float* %44, i64 0, metadata !784, metadata !604), !dbg !1059
  %45 = load float*, float** %W_C, align 8, !dbg !1060, !tbaa !606
  call void @llvm.dbg.value(metadata float* %45, i64 0, metadata !785, metadata !604), !dbg !1061
  %46 = load float*, float** %N_C, align 8, !dbg !1062, !tbaa !606
  call void @llvm.dbg.value(metadata float* %46, i64 0, metadata !786, metadata !604), !dbg !1063
  %47 = load float*, float** %S_C, align 8, !dbg !1064, !tbaa !606
  call void @llvm.dbg.value(metadata float* %47, i64 0, metadata !787, metadata !604), !dbg !1065
  %48 = load float*, float** %J_cuda, align 8, !dbg !1066, !tbaa !606
  call void @llvm.dbg.value(metadata float* %48, i64 0, metadata !782, metadata !604), !dbg !1067
  %49 = load float*, float** %C_cuda, align 8, !dbg !1068, !tbaa !606
  call void @llvm.dbg.value(metadata float* %49, i64 0, metadata !783, metadata !604), !dbg !1069
  call void @_Z11srad_cuda_1PfS_S_S_S_S_iif(float* %44, float* %45, float* %46, float* %47, float* %48, float* %49, i32 %conv.i280, i32 %conv.i, float %div107), !dbg !1070
  br label %kcall.end, !dbg !1070

kcall.end:                                        ; preds = %_Z8get_timev.exit310, %kcall.configok
  %call124 = call i32 @cudaConfigureCall(i64 %dimGrid.sroa.0.sroa.0.0.insert.insert, i32 1, i64 68719476752, i32 1, i64 0, %struct.CUstream_st* null), !dbg !1071
  %tobool125 = icmp eq i32 %call124, 0, !dbg !1071
  br i1 %tobool125, label %kcall.configok126, label %kcall.end127, !dbg !1072

kcall.configok126:                                ; preds = %kcall.end
  %50 = load float*, float** %E_C, align 8, !dbg !1073, !tbaa !606
  call void @llvm.dbg.value(metadata float* %50, i64 0, metadata !784, metadata !604), !dbg !1059
  %51 = load float*, float** %W_C, align 8, !dbg !1074, !tbaa !606
  call void @llvm.dbg.value(metadata float* %51, i64 0, metadata !785, metadata !604), !dbg !1061
  %52 = load float*, float** %N_C, align 8, !dbg !1075, !tbaa !606
  call void @llvm.dbg.value(metadata float* %52, i64 0, metadata !786, metadata !604), !dbg !1063
  %53 = load float*, float** %S_C, align 8, !dbg !1076, !tbaa !606
  call void @llvm.dbg.value(metadata float* %53, i64 0, metadata !787, metadata !604), !dbg !1065
  %54 = load float*, float** %J_cuda, align 8, !dbg !1077, !tbaa !606
  call void @llvm.dbg.value(metadata float* %54, i64 0, metadata !782, metadata !604), !dbg !1067
  %55 = load float*, float** %C_cuda, align 8, !dbg !1078, !tbaa !606
  call void @llvm.dbg.value(metadata float* %55, i64 0, metadata !783, metadata !604), !dbg !1069
  call void @_Z11srad_cuda_2PfS_S_S_S_S_iiff(float* %50, float* %51, float* %52, float* %53, float* %54, float* %55, i32 %conv.i280, i32 %conv.i, float %conv, float %div107), !dbg !1079
  br label %kcall.end127, !dbg !1079

kcall.end127:                                     ; preds = %kcall.end, %kcall.configok126
  %call128 = call i32 @cudaDeviceSynchronize(), !dbg !1080
  call void @llvm.lifetime.start(i64 16, i8* nonnull %31) #9, !dbg !1081
  call void @llvm.dbg.value(metadata %struct.timeval* %time.i, i64 0, metadata !692, metadata !702) #9, !dbg !1083
  %call.i297 = call i32 @gettimeofday(%struct.timeval* nonnull %time.i, %struct.timezone* null) #9, !dbg !1084
  %tobool.i = icmp eq i32 %call.i297, 0, !dbg !1084
  br i1 %tobool.i, label %if.end.i, label %_Z8get_timev.exit, !dbg !1085

if.end.i:                                         ; preds = %kcall.end127
  %56 = load i64, i64* %tv_sec.i, align 8, !dbg !1086, !tbaa !708
  %conv.i298 = sitofp i64 %56 to double, !dbg !1087
  %57 = load i64, i64* %tv_usec.i, align 8, !dbg !1088, !tbaa !713
  %conv1.i = sitofp i64 %57 to double, !dbg !1089
  %mul.i = fmul double %conv1.i, 1.000000e-06, !dbg !1090
  %add.i = fadd double %mul.i, %conv.i298, !dbg !1091
  br label %_Z8get_timev.exit, !dbg !1092

_Z8get_timev.exit:                                ; preds = %kcall.end127, %if.end.i
  %retval.0.i = phi double [ %add.i, %if.end.i ], [ 0.000000e+00, %kcall.end127 ]
  call void @llvm.lifetime.end(i64 16, i8* nonnull %31) #9, !dbg !1093
  call void @llvm.dbg.value(metadata double %retval.0.i, i64 0, metadata !832, metadata !604), !dbg !1094
  %sub131 = fsub double %retval.0.i, %retval.0.i309, !dbg !1095
  %58 = load double, double* @duration, align 8, !dbg !1096, !tbaa !759
  %add132 = fadd double %sub131, %58, !dbg !1096
  store double %add132, double* @duration, align 8, !dbg !1096, !tbaa !759
  %59 = load i8*, i8** %21, align 8, !dbg !1097, !tbaa !606
  %call135 = call i32 @cudaMemcpy(i8* %call43, i8* %59, i64 %mul39, i32 2), !dbg !1098
  %inc137 = add nuw nsw i32 %iter.0349, 1, !dbg !1099
  call void @llvm.dbg.value(metadata i32 %inc137, i64 0, metadata !772, metadata !604), !dbg !981
  call void @llvm.dbg.value(metadata i32 %inc137, i64 0, metadata !772, metadata !604), !dbg !981
  %exitcond360 = icmp eq i32 %inc137, %conv.i291, !dbg !982
  br i1 %exitcond360, label %for.end138.loopexit, label %for.cond79.preheader, !dbg !984, !llvm.loop !1101

for.end138.loopexit:                              ; preds = %_Z8get_timev.exit
  br label %for.end138, !dbg !1104

for.end138:                                       ; preds = %for.end138.loopexit, %for.cond.cleanup.for.end138_crit_edge
  %.pre-phi = phi i64 [ %.pre, %for.cond.cleanup.for.end138_crit_edge ], [ %34, %for.end138.loopexit ], !dbg !986
  %call139 = call i32 @cudaThreadSynchronize(), !dbg !1104
  %puts275 = call i32 @puts(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @str.19, i64 0, i64 0)), !dbg !1105
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !833, metadata !604), !dbg !1106
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !833, metadata !604), !dbg !1106
  br label %for.cond149.preheader, !dbg !986

for.cond149.preheader:                            ; preds = %for.cond149.preheader, %for.end138
  %indvars.iv = phi i64 [ 0, %for.end138 ], [ %indvars.iv.next, %for.cond149.preheader ]
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !835, metadata !604), !dbg !1107
  %60 = mul nsw i64 %indvars.iv, %.pre-phi
  %arrayidx156 = getelementptr inbounds float, float* %20, i64 %60, !dbg !1108
  %61 = load float, float* %arrayidx156, align 4, !dbg !1108, !tbaa !620
  %conv157 = fpext float %61 to double, !dbg !1108
  %call158 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.15, i64 0, i64 0), double %conv157), !dbg !1111
  %62 = add nsw i64 %60, 1, !dbg !1112
  %arrayidx156.1 = getelementptr inbounds float, float* %20, i64 %62, !dbg !1108
  %63 = load float, float* %arrayidx156.1, align 4, !dbg !1108, !tbaa !620
  %conv157.1 = fpext float %63 to double, !dbg !1108
  %call158.1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.15, i64 0, i64 0), double %conv157.1), !dbg !1111
  %64 = add nsw i64 %60, 2, !dbg !1112
  %arrayidx156.2 = getelementptr inbounds float, float* %20, i64 %64, !dbg !1108
  %65 = load float, float* %arrayidx156.2, align 4, !dbg !1108, !tbaa !620
  %conv157.2 = fpext float %65 to double, !dbg !1108
  %call158.2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.15, i64 0, i64 0), double %conv157.2), !dbg !1111
  %66 = add nsw i64 %60, 3, !dbg !1112
  %arrayidx156.3 = getelementptr inbounds float, float* %20, i64 %66, !dbg !1108
  %67 = load float, float* %arrayidx156.3, align 4, !dbg !1108, !tbaa !620
  %conv157.3 = fpext float %67 to double, !dbg !1108
  %call158.3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.15, i64 0, i64 0), double %conv157.3), !dbg !1111
  %68 = add nsw i64 %60, 4, !dbg !1112
  %arrayidx156.4 = getelementptr inbounds float, float* %20, i64 %68, !dbg !1108
  %69 = load float, float* %arrayidx156.4, align 4, !dbg !1108, !tbaa !620
  %conv157.4 = fpext float %69 to double, !dbg !1108
  %call158.4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.15, i64 0, i64 0), double %conv157.4), !dbg !1111
  %70 = add nsw i64 %60, 5, !dbg !1112
  %arrayidx156.5 = getelementptr inbounds float, float* %20, i64 %70, !dbg !1108
  %71 = load float, float* %arrayidx156.5, align 4, !dbg !1108, !tbaa !620
  %conv157.5 = fpext float %71 to double, !dbg !1108
  %call158.5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.15, i64 0, i64 0), double %conv157.5), !dbg !1111
  %72 = add nsw i64 %60, 6, !dbg !1112
  %arrayidx156.6 = getelementptr inbounds float, float* %20, i64 %72, !dbg !1108
  %73 = load float, float* %arrayidx156.6, align 4, !dbg !1108, !tbaa !620
  %conv157.6 = fpext float %73 to double, !dbg !1108
  %call158.6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.15, i64 0, i64 0), double %conv157.6), !dbg !1111
  %74 = add nsw i64 %60, 7, !dbg !1112
  %arrayidx156.7 = getelementptr inbounds float, float* %20, i64 %74, !dbg !1108
  %75 = load float, float* %arrayidx156.7, align 4, !dbg !1108, !tbaa !620
  %conv157.7 = fpext float %75 to double, !dbg !1108
  %call158.7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.15, i64 0, i64 0), double %conv157.7), !dbg !1111
  %76 = add nsw i64 %60, 8, !dbg !1112
  %arrayidx156.8 = getelementptr inbounds float, float* %20, i64 %76, !dbg !1108
  %77 = load float, float* %arrayidx156.8, align 4, !dbg !1108, !tbaa !620
  %conv157.8 = fpext float %77 to double, !dbg !1108
  %call158.8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.15, i64 0, i64 0), double %conv157.8), !dbg !1111
  %78 = add nsw i64 %60, 9, !dbg !1112
  %arrayidx156.9 = getelementptr inbounds float, float* %20, i64 %78, !dbg !1108
  %79 = load float, float* %arrayidx156.9, align 4, !dbg !1108, !tbaa !620
  %conv157.9 = fpext float %79 to double, !dbg !1108
  %call158.9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.15, i64 0, i64 0), double %conv157.9), !dbg !1111
  %putchar = call i32 @putchar(i32 10), !dbg !1113
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !1114
  %exitcond = icmp eq i64 %indvars.iv.next, 10, !dbg !1116
  br i1 %exitcond, label %for.cond.cleanup145, label %for.cond149.preheader, !dbg !986, !llvm.loop !1118

for.cond.cleanup145:                              ; preds = %for.cond149.preheader
  %puts276 = call i32 @puts(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @str.20, i64 0, i64 0)), !dbg !1121
  call void @free(i8* %call40) #9, !dbg !1122
  call void @free(i8* nonnull %call43) #9, !dbg !1123
  %80 = load i8*, i8** %22, align 8, !dbg !1124, !tbaa !606
  %call167 = call i32 @cudaFree(i8* %80), !dbg !1125
  %81 = load i8*, i8** %21, align 8, !dbg !1126, !tbaa !606
  %call168 = call i32 @cudaFree(i8* %81), !dbg !1127
  %82 = load i8*, i8** %23, align 8, !dbg !1128, !tbaa !606
  %call169 = call i32 @cudaFree(i8* %82), !dbg !1129
  %83 = load i8*, i8** %24, align 8, !dbg !1130, !tbaa !606
  %call170 = call i32 @cudaFree(i8* %83), !dbg !1131
  %84 = load i8*, i8** %26, align 8, !dbg !1132, !tbaa !606
  %call171 = call i32 @cudaFree(i8* %84), !dbg !1133
  %85 = load i8*, i8** %25, align 8, !dbg !1134, !tbaa !606
  %call172 = call i32 @cudaFree(i8* %85), !dbg !1135
  call void @llvm.lifetime.end(i64 8, i8* nonnull %5) #9, !dbg !1136
  call void @llvm.lifetime.end(i64 8, i8* nonnull %4) #9, !dbg !1136
  call void @llvm.lifetime.end(i64 8, i8* nonnull %3) #9, !dbg !1136
  call void @llvm.lifetime.end(i64 8, i8* nonnull %2) #9, !dbg !1136
  call void @llvm.lifetime.end(i64 8, i8* nonnull %1) #9, !dbg !1136
  call void @llvm.lifetime.end(i64 8, i8* nonnull %0) #9, !dbg !1136
  ret void, !dbg !1136
}

declare i32 @cudaDeviceSetLimit(i32, i64) local_unnamed_addr #7

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) local_unnamed_addr #3

declare i32 @cudaMalloc(i8**, i64) local_unnamed_addr #7

; Function Attrs: nounwind uwtable
define void @_Z13random_matrixPfii(float* nocapture %I, i32 %rows, i32 %cols) local_unnamed_addr #1 !dbg !928 {
entry:
  tail call void @llvm.dbg.value(metadata float* %I, i64 0, metadata !927, metadata !604), !dbg !1137
  tail call void @llvm.dbg.value(metadata i32 %rows, i64 0, metadata !932, metadata !604), !dbg !1138
  tail call void @llvm.dbg.value(metadata i32 %cols, i64 0, metadata !933, metadata !604), !dbg !1139
  tail call void @srand(i32 7) #9, !dbg !1140
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !934, metadata !604), !dbg !1141
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !934, metadata !604), !dbg !1141
  %cmp17 = icmp sgt i32 %rows, 0, !dbg !1142
  br i1 %cmp17, label %for.cond1.preheader.lr.ph, label %for.cond.cleanup, !dbg !1143

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp215 = icmp sgt i32 %cols, 0
  %0 = sext i32 %cols to i64, !dbg !1143
  %wide.trip.count = zext i32 %cols to i64
  %wide.trip.count23 = zext i32 %rows to i64
  br label %for.cond1.preheader, !dbg !1143

for.cond1.preheader:                              ; preds = %for.cond.cleanup3, %for.cond1.preheader.lr.ph
  %indvars.iv20 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next21, %for.cond.cleanup3 ]
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !936, metadata !604), !dbg !1144
  br i1 %cmp215, label %for.body4.lr.ph, label %for.cond.cleanup3, !dbg !1145

for.body4.lr.ph:                                  ; preds = %for.cond1.preheader
  %1 = mul nsw i64 %indvars.iv20, %0
  br label %for.body4, !dbg !1145

for.cond.cleanup.loopexit:                        ; preds = %for.cond.cleanup3
  br label %for.cond.cleanup, !dbg !1146

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %entry
  ret void, !dbg !1146

for.cond.cleanup3.loopexit:                       ; preds = %for.body4
  br label %for.cond.cleanup3, !dbg !1147

for.cond.cleanup3:                                ; preds = %for.cond.cleanup3.loopexit, %for.cond1.preheader
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1, !dbg !1147
  %exitcond24 = icmp eq i64 %indvars.iv.next21, %wide.trip.count23, !dbg !1142
  br i1 %exitcond24, label %for.cond.cleanup.loopexit, label %for.cond1.preheader, !dbg !1143, !llvm.loop !955

for.body4:                                        ; preds = %for.body4, %for.body4.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body4.lr.ph ], [ %indvars.iv.next, %for.body4 ]
  %call = tail call i32 @rand() #9, !dbg !1148
  %conv = sitofp i32 %call to float, !dbg !1148
  %div = fmul float %conv, 0x3E00000000000000, !dbg !1149
  %2 = add nsw i64 %indvars.iv, %1, !dbg !1150
  %arrayidx = getelementptr inbounds float, float* %I, i64 %2, !dbg !1151
  store float %div, float* %arrayidx, align 4, !dbg !1152, !tbaa !620
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !1153
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count, !dbg !1154
  br i1 %exitcond, label %for.cond.cleanup3.loopexit, label %for.body4, !dbg !1145, !llvm.loop !977
}

; Function Attrs: nounwind
declare double @exp(double) local_unnamed_addr #3

declare i32 @cudaMemcpy(i8*, i8*, i64, i32) local_unnamed_addr #7

declare i32 @cudaDeviceSynchronize() local_unnamed_addr #7

declare i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) local_unnamed_addr #7

declare i32 @cudaThreadSynchronize() local_unnamed_addr #7

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

declare i32 @cudaFree(i8*) local_unnamed_addr #7

; Function Attrs: nounwind
declare void @srand(i32) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @rand() local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @strtod(i8* readonly, i8** nocapture) local_unnamed_addr #3

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #8

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #9

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #9

declare i32 @putchar(i32)

attributes #0 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind readnone }
attributes #9 = { nounwind }
attributes #10 = { cold }
attributes #11 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!587, !588}
!llvm.ident = !{!589}

!0 = !DIGlobalVariableExpression(var: !1)
!1 = distinct !DIGlobalVariable(name: "duration", scope: !2, file: !3, line: 24, type: !21, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !3, producer: "clang version 5.0.0 (trunk 294196)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !20, globals: !30, imports: !31)
!3 = !DIFile(filename: "srad.cu", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/srad_v2llvm")
!4 = !{!5, !13}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaLimit", file: !6, line: 1145, size: 32, elements: !7, identifier: "_ZTS9cudaLimit")
!6 = !DIFile(filename: "/usr/local/cuda/include/driver_types.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/srad_v2llvm")
!7 = !{!8, !9, !10, !11, !12}
!8 = !DIEnumerator(name: "cudaLimitStackSize", value: 0)
!9 = !DIEnumerator(name: "cudaLimitPrintfFifoSize", value: 1)
!10 = !DIEnumerator(name: "cudaLimitMallocHeapSize", value: 2)
!11 = !DIEnumerator(name: "cudaLimitDevRuntimeSyncDepth", value: 3)
!12 = !DIEnumerator(name: "cudaLimitDevRuntimePendingLaunchCount", value: 4)
!13 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaMemcpyKind", file: !6, line: 796, size: 32, elements: !14, identifier: "_ZTS14cudaMemcpyKind")
!14 = !{!15, !16, !17, !18, !19}
!15 = !DIEnumerator(name: "cudaMemcpyHostToHost", value: 0)
!16 = !DIEnumerator(name: "cudaMemcpyHostToDevice", value: 1)
!17 = !DIEnumerator(name: "cudaMemcpyDeviceToHost", value: 2)
!18 = !DIEnumerator(name: "cudaMemcpyDeviceToDevice", value: 3)
!19 = !DIEnumerator(name: "cudaMemcpyDefault", value: 4)
!20 = !{!21, !22, !24, !23, !26, !27}
!21 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!26 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!29 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!30 = !{!0}
!31 = !{!32, !39, !43, !45, !47, !49, !51, !55, !57, !59, !61, !63, !65, !67, !69, !71, !73, !75, !77, !79, !81, !83, !87, !89, !91, !93, !97, !102, !104, !106, !111, !115, !117, !119, !121, !123, !125, !127, !129, !131, !136, !140, !142, !144, !148, !150, !152, !154, !156, !158, !162, !164, !166, !170, !176, !180, !182, !184, !188, !190, !192, !196, !198, !200, !204, !206, !208, !210, !212, !214, !216, !218, !220, !222, !227, !229, !231, !235, !237, !239, !241, !243, !245, !247, !249, !253, !257, !259, !261, !266, !268, !270, !272, !274, !276, !278, !282, !288, !292, !296, !301, !306, !312, !316, !330, !334, !338, !342, !346, !350, !352, !356, !360, !364, !372, !376, !380, !384, !388, !393, !398, !402, !406, !408, !416, !420, !428, !430, !432, !436, !440, !444, !449, !453, !458, !459, !460, !461, !464, !465, !466, !467, !468, !469, !470, !473, !475, !477, !479, !481, !483, !485, !487, !490, !492, !494, !496, !498, !500, !502, !504, !506, !508, !510, !512, !514, !516, !518, !520, !522, !524, !526, !528, !530, !532, !534, !536, !538, !540, !542, !544, !546, !548, !550, !552, !554, !558, !559, !561, !563, !565, !567, !569, !571, !573, !575, !577, !579, !581, !583, !585}
!32 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !35, line: 201)
!33 = !DINamespace(name: "std", scope: null, file: !34, line: 195)
!34 = !DIFile(filename: "/home/dshen/llvm/build/bin/../lib/clang/5.0.0/include/__clang_cuda_math_forward_declares.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/srad_v2llvm")
!35 = !DISubprogram(name: "abs", linkageName: "_ZL3absx", scope: !34, file: !34, line: 44, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!36 = !DISubroutineType(types: !37)
!37 = !{!38, !38}
!38 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!39 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !40, line: 202)
!40 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !34, file: !34, line: 46, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!41 = !DISubroutineType(types: !42)
!42 = !{!23, !23}
!43 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !44, line: 203)
!44 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !34, file: !34, line: 48, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!45 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !46, line: 204)
!46 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !34, file: !34, line: 50, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!47 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !48, line: 205)
!48 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !34, file: !34, line: 52, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!49 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !50, line: 206)
!50 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !34, file: !34, line: 56, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!51 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !52, line: 207)
!52 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !34, file: !34, line: 54, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!53 = !DISubroutineType(types: !54)
!54 = !{!23, !23, !23}
!55 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !56, line: 208)
!56 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !34, file: !34, line: 58, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!57 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !58, line: 209)
!58 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !34, file: !34, line: 60, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!59 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !60, line: 210)
!60 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !34, file: !34, line: 62, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!61 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !62, line: 211)
!62 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !34, file: !34, line: 64, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!63 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !64, line: 212)
!64 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !34, file: !34, line: 66, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!65 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !66, line: 213)
!66 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !34, file: !34, line: 68, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!67 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !68, line: 214)
!68 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !34, file: !34, line: 72, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!69 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !70, line: 215)
!70 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !34, file: !34, line: 70, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!71 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !72, line: 216)
!72 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !34, file: !34, line: 76, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!73 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !74, line: 217)
!74 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !34, file: !34, line: 74, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!75 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !76, line: 218)
!76 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !34, file: !34, line: 78, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!77 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !78, line: 219)
!78 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !34, file: !34, line: 80, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!79 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !80, line: 220)
!80 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !34, file: !34, line: 82, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!81 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !82, line: 221)
!82 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !34, file: !34, line: 84, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!83 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !84, line: 222)
!84 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !34, file: !34, line: 86, type: !85, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!85 = !DISubroutineType(types: !86)
!86 = !{!23, !23, !23, !23}
!87 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !88, line: 223)
!88 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !34, file: !34, line: 88, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!89 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !90, line: 224)
!90 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !34, file: !34, line: 90, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!91 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !92, line: 225)
!92 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !34, file: !34, line: 92, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!93 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !94, line: 226)
!94 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !34, file: !34, line: 94, type: !95, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!95 = !DISubroutineType(types: !96)
!96 = !{!26, !23}
!97 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !98, line: 227)
!98 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !34, file: !34, line: 96, type: !99, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!99 = !DISubroutineType(types: !100)
!100 = !{!23, !23, !101}
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!102 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !103, line: 228)
!103 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !34, file: !34, line: 98, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!104 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !105, line: 229)
!105 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !34, file: !34, line: 100, type: !95, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!106 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !107, line: 230)
!107 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !34, file: !34, line: 102, type: !108, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!108 = !DISubroutineType(types: !109)
!109 = !{!110, !23}
!110 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!111 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !112, line: 231)
!112 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !34, file: !34, line: 106, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!113 = !DISubroutineType(types: !114)
!114 = !{!110, !23, !23}
!115 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !116, line: 232)
!116 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !34, file: !34, line: 105, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!117 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !118, line: 233)
!118 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !34, file: !34, line: 108, type: !108, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !120, line: 234)
!120 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !34, file: !34, line: 112, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !122, line: 235)
!122 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !34, file: !34, line: 111, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !124, line: 236)
!124 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !34, file: !34, line: 114, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!125 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !126, line: 237)
!126 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !34, file: !34, line: 116, type: !108, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !128, line: 238)
!128 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !34, file: !34, line: 118, type: !108, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!129 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !130, line: 239)
!130 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !34, file: !34, line: 120, type: !113, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!131 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !132, line: 240)
!132 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !34, file: !34, line: 121, type: !133, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!133 = !DISubroutineType(types: !134)
!134 = !{!135, !135}
!135 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!136 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !137, line: 241)
!137 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !34, file: !34, line: 123, type: !138, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!138 = !DISubroutineType(types: !139)
!139 = !{!23, !23, !26}
!140 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !141, line: 242)
!141 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !34, file: !34, line: 125, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!142 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !143, line: 243)
!143 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !34, file: !34, line: 126, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!144 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !145, line: 244)
!145 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !34, file: !34, line: 128, type: !146, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!146 = !DISubroutineType(types: !147)
!147 = !{!38, !23}
!148 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !149, line: 245)
!149 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !34, file: !34, line: 138, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!150 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !151, line: 246)
!151 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !34, file: !34, line: 130, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !153, line: 247)
!153 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !34, file: !34, line: 132, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!154 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !155, line: 248)
!155 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !34, file: !34, line: 134, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !157, line: 249)
!157 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !34, file: !34, line: 136, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!158 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !159, line: 250)
!159 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !34, file: !34, line: 140, type: !160, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!160 = !DISubroutineType(types: !161)
!161 = !{!135, !23}
!162 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !163, line: 251)
!163 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !34, file: !34, line: 142, type: !160, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!164 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !165, line: 252)
!165 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !34, file: !34, line: 143, type: !146, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!166 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !167, line: 253)
!167 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !34, file: !34, line: 145, type: !168, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!168 = !DISubroutineType(types: !169)
!169 = !{!23, !23, !22}
!170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !171, line: 254)
!171 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !34, file: !34, line: 146, type: !172, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!172 = !DISubroutineType(types: !173)
!173 = !{!21, !174}
!174 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !175, size: 64)
!175 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !29)
!176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !177, line: 255)
!177 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !34, file: !34, line: 147, type: !178, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!178 = !DISubroutineType(types: !179)
!179 = !{!23, !174}
!180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !181, line: 256)
!181 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !34, file: !34, line: 149, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !183, line: 257)
!183 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !34, file: !34, line: 151, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !185, line: 258)
!185 = !DISubprogram(name: "nexttoward", linkageName: "_ZL10nexttowardfd", scope: !34, file: !34, line: 153, type: !186, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!186 = !DISubroutineType(types: !187)
!187 = !{!23, !23, !21}
!188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !189, line: 259)
!189 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !34, file: !34, line: 158, type: !138, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !191, line: 260)
!191 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !34, file: !34, line: 160, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !193, line: 261)
!193 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !34, file: !34, line: 162, type: !194, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!194 = !DISubroutineType(types: !195)
!195 = !{!23, !23, !23, !101}
!196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !197, line: 262)
!197 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !34, file: !34, line: 164, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !199, line: 263)
!199 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !34, file: !34, line: 166, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !201, line: 264)
!201 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !34, file: !34, line: 168, type: !202, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!202 = !DISubroutineType(types: !203)
!203 = !{!23, !23, !135}
!204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !205, line: 265)
!205 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !34, file: !34, line: 170, type: !138, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!206 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !207, line: 266)
!207 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !34, file: !34, line: 172, type: !108, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !209, line: 267)
!209 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !34, file: !34, line: 174, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !211, line: 268)
!211 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !34, file: !34, line: 176, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !213, line: 269)
!213 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !34, file: !34, line: 178, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !215, line: 270)
!215 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !34, file: !34, line: 180, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !217, line: 271)
!217 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !34, file: !34, line: 182, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !219, line: 272)
!219 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !34, file: !34, line: 184, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !221, line: 273)
!221 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !34, file: !34, line: 186, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !223, line: 102)
!223 = !DISubprogram(name: "acos", scope: !224, file: !224, line: 54, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!224 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/srad_v2llvm")
!225 = !DISubroutineType(types: !226)
!226 = !{!21, !21}
!227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !228, line: 121)
!228 = !DISubprogram(name: "asin", scope: !224, file: !224, line: 56, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!229 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !230, line: 140)
!230 = !DISubprogram(name: "atan", scope: !224, file: !224, line: 58, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!231 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !232, line: 159)
!232 = !DISubprogram(name: "atan2", scope: !224, file: !224, line: 60, type: !233, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!233 = !DISubroutineType(types: !234)
!234 = !{!21, !21, !21}
!235 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !236, line: 180)
!236 = !DISubprogram(name: "ceil", scope: !224, file: !224, line: 178, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!237 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !238, line: 199)
!238 = !DISubprogram(name: "cos", scope: !224, file: !224, line: 63, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!239 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !240, line: 218)
!240 = !DISubprogram(name: "cosh", scope: !224, file: !224, line: 72, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!241 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !242, line: 237)
!242 = !DISubprogram(name: "exp", scope: !224, file: !224, line: 100, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!243 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !244, line: 256)
!244 = !DISubprogram(name: "fabs", scope: !224, file: !224, line: 181, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!245 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !246, line: 275)
!246 = !DISubprogram(name: "floor", scope: !224, file: !224, line: 184, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !248, line: 294)
!248 = !DISubprogram(name: "fmod", scope: !224, file: !224, line: 187, type: !233, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!249 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !250, line: 315)
!250 = !DISubprogram(name: "frexp", scope: !224, file: !224, line: 103, type: !251, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!251 = !DISubroutineType(types: !252)
!252 = !{!21, !21, !101}
!253 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !254, line: 334)
!254 = !DISubprogram(name: "ldexp", scope: !224, file: !224, line: 106, type: !255, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!255 = !DISubroutineType(types: !256)
!256 = !{!21, !21, !26}
!257 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !258, line: 353)
!258 = !DISubprogram(name: "log", scope: !224, file: !224, line: 109, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!259 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !260, line: 372)
!260 = !DISubprogram(name: "log10", scope: !224, file: !224, line: 112, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !262, line: 391)
!262 = !DISubprogram(name: "modf", scope: !224, file: !224, line: 115, type: !263, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!263 = !DISubroutineType(types: !264)
!264 = !{!21, !21, !265}
!265 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !267, line: 403)
!267 = !DISubprogram(name: "pow", scope: !224, file: !224, line: 153, type: !233, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !269, line: 440)
!269 = !DISubprogram(name: "sin", scope: !224, file: !224, line: 65, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!270 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !271, line: 459)
!271 = !DISubprogram(name: "sinh", scope: !224, file: !224, line: 74, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!272 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !273, line: 478)
!273 = !DISubprogram(name: "sqrt", scope: !224, file: !224, line: 156, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!274 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !275, line: 497)
!275 = !DISubprogram(name: "tan", scope: !224, file: !224, line: 67, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!276 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !277, line: 516)
!277 = !DISubprogram(name: "tanh", scope: !224, file: !224, line: 76, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !279, line: 118)
!279 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !280, line: 101, baseType: !281)
!280 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/srad_v2llvm")
!281 = !DICompositeType(tag: DW_TAG_structure_type, file: !280, line: 97, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !283, line: 119)
!283 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !280, line: 109, baseType: !284)
!284 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !280, line: 105, size: 128, elements: !285, identifier: "_ZTS6ldiv_t")
!285 = !{!286, !287}
!286 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !284, file: !280, line: 107, baseType: !135, size: 64)
!287 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !284, file: !280, line: 108, baseType: !135, size: 64, offset: 64)
!288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !289, line: 121)
!289 = !DISubprogram(name: "abort", scope: !280, file: !280, line: 515, type: !290, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: true)
!290 = !DISubroutineType(types: !291)
!291 = !{null}
!292 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !293, line: 122)
!293 = !DISubprogram(name: "abs", scope: !280, file: !280, line: 775, type: !294, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!294 = !DISubroutineType(types: !295)
!295 = !{!26, !26}
!296 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !297, line: 123)
!297 = !DISubprogram(name: "atexit", scope: !280, file: !280, line: 519, type: !298, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!298 = !DISubroutineType(types: !299)
!299 = !{!26, !300}
!300 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !290, size: 64)
!301 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !302, line: 129)
!302 = distinct !DISubprogram(name: "atof", scope: !303, file: !303, line: 26, type: !172, isLocal: false, isDefinition: true, scopeLine: 27, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !304)
!303 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/srad_v2llvm")
!304 = !{!305}
!305 = !DILocalVariable(name: "__nptr", arg: 1, scope: !302, file: !303, line: 26, type: !174)
!306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !307, line: 130)
!307 = distinct !DISubprogram(name: "atoi", scope: !280, file: !280, line: 278, type: !308, isLocal: false, isDefinition: true, scopeLine: 279, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !310)
!308 = !DISubroutineType(types: !309)
!309 = !{!26, !174}
!310 = !{!311}
!311 = !DILocalVariable(name: "__nptr", arg: 1, scope: !307, file: !280, line: 278, type: !174)
!312 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !313, line: 131)
!313 = !DISubprogram(name: "atol", scope: !280, file: !280, line: 283, type: !314, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!314 = !DISubroutineType(types: !315)
!315 = !{!135, !174}
!316 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !317, line: 132)
!317 = !DISubprogram(name: "bsearch", scope: !318, file: !318, line: 20, type: !319, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!318 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdlib-bsearch.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/srad_v2llvm")
!319 = !DISubroutineType(types: !320)
!320 = !{!25, !321, !321, !323, !323, !326}
!321 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !322, size: 64)
!322 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!323 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !324, line: 62, baseType: !325)
!324 = !DIFile(filename: "/home/dshen/llvm/build/bin/../lib/clang/5.0.0/include/stddef.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/srad_v2llvm")
!325 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!326 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !280, line: 742, baseType: !327)
!327 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !328, size: 64)
!328 = !DISubroutineType(types: !329)
!329 = !{!26, !321, !321}
!330 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !331, line: 133)
!331 = !DISubprogram(name: "calloc", scope: !280, file: !280, line: 468, type: !332, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!332 = !DISubroutineType(types: !333)
!333 = !{!25, !323, !323}
!334 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !335, line: 134)
!335 = !DISubprogram(name: "div", scope: !280, file: !280, line: 789, type: !336, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!336 = !DISubroutineType(types: !337)
!337 = !{!279, !26, !26}
!338 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !339, line: 135)
!339 = !DISubprogram(name: "exit", scope: !280, file: !280, line: 543, type: !340, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: true)
!340 = !DISubroutineType(types: !341)
!341 = !{null, !26}
!342 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !343, line: 136)
!343 = !DISubprogram(name: "free", scope: !280, file: !280, line: 483, type: !344, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!344 = !DISubroutineType(types: !345)
!345 = !{null, !25}
!346 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !347, line: 137)
!347 = !DISubprogram(name: "getenv", scope: !280, file: !280, line: 564, type: !348, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!348 = !DISubroutineType(types: !349)
!349 = !{!28, !174}
!350 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !351, line: 138)
!351 = !DISubprogram(name: "labs", scope: !280, file: !280, line: 776, type: !133, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!352 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !353, line: 139)
!353 = !DISubprogram(name: "ldiv", scope: !280, file: !280, line: 791, type: !354, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!354 = !DISubroutineType(types: !355)
!355 = !{!283, !135, !135}
!356 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !357, line: 140)
!357 = !DISubprogram(name: "malloc", scope: !280, file: !280, line: 466, type: !358, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!358 = !DISubroutineType(types: !359)
!359 = !{!25, !323}
!360 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !361, line: 142)
!361 = !DISubprogram(name: "mblen", scope: !280, file: !280, line: 863, type: !362, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!362 = !DISubroutineType(types: !363)
!363 = !{!26, !174, !323}
!364 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !365, line: 143)
!365 = !DISubprogram(name: "mbstowcs", scope: !280, file: !280, line: 874, type: !366, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!366 = !DISubroutineType(types: !367)
!367 = !{!323, !368, !371, !323}
!368 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !369)
!369 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !370, size: 64)
!370 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!371 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !174)
!372 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !373, line: 144)
!373 = !DISubprogram(name: "mbtowc", scope: !280, file: !280, line: 866, type: !374, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!374 = !DISubroutineType(types: !375)
!375 = !{!26, !368, !371, !323}
!376 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !377, line: 146)
!377 = !DISubprogram(name: "qsort", scope: !280, file: !280, line: 765, type: !378, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!378 = !DISubroutineType(types: !379)
!379 = !{null, !25, !323, !323, !326}
!380 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !381, line: 152)
!381 = !DISubprogram(name: "rand", scope: !280, file: !280, line: 374, type: !382, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!382 = !DISubroutineType(types: !383)
!383 = !{!26}
!384 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !385, line: 153)
!385 = !DISubprogram(name: "realloc", scope: !280, file: !280, line: 480, type: !386, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!386 = !DISubroutineType(types: !387)
!387 = !{!25, !25, !323}
!388 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !389, line: 154)
!389 = !DISubprogram(name: "srand", scope: !280, file: !280, line: 376, type: !390, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!390 = !DISubroutineType(types: !391)
!391 = !{null, !392}
!392 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!393 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !394, line: 155)
!394 = !DISubprogram(name: "strtod", scope: !280, file: !280, line: 164, type: !395, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!395 = !DISubroutineType(types: !396)
!396 = !{!21, !371, !397}
!397 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !27)
!398 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !399, line: 156)
!399 = !DISubprogram(name: "strtol", scope: !280, file: !280, line: 183, type: !400, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!400 = !DISubroutineType(types: !401)
!401 = !{!135, !371, !397, !26}
!402 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !403, line: 157)
!403 = !DISubprogram(name: "strtoul", scope: !280, file: !280, line: 187, type: !404, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!404 = !DISubroutineType(types: !405)
!405 = !{!325, !371, !397, !26}
!406 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !407, line: 158)
!407 = !DISubprogram(name: "system", scope: !280, file: !280, line: 717, type: !308, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!408 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !409, line: 160)
!409 = !DISubprogram(name: "wcstombs", scope: !280, file: !280, line: 877, type: !410, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!410 = !DISubroutineType(types: !411)
!411 = !{!323, !412, !413, !323}
!412 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !28)
!413 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !414)
!414 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !415, size: 64)
!415 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !370)
!416 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !417, line: 161)
!417 = !DISubprogram(name: "wctomb", scope: !280, file: !280, line: 870, type: !418, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!418 = !DISubroutineType(types: !419)
!419 = !{!26, !28, !370}
!420 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !421, entity: !423, line: 201)
!421 = !DINamespace(name: "__gnu_cxx", scope: null, file: !422, line: 68)
!422 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/bits/cpp_type_traits.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/srad_v2llvm")
!423 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !280, line: 121, baseType: !424)
!424 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !280, line: 117, size: 128, elements: !425, identifier: "_ZTS7lldiv_t")
!425 = !{!426, !427}
!426 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !424, file: !280, line: 119, baseType: !38, size: 64)
!427 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !424, file: !280, line: 120, baseType: !38, size: 64, offset: 64)
!428 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !421, entity: !429, line: 207)
!429 = !DISubprogram(name: "_Exit", scope: !280, file: !280, line: 557, type: !340, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: true)
!430 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !421, entity: !431, line: 211)
!431 = !DISubprogram(name: "llabs", scope: !280, file: !280, line: 780, type: !36, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!432 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !421, entity: !433, line: 217)
!433 = !DISubprogram(name: "lldiv", scope: !280, file: !280, line: 797, type: !434, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!434 = !DISubroutineType(types: !435)
!435 = !{!423, !38, !38}
!436 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !421, entity: !437, line: 228)
!437 = !DISubprogram(name: "atoll", scope: !280, file: !280, line: 292, type: !438, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!438 = !DISubroutineType(types: !439)
!439 = !{!38, !174}
!440 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !421, entity: !441, line: 229)
!441 = !DISubprogram(name: "strtoll", scope: !280, file: !280, line: 209, type: !442, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!442 = !DISubroutineType(types: !443)
!443 = !{!38, !371, !397, !26}
!444 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !421, entity: !445, line: 230)
!445 = !DISubprogram(name: "strtoull", scope: !280, file: !280, line: 214, type: !446, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!446 = !DISubroutineType(types: !447)
!447 = !{!448, !371, !397, !26}
!448 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!449 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !421, entity: !450, line: 232)
!450 = !DISubprogram(name: "strtof", scope: !280, file: !280, line: 172, type: !451, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!451 = !DISubroutineType(types: !452)
!452 = !{!23, !371, !397}
!453 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !421, entity: !454, line: 233)
!454 = !DISubprogram(name: "strtold", scope: !280, file: !280, line: 175, type: !455, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!455 = !DISubroutineType(types: !456)
!456 = !{!457, !371, !397}
!457 = !DIBasicType(name: "long double", size: 128, encoding: DW_ATE_float)
!458 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !423, line: 241)
!459 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !429, line: 243)
!460 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !431, line: 245)
!461 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !462, line: 246)
!462 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !421, file: !463, line: 214, type: !434, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!463 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/cstdlib", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/srad_v2llvm")
!464 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !433, line: 247)
!465 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !437, line: 249)
!466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !450, line: 250)
!467 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !441, line: 251)
!468 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !445, line: 252)
!469 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !454, line: 253)
!470 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !471, line: 418)
!471 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !472, file: !472, line: 1126, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!472 = !DIFile(filename: "/usr/local/cuda/include/math_functions.hpp", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/srad_v2llvm")
!473 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !474, line: 419)
!474 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !472, file: !472, line: 1154, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!475 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !476, line: 420)
!476 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !472, file: !472, line: 1121, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!477 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !478, line: 421)
!478 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !472, file: !472, line: 1159, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!479 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !480, line: 422)
!480 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !472, file: !472, line: 1111, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!481 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !482, line: 423)
!482 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !472, file: !472, line: 1116, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!483 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !484, line: 424)
!484 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !472, file: !472, line: 1164, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!485 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !486, line: 425)
!486 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !472, file: !472, line: 1199, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!487 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !488, line: 426)
!488 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !489, file: !489, line: 647, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!489 = !DIFile(filename: "/usr/local/cuda/include/device_functions.hpp", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/srad_v2llvm")
!490 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !491, line: 427)
!491 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !472, file: !472, line: 973, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!492 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !493, line: 428)
!493 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !472, file: !472, line: 1027, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !495, line: 429)
!495 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !472, file: !472, line: 1096, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !497, line: 430)
!497 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !472, file: !472, line: 1259, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !499, line: 431)
!499 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !472, file: !472, line: 1249, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !501, line: 432)
!501 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !489, file: !489, line: 637, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !503, line: 433)
!503 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !472, file: !472, line: 1078, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!504 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !505, line: 434)
!505 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !472, file: !472, line: 1169, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !507, line: 435)
!507 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !489, file: !489, line: 582, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!508 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !509, line: 436)
!509 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !472, file: !472, line: 1385, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !511, line: 437)
!511 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !489, file: !489, line: 572, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!512 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !513, line: 438)
!513 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !472, file: !472, line: 1337, type: !85, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!514 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !515, line: 439)
!515 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !489, file: !489, line: 602, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!516 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !517, line: 440)
!517 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !489, file: !489, line: 597, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!518 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !519, line: 441)
!519 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !472, file: !472, line: 1322, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!520 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !521, line: 442)
!521 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !472, file: !472, line: 1312, type: !99, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!522 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !523, line: 443)
!523 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !472, file: !472, line: 1174, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !525, line: 444)
!525 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !472, file: !472, line: 1390, type: !95, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!526 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !527, line: 445)
!527 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !472, file: !472, line: 1289, type: !138, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !529, line: 446)
!529 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !472, file: !472, line: 1284, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!530 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !531, line: 447)
!531 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !472, file: !472, line: 933, type: !146, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!532 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !533, line: 448)
!533 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !472, file: !472, line: 1371, type: !146, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!534 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !535, line: 449)
!535 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !472, file: !472, line: 1140, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !537, line: 450)
!537 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !472, file: !472, line: 1149, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!538 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !539, line: 451)
!539 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !472, file: !472, line: 1069, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !541, line: 452)
!541 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !472, file: !472, line: 1395, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !543, line: 453)
!543 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !472, file: !472, line: 1131, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!544 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !545, line: 454)
!545 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !472, file: !472, line: 924, type: !160, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!546 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !547, line: 455)
!547 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !472, file: !472, line: 1376, type: !160, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!548 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !549, line: 456)
!549 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !472, file: !472, line: 1317, type: !168, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!550 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !551, line: 457)
!551 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !472, file: !472, line: 938, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!552 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !553, line: 458)
!553 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !472, file: !472, line: 1002, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!554 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !555, line: 459)
!555 = !DISubprogram(name: "nexttowardf", scope: !224, file: !224, line: 284, type: !556, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!556 = !DISubroutineType(types: !557)
!557 = !{!23, !23, !457}
!558 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !555, line: 460)
!559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !560, line: 461)
!560 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !472, file: !472, line: 1352, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !562, line: 462)
!562 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !472, file: !472, line: 1327, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !564, line: 463)
!564 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !472, file: !472, line: 1332, type: !194, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !566, line: 464)
!566 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !472, file: !472, line: 919, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!567 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !568, line: 465)
!568 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !472, file: !472, line: 1366, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !570, line: 466)
!570 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !472, file: !472, line: 1299, type: !202, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !572, line: 467)
!572 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !472, file: !472, line: 1294, type: !138, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!573 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !574, line: 468)
!574 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !472, file: !472, line: 1018, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!575 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !576, line: 469)
!576 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !472, file: !472, line: 1101, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!577 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !578, line: 470)
!578 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !489, file: !489, line: 887, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!579 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !580, line: 471)
!580 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !472, file: !472, line: 1060, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!581 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !582, line: 472)
!582 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !472, file: !472, line: 1106, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!583 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !584, line: 473)
!584 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !472, file: !472, line: 1361, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!585 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !33, entity: !586, line: 474)
!586 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !489, file: !489, line: 642, type: !41, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!587 = !{i32 2, !"Dwarf Version", i32 4}
!588 = !{i32 2, !"Debug Info Version", i32 3}
!589 = !{!"clang version 5.0.0 (trunk 294196)"}
!590 = distinct !DISubprogram(name: "srad_cuda_1", linkageName: "_Z11srad_cuda_1PfS_S_S_S_S_iif", scope: !591, file: !591, line: 5, type: !592, isLocal: false, isDefinition: true, scopeLine: 16, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !594)
!591 = !DIFile(filename: "./srad_kernel.cu", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/srad_v2llvm")
!592 = !DISubroutineType(types: !593)
!593 = !{null, !22, !22, !22, !22, !22, !22, !26, !26, !23}
!594 = !{!595, !596, !597, !598, !599, !600, !601, !602, !603}
!595 = !DILocalVariable(name: "E_C", arg: 1, scope: !590, file: !591, line: 6, type: !22)
!596 = !DILocalVariable(name: "W_C", arg: 2, scope: !590, file: !591, line: 7, type: !22)
!597 = !DILocalVariable(name: "N_C", arg: 3, scope: !590, file: !591, line: 8, type: !22)
!598 = !DILocalVariable(name: "S_C", arg: 4, scope: !590, file: !591, line: 9, type: !22)
!599 = !DILocalVariable(name: "J_cuda", arg: 5, scope: !590, file: !591, line: 10, type: !22)
!600 = !DILocalVariable(name: "C_cuda", arg: 6, scope: !590, file: !591, line: 11, type: !22)
!601 = !DILocalVariable(name: "cols", arg: 7, scope: !590, file: !591, line: 12, type: !26)
!602 = !DILocalVariable(name: "rows", arg: 8, scope: !590, file: !591, line: 13, type: !26)
!603 = !DILocalVariable(name: "q0sqr", arg: 9, scope: !590, file: !591, line: 14, type: !23)
!604 = !DIExpression()
!605 = !DILocation(line: 6, column: 12, scope: !590)
!606 = !{!607, !607, i64 0}
!607 = !{!"any pointer", !608, i64 0}
!608 = !{!"omnipotent char", !609, i64 0}
!609 = !{!"Simple C++ TBAA"}
!610 = !DILocation(line: 7, column: 12, scope: !590)
!611 = !DILocation(line: 8, column: 12, scope: !590)
!612 = !DILocation(line: 9, column: 12, scope: !590)
!613 = !DILocation(line: 10, column: 13, scope: !590)
!614 = !DILocation(line: 11, column: 13, scope: !590)
!615 = !DILocation(line: 12, column: 9, scope: !590)
!616 = !{!617, !617, i64 0}
!617 = !{!"int", !608, i64 0}
!618 = !DILocation(line: 13, column: 9, scope: !590)
!619 = !DILocation(line: 14, column: 11, scope: !590)
!620 = !{!621, !621, i64 0}
!621 = !{!"float", !608, i64 0}
!622 = !DILocation(line: 16, column: 1, scope: !590)
!623 = !DILocation(line: 16, column: 1, scope: !624)
!624 = !DILexicalBlockFile(scope: !590, file: !591, discriminator: 1)
!625 = !DILocation(line: 16, column: 1, scope: !626)
!626 = !DILexicalBlockFile(scope: !590, file: !591, discriminator: 2)
!627 = !DILocation(line: 16, column: 1, scope: !628)
!628 = !DILexicalBlockFile(scope: !590, file: !591, discriminator: 3)
!629 = !DILocation(line: 16, column: 1, scope: !630)
!630 = !DILexicalBlockFile(scope: !590, file: !591, discriminator: 4)
!631 = !DILocation(line: 16, column: 1, scope: !632)
!632 = !DILexicalBlockFile(scope: !590, file: !591, discriminator: 5)
!633 = !DILocation(line: 16, column: 1, scope: !634)
!634 = !DILexicalBlockFile(scope: !590, file: !591, discriminator: 6)
!635 = !DILocation(line: 16, column: 1, scope: !636)
!636 = !DILexicalBlockFile(scope: !590, file: !591, discriminator: 7)
!637 = !DILocation(line: 16, column: 1, scope: !638)
!638 = !DILexicalBlockFile(scope: !590, file: !591, discriminator: 8)
!639 = !DILocation(line: 16, column: 1, scope: !640)
!640 = !DILexicalBlockFile(scope: !590, file: !591, discriminator: 9)
!641 = !DILocation(line: 157, column: 1, scope: !590)
!642 = distinct !DISubprogram(name: "srad_cuda_2", linkageName: "_Z11srad_cuda_2PfS_S_S_S_S_iiff", scope: !591, file: !591, line: 160, type: !643, isLocal: false, isDefinition: true, scopeLine: 172, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !645)
!643 = !DISubroutineType(types: !644)
!644 = !{null, !22, !22, !22, !22, !22, !22, !26, !26, !23, !23}
!645 = !{!646, !647, !648, !649, !650, !651, !652, !653, !654, !655}
!646 = !DILocalVariable(name: "E_C", arg: 1, scope: !642, file: !591, line: 161, type: !22)
!647 = !DILocalVariable(name: "W_C", arg: 2, scope: !642, file: !591, line: 162, type: !22)
!648 = !DILocalVariable(name: "N_C", arg: 3, scope: !642, file: !591, line: 163, type: !22)
!649 = !DILocalVariable(name: "S_C", arg: 4, scope: !642, file: !591, line: 164, type: !22)
!650 = !DILocalVariable(name: "J_cuda", arg: 5, scope: !642, file: !591, line: 165, type: !22)
!651 = !DILocalVariable(name: "C_cuda", arg: 6, scope: !642, file: !591, line: 166, type: !22)
!652 = !DILocalVariable(name: "cols", arg: 7, scope: !642, file: !591, line: 167, type: !26)
!653 = !DILocalVariable(name: "rows", arg: 8, scope: !642, file: !591, line: 168, type: !26)
!654 = !DILocalVariable(name: "lambda", arg: 9, scope: !642, file: !591, line: 169, type: !23)
!655 = !DILocalVariable(name: "q0sqr", arg: 10, scope: !642, file: !591, line: 170, type: !23)
!656 = !DILocation(line: 161, column: 12, scope: !642)
!657 = !DILocation(line: 162, column: 12, scope: !642)
!658 = !DILocation(line: 163, column: 12, scope: !642)
!659 = !DILocation(line: 164, column: 12, scope: !642)
!660 = !DILocation(line: 165, column: 13, scope: !642)
!661 = !DILocation(line: 166, column: 13, scope: !642)
!662 = !DILocation(line: 167, column: 9, scope: !642)
!663 = !DILocation(line: 168, column: 9, scope: !642)
!664 = !DILocation(line: 169, column: 11, scope: !642)
!665 = !DILocation(line: 170, column: 11, scope: !642)
!666 = !DILocation(line: 172, column: 1, scope: !642)
!667 = !DILocation(line: 172, column: 1, scope: !668)
!668 = !DILexicalBlockFile(scope: !642, file: !591, discriminator: 1)
!669 = !DILocation(line: 172, column: 1, scope: !670)
!670 = !DILexicalBlockFile(scope: !642, file: !591, discriminator: 2)
!671 = !DILocation(line: 172, column: 1, scope: !672)
!672 = !DILexicalBlockFile(scope: !642, file: !591, discriminator: 3)
!673 = !DILocation(line: 172, column: 1, scope: !674)
!674 = !DILexicalBlockFile(scope: !642, file: !591, discriminator: 4)
!675 = !DILocation(line: 172, column: 1, scope: !676)
!676 = !DILexicalBlockFile(scope: !642, file: !591, discriminator: 5)
!677 = !DILocation(line: 172, column: 1, scope: !678)
!678 = !DILexicalBlockFile(scope: !642, file: !591, discriminator: 6)
!679 = !DILocation(line: 172, column: 1, scope: !680)
!680 = !DILexicalBlockFile(scope: !642, file: !591, discriminator: 7)
!681 = !DILocation(line: 172, column: 1, scope: !682)
!682 = !DILexicalBlockFile(scope: !642, file: !591, discriminator: 8)
!683 = !DILocation(line: 172, column: 1, scope: !684)
!684 = !DILexicalBlockFile(scope: !642, file: !591, discriminator: 9)
!685 = !DILocation(line: 172, column: 1, scope: !686)
!686 = !DILexicalBlockFile(scope: !642, file: !591, discriminator: 10)
!687 = !DILocation(line: 257, column: 1, scope: !642)
!688 = distinct !DISubprogram(name: "get_time", linkageName: "_Z8get_timev", scope: !3, file: !3, line: 15, type: !689, isLocal: false, isDefinition: true, scopeLine: 15, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !691)
!689 = !DISubroutineType(types: !690)
!690 = !{!21}
!691 = !{!692}
!692 = !DILocalVariable(name: "time", scope: !688, file: !3, line: 16, type: !693)
!693 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timeval", file: !694, line: 30, size: 128, elements: !695, identifier: "_ZTS7timeval")
!694 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/time.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/srad_v2llvm")
!695 = !{!696, !699}
!696 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !693, file: !694, line: 32, baseType: !697, size: 64)
!697 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !698, line: 139, baseType: !135)
!698 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/srad_v2llvm")
!699 = !DIDerivedType(tag: DW_TAG_member, name: "tv_usec", scope: !693, file: !694, line: 33, baseType: !700, size: 64, offset: 64)
!700 = !DIDerivedType(tag: DW_TAG_typedef, name: "__suseconds_t", file: !698, line: 141, baseType: !135)
!701 = !DILocation(line: 16, column: 5, scope: !688)
!702 = !DIExpression(DW_OP_deref)
!703 = !DILocation(line: 16, column: 20, scope: !688)
!704 = !DILocation(line: 17, column: 9, scope: !705)
!705 = distinct !DILexicalBlock(scope: !688, file: !3, line: 17, column: 9)
!706 = !DILocation(line: 17, column: 9, scope: !688)
!707 = !DILocation(line: 21, column: 25, scope: !688)
!708 = !{!709, !710, i64 0}
!709 = !{!"_ZTS7timeval", !710, i64 0, !710, i64 8}
!710 = !{!"long", !608, i64 0}
!711 = !DILocation(line: 21, column: 20, scope: !688)
!712 = !DILocation(line: 21, column: 47, scope: !688)
!713 = !{!709, !710, i64 8}
!714 = !DILocation(line: 21, column: 42, scope: !688)
!715 = !DILocation(line: 21, column: 55, scope: !688)
!716 = !DILocation(line: 21, column: 32, scope: !688)
!717 = !DILocation(line: 21, column: 5, scope: !688)
!718 = !DILocation(line: 22, column: 1, scope: !688)
!719 = distinct !DISubprogram(name: "usage", linkageName: "_Z5usageiPPc", scope: !3, file: !3, line: 28, type: !720, isLocal: false, isDefinition: true, scopeLine: 29, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !722)
!720 = !DISubroutineType(types: !721)
!721 = !{null, !26, !27}
!722 = !{!723, !724}
!723 = !DILocalVariable(name: "argc", arg: 1, scope: !719, file: !3, line: 28, type: !26)
!724 = !DILocalVariable(name: "argv", arg: 2, scope: !719, file: !3, line: 28, type: !27)
!725 = !DILocation(line: 28, column: 16, scope: !719)
!726 = !DILocation(line: 28, column: 29, scope: !719)
!727 = !DILocation(line: 30, column: 10, scope: !719)
!728 = !DILocation(line: 30, column: 89, scope: !719)
!729 = !DILocation(line: 30, column: 2, scope: !719)
!730 = !DILocation(line: 31, column: 10, scope: !719)
!731 = !DILocation(line: 31, column: 2, scope: !719)
!732 = !DILocation(line: 32, column: 10, scope: !719)
!733 = !DILocation(line: 32, column: 2, scope: !719)
!734 = !DILocation(line: 33, column: 10, scope: !719)
!735 = !DILocation(line: 33, column: 2, scope: !719)
!736 = !DILocation(line: 34, column: 10, scope: !719)
!737 = !DILocation(line: 34, column: 2, scope: !719)
!738 = !DILocation(line: 35, column: 10, scope: !719)
!739 = !DILocation(line: 35, column: 2, scope: !719)
!740 = !DILocation(line: 36, column: 10, scope: !719)
!741 = !DILocation(line: 36, column: 2, scope: !719)
!742 = !DILocation(line: 37, column: 10, scope: !719)
!743 = !DILocation(line: 37, column: 2, scope: !719)
!744 = !DILocation(line: 38, column: 10, scope: !719)
!745 = !DILocation(line: 38, column: 2, scope: !719)
!746 = !DILocation(line: 40, column: 2, scope: !719)
!747 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 46, type: !748, isLocal: false, isDefinition: true, scopeLine: 47, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !750)
!748 = !DISubroutineType(types: !749)
!749 = !{!26, !26, !27}
!750 = !{!751, !752}
!751 = !DILocalVariable(name: "argc", arg: 1, scope: !747, file: !3, line: 46, type: !26)
!752 = !DILocalVariable(name: "argv", arg: 2, scope: !747, file: !3, line: 46, type: !27)
!753 = !DILocation(line: 46, column: 11, scope: !747)
!754 = !DILocation(line: 46, column: 24, scope: !747)
!755 = !DILocation(line: 48, column: 3, scope: !747)
!756 = !DILocation(line: 49, column: 5, scope: !747)
!757 = !DILocation(line: 51, column: 10, scope: !747)
!758 = !DILocation(line: 51, column: 26, scope: !747)
!759 = !{!760, !760, i64 0}
!760 = !{!"double", !608, i64 0}
!761 = !DILocation(line: 51, column: 2, scope: !747)
!762 = !DILocation(line: 52, column: 5, scope: !747)
!763 = distinct !DISubprogram(name: "runTest", linkageName: "_Z7runTestiPPc", scope: !3, file: !3, line: 57, type: !720, isLocal: false, isDefinition: true, scopeLine: 58, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !764)
!764 = !{!765, !766, !767, !768, !769, !770, !771, !772, !773, !774, !775, !776, !777, !778, !779, !780, !781, !782, !783, !784, !785, !786, !787, !788, !789, !790, !791, !792, !793, !795, !800, !804, !805, !806, !830, !831, !832, !833, !835}
!765 = !DILocalVariable(name: "argc", arg: 1, scope: !763, file: !3, line: 57, type: !26)
!766 = !DILocalVariable(name: "argv", arg: 2, scope: !763, file: !3, line: 57, type: !27)
!767 = !DILocalVariable(name: "rows", scope: !763, file: !3, line: 59, type: !26)
!768 = !DILocalVariable(name: "cols", scope: !763, file: !3, line: 59, type: !26)
!769 = !DILocalVariable(name: "size_I", scope: !763, file: !3, line: 59, type: !26)
!770 = !DILocalVariable(name: "size_R", scope: !763, file: !3, line: 59, type: !26)
!771 = !DILocalVariable(name: "niter", scope: !763, file: !3, line: 59, type: !26)
!772 = !DILocalVariable(name: "iter", scope: !763, file: !3, line: 59, type: !26)
!773 = !DILocalVariable(name: "I", scope: !763, file: !3, line: 60, type: !22)
!774 = !DILocalVariable(name: "J", scope: !763, file: !3, line: 60, type: !22)
!775 = !DILocalVariable(name: "lambda", scope: !763, file: !3, line: 60, type: !23)
!776 = !DILocalVariable(name: "q0sqr", scope: !763, file: !3, line: 60, type: !23)
!777 = !DILocalVariable(name: "sum", scope: !763, file: !3, line: 60, type: !23)
!778 = !DILocalVariable(name: "sum2", scope: !763, file: !3, line: 60, type: !23)
!779 = !DILocalVariable(name: "tmp", scope: !763, file: !3, line: 60, type: !23)
!780 = !DILocalVariable(name: "meanROI", scope: !763, file: !3, line: 60, type: !23)
!781 = !DILocalVariable(name: "varROI", scope: !763, file: !3, line: 60, type: !23)
!782 = !DILocalVariable(name: "J_cuda", scope: !763, file: !3, line: 73, type: !22)
!783 = !DILocalVariable(name: "C_cuda", scope: !763, file: !3, line: 74, type: !22)
!784 = !DILocalVariable(name: "E_C", scope: !763, file: !3, line: 75, type: !22)
!785 = !DILocalVariable(name: "W_C", scope: !763, file: !3, line: 75, type: !22)
!786 = !DILocalVariable(name: "N_C", scope: !763, file: !3, line: 75, type: !22)
!787 = !DILocalVariable(name: "S_C", scope: !763, file: !3, line: 75, type: !22)
!788 = !DILocalVariable(name: "r1", scope: !763, file: !3, line: 79, type: !392)
!789 = !DILocalVariable(name: "r2", scope: !763, file: !3, line: 79, type: !392)
!790 = !DILocalVariable(name: "c1", scope: !763, file: !3, line: 79, type: !392)
!791 = !DILocalVariable(name: "c2", scope: !763, file: !3, line: 79, type: !392)
!792 = !DILocalVariable(name: "c", scope: !763, file: !3, line: 80, type: !22)
!793 = !DILocalVariable(name: "k", scope: !794, file: !3, line: 160, type: !26)
!794 = distinct !DILexicalBlock(scope: !763, file: !3, line: 160, column: 5)
!795 = !DILocalVariable(name: "i", scope: !796, file: !3, line: 166, type: !26)
!796 = distinct !DILexicalBlock(scope: !797, file: !3, line: 166, column: 9)
!797 = distinct !DILexicalBlock(scope: !798, file: !3, line: 164, column: 35)
!798 = distinct !DILexicalBlock(scope: !799, file: !3, line: 164, column: 2)
!799 = distinct !DILexicalBlock(scope: !763, file: !3, line: 164, column: 2)
!800 = !DILocalVariable(name: "j", scope: !801, file: !3, line: 167, type: !26)
!801 = distinct !DILexicalBlock(scope: !802, file: !3, line: 167, column: 13)
!802 = distinct !DILexicalBlock(scope: !803, file: !3, line: 166, column: 36)
!803 = distinct !DILexicalBlock(scope: !796, file: !3, line: 166, column: 9)
!804 = !DILocalVariable(name: "block_x", scope: !797, file: !3, line: 235, type: !26)
!805 = !DILocalVariable(name: "block_y", scope: !797, file: !3, line: 236, type: !26)
!806 = !DILocalVariable(name: "dimBlock", scope: !797, file: !3, line: 238, type: !807)
!807 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !808, line: 427, baseType: !809)
!808 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/srad_v2llvm")
!809 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !808, line: 417, size: 96, elements: !810, identifier: "_ZTS4dim3")
!810 = !{!811, !812, !813, !814, !818, !827}
!811 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !809, file: !808, line: 419, baseType: !392, size: 32)
!812 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !809, file: !808, line: 419, baseType: !392, size: 32, offset: 32)
!813 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !809, file: !808, line: 419, baseType: !392, size: 32, offset: 64)
!814 = !DISubprogram(name: "dim3", scope: !809, file: !808, line: 421, type: !815, isLocal: false, isDefinition: false, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: true)
!815 = !DISubroutineType(types: !816)
!816 = !{null, !817, !392, !392, !392}
!817 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !809, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!818 = !DISubprogram(name: "dim3", scope: !809, file: !808, line: 422, type: !819, isLocal: false, isDefinition: false, scopeLine: 422, flags: DIFlagPrototyped, isOptimized: true)
!819 = !DISubroutineType(types: !820)
!820 = !{null, !817, !821}
!821 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !808, line: 383, baseType: !822)
!822 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !808, line: 190, size: 96, elements: !823, identifier: "_ZTS5uint3")
!823 = !{!824, !825, !826}
!824 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !822, file: !808, line: 192, baseType: !392, size: 32)
!825 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !822, file: !808, line: 192, baseType: !392, size: 32, offset: 32)
!826 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !822, file: !808, line: 192, baseType: !392, size: 32, offset: 64)
!827 = !DISubprogram(name: "operator uint3", linkageName: "_ZN4dim3cv5uint3Ev", scope: !809, file: !808, line: 423, type: !828, isLocal: false, isDefinition: false, scopeLine: 423, flags: DIFlagPrototyped, isOptimized: true)
!828 = !DISubroutineType(types: !829)
!829 = !{!821, !817}
!830 = !DILocalVariable(name: "dimGrid", scope: !797, file: !3, line: 239, type: !807)
!831 = !DILocalVariable(name: "time0", scope: !797, file: !3, line: 247, type: !21)
!832 = !DILocalVariable(name: "time1", scope: !797, file: !3, line: 254, type: !21)
!833 = !DILocalVariable(name: "i", scope: !834, file: !3, line: 267, type: !26)
!834 = distinct !DILexicalBlock(scope: !763, file: !3, line: 267, column: 2)
!835 = !DILocalVariable(name: "j", scope: !836, file: !3, line: 268, type: !26)
!836 = distinct !DILexicalBlock(scope: !837, file: !3, line: 268, column: 17)
!837 = distinct !DILexicalBlock(scope: !838, file: !3, line: 267, column: 32)
!838 = distinct !DILexicalBlock(scope: !834, file: !3, line: 267, column: 2)
!839 = !DILocation(line: 57, column: 14, scope: !763)
!840 = !DILocation(line: 57, column: 27, scope: !763)
!841 = !DILocation(line: 59, column: 34, scope: !763)
!842 = !DILocation(line: 62, column: 2, scope: !763)
!843 = !DILocation(line: 73, column: 2, scope: !763)
!844 = !DILocation(line: 74, column: 5, scope: !763)
!845 = !DILocation(line: 75, column: 2, scope: !763)
!846 = !DILocation(line: 84, column: 11, scope: !847)
!847 = distinct !DILexicalBlock(scope: !763, file: !3, line: 84, column: 6)
!848 = !DILocation(line: 84, column: 6, scope: !763)
!849 = !DILocation(line: 86, column: 15, scope: !850)
!850 = distinct !DILexicalBlock(scope: !847, file: !3, line: 85, column: 2)
!851 = !DILocation(line: 278, column: 1, scope: !307, inlinedAt: !852)
!852 = distinct !DILocation(line: 86, column: 10, scope: !850)
!853 = !DILocation(line: 280, column: 16, scope: !307, inlinedAt: !852)
!854 = !DILocation(line: 59, column: 6, scope: !763)
!855 = !DILocation(line: 87, column: 15, scope: !850)
!856 = !DILocation(line: 278, column: 1, scope: !307, inlinedAt: !857)
!857 = distinct !DILocation(line: 87, column: 10, scope: !850)
!858 = !DILocation(line: 280, column: 16, scope: !307, inlinedAt: !857)
!859 = !DILocation(line: 59, column: 12, scope: !763)
!860 = !DILocation(line: 88, column: 20, scope: !861)
!861 = distinct !DILexicalBlock(scope: !850, file: !3, line: 88, column: 7)
!862 = !DILocation(line: 89, column: 11, scope: !863)
!863 = distinct !DILexicalBlock(scope: !861, file: !3, line: 88, column: 36)
!864 = !DILocation(line: 89, column: 3, scope: !863)
!865 = !DILocation(line: 90, column: 3, scope: !863)
!866 = !DILocation(line: 101, column: 2, scope: !867)
!867 = distinct !DILexicalBlock(scope: !847, file: !3, line: 100, column: 9)
!868 = !DILocation(line: 92, column: 15, scope: !850)
!869 = !DILocation(line: 278, column: 1, scope: !307, inlinedAt: !870)
!870 = distinct !DILocation(line: 92, column: 10, scope: !850)
!871 = !DILocation(line: 280, column: 16, scope: !307, inlinedAt: !870)
!872 = !DILocation(line: 79, column: 15, scope: !763)
!873 = !DILocation(line: 93, column: 15, scope: !850)
!874 = !DILocation(line: 278, column: 1, scope: !307, inlinedAt: !875)
!875 = distinct !DILocation(line: 93, column: 10, scope: !850)
!876 = !DILocation(line: 280, column: 16, scope: !307, inlinedAt: !875)
!877 = !DILocation(line: 79, column: 19, scope: !763)
!878 = !DILocation(line: 94, column: 15, scope: !850)
!879 = !DILocation(line: 278, column: 1, scope: !307, inlinedAt: !880)
!880 = distinct !DILocation(line: 94, column: 10, scope: !850)
!881 = !DILocation(line: 280, column: 16, scope: !307, inlinedAt: !880)
!882 = !DILocation(line: 79, column: 23, scope: !763)
!883 = !DILocation(line: 95, column: 15, scope: !850)
!884 = !DILocation(line: 278, column: 1, scope: !307, inlinedAt: !885)
!885 = distinct !DILocation(line: 95, column: 10, scope: !850)
!886 = !DILocation(line: 280, column: 16, scope: !307, inlinedAt: !885)
!887 = !DILocation(line: 79, column: 27, scope: !763)
!888 = !DILocation(line: 96, column: 17, scope: !850)
!889 = !DILocation(line: 26, column: 1, scope: !302, inlinedAt: !890)
!890 = distinct !DILocation(line: 96, column: 12, scope: !850)
!891 = !DILocation(line: 28, column: 10, scope: !302, inlinedAt: !890)
!892 = !DILocation(line: 96, column: 12, scope: !850)
!893 = !DILocation(line: 60, column: 16, scope: !763)
!894 = !DILocation(line: 97, column: 16, scope: !850)
!895 = !DILocation(line: 278, column: 1, scope: !307, inlinedAt: !896)
!896 = distinct !DILocation(line: 97, column: 11, scope: !850)
!897 = !DILocation(line: 280, column: 16, scope: !307, inlinedAt: !896)
!898 = !DILocation(line: 106, column: 16, scope: !763)
!899 = !DILocation(line: 59, column: 18, scope: !763)
!900 = !DILocation(line: 107, column: 17, scope: !763)
!901 = !DILocation(line: 107, column: 20, scope: !763)
!902 = !DILocation(line: 107, column: 27, scope: !763)
!903 = !DILocation(line: 107, column: 30, scope: !763)
!904 = !DILocation(line: 107, column: 23, scope: !763)
!905 = !DILocation(line: 59, column: 26, scope: !763)
!906 = !DILocation(line: 109, column: 23, scope: !763)
!907 = !DILocation(line: 109, column: 30, scope: !763)
!908 = !DILocation(line: 109, column: 15, scope: !763)
!909 = !DILocation(line: 109, column: 6, scope: !763)
!910 = !DILocation(line: 60, column: 9, scope: !763)
!911 = !DILocation(line: 110, column: 18, scope: !763)
!912 = !DILocation(line: 110, column: 9, scope: !763)
!913 = !DILocation(line: 60, column: 13, scope: !763)
!914 = !DILocation(line: 146, column: 16, scope: !763)
!915 = !DILocation(line: 146, column: 5, scope: !763)
!916 = !DILocation(line: 147, column: 16, scope: !763)
!917 = !DILocation(line: 147, column: 5, scope: !763)
!918 = !DILocation(line: 148, column: 13, scope: !763)
!919 = !DILocation(line: 148, column: 2, scope: !763)
!920 = !DILocation(line: 149, column: 13, scope: !763)
!921 = !DILocation(line: 149, column: 2, scope: !763)
!922 = !DILocation(line: 150, column: 13, scope: !763)
!923 = !DILocation(line: 150, column: 2, scope: !763)
!924 = !DILocation(line: 151, column: 13, scope: !763)
!925 = !DILocation(line: 151, column: 2, scope: !763)
!926 = !DILocation(line: 156, column: 2, scope: !763)
!927 = !DILocalVariable(name: "I", arg: 1, scope: !928, file: !3, line: 306, type: !22)
!928 = distinct !DISubprogram(name: "random_matrix", linkageName: "_Z13random_matrixPfii", scope: !3, file: !3, line: 306, type: !929, isLocal: false, isDefinition: true, scopeLine: 306, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !931)
!929 = !DISubroutineType(types: !930)
!930 = !{null, !22, !26, !26}
!931 = !{!927, !932, !933, !934, !936}
!932 = !DILocalVariable(name: "rows", arg: 2, scope: !928, file: !3, line: 306, type: !26)
!933 = !DILocalVariable(name: "cols", arg: 3, scope: !928, file: !3, line: 306, type: !26)
!934 = !DILocalVariable(name: "i", scope: !935, file: !3, line: 310, type: !26)
!935 = distinct !DILexicalBlock(scope: !928, file: !3, line: 310, column: 2)
!936 = !DILocalVariable(name: "j", scope: !937, file: !3, line: 311, type: !26)
!937 = distinct !DILexicalBlock(scope: !938, file: !3, line: 311, column: 3)
!938 = distinct !DILexicalBlock(scope: !939, file: !3, line: 310, column: 34)
!939 = distinct !DILexicalBlock(scope: !935, file: !3, line: 310, column: 2)
!940 = !DILocation(line: 306, column: 27, scope: !928, inlinedAt: !941)
!941 = distinct !DILocation(line: 158, column: 2, scope: !763)
!942 = !DILocation(line: 306, column: 34, scope: !928, inlinedAt: !941)
!943 = !DILocation(line: 306, column: 44, scope: !928, inlinedAt: !941)
!944 = !DILocation(line: 308, column: 2, scope: !928, inlinedAt: !941)
!945 = !DILocation(line: 310, column: 11, scope: !935, inlinedAt: !941)
!946 = !DILocation(line: 310, column: 21, scope: !947, inlinedAt: !941)
!947 = !DILexicalBlockFile(scope: !939, file: !3, discriminator: 1)
!948 = !DILocation(line: 310, column: 2, scope: !949, inlinedAt: !941)
!949 = !DILexicalBlockFile(scope: !935, file: !3, discriminator: 1)
!950 = !DILocation(line: 311, column: 13, scope: !937, inlinedAt: !941)
!951 = !DILocation(line: 311, column: 3, scope: !952, inlinedAt: !941)
!952 = !DILexicalBlockFile(scope: !937, file: !3, discriminator: 1)
!953 = !DILocation(line: 310, column: 31, scope: !954, inlinedAt: !941)
!954 = !DILexicalBlockFile(scope: !939, file: !3, discriminator: 3)
!955 = distinct !{!955, !956, !957}
!956 = !DILocation(line: 310, column: 2, scope: !935)
!957 = !DILocation(line: 314, column: 2, scope: !935)
!958 = !DILocation(line: 160, column: 14, scope: !794)
!959 = !DILocation(line: 160, column: 24, scope: !960)
!960 = !DILexicalBlockFile(scope: !961, file: !3, discriminator: 1)
!961 = distinct !DILexicalBlock(scope: !794, file: !3, line: 160, column: 5)
!962 = !DILocation(line: 160, column: 5, scope: !963)
!963 = !DILexicalBlockFile(scope: !794, file: !3, discriminator: 1)
!964 = !DILocation(line: 161, column: 25, scope: !965)
!965 = distinct !DILexicalBlock(scope: !961, file: !3, line: 160, column: 40)
!966 = !DILocation(line: 312, column: 22, scope: !967, inlinedAt: !941)
!967 = distinct !DILexicalBlock(scope: !968, file: !3, line: 311, column: 36)
!968 = distinct !DILexicalBlock(scope: !937, file: !3, line: 311, column: 3)
!969 = !DILocation(line: 312, column: 28, scope: !967, inlinedAt: !941)
!970 = !DILocation(line: 312, column: 15, scope: !967, inlinedAt: !941)
!971 = !DILocation(line: 312, column: 4, scope: !967, inlinedAt: !941)
!972 = !DILocation(line: 312, column: 20, scope: !967, inlinedAt: !941)
!973 = !DILocation(line: 311, column: 33, scope: !974, inlinedAt: !941)
!974 = !DILexicalBlockFile(scope: !968, file: !3, discriminator: 3)
!975 = !DILocation(line: 311, column: 23, scope: !976, inlinedAt: !941)
!976 = !DILexicalBlockFile(scope: !968, file: !3, discriminator: 1)
!977 = distinct !{!977, !978, !979}
!978 = !DILocation(line: 311, column: 3, scope: !937)
!979 = !DILocation(line: 313, column: 3, scope: !937)
!980 = !DILocation(line: 163, column: 2, scope: !763)
!981 = !DILocation(line: 59, column: 46, scope: !763)
!982 = !DILocation(line: 164, column: 19, scope: !983)
!983 = !DILexicalBlockFile(scope: !798, file: !3, discriminator: 1)
!984 = !DILocation(line: 164, column: 2, scope: !985)
!985 = !DILexicalBlockFile(scope: !799, file: !3, discriminator: 1)
!986 = !DILocation(line: 267, column: 2, scope: !987)
!987 = !DILexicalBlockFile(scope: !834, file: !3, discriminator: 1)
!988 = !DILocation(line: 161, column: 21, scope: !965)
!989 = !DILocation(line: 161, column: 7, scope: !965)
!990 = !DILocation(line: 161, column: 12, scope: !965)
!991 = !DILocation(line: 160, column: 35, scope: !992)
!992 = !DILexicalBlockFile(scope: !961, file: !3, discriminator: 3)
!993 = distinct !{!993, !994, !995}
!994 = !DILocation(line: 160, column: 5, scope: !794)
!995 = !DILocation(line: 162, column: 5, scope: !794)
!996 = !DILocation(line: 60, column: 31, scope: !763)
!997 = !DILocation(line: 60, column: 36, scope: !763)
!998 = !DILocation(line: 166, column: 18, scope: !796)
!999 = !DILocation(line: 166, column: 9, scope: !1000)
!1000 = !DILexicalBlockFile(scope: !796, file: !3, discriminator: 1)
!1001 = !DILocation(line: 167, column: 22, scope: !801)
!1002 = !DILocation(line: 167, column: 13, scope: !1003)
!1003 = !DILexicalBlockFile(scope: !801, file: !3, discriminator: 1)
!1004 = !DILocation(line: 173, column: 23, scope: !797)
!1005 = !DILocation(line: 60, column: 47, scope: !763)
!1006 = !DILocation(line: 174, column: 25, scope: !797)
!1007 = !DILocation(line: 174, column: 44, scope: !797)
!1008 = !DILocation(line: 174, column: 35, scope: !797)
!1009 = !DILocation(line: 60, column: 55, scope: !763)
!1010 = !DILocation(line: 175, column: 26, scope: !797)
!1011 = !DILocation(line: 60, column: 24, scope: !763)
!1012 = !DILocation(line: 235, column: 6, scope: !797)
!1013 = !DILocation(line: 236, column: 9, scope: !797)
!1014 = !DILocation(line: 238, column: 10, scope: !797)
!1015 = !DILocation(line: 239, column: 7, scope: !797)
!1016 = !DILocation(line: 243, column: 13, scope: !797)
!1017 = !DILocation(line: 243, column: 2, scope: !797)
!1018 = !DILocation(line: 246, column: 2, scope: !797)
!1019 = !DILocation(line: 16, column: 5, scope: !688, inlinedAt: !1020)
!1020 = distinct !DILocation(line: 247, column: 16, scope: !797)
!1021 = !DILocation(line: 16, column: 20, scope: !688, inlinedAt: !1020)
!1022 = !DILocation(line: 17, column: 9, scope: !705, inlinedAt: !1020)
!1023 = !DILocation(line: 17, column: 9, scope: !688, inlinedAt: !1020)
!1024 = !DILocation(line: 21, column: 25, scope: !688, inlinedAt: !1020)
!1025 = !DILocation(line: 21, column: 20, scope: !688, inlinedAt: !1020)
!1026 = !DILocation(line: 21, column: 47, scope: !688, inlinedAt: !1020)
!1027 = !DILocation(line: 21, column: 42, scope: !688, inlinedAt: !1020)
!1028 = !DILocation(line: 21, column: 55, scope: !688, inlinedAt: !1020)
!1029 = !DILocation(line: 21, column: 32, scope: !688, inlinedAt: !1020)
!1030 = !DILocation(line: 21, column: 5, scope: !688, inlinedAt: !1020)
!1031 = !DILocation(line: 22, column: 1, scope: !688, inlinedAt: !1020)
!1032 = !DILocation(line: 247, column: 8, scope: !797)
!1033 = !DILocation(line: 250, column: 13, scope: !797)
!1034 = !DILocation(line: 250, column: 2, scope: !797)
!1035 = !DILocation(line: 166, column: 32, scope: !1036)
!1036 = !DILexicalBlockFile(scope: !803, file: !3, discriminator: 3)
!1037 = !DILocation(line: 166, column: 25, scope: !1038)
!1038 = !DILexicalBlockFile(scope: !803, file: !3, discriminator: 1)
!1039 = distinct !{!1039, !1040, !1041}
!1040 = !DILocation(line: 166, column: 9, scope: !796)
!1041 = !DILocation(line: 172, column: 9, scope: !796)
!1042 = !DILocation(line: 168, column: 36, scope: !1043)
!1043 = distinct !DILexicalBlock(scope: !1044, file: !3, line: 167, column: 40)
!1044 = distinct !DILexicalBlock(scope: !801, file: !3, line: 167, column: 13)
!1045 = !DILocation(line: 168, column: 25, scope: !1043)
!1046 = !DILocation(line: 60, column: 42, scope: !763)
!1047 = !DILocation(line: 169, column: 22, scope: !1043)
!1048 = !DILocation(line: 170, column: 28, scope: !1043)
!1049 = !DILocation(line: 170, column: 22, scope: !1043)
!1050 = !DILocation(line: 167, column: 36, scope: !1051)
!1051 = !DILexicalBlockFile(scope: !1044, file: !3, discriminator: 3)
!1052 = !DILocation(line: 167, column: 29, scope: !1053)
!1053 = !DILexicalBlockFile(scope: !1044, file: !3, discriminator: 1)
!1054 = distinct !{!1054, !1055, !1056}
!1055 = !DILocation(line: 167, column: 13, scope: !801)
!1056 = !DILocation(line: 171, column: 13, scope: !801)
!1057 = !DILocation(line: 250, column: 37, scope: !1058)
!1058 = !DILexicalBlockFile(scope: !797, file: !3, discriminator: 1)
!1059 = !DILocation(line: 75, column: 9, scope: !763)
!1060 = !DILocation(line: 250, column: 42, scope: !1058)
!1061 = !DILocation(line: 75, column: 15, scope: !763)
!1062 = !DILocation(line: 250, column: 47, scope: !1058)
!1063 = !DILocation(line: 75, column: 21, scope: !763)
!1064 = !DILocation(line: 250, column: 52, scope: !1058)
!1065 = !DILocation(line: 75, column: 27, scope: !763)
!1066 = !DILocation(line: 250, column: 57, scope: !1058)
!1067 = !DILocation(line: 73, column: 9, scope: !763)
!1068 = !DILocation(line: 250, column: 65, scope: !1058)
!1069 = !DILocation(line: 74, column: 12, scope: !763)
!1070 = !DILocation(line: 250, column: 2, scope: !1058)
!1071 = !DILocation(line: 251, column: 13, scope: !797)
!1072 = !DILocation(line: 251, column: 2, scope: !797)
!1073 = !DILocation(line: 251, column: 37, scope: !1058)
!1074 = !DILocation(line: 251, column: 42, scope: !1058)
!1075 = !DILocation(line: 251, column: 47, scope: !1058)
!1076 = !DILocation(line: 251, column: 52, scope: !1058)
!1077 = !DILocation(line: 251, column: 57, scope: !1058)
!1078 = !DILocation(line: 251, column: 65, scope: !1058)
!1079 = !DILocation(line: 251, column: 2, scope: !1058)
!1080 = !DILocation(line: 253, column: 1, scope: !797)
!1081 = !DILocation(line: 16, column: 5, scope: !688, inlinedAt: !1082)
!1082 = distinct !DILocation(line: 254, column: 16, scope: !797)
!1083 = !DILocation(line: 16, column: 20, scope: !688, inlinedAt: !1082)
!1084 = !DILocation(line: 17, column: 9, scope: !705, inlinedAt: !1082)
!1085 = !DILocation(line: 17, column: 9, scope: !688, inlinedAt: !1082)
!1086 = !DILocation(line: 21, column: 25, scope: !688, inlinedAt: !1082)
!1087 = !DILocation(line: 21, column: 20, scope: !688, inlinedAt: !1082)
!1088 = !DILocation(line: 21, column: 47, scope: !688, inlinedAt: !1082)
!1089 = !DILocation(line: 21, column: 42, scope: !688, inlinedAt: !1082)
!1090 = !DILocation(line: 21, column: 55, scope: !688, inlinedAt: !1082)
!1091 = !DILocation(line: 21, column: 32, scope: !688, inlinedAt: !1082)
!1092 = !DILocation(line: 21, column: 5, scope: !688, inlinedAt: !1082)
!1093 = !DILocation(line: 22, column: 1, scope: !688, inlinedAt: !1082)
!1094 = !DILocation(line: 254, column: 8, scope: !797)
!1095 = !DILocation(line: 255, column: 19, scope: !797)
!1096 = !DILocation(line: 255, column: 11, scope: !797)
!1097 = !DILocation(line: 258, column: 19, scope: !797)
!1098 = !DILocation(line: 258, column: 5, scope: !797)
!1099 = !DILocation(line: 164, column: 32, scope: !1100)
!1100 = !DILexicalBlockFile(scope: !798, file: !3, discriminator: 2)
!1101 = distinct !{!1101, !1102, !1103}
!1102 = !DILocation(line: 164, column: 2, scope: !799)
!1103 = !DILocation(line: 261, column: 1, scope: !799)
!1104 = !DILocation(line: 263, column: 5, scope: !763)
!1105 = !DILocation(line: 266, column: 2, scope: !763)
!1106 = !DILocation(line: 267, column: 11, scope: !834)
!1107 = !DILocation(line: 268, column: 27, scope: !836)
!1108 = !DILocation(line: 269, column: 27, scope: !1109)
!1109 = distinct !DILexicalBlock(scope: !1110, file: !3, line: 268, column: 48)
!1110 = distinct !DILexicalBlock(scope: !836, file: !3, line: 268, column: 17)
!1111 = !DILocation(line: 269, column: 11, scope: !1109)
!1112 = !DILocation(line: 269, column: 38, scope: !1109)
!1113 = !DILocation(line: 271, column: 3, scope: !837)
!1114 = !DILocation(line: 267, column: 29, scope: !1115)
!1115 = !DILexicalBlockFile(scope: !838, file: !3, discriminator: 3)
!1116 = !DILocation(line: 267, column: 21, scope: !1117)
!1117 = !DILexicalBlockFile(scope: !838, file: !3, discriminator: 1)
!1118 = distinct !{!1118, !1119, !1120}
!1119 = !DILocation(line: 267, column: 2, scope: !834)
!1120 = !DILocation(line: 272, column: 2, scope: !834)
!1121 = !DILocation(line: 285, column: 2, scope: !763)
!1122 = !DILocation(line: 287, column: 2, scope: !763)
!1123 = !DILocation(line: 288, column: 2, scope: !763)
!1124 = !DILocation(line: 294, column: 14, scope: !763)
!1125 = !DILocation(line: 294, column: 5, scope: !763)
!1126 = !DILocation(line: 295, column: 11, scope: !763)
!1127 = !DILocation(line: 295, column: 2, scope: !763)
!1128 = !DILocation(line: 296, column: 11, scope: !763)
!1129 = !DILocation(line: 296, column: 2, scope: !763)
!1130 = !DILocation(line: 297, column: 11, scope: !763)
!1131 = !DILocation(line: 297, column: 2, scope: !763)
!1132 = !DILocation(line: 298, column: 11, scope: !763)
!1133 = !DILocation(line: 298, column: 2, scope: !763)
!1134 = !DILocation(line: 299, column: 11, scope: !763)
!1135 = !DILocation(line: 299, column: 2, scope: !763)
!1136 = !DILocation(line: 303, column: 1, scope: !763)
!1137 = !DILocation(line: 306, column: 27, scope: !928)
!1138 = !DILocation(line: 306, column: 34, scope: !928)
!1139 = !DILocation(line: 306, column: 44, scope: !928)
!1140 = !DILocation(line: 308, column: 2, scope: !928)
!1141 = !DILocation(line: 310, column: 11, scope: !935)
!1142 = !DILocation(line: 310, column: 21, scope: !947)
!1143 = !DILocation(line: 310, column: 2, scope: !949)
!1144 = !DILocation(line: 311, column: 13, scope: !937)
!1145 = !DILocation(line: 311, column: 3, scope: !952)
!1146 = !DILocation(line: 316, column: 1, scope: !928)
!1147 = !DILocation(line: 310, column: 31, scope: !954)
!1148 = !DILocation(line: 312, column: 22, scope: !967)
!1149 = !DILocation(line: 312, column: 28, scope: !967)
!1150 = !DILocation(line: 312, column: 15, scope: !967)
!1151 = !DILocation(line: 312, column: 4, scope: !967)
!1152 = !DILocation(line: 312, column: 20, scope: !967)
!1153 = !DILocation(line: 311, column: 33, scope: !974)
!1154 = !DILocation(line: 311, column: 23, scope: !976)
