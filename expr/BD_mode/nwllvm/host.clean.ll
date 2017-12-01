; ModuleID = 'needle.cu'
source_filename = "needle.cu"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }
%struct.dim3 = type { i32, i32, i32 }
%struct.CUstream_st = type opaque

@blosum62 = local_unnamed_addr global [24 x [24 x i32]] [[24 x i32] [i32 4, i32 -1, i32 -2, i32 -2, i32 0, i32 -1, i32 -1, i32 0, i32 -2, i32 -1, i32 -1, i32 -1, i32 -1, i32 -2, i32 -1, i32 1, i32 0, i32 -3, i32 -2, i32 0, i32 -2, i32 -1, i32 0, i32 -4], [24 x i32] [i32 -1, i32 5, i32 0, i32 -2, i32 -3, i32 1, i32 0, i32 -2, i32 0, i32 -3, i32 -2, i32 2, i32 -1, i32 -3, i32 -2, i32 -1, i32 -1, i32 -3, i32 -2, i32 -3, i32 -1, i32 0, i32 -1, i32 -4], [24 x i32] [i32 -2, i32 0, i32 6, i32 1, i32 -3, i32 0, i32 0, i32 0, i32 1, i32 -3, i32 -3, i32 0, i32 -2, i32 -3, i32 -2, i32 1, i32 0, i32 -4, i32 -2, i32 -3, i32 3, i32 0, i32 -1, i32 -4], [24 x i32] [i32 -2, i32 -2, i32 1, i32 6, i32 -3, i32 0, i32 2, i32 -1, i32 -1, i32 -3, i32 -4, i32 -1, i32 -3, i32 -3, i32 -1, i32 0, i32 -1, i32 -4, i32 -3, i32 -3, i32 4, i32 1, i32 -1, i32 -4], [24 x i32] [i32 0, i32 -3, i32 -3, i32 -3, i32 9, i32 -3, i32 -4, i32 -3, i32 -3, i32 -1, i32 -1, i32 -3, i32 -1, i32 -2, i32 -3, i32 -1, i32 -1, i32 -2, i32 -2, i32 -1, i32 -3, i32 -3, i32 -2, i32 -4], [24 x i32] [i32 -1, i32 1, i32 0, i32 0, i32 -3, i32 5, i32 2, i32 -2, i32 0, i32 -3, i32 -2, i32 1, i32 0, i32 -3, i32 -1, i32 0, i32 -1, i32 -2, i32 -1, i32 -2, i32 0, i32 3, i32 -1, i32 -4], [24 x i32] [i32 -1, i32 0, i32 0, i32 2, i32 -4, i32 2, i32 5, i32 -2, i32 0, i32 -3, i32 -3, i32 1, i32 -2, i32 -3, i32 -1, i32 0, i32 -1, i32 -3, i32 -2, i32 -2, i32 1, i32 4, i32 -1, i32 -4], [24 x i32] [i32 0, i32 -2, i32 0, i32 -1, i32 -3, i32 -2, i32 -2, i32 6, i32 -2, i32 -4, i32 -4, i32 -2, i32 -3, i32 -3, i32 -2, i32 0, i32 -2, i32 -2, i32 -3, i32 -3, i32 -1, i32 -2, i32 -1, i32 -4], [24 x i32] [i32 -2, i32 0, i32 1, i32 -1, i32 -3, i32 0, i32 0, i32 -2, i32 8, i32 -3, i32 -3, i32 -1, i32 -2, i32 -1, i32 -2, i32 -1, i32 -2, i32 -2, i32 2, i32 -3, i32 0, i32 0, i32 -1, i32 -4], [24 x i32] [i32 -1, i32 -3, i32 -3, i32 -3, i32 -1, i32 -3, i32 -3, i32 -4, i32 -3, i32 4, i32 2, i32 -3, i32 1, i32 0, i32 -3, i32 -2, i32 -1, i32 -3, i32 -1, i32 3, i32 -3, i32 -3, i32 -1, i32 -4], [24 x i32] [i32 -1, i32 -2, i32 -3, i32 -4, i32 -1, i32 -2, i32 -3, i32 -4, i32 -3, i32 2, i32 4, i32 -2, i32 2, i32 0, i32 -3, i32 -2, i32 -1, i32 -2, i32 -1, i32 1, i32 -4, i32 -3, i32 -1, i32 -4], [24 x i32] [i32 -1, i32 2, i32 0, i32 -1, i32 -3, i32 1, i32 1, i32 -2, i32 -1, i32 -3, i32 -2, i32 5, i32 -1, i32 -3, i32 -1, i32 0, i32 -1, i32 -3, i32 -2, i32 -2, i32 0, i32 1, i32 -1, i32 -4], [24 x i32] [i32 -1, i32 -1, i32 -2, i32 -3, i32 -1, i32 0, i32 -2, i32 -3, i32 -2, i32 1, i32 2, i32 -1, i32 5, i32 0, i32 -2, i32 -1, i32 -1, i32 -1, i32 -1, i32 1, i32 -3, i32 -1, i32 -1, i32 -4], [24 x i32] [i32 -2, i32 -3, i32 -3, i32 -3, i32 -2, i32 -3, i32 -3, i32 -3, i32 -1, i32 0, i32 0, i32 -3, i32 0, i32 6, i32 -4, i32 -2, i32 -2, i32 1, i32 3, i32 -1, i32 -3, i32 -3, i32 -1, i32 -4], [24 x i32] [i32 -1, i32 -2, i32 -2, i32 -1, i32 -3, i32 -1, i32 -1, i32 -2, i32 -2, i32 -3, i32 -3, i32 -1, i32 -2, i32 -4, i32 7, i32 -1, i32 -1, i32 -4, i32 -3, i32 -2, i32 -2, i32 -1, i32 -2, i32 -4], [24 x i32] [i32 1, i32 -1, i32 1, i32 0, i32 -1, i32 0, i32 0, i32 0, i32 -1, i32 -2, i32 -2, i32 0, i32 -1, i32 -2, i32 -1, i32 4, i32 1, i32 -3, i32 -2, i32 -2, i32 0, i32 0, i32 0, i32 -4], [24 x i32] [i32 0, i32 -1, i32 0, i32 -1, i32 -1, i32 -1, i32 -1, i32 -2, i32 -2, i32 -1, i32 -1, i32 -1, i32 -1, i32 -2, i32 -1, i32 1, i32 5, i32 -2, i32 -2, i32 0, i32 -1, i32 -1, i32 0, i32 -4], [24 x i32] [i32 -3, i32 -3, i32 -4, i32 -4, i32 -2, i32 -2, i32 -3, i32 -2, i32 -2, i32 -3, i32 -2, i32 -3, i32 -1, i32 1, i32 -4, i32 -3, i32 -2, i32 11, i32 2, i32 -3, i32 -4, i32 -3, i32 -2, i32 -4], [24 x i32] [i32 -2, i32 -2, i32 -2, i32 -3, i32 -2, i32 -1, i32 -2, i32 -3, i32 2, i32 -1, i32 -1, i32 -2, i32 -1, i32 3, i32 -3, i32 -2, i32 -2, i32 2, i32 7, i32 -1, i32 -3, i32 -2, i32 -1, i32 -4], [24 x i32] [i32 0, i32 -3, i32 -3, i32 -3, i32 -1, i32 -2, i32 -2, i32 -3, i32 -3, i32 3, i32 1, i32 -2, i32 1, i32 -1, i32 -2, i32 -2, i32 0, i32 -3, i32 -1, i32 4, i32 -3, i32 -2, i32 -1, i32 -4], [24 x i32] [i32 -2, i32 -1, i32 3, i32 4, i32 -3, i32 0, i32 1, i32 -1, i32 0, i32 -3, i32 -4, i32 0, i32 -3, i32 -3, i32 -2, i32 0, i32 -1, i32 -4, i32 -3, i32 -3, i32 4, i32 1, i32 -1, i32 -4], [24 x i32] [i32 -1, i32 0, i32 0, i32 1, i32 -3, i32 3, i32 4, i32 -2, i32 0, i32 -3, i32 -3, i32 1, i32 -1, i32 -3, i32 -1, i32 0, i32 -1, i32 -3, i32 -2, i32 -2, i32 1, i32 4, i32 -1, i32 -4], [24 x i32] [i32 0, i32 -1, i32 -1, i32 -1, i32 -2, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -2, i32 0, i32 0, i32 -2, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -4], [24 x i32] [i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 1]], align 16, !dbg !0
@.str = private unnamed_addr constant [25 x i8] c"WG size of kernel = %d \0A\00", align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [42 x i8] c"Usage: %s <max_rows/max_cols> <penalty> \0A\00", align 1
@.str.2 = private unnamed_addr constant [36 x i8] c"\09<dimension>  - x and y dimensions\0A\00", align 1
@.str.3 = private unnamed_addr constant [40 x i8] c"\09<penalty> - penalty(positive integer)\0A\00", align 1
@.str.4 = private unnamed_addr constant [47 x i8] c"The dimension values must be a multiple of 16\0A\00", align 1
@.str.5 = private unnamed_addr constant [31 x i8] c"error: can not allocate memory\00", align 1
@.str.8 = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1
@.str.9 = private unnamed_addr constant [4 x i8] c"%d\09\00", align 1
@.str.11 = private unnamed_addr constant [11 x i8] c"result.txt\00", align 1
@.str.12 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.13 = private unnamed_addr constant [28 x i8] c"print traceback value GPU:\0A\00", align 1
@.str.14 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@str = private unnamed_addr constant [23 x i8] c"Start Needleman-Wunsch\00"
@str.15 = private unnamed_addr constant [27 x i8] c"Processing top-left matrix\00"

; Function Attrs: nounwind readnone uwtable
define i32 @_Z7maximumiii(i32 %a, i32 %b, i32 %c) local_unnamed_addr #0 !dbg !591 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %a, i64 0, metadata !596, metadata !600), !dbg !601
  tail call void @llvm.dbg.value(metadata i32 %b, i64 0, metadata !597, metadata !600), !dbg !602
  tail call void @llvm.dbg.value(metadata i32 %c, i64 0, metadata !598, metadata !600), !dbg !603
  %cmp = icmp sgt i32 %a, %b, !dbg !604
  %a.b = select i1 %cmp, i32 %a, i32 %b
  tail call void @llvm.dbg.value(metadata i32 %a.b, i64 0, metadata !599, metadata !600), !dbg !606
  %cmp1 = icmp sgt i32 %a.b, %c, !dbg !607
  %retval.0 = select i1 %cmp1, i32 %a.b, i32 %c, !dbg !609
  ret i32 %retval.0, !dbg !610
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: uwtable
define void @_Z20needle_cuda_shared_1PiS_iiii(i32* %referrence, i32* %matrix_cuda, i32 %cols, i32 %penalty, i32 %i, i32 %block_width) #2 !dbg !611 {
entry:
  %referrence.addr = alloca i32*, align 8
  %matrix_cuda.addr = alloca i32*, align 8
  %cols.addr = alloca i32, align 4
  %penalty.addr = alloca i32, align 4
  %i.addr = alloca i32, align 4
  %block_width.addr = alloca i32, align 4
  tail call void @llvm.dbg.value(metadata i32* %referrence, i64 0, metadata !615, metadata !600), !dbg !621
  store i32* %referrence, i32** %referrence.addr, align 8, !tbaa !622
  tail call void @llvm.dbg.value(metadata i32* %matrix_cuda, i64 0, metadata !616, metadata !600), !dbg !626
  store i32* %matrix_cuda, i32** %matrix_cuda.addr, align 8, !tbaa !622
  tail call void @llvm.dbg.value(metadata i32 %cols, i64 0, metadata !617, metadata !600), !dbg !627
  store i32 %cols, i32* %cols.addr, align 4, !tbaa !628
  tail call void @llvm.dbg.value(metadata i32 %penalty, i64 0, metadata !618, metadata !600), !dbg !630
  store i32 %penalty, i32* %penalty.addr, align 4, !tbaa !628
  tail call void @llvm.dbg.value(metadata i32 %i, i64 0, metadata !619, metadata !600), !dbg !631
  store i32 %i, i32* %i.addr, align 4, !tbaa !628
  tail call void @llvm.dbg.value(metadata i32 %block_width, i64 0, metadata !620, metadata !600), !dbg !632
  store i32 %block_width, i32* %block_width.addr, align 4, !tbaa !628
  %0 = bitcast i32** %referrence.addr to i8*, !dbg !633
  %1 = call i32 @cudaSetupArgument(i8* nonnull %0, i64 8, i64 0), !dbg !633
  %2 = icmp eq i32 %1, 0, !dbg !633
  br i1 %2, label %setup.next, label %setup.end, !dbg !633

setup.next:                                       ; preds = %entry
  %3 = bitcast i32** %matrix_cuda.addr to i8*, !dbg !634
  %4 = call i32 @cudaSetupArgument(i8* nonnull %3, i64 8, i64 8), !dbg !634
  %5 = icmp eq i32 %4, 0, !dbg !634
  br i1 %5, label %setup.next1, label %setup.end, !dbg !634

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast i32* %cols.addr to i8*, !dbg !636
  %7 = call i32 @cudaSetupArgument(i8* nonnull %6, i64 4, i64 16), !dbg !636
  %8 = icmp eq i32 %7, 0, !dbg !636
  br i1 %8, label %setup.next2, label %setup.end, !dbg !636

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast i32* %penalty.addr to i8*, !dbg !638
  %10 = call i32 @cudaSetupArgument(i8* nonnull %9, i64 4, i64 20), !dbg !638
  %11 = icmp eq i32 %10, 0, !dbg !638
  br i1 %11, label %setup.next3, label %setup.end, !dbg !638

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast i32* %i.addr to i8*, !dbg !640
  %13 = call i32 @cudaSetupArgument(i8* nonnull %12, i64 4, i64 24), !dbg !640
  %14 = icmp eq i32 %13, 0, !dbg !640
  br i1 %14, label %setup.next4, label %setup.end, !dbg !640

setup.next4:                                      ; preds = %setup.next3
  %15 = bitcast i32* %block_width.addr to i8*, !dbg !642
  %16 = call i32 @cudaSetupArgument(i8* nonnull %15, i64 4, i64 28), !dbg !642
  %17 = icmp eq i32 %16, 0, !dbg !642
  br i1 %17, label %setup.next5, label %setup.end, !dbg !642

setup.next5:                                      ; preds = %setup.next4
  %18 = call i32 @cudaLaunch(i8* bitcast (void (i32*, i32*, i32, i32, i32, i32)* @_Z20needle_cuda_shared_1PiS_iiii to i8*)), !dbg !644
  br label %setup.end, !dbg !644

setup.end:                                        ; preds = %setup.next5, %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !646
}

declare i32 @cudaSetupArgument(i8*, i64, i64) local_unnamed_addr

declare i32 @cudaLaunch(i8*) local_unnamed_addr

; Function Attrs: uwtable
define void @_Z20needle_cuda_shared_2PiS_iiii(i32* %referrence, i32* %matrix_cuda, i32 %cols, i32 %penalty, i32 %i, i32 %block_width) #2 !dbg !647 {
entry:
  %referrence.addr = alloca i32*, align 8
  %matrix_cuda.addr = alloca i32*, align 8
  %cols.addr = alloca i32, align 4
  %penalty.addr = alloca i32, align 4
  %i.addr = alloca i32, align 4
  %block_width.addr = alloca i32, align 4
  tail call void @llvm.dbg.value(metadata i32* %referrence, i64 0, metadata !649, metadata !600), !dbg !655
  store i32* %referrence, i32** %referrence.addr, align 8, !tbaa !622
  tail call void @llvm.dbg.value(metadata i32* %matrix_cuda, i64 0, metadata !650, metadata !600), !dbg !656
  store i32* %matrix_cuda, i32** %matrix_cuda.addr, align 8, !tbaa !622
  tail call void @llvm.dbg.value(metadata i32 %cols, i64 0, metadata !651, metadata !600), !dbg !657
  store i32 %cols, i32* %cols.addr, align 4, !tbaa !628
  tail call void @llvm.dbg.value(metadata i32 %penalty, i64 0, metadata !652, metadata !600), !dbg !658
  store i32 %penalty, i32* %penalty.addr, align 4, !tbaa !628
  tail call void @llvm.dbg.value(metadata i32 %i, i64 0, metadata !653, metadata !600), !dbg !659
  store i32 %i, i32* %i.addr, align 4, !tbaa !628
  tail call void @llvm.dbg.value(metadata i32 %block_width, i64 0, metadata !654, metadata !600), !dbg !660
  store i32 %block_width, i32* %block_width.addr, align 4, !tbaa !628
  %0 = bitcast i32** %referrence.addr to i8*, !dbg !661
  %1 = call i32 @cudaSetupArgument(i8* nonnull %0, i64 8, i64 0), !dbg !661
  %2 = icmp eq i32 %1, 0, !dbg !661
  br i1 %2, label %setup.next, label %setup.end, !dbg !661

setup.next:                                       ; preds = %entry
  %3 = bitcast i32** %matrix_cuda.addr to i8*, !dbg !662
  %4 = call i32 @cudaSetupArgument(i8* nonnull %3, i64 8, i64 8), !dbg !662
  %5 = icmp eq i32 %4, 0, !dbg !662
  br i1 %5, label %setup.next1, label %setup.end, !dbg !662

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast i32* %cols.addr to i8*, !dbg !664
  %7 = call i32 @cudaSetupArgument(i8* nonnull %6, i64 4, i64 16), !dbg !664
  %8 = icmp eq i32 %7, 0, !dbg !664
  br i1 %8, label %setup.next2, label %setup.end, !dbg !664

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast i32* %penalty.addr to i8*, !dbg !666
  %10 = call i32 @cudaSetupArgument(i8* nonnull %9, i64 4, i64 20), !dbg !666
  %11 = icmp eq i32 %10, 0, !dbg !666
  br i1 %11, label %setup.next3, label %setup.end, !dbg !666

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast i32* %i.addr to i8*, !dbg !668
  %13 = call i32 @cudaSetupArgument(i8* nonnull %12, i64 4, i64 24), !dbg !668
  %14 = icmp eq i32 %13, 0, !dbg !668
  br i1 %14, label %setup.next4, label %setup.end, !dbg !668

setup.next4:                                      ; preds = %setup.next3
  %15 = bitcast i32* %block_width.addr to i8*, !dbg !670
  %16 = call i32 @cudaSetupArgument(i8* nonnull %15, i64 4, i64 28), !dbg !670
  %17 = icmp eq i32 %16, 0, !dbg !670
  br i1 %17, label %setup.next5, label %setup.end, !dbg !670

setup.next5:                                      ; preds = %setup.next4
  %18 = call i32 @cudaLaunch(i8* bitcast (void (i32*, i32*, i32, i32, i32, i32)* @_Z20needle_cuda_shared_2PiS_iiii to i8*)), !dbg !672
  br label %setup.end, !dbg !672

setup.end:                                        ; preds = %setup.next5, %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !674
}

; Function Attrs: nounwind uwtable
define double @_Z8get_timev() local_unnamed_addr #3 !dbg !675 {
entry:
  %time = alloca %struct.timeval, align 8
  %0 = bitcast %struct.timeval* %time to i8*, !dbg !688
  call void @llvm.lifetime.start(i64 16, i8* nonnull %0) #10, !dbg !688
  tail call void @llvm.dbg.value(metadata %struct.timeval* %time, i64 0, metadata !679, metadata !689), !dbg !690
  %call = call i32 @gettimeofday(%struct.timeval* nonnull %time, %struct.timezone* null) #10, !dbg !691
  %tobool = icmp eq i32 %call, 0, !dbg !691
  br i1 %tobool, label %if.end, label %cleanup, !dbg !693

if.end:                                           ; preds = %entry
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %time, i64 0, i32 0, !dbg !694
  %1 = load i64, i64* %tv_sec, align 8, !dbg !694, !tbaa !695
  %conv = sitofp i64 %1 to double, !dbg !698
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %time, i64 0, i32 1, !dbg !699
  %2 = load i64, i64* %tv_usec, align 8, !dbg !699, !tbaa !700
  %conv1 = sitofp i64 %2 to double, !dbg !701
  %mul = fmul double %conv1, 1.000000e-06, !dbg !702
  %add = fadd double %mul, %conv, !dbg !703
  br label %cleanup, !dbg !704

cleanup:                                          ; preds = %entry, %if.end
  %retval.0 = phi double [ %add, %if.end ], [ 0.000000e+00, %entry ]
  call void @llvm.lifetime.end(i64 16, i8* nonnull %0) #10, !dbg !705
  ret double %retval.0, !dbg !705
}

; Function Attrs: nounwind
declare i32 @gettimeofday(%struct.timeval* nocapture, %struct.timezone* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind uwtable
define double @_Z7gettimev() local_unnamed_addr #3 !dbg !706 {
entry:
  %t = alloca %struct.timeval, align 8
  %0 = bitcast %struct.timeval* %t to i8*, !dbg !709
  call void @llvm.lifetime.start(i64 16, i8* nonnull %0) #10, !dbg !709
  tail call void @llvm.dbg.value(metadata %struct.timeval* %t, i64 0, metadata !708, metadata !689), !dbg !710
  %call = call i32 @gettimeofday(%struct.timeval* nonnull %t, %struct.timezone* null) #10, !dbg !711
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %t, i64 0, i32 0, !dbg !712
  %1 = load i64, i64* %tv_sec, align 8, !dbg !712, !tbaa !695
  %conv = sitofp i64 %1 to double, !dbg !713
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %t, i64 0, i32 1, !dbg !714
  %2 = load i64, i64* %tv_usec, align 8, !dbg !714, !tbaa !700
  %conv1 = sitofp i64 %2 to double, !dbg !715
  %mul = fmul double %conv1, 1.000000e-06, !dbg !716
  %add = fadd double %mul, %conv, !dbg !717
  call void @llvm.lifetime.end(i64 16, i8* nonnull %0) #10, !dbg !718
  ret double %add, !dbg !719
}

