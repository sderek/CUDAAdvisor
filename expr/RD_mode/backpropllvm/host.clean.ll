; ModuleID = 'backprop_cuda.cu'
source_filename = "backprop_cuda.cu"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }
%struct.BPNN = type { i32, i32, i32, float*, float*, float*, float*, float*, float*, float**, float**, float**, float** }
%struct.dim3 = type { i32, i32, i32 }
%struct.CUstream_st = type opaque

@num_threads = local_unnamed_addr global i32 0, align 4, !dbg !0
@num_blocks = local_unnamed_addr global i32 0, align 4, !dbg !109
@.str.2 = private unnamed_addr constant [23 x i8] c"bpnn kernel error: %s\0A\00", align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.3 = private unnamed_addr constant [5 x i8] c" %f\0A\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"%f\09\00", align 1
@str = private unnamed_addr constant [12 x i8] c"end of main\00"
@str.7 = private unnamed_addr constant [27 x i8] c"Performing GPU computation\00"
@str.8 = private unnamed_addr constant [16 x i8] c"\0A#define OUTPUT\00"

; Function Attrs: uwtable
define void @_Z22bpnn_layerforward_CUDAPfS_S_S_ii(float* %input_cuda, float* %output_hidden_cuda, float* %input_hidden_cuda, float* %hidden_partial_sum, i32 %in, i32 %hid) #0 !dbg !670 {
entry:
  %input_cuda.addr = alloca float*, align 8
  %output_hidden_cuda.addr = alloca float*, align 8
  %input_hidden_cuda.addr = alloca float*, align 8
  %hidden_partial_sum.addr = alloca float*, align 8
  %in.addr = alloca i32, align 4
  %hid.addr = alloca i32, align 4
  tail call void @llvm.dbg.value(metadata float* %input_cuda, i64 0, metadata !675, metadata !681), !dbg !682
  store float* %input_cuda, float** %input_cuda.addr, align 8, !tbaa !683
  tail call void @llvm.dbg.value(metadata float* %output_hidden_cuda, i64 0, metadata !676, metadata !681), !dbg !687
  store float* %output_hidden_cuda, float** %output_hidden_cuda.addr, align 8, !tbaa !683
  tail call void @llvm.dbg.value(metadata float* %input_hidden_cuda, i64 0, metadata !677, metadata !681), !dbg !688
  store float* %input_hidden_cuda, float** %input_hidden_cuda.addr, align 8, !tbaa !683
  tail call void @llvm.dbg.value(metadata float* %hidden_partial_sum, i64 0, metadata !678, metadata !681), !dbg !689
  store float* %hidden_partial_sum, float** %hidden_partial_sum.addr, align 8, !tbaa !683
  tail call void @llvm.dbg.value(metadata i32 %in, i64 0, metadata !679, metadata !681), !dbg !690
  store i32 %in, i32* %in.addr, align 4, !tbaa !691
  tail call void @llvm.dbg.value(metadata i32 %hid, i64 0, metadata !680, metadata !681), !dbg !693
  store i32 %hid, i32* %hid.addr, align 4, !tbaa !691
  %0 = bitcast float** %input_cuda.addr to i8*, !dbg !694
  %1 = call i32 @cudaSetupArgument(i8* nonnull %0, i64 8, i64 0), !dbg !694
  %2 = icmp eq i32 %1, 0, !dbg !694
  br i1 %2, label %setup.next, label %setup.end, !dbg !694

setup.next:                                       ; preds = %entry
  %3 = bitcast float** %output_hidden_cuda.addr to i8*, !dbg !695
  %4 = call i32 @cudaSetupArgument(i8* nonnull %3, i64 8, i64 8), !dbg !695
  %5 = icmp eq i32 %4, 0, !dbg !695
  br i1 %5, label %setup.next1, label %setup.end, !dbg !695

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast float** %input_hidden_cuda.addr to i8*, !dbg !697
  %7 = call i32 @cudaSetupArgument(i8* nonnull %6, i64 8, i64 16), !dbg !697
  %8 = icmp eq i32 %7, 0, !dbg !697
  br i1 %8, label %setup.next2, label %setup.end, !dbg !697

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast float** %hidden_partial_sum.addr to i8*, !dbg !699
  %10 = call i32 @cudaSetupArgument(i8* nonnull %9, i64 8, i64 24), !dbg !699
  %11 = icmp eq i32 %10, 0, !dbg !699
  br i1 %11, label %setup.next3, label %setup.end, !dbg !699

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast i32* %in.addr to i8*, !dbg !701
  %13 = call i32 @cudaSetupArgument(i8* nonnull %12, i64 4, i64 32), !dbg !701
  %14 = icmp eq i32 %13, 0, !dbg !701
  br i1 %14, label %setup.next4, label %setup.end, !dbg !701

setup.next4:                                      ; preds = %setup.next3
  %15 = bitcast i32* %hid.addr to i8*, !dbg !703
  %16 = call i32 @cudaSetupArgument(i8* nonnull %15, i64 4, i64 36), !dbg !703
  %17 = icmp eq i32 %16, 0, !dbg !703
  br i1 %17, label %setup.next5, label %setup.end, !dbg !703

setup.next5:                                      ; preds = %setup.next4
  %18 = call i32 @cudaLaunch(i8* bitcast (void (float*, float*, float*, float*, i32, i32)* @_Z22bpnn_layerforward_CUDAPfS_S_S_ii to i8*)), !dbg !705
  br label %setup.end, !dbg !705

setup.end:                                        ; preds = %setup.next5, %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !707
}

declare i32 @cudaSetupArgument(i8*, i64, i64) local_unnamed_addr

declare i32 @cudaLaunch(i8*) local_unnamed_addr

; Function Attrs: uwtable
define void @_Z24bpnn_adjust_weights_cudaPfiS_iS_S_(float* %delta, i32 %hid, float* %ly, i32 %in, float* %w, float* %oldw) #0 !dbg !708 {
entry:
  %delta.addr = alloca float*, align 8
  %hid.addr = alloca i32, align 4
  %ly.addr = alloca float*, align 8
  %in.addr = alloca i32, align 4
  %w.addr = alloca float*, align 8
  %oldw.addr = alloca float*, align 8
  tail call void @llvm.dbg.value(metadata float* %delta, i64 0, metadata !712, metadata !681), !dbg !718
  store float* %delta, float** %delta.addr, align 8, !tbaa !683
  tail call void @llvm.dbg.value(metadata i32 %hid, i64 0, metadata !713, metadata !681), !dbg !719
  store i32 %hid, i32* %hid.addr, align 4, !tbaa !691
  tail call void @llvm.dbg.value(metadata float* %ly, i64 0, metadata !714, metadata !681), !dbg !720
  store float* %ly, float** %ly.addr, align 8, !tbaa !683
  tail call void @llvm.dbg.value(metadata i32 %in, i64 0, metadata !715, metadata !681), !dbg !721
  store i32 %in, i32* %in.addr, align 4, !tbaa !691
  tail call void @llvm.dbg.value(metadata float* %w, i64 0, metadata !716, metadata !681), !dbg !722
  store float* %w, float** %w.addr, align 8, !tbaa !683
  tail call void @llvm.dbg.value(metadata float* %oldw, i64 0, metadata !717, metadata !681), !dbg !723
  store float* %oldw, float** %oldw.addr, align 8, !tbaa !683
  %0 = bitcast float** %delta.addr to i8*, !dbg !724
  %1 = call i32 @cudaSetupArgument(i8* nonnull %0, i64 8, i64 0), !dbg !724
  %2 = icmp eq i32 %1, 0, !dbg !724
  br i1 %2, label %setup.next, label %setup.end, !dbg !724

setup.next:                                       ; preds = %entry
  %3 = bitcast i32* %hid.addr to i8*, !dbg !725
  %4 = call i32 @cudaSetupArgument(i8* nonnull %3, i64 4, i64 8), !dbg !725
  %5 = icmp eq i32 %4, 0, !dbg !725
  br i1 %5, label %setup.next1, label %setup.end, !dbg !725

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast float** %ly.addr to i8*, !dbg !727
  %7 = call i32 @cudaSetupArgument(i8* nonnull %6, i64 8, i64 16), !dbg !727
  %8 = icmp eq i32 %7, 0, !dbg !727
  br i1 %8, label %setup.next2, label %setup.end, !dbg !727

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast i32* %in.addr to i8*, !dbg !729
  %10 = call i32 @cudaSetupArgument(i8* nonnull %9, i64 4, i64 24), !dbg !729
  %11 = icmp eq i32 %10, 0, !dbg !729
  br i1 %11, label %setup.next3, label %setup.end, !dbg !729

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast float** %w.addr to i8*, !dbg !731
  %13 = call i32 @cudaSetupArgument(i8* nonnull %12, i64 8, i64 32), !dbg !731
  %14 = icmp eq i32 %13, 0, !dbg !731
  br i1 %14, label %setup.next4, label %setup.end, !dbg !731

setup.next4:                                      ; preds = %setup.next3
  %15 = bitcast float** %oldw.addr to i8*, !dbg !733
  %16 = call i32 @cudaSetupArgument(i8* nonnull %15, i64 8, i64 40), !dbg !733
  %17 = icmp eq i32 %16, 0, !dbg !733
  br i1 %17, label %setup.next5, label %setup.end, !dbg !733

setup.next5:                                      ; preds = %setup.next4
  %18 = call i32 @cudaLaunch(i8* bitcast (void (float*, i32, float*, i32, float*, float*)* @_Z24bpnn_adjust_weights_cudaPfiS_iS_S_ to i8*)), !dbg !735
  br label %setup.end, !dbg !735

setup.end:                                        ; preds = %setup.next5, %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !737
}

; Function Attrs: nounwind uwtable
define double @_Z8get_timev() local_unnamed_addr #1 !dbg !738 {
entry:
  %time = alloca %struct.timeval, align 8
  %0 = bitcast %struct.timeval* %time to i8*, !dbg !751
  call void @llvm.lifetime.start(i64 16, i8* nonnull %0) #8, !dbg !751
  tail call void @llvm.dbg.value(metadata %struct.timeval* %time, i64 0, metadata !742, metadata !752), !dbg !753
  %call = call i32 @gettimeofday(%struct.timeval* nonnull %time, %struct.timezone* null) #8, !dbg !754
  %tobool = icmp eq i32 %call, 0, !dbg !754
  br i1 %tobool, label %if.end, label %cleanup, !dbg !756

if.end:                                           ; preds = %entry
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %time, i64 0, i32 0, !dbg !757
  %1 = load i64, i64* %tv_sec, align 8, !dbg !757, !tbaa !758
  %conv = sitofp i64 %1 to double, !dbg !761
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %time, i64 0, i32 1, !dbg !762
  %2 = load i64, i64* %tv_usec, align 8, !dbg !762, !tbaa !763
  %conv1 = sitofp i64 %2 to double, !dbg !764
  %mul = fmul double %conv1, 1.000000e-06, !dbg !765
  %add = fadd double %mul, %conv, !dbg !766
  br label %cleanup, !dbg !767

cleanup:                                          ; preds = %entry, %if.end
  %retval.0 = phi double [ %add, %if.end ], [ 0.000000e+00, %entry ]
  call void @llvm.lifetime.end(i64 16, i8* nonnull %0) #8, !dbg !768
  ret double %retval.0, !dbg !768
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #2

; Function Attrs: nounwind
declare i32 @gettimeofday(%struct.timeval* nocapture, %struct.timezone* nocapture) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define double @_Z7gettimev() local_unnamed_addr #1 !dbg !769 {
entry:
  %t = alloca %struct.timeval, align 8
  %0 = bitcast %struct.timeval* %t to i8*, !dbg !772
  call void @llvm.lifetime.start(i64 16, i8* nonnull %0) #8, !dbg !772
  tail call void @llvm.dbg.value(metadata %struct.timeval* %t, i64 0, metadata !771, metadata !752), !dbg !773
  %call = call i32 @gettimeofday(%struct.timeval* nonnull %t, %struct.timezone* null) #8, !dbg !774
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %t, i64 0, i32 0, !dbg !775
  %1 = load i64, i64* %tv_sec, align 8, !dbg !775, !tbaa !758
  %conv = sitofp i64 %1 to double, !dbg !776
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %t, i64 0, i32 1, !dbg !777
  %2 = load i64, i64* %tv_usec, align 8, !dbg !777, !tbaa !763
  %conv1 = sitofp i64 %2 to double, !dbg !778
  %mul = fmul double %conv1, 1.000000e-06, !dbg !779
  %add = fadd double %mul, %conv, !dbg !780
  call void @llvm.lifetime.end(i64 16, i8* nonnull %0) #8, !dbg !781
  ret double %add, !dbg !782
}

; Function Attrs: norecurse uwtable
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #4 !dbg !783 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !787, metadata !681), !dbg !789
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !788, metadata !681), !dbg !790
  %call = tail call i32 @cudaDeviceSetLimit(i32 2, i64 314572800), !dbg !791
  %call1 = tail call i32 @setup(i32 %argc, i8** %argv), !dbg !792
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @str, i64 0, i64 0)), !dbg !793
  ret i32 0, !dbg !794
}

declare i32 @cudaDeviceSetLimit(i32, i64) local_unnamed_addr #5

declare i32 @setup(i32, i8**) local_unnamed_addr #5

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: uwtable
define void @bpnn_train_cuda(%struct.BPNN* nocapture readonly %net, float* nocapture readnone %eo, float* nocapture readnone %eh) local_unnamed_addr #0 !dbg !795 {
entry:
  %time.i347 = alloca %struct.timeval, align 8
  %time.i335 = alloca %struct.timeval, align 8
  %time.i323 = alloca %struct.timeval, align 8
  %time.i = alloca %struct.timeval, align 8
  %out_err = alloca float, align 4
  %hid_err = alloca float, align 4
  %input_hidden_cuda = alloca float*, align 8
  %input_cuda = alloca float*, align 8
  %output_hidden_cuda = alloca float*, align 8
  %hidden_partial_sum = alloca float*, align 8
  %hidden_delta_cuda = alloca float*, align 8
  %input_prev_weights_cuda = alloca float*, align 8
  tail call void @llvm.dbg.value(metadata %struct.BPNN* %net, i64 0, metadata !818, metadata !681), !dbg !884
  tail call void @llvm.dbg.value(metadata float* %eo, i64 0, metadata !819, metadata !681), !dbg !885
  tail call void @llvm.dbg.value(metadata float* %eh, i64 0, metadata !820, metadata !681), !dbg !886
  %0 = bitcast float* %out_err to i8*, !dbg !887
  call void @llvm.lifetime.start(i64 4, i8* nonnull %0) #8, !dbg !887
  %1 = bitcast float* %hid_err to i8*, !dbg !887
  call void @llvm.lifetime.start(i64 4, i8* nonnull %1) #8, !dbg !887
  %input_n = getelementptr inbounds %struct.BPNN, %struct.BPNN* %net, i64 0, i32 0, !dbg !888
  %2 = load i32, i32* %input_n, align 8, !dbg !888, !tbaa !889
  tail call void @llvm.dbg.value(metadata i32 %2, i64 0, metadata !821, metadata !681), !dbg !891
  %hidden_n = getelementptr inbounds %struct.BPNN, %struct.BPNN* %net, i64 0, i32 1, !dbg !892
  %3 = load i32, i32* %hidden_n, align 4, !dbg !892, !tbaa !893
  tail call void @llvm.dbg.value(metadata i32 %3, i64 0, metadata !822, metadata !681), !dbg !894
  %output_n = getelementptr inbounds %struct.BPNN, %struct.BPNN* %net, i64 0, i32 2, !dbg !895
  %4 = load i32, i32* %output_n, align 8, !dbg !895, !tbaa !896
  tail call void @llvm.dbg.value(metadata i32 %4, i64 0, metadata !823, metadata !681), !dbg !897
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !826, metadata !681), !dbg !898
  %5 = bitcast float** %input_hidden_cuda to i8*, !dbg !899
  call void @llvm.lifetime.start(i64 8, i8* nonnull %5) #8, !dbg !899
  %6 = bitcast float** %input_cuda to i8*, !dbg !900
  call void @llvm.lifetime.start(i64 8, i8* nonnull %6) #8, !dbg !900
  %7 = bitcast float** %output_hidden_cuda to i8*, !dbg !901
  call void @llvm.lifetime.start(i64 8, i8* nonnull %7) #8, !dbg !901
  %8 = bitcast float** %hidden_partial_sum to i8*, !dbg !902
  call void @llvm.lifetime.start(i64 8, i8* nonnull %8) #8, !dbg !902
  %9 = bitcast float** %hidden_delta_cuda to i8*, !dbg !903
  call void @llvm.lifetime.start(i64 8, i8* nonnull %9) #8, !dbg !903
  %10 = bitcast float** %input_prev_weights_cuda to i8*, !dbg !904
  call void @llvm.lifetime.start(i64 8, i8* nonnull %10) #8, !dbg !904
  %div = sdiv i32 %2, 16, !dbg !905
  store i32 %div, i32* @num_blocks, align 4, !dbg !906, !tbaa !691
  tail call void @llvm.dbg.value(metadata %struct.dim3* undef, i64 0, metadata !837, metadata !752), !dbg !907
  tail call void @llvm.dbg.value(metadata %struct.dim3* undef, i64 0, metadata !861, metadata !752), !dbg !908
  %add = add i32 %2, 1, !dbg !909
  %add1 = add i32 %3, 1, !dbg !910
  %mul = mul nsw i32 %add1, %add, !dbg !911
  %conv = sext i32 %mul to i64, !dbg !912
  %mul2 = shl nsw i64 %conv, 2, !dbg !913
  %call = tail call noalias i8* @malloc(i64 %mul2) #8, !dbg !914
  %11 = bitcast i8* %call to float*, !dbg !915
  tail call void @llvm.dbg.value(metadata float* %11, i64 0, metadata !835, metadata !681), !dbg !916
  %call8 = tail call noalias i8* @malloc(i64 %mul2) #8, !dbg !917
  %12 = bitcast i8* %call8 to float*, !dbg !918
  tail call void @llvm.dbg.value(metadata float* %12, i64 0, metadata !836, metadata !681), !dbg !919
  %mul9 = shl nsw i32 %div, 4, !dbg !920
  %conv10 = zext i32 %mul9 to i64, !dbg !921
  %mul11 = shl nuw nsw i64 %conv10, 2, !dbg !922
  %call12 = tail call noalias i8* @malloc(i64 %mul11) #8, !dbg !923
  %13 = bitcast i8* %call12 to float*, !dbg !924
  tail call void @llvm.dbg.value(metadata float* %13, i64 0, metadata !830, metadata !681), !dbg !925
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !862, metadata !681), !dbg !926
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !826, metadata !681), !dbg !898
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !862, metadata !681), !dbg !926
  %cmp394 = icmp slt i32 %2, 0, !dbg !927
  br i1 %cmp394, label %for.cond.cleanup, label %for.cond13.preheader.lr.ph, !dbg !929

for.cond13.preheader.lr.ph:                       ; preds = %entry
  %cmp14390 = icmp slt i32 %3, 0
  %input_weights = getelementptr inbounds %struct.BPNN, %struct.BPNN* %net, i64 0, i32 9
  %input_prev_weights = getelementptr inbounds %struct.BPNN, %struct.BPNN* %net, i64 0, i32 11
  %14 = add i32 %3, 1, !dbg !931
  %wide.trip.count415 = zext i32 %add to i64
  %wide.trip.count411 = zext i32 %add1 to i64
  %15 = shl nuw nsw i64 %wide.trip.count411, 2, !dbg !929
  %scevgep417 = getelementptr i8, i8* %call, i64 %15, !dbg !929
  %scevgep420 = getelementptr i8, i8* %call8, i64 %15, !dbg !929
  %16 = add nsw i64 %wide.trip.count411, -1, !dbg !933
  %min.iters.check = icmp ult i32 %add1, 8
  %17 = and i32 %add1, 7
  %n.mod.vf = zext i32 %17 to i64
  %n.vec = sub nsw i64 %wide.trip.count411, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %bound0 = icmp ult i8* %call, %scevgep420
  %bound1 = icmp ult i8* %call8, %scevgep417
  %found.conflict = and i1 %bound0, %bound1
  %cmp.n = icmp eq i32 %17, 0
  br label %for.cond13.preheader, !dbg !929

for.cond13.preheader:                             ; preds = %for.cond.cleanup15, %for.cond13.preheader.lr.ph
  %indvars.iv413 = phi i64 [ %indvars.iv.next414, %for.cond.cleanup15 ], [ 0, %for.cond13.preheader.lr.ph ]
  %m.0396 = phi i32 [ %m.1.lcssa, %for.cond.cleanup15 ], [ 0, %for.cond13.preheader.lr.ph ]
  tail call void @llvm.dbg.value(metadata i32 %m.0396, i64 0, metadata !826, metadata !681), !dbg !898
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !864, metadata !681), !dbg !936
  br i1 %cmp14390, label %for.cond.cleanup15, label %for.body16.lr.ph, !dbg !931

for.body16.lr.ph:                                 ; preds = %for.cond13.preheader
  %18 = load float**, float*** %input_weights, align 8, !tbaa !937
  %arrayidx = getelementptr inbounds float*, float** %18, i64 %indvars.iv413
  %19 = load float*, float** %arrayidx, align 8, !tbaa !683
  %20 = bitcast float* %19 to i8*
  %21 = load float**, float*** %input_prev_weights, align 8, !tbaa !938
  %arrayidx22 = getelementptr inbounds float*, float** %21, i64 %indvars.iv413
  %22 = load float*, float** %arrayidx22, align 8, !tbaa !683
  %23 = bitcast float* %22 to i8*
  %24 = sext i32 %m.0396 to i64, !dbg !931
  br i1 %min.iters.check, label %for.body16.preheader, label %min.iters.checked, !dbg !931

for.body16.preheader:                             ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.body16.lr.ph
  %indvars.iv409.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.body16.lr.ph ], [ %n.vec, %middle.block ]
  %indvars.iv407.ph = phi i64 [ %24, %vector.memcheck ], [ %24, %min.iters.checked ], [ %24, %for.body16.lr.ph ], [ %ind.end, %middle.block ]
  %25 = sub nsw i64 %wide.trip.count411, %indvars.iv409.ph, !dbg !933
  %26 = sub nsw i64 %16, %indvars.iv409.ph, !dbg !933
  %xtraiter450 = and i64 %25, 3, !dbg !933
  %lcmp.mod451 = icmp eq i64 %xtraiter450, 0, !dbg !933
  br i1 %lcmp.mod451, label %for.body16.prol.loopexit, label %for.body16.prol.preheader, !dbg !933

for.body16.prol.preheader:                        ; preds = %for.body16.preheader
  br label %for.body16.prol, !dbg !933

for.body16.prol:                                  ; preds = %for.body16.prol, %for.body16.prol.preheader
  %indvars.iv409.prol = phi i64 [ %indvars.iv.next410.prol, %for.body16.prol ], [ %indvars.iv409.ph, %for.body16.prol.preheader ]
  %indvars.iv407.prol = phi i64 [ %indvars.iv.next408.prol, %for.body16.prol ], [ %indvars.iv407.ph, %for.body16.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body16.prol ], [ %xtraiter450, %for.body16.prol.preheader ]
  %arrayidx18.prol = getelementptr inbounds float, float* %19, i64 %indvars.iv409.prol, !dbg !933
  %27 = bitcast float* %arrayidx18.prol to i32*, !dbg !933
  %28 = load i32, i32* %27, align 4, !dbg !933, !tbaa !939
  %arrayidx20.prol = getelementptr inbounds float, float* %11, i64 %indvars.iv407.prol, !dbg !941
  %29 = bitcast float* %arrayidx20.prol to i32*, !dbg !942
  store i32 %28, i32* %29, align 4, !dbg !942, !tbaa !939
  %arrayidx24.prol = getelementptr inbounds float, float* %22, i64 %indvars.iv409.prol, !dbg !943
  %30 = bitcast float* %arrayidx24.prol to i32*, !dbg !943
  %31 = load i32, i32* %30, align 4, !dbg !943, !tbaa !939
  %arrayidx26.prol = getelementptr inbounds float, float* %12, i64 %indvars.iv407.prol, !dbg !944
  %32 = bitcast float* %arrayidx26.prol to i32*, !dbg !945
  store i32 %31, i32* %32, align 4, !dbg !945, !tbaa !939
  %indvars.iv.next408.prol = add nsw i64 %indvars.iv407.prol, 1, !dbg !946
  %indvars.iv.next410.prol = add nuw nsw i64 %indvars.iv409.prol, 1, !dbg !947
  %prol.iter.sub = add i64 %prol.iter, -1, !dbg !931
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0, !dbg !931
  br i1 %prol.iter.cmp, label %for.body16.prol.loopexit.unr-lcssa, label %for.body16.prol, !dbg !931, !llvm.loop !949

for.body16.prol.loopexit.unr-lcssa:               ; preds = %for.body16.prol
  br label %for.body16.prol.loopexit, !dbg !933

for.body16.prol.loopexit:                         ; preds = %for.body16.preheader, %for.body16.prol.loopexit.unr-lcssa
  %indvars.iv409.unr = phi i64 [ %indvars.iv409.ph, %for.body16.preheader ], [ %indvars.iv.next410.prol, %for.body16.prol.loopexit.unr-lcssa ]
  %indvars.iv407.unr = phi i64 [ %indvars.iv407.ph, %for.body16.preheader ], [ %indvars.iv.next408.prol, %for.body16.prol.loopexit.unr-lcssa ]
  %33 = icmp ult i64 %26, 3, !dbg !933
  br i1 %33, label %for.cond.cleanup15.loopexit.loopexit, label %for.body16.preheader.new, !dbg !933

for.body16.preheader.new:                         ; preds = %for.body16.prol.loopexit
  br label %for.body16, !dbg !933

min.iters.checked:                                ; preds = %for.body16.lr.ph
  br i1 %cmp.zero, label %for.body16.preheader, label %vector.memcheck, !dbg !931

vector.memcheck:                                  ; preds = %min.iters.checked
  %34 = shl nsw i64 %24, 2, !dbg !931
  %scevgep = getelementptr i8, i8* %call, i64 %34, !dbg !931
  %scevgep418 = getelementptr i8, i8* %scevgep417, i64 %34, !dbg !931
  %scevgep419 = getelementptr i8, i8* %call8, i64 %34, !dbg !931
  %scevgep421 = getelementptr i8, i8* %scevgep420, i64 %34, !dbg !931
  %scevgep422 = getelementptr float, float* %19, i64 %wide.trip.count411, !dbg !931
  %scevgep422423 = bitcast float* %scevgep422 to i8*
  %scevgep424 = getelementptr float, float* %22, i64 %wide.trip.count411, !dbg !931
  %scevgep424425 = bitcast float* %scevgep424 to i8*
  %bound0426 = icmp ult i8* %scevgep, %scevgep422423, !dbg !931
  %bound1427 = icmp ugt i8* %scevgep418, %20, !dbg !931
  %found.conflict428 = and i1 %bound0426, %bound1427, !dbg !931
  %conflict.rdx = or i1 %found.conflict, %found.conflict428, !dbg !931
  %bound0429 = icmp ult i8* %scevgep, %scevgep424425, !dbg !931
  %bound1430 = icmp ugt i8* %scevgep418, %23, !dbg !931
  %found.conflict431 = and i1 %bound0429, %bound1430, !dbg !931
  %conflict.rdx432 = or i1 %conflict.rdx, %found.conflict431, !dbg !931
  %bound0433 = icmp ult i8* %scevgep419, %scevgep422423, !dbg !931
  %bound1434 = icmp ugt i8* %scevgep421, %20, !dbg !931
  %found.conflict435 = and i1 %bound0433, %bound1434, !dbg !931
  %conflict.rdx436 = or i1 %conflict.rdx432, %found.conflict435, !dbg !931
  %bound0437 = icmp ult i8* %scevgep419, %scevgep424425, !dbg !931
  %bound1438 = icmp ugt i8* %scevgep421, %23, !dbg !931
  %found.conflict439 = and i1 %bound0437, %bound1438, !dbg !931
  %conflict.rdx440 = or i1 %conflict.rdx436, %found.conflict439, !dbg !931
  %ind.end = add nsw i64 %n.vec, %24, !dbg !931
  br i1 %conflict.rdx440, label %for.body16.preheader, label %vector.body.preheader, !dbg !931

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ], !dbg !947
  %35 = add i64 %index, %24
  %36 = getelementptr inbounds float, float* %19, i64 %index, !dbg !933
  %37 = bitcast float* %36 to <4 x i32>*, !dbg !933
  %wide.load = load <4 x i32>, <4 x i32>* %37, align 4, !dbg !933, !tbaa !939, !alias.scope !951
  %38 = getelementptr float, float* %36, i64 4, !dbg !933
  %39 = bitcast float* %38 to <4 x i32>*, !dbg !933
  %wide.load447 = load <4 x i32>, <4 x i32>* %39, align 4, !dbg !933, !tbaa !939, !alias.scope !951
  %40 = getelementptr inbounds float, float* %11, i64 %35, !dbg !941
  %41 = bitcast float* %40 to <4 x i32>*, !dbg !942
  store <4 x i32> %wide.load, <4 x i32>* %41, align 4, !dbg !942, !tbaa !939, !alias.scope !954, !noalias !956
  %42 = getelementptr float, float* %40, i64 4, !dbg !942
  %43 = bitcast float* %42 to <4 x i32>*, !dbg !942
  store <4 x i32> %wide.load447, <4 x i32>* %43, align 4, !dbg !942, !tbaa !939, !alias.scope !954, !noalias !956
  %44 = getelementptr inbounds float, float* %22, i64 %index, !dbg !943
  %45 = bitcast float* %44 to <4 x i32>*, !dbg !943
  %wide.load448 = load <4 x i32>, <4 x i32>* %45, align 4, !dbg !943, !tbaa !939, !alias.scope !959
  %46 = getelementptr float, float* %44, i64 4, !dbg !943
  %47 = bitcast float* %46 to <4 x i32>*, !dbg !943
  %wide.load449 = load <4 x i32>, <4 x i32>* %47, align 4, !dbg !943, !tbaa !939, !alias.scope !959
  %48 = getelementptr inbounds float, float* %12, i64 %35, !dbg !944
  %49 = bitcast float* %48 to <4 x i32>*, !dbg !945
  store <4 x i32> %wide.load448, <4 x i32>* %49, align 4, !dbg !945, !tbaa !939, !alias.scope !960, !noalias !961
  %50 = getelementptr float, float* %48, i64 4, !dbg !945
  %51 = bitcast float* %50 to <4 x i32>*, !dbg !945
  store <4 x i32> %wide.load449, <4 x i32>* %51, align 4, !dbg !945, !tbaa !939, !alias.scope !960, !noalias !961
  %index.next = add i64 %index, 8, !dbg !947
  %52 = icmp eq i64 %index.next, %n.vec, !dbg !947
  br i1 %52, label %middle.block, label %vector.body, !dbg !947, !llvm.loop !962

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond.cleanup15.loopexit, label %for.body16.preheader, !dbg !931

for.cond.cleanup.loopexit:                        ; preds = %for.cond.cleanup15
  br label %for.cond.cleanup, !dbg !967

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %entry
  %53 = bitcast float** %input_cuda to i8**, !dbg !967
  %conv32 = sext i32 %add to i64, !dbg !968
  %mul33 = shl nsw i64 %conv32, 2, !dbg !969
  %call34 = call i32 @cudaMalloc(i8** nonnull %53, i64 %mul33), !dbg !970
  %54 = bitcast float** %output_hidden_cuda to i8**, !dbg !971
  %conv36 = sext i32 %add1 to i64, !dbg !972
  %mul37 = shl nsw i64 %conv36, 2, !dbg !973
  %call38 = call i32 @cudaMalloc(i8** nonnull %54, i64 %mul37), !dbg !974
  %55 = bitcast float** %input_hidden_cuda to i8**, !dbg !975
  %call44 = call i32 @cudaMalloc(i8** nonnull %55, i64 %mul2), !dbg !976
  %56 = bitcast float** %hidden_partial_sum to i8**, !dbg !977
  %57 = load i32, i32* @num_blocks, align 4, !dbg !978, !tbaa !691
  %mul45 = shl i32 %57, 4, !dbg !979
  %conv46 = zext i32 %mul45 to i64, !dbg !978
  %mul47 = shl nuw nsw i64 %conv46, 2, !dbg !980
  %call48 = call i32 @cudaMalloc(i8** nonnull %56, i64 %mul47), !dbg !981
  %puts = call i32 @puts(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @str.7, i64 0, i64 0)), !dbg !982
  %58 = load i8*, i8** %53, align 8, !dbg !983, !tbaa !683
  %input_units = getelementptr inbounds %struct.BPNN, %struct.BPNN* %net, i64 0, i32 3, !dbg !984
  %59 = bitcast float** %input_units to i8**, !dbg !984
  %60 = load i8*, i8** %59, align 8, !dbg !984, !tbaa !985
  %call53 = call i32 @cudaMemcpy(i8* %58, i8* %60, i64 %mul33, i32 1), !dbg !986
  %61 = load i8*, i8** %55, align 8, !dbg !987, !tbaa !683
  %call59 = call i32 @cudaMemcpy(i8* %61, i8* %call, i64 %mul2, i32 1), !dbg !988
  %call60 = call i32 @cudaThreadSynchronize(), !dbg !989
  %62 = bitcast %struct.timeval* %time.i323 to i8*, !dbg !990
  call void @llvm.lifetime.start(i64 16, i8* nonnull %62) #8, !dbg !990
  call void @llvm.dbg.value(metadata %struct.timeval* %time.i323, i64 0, metadata !742, metadata !752) #8, !dbg !992
  %call.i324 = call i32 @gettimeofday(%struct.timeval* nonnull %time.i323, %struct.timezone* null) #8, !dbg !993
  %tobool.i325 = icmp eq i32 %call.i324, 0, !dbg !993
  br i1 %tobool.i325, label %if.end.i332, label %_Z8get_timev.exit334, !dbg !994

if.end.i332:                                      ; preds = %for.cond.cleanup
  %tv_sec.i326 = getelementptr inbounds %struct.timeval, %struct.timeval* %time.i323, i64 0, i32 0, !dbg !995
  %63 = load i64, i64* %tv_sec.i326, align 8, !dbg !995, !tbaa !758
  %conv.i327 = sitofp i64 %63 to double, !dbg !996
  %tv_usec.i328 = getelementptr inbounds %struct.timeval, %struct.timeval* %time.i323, i64 0, i32 1, !dbg !997
  %64 = load i64, i64* %tv_usec.i328, align 8, !dbg !997, !tbaa !763
  %conv1.i329 = sitofp i64 %64 to double, !dbg !998
  %mul.i330 = fmul double %conv1.i329, 1.000000e-06, !dbg !999
  %add.i331 = fadd double %mul.i330, %conv.i327, !dbg !1000
  br label %_Z8get_timev.exit334, !dbg !1001

_Z8get_timev.exit334:                             ; preds = %for.cond.cleanup, %if.end.i332
  %retval.0.i333 = phi double [ %add.i331, %if.end.i332 ], [ 0.000000e+00, %for.cond.cleanup ]
  call void @llvm.lifetime.end(i64 16, i8* nonnull %62) #8, !dbg !1002
  call void @llvm.dbg.value(metadata double %retval.0.i333, i64 0, metadata !868, metadata !681), !dbg !1003
  %grid.sroa.0.sroa.5.0.insert.ext = zext i32 %div to i64, !dbg !1004
  %grid.sroa.0.sroa.5.0.insert.shift = shl nuw i64 %grid.sroa.0.sroa.5.0.insert.ext, 32, !dbg !1004
  %grid.sroa.0.sroa.0.0.insert.insert = or i64 %grid.sroa.0.sroa.5.0.insert.shift, 1, !dbg !1004
  %call63 = call i32 @cudaConfigureCall(i64 %grid.sroa.0.sroa.0.0.insert.insert, i32 1, i64 68719476752, i32 1, i64 0, %struct.CUstream_st* null), !dbg !1005
  %tobool = icmp eq i32 %call63, 0, !dbg !1005
  br i1 %tobool, label %kcall.configok, label %kcall.end, !dbg !1006

for.cond.cleanup15.loopexit.loopexit.unr-lcssa:   ; preds = %for.body16
  br label %for.cond.cleanup15.loopexit.loopexit, !dbg !931

for.cond.cleanup15.loopexit.loopexit:             ; preds = %for.body16.prol.loopexit, %for.cond.cleanup15.loopexit.loopexit.unr-lcssa
  br label %for.cond.cleanup15.loopexit, !dbg !931

for.cond.cleanup15.loopexit:                      ; preds = %for.cond.cleanup15.loopexit.loopexit, %middle.block
  %65 = add i32 %14, %m.0396, !dbg !931
  br label %for.cond.cleanup15, !dbg !1007

for.cond.cleanup15:                               ; preds = %for.cond.cleanup15.loopexit, %for.cond13.preheader
  %m.1.lcssa = phi i32 [ %m.0396, %for.cond13.preheader ], [ %65, %for.cond.cleanup15.loopexit ]
  %indvars.iv.next414 = add nuw nsw i64 %indvars.iv413, 1, !dbg !1007
  tail call void @llvm.dbg.value(metadata i32 %m.1.lcssa, i64 0, metadata !826, metadata !681), !dbg !898
  %exitcond416 = icmp eq i64 %indvars.iv.next414, %wide.trip.count415, !dbg !927
  br i1 %exitcond416, label %for.cond.cleanup.loopexit, label %for.cond13.preheader, !dbg !929, !llvm.loop !1009