; Function Attrs: norecurse uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #5 !dbg !720 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !724, metadata !600), !dbg !726
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !725, metadata !600), !dbg !727
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str, i64 0, i64 0), i32 16), !dbg !728
  tail call void @_Z7runTestiPPc(i32 %argc, i8** %argv), !dbg !729
  ret i32 0, !dbg !730
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #4

; Function Attrs: uwtable
define void @_Z7runTestiPPc(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #2 !dbg !731 {
entry:
  %time.i489 = alloca %struct.timeval, align 8
  %time.i = alloca %struct.timeval, align 8
  %matrix_cuda = alloca i32*, align 8
  %referrence_cuda = alloca i32*, align 8
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !735, metadata !600), !dbg !863
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !736, metadata !600), !dbg !864
  %0 = bitcast i32** %matrix_cuda to i8*, !dbg !865
  call void @llvm.lifetime.start(i64 8, i8* nonnull %0) #10, !dbg !865
  %1 = bitcast i32** %referrence_cuda to i8*, !dbg !865
  call void @llvm.lifetime.start(i64 8, i8* nonnull %1) #10, !dbg !865
  %call = tail call i32 @cudaDeviceSetLimit(i32 2, i64 314572800), !dbg !866
  %cmp = icmp eq i32 %argc, 3, !dbg !867
  br i1 %cmp, label %if.end, label %if.else, !dbg !869

if.else:                                          ; preds = %entry
  tail call void @_Z5usageiPPc(i32 undef, i8** %argv), !dbg !870
  unreachable

if.end:                                           ; preds = %entry
  %arrayidx = getelementptr inbounds i8*, i8** %argv, i64 1, !dbg !872
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !872, !tbaa !622
  tail call void @llvm.dbg.value(metadata i8* %2, i64 0, metadata !309, metadata !600) #10, !dbg !874
  %call.i = tail call i64 @strtol(i8* nocapture nonnull %2, i8** null, i32 10) #10, !dbg !876
  %conv.i = trunc i64 %call.i to i32, !dbg !876
  tail call void @llvm.dbg.value(metadata i32 %conv.i, i64 0, metadata !737, metadata !600), !dbg !877
  tail call void @llvm.dbg.value(metadata i32 %conv.i, i64 0, metadata !738, metadata !600), !dbg !878
  %arrayidx4 = getelementptr inbounds i8*, i8** %argv, i64 2, !dbg !879
  %3 = load i8*, i8** %arrayidx4, align 8, !dbg !879, !tbaa !622
  tail call void @llvm.dbg.value(metadata i8* %3, i64 0, metadata !309, metadata !600) #10, !dbg !880
  %call.i479 = tail call i64 @strtol(i8* nocapture nonnull %3, i8** null, i32 10) #10, !dbg !882
  %conv.i480 = trunc i64 %call.i479 to i32, !dbg !882
  tail call void @llvm.dbg.value(metadata i32 %conv.i480, i64 0, metadata !739, metadata !600), !dbg !883
  tail call void @llvm.dbg.value(metadata i32 %conv.i, i64 0, metadata !737, metadata !600), !dbg !877
  tail call void @llvm.dbg.value(metadata i32 %conv.i, i64 0, metadata !738, metadata !600), !dbg !878
  tail call void @llvm.dbg.value(metadata i32 %conv.i480, i64 0, metadata !739, metadata !600), !dbg !883
  %4 = load i8*, i8** %arrayidx, align 8, !dbg !884, !tbaa !622
  tail call void @llvm.dbg.value(metadata i8* %4, i64 0, metadata !309, metadata !600) #10, !dbg !886
  %call.i481 = tail call i64 @strtol(i8* nocapture nonnull %4, i8** null, i32 10) #10, !dbg !888
  %rem477526 = and i64 %call.i481, 15, !dbg !889
  %cmp8 = icmp eq i64 %rem477526, 0, !dbg !889
  br i1 %cmp8, label %if.end11, label %if.then9, !dbg !890

if.then9:                                         ; preds = %if.end
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !891, !tbaa !622
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.4, i64 0, i64 0), i64 46, i64 1, %struct._IO_FILE* %5) #11, !dbg !893
  tail call void @exit(i32 1) #12, !dbg !894
  unreachable, !dbg !894

if.end11:                                         ; preds = %if.end
  %add = add nsw i32 %conv.i, 1, !dbg !895
  tail call void @llvm.dbg.value(metadata i32 %add, i64 0, metadata !737, metadata !600), !dbg !877
  tail call void @llvm.dbg.value(metadata i32 %add, i64 0, metadata !738, metadata !600), !dbg !878
  %mul = mul nsw i32 %add, %add, !dbg !896
  %conv527 = zext i32 %mul to i64, !dbg !897
  %mul13 = shl nuw nsw i64 %conv527, 2, !dbg !898
  %call14 = tail call noalias i8* @malloc(i64 %mul13) #10, !dbg !899
  %7 = bitcast i8* %call14 to i32*, !dbg !900
  tail call void @llvm.dbg.value(metadata i32* %7, i64 0, metadata !742, metadata !600), !dbg !901
  %call18 = tail call noalias i8* @malloc(i64 %mul13) #10, !dbg !902
  %8 = bitcast i8* %call18 to i32*, !dbg !903
  tail call void @llvm.dbg.value(metadata i32* %8, i64 0, metadata !740, metadata !600), !dbg !904
  %call22 = tail call noalias i8* @malloc(i64 %mul13) #10, !dbg !905
  %9 = bitcast i8* %call22 to i32*, !dbg !906
  tail call void @llvm.dbg.value(metadata i32* %9, i64 0, metadata !741, metadata !600), !dbg !907
  %tobool = icmp eq i8* %call18, null, !dbg !908
  br i1 %tobool, label %if.then23, label %if.end25, !dbg !910

if.then23:                                        ; preds = %if.end11
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !911, !tbaa !622
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.5, i64 0, i64 0), i64 30, i64 1, %struct._IO_FILE* %10) #11, !dbg !912
  br label %if.end25, !dbg !912

if.end25:                                         ; preds = %if.end11, %if.then23
  tail call void @srand(i32 7) #10, !dbg !913
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !746, metadata !600), !dbg !914
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !746, metadata !600), !dbg !914
  %cmp26568 = icmp slt i32 %conv.i, 0, !dbg !915
  br i1 %cmp26568, label %for.cond.cleanup.thread, label %for.cond27.preheader.lr.ph, !dbg !917

for.cond.cleanup.thread:                          ; preds = %if.end25
  %puts625 = tail call i32 @puts(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @str, i64 0, i64 0)), !dbg !919
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !752, metadata !600), !dbg !920
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !752, metadata !600), !dbg !920
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !754, metadata !600), !dbg !921
  br label %for.cond.cleanup109

for.cond27.preheader.lr.ph:                       ; preds = %if.end25
  %12 = shl i64 %call.i, 2, !dbg !917
  %13 = and i64 %12, 17179869180, !dbg !917
  %14 = add nuw nsw i64 %13, 4, !dbg !917
  %wide.trip.count623 = zext i32 %add to i64
  %15 = add nsw i64 %wide.trip.count623, -1, !dbg !917
  %xtraiter666 = and i64 %wide.trip.count623, 3, !dbg !917
  %lcmp.mod667 = icmp eq i64 %xtraiter666, 0, !dbg !917
  br i1 %lcmp.mod667, label %for.cond.cleanup29.prol.loopexit, label %for.cond.cleanup29.prol.preheader, !dbg !917

for.cond.cleanup29.prol.preheader:                ; preds = %for.cond27.preheader.lr.ph
  br label %for.cond.cleanup29.prol, !dbg !917

for.cond.cleanup29.prol:                          ; preds = %for.cond.cleanup29.prol, %for.cond.cleanup29.prol.preheader
  %indvars.iv620.prol = phi i64 [ %indvars.iv.next621.prol, %for.cond.cleanup29.prol ], [ 0, %for.cond.cleanup29.prol.preheader ]
  %prol.iter668 = phi i64 [ %prol.iter668.sub, %for.cond.cleanup29.prol ], [ %xtraiter666, %for.cond.cleanup29.prol.preheader ]
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !748, metadata !600), !dbg !922
  %16 = trunc i64 %indvars.iv620.prol to i32, !dbg !923
  %17 = mul i32 %add, %16, !dbg !923
  %18 = sext i32 %17 to i64, !dbg !923
  %19 = shl nsw i64 %18, 2, !dbg !923
  %scevgep.prol = getelementptr i8, i8* %call18, i64 %19, !dbg !923
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %14, i32 4, i1 false), !dbg !925
  %indvars.iv.next621.prol = add nuw nsw i64 %indvars.iv620.prol, 1, !dbg !928
  %prol.iter668.sub = add i64 %prol.iter668, -1, !dbg !917
  %prol.iter668.cmp = icmp eq i64 %prol.iter668.sub, 0, !dbg !917
  br i1 %prol.iter668.cmp, label %for.cond.cleanup29.prol.loopexit.unr-lcssa, label %for.cond.cleanup29.prol, !dbg !917, !llvm.loop !930

for.cond.cleanup29.prol.loopexit.unr-lcssa:       ; preds = %for.cond.cleanup29.prol
  br label %for.cond.cleanup29.prol.loopexit, !dbg !917

for.cond.cleanup29.prol.loopexit:                 ; preds = %for.cond27.preheader.lr.ph, %for.cond.cleanup29.prol.loopexit.unr-lcssa
  %indvars.iv620.unr = phi i64 [ 0, %for.cond27.preheader.lr.ph ], [ %indvars.iv.next621.prol, %for.cond.cleanup29.prol.loopexit.unr-lcssa ]
  %20 = icmp ult i64 %15, 3, !dbg !917
  br i1 %20, label %for.cond.cleanup, label %for.cond27.preheader.lr.ph.new, !dbg !917

for.cond27.preheader.lr.ph.new:                   ; preds = %for.cond.cleanup29.prol.loopexit
  br label %for.cond.cleanup29, !dbg !917

for.cond.cleanup.unr-lcssa:                       ; preds = %for.cond.cleanup29
  br label %for.cond.cleanup, !dbg !919

for.cond.cleanup:                                 ; preds = %for.cond.cleanup29.prol.loopexit, %for.cond.cleanup.unr-lcssa
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @str, i64 0, i64 0)), !dbg !919
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !752, metadata !600), !dbg !920
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !752, metadata !600), !dbg !920
  %cmp40564 = icmp slt i32 %conv.i, 1, !dbg !932
  br i1 %cmp40564, label %for.cond.cleanup109, label %for.body42.preheader, !dbg !935

for.body42.preheader:                             ; preds = %for.cond.cleanup
  %21 = sext i32 %add to i64, !dbg !937
  %wide.trip.count613 = zext i32 %add to i64
  br label %for.body42, !dbg !937

for.cond.cleanup29:                               ; preds = %for.cond.cleanup29, %for.cond27.preheader.lr.ph.new
  %indvars.iv620 = phi i64 [ %indvars.iv620.unr, %for.cond27.preheader.lr.ph.new ], [ %indvars.iv.next621.3, %for.cond.cleanup29 ]
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !748, metadata !600), !dbg !922
  %22 = trunc i64 %indvars.iv620 to i32, !dbg !923
  %23 = mul i32 %add, %22, !dbg !923
  %24 = sext i32 %23 to i64, !dbg !923
  %25 = shl nsw i64 %24, 2, !dbg !923
  %scevgep = getelementptr i8, i8* %call18, i64 %25, !dbg !923
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %14, i32 4, i1 false), !dbg !925
  %indvars.iv.next621 = add nuw nsw i64 %indvars.iv620, 1, !dbg !928
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !748, metadata !600), !dbg !922
  %26 = trunc i64 %indvars.iv.next621 to i32, !dbg !923
  %27 = mul i32 %add, %26, !dbg !923
  %28 = sext i32 %27 to i64, !dbg !923
  %29 = shl nsw i64 %28, 2, !dbg !923
  %scevgep.1 = getelementptr i8, i8* %call18, i64 %29, !dbg !923
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %14, i32 4, i1 false), !dbg !925
  %indvars.iv.next621.1 = add nsw i64 %indvars.iv620, 2, !dbg !928
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !748, metadata !600), !dbg !922
  %30 = trunc i64 %indvars.iv.next621.1 to i32, !dbg !923
  %31 = mul i32 %add, %30, !dbg !923
  %32 = sext i32 %31 to i64, !dbg !923
  %33 = shl nsw i64 %32, 2, !dbg !923
  %scevgep.2 = getelementptr i8, i8* %call18, i64 %33, !dbg !923
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %14, i32 4, i1 false), !dbg !925
  %indvars.iv.next621.2 = add nsw i64 %indvars.iv620, 3, !dbg !928
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !748, metadata !600), !dbg !922
  %34 = trunc i64 %indvars.iv.next621.2 to i32, !dbg !923
  %35 = mul i32 %add, %34, !dbg !923
  %36 = sext i32 %35 to i64, !dbg !923
  %37 = shl nsw i64 %36, 2, !dbg !923
  %scevgep.3 = getelementptr i8, i8* %call18, i64 %37, !dbg !923
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %14, i32 4, i1 false), !dbg !925
  %indvars.iv.next621.3 = add nsw i64 %indvars.iv620, 4, !dbg !928
  %exitcond624.3 = icmp eq i64 %indvars.iv.next621.3, %wide.trip.count623, !dbg !915
  br i1 %exitcond624.3, label %for.cond.cleanup.unr-lcssa, label %for.cond.cleanup29, !dbg !917, !llvm.loop !939

for.cond53.preheader:                             ; preds = %for.body42
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !754, metadata !600), !dbg !921
  br i1 %cmp40564, label %for.cond.cleanup109, label %for.body56.preheader, !dbg !942

for.body56.preheader:                             ; preds = %for.cond53.preheader
  %wide.trip.count608 = zext i32 %add to i64
  br label %for.body56, !dbg !944

for.body42:                                       ; preds = %for.body42, %for.body42.preheader
  %indvars.iv610 = phi i64 [ 1, %for.body42.preheader ], [ %indvars.iv.next611, %for.body42 ]
  %call43 = tail call i32 @rand() #10, !dbg !937
  %rem44 = srem i32 %call43, 10, !dbg !947
  %add45 = add nsw i32 %rem44, 1, !dbg !948
  %38 = mul nsw i64 %indvars.iv610, %21, !dbg !949
  %arrayidx48 = getelementptr inbounds i32, i32* %8, i64 %38, !dbg !950
  store i32 %add45, i32* %arrayidx48, align 4, !dbg !951, !tbaa !628
  %indvars.iv.next611 = add nuw nsw i64 %indvars.iv610, 1, !dbg !952
  %exitcond614 = icmp eq i64 %indvars.iv.next611, %wide.trip.count613, !dbg !932
  br i1 %exitcond614, label %for.cond53.preheader, label %for.body42, !dbg !935, !llvm.loop !954

for.cond71.preheader.lr.ph:                       ; preds = %for.body56
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !756, metadata !600), !dbg !957
  %39 = sext i32 %add to i64, !dbg !958
  %wide.trip.count599 = zext i32 %add to i64
  %40 = and i32 %add, 1
  %lcmp.mod665 = icmp eq i32 %40, 0
  %arrayidx81.prol = getelementptr inbounds i8, i8* %call18, i64 4
  %41 = bitcast i8* %arrayidx81.prol to i32*
  %42 = icmp eq i32 %add, 2
  br label %for.body74.lr.ph, !dbg !958

for.body56:                                       ; preds = %for.body56, %for.body56.preheader
  %indvars.iv606 = phi i64 [ 1, %for.body56.preheader ], [ %indvars.iv.next607, %for.body56 ]
  %call57 = tail call i32 @rand() #10, !dbg !944
  %rem58 = srem i32 %call57, 10, !dbg !960
  %add59 = add nsw i32 %rem58, 1, !dbg !961
  %arrayidx61 = getelementptr inbounds i32, i32* %8, i64 %indvars.iv606, !dbg !962
  store i32 %add59, i32* %arrayidx61, align 4, !dbg !963, !tbaa !628
  %indvars.iv.next607 = add nuw nsw i64 %indvars.iv606, 1, !dbg !964
  %exitcond609 = icmp eq i64 %indvars.iv.next607, %wide.trip.count608, !dbg !966
  br i1 %exitcond609, label %for.cond71.preheader.lr.ph, label %for.body56, !dbg !942, !llvm.loop !968

for.body74.lr.ph:                                 ; preds = %for.cond71.preheader.lr.ph, %for.cond.cleanup73
  %indvars.iv601 = phi i64 [ %indvars.iv.next602, %for.cond.cleanup73 ], [ 1, %for.cond71.preheader.lr.ph ]
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !758, metadata !600), !dbg !971
  %43 = mul nsw i64 %indvars.iv601, %39
  %arrayidx77 = getelementptr inbounds i32, i32* %8, i64 %43
  %44 = load i32, i32* %arrayidx77, align 4, !tbaa !628
  %idxprom78 = sext i32 %44 to i64
  br i1 %lcmp.mod665, label %for.body74.prol.preheader, label %for.body74.prol.loopexit.unr-lcssa, !dbg !972

for.body74.prol.preheader:                        ; preds = %for.body74.lr.ph
  br label %for.body74.prol, !dbg !972

for.body74.prol:                                  ; preds = %for.body74.prol.preheader
  %45 = load i32, i32* %41, align 4, !dbg !974, !tbaa !628
  %idxprom82.prol = sext i32 %45 to i64, !dbg !977
  %arrayidx83.prol = getelementptr inbounds [24 x [24 x i32]], [24 x [24 x i32]]* @blosum62, i64 0, i64 %idxprom78, i64 %idxprom82.prol, !dbg !977
  %46 = load i32, i32* %arrayidx83.prol, align 4, !dbg !977, !tbaa !628
  %47 = add nsw i64 %43, 1, !dbg !978
  %arrayidx87.prol = getelementptr inbounds i32, i32* %7, i64 %47, !dbg !979
  store i32 %46, i32* %arrayidx87.prol, align 4, !dbg !980, !tbaa !628
  br label %for.body74.prol.loopexit.unr-lcssa, !dbg !972

for.body74.prol.loopexit.unr-lcssa:               ; preds = %for.body74.lr.ph, %for.body74.prol
  %indvars.iv596.unr.ph = phi i64 [ 2, %for.body74.prol ], [ 1, %for.body74.lr.ph ]
  br label %for.body74.prol.loopexit, !dbg !972

for.body74.prol.loopexit:                         ; preds = %for.body74.prol.loopexit.unr-lcssa
  br i1 %42, label %for.cond.cleanup73, label %for.body74.lr.ph.new, !dbg !972

for.body74.lr.ph.new:                             ; preds = %for.body74.prol.loopexit
  br label %for.body74, !dbg !972

for.body98.lr.ph:                                 ; preds = %for.cond.cleanup73
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !762, metadata !600), !dbg !981
  %sub = sub i32 0, %conv.i480
  %48 = sext i32 %add to i64, !dbg !982
  %wide.trip.count594 = zext i32 %add to i64
  %49 = add nsw i64 %wide.trip.count623, -2, !dbg !982
  %50 = and i64 %call.i, 3, !dbg !982
  %lcmp.mod = icmp eq i64 %50, 0, !dbg !982
  br i1 %lcmp.mod, label %for.body98.prol.loopexit, label %for.body98.prol.preheader, !dbg !982

for.body98.prol.preheader:                        ; preds = %for.body98.lr.ph
  br label %for.body98.prol, !dbg !982

for.body98.prol:                                  ; preds = %for.body98.prol, %for.body98.prol.preheader
  %indvars.iv591.prol = phi i64 [ %indvars.iv.next592.prol, %for.body98.prol ], [ 1, %for.body98.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body98.prol ], [ %50, %for.body98.prol.preheader ]
  %51 = trunc i64 %indvars.iv591.prol to i32, !dbg !984
  %mul99.prol = mul i32 %51, %sub, !dbg !984
  %52 = mul nsw i64 %indvars.iv591.prol, %48, !dbg !986
  %arrayidx102.prol = getelementptr inbounds i32, i32* %8, i64 %52, !dbg !987
  store i32 %mul99.prol, i32* %arrayidx102.prol, align 4, !dbg !988, !tbaa !628
  %indvars.iv.next592.prol = add nuw nsw i64 %indvars.iv591.prol, 1, !dbg !989
  %prol.iter.sub = add i64 %prol.iter, -1, !dbg !982
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0, !dbg !982
  br i1 %prol.iter.cmp, label %for.body98.prol.loopexit.unr-lcssa, label %for.body98.prol, !dbg !982, !llvm.loop !991

for.body98.prol.loopexit.unr-lcssa:               ; preds = %for.body98.prol
  br label %for.body98.prol.loopexit, !dbg !982

for.body98.prol.loopexit:                         ; preds = %for.body98.lr.ph, %for.body98.prol.loopexit.unr-lcssa
  %indvars.iv591.unr = phi i64 [ 1, %for.body98.lr.ph ], [ %indvars.iv.next592.prol, %for.body98.prol.loopexit.unr-lcssa ]
  %53 = icmp ult i64 %49, 3, !dbg !982
  br i1 %53, label %for.body110.lr.ph, label %for.body98.lr.ph.new, !dbg !982

for.body98.lr.ph.new:                             ; preds = %for.body98.prol.loopexit
  br label %for.body98, !dbg !982

for.cond.cleanup73.unr-lcssa:                     ; preds = %for.body74
  br label %for.cond.cleanup73, !dbg !992

for.cond.cleanup73:                               ; preds = %for.body74.prol.loopexit, %for.cond.cleanup73.unr-lcssa
  %indvars.iv.next602 = add nuw nsw i64 %indvars.iv601, 1, !dbg !992
  %exitcond605 = icmp eq i64 %indvars.iv.next602, %wide.trip.count599, !dbg !994
  br i1 %exitcond605, label %for.body98.lr.ph, label %for.body74.lr.ph, !dbg !958, !llvm.loop !996

for.body74:                                       ; preds = %for.body74, %for.body74.lr.ph.new
  %indvars.iv596 = phi i64 [ %indvars.iv596.unr.ph, %for.body74.lr.ph.new ], [ %indvars.iv.next597.1, %for.body74 ]
  %arrayidx81 = getelementptr inbounds i32, i32* %8, i64 %indvars.iv596, !dbg !974
  %54 = load i32, i32* %arrayidx81, align 4, !dbg !974, !tbaa !628
  %idxprom82 = sext i32 %54 to i64, !dbg !977
  %arrayidx83 = getelementptr inbounds [24 x [24 x i32]], [24 x [24 x i32]]* @blosum62, i64 0, i64 %idxprom78, i64 %idxprom82, !dbg !977
  %55 = load i32, i32* %arrayidx83, align 4, !dbg !977, !tbaa !628
  %56 = add nsw i64 %indvars.iv596, %43, !dbg !978
  %arrayidx87 = getelementptr inbounds i32, i32* %7, i64 %56, !dbg !979
  store i32 %55, i32* %arrayidx87, align 4, !dbg !980, !tbaa !628
  %indvars.iv.next597 = add nuw nsw i64 %indvars.iv596, 1, !dbg !999
  %arrayidx81.1 = getelementptr inbounds i32, i32* %8, i64 %indvars.iv.next597, !dbg !974
  %57 = load i32, i32* %arrayidx81.1, align 4, !dbg !974, !tbaa !628
  %idxprom82.1 = sext i32 %57 to i64, !dbg !977
  %arrayidx83.1 = getelementptr inbounds [24 x [24 x i32]], [24 x [24 x i32]]* @blosum62, i64 0, i64 %idxprom78, i64 %idxprom82.1, !dbg !977
  %58 = load i32, i32* %arrayidx83.1, align 4, !dbg !977, !tbaa !628
  %59 = add nsw i64 %indvars.iv.next597, %43, !dbg !978
  %arrayidx87.1 = getelementptr inbounds i32, i32* %7, i64 %59, !dbg !979
  store i32 %58, i32* %arrayidx87.1, align 4, !dbg !980, !tbaa !628
  %indvars.iv.next597.1 = add nsw i64 %indvars.iv596, 2, !dbg !999
  %exitcond600.1 = icmp eq i64 %indvars.iv.next597.1, %wide.trip.count599, !dbg !1001
  br i1 %exitcond600.1, label %for.cond.cleanup73.unr-lcssa, label %for.body74, !dbg !972, !llvm.loop !1003

for.body110.lr.ph.unr-lcssa:                      ; preds = %for.body98
  br label %for.body110.lr.ph, !dbg !1006

for.body110.lr.ph:                                ; preds = %for.body98.prol.loopexit, %for.body110.lr.ph.unr-lcssa
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !764, metadata !600), !dbg !1006
  %sub111 = sub i32 0, %conv.i480
  %wide.trip.count = zext i32 %add to i64
  %60 = add nsw i64 %wide.trip.count623, -1, !dbg !1007
  %min.iters.check = icmp ult i64 %60, 8, !dbg !1007
  br i1 %min.iters.check, label %for.body110.preheader, label %min.iters.checked, !dbg !1007

for.body110.preheader:                            ; preds = %middle.block, %min.iters.checked, %for.body110.lr.ph
  %indvars.iv589.ph = phi i64 [ 1, %min.iters.checked ], [ 1, %for.body110.lr.ph ], [ %ind.end, %middle.block ]
  br label %for.body110, !dbg !1009

min.iters.checked:                                ; preds = %for.body110.lr.ph
  %61 = and i64 %call.i, 7, !dbg !1007
  %n.vec = sub nsw i64 %60, %61, !dbg !1007
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !1007
  %ind.end = add nsw i64 %n.vec, 1, !dbg !1007
  br i1 %cmp.zero, label %for.body110.preheader, label %vector.ph, !dbg !1007

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert = insertelement <4 x i32> undef, i32 %sub111, i32 0, !dbg !1007
  %broadcast.splat = shufflevector <4 x i32> %broadcast.splatinsert, <4 x i32> undef, <4 x i32> zeroinitializer, !dbg !1007
  br label %vector.body, !dbg !1007

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 1, i64 2, i64 3, i64 4>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %step.add = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %offset.idx = or i64 %index, 1
  %62 = trunc <4 x i64> %vec.ind to <4 x i32>, !dbg !1009
  %63 = trunc <4 x i64> %step.add to <4 x i32>, !dbg !1009
  %64 = mul <4 x i32> %broadcast.splat, %62, !dbg !1009
  %65 = mul <4 x i32> %broadcast.splat, %63, !dbg !1009
  %66 = getelementptr inbounds i32, i32* %8, i64 %offset.idx, !dbg !1011
  %67 = bitcast i32* %66 to <4 x i32>*, !dbg !1012
  store <4 x i32> %64, <4 x i32>* %67, align 4, !dbg !1012, !tbaa !628
  %68 = getelementptr i32, i32* %66, i64 4, !dbg !1012
  %69 = bitcast i32* %68 to <4 x i32>*, !dbg !1012
  store <4 x i32> %65, <4 x i32>* %69, align 4, !dbg !1012, !tbaa !628
  %index.next = add i64 %index, 8
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 8, i64 8, i64 8, i64 8>
  %70 = icmp eq i64 %index.next, %n.vec
  br i1 %70, label %middle.block, label %vector.body, !llvm.loop !1013

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %61, 0
  br i1 %cmp.n, label %for.cond.cleanup109, label %for.body110.preheader, !dbg !1007

for.body98:                                       ; preds = %for.body98, %for.body98.lr.ph.new
  %indvars.iv591 = phi i64 [ %indvars.iv591.unr, %for.body98.lr.ph.new ], [ %indvars.iv.next592.3, %for.body98 ]
  %71 = trunc i64 %indvars.iv591 to i32, !dbg !984
  %mul99 = mul i32 %71, %sub, !dbg !984
  %72 = mul nsw i64 %indvars.iv591, %48, !dbg !986
  %arrayidx102 = getelementptr inbounds i32, i32* %8, i64 %72, !dbg !987
  store i32 %mul99, i32* %arrayidx102, align 4, !dbg !988, !tbaa !628
  %indvars.iv.next592 = add nuw nsw i64 %indvars.iv591, 1, !dbg !989
  %73 = trunc i64 %indvars.iv.next592 to i32, !dbg !984
  %mul99.1 = mul i32 %73, %sub, !dbg !984
  %74 = mul nsw i64 %indvars.iv.next592, %48, !dbg !986
  %arrayidx102.1 = getelementptr inbounds i32, i32* %8, i64 %74, !dbg !987
  store i32 %mul99.1, i32* %arrayidx102.1, align 4, !dbg !988, !tbaa !628
  %indvars.iv.next592.1 = add nsw i64 %indvars.iv591, 2, !dbg !989
  %75 = trunc i64 %indvars.iv.next592.1 to i32, !dbg !984
  %mul99.2 = mul i32 %75, %sub, !dbg !984
  %76 = mul nsw i64 %indvars.iv.next592.1, %48, !dbg !986
  %arrayidx102.2 = getelementptr inbounds i32, i32* %8, i64 %76, !dbg !987
  store i32 %mul99.2, i32* %arrayidx102.2, align 4, !dbg !988, !tbaa !628
  %indvars.iv.next592.2 = add nsw i64 %indvars.iv591, 3, !dbg !989
  %77 = trunc i64 %indvars.iv.next592.2 to i32, !dbg !984
  %mul99.3 = mul i32 %77, %sub, !dbg !984
  %78 = mul nsw i64 %indvars.iv.next592.2, %48, !dbg !986
  %arrayidx102.3 = getelementptr inbounds i32, i32* %8, i64 %78, !dbg !987
  store i32 %mul99.3, i32* %arrayidx102.3, align 4, !dbg !988, !tbaa !628
  %indvars.iv.next592.3 = add nsw i64 %indvars.iv591, 4, !dbg !989
  %exitcond595.3 = icmp eq i64 %indvars.iv.next592.3, %wide.trip.count594, !dbg !1018
  br i1 %exitcond595.3, label %for.body110.lr.ph.unr-lcssa, label %for.body98, !dbg !982, !llvm.loop !1020

for.cond.cleanup109.loopexit:                     ; preds = %for.body110
  br label %for.cond.cleanup109, !dbg !1023

for.cond.cleanup109:                              ; preds = %for.cond.cleanup109.loopexit, %middle.block, %for.cond.cleanup, %for.cond.cleanup.thread, %for.cond53.preheader
  tail call void @llvm.dbg.value(metadata i32 %mul, i64 0, metadata !745, metadata !600), !dbg !1023
  %79 = bitcast i32** %referrence_cuda to i8**, !dbg !1024
  %call121 = call i32 @cudaMalloc(i8** nonnull %79, i64 %mul13), !dbg !1025
  %80 = bitcast i32** %matrix_cuda to i8**, !dbg !1026
  %call124 = call i32 @cudaMalloc(i8** nonnull %80, i64 %mul13), !dbg !1027
  %81 = load i8*, i8** %79, align 8, !dbg !1028, !tbaa !622
  %call127 = call i32 @cudaMemcpy(i8* %81, i8* %call14, i64 %mul13, i32 1), !dbg !1029
  %82 = load i8*, i8** %80, align 8, !dbg !1030, !tbaa !622
  %call130 = call i32 @cudaMemcpy(i8* %82, i8* %call18, i64 %mul13, i32 1), !dbg !1031
  call void @llvm.dbg.value(metadata %struct.dim3* undef, i64 0, metadata !766, metadata !689), !dbg !1032
  call void @llvm.dbg.value(metadata %struct.dim3* undef, i64 0, metadata !790, metadata !689), !dbg !1033
  %div = sdiv i32 %conv.i, 16, !dbg !1034
  call void @llvm.dbg.value(metadata i32 %div, i64 0, metadata !791, metadata !600), !dbg !1035
  %puts478 = call i32 @puts(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @str.15, i64 0, i64 0)), !dbg !1036
  %call133 = call i32 @cudaDeviceSynchronize(), !dbg !1037
  %83 = bitcast %struct.timeval* %time.i489 to i8*, !dbg !1038
  call void @llvm.lifetime.start(i64 16, i8* nonnull %83) #10, !dbg !1038
  call void @llvm.dbg.value(metadata %struct.timeval* %time.i489, i64 0, metadata !679, metadata !689) #10, !dbg !1040
  %call.i490 = call i32 @gettimeofday(%struct.timeval* nonnull %time.i489, %struct.timezone* null) #10, !dbg !1041
  %tobool.i491 = icmp eq i32 %call.i490, 0, !dbg !1041
  br i1 %tobool.i491, label %if.end.i498, label %_Z8get_timev.exit500, !dbg !1042

if.end.i498:                                      ; preds = %for.cond.cleanup109
  %tv_sec.i492 = getelementptr inbounds %struct.timeval, %struct.timeval* %time.i489, i64 0, i32 0, !dbg !1043
  %84 = load i64, i64* %tv_sec.i492, align 8, !dbg !1043, !tbaa !695
  %conv.i493 = sitofp i64 %84 to double, !dbg !1044
  %tv_usec.i494 = getelementptr inbounds %struct.timeval, %struct.timeval* %time.i489, i64 0, i32 1, !dbg !1045
  %85 = load i64, i64* %tv_usec.i494, align 8, !dbg !1045, !tbaa !700
  %conv1.i495 = sitofp i64 %85 to double, !dbg !1046
  %mul.i496 = fmul double %conv1.i495, 1.000000e-06, !dbg !1047
  %add.i497 = fadd double %mul.i496, %conv.i493, !dbg !1048
  br label %_Z8get_timev.exit500, !dbg !1049

_Z8get_timev.exit500:                             ; preds = %for.cond.cleanup109, %if.end.i498
  %retval.0.i499 = phi double [ %add.i497, %if.end.i498 ], [ 0.000000e+00, %for.cond.cleanup109 ]
  call void @llvm.lifetime.end(i64 16, i8* nonnull %83) #10, !dbg !1050
  call void @llvm.dbg.value(metadata double %retval.0.i499, i64 0, metadata !792, metadata !600), !dbg !1051
  call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !793, metadata !600), !dbg !1052
  call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !793, metadata !600), !dbg !1052
  %cmp137552 = icmp slt i32 %conv.i, 16, !dbg !1053
  br i1 %cmp137552, label %for.cond.cleanup150, label %for.body139.preheader, !dbg !1056

for.body139.preheader:                            ; preds = %_Z8get_timev.exit500
  %86 = sext i32 %div to i64, !dbg !1058
  br label %for.body139, !dbg !1058

for.body110:                                      ; preds = %for.body110.preheader, %for.body110
  %indvars.iv589 = phi i64 [ %indvars.iv.next590, %for.body110 ], [ %indvars.iv589.ph, %for.body110.preheader ]
  %87 = trunc i64 %indvars.iv589 to i32, !dbg !1009
  %mul112 = mul i32 %87, %sub111, !dbg !1009
  %arrayidx114 = getelementptr inbounds i32, i32* %8, i64 %indvars.iv589, !dbg !1011
  store i32 %mul112, i32* %arrayidx114, align 4, !dbg !1012, !tbaa !628
  %indvars.iv.next590 = add nuw nsw i64 %indvars.iv589, 1, !dbg !1060
  %exitcond = icmp eq i64 %indvars.iv.next590, %wide.trip.count, !dbg !1062
  br i1 %exitcond, label %for.cond.cleanup109.loopexit, label %for.body110, !dbg !1007, !llvm.loop !1064

for.cond148.preheader:                            ; preds = %for.inc143
  %cmp149550 = icmp sgt i32 %conv.i, 31, !dbg !1066
  br i1 %cmp149550, label %for.body151.preheader, label %for.cond.cleanup150, !dbg !1069

for.body151.preheader:                            ; preds = %for.cond148.preheader
  br label %for.body151

for.body139:                                      ; preds = %for.body139.preheader, %for.inc143
  %indvars.iv587 = phi i64 [ 1, %for.body139.preheader ], [ %indvars.iv.next588, %for.inc143 ]
  %dimGrid.sroa.0.sroa.0.0.insert.insert518 = or i64 %indvars.iv587, 4294967296, !dbg !1058
  %call141 = call i32 @cudaConfigureCall(i64 %dimGrid.sroa.0.sroa.0.0.insert.insert518, i32 1, i64 4294967312, i32 1, i64 0, %struct.CUstream_st* null), !dbg !1071
  %tobool142 = icmp eq i32 %call141, 0, !dbg !1071
  br i1 %tobool142, label %kcall.configok, label %for.inc143, !dbg !1072

kcall.configok:                                   ; preds = %for.body139
  %88 = load i32*, i32** %referrence_cuda, align 8, !dbg !1073, !tbaa !622
  call void @llvm.dbg.value(metadata i32* %88, i64 0, metadata !744, metadata !600), !dbg !1075
  %89 = load i32*, i32** %matrix_cuda, align 8, !dbg !1076, !tbaa !622
  call void @llvm.dbg.value(metadata i32* %89, i64 0, metadata !743, metadata !600), !dbg !1077
  %90 = trunc i64 %indvars.iv587 to i32, !dbg !1078
  call void @_Z20needle_cuda_shared_1PiS_iiii(i32* %88, i32* %89, i32 %add, i32 %conv.i480, i32 %90, i32 %div), !dbg !1078
  br label %for.inc143, !dbg !1078

for.inc143:                                       ; preds = %for.body139, %kcall.configok
  %indvars.iv.next588 = add nuw nsw i64 %indvars.iv587, 1, !dbg !1079
  %cmp137 = icmp slt i64 %indvars.iv587, %86, !dbg !1053
  br i1 %cmp137, label %for.body139, label %for.cond148.preheader, !dbg !1056, !llvm.loop !1081

for.cond.cleanup150.loopexit:                     ; preds = %for.cond148.backedge
  br label %for.cond.cleanup150, !dbg !1084

for.cond.cleanup150:                              ; preds = %for.cond.cleanup150.loopexit, %_Z8get_timev.exit500, %for.cond148.preheader
  %call162 = call i32 @cudaDeviceSynchronize(), !dbg !1084
  %91 = bitcast %struct.timeval* %time.i to i8*, !dbg !1085
  call void @llvm.lifetime.start(i64 16, i8* nonnull %91) #10, !dbg !1085
  call void @llvm.dbg.value(metadata %struct.timeval* %time.i, i64 0, metadata !679, metadata !689) #10, !dbg !1087
  %call.i486 = call i32 @gettimeofday(%struct.timeval* nonnull %time.i, %struct.timezone* null) #10, !dbg !1088
  %tobool.i = icmp eq i32 %call.i486, 0, !dbg !1088
  br i1 %tobool.i, label %if.end.i, label %_Z8get_timev.exit, !dbg !1089

if.end.i:                                         ; preds = %for.cond.cleanup150
  %tv_sec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %time.i, i64 0, i32 0, !dbg !1090
  %92 = load i64, i64* %tv_sec.i, align 8, !dbg !1090, !tbaa !695
  %conv.i487 = sitofp i64 %92 to double, !dbg !1091
  %tv_usec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %time.i, i64 0, i32 1, !dbg !1092
  %93 = load i64, i64* %tv_usec.i, align 8, !dbg !1092, !tbaa !700
  %conv1.i = sitofp i64 %93 to double, !dbg !1093
  %mul.i = fmul double %conv1.i, 1.000000e-06, !dbg !1094
  %add.i = fadd double %mul.i, %conv.i487, !dbg !1095
  br label %_Z8get_timev.exit, !dbg !1096