for.body16:                                       ; preds = %for.body16, %for.body16.preheader.new
  %indvars.iv409 = phi i64 [ %indvars.iv409.unr, %for.body16.preheader.new ], [ %indvars.iv.next410.3, %for.body16 ]
  %indvars.iv407 = phi i64 [ %indvars.iv407.unr, %for.body16.preheader.new ], [ %indvars.iv.next408.3, %for.body16 ]
  %arrayidx18 = getelementptr inbounds float, float* %19, i64 %indvars.iv409, !dbg !933
  %66 = bitcast float* %arrayidx18 to i32*, !dbg !933
  %67 = load i32, i32* %66, align 4, !dbg !933, !tbaa !939
  %arrayidx20 = getelementptr inbounds float, float* %11, i64 %indvars.iv407, !dbg !941
  %68 = bitcast float* %arrayidx20 to i32*, !dbg !942
  store i32 %67, i32* %68, align 4, !dbg !942, !tbaa !939
  %arrayidx24 = getelementptr inbounds float, float* %22, i64 %indvars.iv409, !dbg !943
  %69 = bitcast float* %arrayidx24 to i32*, !dbg !943
  %70 = load i32, i32* %69, align 4, !dbg !943, !tbaa !939
  %arrayidx26 = getelementptr inbounds float, float* %12, i64 %indvars.iv407, !dbg !944
  %71 = bitcast float* %arrayidx26 to i32*, !dbg !945
  store i32 %70, i32* %71, align 4, !dbg !945, !tbaa !939
  %indvars.iv.next408 = add nsw i64 %indvars.iv407, 1, !dbg !946
  %indvars.iv.next410 = add nuw nsw i64 %indvars.iv409, 1, !dbg !947
  %arrayidx18.1 = getelementptr inbounds float, float* %19, i64 %indvars.iv.next410, !dbg !933
  %72 = bitcast float* %arrayidx18.1 to i32*, !dbg !933
  %73 = load i32, i32* %72, align 4, !dbg !933, !tbaa !939
  %arrayidx20.1 = getelementptr inbounds float, float* %11, i64 %indvars.iv.next408, !dbg !941
  %74 = bitcast float* %arrayidx20.1 to i32*, !dbg !942
  store i32 %73, i32* %74, align 4, !dbg !942, !tbaa !939
  %arrayidx24.1 = getelementptr inbounds float, float* %22, i64 %indvars.iv.next410, !dbg !943
  %75 = bitcast float* %arrayidx24.1 to i32*, !dbg !943
  %76 = load i32, i32* %75, align 4, !dbg !943, !tbaa !939
  %arrayidx26.1 = getelementptr inbounds float, float* %12, i64 %indvars.iv.next408, !dbg !944
  %77 = bitcast float* %arrayidx26.1 to i32*, !dbg !945
  store i32 %76, i32* %77, align 4, !dbg !945, !tbaa !939
  %indvars.iv.next408.1 = add nsw i64 %indvars.iv407, 2, !dbg !946
  %indvars.iv.next410.1 = add nsw i64 %indvars.iv409, 2, !dbg !947
  %arrayidx18.2 = getelementptr inbounds float, float* %19, i64 %indvars.iv.next410.1, !dbg !933
  %78 = bitcast float* %arrayidx18.2 to i32*, !dbg !933
  %79 = load i32, i32* %78, align 4, !dbg !933, !tbaa !939
  %arrayidx20.2 = getelementptr inbounds float, float* %11, i64 %indvars.iv.next408.1, !dbg !941
  %80 = bitcast float* %arrayidx20.2 to i32*, !dbg !942
  store i32 %79, i32* %80, align 4, !dbg !942, !tbaa !939
  %arrayidx24.2 = getelementptr inbounds float, float* %22, i64 %indvars.iv.next410.1, !dbg !943
  %81 = bitcast float* %arrayidx24.2 to i32*, !dbg !943
  %82 = load i32, i32* %81, align 4, !dbg !943, !tbaa !939
  %arrayidx26.2 = getelementptr inbounds float, float* %12, i64 %indvars.iv.next408.1, !dbg !944
  %83 = bitcast float* %arrayidx26.2 to i32*, !dbg !945
  store i32 %82, i32* %83, align 4, !dbg !945, !tbaa !939
  %indvars.iv.next408.2 = add nsw i64 %indvars.iv407, 3, !dbg !946
  %indvars.iv.next410.2 = add nsw i64 %indvars.iv409, 3, !dbg !947
  %arrayidx18.3 = getelementptr inbounds float, float* %19, i64 %indvars.iv.next410.2, !dbg !933
  %84 = bitcast float* %arrayidx18.3 to i32*, !dbg !933
  %85 = load i32, i32* %84, align 4, !dbg !933, !tbaa !939
  %arrayidx20.3 = getelementptr inbounds float, float* %11, i64 %indvars.iv.next408.2, !dbg !941
  %86 = bitcast float* %arrayidx20.3 to i32*, !dbg !942
  store i32 %85, i32* %86, align 4, !dbg !942, !tbaa !939
  %arrayidx24.3 = getelementptr inbounds float, float* %22, i64 %indvars.iv.next410.2, !dbg !943
  %87 = bitcast float* %arrayidx24.3 to i32*, !dbg !943
  %88 = load i32, i32* %87, align 4, !dbg !943, !tbaa !939
  %arrayidx26.3 = getelementptr inbounds float, float* %12, i64 %indvars.iv.next408.2, !dbg !944
  %89 = bitcast float* %arrayidx26.3 to i32*, !dbg !945
  store i32 %88, i32* %89, align 4, !dbg !945, !tbaa !939
  %indvars.iv.next408.3 = add nsw i64 %indvars.iv407, 4, !dbg !946
  %indvars.iv.next410.3 = add nsw i64 %indvars.iv409, 4, !dbg !947
  %exitcond412.3 = icmp eq i64 %indvars.iv.next410.3, %wide.trip.count411, !dbg !1012
  br i1 %exitcond412.3, label %for.cond.cleanup15.loopexit.loopexit.unr-lcssa, label %for.body16, !dbg !931, !llvm.loop !1014

kcall.configok:                                   ; preds = %_Z8get_timev.exit334
  %90 = load float*, float** %input_cuda, align 8, !dbg !1015, !tbaa !683
  call void @llvm.dbg.value(metadata float* %90, i64 0, metadata !828, metadata !681), !dbg !1017
  %91 = load float*, float** %output_hidden_cuda, align 8, !dbg !1018, !tbaa !683
  call void @llvm.dbg.value(metadata float* %91, i64 0, metadata !829, metadata !681), !dbg !1019
  %92 = load float*, float** %input_hidden_cuda, align 8, !dbg !1020, !tbaa !683
  call void @llvm.dbg.value(metadata float* %92, i64 0, metadata !827, metadata !681), !dbg !1021
  %93 = load float*, float** %hidden_partial_sum, align 8, !dbg !1022, !tbaa !683
  call void @llvm.dbg.value(metadata float* %93, i64 0, metadata !831, metadata !681), !dbg !1023
  call void @_Z22bpnn_layerforward_CUDAPfS_S_S_ii(float* %90, float* %91, float* %92, float* %93, i32 %2, i32 %3), !dbg !1024
  br label %kcall.end, !dbg !1024

kcall.end:                                        ; preds = %_Z8get_timev.exit334, %kcall.configok
  %call64 = call i32 @cudaThreadSynchronize(), !dbg !1025
  %94 = bitcast %struct.timeval* %time.i335 to i8*, !dbg !1026
  call void @llvm.lifetime.start(i64 16, i8* nonnull %94) #8, !dbg !1026
  call void @llvm.dbg.value(metadata %struct.timeval* %time.i335, i64 0, metadata !742, metadata !752) #8, !dbg !1028
  %call.i336 = call i32 @gettimeofday(%struct.timeval* nonnull %time.i335, %struct.timezone* null) #8, !dbg !1029
  %tobool.i337 = icmp eq i32 %call.i336, 0, !dbg !1029
  br i1 %tobool.i337, label %if.end.i344, label %_Z8get_timev.exit346, !dbg !1030

if.end.i344:                                      ; preds = %kcall.end
  %tv_sec.i338 = getelementptr inbounds %struct.timeval, %struct.timeval* %time.i335, i64 0, i32 0, !dbg !1031
  %95 = load i64, i64* %tv_sec.i338, align 8, !dbg !1031, !tbaa !758
  %conv.i339 = sitofp i64 %95 to double, !dbg !1032
  %tv_usec.i340 = getelementptr inbounds %struct.timeval, %struct.timeval* %time.i335, i64 0, i32 1, !dbg !1033
  %96 = load i64, i64* %tv_usec.i340, align 8, !dbg !1033, !tbaa !763
  %conv1.i341 = sitofp i64 %96 to double, !dbg !1034
  %mul.i342 = fmul double %conv1.i341, 1.000000e-06, !dbg !1035
  %add.i343 = fadd double %mul.i342, %conv.i339, !dbg !1036
  br label %_Z8get_timev.exit346, !dbg !1037

_Z8get_timev.exit346:                             ; preds = %kcall.end, %if.end.i344
  %retval.0.i345 = phi double [ %add.i343, %if.end.i344 ], [ 0.000000e+00, %kcall.end ]
  call void @llvm.lifetime.end(i64 16, i8* nonnull %94) #8, !dbg !1038
  call void @llvm.dbg.value(metadata double %retval.0.i345, i64 0, metadata !869, metadata !681), !dbg !1039
  %call66 = call i32 @cudaGetLastError(), !dbg !1040
  call void @llvm.dbg.value(metadata i32 %call66, i64 0, metadata !870, metadata !681), !dbg !1041
  %cmp67 = icmp eq i32 %call66, 0, !dbg !1042
  br i1 %cmp67, label %if.end, label %if.then, !dbg !1044

if.then:                                          ; preds = %_Z8get_timev.exit346
  %call68 = call i8* @cudaGetErrorString(i32 %call66), !dbg !1045
  %call69 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.2, i64 0, i64 0), i8* %call68), !dbg !1047
  call void @exit(i32 1) #9, !dbg !1049
  unreachable, !dbg !1049

if.end:                                           ; preds = %_Z8get_timev.exit346
  %97 = load i8*, i8** %56, align 8, !dbg !1050, !tbaa !683
  %98 = load i32, i32* @num_blocks, align 4, !dbg !1051, !tbaa !691
  %mul70 = shl i32 %98, 4, !dbg !1052
  %conv71 = zext i32 %mul70 to i64, !dbg !1051
  %mul72 = shl nuw nsw i64 %conv71, 2, !dbg !1053
  %call73 = call i32 @cudaMemcpy(i8* %call12, i8* %97, i64 %mul72, i32 2), !dbg !1054
  call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !872, metadata !681), !dbg !1055
  call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !872, metadata !681), !dbg !1055
  %cmp76388 = icmp slt i32 %3, 1, !dbg !1056
  br i1 %cmp76388, label %if.end.for.cond.cleanup77_crit_edge, label %for.cond80.preheader.lr.ph, !dbg !1058

if.end.for.cond.cleanup77_crit_edge:              ; preds = %if.end
  %hidden_units108.phi.trans.insert = getelementptr inbounds %struct.BPNN, %struct.BPNN* %net, i64 0, i32 4
  %.pre = load float*, float** %hidden_units108.phi.trans.insert, align 8, !tbaa !1060
  br label %for.cond.cleanup77, !dbg !1058

for.cond80.preheader.lr.ph:                       ; preds = %if.end
  %input_weights92 = getelementptr inbounds %struct.BPNN, %struct.BPNN* %net, i64 0, i32 9
  %hidden_units = getelementptr inbounds %struct.BPNN, %struct.BPNN* %net, i64 0, i32 4
  %99 = sext i32 %3 to i64, !dbg !1058
  %wide.trip.count = zext i32 %add1 to i64
  br label %for.cond80.preheader, !dbg !1058

for.cond80.preheader:                             ; preds = %for.cond.cleanup82, %for.cond80.preheader.lr.ph
  %indvars.iv403 = phi i64 [ %indvars.iv.next404, %for.cond.cleanup82 ], [ 1, %for.cond80.preheader.lr.ph ]
  call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !834, metadata !681), !dbg !1061
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !874, metadata !681), !dbg !1062
  %100 = load i32, i32* @num_blocks, align 4, !dbg !1063, !tbaa !691
  %cmp81385 = icmp eq i32 %100, 0, !dbg !1066
  br i1 %cmp81385, label %for.cond.cleanup82, label %for.body83.lr.ph, !dbg !1067

for.body83.lr.ph:                                 ; preds = %for.cond80.preheader
  %101 = add i64 %indvars.iv403, 4294967295
  %102 = zext i32 %100 to i64, !dbg !1067
  %xtraiter = and i64 %102, 1, !dbg !1067
  %lcmp.mod = icmp eq i64 %xtraiter, 0, !dbg !1067
  br i1 %lcmp.mod, label %for.body83.prol.loopexit.unr-lcssa, label %for.body83.prol.preheader, !dbg !1067

for.body83.prol.preheader:                        ; preds = %for.body83.lr.ph
  br label %for.body83.prol, !dbg !1067

for.body83.prol:                                  ; preds = %for.body83.prol.preheader
  %sub.prol = shl i64 %indvars.iv403, 32, !dbg !1069
  %sext.prol = add i64 %sub.prol, -4294967296, !dbg !1069
  %idxprom86.prol = ashr exact i64 %sext.prol, 32, !dbg !1069
  %arrayidx87.prol = getelementptr inbounds float, float* %13, i64 %idxprom86.prol, !dbg !1069
  %103 = load float, float* %arrayidx87.prol, align 4, !dbg !1069, !tbaa !939
  %add88.prol = fadd float %103, 0.000000e+00, !dbg !1071
  call void @llvm.dbg.value(metadata float %add88.prol, i64 0, metadata !834, metadata !681), !dbg !1061
  call void @llvm.dbg.value(metadata float %add88.prol, i64 0, metadata !834, metadata !681), !dbg !1061
  br label %for.body83.prol.loopexit.unr-lcssa, !dbg !1067

for.body83.prol.loopexit.unr-lcssa:               ; preds = %for.body83.lr.ph, %for.body83.prol
  %indvars.iv400.unr.ph = phi i64 [ 1, %for.body83.prol ], [ 0, %for.body83.lr.ph ]
  %sum.0387.unr.ph = phi float [ %add88.prol, %for.body83.prol ], [ 0.000000e+00, %for.body83.lr.ph ]
  %add88.lcssa.unr.ph = phi float [ %add88.prol, %for.body83.prol ], [ undef, %for.body83.lr.ph ]
  br label %for.body83.prol.loopexit, !dbg !1067

for.body83.prol.loopexit:                         ; preds = %for.body83.prol.loopexit.unr-lcssa
  %104 = icmp eq i32 %100, 1, !dbg !1067
  br i1 %104, label %for.cond.cleanup82.loopexit, label %for.body83.lr.ph.new, !dbg !1067

for.body83.lr.ph.new:                             ; preds = %for.body83.prol.loopexit
  br label %for.body83, !dbg !1067

for.cond.cleanup77.loopexit:                      ; preds = %for.cond.cleanup82
  br label %for.cond.cleanup77, !dbg !1072

for.cond.cleanup77:                               ; preds = %for.cond.cleanup77.loopexit, %if.end.for.cond.cleanup77_crit_edge
  %hidden_units108.pre-phi = phi float** [ %hidden_units108.phi.trans.insert, %if.end.for.cond.cleanup77_crit_edge ], [ %hidden_units, %for.cond.cleanup77.loopexit ], !dbg !1073
  %105 = phi float* [ %.pre, %if.end.for.cond.cleanup77_crit_edge ], [ %132, %for.cond.cleanup77.loopexit ], !dbg !1073
  %output_units = getelementptr inbounds %struct.BPNN, %struct.BPNN* %net, i64 0, i32 5, !dbg !1072
  %106 = load float*, float** %output_units, align 8, !dbg !1072, !tbaa !1074
  %hidden_weights = getelementptr inbounds %struct.BPNN, %struct.BPNN* %net, i64 0, i32 10, !dbg !1075
  %107 = load float**, float*** %hidden_weights, align 8, !dbg !1075, !tbaa !1076
  call void @bpnn_layerforward(float* %105, float* %106, float** %107, i32 %3, i32 %4), !dbg !1077
  %output_delta = getelementptr inbounds %struct.BPNN, %struct.BPNN* %net, i64 0, i32 7, !dbg !1078
  %108 = load float*, float** %output_delta, align 8, !dbg !1078, !tbaa !1079
  %target = getelementptr inbounds %struct.BPNN, %struct.BPNN* %net, i64 0, i32 8, !dbg !1080
  %109 = load float*, float** %target, align 8, !dbg !1080, !tbaa !1081
  %110 = load float*, float** %output_units, align 8, !dbg !1082, !tbaa !1074
  call void @llvm.dbg.value(metadata float* %out_err, i64 0, metadata !824, metadata !752), !dbg !1083
  call void @bpnn_output_error(float* %108, float* %109, float* %110, i32 %4, float* nonnull %out_err), !dbg !1084
  %hidden_delta = getelementptr inbounds %struct.BPNN, %struct.BPNN* %net, i64 0, i32 6, !dbg !1085
  %111 = load float*, float** %hidden_delta, align 8, !dbg !1085, !tbaa !1086
  %112 = load float*, float** %output_delta, align 8, !dbg !1087, !tbaa !1079
  %113 = load float**, float*** %hidden_weights, align 8, !dbg !1088, !tbaa !1076
  %114 = load float*, float** %hidden_units108.pre-phi, align 8, !dbg !1089, !tbaa !1060
  call void @llvm.dbg.value(metadata float* %hid_err, i64 0, metadata !825, metadata !752), !dbg !1090
  call void @bpnn_hidden_error(float* %111, i32 %3, float* %112, i32 %4, float** %113, float* %114, float* nonnull %hid_err), !dbg !1091
  %115 = load float*, float** %output_delta, align 8, !dbg !1092, !tbaa !1079
  %116 = load float*, float** %hidden_units108.pre-phi, align 8, !dbg !1093, !tbaa !1060
  %117 = load float**, float*** %hidden_weights, align 8, !dbg !1094, !tbaa !1076
  %hidden_prev_weights = getelementptr inbounds %struct.BPNN, %struct.BPNN* %net, i64 0, i32 12, !dbg !1095
  %118 = load float**, float*** %hidden_prev_weights, align 8, !dbg !1095, !tbaa !1096
  call void @bpnn_adjust_weights(float* %115, i32 %4, float* %116, i32 %3, float** %117, float** %118), !dbg !1097
  %119 = bitcast float** %hidden_delta_cuda to i8**, !dbg !1098
  %call119 = call i32 @cudaMalloc(i8** nonnull %119, i64 %mul37), !dbg !1099
  %120 = bitcast float** %input_prev_weights_cuda to i8**, !dbg !1100
  %call125 = call i32 @cudaMalloc(i8** nonnull %120, i64 %mul2), !dbg !1101
  %121 = load i8*, i8** %119, align 8, !dbg !1102, !tbaa !683
  %122 = bitcast float** %hidden_delta to i8**, !dbg !1103
  %123 = load i8*, i8** %122, align 8, !dbg !1103, !tbaa !1086
  %call130 = call i32 @cudaMemcpy(i8* %121, i8* %123, i64 %mul37, i32 1), !dbg !1104
  %124 = load i8*, i8** %120, align 8, !dbg !1105, !tbaa !683
  %call136 = call i32 @cudaMemcpy(i8* %124, i8* %call8, i64 %mul2, i32 1), !dbg !1106
  %125 = load i8*, i8** %55, align 8, !dbg !1107, !tbaa !683
  %call142 = call i32 @cudaMemcpy(i8* %125, i8* %call, i64 %mul2, i32 1), !dbg !1108
  %call143 = call i32 @cudaThreadSynchronize(), !dbg !1109
  %126 = bitcast %struct.timeval* %time.i347 to i8*, !dbg !1110
  call void @llvm.lifetime.start(i64 16, i8* nonnull %126) #8, !dbg !1110
  call void @llvm.dbg.value(metadata %struct.timeval* %time.i347, i64 0, metadata !742, metadata !752) #8, !dbg !1112
  %call.i348 = call i32 @gettimeofday(%struct.timeval* nonnull %time.i347, %struct.timezone* null) #8, !dbg !1113
  %tobool.i349 = icmp eq i32 %call.i348, 0, !dbg !1113
  br i1 %tobool.i349, label %if.end.i356, label %_Z8get_timev.exit358, !dbg !1114