_Z8get_timev.exit:                                ; preds = %for.cond.cleanup150, %if.end.i
  %retval.0.i488 = phi double [ %add.i, %if.end.i ], [ 0.000000e+00, %for.cond.cleanup150 ]
  call void @llvm.lifetime.end(i64 16, i8* nonnull %91) #10, !dbg !1097
  call void @llvm.dbg.value(metadata double %retval.0.i488, i64 0, metadata !797, metadata !600), !dbg !1098
  %94 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1099, !tbaa !622
  %sub164 = fsub double %retval.0.i488, %retval.0.i499, !dbg !1100
  %call165 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %94, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.8, i64 0, i64 0), double %sub164) #11, !dbg !1101
  %95 = load i8*, i8** %80, align 8, !dbg !1102, !tbaa !622
  %call168 = call i32 @cudaMemcpy(i8* %call22, i8* %95, i64 %mul13, i32 2), !dbg !1103
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !798, metadata !600), !dbg !1104
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !798, metadata !600), !dbg !1104
  %96 = load i32, i32* %9, align 4, !dbg !1105, !tbaa !628
  %call175 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i64 0, i64 0), i32 %96), !dbg !1107
  %arrayidx174.1 = getelementptr inbounds i8, i8* %call22, i64 4, !dbg !1105
  %97 = bitcast i8* %arrayidx174.1 to i32*, !dbg !1105
  %98 = load i32, i32* %97, align 4, !dbg !1105, !tbaa !628
  %call175.1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i64 0, i64 0), i32 %98), !dbg !1107
  %arrayidx174.2 = getelementptr inbounds i8, i8* %call22, i64 8, !dbg !1105
  %99 = bitcast i8* %arrayidx174.2 to i32*, !dbg !1105
  %100 = load i32, i32* %99, align 4, !dbg !1105, !tbaa !628
  %call175.2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i64 0, i64 0), i32 %100), !dbg !1107
  %arrayidx174.3 = getelementptr inbounds i8, i8* %call22, i64 12, !dbg !1105
  %101 = bitcast i8* %arrayidx174.3 to i32*, !dbg !1105
  %102 = load i32, i32* %101, align 4, !dbg !1105, !tbaa !628
  %call175.3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i64 0, i64 0), i32 %102), !dbg !1107
  %arrayidx174.4 = getelementptr inbounds i8, i8* %call22, i64 16, !dbg !1105
  %103 = bitcast i8* %arrayidx174.4 to i32*, !dbg !1105
  %104 = load i32, i32* %103, align 4, !dbg !1105, !tbaa !628
  %call175.4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i64 0, i64 0), i32 %104), !dbg !1107
  %arrayidx174.5 = getelementptr inbounds i8, i8* %call22, i64 20, !dbg !1105
  %105 = bitcast i8* %arrayidx174.5 to i32*, !dbg !1105
  %106 = load i32, i32* %105, align 4, !dbg !1105, !tbaa !628
  %call175.5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i64 0, i64 0), i32 %106), !dbg !1107
  %arrayidx174.6 = getelementptr inbounds i8, i8* %call22, i64 24, !dbg !1105
  %107 = bitcast i8* %arrayidx174.6 to i32*, !dbg !1105
  %108 = load i32, i32* %107, align 4, !dbg !1105, !tbaa !628
  %call175.6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i64 0, i64 0), i32 %108), !dbg !1107
  %arrayidx174.7 = getelementptr inbounds i8, i8* %call22, i64 28, !dbg !1105
  %109 = bitcast i8* %arrayidx174.7 to i32*, !dbg !1105
  %110 = load i32, i32* %109, align 4, !dbg !1105, !tbaa !628
  %call175.7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i64 0, i64 0), i32 %110), !dbg !1107
  %arrayidx174.8 = getelementptr inbounds i8, i8* %call22, i64 32, !dbg !1105
  %111 = bitcast i8* %arrayidx174.8 to i32*, !dbg !1105
  %112 = load i32, i32* %111, align 4, !dbg !1105, !tbaa !628
  %call175.8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i64 0, i64 0), i32 %112), !dbg !1107
  %arrayidx174.9 = getelementptr inbounds i8, i8* %call22, i64 36, !dbg !1105
  %113 = bitcast i8* %arrayidx174.9 to i32*, !dbg !1105
  %114 = load i32, i32* %113, align 4, !dbg !1105, !tbaa !628
  %call175.9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i64 0, i64 0), i32 %114), !dbg !1107
  %arrayidx174.10 = getelementptr inbounds i8, i8* %call22, i64 40, !dbg !1105
  %115 = bitcast i8* %arrayidx174.10 to i32*, !dbg !1105
  %116 = load i32, i32* %115, align 4, !dbg !1105, !tbaa !628
  %call175.10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i64 0, i64 0), i32 %116), !dbg !1107
  %arrayidx174.11 = getelementptr inbounds i8, i8* %call22, i64 44, !dbg !1105
  %117 = bitcast i8* %arrayidx174.11 to i32*, !dbg !1105
  %118 = load i32, i32* %117, align 4, !dbg !1105, !tbaa !628
  %call175.11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i64 0, i64 0), i32 %118), !dbg !1107
  %arrayidx174.12 = getelementptr inbounds i8, i8* %call22, i64 48, !dbg !1105
  %119 = bitcast i8* %arrayidx174.12 to i32*, !dbg !1105
  %120 = load i32, i32* %119, align 4, !dbg !1105, !tbaa !628
  %call175.12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i64 0, i64 0), i32 %120), !dbg !1107
  %arrayidx174.13 = getelementptr inbounds i8, i8* %call22, i64 52, !dbg !1105
  %121 = bitcast i8* %arrayidx174.13 to i32*, !dbg !1105
  %122 = load i32, i32* %121, align 4, !dbg !1105, !tbaa !628
  %call175.13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i64 0, i64 0), i32 %122), !dbg !1107
  %arrayidx174.14 = getelementptr inbounds i8, i8* %call22, i64 56, !dbg !1105
  %123 = bitcast i8* %arrayidx174.14 to i32*, !dbg !1105
  %124 = load i32, i32* %123, align 4, !dbg !1105, !tbaa !628
  %call175.14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i64 0, i64 0), i32 %124), !dbg !1107
  %arrayidx174.15 = getelementptr inbounds i8, i8* %call22, i64 60, !dbg !1105
  %125 = bitcast i8* %arrayidx174.15 to i32*, !dbg !1105
  %126 = load i32, i32* %125, align 4, !dbg !1105, !tbaa !628
  %call175.15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i64 0, i64 0), i32 %126), !dbg !1107
  %arrayidx174.16 = getelementptr inbounds i8, i8* %call22, i64 64, !dbg !1105
  %127 = bitcast i8* %arrayidx174.16 to i32*, !dbg !1105
  %128 = load i32, i32* %127, align 4, !dbg !1105, !tbaa !628
  %call175.16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i64 0, i64 0), i32 %128), !dbg !1107
  %arrayidx174.17 = getelementptr inbounds i8, i8* %call22, i64 68, !dbg !1105
  %129 = bitcast i8* %arrayidx174.17 to i32*, !dbg !1105
  %130 = load i32, i32* %129, align 4, !dbg !1105, !tbaa !628
  %call175.17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i64 0, i64 0), i32 %130), !dbg !1107
  %arrayidx174.18 = getelementptr inbounds i8, i8* %call22, i64 72, !dbg !1105
  %131 = bitcast i8* %arrayidx174.18 to i32*, !dbg !1105
  %132 = load i32, i32* %131, align 4, !dbg !1105, !tbaa !628
  %call175.18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i64 0, i64 0), i32 %132), !dbg !1107
  %arrayidx174.19 = getelementptr inbounds i8, i8* %call22, i64 76, !dbg !1105
  %133 = bitcast i8* %arrayidx174.19 to i32*, !dbg !1105
  %134 = load i32, i32* %133, align 4, !dbg !1105, !tbaa !628
  %call175.19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i64 0, i64 0), i32 %134), !dbg !1107
  %putchar = call i32 @putchar(i32 10), !dbg !1108
  %call180 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.11, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.12, i64 0, i64 0)), !dbg !1109
  call void @llvm.dbg.value(metadata %struct._IO_FILE* %call180, i64 0, metadata !800, metadata !600), !dbg !1110
  %135 = call i64 @fwrite(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.13, i64 0, i64 0), i64 27, i64 1, %struct._IO_FILE* %call180), !dbg !1111
  %sub183 = add nsw i32 %conv.i, -1, !dbg !1112
  call void @llvm.dbg.value(metadata i32 %sub183, i64 0, metadata !851, metadata !600), !dbg !1113
  call void @llvm.dbg.value(metadata i32 %sub183, i64 0, metadata !853, metadata !600), !dbg !1114
  call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !858, metadata !600), !dbg !1115
  call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !857, metadata !600), !dbg !1116
  call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !854, metadata !600), !dbg !1117
  call void @llvm.dbg.value(metadata i32 %sub183, i64 0, metadata !853, metadata !600), !dbg !1114
  call void @llvm.dbg.value(metadata i32 %sub183, i64 0, metadata !851, metadata !600), !dbg !1113
  %cmp188537542 = icmp sgt i32 %conv.i, 0, !dbg !1118
  br i1 %cmp188537542, label %for.body190.lr.ph.preheader, label %cleanup287, !dbg !1120

for.body190.lr.ph.preheader:                      ; preds = %_Z8get_timev.exit
  br label %for.body190.lr.ph

for.body151:                                      ; preds = %for.body151.preheader, %for.cond148.backedge
  %i146.0551.in = phi i32 [ %i146.0551, %for.cond148.backedge ], [ %div, %for.body151.preheader ]
  %i146.0551 = add nsw i32 %i146.0551.in, -1
  %dimGrid.sroa.0.sroa.0.0.insert.ext = zext i32 %i146.0551 to i64, !dbg !1122
  %dimGrid.sroa.0.sroa.0.0.insert.insert = or i64 %dimGrid.sroa.0.sroa.0.0.insert.ext, 4294967296, !dbg !1122
  %call156 = call i32 @cudaConfigureCall(i64 %dimGrid.sroa.0.sroa.0.0.insert.insert, i32 1, i64 4294967312, i32 1, i64 0, %struct.CUstream_st* null), !dbg !1124
  %tobool157 = icmp eq i32 %call156, 0, !dbg !1124
  br i1 %tobool157, label %kcall.configok158, label %for.cond148.backedge, !dbg !1125

for.cond148.backedge:                             ; preds = %for.body151, %kcall.configok158
  %cmp149 = icmp sgt i32 %i146.0551, 1, !dbg !1066
  br i1 %cmp149, label %for.body151, label %for.cond.cleanup150.loopexit, !dbg !1069, !llvm.loop !1126

kcall.configok158:                                ; preds = %for.body151
  %136 = load i32*, i32** %referrence_cuda, align 8, !dbg !1129, !tbaa !622
  call void @llvm.dbg.value(metadata i32* %136, i64 0, metadata !744, metadata !600), !dbg !1075
  %137 = load i32*, i32** %matrix_cuda, align 8, !dbg !1131, !tbaa !622
  call void @llvm.dbg.value(metadata i32* %137, i64 0, metadata !743, metadata !600), !dbg !1077
  call void @_Z20needle_cuda_shared_2PiS_iiii(i32* %136, i32* %137, i32 %add, i32 %conv.i480, i32 %i146.0551, i32 %div), !dbg !1132
  br label %for.cond148.backedge, !dbg !1132

for.body190:                                      ; preds = %for.body190.lr.ph, %if.then271
  %indvars.iv = phi i64 [ %153, %for.body190.lr.ph ], [ %indvars.iv.next, %if.then271 ]
  %w.0541 = phi i32 [ %w.0.ph547, %for.body190.lr.ph ], [ %w.1, %if.then271 ]
  %n.0540 = phi i32 [ %n.0.ph546, %for.body190.lr.ph ], [ %n.1, %if.then271 ]
  %nw.0539 = phi i32 [ %nw.0.ph545, %for.body190.lr.ph ], [ %nw.1, %if.then271 ]
  %j184.0538 = phi i32 [ %j184.0.ph544, %for.body190.lr.ph ], [ %dec272, %if.then271 ]
  %138 = trunc i64 %indvars.iv to i32, !dbg !1133
  %cmp194 = icmp eq i32 %sub183, %138, !dbg !1133
  %or.cond = and i1 %cmp192, %cmp194, !dbg !1136
  br i1 %or.cond, label %if.then195, label %if.end201, !dbg !1136

if.then195:                                       ; preds = %for.body190
  %139 = add nsw i64 %indvars.iv, %155, !dbg !1137
  %arrayidx199 = getelementptr inbounds i32, i32* %9, i64 %139, !dbg !1138
  %140 = load i32, i32* %arrayidx199, align 4, !dbg !1138, !tbaa !628
  %call200 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %call180, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.14, i64 0, i64 0), i32 %140), !dbg !1139
  br label %if.end201, !dbg !1139

if.end201:                                        ; preds = %if.then195, %for.body190
  %cmp204 = icmp eq i32 %138, 0, !dbg !1140
  %141 = or i32 %i182.0.ph543, %138, !dbg !1143
  %142 = icmp eq i32 %141, 0, !dbg !1143
  br i1 %142, label %cleanup287.loopexit, label %if.end206, !dbg !1143

if.end206:                                        ; preds = %if.end201
  %cmp209 = icmp sgt i64 %indvars.iv, 0, !dbg !1144
  %or.cond293 = and i1 %cmp207, %cmp209, !dbg !1147
  br i1 %or.cond293, label %if.then210, label %if.else227, !dbg !1147

if.then210:                                       ; preds = %if.end206
  %143 = add nsw i64 %indvars.iv, %154, !dbg !1148
  %144 = add nsw i64 %143, -1, !dbg !1150
  %arrayidx216 = getelementptr inbounds i32, i32* %9, i64 %144, !dbg !1151
  %145 = load i32, i32* %arrayidx216, align 4, !dbg !1151, !tbaa !628
  call void @llvm.dbg.value(metadata i32 %145, i64 0, metadata !854, metadata !600), !dbg !1117
  %add218 = add i32 %j184.0538, -1, !dbg !1152
  %sub219 = add i32 %add218, %mul196, !dbg !1153
  %idxprom220 = sext i32 %sub219 to i64, !dbg !1154
  %arrayidx221 = getelementptr inbounds i32, i32* %9, i64 %idxprom220, !dbg !1154
  %146 = load i32, i32* %arrayidx221, align 4, !dbg !1154, !tbaa !628
  call void @llvm.dbg.value(metadata i32 %146, i64 0, metadata !858, metadata !600), !dbg !1115
  %arrayidx226 = getelementptr inbounds i32, i32* %9, i64 %143, !dbg !1155
  %147 = load i32, i32* %arrayidx226, align 4, !dbg !1155, !tbaa !628
  call void @llvm.dbg.value(metadata i32 %147, i64 0, metadata !857, metadata !600), !dbg !1116
  br label %if.end246, !dbg !1156

if.else227:                                       ; preds = %if.end206
  br i1 %cmp202, label %if.then229, label %if.else235, !dbg !1157

if.then229:                                       ; preds = %if.else227
  call void @llvm.dbg.value(metadata i32 -999, i64 0, metadata !857, metadata !600), !dbg !1116
  call void @llvm.dbg.value(metadata i32 -999, i64 0, metadata !854, metadata !600), !dbg !1117
  %add231 = add i32 %j184.0538, -1, !dbg !1158
  %sub232 = add i32 %add231, %mul196, !dbg !1161
  %idxprom233 = sext i32 %sub232 to i64, !dbg !1162
  %arrayidx234 = getelementptr inbounds i32, i32* %9, i64 %idxprom233, !dbg !1162
  %148 = load i32, i32* %arrayidx234, align 4, !dbg !1162, !tbaa !628
  call void @llvm.dbg.value(metadata i32 %148, i64 0, metadata !858, metadata !600), !dbg !1115
  br label %if.end246, !dbg !1163

if.else235:                                       ; preds = %if.else227
  br i1 %cmp204, label %if.then237, label %if.end246, !dbg !1164

if.then237:                                       ; preds = %if.else235
  call void @llvm.dbg.value(metadata i32 -999, i64 0, metadata !858, metadata !600), !dbg !1115
  call void @llvm.dbg.value(metadata i32 -999, i64 0, metadata !854, metadata !600), !dbg !1117
  %149 = add nsw i64 %indvars.iv, %154, !dbg !1165
  %arrayidx242 = getelementptr inbounds i32, i32* %9, i64 %149, !dbg !1168
  %150 = load i32, i32* %arrayidx242, align 4, !dbg !1168, !tbaa !628
  call void @llvm.dbg.value(metadata i32 %150, i64 0, metadata !857, metadata !600), !dbg !1116
  br label %if.end246, !dbg !1169

if.end246:                                        ; preds = %if.then229, %if.else235, %if.then237, %if.then210
  %nw.1 = phi i32 [ %145, %if.then210 ], [ -999, %if.then229 ], [ -999, %if.then237 ], [ %nw.0539, %if.else235 ]
  %n.1 = phi i32 [ %147, %if.then210 ], [ -999, %if.then229 ], [ %150, %if.then237 ], [ %n.0540, %if.else235 ]
  %w.1 = phi i32 [ %146, %if.then210 ], [ %148, %if.then229 ], [ -999, %if.then237 ], [ %w.0541, %if.else235 ]
  call void @llvm.dbg.value(metadata i32 %w.1, i64 0, metadata !858, metadata !600), !dbg !1115
  call void @llvm.dbg.value(metadata i32 %n.1, i64 0, metadata !857, metadata !600), !dbg !1116
  call void @llvm.dbg.value(metadata i32 %nw.1, i64 0, metadata !854, metadata !600), !dbg !1117
  %151 = add nsw i64 %indvars.iv, %155, !dbg !1170
  %arrayidx250 = getelementptr inbounds i32, i32* %7, i64 %151, !dbg !1171
  %152 = load i32, i32* %arrayidx250, align 4, !dbg !1171, !tbaa !628
  %add251 = add nsw i32 %152, %nw.1, !dbg !1172
  call void @llvm.dbg.value(metadata i32 %add251, i64 0, metadata !860, metadata !600), !dbg !1173
  %sub252 = sub nsw i32 %w.1, %conv.i480, !dbg !1174
  call void @llvm.dbg.value(metadata i32 %sub252, i64 0, metadata !861, metadata !600), !dbg !1175
  %sub253 = sub nsw i32 %n.1, %conv.i480, !dbg !1176
  call void @llvm.dbg.value(metadata i32 %sub253, i64 0, metadata !862, metadata !600), !dbg !1177
  tail call void @llvm.dbg.value(metadata i32 %add251, i64 0, metadata !596, metadata !600), !dbg !1178
  tail call void @llvm.dbg.value(metadata i32 %sub252, i64 0, metadata !597, metadata !600), !dbg !1180
  tail call void @llvm.dbg.value(metadata i32 %sub253, i64 0, metadata !598, metadata !600), !dbg !1181
  %cmp.i = icmp sgt i32 %add251, %sub252, !dbg !1182
  %a.b.i = select i1 %cmp.i, i32 %add251, i32 %sub252
  tail call void @llvm.dbg.value(metadata i32 %a.b.i, i64 0, metadata !599, metadata !600), !dbg !1183
  %cmp1.i = icmp sgt i32 %a.b.i, %sub253, !dbg !1184
  %retval.0.i = select i1 %cmp1.i, i32 %a.b.i, i32 %sub253, !dbg !1185
  call void @llvm.dbg.value(metadata i32 %retval.0.i, i64 0, metadata !859, metadata !600), !dbg !1186
  %cmp255 = icmp eq i32 %retval.0.i, %add251, !dbg !1187
  call void @llvm.dbg.value(metadata i32 %nw.1, i64 0, metadata !859, metadata !600), !dbg !1186
  %nw.1.call254 = select i1 %cmp255, i32 %nw.1, i32 %retval.0.i, !dbg !1189
  call void @llvm.dbg.value(metadata i32 %nw.1.call254, i64 0, metadata !859, metadata !600), !dbg !1186
  %cmp258 = icmp eq i32 %nw.1.call254, %sub252, !dbg !1190
  call void @llvm.dbg.value(metadata i32 %w.1, i64 0, metadata !859, metadata !600), !dbg !1186
  %traceback.1 = select i1 %cmp258, i32 %w.1, i32 %nw.1.call254, !dbg !1192
  call void @llvm.dbg.value(metadata i32 %traceback.1, i64 0, metadata !859, metadata !600), !dbg !1186
  %cmp261 = icmp eq i32 %traceback.1, %sub253, !dbg !1193
  call void @llvm.dbg.value(metadata i32 %n.1, i64 0, metadata !859, metadata !600), !dbg !1186
  %n.1.traceback.1 = select i1 %cmp261, i32 %n.1, i32 %traceback.1, !dbg !1195
  call void @llvm.dbg.value(metadata i32 %n.1.traceback.1, i64 0, metadata !859, metadata !600), !dbg !1186
  %call264 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %call180, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.14, i64 0, i64 0), i32 %n.1.traceback.1), !dbg !1196
  %cmp265 = icmp eq i32 %n.1.traceback.1, %nw.1, !dbg !1197
  br i1 %cmp265, label %if.then266, label %if.else269, !dbg !1199

if.then266:                                       ; preds = %if.end246
  call void @llvm.dbg.value(metadata i32 %sub211, i64 0, metadata !851, metadata !600), !dbg !1113
  %dec268 = add nsw i32 %138, -1, !dbg !1200
  call void @llvm.dbg.value(metadata i32 %dec268, i64 0, metadata !853, metadata !600), !dbg !1114
  br label %for.cond186.outer.backedge, !dbg !1202

for.body190.lr.ph:                                ; preds = %for.body190.lr.ph.preheader, %for.cond186.outer.backedge
  %w.0.ph547 = phi i32 [ %w.1, %for.cond186.outer.backedge ], [ undef, %for.body190.lr.ph.preheader ]
  %n.0.ph546 = phi i32 [ %n.1, %for.cond186.outer.backedge ], [ undef, %for.body190.lr.ph.preheader ]
  %nw.0.ph545 = phi i32 [ %nw.1, %for.cond186.outer.backedge ], [ undef, %for.body190.lr.ph.preheader ]
  %j184.0.ph544 = phi i32 [ %j184.0.ph.be, %for.cond186.outer.backedge ], [ %sub183, %for.body190.lr.ph.preheader ]
  %i182.0.ph543 = phi i32 [ %i182.0.ph.be, %for.cond186.outer.backedge ], [ %sub183, %for.body190.lr.ph.preheader ]
  %cmp192 = icmp eq i32 %i182.0.ph543, %sub183
  %mul196 = mul nsw i32 %i182.0.ph543, %add
  %cmp202 = icmp eq i32 %i182.0.ph543, 0
  %cmp207 = icmp sgt i32 %i182.0.ph543, 0
  %sub211 = add nsw i32 %i182.0.ph543, -1
  %mul212 = mul nsw i32 %sub211, %add
  %153 = sext i32 %j184.0.ph544 to i64, !dbg !1120
  %154 = sext i32 %mul212 to i64, !dbg !1120
  %155 = sext i32 %mul196 to i64, !dbg !1120
  br label %for.body190, !dbg !1120

if.else269:                                       ; preds = %if.end246
  %cmp270 = icmp eq i32 %n.1.traceback.1, %w.1, !dbg !1203
  br i1 %cmp270, label %if.then271, label %cleanup283, !dbg !1205

if.then271:                                       ; preds = %if.else269
  %indvars.iv.next = add nsw i64 %indvars.iv, -1, !dbg !1206
  %dec272 = add nsw i32 %j184.0538, -1, !dbg !1206
  call void @llvm.dbg.value(metadata i32 %dec272, i64 0, metadata !853, metadata !600), !dbg !1114
  call void @llvm.dbg.value(metadata i32 %w.1, i64 0, metadata !858, metadata !600), !dbg !1115
  call void @llvm.dbg.value(metadata i32 %n.1, i64 0, metadata !857, metadata !600), !dbg !1116
  call void @llvm.dbg.value(metadata i32 %nw.1, i64 0, metadata !854, metadata !600), !dbg !1117
  call void @llvm.dbg.value(metadata i32 %dec272, i64 0, metadata !853, metadata !600), !dbg !1114
  call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !851, metadata !600), !dbg !1113
  br i1 %cmp209, label %for.body190, label %cleanup287.loopexit, !dbg !1120, !llvm.loop !1208

cleanup283:                                       ; preds = %if.else269
  %cmp274 = icmp eq i32 %n.1.traceback.1, %n.1, !dbg !1211
  %dec276 = sext i1 %cmp274 to i32, !dbg !1213
  %dec276.i182.0 = add nsw i32 %i182.0.ph543, %dec276, !dbg !1213
  call void @llvm.dbg.value(metadata i32 %w.1, i64 0, metadata !858, metadata !600), !dbg !1115
  call void @llvm.dbg.value(metadata i32 %n.1, i64 0, metadata !857, metadata !600), !dbg !1116
  call void @llvm.dbg.value(metadata i32 %nw.1, i64 0, metadata !854, metadata !600), !dbg !1117
  call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !853, metadata !600), !dbg !1114
  call void @llvm.dbg.value(metadata i32 %dec276.i182.0, i64 0, metadata !851, metadata !600), !dbg !1113
  br label %for.cond186.outer.backedge

for.cond186.outer.backedge:                       ; preds = %cleanup283, %if.then266
  %i182.0.ph.be = phi i32 [ %sub211, %if.then266 ], [ %dec276.i182.0, %cleanup283 ]
  %j184.0.ph.be = phi i32 [ %dec268, %if.then266 ], [ %138, %cleanup283 ]
  call void @llvm.dbg.value(metadata i32 %w.1, i64 0, metadata !858, metadata !600), !dbg !1115
  call void @llvm.dbg.value(metadata i32 %n.1, i64 0, metadata !857, metadata !600), !dbg !1116
  call void @llvm.dbg.value(metadata i32 %nw.1, i64 0, metadata !854, metadata !600), !dbg !1117
  call void @llvm.dbg.value(metadata i32 %j184.0.ph.be, i64 0, metadata !853, metadata !600), !dbg !1114
  call void @llvm.dbg.value(metadata i32 %i182.0.ph.be, i64 0, metadata !851, metadata !600), !dbg !1113
  %cmp188537 = icmp sgt i32 %j184.0.ph.be, -1, !dbg !1118
  br i1 %cmp188537, label %for.body190.lr.ph, label %cleanup287.loopexit654, !dbg !1120, !llvm.loop !1208

cleanup287.loopexit:                              ; preds = %if.end201, %if.then271
  br label %cleanup287, !dbg !1214

cleanup287.loopexit654:                           ; preds = %for.cond186.outer.backedge
  br label %cleanup287, !dbg !1214

cleanup287:                                       ; preds = %cleanup287.loopexit654, %cleanup287.loopexit, %_Z8get_timev.exit
  %call290 = call i32 @fclose(%struct._IO_FILE* %call180), !dbg !1214
  %156 = load i8*, i8** %79, align 8, !dbg !1215, !tbaa !622
  %call291 = call i32 @cudaFree(i8* %156), !dbg !1216
  %157 = load i8*, i8** %80, align 8, !dbg !1217, !tbaa !622
  %call292 = call i32 @cudaFree(i8* %157), !dbg !1218
  call void @free(i8* %call14) #10, !dbg !1219
  call void @free(i8* %call18) #10, !dbg !1220
  call void @free(i8* %call22) #10, !dbg !1221
  call void @llvm.lifetime.end(i64 8, i8* nonnull %1) #10, !dbg !1222
  call void @llvm.lifetime.end(i64 8, i8* nonnull %0) #10, !dbg !1222
  ret void, !dbg !1222
}

; Function Attrs: noreturn nounwind uwtable
define void @_Z5usageiPPc(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #6 !dbg !1223 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !1225, metadata !600), !dbg !1227
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !1226, metadata !600), !dbg !1228
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1229, !tbaa !622
  %1 = load i8*, i8** %argv, align 8, !dbg !1230, !tbaa !622
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.1, i64 0, i64 0), i8* %1) #11, !dbg !1231
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1232, !tbaa !622
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0), i64 35, i64 1, %struct._IO_FILE* %2) #11, !dbg !1233
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1234, !tbaa !622
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.3, i64 0, i64 0), i64 39, i64 1, %struct._IO_FILE* %4) #11, !dbg !1235
  tail call void @exit(i32 1) #12, !dbg !1236
  unreachable, !dbg !1236
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #4

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #7

declare i32 @cudaDeviceSetLimit(i32, i64) local_unnamed_addr #8

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) local_unnamed_addr #4

; Function Attrs: nounwind
declare void @srand(i32) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @rand() local_unnamed_addr #4

declare i32 @cudaMalloc(i8**, i64) local_unnamed_addr #8

declare i32 @cudaMemcpy(i8*, i8*, i64, i32) local_unnamed_addr #8

declare i32 @cudaDeviceSynchronize() local_unnamed_addr #8

declare i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) local_unnamed_addr #8

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fclose(%struct._IO_FILE* nocapture) local_unnamed_addr #4

declare i32 @cudaFree(i8*) local_unnamed_addr #8

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) local_unnamed_addr #4

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #9

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #10

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #10

declare i32 @putchar(i32)

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #1

attributes #0 = { nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { nounwind readnone }
attributes #10 = { nounwind }
attributes #11 = { cold }
attributes #12 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!588, !589}
!llvm.ident = !{!590}