if.end.i356:                                      ; preds = %for.cond.cleanup77
  %tv_sec.i350 = getelementptr inbounds %struct.timeval, %struct.timeval* %time.i347, i64 0, i32 0, !dbg !1115
  %127 = load i64, i64* %tv_sec.i350, align 8, !dbg !1115, !tbaa !758
  %conv.i351 = sitofp i64 %127 to double, !dbg !1116
  %tv_usec.i352 = getelementptr inbounds %struct.timeval, %struct.timeval* %time.i347, i64 0, i32 1, !dbg !1117
  %128 = load i64, i64* %tv_usec.i352, align 8, !dbg !1117, !tbaa !763
  %conv1.i353 = sitofp i64 %128 to double, !dbg !1118
  %mul.i354 = fmul double %conv1.i353, 1.000000e-06, !dbg !1119
  %add.i355 = fadd double %mul.i354, %conv.i351, !dbg !1120
  br label %_Z8get_timev.exit358, !dbg !1121

_Z8get_timev.exit358:                             ; preds = %for.cond.cleanup77, %if.end.i356
  %retval.0.i357 = phi double [ %add.i355, %if.end.i356 ], [ 0.000000e+00, %for.cond.cleanup77 ]
  call void @llvm.lifetime.end(i64 16, i8* nonnull %126) #8, !dbg !1122
  call void @llvm.dbg.value(metadata double %retval.0.i357, i64 0, metadata !878, metadata !681), !dbg !1123
  %call147 = call i32 @cudaConfigureCall(i64 %grid.sroa.0.sroa.0.0.insert.insert, i32 1, i64 68719476752, i32 1, i64 0, %struct.CUstream_st* null), !dbg !1124
  %tobool148 = icmp eq i32 %call147, 0, !dbg !1124
  br i1 %tobool148, label %kcall.configok149, label %kcall.end150, !dbg !1125

for.cond.cleanup82.loopexit.unr-lcssa:            ; preds = %for.body83
  br label %for.cond.cleanup82.loopexit, !dbg !1126

for.cond.cleanup82.loopexit:                      ; preds = %for.body83.prol.loopexit, %for.cond.cleanup82.loopexit.unr-lcssa
  %add88.lcssa = phi float [ %add88.lcssa.unr.ph, %for.body83.prol.loopexit ], [ %add88.1, %for.cond.cleanup82.loopexit.unr-lcssa ]
  br label %for.cond.cleanup82, !dbg !1126

for.cond.cleanup82:                               ; preds = %for.cond.cleanup82.loopexit, %for.cond80.preheader
  %sum.0.lcssa = phi float [ 0.000000e+00, %for.cond80.preheader ], [ %add88.lcssa, %for.cond.cleanup82.loopexit ]
  %129 = load float**, float*** %input_weights92, align 8, !dbg !1126, !tbaa !937
  %130 = load float*, float** %129, align 8, !dbg !1127, !tbaa !683
  %arrayidx95 = getelementptr inbounds float, float* %130, i64 %indvars.iv403, !dbg !1127
  %131 = load float, float* %arrayidx95, align 4, !dbg !1127, !tbaa !939
  %add96 = fadd float %sum.0.lcssa, %131, !dbg !1128
  call void @llvm.dbg.value(metadata float %add96, i64 0, metadata !834, metadata !681), !dbg !1061
  %sub97 = fsub float -0.000000e+00, %add96, !dbg !1129
  %conv98 = fpext float %sub97 to double, !dbg !1129
  %call99 = call double @exp(double %conv98) #8, !dbg !1130
  %add100 = fadd double %call99, 1.000000e+00, !dbg !1131
  %div101 = fdiv double 1.000000e+00, %add100, !dbg !1132
  %conv102 = fptrunc double %div101 to float, !dbg !1133
  %132 = load float*, float** %hidden_units, align 8, !dbg !1134, !tbaa !1060
  %arrayidx104 = getelementptr inbounds float, float* %132, i64 %indvars.iv403, !dbg !1135
  store float %conv102, float* %arrayidx104, align 4, !dbg !1136, !tbaa !939
  %indvars.iv.next404 = add nuw nsw i64 %indvars.iv403, 1, !dbg !1137
  %exitcond406 = icmp eq i64 %indvars.iv.next404, %wide.trip.count, !dbg !1056
  br i1 %exitcond406, label %for.cond.cleanup77.loopexit, label %for.cond80.preheader, !dbg !1058, !llvm.loop !1139

for.body83:                                       ; preds = %for.body83, %for.body83.lr.ph.new
  %indvars.iv400 = phi i64 [ %indvars.iv400.unr.ph, %for.body83.lr.ph.new ], [ %indvars.iv.next401.1, %for.body83 ]
  %sum.0387 = phi float [ %sum.0387.unr.ph, %for.body83.lr.ph.new ], [ %add88.1, %for.body83 ]
  %133 = mul nsw i64 %indvars.iv400, %99, !dbg !1142
  %sub = add i64 %101, %133, !dbg !1143
  %sext = shl i64 %sub, 32, !dbg !1069
  %idxprom86 = ashr exact i64 %sext, 32, !dbg !1069
  %arrayidx87 = getelementptr inbounds float, float* %13, i64 %idxprom86, !dbg !1069
  %134 = load float, float* %arrayidx87, align 4, !dbg !1069, !tbaa !939
  %add88 = fadd float %sum.0387, %134, !dbg !1071
  call void @llvm.dbg.value(metadata float %add88, i64 0, metadata !834, metadata !681), !dbg !1061
  %indvars.iv.next401 = add nuw nsw i64 %indvars.iv400, 1, !dbg !1144
  call void @llvm.dbg.value(metadata float %add88, i64 0, metadata !834, metadata !681), !dbg !1061
  %135 = mul nsw i64 %indvars.iv.next401, %99, !dbg !1142
  %sub.1 = add i64 %101, %135, !dbg !1143
  %sext.1 = shl i64 %sub.1, 32, !dbg !1069
  %idxprom86.1 = ashr exact i64 %sext.1, 32, !dbg !1069
  %arrayidx87.1 = getelementptr inbounds float, float* %13, i64 %idxprom86.1, !dbg !1069
  %136 = load float, float* %arrayidx87.1, align 4, !dbg !1069, !tbaa !939
  %add88.1 = fadd float %add88, %136, !dbg !1071
  call void @llvm.dbg.value(metadata float %add88, i64 0, metadata !834, metadata !681), !dbg !1061
  %indvars.iv.next401.1 = add nsw i64 %indvars.iv400, 2, !dbg !1144
  call void @llvm.dbg.value(metadata float %add88, i64 0, metadata !834, metadata !681), !dbg !1061
  %cmp81.1 = icmp ult i64 %indvars.iv.next401.1, %102, !dbg !1066
  br i1 %cmp81.1, label %for.body83, label %for.cond.cleanup82.loopexit.unr-lcssa, !dbg !1067, !llvm.loop !1146

kcall.configok149:                                ; preds = %_Z8get_timev.exit358
  %137 = load float*, float** %hidden_delta_cuda, align 8, !dbg !1149, !tbaa !683
  call void @llvm.dbg.value(metadata float* %137, i64 0, metadata !832, metadata !681), !dbg !1150
  %138 = load float*, float** %input_cuda, align 8, !dbg !1151, !tbaa !683
  call void @llvm.dbg.value(metadata float* %138, i64 0, metadata !828, metadata !681), !dbg !1017
  %139 = load float*, float** %input_hidden_cuda, align 8, !dbg !1152, !tbaa !683
  call void @llvm.dbg.value(metadata float* %139, i64 0, metadata !827, metadata !681), !dbg !1021
  %140 = load float*, float** %input_prev_weights_cuda, align 8, !dbg !1153, !tbaa !683
  call void @llvm.dbg.value(metadata float* %140, i64 0, metadata !833, metadata !681), !dbg !1154
  call void @_Z24bpnn_adjust_weights_cudaPfiS_iS_S_(float* %137, i32 %3, float* %138, i32 %2, float* %139, float* %140), !dbg !1155
  br label %kcall.end150, !dbg !1155

kcall.end150:                                     ; preds = %_Z8get_timev.exit358, %kcall.configok149
  %call151 = call i32 @cudaThreadSynchronize(), !dbg !1156
  %141 = bitcast %struct.timeval* %time.i to i8*, !dbg !1157
  call void @llvm.lifetime.start(i64 16, i8* nonnull %141) #8, !dbg !1157
  call void @llvm.dbg.value(metadata %struct.timeval* %time.i, i64 0, metadata !742, metadata !752) #8, !dbg !1159
  %call.i = call i32 @gettimeofday(%struct.timeval* nonnull %time.i, %struct.timezone* null) #8, !dbg !1160
  %tobool.i = icmp eq i32 %call.i, 0, !dbg !1160
  br i1 %tobool.i, label %if.end.i, label %_Z8get_timev.exit, !dbg !1161

if.end.i:                                         ; preds = %kcall.end150
  %tv_sec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %time.i, i64 0, i32 0, !dbg !1162
  %142 = load i64, i64* %tv_sec.i, align 8, !dbg !1162, !tbaa !758
  %conv.i = sitofp i64 %142 to double, !dbg !1163
  %tv_usec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %time.i, i64 0, i32 1, !dbg !1164
  %143 = load i64, i64* %tv_usec.i, align 8, !dbg !1164, !tbaa !763
  %conv1.i = sitofp i64 %143 to double, !dbg !1165
  %mul.i = fmul double %conv1.i, 1.000000e-06, !dbg !1166
  %add.i = fadd double %mul.i, %conv.i, !dbg !1167
  br label %_Z8get_timev.exit, !dbg !1168

_Z8get_timev.exit:                                ; preds = %kcall.end150, %if.end.i
  %retval.0.i = phi double [ %add.i, %if.end.i ], [ 0.000000e+00, %kcall.end150 ]
  call void @llvm.lifetime.end(i64 16, i8* nonnull %141) #8, !dbg !1169
  call void @llvm.dbg.value(metadata double %retval.0.i, i64 0, metadata !879, metadata !681), !dbg !1170
  %144 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1171, !tbaa !683
  %sub153 = fsub double %retval.0.i, %retval.0.i357, !dbg !1172
  %add154 = fadd double %retval.0.i345, %sub153, !dbg !1173
  %sub155 = fsub double %add154, %retval.0.i333, !dbg !1174
  %call156 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %144, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0), double %sub155) #10, !dbg !1175
  %145 = load i8*, i8** %59, align 8, !dbg !1176, !tbaa !985
  %146 = load i8*, i8** %53, align 8, !dbg !1177, !tbaa !683
  %call161 = call i32 @cudaMemcpy(i8* %145, i8* %146, i64 %mul33, i32 2), !dbg !1178
  %147 = load i8*, i8** %55, align 8, !dbg !1179, !tbaa !683
  %call167 = call i32 @cudaMemcpy(i8* %call, i8* %147, i64 %mul2, i32 2), !dbg !1180
  %puts317 = call i32 @puts(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @str.8, i64 0, i64 0)), !dbg !1181
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !880, metadata !681), !dbg !1182
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !880, metadata !681), !dbg !1182
  br label %for.body172, !dbg !1183

for.cond.cleanup171:                              ; preds = %for.body172
  %putchar = call i32 @putchar(i32 10), !dbg !1185
  %putchar318 = call i32 @putchar(i32 10), !dbg !1186
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !882, metadata !681), !dbg !1187
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !882, metadata !681), !dbg !1187
  br label %for.body187, !dbg !1188

for.body172:                                      ; preds = %for.body172, %_Z8get_timev.exit
  %indvars.iv397 = phi i64 [ 0, %_Z8get_timev.exit ], [ %indvars.iv.next398, %for.body172 ]
  %148 = load float*, float** %input_units, align 8, !dbg !1190, !tbaa !985
  %arrayidx175 = getelementptr inbounds float, float* %148, i64 %indvars.iv397, !dbg !1192
  %149 = load float, float* %arrayidx175, align 4, !dbg !1192, !tbaa !939
  %conv176 = fpext float %149 to double, !dbg !1192
  %call177 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), double %conv176), !dbg !1193
  %indvars.iv.next398 = add nuw nsw i64 %indvars.iv397, 1, !dbg !1194
  %exitcond399 = icmp eq i64 %indvars.iv.next398, 30, !dbg !1196
  br i1 %exitcond399, label %for.cond.cleanup171, label %for.body172, !dbg !1183, !llvm.loop !1198

for.cond.cleanup186:                              ; preds = %for.body187
  %putchar319 = call i32 @putchar(i32 10), !dbg !1201
  %150 = load i8*, i8** %53, align 8, !dbg !1202, !tbaa !683
  %call196 = call i32 @cudaFree(i8* %150), !dbg !1203
  %151 = load i8*, i8** %54, align 8, !dbg !1204, !tbaa !683
  %call197 = call i32 @cudaFree(i8* %151), !dbg !1205
  %152 = load i8*, i8** %55, align 8, !dbg !1206, !tbaa !683
  %call198 = call i32 @cudaFree(i8* %152), !dbg !1207
  %153 = load i8*, i8** %56, align 8, !dbg !1208, !tbaa !683
  %call199 = call i32 @cudaFree(i8* %153), !dbg !1209
  %154 = load i8*, i8** %119, align 8, !dbg !1210, !tbaa !683
  %call200 = call i32 @cudaFree(i8* %154), !dbg !1211
  call void @free(i8* %call12) #8, !dbg !1212
  call void @free(i8* nonnull %call) #8, !dbg !1213
  call void @free(i8* %call8) #8, !dbg !1214
  call void @llvm.lifetime.end(i64 8, i8* nonnull %10) #8, !dbg !1215
  call void @llvm.lifetime.end(i64 8, i8* nonnull %9) #8, !dbg !1215
  call void @llvm.lifetime.end(i64 8, i8* nonnull %8) #8, !dbg !1215
  call void @llvm.lifetime.end(i64 8, i8* nonnull %7) #8, !dbg !1215
  call void @llvm.lifetime.end(i64 8, i8* nonnull %6) #8, !dbg !1215
  call void @llvm.lifetime.end(i64 8, i8* nonnull %5) #8, !dbg !1215
  call void @llvm.lifetime.end(i64 4, i8* nonnull %1) #8, !dbg !1215
  call void @llvm.lifetime.end(i64 4, i8* nonnull %0) #8, !dbg !1215
  ret void, !dbg !1215

for.body187:                                      ; preds = %for.body187, %for.cond.cleanup171
  %indvars.iv = phi i64 [ 0, %for.cond.cleanup171 ], [ %indvars.iv.next, %for.body187 ]
  %arrayidx189 = getelementptr inbounds float, float* %11, i64 %indvars.iv, !dbg !1216
  %155 = load float, float* %arrayidx189, align 4, !dbg !1216, !tbaa !939
  %conv190 = fpext float %155 to double, !dbg !1216
  %call191 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), double %conv190), !dbg !1218
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !1219
  %exitcond = icmp eq i64 %indvars.iv.next, 30, !dbg !1221
  br i1 %exitcond, label %for.cond.cleanup186, label %for.body187, !dbg !1188, !llvm.loop !1223
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) local_unnamed_addr #3

declare i32 @cudaMalloc(i8**, i64) local_unnamed_addr #5

declare i32 @cudaMemcpy(i8*, i8*, i64, i32) local_unnamed_addr #5

declare i32 @cudaThreadSynchronize() local_unnamed_addr #5

declare i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) local_unnamed_addr #5

declare i32 @cudaGetLastError() local_unnamed_addr #5

declare i8* @cudaGetErrorString(i32) local_unnamed_addr #5

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #6

; Function Attrs: nounwind
declare double @exp(double) local_unnamed_addr #3

declare void @bpnn_layerforward(float*, float*, float**, i32, i32) local_unnamed_addr #5

declare void @bpnn_output_error(float*, float*, float*, i32, float*) local_unnamed_addr #5

declare void @bpnn_hidden_error(float*, i32, float*, i32, float**, float*, float*) local_unnamed_addr #5

declare void @bpnn_adjust_weights(float*, i32, float*, i32, float**, float**) local_unnamed_addr #5

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

declare i32 @cudaFree(i8*) local_unnamed_addr #5

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #7

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #8

declare i32 @putchar(i32)

attributes #0 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind readnone }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }
attributes #10 = { cold }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!667, !668}
!llvm.ident = !{!669}