!0 = !DIGlobalVariableExpression(var: !1)
!1 = distinct !DIGlobalVariable(name: "blosum62", scope: !2, file: !3, line: 27, type: !585, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !3, producer: "clang version 5.0.0 (trunk 294196)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !20, globals: !29, imports: !30)
!3 = !DIFile(filename: "needle.cu", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/nwllvm")
!4 = !{!5, !13}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaLimit", file: !6, line: 1145, size: 32, elements: !7, identifier: "_ZTS9cudaLimit")
!6 = !DIFile(filename: "/usr/local/cuda/include/driver_types.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/nwllvm")
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
!20 = !{!21, !22, !24, !23, !26}
!21 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!28 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!29 = !{!0}
!30 = !{!31, !38, !43, !45, !47, !49, !51, !55, !57, !59, !61, !63, !65, !67, !69, !71, !73, !75, !77, !79, !81, !83, !87, !89, !91, !93, !97, !101, !103, !105, !110, !114, !116, !118, !120, !122, !124, !126, !128, !130, !135, !139, !141, !143, !147, !149, !151, !153, !155, !157, !161, !163, !165, !170, !176, !180, !182, !184, !188, !190, !192, !196, !198, !200, !204, !206, !208, !210, !212, !214, !216, !218, !220, !222, !227, !229, !231, !235, !237, !239, !241, !243, !245, !247, !249, !253, !257, !259, !261, !266, !268, !270, !272, !274, !276, !278, !282, !288, !292, !296, !301, !304, !310, !314, !328, !332, !336, !340, !344, !348, !350, !354, !358, !362, !370, !374, !378, !382, !386, !391, !396, !400, !404, !406, !414, !418, !426, !428, !430, !434, !438, !442, !447, !451, !456, !457, !458, !459, !462, !463, !464, !465, !466, !467, !468, !471, !473, !475, !477, !479, !481, !483, !485, !488, !490, !492, !494, !496, !498, !500, !502, !504, !506, !508, !510, !512, !514, !516, !518, !520, !522, !524, !526, !528, !530, !532, !534, !536, !538, !540, !542, !544, !546, !548, !550, !552, !556, !557, !559, !561, !563, !565, !567, !569, !571, !573, !575, !577, !579, !581, !583}
!31 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !34, line: 201)
!32 = !DINamespace(name: "std", scope: null, file: !33, line: 195)
!33 = !DIFile(filename: "/home/dshen/llvm/build/bin/../lib/clang/5.0.0/include/__clang_cuda_math_forward_declares.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/nwllvm")
!34 = !DISubprogram(name: "abs", linkageName: "_ZL3absx", scope: !33, file: !33, line: 44, type: !35, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!35 = !DISubroutineType(types: !36)
!36 = !{!37, !37}
!37 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!38 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !39, line: 202)
!39 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !33, file: !33, line: 46, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!40 = !DISubroutineType(types: !41)
!41 = !{!42, !42}
!42 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!43 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !44, line: 203)
!44 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !33, file: !33, line: 48, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!45 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !46, line: 204)
!46 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !33, file: !33, line: 50, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!47 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !48, line: 205)
!48 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !33, file: !33, line: 52, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!49 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !50, line: 206)
!50 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !33, file: !33, line: 56, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!51 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !52, line: 207)
!52 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !33, file: !33, line: 54, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!53 = !DISubroutineType(types: !54)
!54 = !{!42, !42, !42}
!55 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !56, line: 208)
!56 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !33, file: !33, line: 58, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!57 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !58, line: 209)
!58 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !33, file: !33, line: 60, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!59 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !60, line: 210)
!60 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !33, file: !33, line: 62, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!61 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !62, line: 211)
!62 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !33, file: !33, line: 64, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!63 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !64, line: 212)
!64 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !33, file: !33, line: 66, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!65 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !66, line: 213)
!66 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !33, file: !33, line: 68, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!67 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !68, line: 214)
!68 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !33, file: !33, line: 72, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!69 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !70, line: 215)
!70 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !33, file: !33, line: 70, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!71 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !72, line: 216)
!72 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !33, file: !33, line: 76, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!73 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !74, line: 217)
!74 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !33, file: !33, line: 74, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!75 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !76, line: 218)
!76 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !33, file: !33, line: 78, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!77 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !78, line: 219)
!78 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !33, file: !33, line: 80, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!79 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !80, line: 220)
!80 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !33, file: !33, line: 82, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!81 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !82, line: 221)
!82 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !33, file: !33, line: 84, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!83 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !84, line: 222)
!84 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !33, file: !33, line: 86, type: !85, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!85 = !DISubroutineType(types: !86)
!86 = !{!42, !42, !42, !42}
!87 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !88, line: 223)
!88 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !33, file: !33, line: 88, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!89 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !90, line: 224)
!90 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !33, file: !33, line: 90, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!91 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !92, line: 225)
!92 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !33, file: !33, line: 92, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!93 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !94, line: 226)
!94 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !33, file: !33, line: 94, type: !95, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!95 = !DISubroutineType(types: !96)
!96 = !{!23, !42}
!97 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !98, line: 227)
!98 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !33, file: !33, line: 96, type: !99, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!99 = !DISubroutineType(types: !100)
!100 = !{!42, !42, !22}
!101 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !102, line: 228)
!102 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !33, file: !33, line: 98, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!103 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !104, line: 229)
!104 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !33, file: !33, line: 100, type: !95, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!105 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !106, line: 230)
!106 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !33, file: !33, line: 102, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!107 = !DISubroutineType(types: !108)
!108 = !{!109, !42}
!109 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !111, line: 231)
!111 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !33, file: !33, line: 106, type: !112, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!112 = !DISubroutineType(types: !113)
!113 = !{!109, !42, !42}
!114 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !115, line: 232)
!115 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !33, file: !33, line: 105, type: !112, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!116 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !117, line: 233)
!117 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !33, file: !33, line: 108, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!118 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !119, line: 234)
!119 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !33, file: !33, line: 112, type: !112, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!120 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !121, line: 235)
!121 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !33, file: !33, line: 111, type: !112, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!122 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !123, line: 236)
!123 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !33, file: !33, line: 114, type: !112, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!124 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !125, line: 237)
!125 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !33, file: !33, line: 116, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!126 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !127, line: 238)
!127 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !33, file: !33, line: 118, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!128 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !129, line: 239)
!129 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !33, file: !33, line: 120, type: !112, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!130 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !131, line: 240)
!131 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !33, file: !33, line: 121, type: !132, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!132 = !DISubroutineType(types: !133)
!133 = !{!134, !134}
!134 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !136, line: 241)
!136 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !33, file: !33, line: 123, type: !137, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!137 = !DISubroutineType(types: !138)
!138 = !{!42, !42, !23}
!139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !140, line: 242)
!140 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !33, file: !33, line: 125, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !142, line: 243)
!142 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !33, file: !33, line: 126, type: !35, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !144, line: 244)
!144 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !33, file: !33, line: 128, type: !145, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!145 = !DISubroutineType(types: !146)
!146 = !{!37, !42}
!147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !148, line: 245)
!148 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !33, file: !33, line: 138, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !150, line: 246)
!150 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !33, file: !33, line: 130, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !152, line: 247)
!152 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !33, file: !33, line: 132, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!153 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !154, line: 248)
!154 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !33, file: !33, line: 134, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !156, line: 249)
!156 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !33, file: !33, line: 136, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!157 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !158, line: 250)
!158 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !33, file: !33, line: 140, type: !159, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!159 = !DISubroutineType(types: !160)
!160 = !{!134, !42}
!161 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !162, line: 251)
!162 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !33, file: !33, line: 142, type: !159, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!163 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !164, line: 252)
!164 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !33, file: !33, line: 143, type: !145, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!165 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !166, line: 253)
!166 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !33, file: !33, line: 145, type: !167, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!167 = !DISubroutineType(types: !168)
!168 = !{!42, !42, !169}
!169 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !42, size: 64)
!170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !171, line: 254)
!171 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !33, file: !33, line: 146, type: !172, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!172 = !DISubroutineType(types: !173)
!173 = !{!21, !174}
!174 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !175, size: 64)
!175 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !28)
!176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !177, line: 255)
!177 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !33, file: !33, line: 147, type: !178, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!178 = !DISubroutineType(types: !179)
!179 = !{!42, !174}
!180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !181, line: 256)
!181 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !33, file: !33, line: 149, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !183, line: 257)
!183 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !33, file: !33, line: 151, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !185, line: 258)
!185 = !DISubprogram(name: "nexttoward", linkageName: "_ZL10nexttowardfd", scope: !33, file: !33, line: 153, type: !186, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!186 = !DISubroutineType(types: !187)
!187 = !{!42, !42, !21}
!188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !189, line: 259)
!189 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !33, file: !33, line: 158, type: !137, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !191, line: 260)
!191 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !33, file: !33, line: 160, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !193, line: 261)
!193 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !33, file: !33, line: 162, type: !194, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!194 = !DISubroutineType(types: !195)
!195 = !{!42, !42, !42, !22}
!196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !197, line: 262)
!197 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !33, file: !33, line: 164, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !199, line: 263)
!199 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !33, file: !33, line: 166, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !201, line: 264)
!201 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !33, file: !33, line: 168, type: !202, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!202 = !DISubroutineType(types: !203)
!203 = !{!42, !42, !134}
!204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !205, line: 265)
!205 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !33, file: !33, line: 170, type: !137, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!206 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !207, line: 266)
!207 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !33, file: !33, line: 172, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !209, line: 267)
!209 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !33, file: !33, line: 174, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !211, line: 268)
!211 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !33, file: !33, line: 176, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !213, line: 269)
!213 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !33, file: !33, line: 178, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !215, line: 270)
!215 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !33, file: !33, line: 180, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !217, line: 271)
!217 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !33, file: !33, line: 182, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !219, line: 272)
!219 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !33, file: !33, line: 184, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !221, line: 273)
!221 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !33, file: !33, line: 186, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !223, line: 102)
!223 = !DISubprogram(name: "acos", scope: !224, file: !224, line: 54, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!224 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/nwllvm")
!225 = !DISubroutineType(types: !226)
!226 = !{!21, !21}
!227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !228, line: 121)
!228 = !DISubprogram(name: "asin", scope: !224, file: !224, line: 56, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!229 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !230, line: 140)
!230 = !DISubprogram(name: "atan", scope: !224, file: !224, line: 58, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!231 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !232, line: 159)
!232 = !DISubprogram(name: "atan2", scope: !224, file: !224, line: 60, type: !233, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!233 = !DISubroutineType(types: !234)
!234 = !{!21, !21, !21}
!235 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !236, line: 180)
!236 = !DISubprogram(name: "ceil", scope: !224, file: !224, line: 178, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!237 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !238, line: 199)
!238 = !DISubprogram(name: "cos", scope: !224, file: !224, line: 63, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!239 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !240, line: 218)
!240 = !DISubprogram(name: "cosh", scope: !224, file: !224, line: 72, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!241 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !242, line: 237)
!242 = !DISubprogram(name: "exp", scope: !224, file: !224, line: 100, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!243 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !244, line: 256)
!244 = !DISubprogram(name: "fabs", scope: !224, file: !224, line: 181, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!245 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !246, line: 275)
!246 = !DISubprogram(name: "floor", scope: !224, file: !224, line: 184, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !248, line: 294)
!248 = !DISubprogram(name: "fmod", scope: !224, file: !224, line: 187, type: !233, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!249 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !250, line: 315)
!250 = !DISubprogram(name: "frexp", scope: !224, file: !224, line: 103, type: !251, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!251 = !DISubroutineType(types: !252)
!252 = !{!21, !21, !22}
!253 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !254, line: 334)
!254 = !DISubprogram(name: "ldexp", scope: !224, file: !224, line: 106, type: !255, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!255 = !DISubroutineType(types: !256)
!256 = !{!21, !21, !23}
!257 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !258, line: 353)
!258 = !DISubprogram(name: "log", scope: !224, file: !224, line: 109, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!259 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !260, line: 372)
!260 = !DISubprogram(name: "log10", scope: !224, file: !224, line: 112, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !262, line: 391)
!262 = !DISubprogram(name: "modf", scope: !224, file: !224, line: 115, type: !263, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!263 = !DISubroutineType(types: !264)
!264 = !{!21, !21, !265}
!265 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !267, line: 403)
!267 = !DISubprogram(name: "pow", scope: !224, file: !224, line: 153, type: !233, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !269, line: 440)
!269 = !DISubprogram(name: "sin", scope: !224, file: !224, line: 65, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!270 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !271, line: 459)
!271 = !DISubprogram(name: "sinh", scope: !224, file: !224, line: 74, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!272 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !273, line: 478)
!273 = !DISubprogram(name: "sqrt", scope: !224, file: !224, line: 156, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!274 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !275, line: 497)
!275 = !DISubprogram(name: "tan", scope: !224, file: !224, line: 67, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!276 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !277, line: 516)
!277 = !DISubprogram(name: "tanh", scope: !224, file: !224, line: 76, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !279, line: 118)
!279 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !280, line: 101, baseType: !281)
!280 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/nwllvm")
!281 = !DICompositeType(tag: DW_TAG_structure_type, file: !280, line: 97, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !283, line: 119)
!283 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !280, line: 109, baseType: !284)
!284 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !280, line: 105, size: 128, elements: !285, identifier: "_ZTS6ldiv_t")
!285 = !{!286, !287}
!286 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !284, file: !280, line: 107, baseType: !134, size: 64)
!287 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !284, file: !280, line: 108, baseType: !134, size: 64, offset: 64)
!288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !289, line: 121)
!289 = !DISubprogram(name: "abort", scope: !280, file: !280, line: 515, type: !290, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: true)
!290 = !DISubroutineType(types: !291)
!291 = !{null}
!292 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !293, line: 122)
!293 = !DISubprogram(name: "abs", scope: !280, file: !280, line: 775, type: !294, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!294 = !DISubroutineType(types: !295)
!295 = !{!23, !23}
!296 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !297, line: 123)
!297 = !DISubprogram(name: "atexit", scope: !280, file: !280, line: 519, type: !298, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!298 = !DISubroutineType(types: !299)
!299 = !{!23, !300}
!300 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !290, size: 64)
!301 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !302, line: 129)
!302 = !DISubprogram(name: "atof", scope: !303, file: !303, line: 26, type: !172, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!303 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/nwllvm")
!304 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !305, line: 130)
!305 = distinct !DISubprogram(name: "atoi", scope: !280, file: !280, line: 278, type: !306, isLocal: false, isDefinition: true, scopeLine: 279, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !308)
!306 = !DISubroutineType(types: !307)
!307 = !{!23, !174}
!308 = !{!309}
!309 = !DILocalVariable(name: "__nptr", arg: 1, scope: !305, file: !280, line: 278, type: !174)
!310 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !311, line: 131)
!311 = !DISubprogram(name: "atol", scope: !280, file: !280, line: 283, type: !312, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!312 = !DISubroutineType(types: !313)
!313 = !{!134, !174}
!314 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !315, line: 132)
!315 = !DISubprogram(name: "bsearch", scope: !316, file: !316, line: 20, type: !317, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!316 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdlib-bsearch.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/nwllvm")
!317 = !DISubroutineType(types: !318)
!318 = !{!25, !319, !319, !321, !321, !324}
!319 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !320, size: 64)
!320 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!321 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !322, line: 62, baseType: !323)
!322 = !DIFile(filename: "/home/dshen/llvm/build/bin/../lib/clang/5.0.0/include/stddef.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/nwllvm")
!323 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!324 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !280, line: 742, baseType: !325)
!325 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !326, size: 64)
!326 = !DISubroutineType(types: !327)
!327 = !{!23, !319, !319}
!328 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !329, line: 133)
!329 = !DISubprogram(name: "calloc", scope: !280, file: !280, line: 468, type: !330, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!330 = !DISubroutineType(types: !331)
!331 = !{!25, !321, !321}
!332 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !333, line: 134)
!333 = !DISubprogram(name: "div", scope: !280, file: !280, line: 789, type: !334, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!334 = !DISubroutineType(types: !335)
!335 = !{!279, !23, !23}
!336 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !337, line: 135)
!337 = !DISubprogram(name: "exit", scope: !280, file: !280, line: 543, type: !338, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: true)
!338 = !DISubroutineType(types: !339)
!339 = !{null, !23}
!340 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !341, line: 136)
!341 = !DISubprogram(name: "free", scope: !280, file: !280, line: 483, type: !342, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!342 = !DISubroutineType(types: !343)
!343 = !{null, !25}
!344 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !345, line: 137)
!345 = !DISubprogram(name: "getenv", scope: !280, file: !280, line: 564, type: !346, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!346 = !DISubroutineType(types: !347)
!347 = !{!27, !174}
!348 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !349, line: 138)
!349 = !DISubprogram(name: "labs", scope: !280, file: !280, line: 776, type: !132, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!350 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !351, line: 139)
!351 = !DISubprogram(name: "ldiv", scope: !280, file: !280, line: 791, type: !352, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!352 = !DISubroutineType(types: !353)
!353 = !{!283, !134, !134}
!354 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !355, line: 140)
!355 = !DISubprogram(name: "malloc", scope: !280, file: !280, line: 466, type: !356, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!356 = !DISubroutineType(types: !357)
!357 = !{!25, !321}
!358 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !359, line: 142)
!359 = !DISubprogram(name: "mblen", scope: !280, file: !280, line: 863, type: !360, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!360 = !DISubroutineType(types: !361)
!361 = !{!23, !174, !321}
!362 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !363, line: 143)
!363 = !DISubprogram(name: "mbstowcs", scope: !280, file: !280, line: 874, type: !364, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!364 = !DISubroutineType(types: !365)
!365 = !{!321, !366, !369, !321}
!366 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !367)
!367 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !368, size: 64)
!368 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!369 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !174)
!370 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !371, line: 144)
!371 = !DISubprogram(name: "mbtowc", scope: !280, file: !280, line: 866, type: !372, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!372 = !DISubroutineType(types: !373)
!373 = !{!23, !366, !369, !321}
!374 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !375, line: 146)
!375 = !DISubprogram(name: "qsort", scope: !280, file: !280, line: 765, type: !376, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!376 = !DISubroutineType(types: !377)
!377 = !{null, !25, !321, !321, !324}
!378 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !379, line: 152)
!379 = !DISubprogram(name: "rand", scope: !280, file: !280, line: 374, type: !380, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!380 = !DISubroutineType(types: !381)
!381 = !{!23}
!382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !383, line: 153)
!383 = !DISubprogram(name: "realloc", scope: !280, file: !280, line: 480, type: !384, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!384 = !DISubroutineType(types: !385)
!385 = !{!25, !25, !321}
!386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !387, line: 154)
!387 = !DISubprogram(name: "srand", scope: !280, file: !280, line: 376, type: !388, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!388 = !DISubroutineType(types: !389)
!389 = !{null, !390}
!390 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!391 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !392, line: 155)
!392 = !DISubprogram(name: "strtod", scope: !280, file: !280, line: 164, type: !393, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!393 = !DISubroutineType(types: !394)
!394 = !{!21, !369, !395}
!395 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !26)
!396 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !397, line: 156)
!397 = !DISubprogram(name: "strtol", scope: !280, file: !280, line: 183, type: !398, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!398 = !DISubroutineType(types: !399)
!399 = !{!134, !369, !395, !23}
!400 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !401, line: 157)
!401 = !DISubprogram(name: "strtoul", scope: !280, file: !280, line: 187, type: !402, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!402 = !DISubroutineType(types: !403)
!403 = !{!323, !369, !395, !23}
!404 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !405, line: 158)
!405 = !DISubprogram(name: "system", scope: !280, file: !280, line: 717, type: !306, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!406 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !407, line: 160)
!407 = !DISubprogram(name: "wcstombs", scope: !280, file: !280, line: 877, type: !408, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!408 = !DISubroutineType(types: !409)
!409 = !{!321, !410, !411, !321}
!410 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !27)
!411 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !412)
!412 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !413, size: 64)
!413 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !368)
!414 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !415, line: 161)
!415 = !DISubprogram(name: "wctomb", scope: !280, file: !280, line: 870, type: !416, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!416 = !DISubroutineType(types: !417)
!417 = !{!23, !27, !368}
!418 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !419, entity: !421, line: 201)
!419 = !DINamespace(name: "__gnu_cxx", scope: null, file: !420, line: 68)
!420 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/bits/cpp_type_traits.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/nwllvm")
!421 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !280, line: 121, baseType: !422)
!422 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !280, line: 117, size: 128, elements: !423, identifier: "_ZTS7lldiv_t")
!423 = !{!424, !425}
!424 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !422, file: !280, line: 119, baseType: !37, size: 64)
!425 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !422, file: !280, line: 120, baseType: !37, size: 64, offset: 64)
!426 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !419, entity: !427, line: 207)
!427 = !DISubprogram(name: "_Exit", scope: !280, file: !280, line: 557, type: !338, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: true)
!428 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !419, entity: !429, line: 211)
!429 = !DISubprogram(name: "llabs", scope: !280, file: !280, line: 780, type: !35, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!430 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !419, entity: !431, line: 217)
!431 = !DISubprogram(name: "lldiv", scope: !280, file: !280, line: 797, type: !432, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!432 = !DISubroutineType(types: !433)
!433 = !{!421, !37, !37}
!434 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !419, entity: !435, line: 228)
!435 = !DISubprogram(name: "atoll", scope: !280, file: !280, line: 292, type: !436, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!436 = !DISubroutineType(types: !437)
!437 = !{!37, !174}
!438 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !419, entity: !439, line: 229)
!439 = !DISubprogram(name: "strtoll", scope: !280, file: !280, line: 209, type: !440, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!440 = !DISubroutineType(types: !441)
!441 = !{!37, !369, !395, !23}
!442 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !419, entity: !443, line: 230)
!443 = !DISubprogram(name: "strtoull", scope: !280, file: !280, line: 214, type: !444, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!444 = !DISubroutineType(types: !445)
!445 = !{!446, !369, !395, !23}
!446 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!447 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !419, entity: !448, line: 232)
!448 = !DISubprogram(name: "strtof", scope: !280, file: !280, line: 172, type: !449, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!449 = !DISubroutineType(types: !450)
!450 = !{!42, !369, !395}
!451 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !419, entity: !452, line: 233)
!452 = !DISubprogram(name: "strtold", scope: !280, file: !280, line: 175, type: !453, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!453 = !DISubroutineType(types: !454)
!454 = !{!455, !369, !395}
!455 = !DIBasicType(name: "long double", size: 128, encoding: DW_ATE_float)
!456 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !421, line: 241)
!457 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !427, line: 243)
!458 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !429, line: 245)
!459 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !460, line: 246)
!460 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !419, file: !461, line: 214, type: !432, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!461 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/cstdlib", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/nwllvm")
!462 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !431, line: 247)
!463 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !435, line: 249)
!464 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !448, line: 250)
!465 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !439, line: 251)
!466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !443, line: 252)
!467 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !452, line: 253)
!468 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !469, line: 418)
!469 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !470, file: !470, line: 1126, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!470 = !DIFile(filename: "/usr/local/cuda/include/math_functions.hpp", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/nwllvm")
!471 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !472, line: 419)
!472 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !470, file: !470, line: 1154, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!473 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !474, line: 420)
!474 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !470, file: !470, line: 1121, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!475 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !476, line: 421)
!476 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !470, file: !470, line: 1159, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!477 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !478, line: 422)
!478 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !470, file: !470, line: 1111, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!479 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !480, line: 423)
!480 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !470, file: !470, line: 1116, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!481 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !482, line: 424)
!482 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !470, file: !470, line: 1164, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!483 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !484, line: 425)
!484 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !470, file: !470, line: 1199, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!485 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !486, line: 426)
!486 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !487, file: !487, line: 647, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!487 = !DIFile(filename: "/usr/local/cuda/include/device_functions.hpp", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/nwllvm")
!488 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !489, line: 427)
!489 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !470, file: !470, line: 973, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!490 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !491, line: 428)
!491 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !470, file: !470, line: 1027, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!492 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !493, line: 429)
!493 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !470, file: !470, line: 1096, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !495, line: 430)
!495 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !470, file: !470, line: 1259, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !497, line: 431)
!497 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !470, file: !470, line: 1249, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !499, line: 432)
!499 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !487, file: !487, line: 637, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !501, line: 433)
!501 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !470, file: !470, line: 1078, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !503, line: 434)
!503 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !470, file: !470, line: 1169, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!504 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !505, line: 435)
!505 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !487, file: !487, line: 582, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !507, line: 436)
!507 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !470, file: !470, line: 1385, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!508 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !509, line: 437)
!509 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !487, file: !487, line: 572, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !511, line: 438)
!511 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !470, file: !470, line: 1337, type: !85, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!512 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !513, line: 439)
!513 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !487, file: !487, line: 602, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!514 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !515, line: 440)
!515 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !487, file: !487, line: 597, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!516 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !517, line: 441)
!517 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !470, file: !470, line: 1322, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!518 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !519, line: 442)
!519 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !470, file: !470, line: 1312, type: !99, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!520 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !521, line: 443)
!521 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !470, file: !470, line: 1174, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!522 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !523, line: 444)
!523 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !470, file: !470, line: 1390, type: !95, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !525, line: 445)
!525 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !470, file: !470, line: 1289, type: !137, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!526 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !527, line: 446)
!527 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !470, file: !470, line: 1284, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !529, line: 447)
!529 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !470, file: !470, line: 933, type: !145, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!530 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !531, line: 448)
!531 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !470, file: !470, line: 1371, type: !145, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!532 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !533, line: 449)
!533 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !470, file: !470, line: 1140, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!534 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !535, line: 450)
!535 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !470, file: !470, line: 1149, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !537, line: 451)
!537 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !470, file: !470, line: 1069, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!538 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !539, line: 452)
!539 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !470, file: !470, line: 1395, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !541, line: 453)
!541 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !470, file: !470, line: 1131, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !543, line: 454)
!543 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !470, file: !470, line: 924, type: !159, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!544 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !545, line: 455)
!545 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !470, file: !470, line: 1376, type: !159, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!546 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !547, line: 456)
!547 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !470, file: !470, line: 1317, type: !167, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!548 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !549, line: 457)
!549 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !470, file: !470, line: 938, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!550 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !551, line: 458)
!551 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !470, file: !470, line: 1002, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!552 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !553, line: 459)
!553 = !DISubprogram(name: "nexttowardf", scope: !224, file: !224, line: 284, type: !554, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!554 = !DISubroutineType(types: !555)
!555 = !{!42, !42, !455}
!556 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !553, line: 460)
!557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !558, line: 461)
!558 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !470, file: !470, line: 1352, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !560, line: 462)
!560 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !470, file: !470, line: 1327, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !562, line: 463)
!562 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !470, file: !470, line: 1332, type: !194, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !564, line: 464)
!564 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !470, file: !470, line: 919, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !566, line: 465)
!566 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !470, file: !470, line: 1366, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!567 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !568, line: 466)
!568 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !470, file: !470, line: 1299, type: !202, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !570, line: 467)
!570 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !470, file: !470, line: 1294, type: !137, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !572, line: 468)
!572 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !470, file: !470, line: 1018, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!573 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !574, line: 469)
!574 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !470, file: !470, line: 1101, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!575 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !576, line: 470)
!576 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !487, file: !487, line: 887, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!577 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !578, line: 471)
!578 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !470, file: !470, line: 1060, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!579 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !580, line: 472)
!580 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !470, file: !470, line: 1106, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!581 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !582, line: 473)
!582 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !470, file: !470, line: 1361, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!583 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !32, entity: !584, line: 474)
!584 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !487, file: !487, line: 642, type: !40, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!585 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 18432, elements: !586)
!586 = !{!587, !587}
!587 = !DISubrange(count: 24)
!588 = !{i32 2, !"Dwarf Version", i32 4}
!589 = !{i32 2, !"Debug Info Version", i32 3}
!590 = !{!"clang version 5.0.0 (trunk 294196)"}
!591 = distinct !DISubprogram(name: "maximum", linkageName: "_Z7maximumiii", scope: !592, file: !592, line: 9, type: !593, isLocal: false, isDefinition: true, scopeLine: 11, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !595)
!592 = !DIFile(filename: "./needle_kernel.cu", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/nwllvm")
!593 = !DISubroutineType(types: !594)
!594 = !{!23, !23, !23, !23}
!595 = !{!596, !597, !598, !599}
!596 = !DILocalVariable(name: "a", arg: 1, scope: !591, file: !592, line: 9, type: !23)
!597 = !DILocalVariable(name: "b", arg: 2, scope: !591, file: !592, line: 10, type: !23)
!598 = !DILocalVariable(name: "c", arg: 3, scope: !591, file: !592, line: 11, type: !23)
!599 = !DILocalVariable(name: "k", scope: !591, file: !592, line: 13, type: !23)
!600 = !DIExpression()
!601 = !DILocation(line: 9, column: 14, scope: !591)
!602 = !DILocation(line: 10, column: 8, scope: !591)
!603 = !DILocation(line: 11, column: 8, scope: !591)
!604 = !DILocation(line: 14, column: 7, scope: !605)
!605 = distinct !DILexicalBlock(scope: !591, file: !592, line: 14, column: 5)
!606 = !DILocation(line: 13, column: 5, scope: !591)
!607 = !DILocation(line: 19, column: 7, scope: !608)
!608 = distinct !DILexicalBlock(scope: !591, file: !592, line: 19, column: 5)
!609 = !DILocation(line: 19, column: 5, scope: !591)
!610 = !DILocation(line: 24, column: 1, scope: !591)
!611 = distinct !DISubprogram(name: "needle_cuda_shared_1", linkageName: "_Z20needle_cuda_shared_1PiS_iiii", scope: !592, file: !592, line: 27, type: !612, isLocal: false, isDefinition: true, scopeLine: 33, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !614)
!612 = !DISubroutineType(types: !613)
!613 = !{null, !22, !22, !23, !23, !23, !23}
!614 = !{!615, !616, !617, !618, !619, !620}
!615 = !DILocalVariable(name: "referrence", arg: 1, scope: !611, file: !592, line: 27, type: !22)
!616 = !DILocalVariable(name: "matrix_cuda", arg: 2, scope: !611, file: !592, line: 28, type: !22)
!617 = !DILocalVariable(name: "cols", arg: 3, scope: !611, file: !592, line: 29, type: !23)
!618 = !DILocalVariable(name: "penalty", arg: 4, scope: !611, file: !592, line: 30, type: !23)
!619 = !DILocalVariable(name: "i", arg: 5, scope: !611, file: !592, line: 31, type: !23)
!620 = !DILocalVariable(name: "block_width", arg: 6, scope: !611, file: !592, line: 32, type: !23)
!621 = !DILocation(line: 27, column: 29, scope: !611)
!622 = !{!623, !623, i64 0}
!623 = !{!"any pointer", !624, i64 0}
!624 = !{!"omnipotent char", !625, i64 0}
!625 = !{!"Simple C++ TBAA"}
!626 = !DILocation(line: 28, column: 11, scope: !611)
!627 = !DILocation(line: 29, column: 10, scope: !611)
!628 = !{!629, !629, i64 0}
!629 = !{!"int", !624, i64 0}
!630 = !DILocation(line: 30, column: 10, scope: !611)
!631 = !DILocation(line: 31, column: 10, scope: !611)
!632 = !DILocation(line: 32, column: 10, scope: !611)
!633 = !DILocation(line: 33, column: 1, scope: !611)
!634 = !DILocation(line: 33, column: 1, scope: !635)
!635 = !DILexicalBlockFile(scope: !611, file: !592, discriminator: 1)
!636 = !DILocation(line: 33, column: 1, scope: !637)
!637 = !DILexicalBlockFile(scope: !611, file: !592, discriminator: 2)
!638 = !DILocation(line: 33, column: 1, scope: !639)
!639 = !DILexicalBlockFile(scope: !611, file: !592, discriminator: 3)
!640 = !DILocation(line: 33, column: 1, scope: !641)
!641 = !DILexicalBlockFile(scope: !611, file: !592, discriminator: 4)
!642 = !DILocation(line: 33, column: 1, scope: !643)
!643 = !DILexicalBlockFile(scope: !611, file: !592, discriminator: 5)
!644 = !DILocation(line: 33, column: 1, scope: !645)
!645 = !DILexicalBlockFile(scope: !611, file: !592, discriminator: 6)
!646 = !DILocation(line: 104, column: 1, scope: !611)
!647 = distinct !DISubprogram(name: "needle_cuda_shared_2", linkageName: "_Z20needle_cuda_shared_2PiS_iiii", scope: !592, file: !592, line: 108, type: !612, isLocal: false, isDefinition: true, scopeLine: 115, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !648)
!648 = !{!649, !650, !651, !652, !653, !654}
!649 = !DILocalVariable(name: "referrence", arg: 1, scope: !647, file: !592, line: 108, type: !22)
!650 = !DILocalVariable(name: "matrix_cuda", arg: 2, scope: !647, file: !592, line: 109, type: !22)
!651 = !DILocalVariable(name: "cols", arg: 3, scope: !647, file: !592, line: 111, type: !23)
!652 = !DILocalVariable(name: "penalty", arg: 4, scope: !647, file: !592, line: 112, type: !23)
!653 = !DILocalVariable(name: "i", arg: 5, scope: !647, file: !592, line: 113, type: !23)
!654 = !DILocalVariable(name: "block_width", arg: 6, scope: !647, file: !592, line: 114, type: !23)
!655 = !DILocation(line: 108, column: 29, scope: !647)
!656 = !DILocation(line: 109, column: 11, scope: !647)
!657 = !DILocation(line: 111, column: 10, scope: !647)
!658 = !DILocation(line: 112, column: 10, scope: !647)
!659 = !DILocation(line: 113, column: 10, scope: !647)
!660 = !DILocation(line: 114, column: 10, scope: !647)
!661 = !DILocation(line: 115, column: 1, scope: !647)
!662 = !DILocation(line: 115, column: 1, scope: !663)
!663 = !DILexicalBlockFile(scope: !647, file: !592, discriminator: 1)
!664 = !DILocation(line: 115, column: 1, scope: !665)
!665 = !DILexicalBlockFile(scope: !647, file: !592, discriminator: 2)
!666 = !DILocation(line: 115, column: 1, scope: !667)
!667 = !DILexicalBlockFile(scope: !647, file: !592, discriminator: 3)
!668 = !DILocation(line: 115, column: 1, scope: !669)
!669 = !DILexicalBlockFile(scope: !647, file: !592, discriminator: 4)
!670 = !DILocation(line: 115, column: 1, scope: !671)
!671 = !DILexicalBlockFile(scope: !647, file: !592, discriminator: 5)
!672 = !DILocation(line: 115, column: 1, scope: !673)
!673 = !DILexicalBlockFile(scope: !647, file: !592, discriminator: 6)
!674 = !DILocation(line: 188, column: 1, scope: !647)
!675 = distinct !DISubprogram(name: "get_time", linkageName: "_Z8get_timev", scope: !3, file: !3, line: 17, type: !676, isLocal: false, isDefinition: true, scopeLine: 17, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !678)
!676 = !DISubroutineType(types: !677)
!677 = !{!21}
!678 = !{!679}
!679 = !DILocalVariable(name: "time", scope: !675, file: !3, line: 18, type: !680)
!680 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timeval", file: !681, line: 30, size: 128, elements: !682, identifier: "_ZTS7timeval")
!681 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/time.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/nwllvm")
!682 = !{!683, !686}
!683 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !680, file: !681, line: 32, baseType: !684, size: 64)
!684 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !685, line: 139, baseType: !134)
!685 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/nwllvm")
!686 = !DIDerivedType(tag: DW_TAG_member, name: "tv_usec", scope: !680, file: !681, line: 33, baseType: !687, size: 64, offset: 64)
!687 = !DIDerivedType(tag: DW_TAG_typedef, name: "__suseconds_t", file: !685, line: 141, baseType: !134)
!688 = !DILocation(line: 18, column: 5, scope: !675)
!689 = !DIExpression(DW_OP_deref)
!690 = !DILocation(line: 18, column: 20, scope: !675)
!691 = !DILocation(line: 19, column: 9, scope: !692)
!692 = distinct !DILexicalBlock(scope: !675, file: !3, line: 19, column: 9)
!693 = !DILocation(line: 19, column: 9, scope: !675)
!694 = !DILocation(line: 23, column: 25, scope: !675)
!695 = !{!696, !697, i64 0}
!696 = !{!"_ZTS7timeval", !697, i64 0, !697, i64 8}
!697 = !{!"long", !624, i64 0}
!698 = !DILocation(line: 23, column: 20, scope: !675)
!699 = !DILocation(line: 23, column: 47, scope: !675)
!700 = !{!696, !697, i64 8}
!701 = !DILocation(line: 23, column: 42, scope: !675)
!702 = !DILocation(line: 23, column: 55, scope: !675)
!703 = !DILocation(line: 23, column: 32, scope: !675)
!704 = !DILocation(line: 23, column: 5, scope: !675)
!705 = !DILocation(line: 24, column: 1, scope: !675)
!706 = distinct !DISubprogram(name: "gettime", linkageName: "_Z7gettimev", scope: !3, file: !3, line: 54, type: !676, isLocal: false, isDefinition: true, scopeLine: 54, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !707)
!707 = !{!708}
!708 = !DILocalVariable(name: "t", scope: !706, file: !3, line: 55, type: !680)
!709 = !DILocation(line: 55, column: 3, scope: !706)
!710 = !DILocation(line: 55, column: 18, scope: !706)
!711 = !DILocation(line: 56, column: 3, scope: !706)
!712 = !DILocation(line: 57, column: 12, scope: !706)
!713 = !DILocation(line: 57, column: 10, scope: !706)
!714 = !DILocation(line: 57, column: 21, scope: !706)
!715 = !DILocation(line: 57, column: 19, scope: !706)
!716 = !DILocation(line: 57, column: 28, scope: !706)
!717 = !DILocation(line: 57, column: 18, scope: !706)
!718 = !DILocation(line: 58, column: 1, scope: !706)
!719 = !DILocation(line: 57, column: 3, scope: !706)
!720 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 64, type: !721, isLocal: false, isDefinition: true, scopeLine: 65, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !723)
!721 = !DISubroutineType(types: !722)
!722 = !{!23, !23, !26}
!723 = !{!724, !725}
!724 = !DILocalVariable(name: "argc", arg: 1, scope: !720, file: !3, line: 64, type: !23)
!725 = !DILocalVariable(name: "argv", arg: 2, scope: !720, file: !3, line: 64, type: !26)
!726 = !DILocation(line: 64, column: 11, scope: !720)
!727 = !DILocation(line: 64, column: 24, scope: !720)
!728 = !DILocation(line: 67, column: 3, scope: !720)
!729 = !DILocation(line: 69, column: 5, scope: !720)
!730 = !DILocation(line: 71, column: 5, scope: !720)
!731 = distinct !DISubprogram(name: "runTest", linkageName: "_Z7runTestiPPc", scope: !3, file: !3, line: 82, type: !732, isLocal: false, isDefinition: true, scopeLine: 83, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !734)
!732 = !DISubroutineType(types: !733)
!733 = !{null, !23, !26}
!734 = !{!735, !736, !737, !738, !739, !740, !741, !742, !743, !744, !745, !746, !748, !752, !754, !756, !758, !762, !764, !766, !790, !791, !792, !793, !795, !797, !798, !800, !851, !853, !854, !857, !858, !859, !860, !861, !862}
!735 = !DILocalVariable(name: "argc", arg: 1, scope: !731, file: !3, line: 82, type: !23)
!736 = !DILocalVariable(name: "argv", arg: 2, scope: !731, file: !3, line: 82, type: !26)
!737 = !DILocalVariable(name: "max_rows", scope: !731, file: !3, line: 84, type: !23)
!738 = !DILocalVariable(name: "max_cols", scope: !731, file: !3, line: 84, type: !23)
!739 = !DILocalVariable(name: "penalty", scope: !731, file: !3, line: 84, type: !23)
!740 = !DILocalVariable(name: "input_itemsets", scope: !731, file: !3, line: 85, type: !22)
!741 = !DILocalVariable(name: "output_itemsets", scope: !731, file: !3, line: 85, type: !22)
!742 = !DILocalVariable(name: "referrence", scope: !731, file: !3, line: 85, type: !22)
!743 = !DILocalVariable(name: "matrix_cuda", scope: !731, file: !3, line: 86, type: !22)
!744 = !DILocalVariable(name: "referrence_cuda", scope: !731, file: !3, line: 86, type: !22)
!745 = !DILocalVariable(name: "size", scope: !731, file: !3, line: 87, type: !23)
!746 = !DILocalVariable(name: "i", scope: !747, file: !3, line: 122, type: !23)
!747 = distinct !DILexicalBlock(scope: !731, file: !3, line: 122, column: 5)
!748 = !DILocalVariable(name: "j", scope: !749, file: !3, line: 123, type: !23)
!749 = distinct !DILexicalBlock(scope: !750, file: !3, line: 123, column: 3)
!750 = distinct !DILexicalBlock(scope: !751, file: !3, line: 122, column: 40)
!751 = distinct !DILexicalBlock(scope: !747, file: !3, line: 122, column: 5)
!752 = !DILocalVariable(name: "i", scope: !753, file: !3, line: 130, type: !23)
!753 = distinct !DILexicalBlock(scope: !731, file: !3, line: 130, column: 2)
!754 = !DILocalVariable(name: "j", scope: !755, file: !3, line: 133, type: !23)
!755 = distinct !DILexicalBlock(scope: !731, file: !3, line: 133, column: 5)
!756 = !DILocalVariable(name: "i", scope: !757, file: !3, line: 138, type: !23)
!757 = distinct !DILexicalBlock(scope: !731, file: !3, line: 138, column: 2)
!758 = !DILocalVariable(name: "j", scope: !759, file: !3, line: 139, type: !23)
!759 = distinct !DILexicalBlock(scope: !760, file: !3, line: 139, column: 3)
!760 = distinct !DILexicalBlock(scope: !761, file: !3, line: 138, column: 37)
!761 = distinct !DILexicalBlock(scope: !757, file: !3, line: 138, column: 2)
!762 = !DILocalVariable(name: "i", scope: !763, file: !3, line: 144, type: !23)
!763 = distinct !DILexicalBlock(scope: !731, file: !3, line: 144, column: 5)
!764 = !DILocalVariable(name: "j", scope: !765, file: !3, line: 146, type: !23)
!765 = distinct !DILexicalBlock(scope: !731, file: !3, line: 146, column: 2)
!766 = !DILocalVariable(name: "dimGrid", scope: !731, file: !3, line: 157, type: !767)
!767 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !768, line: 427, baseType: !769)
!768 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/nwllvm")
!769 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !768, line: 417, size: 96, elements: !770, identifier: "_ZTS4dim3")
!770 = !{!771, !772, !773, !774, !778, !787}
!771 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !769, file: !768, line: 419, baseType: !390, size: 32)
!772 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !769, file: !768, line: 419, baseType: !390, size: 32, offset: 32)
!773 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !769, file: !768, line: 419, baseType: !390, size: 32, offset: 64)
!774 = !DISubprogram(name: "dim3", scope: !769, file: !768, line: 421, type: !775, isLocal: false, isDefinition: false, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: true)
!775 = !DISubroutineType(types: !776)
!776 = !{null, !777, !390, !390, !390}
!777 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !769, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!778 = !DISubprogram(name: "dim3", scope: !769, file: !768, line: 422, type: !779, isLocal: false, isDefinition: false, scopeLine: 422, flags: DIFlagPrototyped, isOptimized: true)
!779 = !DISubroutineType(types: !780)
!780 = !{null, !777, !781}
!781 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !768, line: 383, baseType: !782)
!782 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !768, line: 190, size: 96, elements: !783, identifier: "_ZTS5uint3")
!783 = !{!784, !785, !786}
!784 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !782, file: !768, line: 192, baseType: !390, size: 32)
!785 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !782, file: !768, line: 192, baseType: !390, size: 32, offset: 32)
!786 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !782, file: !768, line: 192, baseType: !390, size: 32, offset: 64)
!787 = !DISubprogram(name: "operator uint3", linkageName: "_ZN4dim3cv5uint3Ev", scope: !769, file: !768, line: 423, type: !788, isLocal: false, isDefinition: false, scopeLine: 423, flags: DIFlagPrototyped, isOptimized: true)
!788 = !DISubroutineType(types: !789)
!789 = !{!781, !777}
!790 = !DILocalVariable(name: "dimBlock", scope: !731, file: !3, line: 158, type: !767)
!791 = !DILocalVariable(name: "block_width", scope: !731, file: !3, line: 159, type: !23)
!792 = !DILocalVariable(name: "t0", scope: !731, file: !3, line: 166, type: !21)
!793 = !DILocalVariable(name: "i", scope: !794, file: !3, line: 167, type: !23)
!794 = distinct !DILexicalBlock(scope: !731, file: !3, line: 167, column: 2)
!795 = !DILocalVariable(name: "i", scope: !796, file: !3, line: 175, type: !23)
!796 = distinct !DILexicalBlock(scope: !731, file: !3, line: 175, column: 2)
!797 = !DILocalVariable(name: "t1", scope: !731, file: !3, line: 182, type: !21)
!798 = !DILocalVariable(name: "ii", scope: !799, file: !3, line: 188, type: !23)
!799 = distinct !DILexicalBlock(scope: !731, file: !3, line: 188, column: 2)
!800 = !DILocalVariable(name: "fpo", scope: !731, file: !3, line: 195, type: !801)
!801 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !802, size: 64)
!802 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !803, line: 48, baseType: !804)
!803 = !DIFile(filename: "/usr/include/stdio.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/nwllvm")
!804 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !805, line: 245, size: 1728, elements: !806, identifier: "_ZTS8_IO_FILE")
!805 = !DIFile(filename: "/usr/include/libio.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/nwllvm")
!806 = !{!807, !808, !809, !810, !811, !812, !813, !814, !815, !816, !817, !818, !819, !822, !824, !825, !826, !828, !830, !832, !836, !839, !841, !842, !843, !844, !845, !846, !847}
!807 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !804, file: !805, line: 246, baseType: !23, size: 32)
!808 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !804, file: !805, line: 251, baseType: !27, size: 64, offset: 64)
!809 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !804, file: !805, line: 252, baseType: !27, size: 64, offset: 128)
!810 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !804, file: !805, line: 253, baseType: !27, size: 64, offset: 192)
!811 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !804, file: !805, line: 254, baseType: !27, size: 64, offset: 256)
!812 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !804, file: !805, line: 255, baseType: !27, size: 64, offset: 320)
!813 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !804, file: !805, line: 256, baseType: !27, size: 64, offset: 384)
!814 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !804, file: !805, line: 257, baseType: !27, size: 64, offset: 448)
!815 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !804, file: !805, line: 258, baseType: !27, size: 64, offset: 512)
!816 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !804, file: !805, line: 260, baseType: !27, size: 64, offset: 576)
!817 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !804, file: !805, line: 261, baseType: !27, size: 64, offset: 640)
!818 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !804, file: !805, line: 262, baseType: !27, size: 64, offset: 704)
!819 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !804, file: !805, line: 264, baseType: !820, size: 64, offset: 768)
!820 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !821, size: 64)
!821 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !805, line: 160, flags: DIFlagFwdDecl, identifier: "_ZTS10_IO_marker")
!822 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !804, file: !805, line: 266, baseType: !823, size: 64, offset: 832)
!823 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !804, size: 64)
!824 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !804, file: !805, line: 268, baseType: !23, size: 32, offset: 896)
!825 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !804, file: !805, line: 272, baseType: !23, size: 32, offset: 928)
!826 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !804, file: !805, line: 274, baseType: !827, size: 64, offset: 960)
!827 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !685, line: 131, baseType: !134)
!828 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !804, file: !805, line: 278, baseType: !829, size: 16, offset: 1024)
!829 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!830 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !804, file: !805, line: 279, baseType: !831, size: 8, offset: 1040)
!831 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!832 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !804, file: !805, line: 280, baseType: !833, size: 8, offset: 1048)
!833 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 8, elements: !834)
!834 = !{!835}
!835 = !DISubrange(count: 1)
!836 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !804, file: !805, line: 284, baseType: !837, size: 64, offset: 1088)
!837 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !838, size: 64)
!838 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !805, line: 154, baseType: null)
!839 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !804, file: !805, line: 293, baseType: !840, size: 64, offset: 1152)
!840 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !685, line: 132, baseType: !134)
!841 = !DIDerivedType(tag: DW_TAG_member, name: "__pad1", scope: !804, file: !805, line: 302, baseType: !25, size: 64, offset: 1216)
!842 = !DIDerivedType(tag: DW_TAG_member, name: "__pad2", scope: !804, file: !805, line: 303, baseType: !25, size: 64, offset: 1280)
!843 = !DIDerivedType(tag: DW_TAG_member, name: "__pad3", scope: !804, file: !805, line: 304, baseType: !25, size: 64, offset: 1344)
!844 = !DIDerivedType(tag: DW_TAG_member, name: "__pad4", scope: !804, file: !805, line: 305, baseType: !25, size: 64, offset: 1408)
!845 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !804, file: !805, line: 306, baseType: !321, size: 64, offset: 1472)
!846 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !804, file: !805, line: 308, baseType: !23, size: 32, offset: 1536)
!847 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !804, file: !805, line: 310, baseType: !848, size: 160, offset: 1568)
!848 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 160, elements: !849)
!849 = !{!850}
!850 = !DISubrange(count: 20)
!851 = !DILocalVariable(name: "i", scope: !852, file: !3, line: 198, type: !23)
!852 = distinct !DILexicalBlock(scope: !731, file: !3, line: 198, column: 2)
!853 = !DILocalVariable(name: "j", scope: !852, file: !3, line: 198, type: !23)
!854 = !DILocalVariable(name: "nw", scope: !855, file: !3, line: 199, type: !23)
!855 = distinct !DILexicalBlock(scope: !856, file: !3, line: 198, column: 60)
!856 = distinct !DILexicalBlock(scope: !852, file: !3, line: 198, column: 2)
!857 = !DILocalVariable(name: "n", scope: !855, file: !3, line: 199, type: !23)
!858 = !DILocalVariable(name: "w", scope: !855, file: !3, line: 199, type: !23)
!859 = !DILocalVariable(name: "traceback", scope: !855, file: !3, line: 199, type: !23)
!860 = !DILocalVariable(name: "new_nw", scope: !855, file: !3, line: 221, type: !23)
!861 = !DILocalVariable(name: "new_w", scope: !855, file: !3, line: 221, type: !23)
!862 = !DILocalVariable(name: "new_n", scope: !855, file: !3, line: 221, type: !23)
!863 = !DILocation(line: 82, column: 19, scope: !731)
!864 = !DILocation(line: 82, column: 32, scope: !731)
!865 = !DILocation(line: 86, column: 2, scope: !731)
!866 = !DILocation(line: 89, column: 9, scope: !731)
!867 = !DILocation(line: 93, column: 11, scope: !868)
!868 = distinct !DILexicalBlock(scope: !731, file: !3, line: 93, column: 6)
!869 = !DILocation(line: 93, column: 6, scope: !731)
!870 = !DILocation(line: 100, column: 2, scope: !871)
!871 = distinct !DILexicalBlock(scope: !868, file: !3, line: 99, column: 9)
!872 = !DILocation(line: 95, column: 19, scope: !873)
!873 = distinct !DILexicalBlock(scope: !868, file: !3, line: 94, column: 2)
!874 = !DILocation(line: 278, column: 1, scope: !305, inlinedAt: !875)
!875 = distinct !DILocation(line: 95, column: 14, scope: !873)
!876 = !DILocation(line: 280, column: 16, scope: !305, inlinedAt: !875)
!877 = !DILocation(line: 84, column: 9, scope: !731)
!878 = !DILocation(line: 84, column: 19, scope: !731)
!879 = !DILocation(line: 97, column: 18, scope: !873)
!880 = !DILocation(line: 278, column: 1, scope: !305, inlinedAt: !881)
!881 = distinct !DILocation(line: 97, column: 13, scope: !873)
!882 = !DILocation(line: 280, column: 16, scope: !305, inlinedAt: !881)
!883 = !DILocation(line: 84, column: 29, scope: !731)
!884 = !DILocation(line: 103, column: 10, scope: !885)
!885 = distinct !DILexicalBlock(scope: !731, file: !3, line: 103, column: 5)
!886 = !DILocation(line: 278, column: 1, scope: !305, inlinedAt: !887)
!887 = distinct !DILocation(line: 103, column: 5, scope: !885)
!888 = !DILocation(line: 280, column: 16, scope: !305, inlinedAt: !887)
!889 = !DILocation(line: 103, column: 21, scope: !885)
!890 = !DILocation(line: 103, column: 5, scope: !731)
!891 = !DILocation(line: 104, column: 10, scope: !892)
!892 = distinct !DILexicalBlock(scope: !885, file: !3, line: 103, column: 25)
!893 = !DILocation(line: 104, column: 2, scope: !892)
!894 = !DILocation(line: 105, column: 2, scope: !892)
!895 = !DILocation(line: 109, column: 22, scope: !731)
!896 = !DILocation(line: 111, column: 39, scope: !731)
!897 = !DILocation(line: 111, column: 30, scope: !731)
!898 = !DILocation(line: 111, column: 50, scope: !731)
!899 = !DILocation(line: 111, column: 22, scope: !731)
!900 = !DILocation(line: 111, column: 15, scope: !731)
!901 = !DILocation(line: 85, column: 45, scope: !731)
!902 = !DILocation(line: 112, column: 29, scope: !731)
!903 = !DILocation(line: 112, column: 22, scope: !731)
!904 = !DILocation(line: 85, column: 10, scope: !731)
!905 = !DILocation(line: 113, column: 27, scope: !731)
!906 = !DILocation(line: 113, column: 20, scope: !731)
!907 = !DILocation(line: 85, column: 27, scope: !731)
!908 = !DILocation(line: 116, column: 7, scope: !909)
!909 = distinct !DILexicalBlock(scope: !731, file: !3, line: 116, column: 6)
!910 = !DILocation(line: 116, column: 6, scope: !731)
!911 = !DILocation(line: 117, column: 11, scope: !909)
!912 = !DILocation(line: 117, column: 3, scope: !909)
!913 = !DILocation(line: 119, column: 5, scope: !731)
!914 = !DILocation(line: 122, column: 14, scope: !747)
!915 = !DILocation(line: 122, column: 24, scope: !916)
!916 = !DILexicalBlockFile(scope: !751, file: !3, discriminator: 1)
!917 = !DILocation(line: 122, column: 5, scope: !918)
!918 = !DILexicalBlockFile(scope: !747, file: !3, discriminator: 1)
!919 = !DILocation(line: 128, column: 2, scope: !731)
!920 = !DILocation(line: 130, column: 11, scope: !753)
!921 = !DILocation(line: 133, column: 14, scope: !755)
!922 = !DILocation(line: 123, column: 12, scope: !749)
!923 = !DILocation(line: 123, column: 3, scope: !924)
!924 = !DILexicalBlockFile(scope: !749, file: !3, discriminator: 1)
!925 = !DILocation(line: 124, column: 33, scope: !926)
!926 = distinct !DILexicalBlock(scope: !927, file: !3, line: 123, column: 38)
!927 = distinct !DILexicalBlock(scope: !749, file: !3, line: 123, column: 3)
!928 = !DILocation(line: 122, column: 37, scope: !929)
!929 = !DILexicalBlockFile(scope: !751, file: !3, discriminator: 3)
!930 = distinct !{!930, !931}
!931 = !{!"llvm.loop.unroll.disable"}
!932 = !DILocation(line: 130, column: 17, scope: !933)
!933 = !DILexicalBlockFile(scope: !934, file: !3, discriminator: 1)
!934 = distinct !DILexicalBlock(scope: !753, file: !3, line: 130, column: 2)
!935 = !DILocation(line: 130, column: 2, scope: !936)
!936 = !DILexicalBlockFile(scope: !753, file: !3, discriminator: 1)
!937 = !DILocation(line: 131, column: 37, scope: !938)
!938 = distinct !DILexicalBlock(scope: !934, file: !3, line: 130, column: 34)
!939 = distinct !{!939, !940, !941}
!940 = !DILocation(line: 122, column: 5, scope: !747)
!941 = !DILocation(line: 126, column: 2, scope: !747)
!942 = !DILocation(line: 133, column: 5, scope: !943)
!943 = !DILexicalBlockFile(scope: !755, file: !3, discriminator: 1)
!944 = !DILocation(line: 134, column: 28, scope: !945)
!945 = distinct !DILexicalBlock(scope: !946, file: !3, line: 133, column: 37)
!946 = distinct !DILexicalBlock(scope: !755, file: !3, line: 133, column: 5)
!947 = !DILocation(line: 131, column: 44, scope: !938)
!948 = !DILocation(line: 131, column: 49, scope: !938)
!949 = !DILocation(line: 131, column: 24, scope: !938)
!950 = !DILocation(line: 131, column: 8, scope: !938)
!951 = !DILocation(line: 131, column: 35, scope: !938)
!952 = !DILocation(line: 130, column: 31, scope: !953)
!953 = !DILexicalBlockFile(scope: !934, file: !3, discriminator: 3)
!954 = distinct !{!954, !955, !956}
!955 = !DILocation(line: 130, column: 2, scope: !753)
!956 = !DILocation(line: 132, column: 2, scope: !753)
!957 = !DILocation(line: 138, column: 11, scope: !757)
!958 = !DILocation(line: 138, column: 2, scope: !959)
!959 = !DILexicalBlockFile(scope: !757, file: !3, discriminator: 1)
!960 = !DILocation(line: 134, column: 35, scope: !945)
!961 = !DILocation(line: 134, column: 40, scope: !945)
!962 = !DILocation(line: 134, column: 8, scope: !945)
!963 = !DILocation(line: 134, column: 26, scope: !945)
!964 = !DILocation(line: 133, column: 34, scope: !965)
!965 = !DILexicalBlockFile(scope: !946, file: !3, discriminator: 3)
!966 = !DILocation(line: 133, column: 20, scope: !967)
!967 = !DILexicalBlockFile(scope: !946, file: !3, discriminator: 1)
!968 = distinct !{!968, !969, !970}
!969 = !DILocation(line: 133, column: 5, scope: !755)
!970 = !DILocation(line: 135, column: 2, scope: !755)
!971 = !DILocation(line: 139, column: 12, scope: !759)
!972 = !DILocation(line: 139, column: 3, scope: !973)
!973 = !DILexicalBlockFile(scope: !759, file: !3, discriminator: 1)
!974 = !DILocation(line: 140, column: 67, scope: !975)
!975 = distinct !DILexicalBlock(scope: !976, file: !3, line: 139, column: 38)
!976 = distinct !DILexicalBlock(scope: !759, file: !3, line: 139, column: 3)
!977 = !DILocation(line: 140, column: 30, scope: !975)
!978 = !DILocation(line: 140, column: 24, scope: !975)
!979 = !DILocation(line: 140, column: 3, scope: !975)
!980 = !DILocation(line: 140, column: 28, scope: !975)
!981 = !DILocation(line: 144, column: 14, scope: !763)
!982 = !DILocation(line: 144, column: 5, scope: !983)
!983 = !DILexicalBlockFile(scope: !763, file: !3, discriminator: 1)
!984 = !DILocation(line: 145, column: 40, scope: !985)
!985 = distinct !DILexicalBlock(scope: !763, file: !3, line: 144, column: 5)
!986 = !DILocation(line: 145, column: 24, scope: !985)
!987 = !DILocation(line: 145, column: 8, scope: !985)
!988 = !DILocation(line: 145, column: 35, scope: !985)
!989 = !DILocation(line: 144, column: 36, scope: !990)
!990 = !DILexicalBlockFile(scope: !985, file: !3, discriminator: 3)
!991 = distinct !{!991, !931}
!992 = !DILocation(line: 138, column: 34, scope: !993)
!993 = !DILexicalBlockFile(scope: !761, file: !3, discriminator: 3)
!994 = !DILocation(line: 138, column: 21, scope: !995)
!995 = !DILexicalBlockFile(scope: !761, file: !3, discriminator: 1)
!996 = distinct !{!996, !997, !998}
!997 = !DILocation(line: 138, column: 2, scope: !757)
!998 = !DILocation(line: 142, column: 2, scope: !757)
!999 = !DILocation(line: 139, column: 35, scope: !1000)
!1000 = !DILexicalBlockFile(scope: !976, file: !3, discriminator: 3)
!1001 = !DILocation(line: 139, column: 22, scope: !1002)
!1002 = !DILexicalBlockFile(scope: !976, file: !3, discriminator: 1)
!1003 = distinct !{!1003, !1004, !1005}
!1004 = !DILocation(line: 139, column: 3, scope: !759)
!1005 = !DILocation(line: 141, column: 3, scope: !759)
!1006 = !DILocation(line: 146, column: 11, scope: !765)
!1007 = !DILocation(line: 146, column: 2, scope: !1008)
!1008 = !DILexicalBlockFile(scope: !765, file: !3, discriminator: 1)
!1009 = !DILocation(line: 147, column: 31, scope: !1010)
!1010 = distinct !DILexicalBlock(scope: !765, file: !3, line: 146, column: 2)
!1011 = !DILocation(line: 147, column: 8, scope: !1010)
!1012 = !DILocation(line: 147, column: 26, scope: !1010)
!1013 = distinct !{!1013, !1014, !1015, !1016, !1017}
!1014 = !DILocation(line: 146, column: 2, scope: !765)
!1015 = !DILocation(line: 147, column: 33, scope: !765)
!1016 = !{!"llvm.loop.vectorize.width", i32 1}
!1017 = !{!"llvm.loop.interleave.count", i32 1}
!1018 = !DILocation(line: 144, column: 22, scope: !1019)
!1019 = !DILexicalBlockFile(scope: !985, file: !3, discriminator: 1)
!1020 = distinct !{!1020, !1021, !1022}
!1021 = !DILocation(line: 144, column: 5, scope: !763)
!1022 = !DILocation(line: 145, column: 42, scope: !763)
!1023 = !DILocation(line: 87, column: 6, scope: !731)
!1024 = !DILocation(line: 151, column: 13, scope: !731)
!1025 = !DILocation(line: 151, column: 2, scope: !731)
!1026 = !DILocation(line: 152, column: 13, scope: !731)
!1027 = !DILocation(line: 152, column: 2, scope: !731)
!1028 = !DILocation(line: 154, column: 13, scope: !731)
!1029 = !DILocation(line: 154, column: 2, scope: !731)
!1030 = !DILocation(line: 155, column: 13, scope: !731)
!1031 = !DILocation(line: 155, column: 2, scope: !731)
!1032 = !DILocation(line: 157, column: 10, scope: !731)
!1033 = !DILocation(line: 158, column: 7, scope: !731)
!1034 = !DILocation(line: 159, column: 36, scope: !731)
!1035 = !DILocation(line: 159, column: 6, scope: !731)
!1036 = !DILocation(line: 161, column: 2, scope: !731)
!1037 = !DILocation(line: 165, column: 2, scope: !731)
!1038 = !DILocation(line: 18, column: 5, scope: !675, inlinedAt: !1039)
!1039 = distinct !DILocation(line: 166, column: 14, scope: !731)
!1040 = !DILocation(line: 18, column: 20, scope: !675, inlinedAt: !1039)
!1041 = !DILocation(line: 19, column: 9, scope: !692, inlinedAt: !1039)
!1042 = !DILocation(line: 19, column: 9, scope: !675, inlinedAt: !1039)
!1043 = !DILocation(line: 23, column: 25, scope: !675, inlinedAt: !1039)
!1044 = !DILocation(line: 23, column: 20, scope: !675, inlinedAt: !1039)
!1045 = !DILocation(line: 23, column: 47, scope: !675, inlinedAt: !1039)
!1046 = !DILocation(line: 23, column: 42, scope: !675, inlinedAt: !1039)
!1047 = !DILocation(line: 23, column: 55, scope: !675, inlinedAt: !1039)
!1048 = !DILocation(line: 23, column: 32, scope: !675, inlinedAt: !1039)
!1049 = !DILocation(line: 23, column: 5, scope: !675, inlinedAt: !1039)
!1050 = !DILocation(line: 24, column: 1, scope: !675, inlinedAt: !1039)
!1051 = !DILocation(line: 166, column: 9, scope: !731)
!1052 = !DILocation(line: 167, column: 11, scope: !794)
!1053 = !DILocation(line: 167, column: 21, scope: !1054)
!1054 = !DILexicalBlockFile(scope: !1055, file: !3, discriminator: 1)
!1055 = distinct !DILexicalBlock(scope: !794, file: !3, line: 167, column: 2)
!1056 = !DILocation(line: 167, column: 2, scope: !1057)
!1057 = !DILexicalBlockFile(scope: !794, file: !3, discriminator: 1)
!1058 = !DILocation(line: 170, column: 26, scope: !1059)
!1059 = distinct !DILexicalBlock(scope: !1055, file: !3, line: 167, column: 42)
!1060 = !DILocation(line: 146, column: 33, scope: !1061)
!1061 = !DILexicalBlockFile(scope: !1010, file: !3, discriminator: 3)
!1062 = !DILocation(line: 146, column: 19, scope: !1063)
!1063 = !DILexicalBlockFile(scope: !1010, file: !3, discriminator: 1)
!1064 = distinct !{!1064, !1014, !1015, !1065, !1016, !1017}
!1065 = !{!"llvm.loop.unroll.runtime.disable"}
!1066 = !DILocation(line: 175, column: 36, scope: !1067)
!1067 = !DILexicalBlockFile(scope: !1068, file: !3, discriminator: 1)
!1068 = distinct !DILexicalBlock(scope: !796, file: !3, line: 175, column: 2)
!1069 = !DILocation(line: 175, column: 2, scope: !1070)
!1070 = !DILexicalBlockFile(scope: !796, file: !3, discriminator: 1)
!1071 = !DILocation(line: 170, column: 23, scope: !1059)
!1072 = !DILocation(line: 170, column: 3, scope: !1059)
!1073 = !DILocation(line: 170, column: 47, scope: !1074)
!1074 = !DILexicalBlockFile(scope: !1059, file: !3, discriminator: 1)
!1075 = !DILocation(line: 86, column: 22, scope: !731)
!1076 = !DILocation(line: 170, column: 64, scope: !1074)
!1077 = !DILocation(line: 86, column: 7, scope: !731)
!1078 = !DILocation(line: 170, column: 3, scope: !1074)
!1079 = !DILocation(line: 167, column: 39, scope: !1080)
!1080 = !DILexicalBlockFile(scope: !1055, file: !3, discriminator: 3)
!1081 = distinct !{!1081, !1082, !1083}
!1082 = !DILocation(line: 167, column: 2, scope: !794)
!1083 = !DILocation(line: 172, column: 2, scope: !794)
!1084 = !DILocation(line: 181, column: 2, scope: !731)
!1085 = !DILocation(line: 18, column: 5, scope: !675, inlinedAt: !1086)
!1086 = distinct !DILocation(line: 182, column: 14, scope: !731)
!1087 = !DILocation(line: 18, column: 20, scope: !675, inlinedAt: !1086)
!1088 = !DILocation(line: 19, column: 9, scope: !692, inlinedAt: !1086)
!1089 = !DILocation(line: 19, column: 9, scope: !675, inlinedAt: !1086)
!1090 = !DILocation(line: 23, column: 25, scope: !675, inlinedAt: !1086)
!1091 = !DILocation(line: 23, column: 20, scope: !675, inlinedAt: !1086)
!1092 = !DILocation(line: 23, column: 47, scope: !675, inlinedAt: !1086)
!1093 = !DILocation(line: 23, column: 42, scope: !675, inlinedAt: !1086)
!1094 = !DILocation(line: 23, column: 55, scope: !675, inlinedAt: !1086)
!1095 = !DILocation(line: 23, column: 32, scope: !675, inlinedAt: !1086)
!1096 = !DILocation(line: 23, column: 5, scope: !675, inlinedAt: !1086)
!1097 = !DILocation(line: 24, column: 1, scope: !675, inlinedAt: !1086)
!1098 = !DILocation(line: 182, column: 9, scope: !731)
!1099 = !DILocation(line: 183, column: 10, scope: !731)
!1100 = !DILocation(line: 183, column: 28, scope: !731)
!1101 = !DILocation(line: 183, column: 2, scope: !731)
!1102 = !DILocation(line: 186, column: 33, scope: !731)
!1103 = !DILocation(line: 186, column: 5, scope: !731)
!1104 = !DILocation(line: 188, column: 12, scope: !799)
!1105 = !DILocation(line: 189, column: 18, scope: !1106)
!1106 = distinct !DILexicalBlock(scope: !799, file: !3, line: 188, column: 2)
!1107 = !DILocation(line: 189, column: 3, scope: !1106)
!1108 = !DILocation(line: 190, column: 2, scope: !731)
!1109 = !DILocation(line: 195, column: 14, scope: !731)
!1110 = !DILocation(line: 195, column: 8, scope: !731)
!1111 = !DILocation(line: 196, column: 2, scope: !731)
!1112 = !DILocation(line: 198, column: 24, scope: !852)
!1113 = !DILocation(line: 198, column: 11, scope: !852)
!1114 = !DILocation(line: 198, column: 30, scope: !852)
!1115 = !DILocation(line: 199, column: 14, scope: !855)
!1116 = !DILocation(line: 199, column: 11, scope: !855)
!1117 = !DILocation(line: 199, column: 7, scope: !855)
!1118 = !DILocation(line: 198, column: 55, scope: !1119)
!1119 = !DILexicalBlockFile(scope: !856, file: !3, discriminator: 1)
!1120 = !DILocation(line: 198, column: 2, scope: !1121)
!1121 = !DILexicalBlockFile(scope: !852, file: !3, discriminator: 1)
!1122 = !DILocation(line: 178, column: 26, scope: !1123)
!1123 = distinct !DILexicalBlock(scope: !1068, file: !3, line: 175, column: 47)
!1124 = !DILocation(line: 178, column: 23, scope: !1123)
!1125 = !DILocation(line: 178, column: 3, scope: !1123)
!1126 = distinct !{!1126, !1127, !1128}
!1127 = !DILocation(line: 175, column: 2, scope: !796)
!1128 = !DILocation(line: 180, column: 2, scope: !796)
!1129 = !DILocation(line: 178, column: 47, scope: !1130)
!1130 = !DILexicalBlockFile(scope: !1123, file: !3, discriminator: 1)
!1131 = !DILocation(line: 178, column: 64, scope: !1130)
!1132 = !DILocation(line: 178, column: 3, scope: !1130)
!1133 = !DILocation(line: 200, column: 31, scope: !1134)
!1134 = !DILexicalBlockFile(scope: !1135, file: !3, discriminator: 1)
!1135 = distinct !DILexicalBlock(scope: !855, file: !3, line: 200, column: 8)
!1136 = !DILocation(line: 200, column: 26, scope: !1135)
!1137 = !DILocation(line: 201, column: 54, scope: !1135)
!1138 = !DILocation(line: 201, column: 24, scope: !1135)
!1139 = !DILocation(line: 201, column: 4, scope: !1135)
!1140 = !DILocation(line: 202, column: 20, scope: !1141)
!1141 = !DILexicalBlockFile(scope: !1142, file: !3, discriminator: 1)
!1142 = distinct !DILexicalBlock(scope: !855, file: !3, line: 202, column: 8)
!1143 = !DILocation(line: 202, column: 15, scope: !1142)
!1144 = !DILocation(line: 204, column: 19, scope: !1145)
!1145 = !DILexicalBlockFile(scope: !1146, file: !3, discriminator: 1)
!1146 = distinct !DILexicalBlock(scope: !855, file: !3, line: 204, column: 8)
!1147 = !DILocation(line: 204, column: 14, scope: !1146)
!1148 = !DILocation(line: 205, column: 44, scope: !1149)
!1149 = distinct !DILexicalBlock(scope: !1146, file: !3, line: 204, column: 24)
!1150 = !DILocation(line: 205, column: 48, scope: !1149)
!1151 = !DILocation(line: 205, column: 9, scope: !1149)
!1152 = !DILocation(line: 206, column: 42, scope: !1149)
!1153 = !DILocation(line: 206, column: 46, scope: !1149)
!1154 = !DILocation(line: 206, column: 12, scope: !1149)
!1155 = !DILocation(line: 207, column: 18, scope: !1149)
!1156 = !DILocation(line: 208, column: 3, scope: !1149)
!1157 = !DILocation(line: 209, column: 13, scope: !1146)
!1158 = !DILocation(line: 211, column: 42, scope: !1159)
!1159 = distinct !DILexicalBlock(scope: !1160, file: !3, line: 209, column: 21)
!1160 = distinct !DILexicalBlock(scope: !1146, file: !3, line: 209, column: 13)
!1161 = !DILocation(line: 211, column: 46, scope: !1159)
!1162 = !DILocation(line: 211, column: 12, scope: !1159)
!1163 = !DILocation(line: 212, column: 3, scope: !1159)
!1164 = !DILocation(line: 213, column: 13, scope: !1160)
!1165 = !DILocation(line: 215, column: 53, scope: !1166)
!1166 = distinct !DILexicalBlock(scope: !1167, file: !3, line: 213, column: 21)
!1167 = distinct !DILexicalBlock(scope: !1160, file: !3, line: 213, column: 13)
!1168 = !DILocation(line: 215, column: 18, scope: !1166)
!1169 = !DILocation(line: 216, column: 3, scope: !1166)
!1170 = !DILocation(line: 222, column: 41, scope: !855)
!1171 = !DILocation(line: 222, column: 17, scope: !855)
!1172 = !DILocation(line: 222, column: 15, scope: !855)
!1173 = !DILocation(line: 221, column: 7, scope: !855)
!1174 = !DILocation(line: 223, column: 13, scope: !855)
!1175 = !DILocation(line: 221, column: 15, scope: !855)
!1176 = !DILocation(line: 224, column: 13, scope: !855)
!1177 = !DILocation(line: 221, column: 22, scope: !855)
!1178 = !DILocation(line: 9, column: 14, scope: !591, inlinedAt: !1179)
!1179 = distinct !DILocation(line: 226, column: 15, scope: !855)
!1180 = !DILocation(line: 10, column: 8, scope: !591, inlinedAt: !1179)
!1181 = !DILocation(line: 11, column: 8, scope: !591, inlinedAt: !1179)
!1182 = !DILocation(line: 14, column: 7, scope: !605, inlinedAt: !1179)
!1183 = !DILocation(line: 13, column: 5, scope: !591, inlinedAt: !1179)
!1184 = !DILocation(line: 19, column: 7, scope: !608, inlinedAt: !1179)
!1185 = !DILocation(line: 19, column: 5, scope: !591, inlinedAt: !1179)
!1186 = !DILocation(line: 199, column: 17, scope: !855)
!1187 = !DILocation(line: 227, column: 16, scope: !1188)
!1188 = distinct !DILexicalBlock(scope: !855, file: !3, line: 227, column: 6)
!1189 = !DILocation(line: 227, column: 6, scope: !855)
!1190 = !DILocation(line: 229, column: 16, scope: !1191)
!1191 = distinct !DILexicalBlock(scope: !855, file: !3, line: 229, column: 6)
!1192 = !DILocation(line: 229, column: 6, scope: !855)
!1193 = !DILocation(line: 231, column: 16, scope: !1194)
!1194 = distinct !DILexicalBlock(scope: !855, file: !3, line: 231, column: 6)
!1195 = !DILocation(line: 231, column: 6, scope: !855)
!1196 = !DILocation(line: 234, column: 3, scope: !855)
!1197 = !DILocation(line: 236, column: 16, scope: !1198)
!1198 = distinct !DILexicalBlock(scope: !855, file: !3, line: 236, column: 6)
!1199 = !DILocation(line: 236, column: 6, scope: !855)
!1200 = !DILocation(line: 237, column: 10, scope: !1201)
!1201 = distinct !DILexicalBlock(scope: !1198, file: !3, line: 237, column: 3)
!1202 = !DILocation(line: 237, column: 14, scope: !1201)
!1203 = !DILocation(line: 239, column: 27, scope: !1204)
!1204 = distinct !DILexicalBlock(scope: !1198, file: !3, line: 239, column: 17)
!1205 = !DILocation(line: 239, column: 17, scope: !1198)
!1206 = !DILocation(line: 240, column: 5, scope: !1207)
!1207 = distinct !DILexicalBlock(scope: !1204, file: !3, line: 240, column: 3)
!1208 = distinct !{!1208, !1209, !1210}
!1209 = !DILocation(line: 198, column: 2, scope: !852)
!1210 = !DILocation(line: 247, column: 2, scope: !852)
!1211 = !DILocation(line: 242, column: 27, scope: !1212)
!1212 = distinct !DILexicalBlock(scope: !1204, file: !3, line: 242, column: 17)
!1213 = !DILocation(line: 242, column: 17, scope: !1204)
!1214 = !DILocation(line: 249, column: 2, scope: !731)
!1215 = !DILocation(line: 253, column: 11, scope: !731)
!1216 = !DILocation(line: 253, column: 2, scope: !731)
!1217 = !DILocation(line: 254, column: 11, scope: !731)
!1218 = !DILocation(line: 254, column: 2, scope: !731)
!1219 = !DILocation(line: 256, column: 2, scope: !731)
!1220 = !DILocation(line: 257, column: 2, scope: !731)
!1221 = !DILocation(line: 258, column: 2, scope: !731)
!1222 = !DILocation(line: 260, column: 1, scope: !731)
!1223 = distinct !DISubprogram(name: "usage", linkageName: "_Z5usageiPPc", scope: !3, file: !3, line: 74, type: !732, isLocal: false, isDefinition: true, scopeLine: 75, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !1224)
!1224 = !{!1225, !1226}
!1225 = !DILocalVariable(name: "argc", arg: 1, scope: !1223, file: !3, line: 74, type: !23)
!1226 = !DILocalVariable(name: "argv", arg: 2, scope: !1223, file: !3, line: 74, type: !26)
!1227 = !DILocation(line: 74, column: 16, scope: !1223)
!1228 = !DILocation(line: 74, column: 29, scope: !1223)
!1229 = !DILocation(line: 76, column: 10, scope: !1223)
!1230 = !DILocation(line: 76, column: 64, scope: !1223)
!1231 = !DILocation(line: 76, column: 2, scope: !1223)
!1232 = !DILocation(line: 77, column: 10, scope: !1223)
!1233 = !DILocation(line: 77, column: 2, scope: !1223)
!1234 = !DILocation(line: 78, column: 10, scope: !1223)
!1235 = !DILocation(line: 78, column: 2, scope: !1223)
!1236 = !DILocation(line: 79, column: 2, scope: !1223)