!0 = !DIGlobalVariableExpression(var: !1)
!1 = distinct !DIGlobalVariable(name: "num_threads", scope: !2, file: !3, line: 54, type: !111, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !3, producer: "clang version 5.0.0 (trunk 294196)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !102, globals: !108, imports: !112)
!3 = !DIFile(filename: "backprop_cuda.cu", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/backpropllvm")
!4 = !{!5, !13, !20}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaLimit", file: !6, line: 1145, size: 32, elements: !7, identifier: "_ZTS9cudaLimit")
!6 = !DIFile(filename: "/usr/local/cuda/include/driver_types.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/backpropllvm")
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
!20 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaError", file: !6, line: 150, size: 32, elements: !21, identifier: "_ZTS9cudaError")
!21 = !{!22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101}
!22 = !DIEnumerator(name: "cudaSuccess", value: 0)
!23 = !DIEnumerator(name: "cudaErrorMissingConfiguration", value: 1)
!24 = !DIEnumerator(name: "cudaErrorMemoryAllocation", value: 2)
!25 = !DIEnumerator(name: "cudaErrorInitializationError", value: 3)
!26 = !DIEnumerator(name: "cudaErrorLaunchFailure", value: 4)
!27 = !DIEnumerator(name: "cudaErrorPriorLaunchFailure", value: 5)
!28 = !DIEnumerator(name: "cudaErrorLaunchTimeout", value: 6)
!29 = !DIEnumerator(name: "cudaErrorLaunchOutOfResources", value: 7)
!30 = !DIEnumerator(name: "cudaErrorInvalidDeviceFunction", value: 8)
!31 = !DIEnumerator(name: "cudaErrorInvalidConfiguration", value: 9)
!32 = !DIEnumerator(name: "cudaErrorInvalidDevice", value: 10)
!33 = !DIEnumerator(name: "cudaErrorInvalidValue", value: 11)
!34 = !DIEnumerator(name: "cudaErrorInvalidPitchValue", value: 12)
!35 = !DIEnumerator(name: "cudaErrorInvalidSymbol", value: 13)
!36 = !DIEnumerator(name: "cudaErrorMapBufferObjectFailed", value: 14)
!37 = !DIEnumerator(name: "cudaErrorUnmapBufferObjectFailed", value: 15)
!38 = !DIEnumerator(name: "cudaErrorInvalidHostPointer", value: 16)
!39 = !DIEnumerator(name: "cudaErrorInvalidDevicePointer", value: 17)
!40 = !DIEnumerator(name: "cudaErrorInvalidTexture", value: 18)
!41 = !DIEnumerator(name: "cudaErrorInvalidTextureBinding", value: 19)
!42 = !DIEnumerator(name: "cudaErrorInvalidChannelDescriptor", value: 20)
!43 = !DIEnumerator(name: "cudaErrorInvalidMemcpyDirection", value: 21)
!44 = !DIEnumerator(name: "cudaErrorAddressOfConstant", value: 22)
!45 = !DIEnumerator(name: "cudaErrorTextureFetchFailed", value: 23)
!46 = !DIEnumerator(name: "cudaErrorTextureNotBound", value: 24)
!47 = !DIEnumerator(name: "cudaErrorSynchronizationError", value: 25)
!48 = !DIEnumerator(name: "cudaErrorInvalidFilterSetting", value: 26)
!49 = !DIEnumerator(name: "cudaErrorInvalidNormSetting", value: 27)
!50 = !DIEnumerator(name: "cudaErrorMixedDeviceExecution", value: 28)
!51 = !DIEnumerator(name: "cudaErrorCudartUnloading", value: 29)
!52 = !DIEnumerator(name: "cudaErrorUnknown", value: 30)
!53 = !DIEnumerator(name: "cudaErrorNotYetImplemented", value: 31)
!54 = !DIEnumerator(name: "cudaErrorMemoryValueTooLarge", value: 32)
!55 = !DIEnumerator(name: "cudaErrorInvalidResourceHandle", value: 33)
!56 = !DIEnumerator(name: "cudaErrorNotReady", value: 34)
!57 = !DIEnumerator(name: "cudaErrorInsufficientDriver", value: 35)
!58 = !DIEnumerator(name: "cudaErrorSetOnActiveProcess", value: 36)
!59 = !DIEnumerator(name: "cudaErrorInvalidSurface", value: 37)
!60 = !DIEnumerator(name: "cudaErrorNoDevice", value: 38)
!61 = !DIEnumerator(name: "cudaErrorECCUncorrectable", value: 39)
!62 = !DIEnumerator(name: "cudaErrorSharedObjectSymbolNotFound", value: 40)
!63 = !DIEnumerator(name: "cudaErrorSharedObjectInitFailed", value: 41)
!64 = !DIEnumerator(name: "cudaErrorUnsupportedLimit", value: 42)
!65 = !DIEnumerator(name: "cudaErrorDuplicateVariableName", value: 43)
!66 = !DIEnumerator(name: "cudaErrorDuplicateTextureName", value: 44)
!67 = !DIEnumerator(name: "cudaErrorDuplicateSurfaceName", value: 45)
!68 = !DIEnumerator(name: "cudaErrorDevicesUnavailable", value: 46)
!69 = !DIEnumerator(name: "cudaErrorInvalidKernelImage", value: 47)
!70 = !DIEnumerator(name: "cudaErrorNoKernelImageForDevice", value: 48)
!71 = !DIEnumerator(name: "cudaErrorIncompatibleDriverContext", value: 49)
!72 = !DIEnumerator(name: "cudaErrorPeerAccessAlreadyEnabled", value: 50)
!73 = !DIEnumerator(name: "cudaErrorPeerAccessNotEnabled", value: 51)
!74 = !DIEnumerator(name: "cudaErrorDeviceAlreadyInUse", value: 54)
!75 = !DIEnumerator(name: "cudaErrorProfilerDisabled", value: 55)
!76 = !DIEnumerator(name: "cudaErrorProfilerNotInitialized", value: 56)
!77 = !DIEnumerator(name: "cudaErrorProfilerAlreadyStarted", value: 57)
!78 = !DIEnumerator(name: "cudaErrorProfilerAlreadyStopped", value: 58)
!79 = !DIEnumerator(name: "cudaErrorAssert", value: 59)
!80 = !DIEnumerator(name: "cudaErrorTooManyPeers", value: 60)
!81 = !DIEnumerator(name: "cudaErrorHostMemoryAlreadyRegistered", value: 61)
!82 = !DIEnumerator(name: "cudaErrorHostMemoryNotRegistered", value: 62)
!83 = !DIEnumerator(name: "cudaErrorOperatingSystem", value: 63)
!84 = !DIEnumerator(name: "cudaErrorPeerAccessUnsupported", value: 64)
!85 = !DIEnumerator(name: "cudaErrorLaunchMaxDepthExceeded", value: 65)
!86 = !DIEnumerator(name: "cudaErrorLaunchFileScopedTex", value: 66)
!87 = !DIEnumerator(name: "cudaErrorLaunchFileScopedSurf", value: 67)
!88 = !DIEnumerator(name: "cudaErrorSyncDepthExceeded", value: 68)
!89 = !DIEnumerator(name: "cudaErrorLaunchPendingCountExceeded", value: 69)
!90 = !DIEnumerator(name: "cudaErrorNotPermitted", value: 70)
!91 = !DIEnumerator(name: "cudaErrorNotSupported", value: 71)
!92 = !DIEnumerator(name: "cudaErrorHardwareStackError", value: 72)
!93 = !DIEnumerator(name: "cudaErrorIllegalInstruction", value: 73)
!94 = !DIEnumerator(name: "cudaErrorMisalignedAddress", value: 74)
!95 = !DIEnumerator(name: "cudaErrorInvalidAddressSpace", value: 75)
!96 = !DIEnumerator(name: "cudaErrorInvalidPc", value: 76)
!97 = !DIEnumerator(name: "cudaErrorIllegalAddress", value: 77)
!98 = !DIEnumerator(name: "cudaErrorInvalidPtx", value: 78)
!99 = !DIEnumerator(name: "cudaErrorInvalidGraphicsContext", value: 79)
!100 = !DIEnumerator(name: "cudaErrorStartupFailure", value: 127)
!101 = !DIEnumerator(name: "cudaErrorApiFailureBase", value: 10000)
!102 = !{!103, !104, !106, !105}
!103 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!104 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !105, size: 64)
!105 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!106 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !107, size: 64)
!107 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!108 = !{!0, !109}
!109 = !DIGlobalVariableExpression(var: !110)
!110 = distinct !DIGlobalVariable(name: "num_blocks", scope: !2, file: !3, line: 55, type: !111, isLocal: false, isDefinition: true)
!111 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!112 = !{!113, !120, !124, !126, !128, !130, !132, !136, !138, !140, !142, !144, !146, !148, !150, !152, !154, !156, !158, !160, !162, !164, !168, !170, !172, !174, !179, !184, !186, !188, !193, !197, !199, !201, !203, !205, !207, !209, !211, !213, !218, !222, !224, !226, !230, !232, !234, !236, !238, !240, !244, !246, !248, !252, !259, !263, !265, !267, !271, !273, !275, !279, !281, !283, !287, !289, !291, !293, !295, !297, !299, !301, !303, !305, !310, !312, !314, !318, !320, !322, !324, !326, !328, !330, !332, !336, !340, !342, !344, !349, !351, !353, !355, !357, !359, !361, !365, !371, !375, !379, !384, !387, !391, !395, !409, !413, !417, !421, !425, !430, !432, !436, !440, !444, !452, !456, !460, !464, !468, !472, !478, !482, !486, !488, !496, !500, !508, !510, !512, !516, !520, !524, !529, !533, !538, !539, !540, !541, !544, !545, !546, !547, !548, !549, !550, !553, !555, !557, !559, !561, !563, !565, !567, !570, !572, !574, !576, !578, !580, !582, !584, !586, !588, !590, !592, !594, !596, !598, !600, !602, !604, !606, !608, !610, !612, !614, !616, !618, !620, !622, !624, !626, !628, !630, !632, !634, !638, !639, !641, !643, !645, !647, !649, !651, !653, !655, !657, !659, !661, !663, !665}
!113 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !116, line: 201)
!114 = !DINamespace(name: "std", scope: null, file: !115, line: 195)
!115 = !DIFile(filename: "/home/dshen/llvm/build/bin/../lib/clang/5.0.0/include/__clang_cuda_math_forward_declares.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/backpropllvm")
!116 = !DISubprogram(name: "abs", linkageName: "_ZL3absx", scope: !115, file: !115, line: 44, type: !117, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!117 = !DISubroutineType(types: !118)
!118 = !{!119, !119}
!119 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!120 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !121, line: 202)
!121 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !115, file: !115, line: 46, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!122 = !DISubroutineType(types: !123)
!123 = !{!105, !105}
!124 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !125, line: 203)
!125 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !115, file: !115, line: 48, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!126 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !127, line: 204)
!127 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !115, file: !115, line: 50, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!128 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !129, line: 205)
!129 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !115, file: !115, line: 52, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!130 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !131, line: 206)
!131 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !115, file: !115, line: 56, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!132 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !133, line: 207)
!133 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !115, file: !115, line: 54, type: !134, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!134 = !DISubroutineType(types: !135)
!135 = !{!105, !105, !105}
!136 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !137, line: 208)
!137 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !115, file: !115, line: 58, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!138 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !139, line: 209)
!139 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !115, file: !115, line: 60, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!140 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !141, line: 210)
!141 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !115, file: !115, line: 62, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!142 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !143, line: 211)
!143 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !115, file: !115, line: 64, type: !134, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!144 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !145, line: 212)
!145 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !115, file: !115, line: 66, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !147, line: 213)
!147 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !115, file: !115, line: 68, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!148 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !149, line: 214)
!149 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !115, file: !115, line: 72, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!150 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !151, line: 215)
!151 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !115, file: !115, line: 70, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !153, line: 216)
!153 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !115, file: !115, line: 76, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!154 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !155, line: 217)
!155 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !115, file: !115, line: 74, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !157, line: 218)
!157 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !115, file: !115, line: 78, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!158 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !159, line: 219)
!159 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !115, file: !115, line: 80, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!160 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !161, line: 220)
!161 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !115, file: !115, line: 82, type: !134, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!162 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !163, line: 221)
!163 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !115, file: !115, line: 84, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!164 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !165, line: 222)
!165 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !115, file: !115, line: 86, type: !166, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!166 = !DISubroutineType(types: !167)
!167 = !{!105, !105, !105, !105}
!168 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !169, line: 223)
!169 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !115, file: !115, line: 88, type: !134, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !171, line: 224)
!171 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !115, file: !115, line: 90, type: !134, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !173, line: 225)
!173 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !115, file: !115, line: 92, type: !134, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!174 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !175, line: 226)
!175 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !115, file: !115, line: 94, type: !176, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!176 = !DISubroutineType(types: !177)
!177 = !{!178, !105}
!178 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !180, line: 227)
!180 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !115, file: !115, line: 96, type: !181, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!181 = !DISubroutineType(types: !182)
!182 = !{!105, !105, !183}
!183 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !178, size: 64)
!184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !185, line: 228)
!185 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !115, file: !115, line: 98, type: !134, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!186 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !187, line: 229)
!187 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !115, file: !115, line: 100, type: !176, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !189, line: 230)
!189 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !115, file: !115, line: 102, type: !190, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!190 = !DISubroutineType(types: !191)
!191 = !{!192, !105}
!192 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!193 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !194, line: 231)
!194 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !115, file: !115, line: 106, type: !195, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!195 = !DISubroutineType(types: !196)
!196 = !{!192, !105, !105}
!197 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !198, line: 232)
!198 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !115, file: !115, line: 105, type: !195, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !200, line: 233)
!200 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !115, file: !115, line: 108, type: !190, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!201 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !202, line: 234)
!202 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !115, file: !115, line: 112, type: !195, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !204, line: 235)
!204 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !115, file: !115, line: 111, type: !195, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!205 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !206, line: 236)
!206 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !115, file: !115, line: 114, type: !195, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!207 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !208, line: 237)
!208 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !115, file: !115, line: 116, type: !190, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !210, line: 238)
!210 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !115, file: !115, line: 118, type: !190, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!211 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !212, line: 239)
!212 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !115, file: !115, line: 120, type: !195, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !214, line: 240)
!214 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !115, file: !115, line: 121, type: !215, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!215 = !DISubroutineType(types: !216)
!216 = !{!217, !217}
!217 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !219, line: 241)
!219 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !115, file: !115, line: 123, type: !220, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!220 = !DISubroutineType(types: !221)
!221 = !{!105, !105, !178}
!222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !223, line: 242)
!223 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !115, file: !115, line: 125, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !225, line: 243)
!225 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !115, file: !115, line: 126, type: !117, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !227, line: 244)
!227 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !115, file: !115, line: 128, type: !228, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!228 = !DISubroutineType(types: !229)
!229 = !{!119, !105}
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !231, line: 245)
!231 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !115, file: !115, line: 138, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !233, line: 246)
!233 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !115, file: !115, line: 130, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !235, line: 247)
!235 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !115, file: !115, line: 132, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !237, line: 248)
!237 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !115, file: !115, line: 134, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !239, line: 249)
!239 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !115, file: !115, line: 136, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !241, line: 250)
!241 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !115, file: !115, line: 140, type: !242, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!242 = !DISubroutineType(types: !243)
!243 = !{!217, !105}
!244 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !245, line: 251)
!245 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !115, file: !115, line: 142, type: !242, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !247, line: 252)
!247 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !115, file: !115, line: 143, type: !228, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!248 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !249, line: 253)
!249 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !115, file: !115, line: 145, type: !250, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!250 = !DISubroutineType(types: !251)
!251 = !{!105, !105, !104}
!252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !253, line: 254)
!253 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !115, file: !115, line: 146, type: !254, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!254 = !DISubroutineType(types: !255)
!255 = !{!103, !256}
!256 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !257, size: 64)
!257 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !258)
!258 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!259 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !260, line: 255)
!260 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !115, file: !115, line: 147, type: !261, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!261 = !DISubroutineType(types: !262)
!262 = !{!105, !256}
!263 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !264, line: 256)
!264 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !115, file: !115, line: 149, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !266, line: 257)
!266 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !115, file: !115, line: 151, type: !134, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!267 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !268, line: 258)
!268 = !DISubprogram(name: "nexttoward", linkageName: "_ZL10nexttowardfd", scope: !115, file: !115, line: 153, type: !269, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!269 = !DISubroutineType(types: !270)
!270 = !{!105, !105, !103}
!271 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !272, line: 259)
!272 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !115, file: !115, line: 158, type: !220, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!273 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !274, line: 260)
!274 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !115, file: !115, line: 160, type: !134, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!275 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !276, line: 261)
!276 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !115, file: !115, line: 162, type: !277, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!277 = !DISubroutineType(types: !278)
!278 = !{!105, !105, !105, !183}
!279 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !280, line: 262)
!280 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !115, file: !115, line: 164, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!281 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !282, line: 263)
!282 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !115, file: !115, line: 166, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!283 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !284, line: 264)
!284 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !115, file: !115, line: 168, type: !285, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!285 = !DISubroutineType(types: !286)
!286 = !{!105, !105, !217}
!287 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !288, line: 265)
!288 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !115, file: !115, line: 170, type: !220, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!289 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !290, line: 266)
!290 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !115, file: !115, line: 172, type: !190, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!291 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !292, line: 267)
!292 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !115, file: !115, line: 174, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!293 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !294, line: 268)
!294 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !115, file: !115, line: 176, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!295 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !296, line: 269)
!296 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !115, file: !115, line: 178, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !298, line: 270)
!298 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !115, file: !115, line: 180, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!299 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !300, line: 271)
!300 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !115, file: !115, line: 182, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!301 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !302, line: 272)
!302 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !115, file: !115, line: 184, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!303 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !304, line: 273)
!304 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !115, file: !115, line: 186, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!305 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !306, line: 102)
!306 = !DISubprogram(name: "acos", scope: !307, file: !307, line: 54, type: !308, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!307 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/backpropllvm")
!308 = !DISubroutineType(types: !309)
!309 = !{!103, !103}
!310 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !311, line: 121)
!311 = !DISubprogram(name: "asin", scope: !307, file: !307, line: 56, type: !308, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!312 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !313, line: 140)
!313 = !DISubprogram(name: "atan", scope: !307, file: !307, line: 58, type: !308, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!314 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !315, line: 159)
!315 = !DISubprogram(name: "atan2", scope: !307, file: !307, line: 60, type: !316, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!316 = !DISubroutineType(types: !317)
!317 = !{!103, !103, !103}
!318 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !319, line: 180)
!319 = !DISubprogram(name: "ceil", scope: !307, file: !307, line: 178, type: !308, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!320 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !321, line: 199)
!321 = !DISubprogram(name: "cos", scope: !307, file: !307, line: 63, type: !308, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!322 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !323, line: 218)
!323 = !DISubprogram(name: "cosh", scope: !307, file: !307, line: 72, type: !308, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !325, line: 237)
!325 = !DISubprogram(name: "exp", scope: !307, file: !307, line: 100, type: !308, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!326 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !327, line: 256)
!327 = !DISubprogram(name: "fabs", scope: !307, file: !307, line: 181, type: !308, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!328 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !329, line: 275)
!329 = !DISubprogram(name: "floor", scope: !307, file: !307, line: 184, type: !308, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!330 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !331, line: 294)
!331 = !DISubprogram(name: "fmod", scope: !307, file: !307, line: 187, type: !316, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!332 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !333, line: 315)
!333 = !DISubprogram(name: "frexp", scope: !307, file: !307, line: 103, type: !334, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!334 = !DISubroutineType(types: !335)
!335 = !{!103, !103, !183}
!336 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !337, line: 334)
!337 = !DISubprogram(name: "ldexp", scope: !307, file: !307, line: 106, type: !338, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!338 = !DISubroutineType(types: !339)
!339 = !{!103, !103, !178}
!340 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !341, line: 353)
!341 = !DISubprogram(name: "log", scope: !307, file: !307, line: 109, type: !308, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!342 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !343, line: 372)
!343 = !DISubprogram(name: "log10", scope: !307, file: !307, line: 112, type: !308, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!344 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !345, line: 391)
!345 = !DISubprogram(name: "modf", scope: !307, file: !307, line: 115, type: !346, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!346 = !DISubroutineType(types: !347)
!347 = !{!103, !103, !348}
!348 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !103, size: 64)
!349 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !350, line: 403)
!350 = !DISubprogram(name: "pow", scope: !307, file: !307, line: 153, type: !316, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!351 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !352, line: 440)
!352 = !DISubprogram(name: "sin", scope: !307, file: !307, line: 65, type: !308, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!353 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !354, line: 459)
!354 = !DISubprogram(name: "sinh", scope: !307, file: !307, line: 74, type: !308, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!355 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !356, line: 478)
!356 = !DISubprogram(name: "sqrt", scope: !307, file: !307, line: 156, type: !308, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!357 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !358, line: 497)
!358 = !DISubprogram(name: "tan", scope: !307, file: !307, line: 67, type: !308, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!359 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !360, line: 516)
!360 = !DISubprogram(name: "tanh", scope: !307, file: !307, line: 76, type: !308, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!361 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !362, line: 118)
!362 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !363, line: 101, baseType: !364)
!363 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/backpropllvm")
!364 = !DICompositeType(tag: DW_TAG_structure_type, file: !363, line: 97, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!365 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !366, line: 119)
!366 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !363, line: 109, baseType: !367)
!367 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !363, line: 105, size: 128, elements: !368, identifier: "_ZTS6ldiv_t")
!368 = !{!369, !370}
!369 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !367, file: !363, line: 107, baseType: !217, size: 64)
!370 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !367, file: !363, line: 108, baseType: !217, size: 64, offset: 64)
!371 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !372, line: 121)
!372 = !DISubprogram(name: "abort", scope: !363, file: !363, line: 515, type: !373, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: true)
!373 = !DISubroutineType(types: !374)
!374 = !{null}
!375 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !376, line: 122)
!376 = !DISubprogram(name: "abs", scope: !363, file: !363, line: 775, type: !377, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!377 = !DISubroutineType(types: !378)
!378 = !{!178, !178}
!379 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !380, line: 123)
!380 = !DISubprogram(name: "atexit", scope: !363, file: !363, line: 519, type: !381, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!381 = !DISubroutineType(types: !382)
!382 = !{!178, !383}
!383 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !373, size: 64)
!384 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !385, line: 129)
!385 = !DISubprogram(name: "atof", scope: !386, file: !386, line: 26, type: !254, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!386 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/backpropllvm")
!387 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !388, line: 130)
!388 = !DISubprogram(name: "atoi", scope: !363, file: !363, line: 278, type: !389, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!389 = !DISubroutineType(types: !390)
!390 = !{!178, !256}
!391 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !392, line: 131)
!392 = !DISubprogram(name: "atol", scope: !363, file: !363, line: 283, type: !393, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!393 = !DISubroutineType(types: !394)
!394 = !{!217, !256}
!395 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !396, line: 132)
!396 = !DISubprogram(name: "bsearch", scope: !397, file: !397, line: 20, type: !398, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!397 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdlib-bsearch.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/backpropllvm")
!398 = !DISubroutineType(types: !399)
!399 = !{!107, !400, !400, !402, !402, !405}
!400 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !401, size: 64)
!401 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!402 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !403, line: 62, baseType: !404)
!403 = !DIFile(filename: "/home/dshen/llvm/build/bin/../lib/clang/5.0.0/include/stddef.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/backpropllvm")
!404 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!405 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !363, line: 742, baseType: !406)
!406 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !407, size: 64)
!407 = !DISubroutineType(types: !408)
!408 = !{!178, !400, !400}
!409 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !410, line: 133)
!410 = !DISubprogram(name: "calloc", scope: !363, file: !363, line: 468, type: !411, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!411 = !DISubroutineType(types: !412)
!412 = !{!107, !402, !402}
!413 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !414, line: 134)
!414 = !DISubprogram(name: "div", scope: !363, file: !363, line: 789, type: !415, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!415 = !DISubroutineType(types: !416)
!416 = !{!362, !178, !178}
!417 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !418, line: 135)
!418 = !DISubprogram(name: "exit", scope: !363, file: !363, line: 543, type: !419, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: true)
!419 = !DISubroutineType(types: !420)
!420 = !{null, !178}
!421 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !422, line: 136)
!422 = !DISubprogram(name: "free", scope: !363, file: !363, line: 483, type: !423, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!423 = !DISubroutineType(types: !424)
!424 = !{null, !107}
!425 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !426, line: 137)
!426 = !DISubprogram(name: "getenv", scope: !363, file: !363, line: 564, type: !427, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!427 = !DISubroutineType(types: !428)
!428 = !{!429, !256}
!429 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !258, size: 64)
!430 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !431, line: 138)
!431 = !DISubprogram(name: "labs", scope: !363, file: !363, line: 776, type: !215, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!432 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !433, line: 139)
!433 = !DISubprogram(name: "ldiv", scope: !363, file: !363, line: 791, type: !434, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!434 = !DISubroutineType(types: !435)
!435 = !{!366, !217, !217}
!436 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !437, line: 140)
!437 = !DISubprogram(name: "malloc", scope: !363, file: !363, line: 466, type: !438, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!438 = !DISubroutineType(types: !439)
!439 = !{!107, !402}
!440 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !441, line: 142)
!441 = !DISubprogram(name: "mblen", scope: !363, file: !363, line: 863, type: !442, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!442 = !DISubroutineType(types: !443)
!443 = !{!178, !256, !402}
!444 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !445, line: 143)
!445 = !DISubprogram(name: "mbstowcs", scope: !363, file: !363, line: 874, type: !446, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!446 = !DISubroutineType(types: !447)
!447 = !{!402, !448, !451, !402}
!448 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !449)
!449 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !450, size: 64)
!450 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!451 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !256)
!452 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !453, line: 144)
!453 = !DISubprogram(name: "mbtowc", scope: !363, file: !363, line: 866, type: !454, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!454 = !DISubroutineType(types: !455)
!455 = !{!178, !448, !451, !402}
!456 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !457, line: 146)
!457 = !DISubprogram(name: "qsort", scope: !363, file: !363, line: 765, type: !458, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!458 = !DISubroutineType(types: !459)
!459 = !{null, !107, !402, !402, !405}
!460 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !461, line: 152)
!461 = !DISubprogram(name: "rand", scope: !363, file: !363, line: 374, type: !462, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!462 = !DISubroutineType(types: !463)
!463 = !{!178}
!464 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !465, line: 153)
!465 = !DISubprogram(name: "realloc", scope: !363, file: !363, line: 480, type: !466, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!466 = !DISubroutineType(types: !467)
!467 = !{!107, !107, !402}
!468 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !469, line: 154)
!469 = !DISubprogram(name: "srand", scope: !363, file: !363, line: 376, type: !470, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!470 = !DISubroutineType(types: !471)
!471 = !{null, !111}
!472 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !473, line: 155)
!473 = !DISubprogram(name: "strtod", scope: !363, file: !363, line: 164, type: !474, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!474 = !DISubroutineType(types: !475)
!475 = !{!103, !451, !476}
!476 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !477)
!477 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !429, size: 64)
!478 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !479, line: 156)
!479 = !DISubprogram(name: "strtol", scope: !363, file: !363, line: 183, type: !480, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!480 = !DISubroutineType(types: !481)
!481 = !{!217, !451, !476, !178}
!482 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !483, line: 157)
!483 = !DISubprogram(name: "strtoul", scope: !363, file: !363, line: 187, type: !484, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!484 = !DISubroutineType(types: !485)
!485 = !{!404, !451, !476, !178}
!486 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !487, line: 158)
!487 = !DISubprogram(name: "system", scope: !363, file: !363, line: 717, type: !389, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!488 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !489, line: 160)
!489 = !DISubprogram(name: "wcstombs", scope: !363, file: !363, line: 877, type: !490, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!490 = !DISubroutineType(types: !491)
!491 = !{!402, !492, !493, !402}
!492 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !429)
!493 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !494)
!494 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !495, size: 64)
!495 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !450)
!496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !497, line: 161)
!497 = !DISubprogram(name: "wctomb", scope: !363, file: !363, line: 870, type: !498, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!498 = !DISubroutineType(types: !499)
!499 = !{!178, !429, !450}
!500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !501, entity: !503, line: 201)
!501 = !DINamespace(name: "__gnu_cxx", scope: null, file: !502, line: 68)
!502 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/bits/cpp_type_traits.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/backpropllvm")
!503 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !363, line: 121, baseType: !504)
!504 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !363, line: 117, size: 128, elements: !505, identifier: "_ZTS7lldiv_t")
!505 = !{!506, !507}
!506 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !504, file: !363, line: 119, baseType: !119, size: 64)
!507 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !504, file: !363, line: 120, baseType: !119, size: 64, offset: 64)
!508 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !501, entity: !509, line: 207)
!509 = !DISubprogram(name: "_Exit", scope: !363, file: !363, line: 557, type: !419, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: true)
!510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !501, entity: !511, line: 211)
!511 = !DISubprogram(name: "llabs", scope: !363, file: !363, line: 780, type: !117, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!512 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !501, entity: !513, line: 217)
!513 = !DISubprogram(name: "lldiv", scope: !363, file: !363, line: 797, type: !514, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!514 = !DISubroutineType(types: !515)
!515 = !{!503, !119, !119}
!516 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !501, entity: !517, line: 228)
!517 = !DISubprogram(name: "atoll", scope: !363, file: !363, line: 292, type: !518, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!518 = !DISubroutineType(types: !519)
!519 = !{!119, !256}
!520 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !501, entity: !521, line: 229)
!521 = !DISubprogram(name: "strtoll", scope: !363, file: !363, line: 209, type: !522, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!522 = !DISubroutineType(types: !523)
!523 = !{!119, !451, !476, !178}
!524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !501, entity: !525, line: 230)
!525 = !DISubprogram(name: "strtoull", scope: !363, file: !363, line: 214, type: !526, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!526 = !DISubroutineType(types: !527)
!527 = !{!528, !451, !476, !178}
!528 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!529 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !501, entity: !530, line: 232)
!530 = !DISubprogram(name: "strtof", scope: !363, file: !363, line: 172, type: !531, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!531 = !DISubroutineType(types: !532)
!532 = !{!105, !451, !476}
!533 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !501, entity: !534, line: 233)
!534 = !DISubprogram(name: "strtold", scope: !363, file: !363, line: 175, type: !535, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!535 = !DISubroutineType(types: !536)
!536 = !{!537, !451, !476}
!537 = !DIBasicType(name: "long double", size: 128, encoding: DW_ATE_float)
!538 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !503, line: 241)
!539 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !509, line: 243)
!540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !511, line: 245)
!541 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !542, line: 246)
!542 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !501, file: !543, line: 214, type: !514, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!543 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/cstdlib", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/backpropllvm")
!544 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !513, line: 247)
!545 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !517, line: 249)
!546 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !530, line: 250)
!547 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !521, line: 251)
!548 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !525, line: 252)
!549 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !534, line: 253)
!550 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !551, line: 418)
!551 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !552, file: !552, line: 1126, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!552 = !DIFile(filename: "/usr/local/cuda/include/math_functions.hpp", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/backpropllvm")
!553 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !554, line: 419)
!554 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !552, file: !552, line: 1154, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !556, line: 420)
!556 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !552, file: !552, line: 1121, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !558, line: 421)
!558 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !552, file: !552, line: 1159, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !560, line: 422)
!560 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !552, file: !552, line: 1111, type: !134, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !562, line: 423)
!562 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !552, file: !552, line: 1116, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !564, line: 424)
!564 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !552, file: !552, line: 1164, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !566, line: 425)
!566 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !552, file: !552, line: 1199, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!567 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !568, line: 426)
!568 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !569, file: !569, line: 647, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!569 = !DIFile(filename: "/usr/local/cuda/include/device_functions.hpp", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/backpropllvm")
!570 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !571, line: 427)
!571 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !552, file: !552, line: 973, type: !134, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!572 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !573, line: 428)
!573 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !552, file: !552, line: 1027, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!574 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !575, line: 429)
!575 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !552, file: !552, line: 1096, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!576 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !577, line: 430)
!577 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !552, file: !552, line: 1259, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!578 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !579, line: 431)
!579 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !552, file: !552, line: 1249, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!580 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !581, line: 432)
!581 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !569, file: !569, line: 637, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!582 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !583, line: 433)
!583 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !552, file: !552, line: 1078, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!584 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !585, line: 434)
!585 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !552, file: !552, line: 1169, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!586 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !587, line: 435)
!587 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !569, file: !569, line: 582, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!588 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !589, line: 436)
!589 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !552, file: !552, line: 1385, type: !134, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!590 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !591, line: 437)
!591 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !569, file: !569, line: 572, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!592 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !593, line: 438)
!593 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !552, file: !552, line: 1337, type: !166, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!594 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !595, line: 439)
!595 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !569, file: !569, line: 602, type: !134, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!596 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !597, line: 440)
!597 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !569, file: !569, line: 597, type: !134, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!598 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !599, line: 441)
!599 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !552, file: !552, line: 1322, type: !134, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!600 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !601, line: 442)
!601 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !552, file: !552, line: 1312, type: !181, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!602 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !603, line: 443)
!603 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !552, file: !552, line: 1174, type: !134, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!604 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !605, line: 444)
!605 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !552, file: !552, line: 1390, type: !176, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!606 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !607, line: 445)
!607 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !552, file: !552, line: 1289, type: !220, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!608 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !609, line: 446)
!609 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !552, file: !552, line: 1284, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!610 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !611, line: 447)
!611 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !552, file: !552, line: 933, type: !228, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!612 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !613, line: 448)
!613 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !552, file: !552, line: 1371, type: !228, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!614 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !615, line: 449)
!615 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !552, file: !552, line: 1140, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!616 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !617, line: 450)
!617 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !552, file: !552, line: 1149, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!618 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !619, line: 451)
!619 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !552, file: !552, line: 1069, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!620 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !621, line: 452)
!621 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !552, file: !552, line: 1395, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!622 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !623, line: 453)
!623 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !552, file: !552, line: 1131, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!624 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !625, line: 454)
!625 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !552, file: !552, line: 924, type: !242, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!626 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !627, line: 455)
!627 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !552, file: !552, line: 1376, type: !242, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!628 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !629, line: 456)
!629 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !552, file: !552, line: 1317, type: !250, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!630 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !631, line: 457)
!631 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !552, file: !552, line: 938, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!632 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !633, line: 458)
!633 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !552, file: !552, line: 1002, type: !134, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!634 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !635, line: 459)
!635 = !DISubprogram(name: "nexttowardf", scope: !307, file: !307, line: 284, type: !636, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!636 = !DISubroutineType(types: !637)
!637 = !{!105, !105, !537}
!638 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !635, line: 460)
!639 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !640, line: 461)
!640 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !552, file: !552, line: 1352, type: !134, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!641 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !642, line: 462)
!642 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !552, file: !552, line: 1327, type: !134, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!643 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !644, line: 463)
!644 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !552, file: !552, line: 1332, type: !277, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!645 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !646, line: 464)
!646 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !552, file: !552, line: 919, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!647 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !648, line: 465)
!648 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !552, file: !552, line: 1366, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!649 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !650, line: 466)
!650 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !552, file: !552, line: 1299, type: !285, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!651 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !652, line: 467)
!652 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !552, file: !552, line: 1294, type: !220, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!653 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !654, line: 468)
!654 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !552, file: !552, line: 1018, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!655 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !656, line: 469)
!656 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !552, file: !552, line: 1101, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!657 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !658, line: 470)
!658 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !569, file: !569, line: 887, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!659 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !660, line: 471)
!660 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !552, file: !552, line: 1060, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!661 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !662, line: 472)
!662 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !552, file: !552, line: 1106, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!663 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !664, line: 473)
!664 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !552, file: !552, line: 1361, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!665 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !114, entity: !666, line: 474)
!666 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !569, file: !569, line: 642, type: !122, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!667 = !{i32 2, !"Dwarf Version", i32 4}
!668 = !{i32 2, !"Debug Info Version", i32 3}
!669 = !{!"clang version 5.0.0 (trunk 294196)"}
!670 = distinct !DISubprogram(name: "bpnn_layerforward_CUDA", linkageName: "_Z22bpnn_layerforward_CUDAPfS_S_S_ii", scope: !671, file: !671, line: 14, type: !672, isLocal: false, isDefinition: true, scopeLine: 20, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !674)
!671 = !DIFile(filename: "./backprop_cuda_kernel.cu", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/backpropllvm")
!672 = !DISubroutineType(types: !673)
!673 = !{null, !104, !104, !104, !104, !178, !178}
!674 = !{!675, !676, !677, !678, !679, !680}
!675 = !DILocalVariable(name: "input_cuda", arg: 1, scope: !670, file: !671, line: 14, type: !104)
!676 = !DILocalVariable(name: "output_hidden_cuda", arg: 2, scope: !670, file: !671, line: 15, type: !104)
!677 = !DILocalVariable(name: "input_hidden_cuda", arg: 3, scope: !670, file: !671, line: 16, type: !104)
!678 = !DILocalVariable(name: "hidden_partial_sum", arg: 4, scope: !670, file: !671, line: 17, type: !104)
!679 = !DILocalVariable(name: "in", arg: 5, scope: !670, file: !671, line: 18, type: !178)
!680 = !DILocalVariable(name: "hid", arg: 6, scope: !670, file: !671, line: 19, type: !178)
!681 = !DIExpression()
!682 = !DILocation(line: 14, column: 47, scope: !670)
!683 = !{!684, !684, i64 0}
!684 = !{!"any pointer", !685, i64 0}
!685 = !{!"omnipotent char", !686, i64 0}
!686 = !{!"Simple C++ TBAA"}
!687 = !DILocation(line: 15, column: 28, scope: !670)
!688 = !DILocation(line: 16, column: 16, scope: !670)
!689 = !DILocation(line: 17, column: 16, scope: !670)
!690 = !DILocation(line: 18, column: 13, scope: !670)
!691 = !{!692, !692, i64 0}
!692 = !{!"int", !685, i64 0}
!693 = !DILocation(line: 19, column: 13, scope: !670)
!694 = !DILocation(line: 20, column: 1, scope: !670)
!695 = !DILocation(line: 20, column: 1, scope: !696)
!696 = !DILexicalBlockFile(scope: !670, file: !671, discriminator: 1)
!697 = !DILocation(line: 20, column: 1, scope: !698)
!698 = !DILexicalBlockFile(scope: !670, file: !671, discriminator: 2)
!699 = !DILocation(line: 20, column: 1, scope: !700)
!700 = !DILexicalBlockFile(scope: !670, file: !671, discriminator: 3)
!701 = !DILocation(line: 20, column: 1, scope: !702)
!702 = !DILexicalBlockFile(scope: !670, file: !671, discriminator: 4)
!703 = !DILocation(line: 20, column: 1, scope: !704)
!704 = !DILexicalBlockFile(scope: !670, file: !671, discriminator: 5)
!705 = !DILocation(line: 20, column: 1, scope: !706)
!706 = !DILexicalBlockFile(scope: !670, file: !671, discriminator: 6)
!707 = !DILocation(line: 80, column: 1, scope: !670)
!708 = distinct !DISubprogram(name: "bpnn_adjust_weights_cuda", linkageName: "_Z24bpnn_adjust_weights_cudaPfiS_iS_S_", scope: !671, file: !671, line: 83, type: !709, isLocal: false, isDefinition: true, scopeLine: 88, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !711)
!709 = !DISubroutineType(types: !710)
!710 = !{null, !104, !178, !104, !178, !104, !104}
!711 = !{!712, !713, !714, !715, !716, !717}
!712 = !DILocalVariable(name: "delta", arg: 1, scope: !708, file: !671, line: 83, type: !104)
!713 = !DILocalVariable(name: "hid", arg: 2, scope: !708, file: !671, line: 83, type: !178)
!714 = !DILocalVariable(name: "ly", arg: 3, scope: !708, file: !671, line: 84, type: !104)
!715 = !DILocalVariable(name: "in", arg: 4, scope: !708, file: !671, line: 85, type: !178)
!716 = !DILocalVariable(name: "w", arg: 5, scope: !708, file: !671, line: 86, type: !104)
!717 = !DILocalVariable(name: "oldw", arg: 6, scope: !708, file: !671, line: 87, type: !104)
!718 = !DILocation(line: 83, column: 50, scope: !708)
!719 = !DILocation(line: 83, column: 66, scope: !708)
!720 = !DILocation(line: 84, column: 20, scope: !708)
!721 = !DILocation(line: 85, column: 16, scope: !708)
!722 = !DILocation(line: 86, column: 20, scope: !708)
!723 = !DILocation(line: 87, column: 20, scope: !708)
!724 = !DILocation(line: 88, column: 1, scope: !708)
!725 = !DILocation(line: 88, column: 1, scope: !726)
!726 = !DILexicalBlockFile(scope: !708, file: !671, discriminator: 1)
!727 = !DILocation(line: 88, column: 1, scope: !728)
!728 = !DILexicalBlockFile(scope: !708, file: !671, discriminator: 2)
!729 = !DILocation(line: 88, column: 1, scope: !730)
!730 = !DILexicalBlockFile(scope: !708, file: !671, discriminator: 3)
!731 = !DILocation(line: 88, column: 1, scope: !732)
!732 = !DILexicalBlockFile(scope: !708, file: !671, discriminator: 4)
!733 = !DILocation(line: 88, column: 1, scope: !734)
!734 = !DILexicalBlockFile(scope: !708, file: !671, discriminator: 5)
!735 = !DILocation(line: 88, column: 1, scope: !736)
!736 = !DILexicalBlockFile(scope: !708, file: !671, discriminator: 6)
!737 = !DILocation(line: 113, column: 1, scope: !708)
!738 = distinct !DISubprogram(name: "get_time", linkageName: "_Z8get_timev", scope: !3, file: !3, line: 15, type: !739, isLocal: false, isDefinition: true, scopeLine: 15, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !741)
!739 = !DISubroutineType(types: !740)
!740 = !{!103}
!741 = !{!742}
!742 = !DILocalVariable(name: "time", scope: !738, file: !3, line: 16, type: !743)
!743 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timeval", file: !744, line: 30, size: 128, elements: !745, identifier: "_ZTS7timeval")
!744 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/time.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/backpropllvm")
!745 = !{!746, !749}
!746 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !743, file: !744, line: 32, baseType: !747, size: 64)
!747 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !748, line: 139, baseType: !217)
!748 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/backpropllvm")
!749 = !DIDerivedType(tag: DW_TAG_member, name: "tv_usec", scope: !743, file: !744, line: 33, baseType: !750, size: 64, offset: 64)
!750 = !DIDerivedType(tag: DW_TAG_typedef, name: "__suseconds_t", file: !748, line: 141, baseType: !217)
!751 = !DILocation(line: 16, column: 5, scope: !738)
!752 = !DIExpression(DW_OP_deref)
!753 = !DILocation(line: 16, column: 20, scope: !738)
!754 = !DILocation(line: 17, column: 9, scope: !755)
!755 = distinct !DILexicalBlock(scope: !738, file: !3, line: 17, column: 9)
!756 = !DILocation(line: 17, column: 9, scope: !738)
!757 = !DILocation(line: 21, column: 25, scope: !738)
!758 = !{!759, !760, i64 0}
!759 = !{!"_ZTS7timeval", !760, i64 0, !760, i64 8}
!760 = !{!"long", !685, i64 0}
!761 = !DILocation(line: 21, column: 20, scope: !738)
!762 = !DILocation(line: 21, column: 47, scope: !738)
!763 = !{!759, !760, i64 8}
!764 = !DILocation(line: 21, column: 42, scope: !738)
!765 = !DILocation(line: 21, column: 55, scope: !738)
!766 = !DILocation(line: 21, column: 32, scope: !738)
!767 = !DILocation(line: 21, column: 5, scope: !738)
!768 = !DILocation(line: 22, column: 1, scope: !738)
!769 = distinct !DISubprogram(name: "gettime", linkageName: "_Z7gettimev", scope: !3, file: !3, line: 48, type: !739, isLocal: false, isDefinition: true, scopeLine: 48, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !770)
!770 = !{!771}
!771 = !DILocalVariable(name: "t", scope: !769, file: !3, line: 49, type: !743)
!772 = !DILocation(line: 49, column: 3, scope: !769)
!773 = !DILocation(line: 49, column: 18, scope: !769)
!774 = !DILocation(line: 50, column: 3, scope: !769)
!775 = !DILocation(line: 51, column: 12, scope: !769)
!776 = !DILocation(line: 51, column: 10, scope: !769)
!777 = !DILocation(line: 51, column: 21, scope: !769)
!778 = !DILocation(line: 51, column: 19, scope: !769)
!779 = !DILocation(line: 51, column: 28, scope: !769)
!780 = !DILocation(line: 51, column: 18, scope: !769)
!781 = !DILocation(line: 52, column: 1, scope: !769)
!782 = !DILocation(line: 51, column: 3, scope: !769)
!783 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 61, type: !784, isLocal: false, isDefinition: true, scopeLine: 62, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !786)
!784 = !DISubroutineType(types: !785)
!785 = !{!178, !178, !477}
!786 = !{!787, !788}
!787 = !DILocalVariable(name: "argc", arg: 1, scope: !783, file: !3, line: 61, type: !178)
!788 = !DILocalVariable(name: "argv", arg: 2, scope: !783, file: !3, line: 61, type: !477)
!789 = !DILocation(line: 61, column: 11, scope: !783)
!790 = !DILocation(line: 61, column: 24, scope: !783)
!791 = !DILocation(line: 63, column: 2, scope: !783)
!792 = !DILocation(line: 64, column: 2, scope: !783)
!793 = !DILocation(line: 65, column: 3, scope: !783)
!794 = !DILocation(line: 66, column: 1, scope: !783)
!795 = distinct !DISubprogram(name: "bpnn_train_cuda", scope: !3, file: !3, line: 70, type: !796, isLocal: false, isDefinition: true, scopeLine: 71, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !817)
!796 = !DISubroutineType(types: !797)
!797 = !{null, !798, !104, !104}
!798 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !799, size: 64)
!799 = !DIDerivedType(tag: DW_TAG_typedef, name: "BPNN", file: !800, line: 36, baseType: !801)
!800 = !DIFile(filename: "./backprop.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/backpropllvm")
!801 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !800, line: 16, size: 768, elements: !802, identifier: "_ZTS4BPNN")
!802 = !{!803, !804, !805, !806, !807, !808, !809, !810, !811, !812, !814, !815, !816}
!803 = !DIDerivedType(tag: DW_TAG_member, name: "input_n", scope: !801, file: !800, line: 17, baseType: !178, size: 32)
!804 = !DIDerivedType(tag: DW_TAG_member, name: "hidden_n", scope: !801, file: !800, line: 18, baseType: !178, size: 32, offset: 32)
!805 = !DIDerivedType(tag: DW_TAG_member, name: "output_n", scope: !801, file: !800, line: 19, baseType: !178, size: 32, offset: 64)
!806 = !DIDerivedType(tag: DW_TAG_member, name: "input_units", scope: !801, file: !800, line: 21, baseType: !104, size: 64, offset: 128)
!807 = !DIDerivedType(tag: DW_TAG_member, name: "hidden_units", scope: !801, file: !800, line: 22, baseType: !104, size: 64, offset: 192)
!808 = !DIDerivedType(tag: DW_TAG_member, name: "output_units", scope: !801, file: !800, line: 23, baseType: !104, size: 64, offset: 256)
!809 = !DIDerivedType(tag: DW_TAG_member, name: "hidden_delta", scope: !801, file: !800, line: 25, baseType: !104, size: 64, offset: 320)
!810 = !DIDerivedType(tag: DW_TAG_member, name: "output_delta", scope: !801, file: !800, line: 26, baseType: !104, size: 64, offset: 384)
!811 = !DIDerivedType(tag: DW_TAG_member, name: "target", scope: !801, file: !800, line: 28, baseType: !104, size: 64, offset: 448)
!812 = !DIDerivedType(tag: DW_TAG_member, name: "input_weights", scope: !801, file: !800, line: 30, baseType: !813, size: 64, offset: 512)
!813 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !104, size: 64)
!814 = !DIDerivedType(tag: DW_TAG_member, name: "hidden_weights", scope: !801, file: !800, line: 31, baseType: !813, size: 64, offset: 576)
!815 = !DIDerivedType(tag: DW_TAG_member, name: "input_prev_weights", scope: !801, file: !800, line: 34, baseType: !813, size: 64, offset: 640)
!816 = !DIDerivedType(tag: DW_TAG_member, name: "hidden_prev_weights", scope: !801, file: !800, line: 35, baseType: !813, size: 64, offset: 704)
!817 = !{!818, !819, !820, !821, !822, !823, !824, !825, !826, !827, !828, !829, !830, !831, !832, !833, !834, !835, !836, !837, !861, !862, !864, !868, !869, !870, !872, !874, !878, !879, !880, !882}
!818 = !DILocalVariable(name: "net", arg: 1, scope: !795, file: !3, line: 70, type: !798)
!819 = !DILocalVariable(name: "eo", arg: 2, scope: !795, file: !3, line: 70, type: !104)
!820 = !DILocalVariable(name: "eh", arg: 3, scope: !795, file: !3, line: 70, type: !104)
!821 = !DILocalVariable(name: "in", scope: !795, file: !3, line: 72, type: !178)
!822 = !DILocalVariable(name: "hid", scope: !795, file: !3, line: 72, type: !178)
!823 = !DILocalVariable(name: "out", scope: !795, file: !3, line: 72, type: !178)
!824 = !DILocalVariable(name: "out_err", scope: !795, file: !3, line: 73, type: !105)
!825 = !DILocalVariable(name: "hid_err", scope: !795, file: !3, line: 73, type: !105)
!826 = !DILocalVariable(name: "m", scope: !795, file: !3, line: 81, type: !178)
!827 = !DILocalVariable(name: "input_hidden_cuda", scope: !795, file: !3, line: 82, type: !104)
!828 = !DILocalVariable(name: "input_cuda", scope: !795, file: !3, line: 83, type: !104)
!829 = !DILocalVariable(name: "output_hidden_cuda", scope: !795, file: !3, line: 84, type: !104)
!830 = !DILocalVariable(name: "partial_sum", scope: !795, file: !3, line: 85, type: !104)
!831 = !DILocalVariable(name: "hidden_partial_sum", scope: !795, file: !3, line: 86, type: !104)
!832 = !DILocalVariable(name: "hidden_delta_cuda", scope: !795, file: !3, line: 87, type: !104)
!833 = !DILocalVariable(name: "input_prev_weights_cuda", scope: !795, file: !3, line: 88, type: !104)
!834 = !DILocalVariable(name: "sum", scope: !795, file: !3, line: 89, type: !105)
!835 = !DILocalVariable(name: "input_weights_one_dim", scope: !795, file: !3, line: 90, type: !104)
!836 = !DILocalVariable(name: "input_weights_prev_one_dim", scope: !795, file: !3, line: 91, type: !104)
!837 = !DILocalVariable(name: "grid", scope: !795, file: !3, line: 93, type: !838)
!838 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !839, line: 427, baseType: !840)
!839 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/backpropllvm")
!840 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !839, line: 417, size: 96, elements: !841, identifier: "_ZTS4dim3")
!841 = !{!842, !843, !844, !845, !849, !858}
!842 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !840, file: !839, line: 419, baseType: !111, size: 32)
!843 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !840, file: !839, line: 419, baseType: !111, size: 32, offset: 32)
!844 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !840, file: !839, line: 419, baseType: !111, size: 32, offset: 64)
!845 = !DISubprogram(name: "dim3", scope: !840, file: !839, line: 421, type: !846, isLocal: false, isDefinition: false, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: true)
!846 = !DISubroutineType(types: !847)
!847 = !{null, !848, !111, !111, !111}
!848 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !840, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!849 = !DISubprogram(name: "dim3", scope: !840, file: !839, line: 422, type: !850, isLocal: false, isDefinition: false, scopeLine: 422, flags: DIFlagPrototyped, isOptimized: true)
!850 = !DISubroutineType(types: !851)
!851 = !{null, !848, !852}
!852 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !839, line: 383, baseType: !853)
!853 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !839, line: 190, size: 96, elements: !854, identifier: "_ZTS5uint3")
!854 = !{!855, !856, !857}
!855 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !853, file: !839, line: 192, baseType: !111, size: 32)
!856 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !853, file: !839, line: 192, baseType: !111, size: 32, offset: 32)
!857 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !853, file: !839, line: 192, baseType: !111, size: 32, offset: 64)
!858 = !DISubprogram(name: "operator uint3", linkageName: "_ZN4dim3cv5uint3Ev", scope: !840, file: !839, line: 423, type: !859, isLocal: false, isDefinition: false, scopeLine: 423, flags: DIFlagPrototyped, isOptimized: true)
!859 = !DISubroutineType(types: !860)
!860 = !{!852, !848}
!861 = !DILocalVariable(name: "threads", scope: !795, file: !3, line: 94, type: !838)
!862 = !DILocalVariable(name: "k", scope: !863, file: !3, line: 101, type: !178)
!863 = distinct !DILexicalBlock(scope: !795, file: !3, line: 101, column: 3)
!864 = !DILocalVariable(name: "j", scope: !865, file: !3, line: 102, type: !178)
!865 = distinct !DILexicalBlock(scope: !866, file: !3, line: 102, column: 4)
!866 = distinct !DILexicalBlock(scope: !867, file: !3, line: 101, column: 33)
!867 = distinct !DILexicalBlock(scope: !863, file: !3, line: 101, column: 3)
!868 = !DILocalVariable(name: "time0", scope: !795, file: !3, line: 136, type: !103)
!869 = !DILocalVariable(name: "time1", scope: !795, file: !3, line: 146, type: !103)
!870 = !DILocalVariable(name: "error", scope: !795, file: !3, line: 149, type: !871)
!871 = !DIDerivedType(tag: DW_TAG_typedef, name: "cudaError_t", file: !6, line: 1419, baseType: !20)
!872 = !DILocalVariable(name: "j", scope: !873, file: !3, line: 157, type: !178)
!873 = distinct !DILexicalBlock(scope: !795, file: !3, line: 157, column: 3)
!874 = !DILocalVariable(name: "k", scope: !875, file: !3, line: 159, type: !178)
!875 = distinct !DILexicalBlock(scope: !876, file: !3, line: 159, column: 5)
!876 = distinct !DILexicalBlock(scope: !877, file: !3, line: 157, column: 34)
!877 = distinct !DILexicalBlock(scope: !873, file: !3, line: 157, column: 3)
!878 = !DILocalVariable(name: "time2", scope: !795, file: !3, line: 189, type: !103)
!879 = !DILocalVariable(name: "time3", scope: !795, file: !3, line: 199, type: !103)
!880 = !DILocalVariable(name: "ii", scope: !881, file: !3, line: 208, type: !178)
!881 = distinct !DILexicalBlock(scope: !795, file: !3, line: 208, column: 2)
!882 = !DILocalVariable(name: "ii", scope: !883, file: !3, line: 212, type: !178)
!883 = distinct !DILexicalBlock(scope: !795, file: !3, line: 212, column: 2)
!884 = !DILocation(line: 70, column: 28, scope: !795)
!885 = !DILocation(line: 70, column: 40, scope: !795)
!886 = !DILocation(line: 70, column: 51, scope: !795)
!887 = !DILocation(line: 73, column: 3, scope: !795)
!888 = !DILocation(line: 76, column: 13, scope: !795)
!889 = !{!890, !692, i64 0}
!890 = !{!"_ZTS4BPNN", !692, i64 0, !692, i64 4, !692, i64 8, !684, i64 16, !684, i64 24, !684, i64 32, !684, i64 40, !684, i64 48, !684, i64 56, !684, i64 64, !684, i64 72, !684, i64 80, !684, i64 88}
!891 = !DILocation(line: 72, column: 7, scope: !795)
!892 = !DILocation(line: 77, column: 14, scope: !795)
!893 = !{!890, !692, i64 4}
!894 = !DILocation(line: 72, column: 11, scope: !795)
!895 = !DILocation(line: 78, column: 14, scope: !795)
!896 = !{!890, !692, i64 8}
!897 = !DILocation(line: 72, column: 16, scope: !795)
!898 = !DILocation(line: 81, column: 7, scope: !795)
!899 = !DILocation(line: 82, column: 3, scope: !795)
!900 = !DILocation(line: 83, column: 3, scope: !795)
!901 = !DILocation(line: 84, column: 3, scope: !795)
!902 = !DILocation(line: 86, column: 3, scope: !795)
!903 = !DILocation(line: 87, column: 3, scope: !795)
!904 = !DILocation(line: 88, column: 3, scope: !795)
!905 = !DILocation(line: 92, column: 19, scope: !795)
!906 = !DILocation(line: 92, column: 14, scope: !795)
!907 = !DILocation(line: 93, column: 9, scope: !795)
!908 = !DILocation(line: 94, column: 9, scope: !795)
!909 = !DILocation(line: 96, column: 48, scope: !795)
!910 = !DILocation(line: 96, column: 59, scope: !795)
!911 = !DILocation(line: 96, column: 52, scope: !795)
!912 = !DILocation(line: 96, column: 44, scope: !795)
!913 = !DILocation(line: 96, column: 64, scope: !795)
!914 = !DILocation(line: 96, column: 37, scope: !795)
!915 = !DILocation(line: 96, column: 27, scope: !795)
!916 = !DILocation(line: 90, column: 10, scope: !795)
!917 = !DILocation(line: 97, column: 42, scope: !795)
!918 = !DILocation(line: 97, column: 32, scope: !795)
!919 = !DILocation(line: 91, column: 10, scope: !795)
!920 = !DILocation(line: 98, column: 45, scope: !795)
!921 = !DILocation(line: 98, column: 34, scope: !795)
!922 = !DILocation(line: 98, column: 53, scope: !795)
!923 = !DILocation(line: 98, column: 27, scope: !795)
!924 = !DILocation(line: 98, column: 17, scope: !795)
!925 = !DILocation(line: 85, column: 10, scope: !795)
!926 = !DILocation(line: 101, column: 12, scope: !863)
!927 = !DILocation(line: 101, column: 21, scope: !928)
!928 = !DILexicalBlockFile(scope: !867, file: !3, discriminator: 1)
!929 = !DILocation(line: 101, column: 3, scope: !930)
!930 = !DILexicalBlockFile(scope: !863, file: !3, discriminator: 1)
!931 = !DILocation(line: 102, column: 4, scope: !932)
!932 = !DILexicalBlockFile(scope: !865, file: !3, discriminator: 1)
!933 = !DILocation(line: 103, column: 31, scope: !934)
!934 = distinct !DILexicalBlock(scope: !935, file: !3, line: 102, column: 35)
!935 = distinct !DILexicalBlock(scope: !865, file: !3, line: 102, column: 4)
!936 = !DILocation(line: 102, column: 13, scope: !865)
!937 = !{!890, !684, i64 64}
!938 = !{!890, !684, i64 80}
!939 = !{!940, !940, i64 0}
!940 = !{!"float", !685, i64 0}
!941 = !DILocation(line: 103, column: 4, scope: !934)
!942 = !DILocation(line: 103, column: 29, scope: !934)
!943 = !DILocation(line: 104, column: 36, scope: !934)
!944 = !DILocation(line: 104, column: 4, scope: !934)
!945 = !DILocation(line: 104, column: 34, scope: !934)
!946 = !DILocation(line: 105, column: 5, scope: !934)
!947 = !DILocation(line: 102, column: 31, scope: !948)
!948 = !DILexicalBlockFile(scope: !935, file: !3, discriminator: 3)
!949 = distinct !{!949, !950}
!950 = !{!"llvm.loop.unroll.disable"}
!951 = !{!952}
!952 = distinct !{!952, !953}
!953 = distinct !{!953, !"LVerDomain"}
!954 = !{!955}
!955 = distinct !{!955, !953}
!956 = !{!957, !952, !958}
!957 = distinct !{!957, !953}
!958 = distinct !{!958, !953}
!959 = !{!958}
!960 = !{!957}
!961 = !{!952, !958}
!962 = distinct !{!962, !963, !964, !965, !966}
!963 = !DILocation(line: 102, column: 4, scope: !865)
!964 = !DILocation(line: 106, column: 5, scope: !865)
!965 = !{!"llvm.loop.vectorize.width", i32 1}
!966 = !{!"llvm.loop.interleave.count", i32 1}
!967 = !DILocation(line: 109, column: 14, scope: !795)
!968 = !DILocation(line: 109, column: 36, scope: !795)
!969 = !DILocation(line: 109, column: 45, scope: !795)
!970 = !DILocation(line: 109, column: 3, scope: !795)
!971 = !DILocation(line: 110, column: 14, scope: !795)
!972 = !DILocation(line: 110, column: 44, scope: !795)
!973 = !DILocation(line: 110, column: 54, scope: !795)
!974 = !DILocation(line: 110, column: 3, scope: !795)
!975 = !DILocation(line: 111, column: 14, scope: !795)
!976 = !DILocation(line: 111, column: 3, scope: !795)
!977 = !DILocation(line: 112, column: 14, scope: !795)
!978 = !DILocation(line: 112, column: 44, scope: !795)
!979 = !DILocation(line: 112, column: 55, scope: !795)
!980 = !DILocation(line: 112, column: 63, scope: !795)
!981 = !DILocation(line: 112, column: 3, scope: !795)
!982 = !DILocation(line: 126, column: 3, scope: !795)
!983 = !DILocation(line: 132, column: 14, scope: !795)
!984 = !DILocation(line: 132, column: 31, scope: !795)
!985 = !{!890, !684, i64 16}
!986 = !DILocation(line: 132, column: 3, scope: !795)
!987 = !DILocation(line: 133, column: 14, scope: !795)
!988 = !DILocation(line: 133, column: 3, scope: !795)
!989 = !DILocation(line: 135, column: 3, scope: !795)
!990 = !DILocation(line: 16, column: 5, scope: !738, inlinedAt: !991)
!991 = distinct !DILocation(line: 136, column: 17, scope: !795)
!992 = !DILocation(line: 16, column: 20, scope: !738, inlinedAt: !991)
!993 = !DILocation(line: 17, column: 9, scope: !755, inlinedAt: !991)
!994 = !DILocation(line: 17, column: 9, scope: !738, inlinedAt: !991)
!995 = !DILocation(line: 21, column: 25, scope: !738, inlinedAt: !991)
!996 = !DILocation(line: 21, column: 20, scope: !738, inlinedAt: !991)
!997 = !DILocation(line: 21, column: 47, scope: !738, inlinedAt: !991)
!998 = !DILocation(line: 21, column: 42, scope: !738, inlinedAt: !991)
!999 = !DILocation(line: 21, column: 55, scope: !738, inlinedAt: !991)
!1000 = !DILocation(line: 21, column: 32, scope: !738, inlinedAt: !991)
!1001 = !DILocation(line: 21, column: 5, scope: !738, inlinedAt: !991)
!1002 = !DILocation(line: 22, column: 1, scope: !738, inlinedAt: !991)
!1003 = !DILocation(line: 136, column: 9, scope: !795)
!1004 = !DILocation(line: 138, column: 29, scope: !795)
!1005 = !DILocation(line: 138, column: 25, scope: !795)
!1006 = !DILocation(line: 138, column: 3, scope: !795)
!1007 = !DILocation(line: 101, column: 29, scope: !1008)
!1008 = !DILexicalBlockFile(scope: !867, file: !3, discriminator: 3)
!1009 = distinct !{!1009, !1010, !1011}
!1010 = !DILocation(line: 101, column: 3, scope: !863)
!1011 = !DILocation(line: 107, column: 3, scope: !863)
!1012 = !DILocation(line: 102, column: 22, scope: !1013)
!1013 = !DILexicalBlockFile(scope: !935, file: !3, discriminator: 1)
!1014 = distinct !{!1014, !963, !964, !965, !966}
!1015 = !DILocation(line: 138, column: 47, scope: !1016)
!1016 = !DILexicalBlockFile(scope: !795, file: !3, discriminator: 1)
!1017 = !DILocation(line: 83, column: 10, scope: !795)
!1018 = !DILocation(line: 139, column: 44, scope: !795)
!1019 = !DILocation(line: 84, column: 10, scope: !795)
!1020 = !DILocation(line: 140, column: 14, scope: !795)
!1021 = !DILocation(line: 82, column: 10, scope: !795)
!1022 = !DILocation(line: 141, column: 14, scope: !795)
!1023 = !DILocation(line: 86, column: 10, scope: !795)
!1024 = !DILocation(line: 138, column: 3, scope: !1016)
!1025 = !DILocation(line: 145, column: 3, scope: !795)
!1026 = !DILocation(line: 16, column: 5, scope: !738, inlinedAt: !1027)
!1027 = distinct !DILocation(line: 146, column: 17, scope: !795)
!1028 = !DILocation(line: 16, column: 20, scope: !738, inlinedAt: !1027)
!1029 = !DILocation(line: 17, column: 9, scope: !755, inlinedAt: !1027)
!1030 = !DILocation(line: 17, column: 9, scope: !738, inlinedAt: !1027)
!1031 = !DILocation(line: 21, column: 25, scope: !738, inlinedAt: !1027)
!1032 = !DILocation(line: 21, column: 20, scope: !738, inlinedAt: !1027)
!1033 = !DILocation(line: 21, column: 47, scope: !738, inlinedAt: !1027)
!1034 = !DILocation(line: 21, column: 42, scope: !738, inlinedAt: !1027)
!1035 = !DILocation(line: 21, column: 55, scope: !738, inlinedAt: !1027)
!1036 = !DILocation(line: 21, column: 32, scope: !738, inlinedAt: !1027)
!1037 = !DILocation(line: 21, column: 5, scope: !738, inlinedAt: !1027)
!1038 = !DILocation(line: 22, column: 1, scope: !738, inlinedAt: !1027)
!1039 = !DILocation(line: 146, column: 9, scope: !795)
!1040 = !DILocation(line: 149, column: 22, scope: !795)
!1041 = !DILocation(line: 149, column: 14, scope: !795)
!1042 = !DILocation(line: 150, column: 12, scope: !1043)
!1043 = distinct !DILexicalBlock(scope: !795, file: !3, line: 150, column: 6)
!1044 = !DILocation(line: 150, column: 6, scope: !795)
!1045 = !DILocation(line: 151, column: 37, scope: !1046)
!1046 = distinct !DILexicalBlock(scope: !1043, file: !3, line: 150, column: 28)
!1047 = !DILocation(line: 151, column: 3, scope: !1048)
!1048 = !DILexicalBlockFile(scope: !1046, file: !3, discriminator: 1)
!1049 = !DILocation(line: 152, column: 3, scope: !1046)
!1050 = !DILocation(line: 155, column: 27, scope: !795)
!1051 = !DILocation(line: 155, column: 47, scope: !795)
!1052 = !DILocation(line: 155, column: 58, scope: !795)
!1053 = !DILocation(line: 155, column: 66, scope: !795)
!1054 = !DILocation(line: 155, column: 3, scope: !795)
!1055 = !DILocation(line: 157, column: 12, scope: !873)
!1056 = !DILocation(line: 157, column: 21, scope: !1057)
!1057 = !DILexicalBlockFile(scope: !877, file: !3, discriminator: 1)
!1058 = !DILocation(line: 157, column: 3, scope: !1059)
!1059 = !DILexicalBlockFile(scope: !873, file: !3, discriminator: 1)
!1060 = !{!890, !684, i64 24}
!1061 = !DILocation(line: 89, column: 9, scope: !795)
!1062 = !DILocation(line: 159, column: 14, scope: !875)
!1063 = !DILocation(line: 159, column: 25, scope: !1064)
!1064 = !DILexicalBlockFile(scope: !1065, file: !3, discriminator: 1)
!1065 = distinct !DILexicalBlock(scope: !875, file: !3, line: 159, column: 5)
!1066 = !DILocation(line: 159, column: 23, scope: !1064)
!1067 = !DILocation(line: 159, column: 5, scope: !1068)
!1068 = !DILexicalBlockFile(scope: !875, file: !3, discriminator: 1)
!1069 = !DILocation(line: 160, column: 14, scope: !1070)
!1070 = distinct !DILexicalBlock(scope: !1065, file: !3, line: 159, column: 42)
!1071 = !DILocation(line: 160, column: 11, scope: !1070)
!1072 = !DILocation(line: 167, column: 45, scope: !795)
!1073 = !DILocation(line: 167, column: 26, scope: !795)
!1074 = !{!890, !684, i64 32}
!1075 = !DILocation(line: 167, column: 64, scope: !795)
!1076 = !{!890, !684, i64 72}
!1077 = !DILocation(line: 167, column: 3, scope: !795)
!1078 = !DILocation(line: 168, column: 26, scope: !795)
!1079 = !{!890, !684, i64 48}
!1080 = !DILocation(line: 168, column: 45, scope: !795)
!1081 = !{!890, !684, i64 56}
!1082 = !DILocation(line: 168, column: 58, scope: !795)
!1083 = !DILocation(line: 73, column: 9, scope: !795)
!1084 = !DILocation(line: 168, column: 3, scope: !795)
!1085 = !DILocation(line: 169, column: 26, scope: !795)
!1086 = !{!890, !684, i64 40}
!1087 = !DILocation(line: 169, column: 50, scope: !795)
!1088 = !DILocation(line: 169, column: 74, scope: !795)
!1089 = !DILocation(line: 169, column: 95, scope: !795)
!1090 = !DILocation(line: 73, column: 18, scope: !795)
!1091 = !DILocation(line: 169, column: 3, scope: !795)
!1092 = !DILocation(line: 170, column: 28, scope: !795)
!1093 = !DILocation(line: 170, column: 52, scope: !795)
!1094 = !DILocation(line: 170, column: 76, scope: !795)
!1095 = !DILocation(line: 170, column: 97, scope: !795)
!1096 = !{!890, !684, i64 88}
!1097 = !DILocation(line: 170, column: 3, scope: !795)
!1098 = !DILocation(line: 181, column: 14, scope: !795)
!1099 = !DILocation(line: 181, column: 3, scope: !795)
!1100 = !DILocation(line: 182, column: 14, scope: !795)
!1101 = !DILocation(line: 182, column: 3, scope: !795)
!1102 = !DILocation(line: 184, column: 14, scope: !795)
!1103 = !DILocation(line: 184, column: 38, scope: !795)
!1104 = !DILocation(line: 184, column: 3, scope: !795)
!1105 = !DILocation(line: 185, column: 14, scope: !795)
!1106 = !DILocation(line: 185, column: 3, scope: !795)
!1107 = !DILocation(line: 186, column: 14, scope: !795)
!1108 = !DILocation(line: 186, column: 3, scope: !795)
!1109 = !DILocation(line: 188, column: 3, scope: !795)
!1110 = !DILocation(line: 16, column: 5, scope: !738, inlinedAt: !1111)
!1111 = distinct !DILocation(line: 189, column: 17, scope: !795)
!1112 = !DILocation(line: 16, column: 20, scope: !738, inlinedAt: !1111)
!1113 = !DILocation(line: 17, column: 9, scope: !755, inlinedAt: !1111)
!1114 = !DILocation(line: 17, column: 9, scope: !738, inlinedAt: !1111)
!1115 = !DILocation(line: 21, column: 25, scope: !738, inlinedAt: !1111)
!1116 = !DILocation(line: 21, column: 20, scope: !738, inlinedAt: !1111)
!1117 = !DILocation(line: 21, column: 47, scope: !738, inlinedAt: !1111)
!1118 = !DILocation(line: 21, column: 42, scope: !738, inlinedAt: !1111)
!1119 = !DILocation(line: 21, column: 55, scope: !738, inlinedAt: !1111)
!1120 = !DILocation(line: 21, column: 32, scope: !738, inlinedAt: !1111)
!1121 = !DILocation(line: 21, column: 5, scope: !738, inlinedAt: !1111)
!1122 = !DILocation(line: 22, column: 1, scope: !738, inlinedAt: !1111)
!1123 = !DILocation(line: 189, column: 9, scope: !795)
!1124 = !DILocation(line: 191, column: 27, scope: !795)
!1125 = !DILocation(line: 191, column: 3, scope: !795)
!1126 = !DILocation(line: 162, column: 14, scope: !876)
!1127 = !DILocation(line: 162, column: 9, scope: !876)
!1128 = !DILocation(line: 162, column: 6, scope: !876)
!1129 = !DILocation(line: 163, column: 49, scope: !876)
!1130 = !DILocation(line: 163, column: 45, scope: !876)
!1131 = !DILocation(line: 163, column: 43, scope: !876)
!1132 = !DILocation(line: 163, column: 36, scope: !876)
!1133 = !DILocation(line: 163, column: 32, scope: !876)
!1134 = !DILocation(line: 163, column: 8, scope: !876)
!1135 = !DILocation(line: 163, column: 2, scope: !876)
!1136 = !DILocation(line: 163, column: 24, scope: !876)
!1137 = !DILocation(line: 157, column: 30, scope: !1138)
!1138 = !DILexicalBlockFile(scope: !877, file: !3, discriminator: 3)
!1139 = distinct !{!1139, !1140, !1141}
!1140 = !DILocation(line: 157, column: 3, scope: !873)
!1141 = !DILocation(line: 164, column: 3, scope: !873)
!1142 = !DILocation(line: 160, column: 28, scope: !1070)
!1143 = !DILocation(line: 160, column: 37, scope: !1070)
!1144 = !DILocation(line: 159, column: 38, scope: !1145)
!1145 = !DILexicalBlockFile(scope: !1065, file: !3, discriminator: 3)
!1146 = distinct !{!1146, !1147, !1148}
!1147 = !DILocation(line: 159, column: 5, scope: !875)
!1148 = !DILocation(line: 161, column: 5, scope: !875)
!1149 = !DILocation(line: 191, column: 49, scope: !1016)
!1150 = !DILocation(line: 87, column: 10, scope: !795)
!1151 = !DILocation(line: 193, column: 13, scope: !795)
!1152 = !DILocation(line: 195, column: 13, scope: !795)
!1153 = !DILocation(line: 196, column: 13, scope: !795)
!1154 = !DILocation(line: 88, column: 10, scope: !795)
!1155 = !DILocation(line: 191, column: 3, scope: !1016)
!1156 = !DILocation(line: 198, column: 3, scope: !795)
!1157 = !DILocation(line: 16, column: 5, scope: !738, inlinedAt: !1158)
!1158 = distinct !DILocation(line: 199, column: 17, scope: !795)
!1159 = !DILocation(line: 16, column: 20, scope: !738, inlinedAt: !1158)
!1160 = !DILocation(line: 17, column: 9, scope: !755, inlinedAt: !1158)
!1161 = !DILocation(line: 17, column: 9, scope: !738, inlinedAt: !1158)
!1162 = !DILocation(line: 21, column: 25, scope: !738, inlinedAt: !1158)
!1163 = !DILocation(line: 21, column: 20, scope: !738, inlinedAt: !1158)
!1164 = !DILocation(line: 21, column: 47, scope: !738, inlinedAt: !1158)
!1165 = !DILocation(line: 21, column: 42, scope: !738, inlinedAt: !1158)
!1166 = !DILocation(line: 21, column: 55, scope: !738, inlinedAt: !1158)
!1167 = !DILocation(line: 21, column: 32, scope: !738, inlinedAt: !1158)
!1168 = !DILocation(line: 21, column: 5, scope: !738, inlinedAt: !1158)
!1169 = !DILocation(line: 22, column: 1, scope: !738, inlinedAt: !1158)
!1170 = !DILocation(line: 199, column: 9, scope: !795)
!1171 = !DILocation(line: 201, column: 10, scope: !795)
!1172 = !DILocation(line: 201, column: 32, scope: !795)
!1173 = !DILocation(line: 201, column: 39, scope: !795)
!1174 = !DILocation(line: 201, column: 47, scope: !795)
!1175 = !DILocation(line: 201, column: 2, scope: !795)
!1176 = !DILocation(line: 203, column: 19, scope: !795)
!1177 = !DILocation(line: 203, column: 32, scope: !795)
!1178 = !DILocation(line: 203, column: 3, scope: !795)
!1179 = !DILocation(line: 204, column: 37, scope: !795)
!1180 = !DILocation(line: 204, column: 3, scope: !795)
!1181 = !DILocation(line: 207, column: 2, scope: !795)
!1182 = !DILocation(line: 208, column: 11, scope: !881)
!1183 = !DILocation(line: 208, column: 2, scope: !1184)
!1184 = !DILexicalBlockFile(scope: !881, file: !3, discriminator: 1)
!1185 = !DILocation(line: 210, column: 2, scope: !795)
!1186 = !DILocation(line: 211, column: 2, scope: !795)
!1187 = !DILocation(line: 212, column: 11, scope: !883)
!1188 = !DILocation(line: 212, column: 2, scope: !1189)
!1189 = !DILexicalBlockFile(scope: !883, file: !3, discriminator: 1)
!1190 = !DILocation(line: 209, column: 23, scope: !1191)
!1191 = distinct !DILexicalBlock(scope: !881, file: !3, line: 208, column: 2)
!1192 = !DILocation(line: 209, column: 18, scope: !1191)
!1193 = !DILocation(line: 209, column: 3, scope: !1191)
!1194 = !DILocation(line: 208, column: 26, scope: !1195)
!1195 = !DILexicalBlockFile(scope: !1191, file: !3, discriminator: 3)
!1196 = !DILocation(line: 208, column: 19, scope: !1197)
!1197 = !DILexicalBlockFile(scope: !1191, file: !3, discriminator: 1)
!1198 = distinct !{!1198, !1199, !1200}
!1199 = !DILocation(line: 208, column: 2, scope: !881)
!1200 = !DILocation(line: 209, column: 39, scope: !881)
!1201 = !DILocation(line: 214, column: 9, scope: !795)
!1202 = !DILocation(line: 218, column: 12, scope: !795)
!1203 = !DILocation(line: 218, column: 3, scope: !795)
!1204 = !DILocation(line: 219, column: 12, scope: !795)
!1205 = !DILocation(line: 219, column: 3, scope: !795)
!1206 = !DILocation(line: 220, column: 12, scope: !795)
!1207 = !DILocation(line: 220, column: 3, scope: !795)
!1208 = !DILocation(line: 221, column: 12, scope: !795)
!1209 = !DILocation(line: 221, column: 3, scope: !795)
!1210 = !DILocation(line: 223, column: 12, scope: !795)
!1211 = !DILocation(line: 223, column: 3, scope: !795)
!1212 = !DILocation(line: 225, column: 3, scope: !795)
!1213 = !DILocation(line: 226, column: 3, scope: !795)
!1214 = !DILocation(line: 227, column: 3, scope: !795)
!1215 = !DILocation(line: 231, column: 1, scope: !795)
!1216 = !DILocation(line: 213, column: 32, scope: !1217)
!1217 = distinct !DILexicalBlock(scope: !883, file: !3, line: 212, column: 2)
!1218 = !DILocation(line: 213, column: 17, scope: !1217)
!1219 = !DILocation(line: 212, column: 26, scope: !1220)
!1220 = !DILexicalBlockFile(scope: !1217, file: !3, discriminator: 3)
!1221 = !DILocation(line: 212, column: 19, scope: !1222)
!1222 = !DILexicalBlockFile(scope: !1217, file: !3, discriminator: 1)
!1223 = distinct !{!1223, !1224, !1225}
!1224 = !DILocation(line: 212, column: 2, scope: !883)
!1225 = !DILocation(line: 213, column: 58, scope: !883)
