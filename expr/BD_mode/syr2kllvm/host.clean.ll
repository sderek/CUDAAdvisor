; ModuleID = 'syr2k.cu'
source_filename = "syr2k.cu"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.timezone = type { i32, i32 }
%struct.timeval = type { i64, i64 }
%struct.cudaDeviceProp = type { [256 x i8], i64, i64, i32, i32, i64, i32, [3 x i32], [3 x i32], i32, i64, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, [2 x i32], [2 x i32], [3 x i32], [2 x i32], [3 x i32], [3 x i32], i32, [2 x i32], [3 x i32], [2 x i32], i32, [2 x i32], [3 x i32], [2 x i32], [3 x i32], i32, [2 x i32], i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i32, i32, i32, i32 }
%struct.dim3 = type { i32, i32, i32 }
%struct.CUstream_st = type opaque

@.str = private unnamed_addr constant [35 x i8] c"Error return from gettimeofday: %d\00", align 1
@.str.1 = private unnamed_addr constant [74 x i8] c"Non-Matching CPU-GPU Outputs Beyond Error Threshold of %4.2f Percent: %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [32 x i8] c"setting device %d with name %s\0A\00", align 1
@stdout = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.3 = private unnamed_addr constant [23 x i8] c"GPU Runtime: %0.6lf s\0A\00", align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.4 = private unnamed_addr constant [9 x i8] c" %0.6lf\0A\00", align 1
@.str.5 = private unnamed_addr constant [22 x i8] c"CPU Runtime: %0.6lfs\0A\00", align 1

; Function Attrs: nounwind uwtable
define double @_Z7rtclockv() local_unnamed_addr #0 !dbg !578 {
entry:
  %Tzp = alloca %struct.timezone, align 4
  %Tp = alloca %struct.timeval, align 8
  %0 = bitcast %struct.timezone* %Tzp to i8*, !dbg !599
  call void @llvm.lifetime.start(i64 8, i8* nonnull %0) #8, !dbg !599
  %1 = bitcast %struct.timeval* %Tp to i8*, !dbg !600
  call void @llvm.lifetime.start(i64 16, i8* nonnull %1) #8, !dbg !600
  tail call void @llvm.dbg.value(metadata %struct.timezone* %Tzp, i64 0, metadata !583, metadata !601), !dbg !602
  tail call void @llvm.dbg.value(metadata %struct.timeval* %Tp, i64 0, metadata !589, metadata !601), !dbg !603
  %call = call i32 @gettimeofday(%struct.timeval* nonnull %Tp, %struct.timezone* nonnull %Tzp) #8, !dbg !604
  tail call void @llvm.dbg.value(metadata i32 %call, i64 0, metadata !598, metadata !605), !dbg !606
  %cmp = icmp eq i32 %call, 0, !dbg !607
  br i1 %cmp, label %if.end, label %if.then, !dbg !609

if.then:                                          ; preds = %entry
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str, i64 0, i64 0), i32 %call), !dbg !610
  br label %if.end, !dbg !610

if.end:                                           ; preds = %entry, %if.then
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %Tp, i64 0, i32 0, !dbg !612
  %2 = load i64, i64* %tv_sec, align 8, !dbg !612, !tbaa !613
  %conv = sitofp i64 %2 to double, !dbg !618
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %Tp, i64 0, i32 1, !dbg !619
  %3 = load i64, i64* %tv_usec, align 8, !dbg !619, !tbaa !620
  %conv2 = sitofp i64 %3 to double, !dbg !621
  %mul = fmul double %conv2, 1.000000e-06, !dbg !622
  %add = fadd double %mul, %conv, !dbg !623
  call void @llvm.lifetime.end(i64 16, i8* nonnull %1) #8, !dbg !624
  call void @llvm.lifetime.end(i64 8, i8* nonnull %0) #8, !dbg !624
  ret double %add, !dbg !625
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare i32 @gettimeofday(%struct.timeval* nocapture, %struct.timezone* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: nounwind readnone uwtable
define float @_Z6absValf(float %a) local_unnamed_addr #3 !dbg !626 {
entry:
  tail call void @llvm.dbg.value(metadata float %a, i64 0, metadata !628, metadata !605), !dbg !629
  %cmp = fcmp olt float %a, 0.000000e+00, !dbg !630
  %mul = fsub float -0.000000e+00, %a, !dbg !632
  %retval.0 = select i1 %cmp, float %mul, float %a, !dbg !634
  ret float %retval.0, !dbg !635
}

; Function Attrs: nounwind readnone uwtable
define float @_Z11percentDiffdd(double %val1, double %val2) local_unnamed_addr #3 !dbg !636 {
entry:
  tail call void @llvm.dbg.value(metadata double %val1, i64 0, metadata !640, metadata !605), !dbg !642
  tail call void @llvm.dbg.value(metadata double %val2, i64 0, metadata !641, metadata !605), !dbg !643
  %conv = fptrunc double %val1 to float, !dbg !644
  tail call void @llvm.dbg.value(metadata float %conv, i64 0, metadata !628, metadata !605), !dbg !646
  %cmp.i = fcmp olt float %conv, 0.000000e+00, !dbg !648
  %mul.i = fsub float -0.000000e+00, %conv, !dbg !649
  %retval.0.i = select i1 %cmp.i, float %mul.i, float %conv, !dbg !650
  %conv1 = fpext float %retval.0.i to double, !dbg !651
  %cmp = fcmp olt double %conv1, 1.000000e-02, !dbg !652
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !653

land.lhs.true:                                    ; preds = %entry
  %conv2 = fptrunc double %val2 to float, !dbg !654
  tail call void @llvm.dbg.value(metadata float %conv2, i64 0, metadata !628, metadata !605), !dbg !656
  %cmp.i23 = fcmp olt float %conv2, 0.000000e+00, !dbg !658
  %mul.i24 = fsub float -0.000000e+00, %conv2, !dbg !659
  %retval.0.i25 = select i1 %cmp.i23, float %mul.i24, float %conv2, !dbg !660
  %conv4 = fpext float %retval.0.i25 to double, !dbg !661
  %cmp5 = fcmp olt double %conv4, 1.000000e-02, !dbg !662
  br i1 %cmp5, label %return, label %if.else, !dbg !663

if.else:                                          ; preds = %land.lhs.true, %entry
  %sub = fsub double %val1, %val2, !dbg !665
  %conv6 = fptrunc double %sub to float, !dbg !667
  tail call void @llvm.dbg.value(metadata float %conv6, i64 0, metadata !628, metadata !605), !dbg !668
  %cmp.i20 = fcmp olt float %conv6, 0.000000e+00, !dbg !670
  %mul.i21 = fsub float -0.000000e+00, %conv6, !dbg !671
  %retval.0.i22 = select i1 %cmp.i20, float %mul.i21, float %conv6, !dbg !672
  %add = fadd double %val1, 0x3E45798EE0000000, !dbg !673
  %conv8 = fptrunc double %add to float, !dbg !674
  tail call void @llvm.dbg.value(metadata float %conv8, i64 0, metadata !628, metadata !605), !dbg !675
  %cmp.i17 = fcmp olt float %conv8, 0.000000e+00, !dbg !678
  %mul.i18 = fsub float -0.000000e+00, %conv8, !dbg !679
  %retval.0.i19 = select i1 %cmp.i17, float %mul.i18, float %conv8, !dbg !680
  %div = fdiv float %retval.0.i22, %retval.0.i19, !dbg !681
  tail call void @llvm.dbg.value(metadata float %div, i64 0, metadata !628, metadata !605), !dbg !682
  %cmp.i14 = fcmp olt float %div, 0.000000e+00, !dbg !685
  %mul.i15 = fsub float -0.000000e+00, %div, !dbg !686
  %retval.0.i16 = select i1 %cmp.i14, float %mul.i15, float %div, !dbg !687
  %mul = fmul float %retval.0.i16, 1.000000e+02, !dbg !688
  br label %return, !dbg !689

return:                                           ; preds = %land.lhs.true, %if.else
  %retval.0 = phi float [ %mul, %if.else ], [ 0.000000e+00, %land.lhs.true ]
  ret float %retval.0, !dbg !690
}

; Function Attrs: nounwind uwtable
define void @_Z11init_arraysPfS_S_(float* nocapture %A, float* nocapture %B, float* nocapture %C) local_unnamed_addr #0 !dbg !691 {
entry:
  tail call void @llvm.dbg.value(metadata float* %A, i64 0, metadata !695, metadata !605), !dbg !700
  tail call void @llvm.dbg.value(metadata float* %B, i64 0, metadata !696, metadata !605), !dbg !701
  tail call void @llvm.dbg.value(metadata float* %C, i64 0, metadata !697, metadata !605), !dbg !702
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !698, metadata !605), !dbg !703
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !698, metadata !605), !dbg !703
  br label %for.cond1.preheader, !dbg !704

for.cond1.preheader:                              ; preds = %for.inc30, %entry
  %indvars.iv58 = phi i64 [ 0, %entry ], [ %indvars.iv.next59, %for.inc30 ]
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !699, metadata !605), !dbg !707
  %0 = shl i64 %indvars.iv58, 5
  %1 = add i64 %0, 32
  %2 = trunc i64 %indvars.iv58 to i32
  %conv = sitofp i32 %2 to float
  %3 = shl i64 %indvars.iv58, 5
  %broadcast.splatinsert85 = insertelement <4 x float> undef, float %conv, i32 0, !dbg !708
  %broadcast.splat86 = shufflevector <4 x float> %broadcast.splatinsert85, <4 x float> undef, <4 x i32> zeroinitializer, !dbg !708
  br label %vector.body72, !dbg !708

vector.body72:                                    ; preds = %for.cond1.preheader
  %scevgep68 = getelementptr float, float* %B, i64 %1
  %scevgep66 = getelementptr float, float* %B, i64 %0
  %scevgep64 = getelementptr float, float* %A, i64 %1
  %scevgep = getelementptr float, float* %A, i64 %0
  %4 = fmul <4 x float> %broadcast.splat86, <float 0.000000e+00, float 1.000000e+00, float 2.000000e+00, float 3.000000e+00>, !dbg !713
  %5 = fadd <4 x float> %4, <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>, !dbg !716
  %6 = fmul <4 x float> %5, <float 3.125000e-02, float 3.125000e-02, float 3.125000e-02, float 3.125000e-02>, !dbg !717
  %7 = getelementptr inbounds float, float* %C, i64 %3, !dbg !718
  %8 = bitcast float* %7 to <4 x float>*, !dbg !719
  store <4 x float> %6, <4 x float>* %8, align 4, !dbg !719, !tbaa !720
  %9 = fmul <4 x float> %broadcast.splat86, <float 4.000000e+00, float 5.000000e+00, float 6.000000e+00, float 7.000000e+00>, !dbg !713
  %10 = fadd <4 x float> %9, <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>, !dbg !716
  %11 = fmul <4 x float> %10, <float 3.125000e-02, float 3.125000e-02, float 3.125000e-02, float 3.125000e-02>, !dbg !717
  %12 = or i64 %3, 4, !dbg !722
  %13 = getelementptr inbounds float, float* %C, i64 %12, !dbg !718
  %14 = bitcast float* %13 to <4 x float>*, !dbg !719
  store <4 x float> %11, <4 x float>* %14, align 4, !dbg !719, !tbaa !720
  %15 = fmul <4 x float> %broadcast.splat86, <float 8.000000e+00, float 9.000000e+00, float 1.000000e+01, float 1.100000e+01>, !dbg !713
  %16 = fadd <4 x float> %15, <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>, !dbg !716
  %17 = fmul <4 x float> %16, <float 3.125000e-02, float 3.125000e-02, float 3.125000e-02, float 3.125000e-02>, !dbg !717
  %18 = or i64 %3, 8, !dbg !722
  %19 = getelementptr inbounds float, float* %C, i64 %18, !dbg !718
  %20 = bitcast float* %19 to <4 x float>*, !dbg !719
  store <4 x float> %17, <4 x float>* %20, align 4, !dbg !719, !tbaa !720
  %21 = fmul <4 x float> %broadcast.splat86, <float 1.200000e+01, float 1.300000e+01, float 1.400000e+01, float 1.500000e+01>, !dbg !713
  %22 = fadd <4 x float> %21, <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>, !dbg !716
  %23 = fmul <4 x float> %22, <float 3.125000e-02, float 3.125000e-02, float 3.125000e-02, float 3.125000e-02>, !dbg !717
  %24 = or i64 %3, 12, !dbg !722
  %25 = getelementptr inbounds float, float* %C, i64 %24, !dbg !718
  %26 = bitcast float* %25 to <4 x float>*, !dbg !719
  store <4 x float> %23, <4 x float>* %26, align 4, !dbg !719, !tbaa !720
  %27 = fmul <4 x float> %broadcast.splat86, <float 1.600000e+01, float 1.700000e+01, float 1.800000e+01, float 1.900000e+01>, !dbg !713
  %28 = fadd <4 x float> %27, <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>, !dbg !716
  %29 = fmul <4 x float> %28, <float 3.125000e-02, float 3.125000e-02, float 3.125000e-02, float 3.125000e-02>, !dbg !717
  %30 = or i64 %3, 16, !dbg !722
  %31 = getelementptr inbounds float, float* %C, i64 %30, !dbg !718
  %32 = bitcast float* %31 to <4 x float>*, !dbg !719
  store <4 x float> %29, <4 x float>* %32, align 4, !dbg !719, !tbaa !720
  %33 = fmul <4 x float> %broadcast.splat86, <float 2.000000e+01, float 2.100000e+01, float 2.200000e+01, float 2.300000e+01>, !dbg !713
  %34 = fadd <4 x float> %33, <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>, !dbg !716
  %35 = fmul <4 x float> %34, <float 3.125000e-02, float 3.125000e-02, float 3.125000e-02, float 3.125000e-02>, !dbg !717
  %36 = or i64 %3, 20, !dbg !722
  %37 = getelementptr inbounds float, float* %C, i64 %36, !dbg !718
  %38 = bitcast float* %37 to <4 x float>*, !dbg !719
  store <4 x float> %35, <4 x float>* %38, align 4, !dbg !719, !tbaa !720
  %39 = fmul <4 x float> %broadcast.splat86, <float 2.400000e+01, float 2.500000e+01, float 2.600000e+01, float 2.700000e+01>, !dbg !713
  %40 = fadd <4 x float> %39, <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>, !dbg !716
  %41 = fmul <4 x float> %40, <float 3.125000e-02, float 3.125000e-02, float 3.125000e-02, float 3.125000e-02>, !dbg !717
  %42 = or i64 %3, 24, !dbg !722
  %43 = getelementptr inbounds float, float* %C, i64 %42, !dbg !718
  %44 = bitcast float* %43 to <4 x float>*, !dbg !719
  store <4 x float> %41, <4 x float>* %44, align 4, !dbg !719, !tbaa !720
  %45 = fmul <4 x float> %broadcast.splat86, <float 2.800000e+01, float 2.900000e+01, float 3.000000e+01, float 3.100000e+01>, !dbg !713
  %46 = fadd <4 x float> %45, <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>, !dbg !716
  %47 = fmul <4 x float> %46, <float 3.125000e-02, float 3.125000e-02, float 3.125000e-02, float 3.125000e-02>, !dbg !717
  %48 = or i64 %3, 28, !dbg !722
  %49 = getelementptr inbounds float, float* %C, i64 %48, !dbg !718
  %50 = bitcast float* %49 to <4 x float>*, !dbg !719
  store <4 x float> %47, <4 x float>* %50, align 4, !dbg !719, !tbaa !720
  %bound0 = icmp ult float* %scevgep, %scevgep68, !dbg !723
  %bound1 = icmp ult float* %scevgep66, %scevgep64, !dbg !723
  %memcheck.conflict = and i1 %bound0, %bound1, !dbg !723
  br i1 %memcheck.conflict, label %for.body9.preheader, label %vector.ph, !dbg !723

for.body9.preheader:                              ; preds = %vector.body72
  br label %for.body9, !dbg !723

vector.ph:                                        ; preds = %vector.body72
  %broadcast.splatinsert = insertelement <4 x float> undef, float %conv, i32 0, !dbg !723
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> undef, <4 x i32> zeroinitializer, !dbg !723
  br label %vector.body, !dbg !723

vector.body:                                      ; preds = %vector.ph
  %51 = fmul <4 x float> %broadcast.splat, <float 0.000000e+00, float 1.000000e+00, float 2.000000e+00, float 3.000000e+00>, !dbg !727
  %52 = fmul <4 x float> %51, <float 3.125000e-02, float 3.125000e-02, float 3.125000e-02, float 3.125000e-02>, !dbg !728
  %53 = getelementptr inbounds float, float* %A, i64 %3, !dbg !729
  %54 = bitcast float* %53 to <4 x float>*, !dbg !730
  store <4 x float> %52, <4 x float>* %54, align 4, !dbg !730, !tbaa !720, !alias.scope !731, !noalias !734
  %55 = fadd <4 x float> %51, <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, !dbg !736
  %56 = fmul <4 x float> %55, <float 3.125000e-02, float 3.125000e-02, float 3.125000e-02, float 3.125000e-02>, !dbg !737
  %57 = getelementptr inbounds float, float* %B, i64 %3, !dbg !738
  %58 = bitcast float* %57 to <4 x float>*, !dbg !739
  store <4 x float> %56, <4 x float>* %58, align 4, !dbg !739, !tbaa !720, !alias.scope !734
  %59 = fmul <4 x float> %broadcast.splat, <float 4.000000e+00, float 5.000000e+00, float 6.000000e+00, float 7.000000e+00>, !dbg !727
  %60 = fmul <4 x float> %59, <float 3.125000e-02, float 3.125000e-02, float 3.125000e-02, float 3.125000e-02>, !dbg !728
  %61 = or i64 %3, 4, !dbg !740
  %62 = getelementptr inbounds float, float* %A, i64 %61, !dbg !729
  %63 = bitcast float* %62 to <4 x float>*, !dbg !730
  store <4 x float> %60, <4 x float>* %63, align 4, !dbg !730, !tbaa !720, !alias.scope !731, !noalias !734
  %64 = fadd <4 x float> %59, <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, !dbg !736
  %65 = fmul <4 x float> %64, <float 3.125000e-02, float 3.125000e-02, float 3.125000e-02, float 3.125000e-02>, !dbg !737
  %66 = getelementptr inbounds float, float* %B, i64 %61, !dbg !738
  %67 = bitcast float* %66 to <4 x float>*, !dbg !739
  store <4 x float> %65, <4 x float>* %67, align 4, !dbg !739, !tbaa !720, !alias.scope !734
  %68 = fmul <4 x float> %broadcast.splat, <float 8.000000e+00, float 9.000000e+00, float 1.000000e+01, float 1.100000e+01>, !dbg !727
  %69 = fmul <4 x float> %68, <float 3.125000e-02, float 3.125000e-02, float 3.125000e-02, float 3.125000e-02>, !dbg !728
  %70 = or i64 %3, 8, !dbg !740
  %71 = getelementptr inbounds float, float* %A, i64 %70, !dbg !729
  %72 = bitcast float* %71 to <4 x float>*, !dbg !730
  store <4 x float> %69, <4 x float>* %72, align 4, !dbg !730, !tbaa !720, !alias.scope !731, !noalias !734
  %73 = fadd <4 x float> %68, <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, !dbg !736
  %74 = fmul <4 x float> %73, <float 3.125000e-02, float 3.125000e-02, float 3.125000e-02, float 3.125000e-02>, !dbg !737
  %75 = getelementptr inbounds float, float* %B, i64 %70, !dbg !738
  %76 = bitcast float* %75 to <4 x float>*, !dbg !739
  store <4 x float> %74, <4 x float>* %76, align 4, !dbg !739, !tbaa !720, !alias.scope !734
  %77 = fmul <4 x float> %broadcast.splat, <float 1.200000e+01, float 1.300000e+01, float 1.400000e+01, float 1.500000e+01>, !dbg !727
  %78 = fmul <4 x float> %77, <float 3.125000e-02, float 3.125000e-02, float 3.125000e-02, float 3.125000e-02>, !dbg !728
  %79 = or i64 %3, 12, !dbg !740
  %80 = getelementptr inbounds float, float* %A, i64 %79, !dbg !729
  %81 = bitcast float* %80 to <4 x float>*, !dbg !730
  store <4 x float> %78, <4 x float>* %81, align 4, !dbg !730, !tbaa !720, !alias.scope !731, !noalias !734
  %82 = fadd <4 x float> %77, <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, !dbg !736
  %83 = fmul <4 x float> %82, <float 3.125000e-02, float 3.125000e-02, float 3.125000e-02, float 3.125000e-02>, !dbg !737
  %84 = getelementptr inbounds float, float* %B, i64 %79, !dbg !738
  %85 = bitcast float* %84 to <4 x float>*, !dbg !739
  store <4 x float> %83, <4 x float>* %85, align 4, !dbg !739, !tbaa !720, !alias.scope !734
  %86 = fmul <4 x float> %broadcast.splat, <float 1.600000e+01, float 1.700000e+01, float 1.800000e+01, float 1.900000e+01>, !dbg !727
  %87 = fmul <4 x float> %86, <float 3.125000e-02, float 3.125000e-02, float 3.125000e-02, float 3.125000e-02>, !dbg !728
  %88 = or i64 %3, 16, !dbg !740
  %89 = getelementptr inbounds float, float* %A, i64 %88, !dbg !729
  %90 = bitcast float* %89 to <4 x float>*, !dbg !730
  store <4 x float> %87, <4 x float>* %90, align 4, !dbg !730, !tbaa !720, !alias.scope !731, !noalias !734
  %91 = fadd <4 x float> %86, <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, !dbg !736
  %92 = fmul <4 x float> %91, <float 3.125000e-02, float 3.125000e-02, float 3.125000e-02, float 3.125000e-02>, !dbg !737
  %93 = getelementptr inbounds float, float* %B, i64 %88, !dbg !738
  %94 = bitcast float* %93 to <4 x float>*, !dbg !739
  store <4 x float> %92, <4 x float>* %94, align 4, !dbg !739, !tbaa !720, !alias.scope !734
  %95 = fmul <4 x float> %broadcast.splat, <float 2.000000e+01, float 2.100000e+01, float 2.200000e+01, float 2.300000e+01>, !dbg !727
  %96 = fmul <4 x float> %95, <float 3.125000e-02, float 3.125000e-02, float 3.125000e-02, float 3.125000e-02>, !dbg !728
  %97 = or i64 %3, 20, !dbg !740
  %98 = getelementptr inbounds float, float* %A, i64 %97, !dbg !729
  %99 = bitcast float* %98 to <4 x float>*, !dbg !730
  store <4 x float> %96, <4 x float>* %99, align 4, !dbg !730, !tbaa !720, !alias.scope !731, !noalias !734
  %100 = fadd <4 x float> %95, <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, !dbg !736
  %101 = fmul <4 x float> %100, <float 3.125000e-02, float 3.125000e-02, float 3.125000e-02, float 3.125000e-02>, !dbg !737
  %102 = getelementptr inbounds float, float* %B, i64 %97, !dbg !738
  %103 = bitcast float* %102 to <4 x float>*, !dbg !739
  store <4 x float> %101, <4 x float>* %103, align 4, !dbg !739, !tbaa !720, !alias.scope !734
  %104 = fmul <4 x float> %broadcast.splat, <float 2.400000e+01, float 2.500000e+01, float 2.600000e+01, float 2.700000e+01>, !dbg !727
  %105 = fmul <4 x float> %104, <float 3.125000e-02, float 3.125000e-02, float 3.125000e-02, float 3.125000e-02>, !dbg !728
  %106 = or i64 %3, 24, !dbg !740
  %107 = getelementptr inbounds float, float* %A, i64 %106, !dbg !729
  %108 = bitcast float* %107 to <4 x float>*, !dbg !730
  store <4 x float> %105, <4 x float>* %108, align 4, !dbg !730, !tbaa !720, !alias.scope !731, !noalias !734
  %109 = fadd <4 x float> %104, <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, !dbg !736
  %110 = fmul <4 x float> %109, <float 3.125000e-02, float 3.125000e-02, float 3.125000e-02, float 3.125000e-02>, !dbg !737
  %111 = getelementptr inbounds float, float* %B, i64 %106, !dbg !738
  %112 = bitcast float* %111 to <4 x float>*, !dbg !739
  store <4 x float> %110, <4 x float>* %112, align 4, !dbg !739, !tbaa !720, !alias.scope !734
  %113 = fmul <4 x float> %broadcast.splat, <float 2.800000e+01, float 2.900000e+01, float 3.000000e+01, float 3.100000e+01>, !dbg !727
  %114 = fmul <4 x float> %113, <float 3.125000e-02, float 3.125000e-02, float 3.125000e-02, float 3.125000e-02>, !dbg !728
  %115 = or i64 %3, 28, !dbg !740
  %116 = getelementptr inbounds float, float* %A, i64 %115, !dbg !729
  %117 = bitcast float* %116 to <4 x float>*, !dbg !730
  store <4 x float> %114, <4 x float>* %117, align 4, !dbg !730, !tbaa !720, !alias.scope !731, !noalias !734
  %118 = fadd <4 x float> %113, <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, !dbg !736
  %119 = fmul <4 x float> %118, <float 3.125000e-02, float 3.125000e-02, float 3.125000e-02, float 3.125000e-02>, !dbg !737
  %120 = getelementptr inbounds float, float* %B, i64 %115, !dbg !738
  %121 = bitcast float* %120 to <4 x float>*, !dbg !739
  store <4 x float> %119, <4 x float>* %121, align 4, !dbg !739, !tbaa !720, !alias.scope !734
  br label %for.inc30, !dbg !741

for.body9:                                        ; preds = %for.body9, %for.body9.preheader
  %indvars.iv54 = phi i64 [ 0, %for.body9.preheader ], [ %indvars.iv.next55.1, %for.body9 ]
  %122 = trunc i64 %indvars.iv54 to i32, !dbg !723
  %conv11 = sitofp i32 %122 to float, !dbg !723
  %mul12 = fmul float %conv, %conv11, !dbg !727
  %div13 = fmul float %mul12, 3.125000e-02, !dbg !728
  %123 = add nuw nsw i64 %indvars.iv54, %3, !dbg !740
  %arrayidx17 = getelementptr inbounds float, float* %A, i64 %123, !dbg !729
  store float %div13, float* %arrayidx17, align 4, !dbg !730, !tbaa !720
  %add21 = fadd float %mul12, 1.000000e+00, !dbg !736
  %div22 = fmul float %add21, 3.125000e-02, !dbg !737
  %arrayidx26 = getelementptr inbounds float, float* %B, i64 %123, !dbg !738
  store float %div22, float* %arrayidx26, align 4, !dbg !739, !tbaa !720
  %indvars.iv.next55 = or i64 %indvars.iv54, 1, !dbg !743
  %124 = trunc i64 %indvars.iv.next55 to i32, !dbg !723
  %conv11.1 = sitofp i32 %124 to float, !dbg !723
  %mul12.1 = fmul float %conv, %conv11.1, !dbg !727
  %div13.1 = fmul float %mul12.1, 3.125000e-02, !dbg !728
  %125 = add nuw nsw i64 %indvars.iv.next55, %3, !dbg !740
  %arrayidx17.1 = getelementptr inbounds float, float* %A, i64 %125, !dbg !729
  store float %div13.1, float* %arrayidx17.1, align 4, !dbg !730, !tbaa !720
  %add21.1 = fadd float %mul12.1, 1.000000e+00, !dbg !736
  %div22.1 = fmul float %add21.1, 3.125000e-02, !dbg !737
  %arrayidx26.1 = getelementptr inbounds float, float* %B, i64 %125, !dbg !738
  store float %div22.1, float* %arrayidx26.1, align 4, !dbg !739, !tbaa !720
  %indvars.iv.next55.1 = add nsw i64 %indvars.iv54, 2, !dbg !743
  %exitcond57.1 = icmp eq i64 %indvars.iv.next55.1, 32, !dbg !745
  br i1 %exitcond57.1, label %for.inc30.loopexit, label %for.body9, !dbg !747, !llvm.loop !749

for.inc30.loopexit:                               ; preds = %for.body9
  br label %for.inc30, !dbg !741

for.inc30:                                        ; preds = %vector.body, %for.inc30.loopexit
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1, !dbg !741
  %exitcond62 = icmp eq i64 %indvars.iv.next59, 32, !dbg !754
  br i1 %exitcond62, label %for.end32, label %for.cond1.preheader, !dbg !704, !llvm.loop !756

for.end32:                                        ; preds = %for.inc30
  ret void, !dbg !759
}

; Function Attrs: nounwind uwtable
define void @_Z5syr2kPfS_S_(float* nocapture readonly %A, float* nocapture readonly %B, float* nocapture %C) local_unnamed_addr #0 !dbg !760 {
entry:
  tail call void @llvm.dbg.value(metadata float* %A, i64 0, metadata !762, metadata !605), !dbg !768
  tail call void @llvm.dbg.value(metadata float* %B, i64 0, metadata !763, metadata !605), !dbg !769
  tail call void @llvm.dbg.value(metadata float* %C, i64 0, metadata !764, metadata !605), !dbg !770
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !765, metadata !605), !dbg !771
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !765, metadata !605), !dbg !771
  br label %for.cond1.preheader, !dbg !772

for.cond1.preheader:                              ; preds = %vector.body, %entry
  %indvars.iv104 = phi i64 [ 0, %entry ], [ %indvars.iv.next105, %vector.body ]
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !766, metadata !605), !dbg !775
  %0 = shl i64 %indvars.iv104, 5
  br label %vector.body, !dbg !776

vector.body:                                      ; preds = %for.cond1.preheader
  %1 = getelementptr inbounds float, float* %C, i64 %0, !dbg !781
  %2 = bitcast float* %1 to <4 x float>*, !dbg !784
  %wide.load = load <4 x float>, <4 x float>* %2, align 4, !dbg !784, !tbaa !720
  %3 = fmul <4 x float> %wide.load, <float 4.546000e+03, float 4.546000e+03, float 4.546000e+03, float 4.546000e+03>, !dbg !784
  %4 = bitcast float* %1 to <4 x float>*, !dbg !784
  store <4 x float> %3, <4 x float>* %4, align 4, !dbg !784, !tbaa !720
  %5 = or i64 %0, 4, !dbg !785
  %6 = getelementptr inbounds float, float* %C, i64 %5, !dbg !781
  %7 = bitcast float* %6 to <4 x float>*, !dbg !784
  %wide.load.1 = load <4 x float>, <4 x float>* %7, align 4, !dbg !784, !tbaa !720
  %8 = fmul <4 x float> %wide.load.1, <float 4.546000e+03, float 4.546000e+03, float 4.546000e+03, float 4.546000e+03>, !dbg !784
  %9 = bitcast float* %6 to <4 x float>*, !dbg !784
  store <4 x float> %8, <4 x float>* %9, align 4, !dbg !784, !tbaa !720
  %10 = or i64 %0, 8, !dbg !785
  %11 = getelementptr inbounds float, float* %C, i64 %10, !dbg !781
  %12 = bitcast float* %11 to <4 x float>*, !dbg !784
  %wide.load.2 = load <4 x float>, <4 x float>* %12, align 4, !dbg !784, !tbaa !720
  %13 = fmul <4 x float> %wide.load.2, <float 4.546000e+03, float 4.546000e+03, float 4.546000e+03, float 4.546000e+03>, !dbg !784
  %14 = bitcast float* %11 to <4 x float>*, !dbg !784
  store <4 x float> %13, <4 x float>* %14, align 4, !dbg !784, !tbaa !720
  %15 = or i64 %0, 12, !dbg !785
  %16 = getelementptr inbounds float, float* %C, i64 %15, !dbg !781
  %17 = bitcast float* %16 to <4 x float>*, !dbg !784
  %wide.load.3 = load <4 x float>, <4 x float>* %17, align 4, !dbg !784, !tbaa !720
  %18 = fmul <4 x float> %wide.load.3, <float 4.546000e+03, float 4.546000e+03, float 4.546000e+03, float 4.546000e+03>, !dbg !784
  %19 = bitcast float* %16 to <4 x float>*, !dbg !784
  store <4 x float> %18, <4 x float>* %19, align 4, !dbg !784, !tbaa !720
  %20 = or i64 %0, 16, !dbg !785
  %21 = getelementptr inbounds float, float* %C, i64 %20, !dbg !781
  %22 = bitcast float* %21 to <4 x float>*, !dbg !784
  %wide.load.4 = load <4 x float>, <4 x float>* %22, align 4, !dbg !784, !tbaa !720
  %23 = fmul <4 x float> %wide.load.4, <float 4.546000e+03, float 4.546000e+03, float 4.546000e+03, float 4.546000e+03>, !dbg !784
  %24 = bitcast float* %21 to <4 x float>*, !dbg !784
  store <4 x float> %23, <4 x float>* %24, align 4, !dbg !784, !tbaa !720
  %25 = or i64 %0, 20, !dbg !785
  %26 = getelementptr inbounds float, float* %C, i64 %25, !dbg !781
  %27 = bitcast float* %26 to <4 x float>*, !dbg !784
  %wide.load.5 = load <4 x float>, <4 x float>* %27, align 4, !dbg !784, !tbaa !720
  %28 = fmul <4 x float> %wide.load.5, <float 4.546000e+03, float 4.546000e+03, float 4.546000e+03, float 4.546000e+03>, !dbg !784
  %29 = bitcast float* %26 to <4 x float>*, !dbg !784
  store <4 x float> %28, <4 x float>* %29, align 4, !dbg !784, !tbaa !720
  %30 = or i64 %0, 24, !dbg !785
  %31 = getelementptr inbounds float, float* %C, i64 %30, !dbg !781
  %32 = bitcast float* %31 to <4 x float>*, !dbg !784
  %wide.load.6 = load <4 x float>, <4 x float>* %32, align 4, !dbg !784, !tbaa !720
  %33 = fmul <4 x float> %wide.load.6, <float 4.546000e+03, float 4.546000e+03, float 4.546000e+03, float 4.546000e+03>, !dbg !784
  %34 = bitcast float* %31 to <4 x float>*, !dbg !784
  store <4 x float> %33, <4 x float>* %34, align 4, !dbg !784, !tbaa !720
  %35 = or i64 %0, 28, !dbg !785
  %36 = getelementptr inbounds float, float* %C, i64 %35, !dbg !781
  %37 = bitcast float* %36 to <4 x float>*, !dbg !784
  %wide.load.7 = load <4 x float>, <4 x float>* %37, align 4, !dbg !784, !tbaa !720
  %38 = fmul <4 x float> %wide.load.7, <float 4.546000e+03, float 4.546000e+03, float 4.546000e+03, float 4.546000e+03>, !dbg !784
  %39 = bitcast float* %36 to <4 x float>*, !dbg !784
  store <4 x float> %38, <4 x float>* %39, align 4, !dbg !784, !tbaa !720
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1, !dbg !786
  %exitcond107 = icmp eq i64 %indvars.iv.next105, 32, !dbg !788
  br i1 %exitcond107, label %for.cond11.preheader.preheader, label %for.cond1.preheader, !dbg !772, !llvm.loop !790

for.cond11.preheader.preheader:                   ; preds = %vector.body
  br label %for.cond11.preheader, !dbg !775

for.cond11.preheader:                             ; preds = %for.cond11.preheader.preheader, %for.inc53
  %indvars.iv96 = phi i64 [ %indvars.iv.next97, %for.inc53 ], [ 0, %for.cond11.preheader.preheader ]
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !766, metadata !605), !dbg !775
  %40 = shl nsw i64 %indvars.iv96, 5
  br label %for.cond14.preheader, !dbg !793

for.cond14.preheader:                             ; preds = %for.inc50, %for.cond11.preheader
  %indvars.iv91 = phi i64 [ 0, %for.cond11.preheader ], [ %indvars.iv.next92, %for.inc50 ]
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !767, metadata !605), !dbg !799
  %41 = shl i64 %indvars.iv91, 5
  %42 = add nuw nsw i64 %indvars.iv91, %40
  %arrayidx30 = getelementptr inbounds float, float* %C, i64 %42
  %.pre = load float, float* %arrayidx30, align 4, !tbaa !720
  br label %for.body16, !dbg !800

for.body16:                                       ; preds = %for.body16, %for.cond14.preheader
  %43 = phi float [ %.pre, %for.cond14.preheader ], [ %add46, %for.body16 ], !dbg !805
  %indvars.iv = phi i64 [ 0, %for.cond14.preheader ], [ %indvars.iv.next, %for.body16 ]
  %44 = add nuw nsw i64 %indvars.iv, %40, !dbg !808
  %arrayidx20 = getelementptr inbounds float, float* %A, i64 %44, !dbg !809
  %45 = load float, float* %arrayidx20, align 4, !dbg !809, !tbaa !720
  %mul21 = fmul float %45, 1.243500e+04, !dbg !810
  %46 = add nuw nsw i64 %indvars.iv, %41, !dbg !811
  %arrayidx25 = getelementptr inbounds float, float* %B, i64 %46, !dbg !812
  %47 = load float, float* %arrayidx25, align 4, !dbg !812, !tbaa !720
  %mul26 = fmul float %mul21, %47, !dbg !813
  %add31 = fadd float %43, %mul26, !dbg !805
  store float %add31, float* %arrayidx30, align 4, !dbg !805, !tbaa !720
  %arrayidx35 = getelementptr inbounds float, float* %B, i64 %44, !dbg !814
  %48 = load float, float* %arrayidx35, align 4, !dbg !814, !tbaa !720
  %mul36 = fmul float %48, 1.243500e+04, !dbg !815
  %arrayidx40 = getelementptr inbounds float, float* %A, i64 %46, !dbg !816
  %49 = load float, float* %arrayidx40, align 4, !dbg !816, !tbaa !720
  %mul41 = fmul float %mul36, %49, !dbg !817
  %add46 = fadd float %add31, %mul41, !dbg !818
  store float %add46, float* %arrayidx30, align 4, !dbg !818, !tbaa !720
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !819
  %exitcond = icmp eq i64 %indvars.iv.next, 32, !dbg !821
  br i1 %exitcond, label %for.inc50, label %for.body16, !dbg !800, !llvm.loop !823

for.inc50:                                        ; preds = %for.body16
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1, !dbg !826
  %exitcond95 = icmp eq i64 %indvars.iv.next92, 32, !dbg !828
  br i1 %exitcond95, label %for.inc53, label %for.cond14.preheader, !dbg !793, !llvm.loop !830

for.inc53:                                        ; preds = %for.inc50
  %indvars.iv.next97 = add nuw nsw i64 %indvars.iv96, 1, !dbg !833
  %exitcond99 = icmp eq i64 %indvars.iv.next97, 32, !dbg !835
  br i1 %exitcond99, label %for.end55, label %for.cond11.preheader, !dbg !837, !llvm.loop !839

for.end55:                                        ; preds = %for.inc53
  ret void, !dbg !842
}

; Function Attrs: nounwind uwtable
define void @_Z14compareResultsPfS_(float* nocapture readonly %C, float* nocapture readonly %C_outputFromGpu) local_unnamed_addr #0 !dbg !843 {
entry:
  tail call void @llvm.dbg.value(metadata float* %C, i64 0, metadata !847, metadata !605), !dbg !852
  tail call void @llvm.dbg.value(metadata float* %C_outputFromGpu, i64 0, metadata !848, metadata !605), !dbg !853
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !851, metadata !605), !dbg !854
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !849, metadata !605), !dbg !855
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !851, metadata !605), !dbg !854
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !849, metadata !605), !dbg !855
  br label %for.cond1.preheader, !dbg !856

for.cond1.preheader:                              ; preds = %middle.block, %entry
  %indvars.iv31 = phi i64 [ 0, %entry ], [ %indvars.iv.next32, %middle.block ]
  %fail.029 = phi i32 [ 0, %entry ], [ %37, %middle.block ]
  tail call void @llvm.dbg.value(metadata i32 %fail.029, i64 0, metadata !851, metadata !605), !dbg !854
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !850, metadata !605), !dbg !859
  %0 = shl i64 %indvars.iv31, 5
  %1 = insertelement <4 x i32> <i32 undef, i32 0, i32 0, i32 0>, i32 %fail.029, i32 0, !dbg !860
  br label %vector.body, !dbg !860

vector.body:                                      ; preds = %vector.body, %for.cond1.preheader
  %index = phi i64 [ 0, %for.cond1.preheader ], [ %index.next, %vector.body ], !dbg !865
  %vec.phi = phi <4 x i32> [ %1, %for.cond1.preheader ], [ %35, %vector.body ]
  %2 = add nuw nsw i64 %index, %0, !dbg !868
  %3 = getelementptr inbounds float, float* %C, i64 %2, !dbg !871
  %4 = bitcast float* %3 to <4 x float>*, !dbg !871
  %wide.load = load <4 x float>, <4 x float>* %4, align 4, !dbg !871, !tbaa !720
  %5 = getelementptr inbounds float, float* %C_outputFromGpu, i64 %2, !dbg !872
  %6 = bitcast float* %5 to <4 x float>*, !dbg !872
  %wide.load35 = load <4 x float>, <4 x float>* %6, align 4, !dbg !872, !tbaa !720
  %7 = fcmp olt <4 x float> %wide.load, zeroinitializer, !dbg !873
  %8 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %wide.load, !dbg !876
  %9 = select <4 x i1> %7, <4 x float> %8, <4 x float> %wide.load, !dbg !877
  %10 = fpext <4 x float> %9 to <4 x double>, !dbg !878
  %11 = fcmp olt <4 x double> %10, <double 1.000000e-02, double 1.000000e-02, double 1.000000e-02, double 1.000000e-02>, !dbg !879
  %12 = fcmp olt <4 x float> %wide.load35, zeroinitializer, !dbg !880
  %13 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %wide.load35, !dbg !882
  %14 = select <4 x i1> %12, <4 x float> %13, <4 x float> %wide.load35, !dbg !883
  %15 = fpext <4 x float> %14 to <4 x double>, !dbg !884
  %16 = fcmp olt <4 x double> %15, <double 1.000000e-02, double 1.000000e-02, double 1.000000e-02, double 1.000000e-02>, !dbg !885
  %17 = fsub <4 x float> %wide.load, %wide.load35, !dbg !886
  %18 = fcmp olt <4 x float> %17, zeroinitializer, !dbg !887
  %19 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %17, !dbg !889
  %20 = select <4 x i1> %18, <4 x float> %19, <4 x float> %17, !dbg !890
  %21 = fadd <4 x float> %wide.load, <float 0x3E45798EE0000000, float 0x3E45798EE0000000, float 0x3E45798EE0000000, float 0x3E45798EE0000000>, !dbg !891
  %22 = fcmp olt <4 x float> %21, zeroinitializer, !dbg !892
  %23 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %21, !dbg !894
  %24 = select <4 x i1> %22, <4 x float> %23, <4 x float> %21, !dbg !895
  %25 = fdiv <4 x float> %20, %24, !dbg !896
  %26 = fcmp olt <4 x float> %25, zeroinitializer, !dbg !897
  %27 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %25, !dbg !899
  %28 = select <4 x i1> %26, <4 x float> %27, <4 x float> %25, !dbg !900
  %29 = fmul <4 x float> %28, <float 1.000000e+02, float 1.000000e+02, float 1.000000e+02, float 1.000000e+02>, !dbg !901
  %30 = and <4 x i1> %16, %11
  %31 = fpext <4 x float> %29 to <4 x double>, !dbg !902
  %32 = select <4 x i1> %30, <4 x double> zeroinitializer, <4 x double> %31, !dbg !902
  %33 = fcmp ogt <4 x double> %32, <double 2.000000e-03, double 2.000000e-03, double 2.000000e-03, double 2.000000e-03>, !dbg !903
  %34 = zext <4 x i1> %33 to <4 x i32>, !dbg !904
  %35 = add nsw <4 x i32> %vec.phi, %34, !dbg !904
  %index.next = add i64 %index, 4, !dbg !865
  %36 = icmp eq i64 %index.next, 32, !dbg !865
  br i1 %36, label %middle.block, label %vector.body, !dbg !865, !llvm.loop !905

middle.block:                                     ; preds = %vector.body
  %rdx.shuf = shufflevector <4 x i32> %35, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>, !dbg !904
  %bin.rdx = add <4 x i32> %35, %rdx.shuf, !dbg !904
  %rdx.shuf36 = shufflevector <4 x i32> %bin.rdx, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>, !dbg !904
  %bin.rdx37 = add <4 x i32> %bin.rdx, %rdx.shuf36, !dbg !904
  %37 = extractelement <4 x i32> %bin.rdx37, i32 0, !dbg !904
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1, !dbg !908
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !851, metadata !605), !dbg !854
  %exitcond34 = icmp eq i64 %indvars.iv.next32, 32, !dbg !910
  br i1 %exitcond34, label %for.end14, label %for.cond1.preheader, !dbg !856, !llvm.loop !912

for.end14:                                        ; preds = %middle.block
  %call15 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([74 x i8], [74 x i8]* @.str.1, i64 0, i64 0), double 2.000000e-03, i32 %37), !dbg !915
  ret void, !dbg !916
}

; Function Attrs: uwtable
define void @_Z13GPU_argv_initv() local_unnamed_addr #4 !dbg !917 {
entry:
  %deviceProp = alloca %struct.cudaDeviceProp, align 8
  %0 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %deviceProp, i64 0, i32 0, i64 0, !dbg !993
  call void @llvm.lifetime.start(i64 632, i8* nonnull %0) #8, !dbg !993
  tail call void @llvm.dbg.value(metadata %struct.cudaDeviceProp* %deviceProp, i64 0, metadata !919, metadata !601), !dbg !994
  %call = call i32 @cudaGetDeviceProperties(%struct.cudaDeviceProp* nonnull %deviceProp, i32 0), !dbg !995
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.2, i64 0, i64 0), i32 0, i8* nonnull %0), !dbg !996
  %call2 = call i32 @cudaSetDevice(i32 0), !dbg !997
  call void @llvm.lifetime.end(i64 632, i8* nonnull %0) #8, !dbg !998
  ret void, !dbg !998
}

declare i32 @cudaGetDeviceProperties(%struct.cudaDeviceProp*, i32) local_unnamed_addr #5

declare i32 @cudaSetDevice(i32) local_unnamed_addr #5

; Function Attrs: uwtable
define void @_Z12syr2k_kernelPfS_S_(float* %a, float* %b, float* %c) #4 !dbg !999 {
entry:
  %a.addr = alloca float*, align 8
  %b.addr = alloca float*, align 8
  %c.addr = alloca float*, align 8
  tail call void @llvm.dbg.value(metadata float* %a, i64 0, metadata !1001, metadata !605), !dbg !1004
  store float* %a, float** %a.addr, align 8, !tbaa !1005
  tail call void @llvm.dbg.value(metadata float* %b, i64 0, metadata !1002, metadata !605), !dbg !1007
  store float* %b, float** %b.addr, align 8, !tbaa !1005
  tail call void @llvm.dbg.value(metadata float* %c, i64 0, metadata !1003, metadata !605), !dbg !1008
  store float* %c, float** %c.addr, align 8, !tbaa !1005
  %0 = bitcast float** %a.addr to i8*, !dbg !1009
  %1 = call i32 @cudaSetupArgument(i8* nonnull %0, i64 8, i64 0), !dbg !1009
  %2 = icmp eq i32 %1, 0, !dbg !1009
  br i1 %2, label %setup.next, label %setup.end, !dbg !1009

setup.next:                                       ; preds = %entry
  %3 = bitcast float** %b.addr to i8*, !dbg !1010
  %4 = call i32 @cudaSetupArgument(i8* nonnull %3, i64 8, i64 8), !dbg !1010
  %5 = icmp eq i32 %4, 0, !dbg !1010
  br i1 %5, label %setup.next1, label %setup.end, !dbg !1010

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast float** %c.addr to i8*, !dbg !1012
  %7 = call i32 @cudaSetupArgument(i8* nonnull %6, i64 8, i64 16), !dbg !1012
  %8 = icmp eq i32 %7, 0, !dbg !1012
  br i1 %8, label %setup.next2, label %setup.end, !dbg !1012

setup.next2:                                      ; preds = %setup.next1
  %9 = call i32 @cudaLaunch(i8* bitcast (void (float*, float*, float*)* @_Z12syr2k_kernelPfS_S_ to i8*)), !dbg !1014
  br label %setup.end, !dbg !1014

setup.end:                                        ; preds = %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !1016
}

declare i32 @cudaSetupArgument(i8*, i64, i64) local_unnamed_addr

declare i32 @cudaLaunch(i8*) local_unnamed_addr

; Function Attrs: uwtable
define void @_Z9syr2kCudaPfS_S_S_(float* %A, float* %B, float* %C, float* %C_outputFromGpu) local_unnamed_addr #4 !dbg !1017 {
entry:
  %a.addr.i = alloca float*, align 8
  %b.addr.i = alloca float*, align 8
  %c.addr.i = alloca float*, align 8
  %Tzp.i34 = alloca %struct.timezone, align 4
  %Tp.i35 = alloca %struct.timeval, align 8
  %Tzp.i = alloca %struct.timezone, align 4
  %Tp.i = alloca %struct.timeval, align 8
  %A_gpu = alloca float*, align 8
  %B_gpu = alloca float*, align 8
  %C_gpu = alloca float*, align 8
  tail call void @llvm.dbg.value(metadata float* %A, i64 0, metadata !1021, metadata !605), !dbg !1055
  tail call void @llvm.dbg.value(metadata float* %B, i64 0, metadata !1022, metadata !605), !dbg !1056
  tail call void @llvm.dbg.value(metadata float* %C, i64 0, metadata !1023, metadata !605), !dbg !1057
  tail call void @llvm.dbg.value(metadata float* %C_outputFromGpu, i64 0, metadata !1024, metadata !605), !dbg !1058
  %0 = bitcast float** %A_gpu to i8*, !dbg !1059
  call void @llvm.lifetime.start(i64 8, i8* nonnull %0) #8, !dbg !1059
  %1 = bitcast float** %B_gpu to i8*, !dbg !1060
  call void @llvm.lifetime.start(i64 8, i8* nonnull %1) #8, !dbg !1060
  %2 = bitcast float** %C_gpu to i8*, !dbg !1061
  call void @llvm.lifetime.start(i64 8, i8* nonnull %2) #8, !dbg !1061
  %3 = bitcast float** %A_gpu to i8**, !dbg !1062
  %call = call i32 @cudaMalloc(i8** nonnull %3, i64 4096), !dbg !1063
  %4 = bitcast float** %B_gpu to i8**, !dbg !1064
  %call1 = call i32 @cudaMalloc(i8** nonnull %4, i64 4096), !dbg !1065
  %5 = bitcast float** %C_gpu to i8**, !dbg !1066
  %call2 = call i32 @cudaMalloc(i8** nonnull %5, i64 4096), !dbg !1067
  %6 = load i8*, i8** %3, align 8, !dbg !1068, !tbaa !1005
  %7 = bitcast float* %A to i8*, !dbg !1069
  %call3 = call i32 @cudaMemcpy(i8* %6, i8* %7, i64 4096, i32 1), !dbg !1070
  %8 = load i8*, i8** %4, align 8, !dbg !1071, !tbaa !1005
  %9 = bitcast float* %B to i8*, !dbg !1072
  %call4 = call i32 @cudaMemcpy(i8* %8, i8* %9, i64 4096, i32 1), !dbg !1073
  %10 = load i8*, i8** %5, align 8, !dbg !1074, !tbaa !1005
  %11 = bitcast float* %C to i8*, !dbg !1075
  %call5 = call i32 @cudaMemcpy(i8* %10, i8* %11, i64 4096, i32 1), !dbg !1076
  call void @llvm.dbg.value(metadata %struct.dim3* undef, i64 0, metadata !1030, metadata !601), !dbg !1077
  call void @llvm.dbg.value(metadata %struct.dim3* undef, i64 0, metadata !1054, metadata !601), !dbg !1078
  %12 = bitcast %struct.timezone* %Tzp.i34 to i8*, !dbg !1079
  call void @llvm.lifetime.start(i64 8, i8* nonnull %12) #8, !dbg !1079
  %13 = bitcast %struct.timeval* %Tp.i35 to i8*, !dbg !1081
  call void @llvm.lifetime.start(i64 16, i8* nonnull %13) #8, !dbg !1081
  call void @llvm.dbg.value(metadata %struct.timezone* %Tzp.i34, i64 0, metadata !583, metadata !601) #8, !dbg !1082
  call void @llvm.dbg.value(metadata %struct.timeval* %Tp.i35, i64 0, metadata !589, metadata !601) #8, !dbg !1083
  %call.i36 = call i32 @gettimeofday(%struct.timeval* nonnull %Tp.i35, %struct.timezone* nonnull %Tzp.i34) #8, !dbg !1084
  call void @llvm.dbg.value(metadata i32 %call.i36, i64 0, metadata !598, metadata !605) #8, !dbg !1085
  %cmp.i37 = icmp eq i32 %call.i36, 0, !dbg !1086
  br i1 %cmp.i37, label %_Z7rtclockv.exit46, label %if.then.i39, !dbg !1087

if.then.i39:                                      ; preds = %entry
  %call1.i38 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str, i64 0, i64 0), i32 %call.i36) #8, !dbg !1088
  br label %_Z7rtclockv.exit46, !dbg !1088

_Z7rtclockv.exit46:                               ; preds = %entry, %if.then.i39
  %tv_sec.i40 = getelementptr inbounds %struct.timeval, %struct.timeval* %Tp.i35, i64 0, i32 0, !dbg !1089
  %14 = load i64, i64* %tv_sec.i40, align 8, !dbg !1089, !tbaa !613
  %conv.i41 = sitofp i64 %14 to double, !dbg !1090
  %tv_usec.i42 = getelementptr inbounds %struct.timeval, %struct.timeval* %Tp.i35, i64 0, i32 1, !dbg !1091
  %15 = load i64, i64* %tv_usec.i42, align 8, !dbg !1091, !tbaa !620
  %conv2.i43 = sitofp i64 %15 to double, !dbg !1092
  %mul.i44 = fmul double %conv2.i43, 1.000000e-06, !dbg !1093
  %add.i45 = fadd double %mul.i44, %conv.i41, !dbg !1094
  call void @llvm.lifetime.end(i64 16, i8* nonnull %13) #8, !dbg !1095
  call void @llvm.lifetime.end(i64 8, i8* nonnull %12) #8, !dbg !1095
  call void @llvm.dbg.value(metadata double %add.i45, i64 0, metadata !1025, metadata !605), !dbg !1096
  %call13 = call i32 @cudaConfigureCall(i64 17179869185, i32 1, i64 34359738400, i32 1, i64 0, %struct.CUstream_st* null), !dbg !1097
  %tobool = icmp eq i32 %call13, 0, !dbg !1097
  br i1 %tobool, label %kcall.configok, label %kcall.end, !dbg !1098

kcall.configok:                                   ; preds = %_Z7rtclockv.exit46
  %16 = bitcast float** %A_gpu to i64*, !dbg !1099
  %17 = load i64, i64* %16, align 8, !dbg !1099, !tbaa !1005
  %18 = bitcast float** %B_gpu to i64*, !dbg !1101
  %19 = load i64, i64* %18, align 8, !dbg !1101, !tbaa !1005
  %20 = bitcast float** %C_gpu to i64*, !dbg !1102
  %21 = load i64, i64* %20, align 8, !dbg !1102, !tbaa !1005
  %22 = bitcast float** %a.addr.i to i8*, !dbg !1103
  call void @llvm.lifetime.start(i64 8, i8* nonnull %22), !dbg !1103
  %23 = bitcast float** %b.addr.i to i8*, !dbg !1103
  call void @llvm.lifetime.start(i64 8, i8* nonnull %23), !dbg !1103
  %24 = bitcast float** %c.addr.i to i8*, !dbg !1103
  call void @llvm.lifetime.start(i64 8, i8* nonnull %24), !dbg !1103
  %25 = bitcast float** %a.addr.i to i64*
  store i64 %17, i64* %25, align 8, !tbaa !1005
  %26 = bitcast float** %b.addr.i to i64*
  store i64 %19, i64* %26, align 8, !tbaa !1005
  %27 = bitcast float** %c.addr.i to i64*
  store i64 %21, i64* %27, align 8, !tbaa !1005
  %28 = call i32 @cudaSetupArgument(i8* nonnull %22, i64 8, i64 0), !dbg !1105
  %29 = icmp eq i32 %28, 0, !dbg !1105
  br i1 %29, label %setup.next.i, label %_Z12syr2k_kernelPfS_S_.exit, !dbg !1105

setup.next.i:                                     ; preds = %kcall.configok
  %30 = call i32 @cudaSetupArgument(i8* nonnull %23, i64 8, i64 8), !dbg !1106
  %31 = icmp eq i32 %30, 0, !dbg !1106
  br i1 %31, label %setup.next1.i, label %_Z12syr2k_kernelPfS_S_.exit, !dbg !1106

setup.next1.i:                                    ; preds = %setup.next.i
  %32 = call i32 @cudaSetupArgument(i8* nonnull %24, i64 8, i64 16), !dbg !1107
  %33 = icmp eq i32 %32, 0, !dbg !1107
  br i1 %33, label %setup.next2.i, label %_Z12syr2k_kernelPfS_S_.exit, !dbg !1107

setup.next2.i:                                    ; preds = %setup.next1.i
  %34 = call i32 @cudaLaunch(i8* bitcast (void (float*, float*, float*)* @_Z12syr2k_kernelPfS_S_ to i8*)), !dbg !1108
  br label %_Z12syr2k_kernelPfS_S_.exit, !dbg !1108

_Z12syr2k_kernelPfS_S_.exit:                      ; preds = %kcall.configok, %setup.next.i, %setup.next1.i, %setup.next2.i
  call void @llvm.lifetime.end(i64 8, i8* nonnull %22), !dbg !1109
  call void @llvm.lifetime.end(i64 8, i8* nonnull %23), !dbg !1109
  call void @llvm.lifetime.end(i64 8, i8* nonnull %24), !dbg !1109
  br label %kcall.end, !dbg !1110

kcall.end:                                        ; preds = %_Z7rtclockv.exit46, %_Z12syr2k_kernelPfS_S_.exit
  %call14 = call i32 @cudaThreadSynchronize(), !dbg !1111
  %35 = bitcast %struct.timezone* %Tzp.i to i8*, !dbg !1112
  call void @llvm.lifetime.start(i64 8, i8* nonnull %35) #8, !dbg !1112
  %36 = bitcast %struct.timeval* %Tp.i to i8*, !dbg !1114
  call void @llvm.lifetime.start(i64 16, i8* nonnull %36) #8, !dbg !1114
  call void @llvm.dbg.value(metadata %struct.timezone* %Tzp.i, i64 0, metadata !583, metadata !601) #8, !dbg !1115
  call void @llvm.dbg.value(metadata %struct.timeval* %Tp.i, i64 0, metadata !589, metadata !601) #8, !dbg !1116
  %call.i = call i32 @gettimeofday(%struct.timeval* nonnull %Tp.i, %struct.timezone* nonnull %Tzp.i) #8, !dbg !1117
  call void @llvm.dbg.value(metadata i32 %call.i, i64 0, metadata !598, metadata !605) #8, !dbg !1118
  %cmp.i = icmp eq i32 %call.i, 0, !dbg !1119
  br i1 %cmp.i, label %_Z7rtclockv.exit, label %if.then.i, !dbg !1120

if.then.i:                                        ; preds = %kcall.end
  %call1.i = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str, i64 0, i64 0), i32 %call.i) #8, !dbg !1121
  br label %_Z7rtclockv.exit, !dbg !1121

_Z7rtclockv.exit:                                 ; preds = %kcall.end, %if.then.i
  %tv_sec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %Tp.i, i64 0, i32 0, !dbg !1122
  %37 = load i64, i64* %tv_sec.i, align 8, !dbg !1122, !tbaa !613
  %conv.i = sitofp i64 %37 to double, !dbg !1123
  %tv_usec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %Tp.i, i64 0, i32 1, !dbg !1124
  %38 = load i64, i64* %tv_usec.i, align 8, !dbg !1124, !tbaa !620
  %conv2.i = sitofp i64 %38 to double, !dbg !1125
  %mul.i = fmul double %conv2.i, 1.000000e-06, !dbg !1126
  %add.i = fadd double %mul.i, %conv.i, !dbg !1127
  call void @llvm.lifetime.end(i64 16, i8* nonnull %36) #8, !dbg !1128
  call void @llvm.lifetime.end(i64 8, i8* nonnull %35) #8, !dbg !1128
  call void @llvm.dbg.value(metadata double %add.i, i64 0, metadata !1026, metadata !605), !dbg !1129
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !1130, !tbaa !1005
  %sub = fsub double %add.i, %add.i45, !dbg !1131
  %call16 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %39, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.3, i64 0, i64 0), double %sub), !dbg !1132
  %40 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1133, !tbaa !1005
  %call18 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %40, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i64 0, i64 0), double %sub) #9, !dbg !1134
  %41 = bitcast float* %C_outputFromGpu to i8*, !dbg !1135
  %42 = load i8*, i8** %5, align 8, !dbg !1136, !tbaa !1005
  %call19 = call i32 @cudaMemcpy(i8* %41, i8* %42, i64 4096, i32 2), !dbg !1137
  %43 = load i8*, i8** %3, align 8, !dbg !1138, !tbaa !1005
  %call20 = call i32 @cudaFree(i8* %43), !dbg !1139
  %44 = load i8*, i8** %4, align 8, !dbg !1140, !tbaa !1005
  %call21 = call i32 @cudaFree(i8* %44), !dbg !1141
  %45 = load i8*, i8** %5, align 8, !dbg !1142, !tbaa !1005
  %call22 = call i32 @cudaFree(i8* %45), !dbg !1143
  call void @llvm.lifetime.end(i64 8, i8* nonnull %2) #8, !dbg !1144
  call void @llvm.lifetime.end(i64 8, i8* nonnull %1) #8, !dbg !1144
  call void @llvm.lifetime.end(i64 8, i8* nonnull %0) #8, !dbg !1144
  ret void, !dbg !1144
}

declare i32 @cudaMalloc(i8**, i64) local_unnamed_addr #5

declare i32 @cudaMemcpy(i8*, i8*, i64, i32) local_unnamed_addr #5

declare i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) local_unnamed_addr #5

declare i32 @cudaThreadSynchronize() local_unnamed_addr #5

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

declare i32 @cudaFree(i8*) local_unnamed_addr #5

; Function Attrs: norecurse uwtable
define i32 @main() local_unnamed_addr #6 !dbg !1145 {
entry:
  %Tzp.i42 = alloca %struct.timezone, align 4
  %Tp.i43 = alloca %struct.timeval, align 8
  %Tzp.i = alloca %struct.timezone, align 4
  %Tp.i = alloca %struct.timeval, align 8
  %deviceProp.i = alloca %struct.cudaDeviceProp, align 8
  %call = tail call noalias i8* @malloc(i64 4096) #8, !dbg !1153
  %0 = bitcast i8* %call to float*, !dbg !1154
  tail call void @llvm.dbg.value(metadata float* %0, i64 0, metadata !1149, metadata !605), !dbg !1155
  %call1 = tail call noalias i8* @malloc(i64 4096) #8, !dbg !1156
  %1 = bitcast i8* %call1 to float*, !dbg !1157
  tail call void @llvm.dbg.value(metadata float* %1, i64 0, metadata !1150, metadata !605), !dbg !1158
  %call2 = tail call noalias i8* @malloc(i64 4096) #8, !dbg !1159
  %2 = bitcast i8* %call2 to float*, !dbg !1160
  tail call void @llvm.dbg.value(metadata float* %2, i64 0, metadata !1151, metadata !605), !dbg !1161
  %call3 = tail call noalias i8* @malloc(i64 4096) #8, !dbg !1162
  tail call void @llvm.dbg.value(metadata float* %123, i64 0, metadata !1152, metadata !605), !dbg !1163
  tail call void @llvm.dbg.value(metadata float* %0, i64 0, metadata !695, metadata !605), !dbg !1164
  tail call void @llvm.dbg.value(metadata float* %1, i64 0, metadata !696, metadata !605), !dbg !1166
  tail call void @llvm.dbg.value(metadata float* %2, i64 0, metadata !697, metadata !605), !dbg !1167
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !698, metadata !605), !dbg !1168
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !698, metadata !605), !dbg !1168
  br label %for.cond1.preheader.i, !dbg !1169

for.cond1.preheader.i:                            ; preds = %vector.body, %entry
  %indvars.iv58.i = phi i64 [ 0, %entry ], [ %indvars.iv.next59.i, %vector.body ]
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !699, metadata !605), !dbg !1170
  %3 = trunc i64 %indvars.iv58.i to i32
  %conv.i = sitofp i32 %3 to float
  %4 = shl i64 %indvars.iv58.i, 5
  %broadcast.splatinsert70 = insertelement <4 x float> undef, float %conv.i, i32 0, !dbg !1171
  %broadcast.splat71 = shufflevector <4 x float> %broadcast.splatinsert70, <4 x float> undef, <4 x i32> zeroinitializer, !dbg !1171
  br label %vector.body57, !dbg !1171

vector.body57:                                    ; preds = %for.cond1.preheader.i
  %5 = fmul <4 x float> %broadcast.splat71, <float 0.000000e+00, float 1.000000e+00, float 2.000000e+00, float 3.000000e+00>, !dbg !1172
  %6 = fadd <4 x float> %5, <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>, !dbg !1173
  %7 = fmul <4 x float> %6, <float 3.125000e-02, float 3.125000e-02, float 3.125000e-02, float 3.125000e-02>, !dbg !1174
  %8 = getelementptr inbounds float, float* %2, i64 %4, !dbg !1175
  %9 = bitcast float* %8 to <4 x float>*, !dbg !1176
  store <4 x float> %7, <4 x float>* %9, align 4, !dbg !1176, !tbaa !720
  %10 = fmul <4 x float> %broadcast.splat71, <float 4.000000e+00, float 5.000000e+00, float 6.000000e+00, float 7.000000e+00>, !dbg !1172
  %11 = fadd <4 x float> %10, <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>, !dbg !1173
  %12 = fmul <4 x float> %11, <float 3.125000e-02, float 3.125000e-02, float 3.125000e-02, float 3.125000e-02>, !dbg !1174
  %13 = or i64 %4, 4, !dbg !1177
  %14 = getelementptr inbounds float, float* %2, i64 %13, !dbg !1175
  %15 = bitcast float* %14 to <4 x float>*, !dbg !1176
  store <4 x float> %12, <4 x float>* %15, align 4, !dbg !1176, !tbaa !720
  %16 = fmul <4 x float> %broadcast.splat71, <float 8.000000e+00, float 9.000000e+00, float 1.000000e+01, float 1.100000e+01>, !dbg !1172
  %17 = fadd <4 x float> %16, <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>, !dbg !1173
  %18 = fmul <4 x float> %17, <float 3.125000e-02, float 3.125000e-02, float 3.125000e-02, float 3.125000e-02>, !dbg !1174
  %19 = or i64 %4, 8, !dbg !1177
  %20 = getelementptr inbounds float, float* %2, i64 %19, !dbg !1175
  %21 = bitcast float* %20 to <4 x float>*, !dbg !1176
  store <4 x float> %18, <4 x float>* %21, align 4, !dbg !1176, !tbaa !720
  %22 = fmul <4 x float> %broadcast.splat71, <float 1.200000e+01, float 1.300000e+01, float 1.400000e+01, float 1.500000e+01>, !dbg !1172
  %23 = fadd <4 x float> %22, <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>, !dbg !1173
  %24 = fmul <4 x float> %23, <float 3.125000e-02, float 3.125000e-02, float 3.125000e-02, float 3.125000e-02>, !dbg !1174
  %25 = or i64 %4, 12, !dbg !1177
  %26 = getelementptr inbounds float, float* %2, i64 %25, !dbg !1175
  %27 = bitcast float* %26 to <4 x float>*, !dbg !1176
  store <4 x float> %24, <4 x float>* %27, align 4, !dbg !1176, !tbaa !720
  %28 = fmul <4 x float> %broadcast.splat71, <float 1.600000e+01, float 1.700000e+01, float 1.800000e+01, float 1.900000e+01>, !dbg !1172
  %29 = fadd <4 x float> %28, <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>, !dbg !1173
  %30 = fmul <4 x float> %29, <float 3.125000e-02, float 3.125000e-02, float 3.125000e-02, float 3.125000e-02>, !dbg !1174
  %31 = or i64 %4, 16, !dbg !1177
  %32 = getelementptr inbounds float, float* %2, i64 %31, !dbg !1175
  %33 = bitcast float* %32 to <4 x float>*, !dbg !1176
  store <4 x float> %30, <4 x float>* %33, align 4, !dbg !1176, !tbaa !720
  %34 = fmul <4 x float> %broadcast.splat71, <float 2.000000e+01, float 2.100000e+01, float 2.200000e+01, float 2.300000e+01>, !dbg !1172
  %35 = fadd <4 x float> %34, <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>, !dbg !1173
  %36 = fmul <4 x float> %35, <float 3.125000e-02, float 3.125000e-02, float 3.125000e-02, float 3.125000e-02>, !dbg !1174
  %37 = or i64 %4, 20, !dbg !1177
  %38 = getelementptr inbounds float, float* %2, i64 %37, !dbg !1175
  %39 = bitcast float* %38 to <4 x float>*, !dbg !1176
  store <4 x float> %36, <4 x float>* %39, align 4, !dbg !1176, !tbaa !720
  %40 = fmul <4 x float> %broadcast.splat71, <float 2.400000e+01, float 2.500000e+01, float 2.600000e+01, float 2.700000e+01>, !dbg !1172
  %41 = fadd <4 x float> %40, <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>, !dbg !1173
  %42 = fmul <4 x float> %41, <float 3.125000e-02, float 3.125000e-02, float 3.125000e-02, float 3.125000e-02>, !dbg !1174
  %43 = or i64 %4, 24, !dbg !1177
  %44 = getelementptr inbounds float, float* %2, i64 %43, !dbg !1175
  %45 = bitcast float* %44 to <4 x float>*, !dbg !1176
  store <4 x float> %42, <4 x float>* %45, align 4, !dbg !1176, !tbaa !720
  %46 = fmul <4 x float> %broadcast.splat71, <float 2.800000e+01, float 2.900000e+01, float 3.000000e+01, float 3.100000e+01>, !dbg !1172
  %47 = fadd <4 x float> %46, <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>, !dbg !1173
  %48 = fmul <4 x float> %47, <float 3.125000e-02, float 3.125000e-02, float 3.125000e-02, float 3.125000e-02>, !dbg !1174
  %49 = or i64 %4, 28, !dbg !1177
  %50 = getelementptr inbounds float, float* %2, i64 %49, !dbg !1175
  %51 = bitcast float* %50 to <4 x float>*, !dbg !1176
  store <4 x float> %48, <4 x float>* %51, align 4, !dbg !1176, !tbaa !720
  %broadcast.splatinsert = insertelement <4 x float> undef, float %conv.i, i32 0, !dbg !1178
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> undef, <4 x i32> zeroinitializer, !dbg !1178
  br label %vector.body, !dbg !1178

vector.body:                                      ; preds = %vector.body57
  %52 = fmul <4 x float> %broadcast.splat, <float 0.000000e+00, float 1.000000e+00, float 2.000000e+00, float 3.000000e+00>, !dbg !1179
  %53 = fmul <4 x float> %52, <float 3.125000e-02, float 3.125000e-02, float 3.125000e-02, float 3.125000e-02>, !dbg !1180
  %54 = getelementptr inbounds float, float* %0, i64 %4, !dbg !1181
  %55 = bitcast float* %54 to <4 x float>*, !dbg !1182
  store <4 x float> %53, <4 x float>* %55, align 4, !dbg !1182, !tbaa !720
  %56 = fadd <4 x float> %52, <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, !dbg !1183
  %57 = fmul <4 x float> %56, <float 3.125000e-02, float 3.125000e-02, float 3.125000e-02, float 3.125000e-02>, !dbg !1184
  %58 = getelementptr inbounds float, float* %1, i64 %4, !dbg !1185
  %59 = bitcast float* %58 to <4 x float>*, !dbg !1186
  store <4 x float> %57, <4 x float>* %59, align 4, !dbg !1186, !tbaa !720
  %60 = fmul <4 x float> %broadcast.splat, <float 4.000000e+00, float 5.000000e+00, float 6.000000e+00, float 7.000000e+00>, !dbg !1179
  %61 = fmul <4 x float> %60, <float 3.125000e-02, float 3.125000e-02, float 3.125000e-02, float 3.125000e-02>, !dbg !1180
  %62 = or i64 %4, 4, !dbg !1187
  %63 = getelementptr inbounds float, float* %0, i64 %62, !dbg !1181
  %64 = bitcast float* %63 to <4 x float>*, !dbg !1182
  store <4 x float> %61, <4 x float>* %64, align 4, !dbg !1182, !tbaa !720
  %65 = fadd <4 x float> %60, <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, !dbg !1183
  %66 = fmul <4 x float> %65, <float 3.125000e-02, float 3.125000e-02, float 3.125000e-02, float 3.125000e-02>, !dbg !1184
  %67 = getelementptr inbounds float, float* %1, i64 %62, !dbg !1185
  %68 = bitcast float* %67 to <4 x float>*, !dbg !1186
  store <4 x float> %66, <4 x float>* %68, align 4, !dbg !1186, !tbaa !720
  %69 = fmul <4 x float> %broadcast.splat, <float 8.000000e+00, float 9.000000e+00, float 1.000000e+01, float 1.100000e+01>, !dbg !1179
  %70 = fmul <4 x float> %69, <float 3.125000e-02, float 3.125000e-02, float 3.125000e-02, float 3.125000e-02>, !dbg !1180
  %71 = or i64 %4, 8, !dbg !1187
  %72 = getelementptr inbounds float, float* %0, i64 %71, !dbg !1181
  %73 = bitcast float* %72 to <4 x float>*, !dbg !1182
  store <4 x float> %70, <4 x float>* %73, align 4, !dbg !1182, !tbaa !720
  %74 = fadd <4 x float> %69, <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, !dbg !1183
  %75 = fmul <4 x float> %74, <float 3.125000e-02, float 3.125000e-02, float 3.125000e-02, float 3.125000e-02>, !dbg !1184
  %76 = getelementptr inbounds float, float* %1, i64 %71, !dbg !1185
  %77 = bitcast float* %76 to <4 x float>*, !dbg !1186
  store <4 x float> %75, <4 x float>* %77, align 4, !dbg !1186, !tbaa !720
  %78 = fmul <4 x float> %broadcast.splat, <float 1.200000e+01, float 1.300000e+01, float 1.400000e+01, float 1.500000e+01>, !dbg !1179
  %79 = fmul <4 x float> %78, <float 3.125000e-02, float 3.125000e-02, float 3.125000e-02, float 3.125000e-02>, !dbg !1180
  %80 = or i64 %4, 12, !dbg !1187
  %81 = getelementptr inbounds float, float* %0, i64 %80, !dbg !1181
  %82 = bitcast float* %81 to <4 x float>*, !dbg !1182
  store <4 x float> %79, <4 x float>* %82, align 4, !dbg !1182, !tbaa !720
  %83 = fadd <4 x float> %78, <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, !dbg !1183
  %84 = fmul <4 x float> %83, <float 3.125000e-02, float 3.125000e-02, float 3.125000e-02, float 3.125000e-02>, !dbg !1184
  %85 = getelementptr inbounds float, float* %1, i64 %80, !dbg !1185
  %86 = bitcast float* %85 to <4 x float>*, !dbg !1186
  store <4 x float> %84, <4 x float>* %86, align 4, !dbg !1186, !tbaa !720
  %87 = fmul <4 x float> %broadcast.splat, <float 1.600000e+01, float 1.700000e+01, float 1.800000e+01, float 1.900000e+01>, !dbg !1179
  %88 = fmul <4 x float> %87, <float 3.125000e-02, float 3.125000e-02, float 3.125000e-02, float 3.125000e-02>, !dbg !1180
  %89 = or i64 %4, 16, !dbg !1187
  %90 = getelementptr inbounds float, float* %0, i64 %89, !dbg !1181
  %91 = bitcast float* %90 to <4 x float>*, !dbg !1182
  store <4 x float> %88, <4 x float>* %91, align 4, !dbg !1182, !tbaa !720
  %92 = fadd <4 x float> %87, <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, !dbg !1183
  %93 = fmul <4 x float> %92, <float 3.125000e-02, float 3.125000e-02, float 3.125000e-02, float 3.125000e-02>, !dbg !1184
  %94 = getelementptr inbounds float, float* %1, i64 %89, !dbg !1185
  %95 = bitcast float* %94 to <4 x float>*, !dbg !1186
  store <4 x float> %93, <4 x float>* %95, align 4, !dbg !1186, !tbaa !720
  %96 = fmul <4 x float> %broadcast.splat, <float 2.000000e+01, float 2.100000e+01, float 2.200000e+01, float 2.300000e+01>, !dbg !1179
  %97 = fmul <4 x float> %96, <float 3.125000e-02, float 3.125000e-02, float 3.125000e-02, float 3.125000e-02>, !dbg !1180
  %98 = or i64 %4, 20, !dbg !1187
  %99 = getelementptr inbounds float, float* %0, i64 %98, !dbg !1181
  %100 = bitcast float* %99 to <4 x float>*, !dbg !1182
  store <4 x float> %97, <4 x float>* %100, align 4, !dbg !1182, !tbaa !720
  %101 = fadd <4 x float> %96, <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, !dbg !1183
  %102 = fmul <4 x float> %101, <float 3.125000e-02, float 3.125000e-02, float 3.125000e-02, float 3.125000e-02>, !dbg !1184
  %103 = getelementptr inbounds float, float* %1, i64 %98, !dbg !1185
  %104 = bitcast float* %103 to <4 x float>*, !dbg !1186
  store <4 x float> %102, <4 x float>* %104, align 4, !dbg !1186, !tbaa !720
  %105 = fmul <4 x float> %broadcast.splat, <float 2.400000e+01, float 2.500000e+01, float 2.600000e+01, float 2.700000e+01>, !dbg !1179
  %106 = fmul <4 x float> %105, <float 3.125000e-02, float 3.125000e-02, float 3.125000e-02, float 3.125000e-02>, !dbg !1180
  %107 = or i64 %4, 24, !dbg !1187
  %108 = getelementptr inbounds float, float* %0, i64 %107, !dbg !1181
  %109 = bitcast float* %108 to <4 x float>*, !dbg !1182
  store <4 x float> %106, <4 x float>* %109, align 4, !dbg !1182, !tbaa !720
  %110 = fadd <4 x float> %105, <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, !dbg !1183
  %111 = fmul <4 x float> %110, <float 3.125000e-02, float 3.125000e-02, float 3.125000e-02, float 3.125000e-02>, !dbg !1184
  %112 = getelementptr inbounds float, float* %1, i64 %107, !dbg !1185
  %113 = bitcast float* %112 to <4 x float>*, !dbg !1186
  store <4 x float> %111, <4 x float>* %113, align 4, !dbg !1186, !tbaa !720
  %114 = fmul <4 x float> %broadcast.splat, <float 2.800000e+01, float 2.900000e+01, float 3.000000e+01, float 3.100000e+01>, !dbg !1179
  %115 = fmul <4 x float> %114, <float 3.125000e-02, float 3.125000e-02, float 3.125000e-02, float 3.125000e-02>, !dbg !1180
  %116 = or i64 %4, 28, !dbg !1187
  %117 = getelementptr inbounds float, float* %0, i64 %116, !dbg !1181
  %118 = bitcast float* %117 to <4 x float>*, !dbg !1182
  store <4 x float> %115, <4 x float>* %118, align 4, !dbg !1182, !tbaa !720
  %119 = fadd <4 x float> %114, <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, !dbg !1183
  %120 = fmul <4 x float> %119, <float 3.125000e-02, float 3.125000e-02, float 3.125000e-02, float 3.125000e-02>, !dbg !1184
  %121 = getelementptr inbounds float, float* %1, i64 %116, !dbg !1185
  %122 = bitcast float* %121 to <4 x float>*, !dbg !1186
  store <4 x float> %120, <4 x float>* %122, align 4, !dbg !1186, !tbaa !720
  %indvars.iv.next59.i = add nuw nsw i64 %indvars.iv58.i, 1, !dbg !1188
  %exitcond62.i = icmp eq i64 %indvars.iv.next59.i, 32, !dbg !1189
  br i1 %exitcond62.i, label %_Z11init_arraysPfS_S_.exit, label %for.cond1.preheader.i, !dbg !1169, !llvm.loop !756

_Z11init_arraysPfS_S_.exit:                       ; preds = %vector.body
  %123 = bitcast i8* %call3 to float*, !dbg !1190
  %124 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %deviceProp.i, i64 0, i32 0, i64 0, !dbg !1191
  call void @llvm.lifetime.start(i64 632, i8* nonnull %124) #8, !dbg !1191
  tail call void @llvm.dbg.value(metadata %struct.cudaDeviceProp* %deviceProp.i, i64 0, metadata !919, metadata !601), !dbg !1193
  %call.i = call i32 @cudaGetDeviceProperties(%struct.cudaDeviceProp* nonnull %deviceProp.i, i32 0), !dbg !1194
  %call1.i = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.2, i64 0, i64 0), i32 0, i8* nonnull %124), !dbg !1195
  %call2.i = call i32 @cudaSetDevice(i32 0), !dbg !1196
  call void @llvm.lifetime.end(i64 632, i8* nonnull %124) #8, !dbg !1197
  call void @_Z9syr2kCudaPfS_S_S_(float* nonnull %0, float* nonnull %1, float* %2, float* %123), !dbg !1198
  %125 = bitcast %struct.timezone* %Tzp.i to i8*, !dbg !1199
  call void @llvm.lifetime.start(i64 8, i8* nonnull %125) #8, !dbg !1199
  %126 = bitcast %struct.timeval* %Tp.i to i8*, !dbg !1201
  call void @llvm.lifetime.start(i64 16, i8* nonnull %126) #8, !dbg !1201
  call void @llvm.dbg.value(metadata %struct.timezone* %Tzp.i, i64 0, metadata !583, metadata !601) #8, !dbg !1202
  call void @llvm.dbg.value(metadata %struct.timeval* %Tp.i, i64 0, metadata !589, metadata !601) #8, !dbg !1203
  %call.i31 = call i32 @gettimeofday(%struct.timeval* nonnull %Tp.i, %struct.timezone* nonnull %Tzp.i) #8, !dbg !1204
  call void @llvm.dbg.value(metadata i32 %call.i31, i64 0, metadata !598, metadata !605) #8, !dbg !1205
  %cmp.i = icmp eq i32 %call.i31, 0, !dbg !1206
  br i1 %cmp.i, label %_Z7rtclockv.exit, label %if.then.i, !dbg !1207

if.then.i:                                        ; preds = %_Z11init_arraysPfS_S_.exit
  %call1.i32 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str, i64 0, i64 0), i32 %call.i31) #8, !dbg !1208
  br label %_Z7rtclockv.exit, !dbg !1208

_Z7rtclockv.exit:                                 ; preds = %_Z11init_arraysPfS_S_.exit, %if.then.i
  %tv_sec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %Tp.i, i64 0, i32 0, !dbg !1209
  %127 = load i64, i64* %tv_sec.i, align 8, !dbg !1209, !tbaa !613
  %tv_usec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %Tp.i, i64 0, i32 1, !dbg !1210
  %128 = load i64, i64* %tv_usec.i, align 8, !dbg !1210, !tbaa !620
  %conv2.i = sitofp i64 %128 to double, !dbg !1211
  %mul.i34 = fmul double %conv2.i, 1.000000e-06, !dbg !1212
  call void @llvm.lifetime.end(i64 16, i8* nonnull %126) #8, !dbg !1213
  call void @llvm.lifetime.end(i64 8, i8* nonnull %125) #8, !dbg !1213
  call void @llvm.dbg.value(metadata double %add.i35, i64 0, metadata !1147, metadata !605), !dbg !1214
  tail call void @llvm.dbg.value(metadata float* %0, i64 0, metadata !762, metadata !605), !dbg !1215
  tail call void @llvm.dbg.value(metadata float* %1, i64 0, metadata !763, metadata !605), !dbg !1217
  tail call void @llvm.dbg.value(metadata float* %2, i64 0, metadata !764, metadata !605), !dbg !1218
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !765, metadata !605), !dbg !1219
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !765, metadata !605), !dbg !1219
  br label %for.cond1.preheader.i36, !dbg !1220

for.cond1.preheader.i36:                          ; preds = %vector.body72, %_Z7rtclockv.exit
  %indvars.iv104.i = phi i64 [ 0, %_Z7rtclockv.exit ], [ %indvars.iv.next105.i, %vector.body72 ]
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !766, metadata !605), !dbg !1221
  %129 = shl i64 %indvars.iv104.i, 5
  br label %vector.body72, !dbg !1222

vector.body72:                                    ; preds = %for.cond1.preheader.i36
  %130 = getelementptr inbounds float, float* %2, i64 %129, !dbg !1223
  %131 = bitcast float* %130 to <4 x float>*, !dbg !1224
  %wide.load = load <4 x float>, <4 x float>* %131, align 4, !dbg !1224, !tbaa !720
  %132 = fmul <4 x float> %wide.load, <float 4.546000e+03, float 4.546000e+03, float 4.546000e+03, float 4.546000e+03>, !dbg !1224
  %133 = bitcast float* %130 to <4 x float>*, !dbg !1224
  store <4 x float> %132, <4 x float>* %133, align 4, !dbg !1224, !tbaa !720
  %134 = or i64 %129, 4, !dbg !1225
  %135 = getelementptr inbounds float, float* %2, i64 %134, !dbg !1223
  %136 = bitcast float* %135 to <4 x float>*, !dbg !1224
  %wide.load.1 = load <4 x float>, <4 x float>* %136, align 4, !dbg !1224, !tbaa !720
  %137 = fmul <4 x float> %wide.load.1, <float 4.546000e+03, float 4.546000e+03, float 4.546000e+03, float 4.546000e+03>, !dbg !1224
  %138 = bitcast float* %135 to <4 x float>*, !dbg !1224
  store <4 x float> %137, <4 x float>* %138, align 4, !dbg !1224, !tbaa !720
  %139 = or i64 %129, 8, !dbg !1225
  %140 = getelementptr inbounds float, float* %2, i64 %139, !dbg !1223
  %141 = bitcast float* %140 to <4 x float>*, !dbg !1224
  %wide.load.2 = load <4 x float>, <4 x float>* %141, align 4, !dbg !1224, !tbaa !720
  %142 = fmul <4 x float> %wide.load.2, <float 4.546000e+03, float 4.546000e+03, float 4.546000e+03, float 4.546000e+03>, !dbg !1224
  %143 = bitcast float* %140 to <4 x float>*, !dbg !1224
  store <4 x float> %142, <4 x float>* %143, align 4, !dbg !1224, !tbaa !720
  %144 = or i64 %129, 12, !dbg !1225
  %145 = getelementptr inbounds float, float* %2, i64 %144, !dbg !1223
  %146 = bitcast float* %145 to <4 x float>*, !dbg !1224
  %wide.load.3 = load <4 x float>, <4 x float>* %146, align 4, !dbg !1224, !tbaa !720
  %147 = fmul <4 x float> %wide.load.3, <float 4.546000e+03, float 4.546000e+03, float 4.546000e+03, float 4.546000e+03>, !dbg !1224
  %148 = bitcast float* %145 to <4 x float>*, !dbg !1224
  store <4 x float> %147, <4 x float>* %148, align 4, !dbg !1224, !tbaa !720
  %149 = or i64 %129, 16, !dbg !1225
  %150 = getelementptr inbounds float, float* %2, i64 %149, !dbg !1223
  %151 = bitcast float* %150 to <4 x float>*, !dbg !1224
  %wide.load.4 = load <4 x float>, <4 x float>* %151, align 4, !dbg !1224, !tbaa !720
  %152 = fmul <4 x float> %wide.load.4, <float 4.546000e+03, float 4.546000e+03, float 4.546000e+03, float 4.546000e+03>, !dbg !1224
  %153 = bitcast float* %150 to <4 x float>*, !dbg !1224
  store <4 x float> %152, <4 x float>* %153, align 4, !dbg !1224, !tbaa !720
  %154 = or i64 %129, 20, !dbg !1225
  %155 = getelementptr inbounds float, float* %2, i64 %154, !dbg !1223
  %156 = bitcast float* %155 to <4 x float>*, !dbg !1224
  %wide.load.5 = load <4 x float>, <4 x float>* %156, align 4, !dbg !1224, !tbaa !720
  %157 = fmul <4 x float> %wide.load.5, <float 4.546000e+03, float 4.546000e+03, float 4.546000e+03, float 4.546000e+03>, !dbg !1224
  %158 = bitcast float* %155 to <4 x float>*, !dbg !1224
  store <4 x float> %157, <4 x float>* %158, align 4, !dbg !1224, !tbaa !720
  %159 = or i64 %129, 24, !dbg !1225
  %160 = getelementptr inbounds float, float* %2, i64 %159, !dbg !1223
  %161 = bitcast float* %160 to <4 x float>*, !dbg !1224
  %wide.load.6 = load <4 x float>, <4 x float>* %161, align 4, !dbg !1224, !tbaa !720
  %162 = fmul <4 x float> %wide.load.6, <float 4.546000e+03, float 4.546000e+03, float 4.546000e+03, float 4.546000e+03>, !dbg !1224
  %163 = bitcast float* %160 to <4 x float>*, !dbg !1224
  store <4 x float> %162, <4 x float>* %163, align 4, !dbg !1224, !tbaa !720
  %164 = or i64 %129, 28, !dbg !1225
  %165 = getelementptr inbounds float, float* %2, i64 %164, !dbg !1223
  %166 = bitcast float* %165 to <4 x float>*, !dbg !1224
  %wide.load.7 = load <4 x float>, <4 x float>* %166, align 4, !dbg !1224, !tbaa !720
  %167 = fmul <4 x float> %wide.load.7, <float 4.546000e+03, float 4.546000e+03, float 4.546000e+03, float 4.546000e+03>, !dbg !1224
  %168 = bitcast float* %165 to <4 x float>*, !dbg !1224
  store <4 x float> %167, <4 x float>* %168, align 4, !dbg !1224, !tbaa !720
  %indvars.iv.next105.i = add nuw nsw i64 %indvars.iv104.i, 1, !dbg !1226
  %exitcond107.i = icmp eq i64 %indvars.iv.next105.i, 32, !dbg !1227
  br i1 %exitcond107.i, label %for.cond11.preheader.i.preheader, label %for.cond1.preheader.i36, !dbg !1220, !llvm.loop !790

for.cond11.preheader.i.preheader:                 ; preds = %vector.body72
  %conv.i33 = sitofp i64 %127 to double, !dbg !1228
  %add.i35 = fadd double %mul.i34, %conv.i33, !dbg !1229
  br label %for.cond11.preheader.i, !dbg !1221

for.cond11.preheader.i:                           ; preds = %for.cond11.preheader.i.preheader, %for.inc53.i
  %indvars.iv96.i = phi i64 [ %indvars.iv.next97.i, %for.inc53.i ], [ 0, %for.cond11.preheader.i.preheader ]
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !766, metadata !605), !dbg !1221
  %169 = shl nsw i64 %indvars.iv96.i, 5
  br label %for.cond14.preheader.i, !dbg !1230

for.cond14.preheader.i:                           ; preds = %for.inc50.i, %for.cond11.preheader.i
  %indvars.iv91.i = phi i64 [ 0, %for.cond11.preheader.i ], [ %indvars.iv.next92.i, %for.inc50.i ]
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !767, metadata !605), !dbg !1231
  %170 = shl i64 %indvars.iv91.i, 5
  %171 = add nuw nsw i64 %indvars.iv91.i, %169
  %arrayidx30.i = getelementptr inbounds float, float* %2, i64 %171
  %.pre.i = load float, float* %arrayidx30.i, align 4, !tbaa !720
  br label %for.body16.i, !dbg !1232

for.body16.i:                                     ; preds = %for.body16.i, %for.cond14.preheader.i
  %172 = phi float [ %.pre.i, %for.cond14.preheader.i ], [ %add46.i.1, %for.body16.i ], !dbg !1233
  %indvars.iv.i39 = phi i64 [ 0, %for.cond14.preheader.i ], [ %indvars.iv.next.i40.1, %for.body16.i ]
  %173 = add nuw nsw i64 %indvars.iv.i39, %169, !dbg !1234
  %arrayidx20.i = getelementptr inbounds float, float* %0, i64 %173, !dbg !1235
  %174 = load float, float* %arrayidx20.i, align 4, !dbg !1235, !tbaa !720
  %mul21.i = fmul float %174, 1.243500e+04, !dbg !1236
  %175 = add nuw nsw i64 %indvars.iv.i39, %170, !dbg !1237
  %arrayidx25.i = getelementptr inbounds float, float* %1, i64 %175, !dbg !1238
  %176 = load float, float* %arrayidx25.i, align 4, !dbg !1238, !tbaa !720
  %mul26.i = fmul float %mul21.i, %176, !dbg !1239
  %add31.i = fadd float %172, %mul26.i, !dbg !1233
  %arrayidx35.i = getelementptr inbounds float, float* %1, i64 %173, !dbg !1240
  %177 = load float, float* %arrayidx35.i, align 4, !dbg !1240, !tbaa !720
  %mul36.i = fmul float %177, 1.243500e+04, !dbg !1241
  %arrayidx40.i = getelementptr inbounds float, float* %0, i64 %175, !dbg !1242
  %178 = load float, float* %arrayidx40.i, align 4, !dbg !1242, !tbaa !720
  %mul41.i = fmul float %mul36.i, %178, !dbg !1243
  %add46.i = fadd float %add31.i, %mul41.i, !dbg !1244
  %indvars.iv.next.i40 = or i64 %indvars.iv.i39, 1, !dbg !1245
  %179 = add nuw nsw i64 %indvars.iv.next.i40, %169, !dbg !1234
  %arrayidx20.i.1 = getelementptr inbounds float, float* %0, i64 %179, !dbg !1235
  %180 = load float, float* %arrayidx20.i.1, align 4, !dbg !1235, !tbaa !720
  %mul21.i.1 = fmul float %180, 1.243500e+04, !dbg !1236
  %181 = add nuw nsw i64 %indvars.iv.next.i40, %170, !dbg !1237
  %arrayidx25.i.1 = getelementptr inbounds float, float* %1, i64 %181, !dbg !1238
  %182 = load float, float* %arrayidx25.i.1, align 4, !dbg !1238, !tbaa !720
  %mul26.i.1 = fmul float %mul21.i.1, %182, !dbg !1239
  %add31.i.1 = fadd float %add46.i, %mul26.i.1, !dbg !1233
  %arrayidx35.i.1 = getelementptr inbounds float, float* %1, i64 %179, !dbg !1240
  %183 = load float, float* %arrayidx35.i.1, align 4, !dbg !1240, !tbaa !720
  %mul36.i.1 = fmul float %183, 1.243500e+04, !dbg !1241
  %arrayidx40.i.1 = getelementptr inbounds float, float* %0, i64 %181, !dbg !1242
  %184 = load float, float* %arrayidx40.i.1, align 4, !dbg !1242, !tbaa !720
  %mul41.i.1 = fmul float %mul36.i.1, %184, !dbg !1243
  %add46.i.1 = fadd float %add31.i.1, %mul41.i.1, !dbg !1244
  %indvars.iv.next.i40.1 = add nsw i64 %indvars.iv.i39, 2, !dbg !1245
  %exitcond.i41.1 = icmp eq i64 %indvars.iv.next.i40.1, 32, !dbg !1246
  br i1 %exitcond.i41.1, label %for.inc50.i, label %for.body16.i, !dbg !1232, !llvm.loop !823

for.inc50.i:                                      ; preds = %for.body16.i
  store float %add46.i.1, float* %arrayidx30.i, align 4, !dbg !1244, !tbaa !720
  %indvars.iv.next92.i = add nuw nsw i64 %indvars.iv91.i, 1, !dbg !1247
  %exitcond95.i = icmp eq i64 %indvars.iv.next92.i, 32, !dbg !1248
  br i1 %exitcond95.i, label %for.inc53.i, label %for.cond14.preheader.i, !dbg !1230, !llvm.loop !830

for.inc53.i:                                      ; preds = %for.inc50.i
  %indvars.iv.next97.i = add nuw nsw i64 %indvars.iv96.i, 1, !dbg !1249
  %exitcond99.i = icmp eq i64 %indvars.iv.next97.i, 32, !dbg !1250
  br i1 %exitcond99.i, label %_Z5syr2kPfS_S_.exit, label %for.cond11.preheader.i, !dbg !1251, !llvm.loop !839

_Z5syr2kPfS_S_.exit:                              ; preds = %for.inc53.i
  %185 = bitcast %struct.timezone* %Tzp.i42 to i8*, !dbg !1252
  call void @llvm.lifetime.start(i64 8, i8* nonnull %185) #8, !dbg !1252
  %186 = bitcast %struct.timeval* %Tp.i43 to i8*, !dbg !1254
  call void @llvm.lifetime.start(i64 16, i8* nonnull %186) #8, !dbg !1254
  call void @llvm.dbg.value(metadata %struct.timezone* %Tzp.i42, i64 0, metadata !583, metadata !601) #8, !dbg !1255
  call void @llvm.dbg.value(metadata %struct.timeval* %Tp.i43, i64 0, metadata !589, metadata !601) #8, !dbg !1256
  %call.i44 = call i32 @gettimeofday(%struct.timeval* nonnull %Tp.i43, %struct.timezone* nonnull %Tzp.i42) #8, !dbg !1257
  call void @llvm.dbg.value(metadata i32 %call.i44, i64 0, metadata !598, metadata !605) #8, !dbg !1258
  %cmp.i45 = icmp eq i32 %call.i44, 0, !dbg !1259
  br i1 %cmp.i45, label %_Z7rtclockv.exit54, label %if.then.i47, !dbg !1260

if.then.i47:                                      ; preds = %_Z5syr2kPfS_S_.exit
  %call1.i46 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str, i64 0, i64 0), i32 %call.i44) #8, !dbg !1261
  br label %_Z7rtclockv.exit54, !dbg !1261

_Z7rtclockv.exit54:                               ; preds = %_Z5syr2kPfS_S_.exit, %if.then.i47
  %tv_sec.i48 = getelementptr inbounds %struct.timeval, %struct.timeval* %Tp.i43, i64 0, i32 0, !dbg !1262
  %187 = load i64, i64* %tv_sec.i48, align 8, !dbg !1262, !tbaa !613
  %conv.i49 = sitofp i64 %187 to double, !dbg !1263
  %tv_usec.i50 = getelementptr inbounds %struct.timeval, %struct.timeval* %Tp.i43, i64 0, i32 1, !dbg !1264
  %188 = load i64, i64* %tv_usec.i50, align 8, !dbg !1264, !tbaa !620
  %conv2.i51 = sitofp i64 %188 to double, !dbg !1265
  %mul.i52 = fmul double %conv2.i51, 1.000000e-06, !dbg !1266
  %add.i53 = fadd double %mul.i52, %conv.i49, !dbg !1267
  call void @llvm.lifetime.end(i64 16, i8* nonnull %186) #8, !dbg !1268
  call void @llvm.lifetime.end(i64 8, i8* nonnull %185) #8, !dbg !1268
  call void @llvm.dbg.value(metadata double %add.i53, i64 0, metadata !1148, metadata !605), !dbg !1269
  %189 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !1270, !tbaa !1005
  %sub = fsub double %add.i53, %add.i35, !dbg !1271
  %call6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %189, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.5, i64 0, i64 0), double %sub), !dbg !1272
  call void @llvm.dbg.value(metadata float* %2, i64 0, metadata !847, metadata !605) #8, !dbg !1273
  call void @llvm.dbg.value(metadata float* %123, i64 0, metadata !848, metadata !605) #8, !dbg !1275
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !851, metadata !605) #8, !dbg !1276
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !849, metadata !605) #8, !dbg !1277
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !851, metadata !605) #8, !dbg !1276
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !849, metadata !605) #8, !dbg !1277
  br label %for.cond1.preheader.i25, !dbg !1278

for.cond1.preheader.i25:                          ; preds = %middle.block84, %_Z7rtclockv.exit54
  %indvars.iv31.i = phi i64 [ 0, %_Z7rtclockv.exit54 ], [ %indvars.iv.next32.i, %middle.block84 ]
  %fail.029.i = phi i32 [ 0, %_Z7rtclockv.exit54 ], [ %227, %middle.block84 ]
  call void @llvm.dbg.value(metadata i32 %fail.029.i, i64 0, metadata !851, metadata !605) #8, !dbg !1276
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !850, metadata !605) #8, !dbg !1279
  %190 = shl i64 %indvars.iv31.i, 5
  %191 = insertelement <4 x i32> <i32 undef, i32 0, i32 0, i32 0>, i32 %fail.029.i, i32 0, !dbg !1280
  br label %vector.body83, !dbg !1280

vector.body83:                                    ; preds = %vector.body83, %for.cond1.preheader.i25
  %index88 = phi i64 [ 0, %for.cond1.preheader.i25 ], [ %index.next89, %vector.body83 ], !dbg !1281
  %vec.phi = phi <4 x i32> [ %191, %for.cond1.preheader.i25 ], [ %225, %vector.body83 ]
  %192 = add nuw nsw i64 %index88, %190, !dbg !1282
  %193 = getelementptr inbounds float, float* %2, i64 %192, !dbg !1283
  %194 = bitcast float* %193 to <4 x float>*, !dbg !1283
  %wide.load95 = load <4 x float>, <4 x float>* %194, align 4, !dbg !1283, !tbaa !720
  %195 = getelementptr inbounds float, float* %123, i64 %192, !dbg !1284
  %196 = bitcast float* %195 to <4 x float>*, !dbg !1284
  %wide.load96 = load <4 x float>, <4 x float>* %196, align 4, !dbg !1284, !tbaa !720
  %197 = fcmp olt <4 x float> %wide.load95, zeroinitializer, !dbg !1285
  %198 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %wide.load95, !dbg !1288
  %199 = select <4 x i1> %197, <4 x float> %198, <4 x float> %wide.load95, !dbg !1289
  %200 = fpext <4 x float> %199 to <4 x double>, !dbg !1290
  %201 = fcmp olt <4 x double> %200, <double 1.000000e-02, double 1.000000e-02, double 1.000000e-02, double 1.000000e-02>, !dbg !1291
  %202 = fcmp olt <4 x float> %wide.load96, zeroinitializer, !dbg !1292
  %203 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %wide.load96, !dbg !1294
  %204 = select <4 x i1> %202, <4 x float> %203, <4 x float> %wide.load96, !dbg !1295
  %205 = fpext <4 x float> %204 to <4 x double>, !dbg !1296
  %206 = fcmp olt <4 x double> %205, <double 1.000000e-02, double 1.000000e-02, double 1.000000e-02, double 1.000000e-02>, !dbg !1297
  %207 = fsub <4 x float> %wide.load95, %wide.load96, !dbg !1298
  %208 = fcmp olt <4 x float> %207, zeroinitializer, !dbg !1299
  %209 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %207, !dbg !1301
  %210 = select <4 x i1> %208, <4 x float> %209, <4 x float> %207, !dbg !1302
  %211 = fadd <4 x float> %wide.load95, <float 0x3E45798EE0000000, float 0x3E45798EE0000000, float 0x3E45798EE0000000, float 0x3E45798EE0000000>, !dbg !1303
  %212 = fcmp olt <4 x float> %211, zeroinitializer, !dbg !1304
  %213 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %211, !dbg !1306
  %214 = select <4 x i1> %212, <4 x float> %213, <4 x float> %211, !dbg !1307
  %215 = fdiv <4 x float> %210, %214, !dbg !1308
  %216 = fcmp olt <4 x float> %215, zeroinitializer, !dbg !1309
  %217 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %215, !dbg !1311
  %218 = select <4 x i1> %216, <4 x float> %217, <4 x float> %215, !dbg !1312
  %219 = fmul <4 x float> %218, <float 1.000000e+02, float 1.000000e+02, float 1.000000e+02, float 1.000000e+02>, !dbg !1313
  %220 = and <4 x i1> %206, %201
  %221 = fpext <4 x float> %219 to <4 x double>, !dbg !1314
  %222 = select <4 x i1> %220, <4 x double> zeroinitializer, <4 x double> %221, !dbg !1314
  %223 = fcmp ogt <4 x double> %222, <double 2.000000e-03, double 2.000000e-03, double 2.000000e-03, double 2.000000e-03>, !dbg !1315
  %224 = zext <4 x i1> %223 to <4 x i32>, !dbg !1316
  %225 = add nsw <4 x i32> %vec.phi, %224, !dbg !1316
  %index.next89 = add i64 %index88, 4, !dbg !1281
  %226 = icmp eq i64 %index.next89, 32, !dbg !1281
  br i1 %226, label %middle.block84, label %vector.body83, !dbg !1281, !llvm.loop !1317

middle.block84:                                   ; preds = %vector.body83
  %rdx.shuf = shufflevector <4 x i32> %225, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>, !dbg !1316
  %bin.rdx = add <4 x i32> %225, %rdx.shuf, !dbg !1316
  %rdx.shuf97 = shufflevector <4 x i32> %bin.rdx, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>, !dbg !1316
  %bin.rdx98 = add <4 x i32> %bin.rdx, %rdx.shuf97, !dbg !1316
  %227 = extractelement <4 x i32> %bin.rdx98, i32 0, !dbg !1316
  %indvars.iv.next32.i = add nuw nsw i64 %indvars.iv31.i, 1, !dbg !1318
  call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !851, metadata !605) #8, !dbg !1276
  %exitcond34.i = icmp eq i64 %indvars.iv.next32.i, 32, !dbg !1319
  br i1 %exitcond34.i, label %_Z14compareResultsPfS_.exit, label %for.cond1.preheader.i25, !dbg !1278, !llvm.loop !912

_Z14compareResultsPfS_.exit:                      ; preds = %middle.block84
  %call15.i = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([74 x i8], [74 x i8]* @.str.1, i64 0, i64 0), double 2.000000e-03, i32 %227) #8, !dbg !1320
  call void @free(i8* %call) #8, !dbg !1321
  call void @free(i8* %call1) #8, !dbg !1322
  call void @free(i8* nonnull %call2) #8, !dbg !1323
  call void @free(i8* nonnull %call3) #8, !dbg !1324
  ret i32 0, !dbg !1325
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) local_unnamed_addr #2

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #7

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind readnone }
attributes #8 = { nounwind }
attributes #9 = { cold }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!575, !576}
!llvm.ident = !{!577}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !1, producer: "clang version 5.0.0 (trunk 294196)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !11, imports: !20)
!1 = !DIFile(filename: "syr2k.cu", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/syr2kllvm")
!2 = !{!3}
!3 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaMemcpyKind", file: !4, line: 796, size: 32, elements: !5, identifier: "_ZTS14cudaMemcpyKind")
!4 = !DIFile(filename: "/usr/local/cuda/include/driver_types.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/syr2kllvm")
!5 = !{!6, !7, !8, !9, !10}
!6 = !DIEnumerator(name: "cudaMemcpyHostToHost", value: 0)
!7 = !DIEnumerator(name: "cudaMemcpyHostToDevice", value: 1)
!8 = !DIEnumerator(name: "cudaMemcpyDeviceToHost", value: 2)
!9 = !DIEnumerator(name: "cudaMemcpyDeviceToDevice", value: 3)
!10 = !DIEnumerator(name: "cudaMemcpyDefault", value: 4)
!11 = !{!12, !14, !16, !13, !19}
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "DATA_TYPE", file: !1, line: 38, baseType: !13)
!13 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !17, line: 62, baseType: !18)
!17 = !DIFile(filename: "/home/dshen/llvm/build/bin/../lib/clang/5.0.0/include/stddef.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/syr2kllvm")
!18 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!20 = !{!21, !28, !32, !34, !36, !38, !40, !44, !46, !48, !50, !52, !54, !56, !58, !60, !62, !64, !66, !68, !70, !72, !76, !78, !80, !82, !87, !92, !94, !96, !101, !105, !107, !109, !111, !113, !115, !117, !119, !121, !126, !130, !132, !134, !138, !140, !142, !144, !146, !148, !152, !154, !156, !161, !169, !173, !175, !177, !181, !183, !185, !189, !191, !193, !197, !199, !201, !203, !205, !207, !209, !211, !213, !215, !220, !222, !224, !228, !230, !232, !234, !236, !238, !240, !242, !246, !250, !252, !254, !259, !261, !263, !265, !267, !269, !271, !275, !281, !285, !289, !294, !297, !301, !305, !316, !320, !324, !328, !332, !337, !339, !343, !347, !351, !359, !363, !367, !371, !375, !380, !386, !390, !394, !396, !404, !408, !416, !418, !420, !424, !428, !432, !437, !441, !446, !447, !448, !449, !452, !453, !454, !455, !456, !457, !458, !461, !463, !465, !467, !469, !471, !473, !475, !478, !480, !482, !484, !486, !488, !490, !492, !494, !496, !498, !500, !502, !504, !506, !508, !510, !512, !514, !516, !518, !520, !522, !524, !526, !528, !530, !532, !534, !536, !538, !540, !542, !546, !547, !549, !551, !553, !555, !557, !559, !561, !563, !565, !567, !569, !571, !573}
!21 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !24, line: 201)
!22 = !DINamespace(name: "std", scope: null, file: !23, line: 195)
!23 = !DIFile(filename: "/home/dshen/llvm/build/bin/../lib/clang/5.0.0/include/__clang_cuda_math_forward_declares.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/syr2kllvm")
!24 = !DISubprogram(name: "abs", linkageName: "_ZL3absx", scope: !23, file: !23, line: 44, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!25 = !DISubroutineType(types: !26)
!26 = !{!27, !27}
!27 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!28 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !29, line: 202)
!29 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !23, file: !23, line: 46, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!30 = !DISubroutineType(types: !31)
!31 = !{!13, !13}
!32 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !33, line: 203)
!33 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !23, file: !23, line: 48, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!34 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !35, line: 204)
!35 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !23, file: !23, line: 50, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!36 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !37, line: 205)
!37 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !23, file: !23, line: 52, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!38 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !39, line: 206)
!39 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !23, file: !23, line: 56, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!40 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !41, line: 207)
!41 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !23, file: !23, line: 54, type: !42, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!42 = !DISubroutineType(types: !43)
!43 = !{!13, !13, !13}
!44 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !45, line: 208)
!45 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !23, file: !23, line: 58, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!46 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !47, line: 209)
!47 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !23, file: !23, line: 60, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!48 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !49, line: 210)
!49 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !23, file: !23, line: 62, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!50 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !51, line: 211)
!51 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !23, file: !23, line: 64, type: !42, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!52 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !53, line: 212)
!53 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !23, file: !23, line: 66, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!54 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !55, line: 213)
!55 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !23, file: !23, line: 68, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!56 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !57, line: 214)
!57 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !23, file: !23, line: 72, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!58 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !59, line: 215)
!59 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !23, file: !23, line: 70, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!60 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !61, line: 216)
!61 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !23, file: !23, line: 76, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!62 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !63, line: 217)
!63 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !23, file: !23, line: 74, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!64 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !65, line: 218)
!65 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !23, file: !23, line: 78, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!66 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !67, line: 219)
!67 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !23, file: !23, line: 80, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!68 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !69, line: 220)
!69 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !23, file: !23, line: 82, type: !42, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!70 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !71, line: 221)
!71 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !23, file: !23, line: 84, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!72 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !73, line: 222)
!73 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !23, file: !23, line: 86, type: !74, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!74 = !DISubroutineType(types: !75)
!75 = !{!13, !13, !13, !13}
!76 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !77, line: 223)
!77 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !23, file: !23, line: 88, type: !42, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!78 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !79, line: 224)
!79 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !23, file: !23, line: 90, type: !42, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!80 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !81, line: 225)
!81 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !23, file: !23, line: 92, type: !42, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!82 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !83, line: 226)
!83 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !23, file: !23, line: 94, type: !84, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!84 = !DISubroutineType(types: !85)
!85 = !{!86, !13}
!86 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!87 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !88, line: 227)
!88 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !23, file: !23, line: 96, type: !89, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!89 = !DISubroutineType(types: !90)
!90 = !{!13, !13, !91}
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!92 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !93, line: 228)
!93 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !23, file: !23, line: 98, type: !42, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!94 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !95, line: 229)
!95 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !23, file: !23, line: 100, type: !84, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!96 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !97, line: 230)
!97 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !23, file: !23, line: 102, type: !98, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!98 = !DISubroutineType(types: !99)
!99 = !{!100, !13}
!100 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!101 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !102, line: 231)
!102 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !23, file: !23, line: 106, type: !103, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!103 = !DISubroutineType(types: !104)
!104 = !{!100, !13, !13}
!105 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !106, line: 232)
!106 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !23, file: !23, line: 105, type: !103, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!107 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !108, line: 233)
!108 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !23, file: !23, line: 108, type: !98, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!109 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !110, line: 234)
!110 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !23, file: !23, line: 112, type: !103, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!111 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !112, line: 235)
!112 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !23, file: !23, line: 111, type: !103, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!113 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !114, line: 236)
!114 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !23, file: !23, line: 114, type: !103, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!115 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !116, line: 237)
!116 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !23, file: !23, line: 116, type: !98, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!117 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !118, line: 238)
!118 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !23, file: !23, line: 118, type: !98, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !120, line: 239)
!120 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !23, file: !23, line: 120, type: !103, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !122, line: 240)
!122 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !23, file: !23, line: 121, type: !123, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!123 = !DISubroutineType(types: !124)
!124 = !{!125, !125}
!125 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!126 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !127, line: 241)
!127 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !23, file: !23, line: 123, type: !128, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!128 = !DISubroutineType(types: !129)
!129 = !{!13, !13, !86}
!130 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !131, line: 242)
!131 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !23, file: !23, line: 125, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!132 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !133, line: 243)
!133 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !23, file: !23, line: 126, type: !25, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!134 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !135, line: 244)
!135 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !23, file: !23, line: 128, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!136 = !DISubroutineType(types: !137)
!137 = !{!27, !13}
!138 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !139, line: 245)
!139 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !23, file: !23, line: 138, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!140 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !141, line: 246)
!141 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !23, file: !23, line: 130, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!142 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !143, line: 247)
!143 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !23, file: !23, line: 132, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!144 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !145, line: 248)
!145 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !23, file: !23, line: 134, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !147, line: 249)
!147 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !23, file: !23, line: 136, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!148 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !149, line: 250)
!149 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !23, file: !23, line: 140, type: !150, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!150 = !DISubroutineType(types: !151)
!151 = !{!125, !13}
!152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !153, line: 251)
!153 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !23, file: !23, line: 142, type: !150, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!154 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !155, line: 252)
!155 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !23, file: !23, line: 143, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !157, line: 253)
!157 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !23, file: !23, line: 145, type: !158, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!158 = !DISubroutineType(types: !159)
!159 = !{!13, !13, !160}
!160 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!161 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !162, line: 254)
!162 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !23, file: !23, line: 146, type: !163, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!163 = !DISubroutineType(types: !164)
!164 = !{!165, !166}
!165 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!166 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !167, size: 64)
!167 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !168)
!168 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!169 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !170, line: 255)
!170 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !23, file: !23, line: 147, type: !171, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!171 = !DISubroutineType(types: !172)
!172 = !{!13, !166}
!173 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !174, line: 256)
!174 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !23, file: !23, line: 149, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !176, line: 257)
!176 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !23, file: !23, line: 151, type: !42, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !178, line: 258)
!178 = !DISubprogram(name: "nexttoward", linkageName: "_ZL10nexttowardfd", scope: !23, file: !23, line: 153, type: !179, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!179 = !DISubroutineType(types: !180)
!180 = !{!13, !13, !165}
!181 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !182, line: 259)
!182 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !23, file: !23, line: 158, type: !128, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !184, line: 260)
!184 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !23, file: !23, line: 160, type: !42, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !186, line: 261)
!186 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !23, file: !23, line: 162, type: !187, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!187 = !DISubroutineType(types: !188)
!188 = !{!13, !13, !13, !91}
!189 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !190, line: 262)
!190 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !23, file: !23, line: 164, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !192, line: 263)
!192 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !23, file: !23, line: 166, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!193 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !194, line: 264)
!194 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !23, file: !23, line: 168, type: !195, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!195 = !DISubroutineType(types: !196)
!196 = !{!13, !13, !125}
!197 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !198, line: 265)
!198 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !23, file: !23, line: 170, type: !128, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !200, line: 266)
!200 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !23, file: !23, line: 172, type: !98, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!201 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !202, line: 267)
!202 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !23, file: !23, line: 174, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !204, line: 268)
!204 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !23, file: !23, line: 176, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!205 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !206, line: 269)
!206 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !23, file: !23, line: 178, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!207 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !208, line: 270)
!208 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !23, file: !23, line: 180, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !210, line: 271)
!210 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !23, file: !23, line: 182, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!211 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !212, line: 272)
!212 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !23, file: !23, line: 184, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !214, line: 273)
!214 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !23, file: !23, line: 186, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !216, line: 102)
!216 = !DISubprogram(name: "acos", scope: !217, file: !217, line: 54, type: !218, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!217 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/syr2kllvm")
!218 = !DISubroutineType(types: !219)
!219 = !{!165, !165}
!220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !221, line: 121)
!221 = !DISubprogram(name: "asin", scope: !217, file: !217, line: 56, type: !218, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !223, line: 140)
!223 = !DISubprogram(name: "atan", scope: !217, file: !217, line: 58, type: !218, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !225, line: 159)
!225 = !DISubprogram(name: "atan2", scope: !217, file: !217, line: 60, type: !226, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!226 = !DISubroutineType(types: !227)
!227 = !{!165, !165, !165}
!228 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !229, line: 180)
!229 = !DISubprogram(name: "ceil", scope: !217, file: !217, line: 178, type: !218, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !231, line: 199)
!231 = !DISubprogram(name: "cos", scope: !217, file: !217, line: 63, type: !218, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !233, line: 218)
!233 = !DISubprogram(name: "cosh", scope: !217, file: !217, line: 72, type: !218, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !235, line: 237)
!235 = !DISubprogram(name: "exp", scope: !217, file: !217, line: 100, type: !218, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !237, line: 256)
!237 = !DISubprogram(name: "fabs", scope: !217, file: !217, line: 181, type: !218, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !239, line: 275)
!239 = !DISubprogram(name: "floor", scope: !217, file: !217, line: 184, type: !218, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !241, line: 294)
!241 = !DISubprogram(name: "fmod", scope: !217, file: !217, line: 187, type: !226, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !243, line: 315)
!243 = !DISubprogram(name: "frexp", scope: !217, file: !217, line: 103, type: !244, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!244 = !DISubroutineType(types: !245)
!245 = !{!165, !165, !91}
!246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !247, line: 334)
!247 = !DISubprogram(name: "ldexp", scope: !217, file: !217, line: 106, type: !248, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!248 = !DISubroutineType(types: !249)
!249 = !{!165, !165, !86}
!250 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !251, line: 353)
!251 = !DISubprogram(name: "log", scope: !217, file: !217, line: 109, type: !218, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !253, line: 372)
!253 = !DISubprogram(name: "log10", scope: !217, file: !217, line: 112, type: !218, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !255, line: 391)
!255 = !DISubprogram(name: "modf", scope: !217, file: !217, line: 115, type: !256, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!256 = !DISubroutineType(types: !257)
!257 = !{!165, !165, !258}
!258 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !165, size: 64)
!259 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !260, line: 403)
!260 = !DISubprogram(name: "pow", scope: !217, file: !217, line: 153, type: !226, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !262, line: 440)
!262 = !DISubprogram(name: "sin", scope: !217, file: !217, line: 65, type: !218, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!263 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !264, line: 459)
!264 = !DISubprogram(name: "sinh", scope: !217, file: !217, line: 74, type: !218, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !266, line: 478)
!266 = !DISubprogram(name: "sqrt", scope: !217, file: !217, line: 156, type: !218, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!267 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !268, line: 497)
!268 = !DISubprogram(name: "tan", scope: !217, file: !217, line: 67, type: !218, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!269 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !270, line: 516)
!270 = !DISubprogram(name: "tanh", scope: !217, file: !217, line: 76, type: !218, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!271 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !272, line: 118)
!272 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !273, line: 101, baseType: !274)
!273 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/syr2kllvm")
!274 = !DICompositeType(tag: DW_TAG_structure_type, file: !273, line: 97, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!275 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !276, line: 119)
!276 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !273, line: 109, baseType: !277)
!277 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !273, line: 105, size: 128, elements: !278, identifier: "_ZTS6ldiv_t")
!278 = !{!279, !280}
!279 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !277, file: !273, line: 107, baseType: !125, size: 64)
!280 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !277, file: !273, line: 108, baseType: !125, size: 64, offset: 64)
!281 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !282, line: 121)
!282 = !DISubprogram(name: "abort", scope: !273, file: !273, line: 515, type: !283, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: true)
!283 = !DISubroutineType(types: !284)
!284 = !{null}
!285 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !286, line: 122)
!286 = !DISubprogram(name: "abs", scope: !273, file: !273, line: 775, type: !287, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!287 = !DISubroutineType(types: !288)
!288 = !{!86, !86}
!289 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !290, line: 123)
!290 = !DISubprogram(name: "atexit", scope: !273, file: !273, line: 519, type: !291, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!291 = !DISubroutineType(types: !292)
!292 = !{!86, !293}
!293 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !283, size: 64)
!294 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !295, line: 129)
!295 = !DISubprogram(name: "atof", scope: !296, file: !296, line: 26, type: !163, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!296 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/syr2kllvm")
!297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !298, line: 130)
!298 = !DISubprogram(name: "atoi", scope: !273, file: !273, line: 278, type: !299, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!299 = !DISubroutineType(types: !300)
!300 = !{!86, !166}
!301 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !302, line: 131)
!302 = !DISubprogram(name: "atol", scope: !273, file: !273, line: 283, type: !303, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!303 = !DISubroutineType(types: !304)
!304 = !{!125, !166}
!305 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !306, line: 132)
!306 = !DISubprogram(name: "bsearch", scope: !307, file: !307, line: 20, type: !308, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!307 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdlib-bsearch.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/syr2kllvm")
!308 = !DISubroutineType(types: !309)
!309 = !{!15, !310, !310, !16, !16, !312}
!310 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !311, size: 64)
!311 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!312 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !273, line: 742, baseType: !313)
!313 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !314, size: 64)
!314 = !DISubroutineType(types: !315)
!315 = !{!86, !310, !310}
!316 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !317, line: 133)
!317 = !DISubprogram(name: "calloc", scope: !273, file: !273, line: 468, type: !318, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!318 = !DISubroutineType(types: !319)
!319 = !{!15, !16, !16}
!320 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !321, line: 134)
!321 = !DISubprogram(name: "div", scope: !273, file: !273, line: 789, type: !322, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!322 = !DISubroutineType(types: !323)
!323 = !{!272, !86, !86}
!324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !325, line: 135)
!325 = !DISubprogram(name: "exit", scope: !273, file: !273, line: 543, type: !326, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: true)
!326 = !DISubroutineType(types: !327)
!327 = !{null, !86}
!328 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !329, line: 136)
!329 = !DISubprogram(name: "free", scope: !273, file: !273, line: 483, type: !330, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!330 = !DISubroutineType(types: !331)
!331 = !{null, !15}
!332 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !333, line: 137)
!333 = !DISubprogram(name: "getenv", scope: !273, file: !273, line: 564, type: !334, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!334 = !DISubroutineType(types: !335)
!335 = !{!336, !166}
!336 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !168, size: 64)
!337 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !338, line: 138)
!338 = !DISubprogram(name: "labs", scope: !273, file: !273, line: 776, type: !123, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!339 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !340, line: 139)
!340 = !DISubprogram(name: "ldiv", scope: !273, file: !273, line: 791, type: !341, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!341 = !DISubroutineType(types: !342)
!342 = !{!276, !125, !125}
!343 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !344, line: 140)
!344 = !DISubprogram(name: "malloc", scope: !273, file: !273, line: 466, type: !345, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!345 = !DISubroutineType(types: !346)
!346 = !{!15, !16}
!347 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !348, line: 142)
!348 = !DISubprogram(name: "mblen", scope: !273, file: !273, line: 863, type: !349, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!349 = !DISubroutineType(types: !350)
!350 = !{!86, !166, !16}
!351 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !352, line: 143)
!352 = !DISubprogram(name: "mbstowcs", scope: !273, file: !273, line: 874, type: !353, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!353 = !DISubroutineType(types: !354)
!354 = !{!16, !355, !358, !16}
!355 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !356)
!356 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !357, size: 64)
!357 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!358 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !166)
!359 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !360, line: 144)
!360 = !DISubprogram(name: "mbtowc", scope: !273, file: !273, line: 866, type: !361, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!361 = !DISubroutineType(types: !362)
!362 = !{!86, !355, !358, !16}
!363 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !364, line: 146)
!364 = !DISubprogram(name: "qsort", scope: !273, file: !273, line: 765, type: !365, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!365 = !DISubroutineType(types: !366)
!366 = !{null, !15, !16, !16, !312}
!367 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !368, line: 152)
!368 = !DISubprogram(name: "rand", scope: !273, file: !273, line: 374, type: !369, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!369 = !DISubroutineType(types: !370)
!370 = !{!86}
!371 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !372, line: 153)
!372 = !DISubprogram(name: "realloc", scope: !273, file: !273, line: 480, type: !373, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!373 = !DISubroutineType(types: !374)
!374 = !{!15, !15, !16}
!375 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !376, line: 154)
!376 = !DISubprogram(name: "srand", scope: !273, file: !273, line: 376, type: !377, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!377 = !DISubroutineType(types: !378)
!378 = !{null, !379}
!379 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!380 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !381, line: 155)
!381 = !DISubprogram(name: "strtod", scope: !273, file: !273, line: 164, type: !382, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!382 = !DISubroutineType(types: !383)
!383 = !{!165, !358, !384}
!384 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !385)
!385 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !336, size: 64)
!386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !387, line: 156)
!387 = !DISubprogram(name: "strtol", scope: !273, file: !273, line: 183, type: !388, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!388 = !DISubroutineType(types: !389)
!389 = !{!125, !358, !384, !86}
!390 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !391, line: 157)
!391 = !DISubprogram(name: "strtoul", scope: !273, file: !273, line: 187, type: !392, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!392 = !DISubroutineType(types: !393)
!393 = !{!18, !358, !384, !86}
!394 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !395, line: 158)
!395 = !DISubprogram(name: "system", scope: !273, file: !273, line: 717, type: !299, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!396 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !397, line: 160)
!397 = !DISubprogram(name: "wcstombs", scope: !273, file: !273, line: 877, type: !398, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!398 = !DISubroutineType(types: !399)
!399 = !{!16, !400, !401, !16}
!400 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !336)
!401 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !402)
!402 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !403, size: 64)
!403 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !357)
!404 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !405, line: 161)
!405 = !DISubprogram(name: "wctomb", scope: !273, file: !273, line: 870, type: !406, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!406 = !DISubroutineType(types: !407)
!407 = !{!86, !336, !357}
!408 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !409, entity: !411, line: 201)
!409 = !DINamespace(name: "__gnu_cxx", scope: null, file: !410, line: 68)
!410 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/bits/cpp_type_traits.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/syr2kllvm")
!411 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !273, line: 121, baseType: !412)
!412 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !273, line: 117, size: 128, elements: !413, identifier: "_ZTS7lldiv_t")
!413 = !{!414, !415}
!414 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !412, file: !273, line: 119, baseType: !27, size: 64)
!415 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !412, file: !273, line: 120, baseType: !27, size: 64, offset: 64)
!416 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !409, entity: !417, line: 207)
!417 = !DISubprogram(name: "_Exit", scope: !273, file: !273, line: 557, type: !326, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: true)
!418 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !409, entity: !419, line: 211)
!419 = !DISubprogram(name: "llabs", scope: !273, file: !273, line: 780, type: !25, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!420 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !409, entity: !421, line: 217)
!421 = !DISubprogram(name: "lldiv", scope: !273, file: !273, line: 797, type: !422, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!422 = !DISubroutineType(types: !423)
!423 = !{!411, !27, !27}
!424 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !409, entity: !425, line: 228)
!425 = !DISubprogram(name: "atoll", scope: !273, file: !273, line: 292, type: !426, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!426 = !DISubroutineType(types: !427)
!427 = !{!27, !166}
!428 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !409, entity: !429, line: 229)
!429 = !DISubprogram(name: "strtoll", scope: !273, file: !273, line: 209, type: !430, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!430 = !DISubroutineType(types: !431)
!431 = !{!27, !358, !384, !86}
!432 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !409, entity: !433, line: 230)
!433 = !DISubprogram(name: "strtoull", scope: !273, file: !273, line: 214, type: !434, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!434 = !DISubroutineType(types: !435)
!435 = !{!436, !358, !384, !86}
!436 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!437 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !409, entity: !438, line: 232)
!438 = !DISubprogram(name: "strtof", scope: !273, file: !273, line: 172, type: !439, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!439 = !DISubroutineType(types: !440)
!440 = !{!13, !358, !384}
!441 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !409, entity: !442, line: 233)
!442 = !DISubprogram(name: "strtold", scope: !273, file: !273, line: 175, type: !443, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!443 = !DISubroutineType(types: !444)
!444 = !{!445, !358, !384}
!445 = !DIBasicType(name: "long double", size: 128, encoding: DW_ATE_float)
!446 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !411, line: 241)
!447 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !417, line: 243)
!448 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !419, line: 245)
!449 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !450, line: 246)
!450 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !409, file: !451, line: 214, type: !422, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!451 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/cstdlib", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/syr2kllvm")
!452 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !421, line: 247)
!453 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !425, line: 249)
!454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !438, line: 250)
!455 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !429, line: 251)
!456 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !433, line: 252)
!457 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !442, line: 253)
!458 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !459, line: 418)
!459 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !460, file: !460, line: 1126, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!460 = !DIFile(filename: "/usr/local/cuda/include/math_functions.hpp", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/syr2kllvm")
!461 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !462, line: 419)
!462 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !460, file: !460, line: 1154, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!463 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !464, line: 420)
!464 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !460, file: !460, line: 1121, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!465 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !466, line: 421)
!466 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !460, file: !460, line: 1159, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!467 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !468, line: 422)
!468 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !460, file: !460, line: 1111, type: !42, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!469 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !470, line: 423)
!470 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !460, file: !460, line: 1116, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!471 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !472, line: 424)
!472 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !460, file: !460, line: 1164, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!473 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !474, line: 425)
!474 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !460, file: !460, line: 1199, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!475 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !476, line: 426)
!476 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !477, file: !477, line: 647, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!477 = !DIFile(filename: "/usr/local/cuda/include/device_functions.hpp", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/syr2kllvm")
!478 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !479, line: 427)
!479 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !460, file: !460, line: 973, type: !42, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !481, line: 428)
!481 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !460, file: !460, line: 1027, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!482 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !483, line: 429)
!483 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !460, file: !460, line: 1096, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!484 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !485, line: 430)
!485 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !460, file: !460, line: 1259, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!486 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !487, line: 431)
!487 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !460, file: !460, line: 1249, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!488 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !489, line: 432)
!489 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !477, file: !477, line: 637, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!490 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !491, line: 433)
!491 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !460, file: !460, line: 1078, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!492 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !493, line: 434)
!493 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !460, file: !460, line: 1169, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !495, line: 435)
!495 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !477, file: !477, line: 582, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !497, line: 436)
!497 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !460, file: !460, line: 1385, type: !42, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !499, line: 437)
!499 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !477, file: !477, line: 572, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !501, line: 438)
!501 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !460, file: !460, line: 1337, type: !74, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !503, line: 439)
!503 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !477, file: !477, line: 602, type: !42, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!504 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !505, line: 440)
!505 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !477, file: !477, line: 597, type: !42, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !507, line: 441)
!507 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !460, file: !460, line: 1322, type: !42, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!508 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !509, line: 442)
!509 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !460, file: !460, line: 1312, type: !89, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !511, line: 443)
!511 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !460, file: !460, line: 1174, type: !42, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!512 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !513, line: 444)
!513 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !460, file: !460, line: 1390, type: !84, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!514 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !515, line: 445)
!515 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !460, file: !460, line: 1289, type: !128, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!516 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !517, line: 446)
!517 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !460, file: !460, line: 1284, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!518 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !519, line: 447)
!519 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !460, file: !460, line: 933, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!520 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !521, line: 448)
!521 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !460, file: !460, line: 1371, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!522 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !523, line: 449)
!523 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !460, file: !460, line: 1140, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !525, line: 450)
!525 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !460, file: !460, line: 1149, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!526 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !527, line: 451)
!527 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !460, file: !460, line: 1069, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !529, line: 452)
!529 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !460, file: !460, line: 1395, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!530 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !531, line: 453)
!531 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !460, file: !460, line: 1131, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!532 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !533, line: 454)
!533 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !460, file: !460, line: 924, type: !150, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!534 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !535, line: 455)
!535 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !460, file: !460, line: 1376, type: !150, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !537, line: 456)
!537 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !460, file: !460, line: 1317, type: !158, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!538 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !539, line: 457)
!539 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !460, file: !460, line: 938, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !541, line: 458)
!541 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !460, file: !460, line: 1002, type: !42, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !543, line: 459)
!543 = !DISubprogram(name: "nexttowardf", scope: !217, file: !217, line: 284, type: !544, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!544 = !DISubroutineType(types: !545)
!545 = !{!13, !13, !445}
!546 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !543, line: 460)
!547 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !548, line: 461)
!548 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !460, file: !460, line: 1352, type: !42, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!549 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !550, line: 462)
!550 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !460, file: !460, line: 1327, type: !42, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!551 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !552, line: 463)
!552 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !460, file: !460, line: 1332, type: !187, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!553 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !554, line: 464)
!554 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !460, file: !460, line: 919, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !556, line: 465)
!556 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !460, file: !460, line: 1366, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !558, line: 466)
!558 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !460, file: !460, line: 1299, type: !195, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !560, line: 467)
!560 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !460, file: !460, line: 1294, type: !128, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !562, line: 468)
!562 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !460, file: !460, line: 1018, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !564, line: 469)
!564 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !460, file: !460, line: 1101, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !566, line: 470)
!566 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !477, file: !477, line: 887, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!567 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !568, line: 471)
!568 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !460, file: !460, line: 1060, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !570, line: 472)
!570 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !460, file: !460, line: 1106, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !572, line: 473)
!572 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !460, file: !460, line: 1361, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!573 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !22, entity: !574, line: 474)
!574 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !477, file: !477, line: 642, type: !30, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!575 = !{i32 2, !"Dwarf Version", i32 4}
!576 = !{i32 2, !"Debug Info Version", i32 3}
!577 = !{!"clang version 5.0.0 (trunk 294196)"}
!578 = distinct !DISubprogram(name: "rtclock", linkageName: "_Z7rtclockv", scope: !579, file: !579, line: 11, type: !580, isLocal: false, isDefinition: true, scopeLine: 12, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !582)
!579 = !DIFile(filename: "./../../common/polybenchUtilFuncts.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/syr2kllvm")
!580 = !DISubroutineType(types: !581)
!581 = !{!165}
!582 = !{!583, !589, !598}
!583 = !DILocalVariable(name: "Tzp", scope: !578, file: !579, line: 13, type: !584)
!584 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timezone", file: !585, line: 55, size: 64, elements: !586, identifier: "_ZTS8timezone")
!585 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/time.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/syr2kllvm")
!586 = !{!587, !588}
!587 = !DIDerivedType(tag: DW_TAG_member, name: "tz_minuteswest", scope: !584, file: !585, line: 57, baseType: !86, size: 32)
!588 = !DIDerivedType(tag: DW_TAG_member, name: "tz_dsttime", scope: !584, file: !585, line: 58, baseType: !86, size: 32, offset: 32)
!589 = !DILocalVariable(name: "Tp", scope: !578, file: !579, line: 14, type: !590)
!590 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timeval", file: !591, line: 30, size: 128, elements: !592, identifier: "_ZTS7timeval")
!591 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/time.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/syr2kllvm")
!592 = !{!593, !596}
!593 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !590, file: !591, line: 32, baseType: !594, size: 64)
!594 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !595, line: 139, baseType: !125)
!595 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/syr2kllvm")
!596 = !DIDerivedType(tag: DW_TAG_member, name: "tv_usec", scope: !590, file: !591, line: 33, baseType: !597, size: 64, offset: 64)
!597 = !DIDerivedType(tag: DW_TAG_typedef, name: "__suseconds_t", file: !595, line: 141, baseType: !125)
!598 = !DILocalVariable(name: "stat", scope: !578, file: !579, line: 15, type: !86)
!599 = !DILocation(line: 13, column: 5, scope: !578)
!600 = !DILocation(line: 14, column: 5, scope: !578)
!601 = !DIExpression(DW_OP_deref)
!602 = !DILocation(line: 13, column: 21, scope: !578)
!603 = !DILocation(line: 14, column: 20, scope: !578)
!604 = !DILocation(line: 16, column: 12, scope: !578)
!605 = !DIExpression()
!606 = !DILocation(line: 15, column: 9, scope: !578)
!607 = !DILocation(line: 17, column: 14, scope: !608)
!608 = distinct !DILexicalBlock(scope: !578, file: !579, line: 17, column: 9)
!609 = !DILocation(line: 17, column: 9, scope: !578)
!610 = !DILocation(line: 17, column: 20, scope: !611)
!611 = !DILexicalBlockFile(scope: !608, file: !579, discriminator: 1)
!612 = !DILocation(line: 18, column: 15, scope: !578)
!613 = !{!614, !615, i64 0}
!614 = !{!"_ZTS7timeval", !615, i64 0, !615, i64 8}
!615 = !{!"long", !616, i64 0}
!616 = !{!"omnipotent char", !617, i64 0}
!617 = !{!"Simple C++ TBAA"}
!618 = !DILocation(line: 18, column: 12, scope: !578)
!619 = !DILocation(line: 18, column: 27, scope: !578)
!620 = !{!614, !615, i64 8}
!621 = !DILocation(line: 18, column: 24, scope: !578)
!622 = !DILocation(line: 18, column: 34, scope: !578)
!623 = !DILocation(line: 18, column: 22, scope: !578)
!624 = !DILocation(line: 19, column: 1, scope: !578)
!625 = !DILocation(line: 18, column: 5, scope: !578)
!626 = distinct !DISubprogram(name: "absVal", linkageName: "_Z6absValf", scope: !579, file: !579, line: 22, type: !30, isLocal: false, isDefinition: true, scopeLine: 23, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !627)
!627 = !{!628}
!628 = !DILocalVariable(name: "a", arg: 1, scope: !626, file: !579, line: 22, type: !13)
!629 = !DILocation(line: 22, column: 20, scope: !626)
!630 = !DILocation(line: 24, column: 7, scope: !631)
!631 = distinct !DILexicalBlock(scope: !626, file: !579, line: 24, column: 5)
!632 = !DILocation(line: 26, column: 13, scope: !633)
!633 = distinct !DILexicalBlock(scope: !631, file: !579, line: 25, column: 2)
!634 = !DILocation(line: 24, column: 5, scope: !626)
!635 = !DILocation(line: 32, column: 1, scope: !626)
!636 = distinct !DISubprogram(name: "percentDiff", linkageName: "_Z11percentDiffdd", scope: !579, file: !579, line: 36, type: !637, isLocal: false, isDefinition: true, scopeLine: 37, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !639)
!637 = !DISubroutineType(types: !638)
!638 = !{!13, !165, !165}
!639 = !{!640, !641}
!640 = !DILocalVariable(name: "val1", arg: 1, scope: !636, file: !579, line: 36, type: !165)
!641 = !DILocalVariable(name: "val2", arg: 2, scope: !636, file: !579, line: 36, type: !165)
!642 = !DILocation(line: 36, column: 26, scope: !636)
!643 = !DILocation(line: 36, column: 39, scope: !636)
!644 = !DILocation(line: 38, column: 14, scope: !645)
!645 = distinct !DILexicalBlock(scope: !636, file: !579, line: 38, column: 6)
!646 = !DILocation(line: 22, column: 20, scope: !626, inlinedAt: !647)
!647 = distinct !DILocation(line: 38, column: 7, scope: !645)
!648 = !DILocation(line: 24, column: 7, scope: !631, inlinedAt: !647)
!649 = !DILocation(line: 26, column: 13, scope: !633, inlinedAt: !647)
!650 = !DILocation(line: 24, column: 5, scope: !626, inlinedAt: !647)
!651 = !DILocation(line: 38, column: 7, scope: !645)
!652 = !DILocation(line: 38, column: 20, scope: !645)
!653 = !DILocation(line: 38, column: 28, scope: !645)
!654 = !DILocation(line: 38, column: 39, scope: !655)
!655 = !DILexicalBlockFile(scope: !645, file: !579, discriminator: 1)
!656 = !DILocation(line: 22, column: 20, scope: !626, inlinedAt: !657)
!657 = distinct !DILocation(line: 38, column: 32, scope: !655)
!658 = !DILocation(line: 24, column: 7, scope: !631, inlinedAt: !657)
!659 = !DILocation(line: 26, column: 13, scope: !633, inlinedAt: !657)
!660 = !DILocation(line: 24, column: 5, scope: !626, inlinedAt: !657)
!661 = !DILocation(line: 38, column: 32, scope: !655)
!662 = !DILocation(line: 38, column: 45, scope: !655)
!663 = !DILocation(line: 38, column: 6, scope: !664)
!664 = !DILexicalBlockFile(scope: !636, file: !579, discriminator: 1)
!665 = !DILocation(line: 45, column: 43, scope: !666)
!666 = distinct !DILexicalBlock(scope: !645, file: !579, line: 44, column: 2)
!667 = !DILocation(line: 45, column: 38, scope: !666)
!668 = !DILocation(line: 22, column: 20, scope: !626, inlinedAt: !669)
!669 = distinct !DILocation(line: 45, column: 31, scope: !666)
!670 = !DILocation(line: 24, column: 7, scope: !631, inlinedAt: !669)
!671 = !DILocation(line: 26, column: 13, scope: !633, inlinedAt: !669)
!672 = !DILocation(line: 24, column: 5, scope: !626, inlinedAt: !669)
!673 = !DILocation(line: 45, column: 65, scope: !666)
!674 = !DILocation(line: 45, column: 60, scope: !666)
!675 = !DILocation(line: 22, column: 20, scope: !626, inlinedAt: !676)
!676 = distinct !DILocation(line: 45, column: 53, scope: !677)
!677 = !DILexicalBlockFile(scope: !666, file: !579, discriminator: 1)
!678 = !DILocation(line: 24, column: 7, scope: !631, inlinedAt: !676)
!679 = !DILocation(line: 26, column: 13, scope: !633, inlinedAt: !676)
!680 = !DILocation(line: 24, column: 5, scope: !626, inlinedAt: !676)
!681 = !DILocation(line: 45, column: 51, scope: !666)
!682 = !DILocation(line: 22, column: 20, scope: !626, inlinedAt: !683)
!683 = distinct !DILocation(line: 45, column: 24, scope: !684)
!684 = !DILexicalBlockFile(scope: !666, file: !579, discriminator: 2)
!685 = !DILocation(line: 24, column: 7, scope: !631, inlinedAt: !683)
!686 = !DILocation(line: 26, column: 13, scope: !633, inlinedAt: !683)
!687 = !DILocation(line: 24, column: 5, scope: !626, inlinedAt: !683)
!688 = !DILocation(line: 45, column: 21, scope: !666)
!689 = !DILocation(line: 45, column: 7, scope: !666)
!690 = !DILocation(line: 47, column: 1, scope: !636)
!691 = distinct !DISubprogram(name: "init_arrays", linkageName: "_Z11init_arraysPfS_S_", scope: !1, file: !1, line: 42, type: !692, isLocal: false, isDefinition: true, scopeLine: 43, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !694)
!692 = !DISubroutineType(types: !693)
!693 = !{null, !19, !19, !19}
!694 = !{!695, !696, !697, !698, !699}
!695 = !DILocalVariable(name: "A", arg: 1, scope: !691, file: !1, line: 42, type: !19)
!696 = !DILocalVariable(name: "B", arg: 2, scope: !691, file: !1, line: 42, type: !19)
!697 = !DILocalVariable(name: "C", arg: 3, scope: !691, file: !1, line: 42, type: !19)
!698 = !DILocalVariable(name: "i", scope: !691, file: !1, line: 44, type: !86)
!699 = !DILocalVariable(name: "j", scope: !691, file: !1, line: 44, type: !86)
!700 = !DILocation(line: 42, column: 29, scope: !691)
!701 = !DILocation(line: 42, column: 43, scope: !691)
!702 = !DILocation(line: 42, column: 57, scope: !691)
!703 = !DILocation(line: 44, column: 6, scope: !691)
!704 = !DILocation(line: 46, column: 2, scope: !705)
!705 = !DILexicalBlockFile(scope: !706, file: !1, discriminator: 1)
!706 = distinct !DILexicalBlock(scope: !691, file: !1, line: 46, column: 2)
!707 = !DILocation(line: 44, column: 9, scope: !691)
!708 = !DILocation(line: 48, column: 7, scope: !709)
!709 = !DILexicalBlockFile(scope: !710, file: !1, discriminator: 1)
!710 = distinct !DILexicalBlock(scope: !711, file: !1, line: 48, column: 7)
!711 = distinct !DILexicalBlock(scope: !712, file: !1, line: 47, column: 6)
!712 = distinct !DILexicalBlock(scope: !706, file: !1, line: 46, column: 2)
!713 = !DILocation(line: 50, column: 31, scope: !714)
!714 = distinct !DILexicalBlock(scope: !715, file: !1, line: 49, column: 3)
!715 = distinct !DILexicalBlock(scope: !710, file: !1, line: 48, column: 7)
!716 = !DILocation(line: 50, column: 34, scope: !714)
!717 = !DILocation(line: 50, column: 39, scope: !714)
!718 = !DILocation(line: 50, column: 4, scope: !714)
!719 = !DILocation(line: 50, column: 15, scope: !714)
!720 = !{!721, !721, i64 0}
!721 = !{!"float", !616, i64 0}
!722 = !DILocation(line: 50, column: 10, scope: !714)
!723 = !DILocation(line: 55, column: 34, scope: !724)
!724 = distinct !DILexicalBlock(scope: !725, file: !1, line: 54, column: 3)
!725 = distinct !DILexicalBlock(scope: !726, file: !1, line: 53, column: 3)
!726 = distinct !DILexicalBlock(scope: !711, file: !1, line: 53, column: 3)
!727 = !DILocation(line: 55, column: 33, scope: !724)
!728 = !DILocation(line: 55, column: 37, scope: !724)
!729 = !DILocation(line: 55, column: 6, scope: !724)
!730 = !DILocation(line: 55, column: 17, scope: !724)
!731 = !{!732}
!732 = distinct !{!732, !733}
!733 = distinct !{!733, !"LVerDomain"}
!734 = !{!735}
!735 = distinct !{!735, !733}
!736 = !DILocation(line: 56, column: 36, scope: !724)
!737 = !DILocation(line: 56, column: 41, scope: !724)
!738 = !DILocation(line: 56, column: 6, scope: !724)
!739 = !DILocation(line: 56, column: 17, scope: !724)
!740 = !DILocation(line: 55, column: 12, scope: !724)
!741 = !DILocation(line: 46, column: 22, scope: !742)
!742 = !DILexicalBlockFile(scope: !712, file: !1, discriminator: 2)
!743 = !DILocation(line: 53, column: 23, scope: !744)
!744 = !DILexicalBlockFile(scope: !725, file: !1, discriminator: 2)
!745 = !DILocation(line: 53, column: 17, scope: !746)
!746 = !DILexicalBlockFile(scope: !725, file: !1, discriminator: 1)
!747 = !DILocation(line: 53, column: 3, scope: !748)
!748 = !DILexicalBlockFile(scope: !726, file: !1, discriminator: 1)
!749 = distinct !{!749, !750, !751, !752, !753}
!750 = !DILocation(line: 53, column: 3, scope: !726)
!751 = !DILocation(line: 57, column: 3, scope: !726)
!752 = !{!"llvm.loop.vectorize.width", i32 1}
!753 = !{!"llvm.loop.interleave.count", i32 1}
!754 = !DILocation(line: 46, column: 16, scope: !755)
!755 = !DILexicalBlockFile(scope: !712, file: !1, discriminator: 1)
!756 = distinct !{!756, !757, !758}
!757 = !DILocation(line: 46, column: 2, scope: !706)
!758 = !DILocation(line: 58, column: 6, scope: !706)
!759 = !DILocation(line: 59, column: 1, scope: !691)
!760 = distinct !DISubprogram(name: "syr2k", linkageName: "_Z5syr2kPfS_S_", scope: !1, file: !1, line: 62, type: !692, isLocal: false, isDefinition: true, scopeLine: 63, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !761)
!761 = !{!762, !763, !764, !765, !766, !767}
!762 = !DILocalVariable(name: "A", arg: 1, scope: !760, file: !1, line: 62, type: !19)
!763 = !DILocalVariable(name: "B", arg: 2, scope: !760, file: !1, line: 62, type: !19)
!764 = !DILocalVariable(name: "C", arg: 3, scope: !760, file: !1, line: 62, type: !19)
!765 = !DILocalVariable(name: "i", scope: !760, file: !1, line: 64, type: !86)
!766 = !DILocalVariable(name: "j", scope: !760, file: !1, line: 64, type: !86)
!767 = !DILocalVariable(name: "k", scope: !760, file: !1, line: 64, type: !86)
!768 = !DILocation(line: 62, column: 23, scope: !760)
!769 = !DILocation(line: 62, column: 37, scope: !760)
!770 = !DILocation(line: 62, column: 51, scope: !760)
!771 = !DILocation(line: 64, column: 6, scope: !760)
!772 = !DILocation(line: 66, column: 4, scope: !773)
!773 = !DILexicalBlockFile(scope: !774, file: !1, discriminator: 1)
!774 = distinct !DILexicalBlock(scope: !760, file: !1, line: 66, column: 4)
!775 = !DILocation(line: 64, column: 9, scope: !760)
!776 = !DILocation(line: 68, column: 6, scope: !777)
!777 = !DILexicalBlockFile(scope: !778, file: !1, discriminator: 1)
!778 = distinct !DILexicalBlock(scope: !779, file: !1, line: 68, column: 6)
!779 = distinct !DILexicalBlock(scope: !780, file: !1, line: 67, column: 2)
!780 = distinct !DILexicalBlock(scope: !774, file: !1, line: 66, column: 4)
!781 = !DILocation(line: 70, column: 9, scope: !782)
!782 = distinct !DILexicalBlock(scope: !783, file: !1, line: 69, column: 3)
!783 = distinct !DILexicalBlock(scope: !778, file: !1, line: 68, column: 6)
!784 = !DILocation(line: 70, column: 20, scope: !782)
!785 = !DILocation(line: 70, column: 15, scope: !782)
!786 = !DILocation(line: 66, column: 24, scope: !787)
!787 = !DILexicalBlockFile(scope: !780, file: !1, discriminator: 2)
!788 = !DILocation(line: 66, column: 18, scope: !789)
!789 = !DILexicalBlockFile(scope: !780, file: !1, discriminator: 1)
!790 = distinct !{!790, !791, !792}
!791 = !DILocation(line: 66, column: 4, scope: !774)
!792 = !DILocation(line: 72, column: 2, scope: !774)
!793 = !DILocation(line: 76, column: 6, scope: !794)
!794 = !DILexicalBlockFile(scope: !795, file: !1, discriminator: 1)
!795 = distinct !DILexicalBlock(scope: !796, file: !1, line: 76, column: 6)
!796 = distinct !DILexicalBlock(scope: !797, file: !1, line: 75, column: 2)
!797 = distinct !DILexicalBlock(scope: !798, file: !1, line: 74, column: 4)
!798 = distinct !DILexicalBlock(scope: !760, file: !1, line: 74, column: 4)
!799 = !DILocation(line: 64, column: 12, scope: !760)
!800 = !DILocation(line: 78, column: 10, scope: !801)
!801 = !DILexicalBlockFile(scope: !802, file: !1, discriminator: 1)
!802 = distinct !DILexicalBlock(scope: !803, file: !1, line: 78, column: 10)
!803 = distinct !DILexicalBlock(scope: !804, file: !1, line: 77, column: 3)
!804 = distinct !DILexicalBlock(scope: !795, file: !1, line: 76, column: 6)
!805 = !DILocation(line: 80, column: 18, scope: !806)
!806 = distinct !DILexicalBlock(scope: !807, file: !1, line: 79, column: 4)
!807 = distinct !DILexicalBlock(scope: !802, file: !1, line: 78, column: 10)
!808 = !DILocation(line: 80, column: 35, scope: !806)
!809 = !DILocation(line: 80, column: 29, scope: !806)
!810 = !DILocation(line: 80, column: 27, scope: !806)
!811 = !DILocation(line: 80, column: 48, scope: !806)
!812 = !DILocation(line: 80, column: 42, scope: !806)
!813 = !DILocation(line: 80, column: 40, scope: !806)
!814 = !DILocation(line: 81, column: 29, scope: !806)
!815 = !DILocation(line: 81, column: 27, scope: !806)
!816 = !DILocation(line: 81, column: 42, scope: !806)
!817 = !DILocation(line: 81, column: 40, scope: !806)
!818 = !DILocation(line: 81, column: 18, scope: !806)
!819 = !DILocation(line: 78, column: 30, scope: !820)
!820 = !DILexicalBlockFile(scope: !807, file: !1, discriminator: 2)
!821 = !DILocation(line: 78, column: 24, scope: !822)
!822 = !DILexicalBlockFile(scope: !807, file: !1, discriminator: 1)
!823 = distinct !{!823, !824, !825}
!824 = !DILocation(line: 78, column: 10, scope: !802)
!825 = !DILocation(line: 82, column: 4, scope: !802)
!826 = !DILocation(line: 76, column: 26, scope: !827)
!827 = !DILexicalBlockFile(scope: !804, file: !1, discriminator: 2)
!828 = !DILocation(line: 76, column: 20, scope: !829)
!829 = !DILexicalBlockFile(scope: !804, file: !1, discriminator: 1)
!830 = distinct !{!830, !831, !832}
!831 = !DILocation(line: 76, column: 6, scope: !795)
!832 = !DILocation(line: 83, column: 3, scope: !795)
!833 = !DILocation(line: 74, column: 24, scope: !834)
!834 = !DILexicalBlockFile(scope: !797, file: !1, discriminator: 2)
!835 = !DILocation(line: 74, column: 18, scope: !836)
!836 = !DILexicalBlockFile(scope: !797, file: !1, discriminator: 1)
!837 = !DILocation(line: 74, column: 4, scope: !838)
!838 = !DILexicalBlockFile(scope: !798, file: !1, discriminator: 1)
!839 = distinct !{!839, !840, !841}
!840 = !DILocation(line: 74, column: 4, scope: !798)
!841 = !DILocation(line: 84, column: 2, scope: !798)
!842 = !DILocation(line: 85, column: 1, scope: !760)
!843 = distinct !DISubprogram(name: "compareResults", linkageName: "_Z14compareResultsPfS_", scope: !1, file: !1, line: 88, type: !844, isLocal: false, isDefinition: true, scopeLine: 89, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !846)
!844 = !DISubroutineType(types: !845)
!845 = !{null, !19, !19}
!846 = !{!847, !848, !849, !850, !851}
!847 = !DILocalVariable(name: "C", arg: 1, scope: !843, file: !1, line: 88, type: !19)
!848 = !DILocalVariable(name: "C_outputFromGpu", arg: 2, scope: !843, file: !1, line: 88, type: !19)
!849 = !DILocalVariable(name: "i", scope: !843, file: !1, line: 90, type: !86)
!850 = !DILocalVariable(name: "j", scope: !843, file: !1, line: 90, type: !86)
!851 = !DILocalVariable(name: "fail", scope: !843, file: !1, line: 90, type: !86)
!852 = !DILocation(line: 88, column: 32, scope: !843)
!853 = !DILocation(line: 88, column: 46, scope: !843)
!854 = !DILocation(line: 90, column: 10, scope: !843)
!855 = !DILocation(line: 90, column: 6, scope: !843)
!856 = !DILocation(line: 94, column: 2, scope: !857)
!857 = !DILexicalBlockFile(scope: !858, file: !1, discriminator: 1)
!858 = distinct !DILexicalBlock(scope: !843, file: !1, line: 94, column: 2)
!859 = !DILocation(line: 90, column: 8, scope: !843)
!860 = !DILocation(line: 96, column: 3, scope: !861)
!861 = !DILexicalBlockFile(scope: !862, file: !1, discriminator: 1)
!862 = distinct !DILexicalBlock(scope: !863, file: !1, line: 96, column: 3)
!863 = distinct !DILexicalBlock(scope: !864, file: !1, line: 95, column: 2)
!864 = distinct !DILexicalBlock(scope: !858, file: !1, line: 94, column: 2)
!865 = !DILocation(line: 96, column: 19, scope: !866)
!866 = !DILexicalBlockFile(scope: !867, file: !1, discriminator: 2)
!867 = distinct !DILexicalBlock(scope: !862, file: !1, line: 96, column: 3)
!868 = !DILocation(line: 98, column: 26, scope: !869)
!869 = distinct !DILexicalBlock(scope: !870, file: !1, line: 98, column: 8)
!870 = distinct !DILexicalBlock(scope: !867, file: !1, line: 97, column: 3)
!871 = !DILocation(line: 98, column: 20, scope: !869)
!872 = !DILocation(line: 98, column: 32, scope: !869)
!873 = !DILocation(line: 24, column: 7, scope: !631, inlinedAt: !874)
!874 = distinct !DILocation(line: 38, column: 7, scope: !645, inlinedAt: !875)
!875 = distinct !DILocation(line: 98, column: 8, scope: !869)
!876 = !DILocation(line: 26, column: 13, scope: !633, inlinedAt: !874)
!877 = !DILocation(line: 24, column: 5, scope: !626, inlinedAt: !874)
!878 = !DILocation(line: 38, column: 7, scope: !645, inlinedAt: !875)
!879 = !DILocation(line: 38, column: 20, scope: !645, inlinedAt: !875)
!880 = !DILocation(line: 24, column: 7, scope: !631, inlinedAt: !881)
!881 = distinct !DILocation(line: 38, column: 32, scope: !655, inlinedAt: !875)
!882 = !DILocation(line: 26, column: 13, scope: !633, inlinedAt: !881)
!883 = !DILocation(line: 24, column: 5, scope: !626, inlinedAt: !881)
!884 = !DILocation(line: 38, column: 32, scope: !655, inlinedAt: !875)
!885 = !DILocation(line: 38, column: 45, scope: !655, inlinedAt: !875)
!886 = !DILocation(line: 45, column: 38, scope: !666, inlinedAt: !875)
!887 = !DILocation(line: 24, column: 7, scope: !631, inlinedAt: !888)
!888 = distinct !DILocation(line: 45, column: 31, scope: !666, inlinedAt: !875)
!889 = !DILocation(line: 26, column: 13, scope: !633, inlinedAt: !888)
!890 = !DILocation(line: 24, column: 5, scope: !626, inlinedAt: !888)
!891 = !DILocation(line: 45, column: 60, scope: !666, inlinedAt: !875)
!892 = !DILocation(line: 24, column: 7, scope: !631, inlinedAt: !893)
!893 = distinct !DILocation(line: 45, column: 53, scope: !677, inlinedAt: !875)
!894 = !DILocation(line: 26, column: 13, scope: !633, inlinedAt: !893)
!895 = !DILocation(line: 24, column: 5, scope: !626, inlinedAt: !893)
!896 = !DILocation(line: 45, column: 51, scope: !666, inlinedAt: !875)
!897 = !DILocation(line: 24, column: 7, scope: !631, inlinedAt: !898)
!898 = distinct !DILocation(line: 45, column: 24, scope: !684, inlinedAt: !875)
!899 = !DILocation(line: 26, column: 13, scope: !633, inlinedAt: !898)
!900 = !DILocation(line: 24, column: 5, scope: !626, inlinedAt: !898)
!901 = !DILocation(line: 45, column: 21, scope: !666, inlinedAt: !875)
!902 = !DILocation(line: 98, column: 8, scope: !869)
!903 = !DILocation(line: 98, column: 58, scope: !869)
!904 = !DILocation(line: 98, column: 8, scope: !870)
!905 = distinct !{!905, !906, !907, !752, !753}
!906 = !DILocation(line: 96, column: 3, scope: !862)
!907 = !DILocation(line: 102, column: 3, scope: !862)
!908 = !DILocation(line: 94, column: 18, scope: !909)
!909 = !DILexicalBlockFile(scope: !864, file: !1, discriminator: 2)
!910 = !DILocation(line: 94, column: 13, scope: !911)
!911 = !DILexicalBlockFile(scope: !864, file: !1, discriminator: 1)
!912 = distinct !{!912, !913, !914}
!913 = !DILocation(line: 94, column: 2, scope: !858)
!914 = !DILocation(line: 103, column: 2, scope: !858)
!915 = !DILocation(line: 106, column: 2, scope: !843)
!916 = !DILocation(line: 107, column: 1, scope: !843)
!917 = distinct !DISubprogram(name: "GPU_argv_init", linkageName: "_Z13GPU_argv_initv", scope: !1, file: !1, line: 110, type: !283, isLocal: false, isDefinition: true, scopeLine: 111, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !918)
!918 = !{!919}
!919 = !DILocalVariable(name: "deviceProp", scope: !917, file: !1, line: 112, type: !920)
!920 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "cudaDeviceProp", file: !4, line: 1257, size: 5056, elements: !921, identifier: "_ZTS14cudaDeviceProp")
!921 = !{!922, !926, !927, !928, !929, !930, !931, !932, !936, !937, !938, !939, !940, !941, !942, !943, !944, !945, !946, !947, !948, !949, !950, !951, !952, !956, !957, !958, !959, !960, !961, !962, !963, !964, !965, !966, !967, !968, !969, !970, !971, !972, !973, !974, !975, !976, !977, !978, !979, !980, !981, !982, !983, !984, !985, !986, !987, !988, !989, !990, !991, !992}
!922 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !920, file: !4, line: 1259, baseType: !923, size: 2048)
!923 = !DICompositeType(tag: DW_TAG_array_type, baseType: !168, size: 2048, elements: !924)
!924 = !{!925}
!925 = !DISubrange(count: 256)
!926 = !DIDerivedType(tag: DW_TAG_member, name: "totalGlobalMem", scope: !920, file: !4, line: 1260, baseType: !16, size: 64, offset: 2048)
!927 = !DIDerivedType(tag: DW_TAG_member, name: "sharedMemPerBlock", scope: !920, file: !4, line: 1261, baseType: !16, size: 64, offset: 2112)
!928 = !DIDerivedType(tag: DW_TAG_member, name: "regsPerBlock", scope: !920, file: !4, line: 1262, baseType: !86, size: 32, offset: 2176)
!929 = !DIDerivedType(tag: DW_TAG_member, name: "warpSize", scope: !920, file: !4, line: 1263, baseType: !86, size: 32, offset: 2208)
!930 = !DIDerivedType(tag: DW_TAG_member, name: "memPitch", scope: !920, file: !4, line: 1264, baseType: !16, size: 64, offset: 2240)
!931 = !DIDerivedType(tag: DW_TAG_member, name: "maxThreadsPerBlock", scope: !920, file: !4, line: 1265, baseType: !86, size: 32, offset: 2304)
!932 = !DIDerivedType(tag: DW_TAG_member, name: "maxThreadsDim", scope: !920, file: !4, line: 1266, baseType: !933, size: 96, offset: 2336)
!933 = !DICompositeType(tag: DW_TAG_array_type, baseType: !86, size: 96, elements: !934)
!934 = !{!935}
!935 = !DISubrange(count: 3)
!936 = !DIDerivedType(tag: DW_TAG_member, name: "maxGridSize", scope: !920, file: !4, line: 1267, baseType: !933, size: 96, offset: 2432)
!937 = !DIDerivedType(tag: DW_TAG_member, name: "clockRate", scope: !920, file: !4, line: 1268, baseType: !86, size: 32, offset: 2528)
!938 = !DIDerivedType(tag: DW_TAG_member, name: "totalConstMem", scope: !920, file: !4, line: 1269, baseType: !16, size: 64, offset: 2560)
!939 = !DIDerivedType(tag: DW_TAG_member, name: "major", scope: !920, file: !4, line: 1270, baseType: !86, size: 32, offset: 2624)
!940 = !DIDerivedType(tag: DW_TAG_member, name: "minor", scope: !920, file: !4, line: 1271, baseType: !86, size: 32, offset: 2656)
!941 = !DIDerivedType(tag: DW_TAG_member, name: "textureAlignment", scope: !920, file: !4, line: 1272, baseType: !16, size: 64, offset: 2688)
!942 = !DIDerivedType(tag: DW_TAG_member, name: "texturePitchAlignment", scope: !920, file: !4, line: 1273, baseType: !16, size: 64, offset: 2752)
!943 = !DIDerivedType(tag: DW_TAG_member, name: "deviceOverlap", scope: !920, file: !4, line: 1274, baseType: !86, size: 32, offset: 2816)
!944 = !DIDerivedType(tag: DW_TAG_member, name: "multiProcessorCount", scope: !920, file: !4, line: 1275, baseType: !86, size: 32, offset: 2848)
!945 = !DIDerivedType(tag: DW_TAG_member, name: "kernelExecTimeoutEnabled", scope: !920, file: !4, line: 1276, baseType: !86, size: 32, offset: 2880)
!946 = !DIDerivedType(tag: DW_TAG_member, name: "integrated", scope: !920, file: !4, line: 1277, baseType: !86, size: 32, offset: 2912)
!947 = !DIDerivedType(tag: DW_TAG_member, name: "canMapHostMemory", scope: !920, file: !4, line: 1278, baseType: !86, size: 32, offset: 2944)
!948 = !DIDerivedType(tag: DW_TAG_member, name: "computeMode", scope: !920, file: !4, line: 1279, baseType: !86, size: 32, offset: 2976)
!949 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture1D", scope: !920, file: !4, line: 1280, baseType: !86, size: 32, offset: 3008)
!950 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture1DMipmap", scope: !920, file: !4, line: 1281, baseType: !86, size: 32, offset: 3040)
!951 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture1DLinear", scope: !920, file: !4, line: 1282, baseType: !86, size: 32, offset: 3072)
!952 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2D", scope: !920, file: !4, line: 1283, baseType: !953, size: 64, offset: 3104)
!953 = !DICompositeType(tag: DW_TAG_array_type, baseType: !86, size: 64, elements: !954)
!954 = !{!955}
!955 = !DISubrange(count: 2)
!956 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2DMipmap", scope: !920, file: !4, line: 1284, baseType: !953, size: 64, offset: 3168)
!957 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2DLinear", scope: !920, file: !4, line: 1285, baseType: !933, size: 96, offset: 3232)
!958 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2DGather", scope: !920, file: !4, line: 1286, baseType: !953, size: 64, offset: 3328)
!959 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture3D", scope: !920, file: !4, line: 1287, baseType: !933, size: 96, offset: 3392)
!960 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture3DAlt", scope: !920, file: !4, line: 1288, baseType: !933, size: 96, offset: 3488)
!961 = !DIDerivedType(tag: DW_TAG_member, name: "maxTextureCubemap", scope: !920, file: !4, line: 1289, baseType: !86, size: 32, offset: 3584)
!962 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture1DLayered", scope: !920, file: !4, line: 1290, baseType: !953, size: 64, offset: 3616)
!963 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2DLayered", scope: !920, file: !4, line: 1291, baseType: !933, size: 96, offset: 3680)
!964 = !DIDerivedType(tag: DW_TAG_member, name: "maxTextureCubemapLayered", scope: !920, file: !4, line: 1292, baseType: !953, size: 64, offset: 3776)
!965 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface1D", scope: !920, file: !4, line: 1293, baseType: !86, size: 32, offset: 3840)
!966 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface2D", scope: !920, file: !4, line: 1294, baseType: !953, size: 64, offset: 3872)
!967 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface3D", scope: !920, file: !4, line: 1295, baseType: !933, size: 96, offset: 3936)
!968 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface1DLayered", scope: !920, file: !4, line: 1296, baseType: !953, size: 64, offset: 4032)
!969 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface2DLayered", scope: !920, file: !4, line: 1297, baseType: !933, size: 96, offset: 4096)
!970 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurfaceCubemap", scope: !920, file: !4, line: 1298, baseType: !86, size: 32, offset: 4192)
!971 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurfaceCubemapLayered", scope: !920, file: !4, line: 1299, baseType: !953, size: 64, offset: 4224)
!972 = !DIDerivedType(tag: DW_TAG_member, name: "surfaceAlignment", scope: !920, file: !4, line: 1300, baseType: !16, size: 64, offset: 4288)
!973 = !DIDerivedType(tag: DW_TAG_member, name: "concurrentKernels", scope: !920, file: !4, line: 1301, baseType: !86, size: 32, offset: 4352)
!974 = !DIDerivedType(tag: DW_TAG_member, name: "ECCEnabled", scope: !920, file: !4, line: 1302, baseType: !86, size: 32, offset: 4384)
!975 = !DIDerivedType(tag: DW_TAG_member, name: "pciBusID", scope: !920, file: !4, line: 1303, baseType: !86, size: 32, offset: 4416)
!976 = !DIDerivedType(tag: DW_TAG_member, name: "pciDeviceID", scope: !920, file: !4, line: 1304, baseType: !86, size: 32, offset: 4448)
!977 = !DIDerivedType(tag: DW_TAG_member, name: "pciDomainID", scope: !920, file: !4, line: 1305, baseType: !86, size: 32, offset: 4480)
!978 = !DIDerivedType(tag: DW_TAG_member, name: "tccDriver", scope: !920, file: !4, line: 1306, baseType: !86, size: 32, offset: 4512)
!979 = !DIDerivedType(tag: DW_TAG_member, name: "asyncEngineCount", scope: !920, file: !4, line: 1307, baseType: !86, size: 32, offset: 4544)
!980 = !DIDerivedType(tag: DW_TAG_member, name: "unifiedAddressing", scope: !920, file: !4, line: 1308, baseType: !86, size: 32, offset: 4576)
!981 = !DIDerivedType(tag: DW_TAG_member, name: "memoryClockRate", scope: !920, file: !4, line: 1309, baseType: !86, size: 32, offset: 4608)
!982 = !DIDerivedType(tag: DW_TAG_member, name: "memoryBusWidth", scope: !920, file: !4, line: 1310, baseType: !86, size: 32, offset: 4640)
!983 = !DIDerivedType(tag: DW_TAG_member, name: "l2CacheSize", scope: !920, file: !4, line: 1311, baseType: !86, size: 32, offset: 4672)
!984 = !DIDerivedType(tag: DW_TAG_member, name: "maxThreadsPerMultiProcessor", scope: !920, file: !4, line: 1312, baseType: !86, size: 32, offset: 4704)
!985 = !DIDerivedType(tag: DW_TAG_member, name: "streamPrioritiesSupported", scope: !920, file: !4, line: 1313, baseType: !86, size: 32, offset: 4736)
!986 = !DIDerivedType(tag: DW_TAG_member, name: "globalL1CacheSupported", scope: !920, file: !4, line: 1314, baseType: !86, size: 32, offset: 4768)
!987 = !DIDerivedType(tag: DW_TAG_member, name: "localL1CacheSupported", scope: !920, file: !4, line: 1315, baseType: !86, size: 32, offset: 4800)
!988 = !DIDerivedType(tag: DW_TAG_member, name: "sharedMemPerMultiprocessor", scope: !920, file: !4, line: 1316, baseType: !16, size: 64, offset: 4864)
!989 = !DIDerivedType(tag: DW_TAG_member, name: "regsPerMultiprocessor", scope: !920, file: !4, line: 1317, baseType: !86, size: 32, offset: 4928)
!990 = !DIDerivedType(tag: DW_TAG_member, name: "managedMemory", scope: !920, file: !4, line: 1318, baseType: !86, size: 32, offset: 4960)
!991 = !DIDerivedType(tag: DW_TAG_member, name: "isMultiGpuBoard", scope: !920, file: !4, line: 1319, baseType: !86, size: 32, offset: 4992)
!992 = !DIDerivedType(tag: DW_TAG_member, name: "multiGpuBoardGroupID", scope: !920, file: !4, line: 1320, baseType: !86, size: 32, offset: 5024)
!993 = !DILocation(line: 112, column: 2, scope: !917)
!994 = !DILocation(line: 112, column: 17, scope: !917)
!995 = !DILocation(line: 113, column: 2, scope: !917)
!996 = !DILocation(line: 114, column: 2, scope: !917)
!997 = !DILocation(line: 115, column: 2, scope: !917)
!998 = !DILocation(line: 116, column: 1, scope: !917)
!999 = distinct !DISubprogram(name: "syr2k_kernel", linkageName: "_Z12syr2k_kernelPfS_S_", scope: !1, file: !1, line: 119, type: !692, isLocal: false, isDefinition: true, scopeLine: 120, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !1000)
!1000 = !{!1001, !1002, !1003}
!1001 = !DILocalVariable(name: "a", arg: 1, scope: !999, file: !1, line: 119, type: !19)
!1002 = !DILocalVariable(name: "b", arg: 2, scope: !999, file: !1, line: 119, type: !19)
!1003 = !DILocalVariable(name: "c", arg: 3, scope: !999, file: !1, line: 119, type: !19)
!1004 = !DILocation(line: 119, column: 41, scope: !999)
!1005 = !{!1006, !1006, i64 0}
!1006 = !{!"any pointer", !616, i64 0}
!1007 = !DILocation(line: 119, column: 55, scope: !999)
!1008 = !DILocation(line: 119, column: 69, scope: !999)
!1009 = !DILocation(line: 120, column: 1, scope: !999)
!1010 = !DILocation(line: 120, column: 1, scope: !1011)
!1011 = !DILexicalBlockFile(scope: !999, file: !1, discriminator: 1)
!1012 = !DILocation(line: 120, column: 1, scope: !1013)
!1013 = !DILexicalBlockFile(scope: !999, file: !1, discriminator: 2)
!1014 = !DILocation(line: 120, column: 1, scope: !1015)
!1015 = !DILexicalBlockFile(scope: !999, file: !1, discriminator: 3)
!1016 = !DILocation(line: 134, column: 1, scope: !999)
!1017 = distinct !DISubprogram(name: "syr2kCuda", linkageName: "_Z9syr2kCudaPfS_S_S_", scope: !1, file: !1, line: 137, type: !1018, isLocal: false, isDefinition: true, scopeLine: 138, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !1020)
!1018 = !DISubroutineType(types: !1019)
!1019 = !{null, !19, !19, !19, !19}
!1020 = !{!1021, !1022, !1023, !1024, !1025, !1026, !1027, !1028, !1029, !1030, !1054}
!1021 = !DILocalVariable(name: "A", arg: 1, scope: !1017, file: !1, line: 137, type: !19)
!1022 = !DILocalVariable(name: "B", arg: 2, scope: !1017, file: !1, line: 137, type: !19)
!1023 = !DILocalVariable(name: "C", arg: 3, scope: !1017, file: !1, line: 137, type: !19)
!1024 = !DILocalVariable(name: "C_outputFromGpu", arg: 4, scope: !1017, file: !1, line: 137, type: !19)
!1025 = !DILocalVariable(name: "t_start", scope: !1017, file: !1, line: 139, type: !165)
!1026 = !DILocalVariable(name: "t_end", scope: !1017, file: !1, line: 139, type: !165)
!1027 = !DILocalVariable(name: "A_gpu", scope: !1017, file: !1, line: 141, type: !19)
!1028 = !DILocalVariable(name: "B_gpu", scope: !1017, file: !1, line: 142, type: !19)
!1029 = !DILocalVariable(name: "C_gpu", scope: !1017, file: !1, line: 143, type: !19)
!1030 = !DILocalVariable(name: "block", scope: !1017, file: !1, line: 152, type: !1031)
!1031 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !1032, line: 427, baseType: !1033)
!1032 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/syr2kllvm")
!1033 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !1032, line: 417, size: 96, elements: !1034, identifier: "_ZTS4dim3")
!1034 = !{!1035, !1036, !1037, !1038, !1042, !1051}
!1035 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1033, file: !1032, line: 419, baseType: !379, size: 32)
!1036 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1033, file: !1032, line: 419, baseType: !379, size: 32, offset: 32)
!1037 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1033, file: !1032, line: 419, baseType: !379, size: 32, offset: 64)
!1038 = !DISubprogram(name: "dim3", scope: !1033, file: !1032, line: 421, type: !1039, isLocal: false, isDefinition: false, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: true)
!1039 = !DISubroutineType(types: !1040)
!1040 = !{null, !1041, !379, !379, !379}
!1041 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1033, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1042 = !DISubprogram(name: "dim3", scope: !1033, file: !1032, line: 422, type: !1043, isLocal: false, isDefinition: false, scopeLine: 422, flags: DIFlagPrototyped, isOptimized: true)
!1043 = !DISubroutineType(types: !1044)
!1044 = !{null, !1041, !1045}
!1045 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !1032, line: 383, baseType: !1046)
!1046 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !1032, line: 190, size: 96, elements: !1047, identifier: "_ZTS5uint3")
!1047 = !{!1048, !1049, !1050}
!1048 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1046, file: !1032, line: 192, baseType: !379, size: 32)
!1049 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1046, file: !1032, line: 192, baseType: !379, size: 32, offset: 32)
!1050 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1046, file: !1032, line: 192, baseType: !379, size: 32, offset: 64)
!1051 = !DISubprogram(name: "operator uint3", linkageName: "_ZN4dim3cv5uint3Ev", scope: !1033, file: !1032, line: 423, type: !1052, isLocal: false, isDefinition: false, scopeLine: 423, flags: DIFlagPrototyped, isOptimized: true)
!1052 = !DISubroutineType(types: !1053)
!1053 = !{!1045, !1041}
!1054 = !DILocalVariable(name: "grid", scope: !1017, file: !1, line: 153, type: !1031)
!1055 = !DILocation(line: 137, column: 27, scope: !1017)
!1056 = !DILocation(line: 137, column: 41, scope: !1017)
!1057 = !DILocation(line: 137, column: 55, scope: !1017)
!1058 = !DILocation(line: 137, column: 69, scope: !1017)
!1059 = !DILocation(line: 141, column: 2, scope: !1017)
!1060 = !DILocation(line: 142, column: 2, scope: !1017)
!1061 = !DILocation(line: 143, column: 2, scope: !1017)
!1062 = !DILocation(line: 145, column: 13, scope: !1017)
!1063 = !DILocation(line: 145, column: 2, scope: !1017)
!1064 = !DILocation(line: 146, column: 13, scope: !1017)
!1065 = !DILocation(line: 146, column: 2, scope: !1017)
!1066 = !DILocation(line: 147, column: 13, scope: !1017)
!1067 = !DILocation(line: 147, column: 2, scope: !1017)
!1068 = !DILocation(line: 148, column: 13, scope: !1017)
!1069 = !DILocation(line: 148, column: 20, scope: !1017)
!1070 = !DILocation(line: 148, column: 2, scope: !1017)
!1071 = !DILocation(line: 149, column: 13, scope: !1017)
!1072 = !DILocation(line: 149, column: 20, scope: !1017)
!1073 = !DILocation(line: 149, column: 2, scope: !1017)
!1074 = !DILocation(line: 150, column: 13, scope: !1017)
!1075 = !DILocation(line: 150, column: 20, scope: !1017)
!1076 = !DILocation(line: 150, column: 2, scope: !1017)
!1077 = !DILocation(line: 152, column: 7, scope: !1017)
!1078 = !DILocation(line: 153, column: 7, scope: !1017)
!1079 = !DILocation(line: 13, column: 5, scope: !578, inlinedAt: !1080)
!1080 = distinct !DILocation(line: 159, column: 12, scope: !1017)
!1081 = !DILocation(line: 14, column: 5, scope: !578, inlinedAt: !1080)
!1082 = !DILocation(line: 13, column: 21, scope: !578, inlinedAt: !1080)
!1083 = !DILocation(line: 14, column: 20, scope: !578, inlinedAt: !1080)
!1084 = !DILocation(line: 16, column: 12, scope: !578, inlinedAt: !1080)
!1085 = !DILocation(line: 15, column: 9, scope: !578, inlinedAt: !1080)
!1086 = !DILocation(line: 17, column: 14, scope: !608, inlinedAt: !1080)
!1087 = !DILocation(line: 17, column: 9, scope: !578, inlinedAt: !1080)
!1088 = !DILocation(line: 17, column: 20, scope: !611, inlinedAt: !1080)
!1089 = !DILocation(line: 18, column: 15, scope: !578, inlinedAt: !1080)
!1090 = !DILocation(line: 18, column: 12, scope: !578, inlinedAt: !1080)
!1091 = !DILocation(line: 18, column: 27, scope: !578, inlinedAt: !1080)
!1092 = !DILocation(line: 18, column: 24, scope: !578, inlinedAt: !1080)
!1093 = !DILocation(line: 18, column: 34, scope: !578, inlinedAt: !1080)
!1094 = !DILocation(line: 18, column: 22, scope: !578, inlinedAt: !1080)
!1095 = !DILocation(line: 19, column: 1, scope: !578, inlinedAt: !1080)
!1096 = !DILocation(line: 139, column: 9, scope: !1017)
!1097 = !DILocation(line: 160, column: 14, scope: !1017)
!1098 = !DILocation(line: 160, column: 2, scope: !1017)
!1099 = !DILocation(line: 160, column: 31, scope: !1100)
!1100 = !DILexicalBlockFile(scope: !1017, file: !1, discriminator: 1)
!1101 = !DILocation(line: 160, column: 37, scope: !1100)
!1102 = !DILocation(line: 160, column: 43, scope: !1100)
!1103 = !DILocation(line: 119, column: 41, scope: !999, inlinedAt: !1104)
!1104 = distinct !DILocation(line: 160, column: 2, scope: !1100)
!1105 = !DILocation(line: 120, column: 1, scope: !999, inlinedAt: !1104)
!1106 = !DILocation(line: 120, column: 1, scope: !1011, inlinedAt: !1104)
!1107 = !DILocation(line: 120, column: 1, scope: !1013, inlinedAt: !1104)
!1108 = !DILocation(line: 120, column: 1, scope: !1015, inlinedAt: !1104)
!1109 = !DILocation(line: 134, column: 1, scope: !999, inlinedAt: !1104)
!1110 = !DILocation(line: 160, column: 2, scope: !1100)
!1111 = !DILocation(line: 161, column: 2, scope: !1017)
!1112 = !DILocation(line: 13, column: 5, scope: !578, inlinedAt: !1113)
!1113 = distinct !DILocation(line: 162, column: 10, scope: !1017)
!1114 = !DILocation(line: 14, column: 5, scope: !578, inlinedAt: !1113)
!1115 = !DILocation(line: 13, column: 21, scope: !578, inlinedAt: !1113)
!1116 = !DILocation(line: 14, column: 20, scope: !578, inlinedAt: !1113)
!1117 = !DILocation(line: 16, column: 12, scope: !578, inlinedAt: !1113)
!1118 = !DILocation(line: 15, column: 9, scope: !578, inlinedAt: !1113)
!1119 = !DILocation(line: 17, column: 14, scope: !608, inlinedAt: !1113)
!1120 = !DILocation(line: 17, column: 9, scope: !578, inlinedAt: !1113)
!1121 = !DILocation(line: 17, column: 20, scope: !611, inlinedAt: !1113)
!1122 = !DILocation(line: 18, column: 15, scope: !578, inlinedAt: !1113)
!1123 = !DILocation(line: 18, column: 12, scope: !578, inlinedAt: !1113)
!1124 = !DILocation(line: 18, column: 27, scope: !578, inlinedAt: !1113)
!1125 = !DILocation(line: 18, column: 24, scope: !578, inlinedAt: !1113)
!1126 = !DILocation(line: 18, column: 34, scope: !578, inlinedAt: !1113)
!1127 = !DILocation(line: 18, column: 22, scope: !578, inlinedAt: !1113)
!1128 = !DILocation(line: 19, column: 1, scope: !578, inlinedAt: !1113)
!1129 = !DILocation(line: 139, column: 18, scope: !1017)
!1130 = !DILocation(line: 163, column: 10, scope: !1017)
!1131 = !DILocation(line: 163, column: 51, scope: !1017)
!1132 = !DILocation(line: 163, column: 2, scope: !1017)
!1133 = !DILocation(line: 164, column: 10, scope: !1017)
!1134 = !DILocation(line: 164, column: 2, scope: !1017)
!1135 = !DILocation(line: 166, column: 13, scope: !1017)
!1136 = !DILocation(line: 166, column: 30, scope: !1017)
!1137 = !DILocation(line: 166, column: 2, scope: !1017)
!1138 = !DILocation(line: 168, column: 11, scope: !1017)
!1139 = !DILocation(line: 168, column: 2, scope: !1017)
!1140 = !DILocation(line: 169, column: 11, scope: !1017)
!1141 = !DILocation(line: 169, column: 2, scope: !1017)
!1142 = !DILocation(line: 170, column: 11, scope: !1017)
!1143 = !DILocation(line: 170, column: 2, scope: !1017)
!1144 = !DILocation(line: 171, column: 1, scope: !1017)
!1145 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 174, type: !369, isLocal: false, isDefinition: true, scopeLine: 175, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !1146)
!1146 = !{!1147, !1148, !1149, !1150, !1151, !1152}
!1147 = !DILocalVariable(name: "t_start", scope: !1145, file: !1, line: 176, type: !165)
!1148 = !DILocalVariable(name: "t_end", scope: !1145, file: !1, line: 176, type: !165)
!1149 = !DILocalVariable(name: "A", scope: !1145, file: !1, line: 178, type: !19)
!1150 = !DILocalVariable(name: "B", scope: !1145, file: !1, line: 179, type: !19)
!1151 = !DILocalVariable(name: "C", scope: !1145, file: !1, line: 180, type: !19)
!1152 = !DILocalVariable(name: "C_outputFromGpu", scope: !1145, file: !1, line: 181, type: !19)
!1153 = !DILocation(line: 183, column: 18, scope: !1145)
!1154 = !DILocation(line: 183, column: 6, scope: !1145)
!1155 = !DILocation(line: 178, column: 13, scope: !1145)
!1156 = !DILocation(line: 184, column: 18, scope: !1145)
!1157 = !DILocation(line: 184, column: 6, scope: !1145)
!1158 = !DILocation(line: 179, column: 13, scope: !1145)
!1159 = !DILocation(line: 185, column: 18, scope: !1145)
!1160 = !DILocation(line: 185, column: 6, scope: !1145)
!1161 = !DILocation(line: 180, column: 13, scope: !1145)
!1162 = !DILocation(line: 186, column: 32, scope: !1145)
!1163 = !DILocation(line: 181, column: 13, scope: !1145)
!1164 = !DILocation(line: 42, column: 29, scope: !691, inlinedAt: !1165)
!1165 = distinct !DILocation(line: 188, column: 2, scope: !1145)
!1166 = !DILocation(line: 42, column: 43, scope: !691, inlinedAt: !1165)
!1167 = !DILocation(line: 42, column: 57, scope: !691, inlinedAt: !1165)
!1168 = !DILocation(line: 44, column: 6, scope: !691, inlinedAt: !1165)
!1169 = !DILocation(line: 46, column: 2, scope: !705, inlinedAt: !1165)
!1170 = !DILocation(line: 44, column: 9, scope: !691, inlinedAt: !1165)
!1171 = !DILocation(line: 48, column: 7, scope: !709, inlinedAt: !1165)
!1172 = !DILocation(line: 50, column: 31, scope: !714, inlinedAt: !1165)
!1173 = !DILocation(line: 50, column: 34, scope: !714, inlinedAt: !1165)
!1174 = !DILocation(line: 50, column: 39, scope: !714, inlinedAt: !1165)
!1175 = !DILocation(line: 50, column: 4, scope: !714, inlinedAt: !1165)
!1176 = !DILocation(line: 50, column: 15, scope: !714, inlinedAt: !1165)
!1177 = !DILocation(line: 50, column: 10, scope: !714, inlinedAt: !1165)
!1178 = !DILocation(line: 55, column: 34, scope: !724, inlinedAt: !1165)
!1179 = !DILocation(line: 55, column: 33, scope: !724, inlinedAt: !1165)
!1180 = !DILocation(line: 55, column: 37, scope: !724, inlinedAt: !1165)
!1181 = !DILocation(line: 55, column: 6, scope: !724, inlinedAt: !1165)
!1182 = !DILocation(line: 55, column: 17, scope: !724, inlinedAt: !1165)
!1183 = !DILocation(line: 56, column: 36, scope: !724, inlinedAt: !1165)
!1184 = !DILocation(line: 56, column: 41, scope: !724, inlinedAt: !1165)
!1185 = !DILocation(line: 56, column: 6, scope: !724, inlinedAt: !1165)
!1186 = !DILocation(line: 56, column: 17, scope: !724, inlinedAt: !1165)
!1187 = !DILocation(line: 55, column: 12, scope: !724, inlinedAt: !1165)
!1188 = !DILocation(line: 46, column: 22, scope: !742, inlinedAt: !1165)
!1189 = !DILocation(line: 46, column: 16, scope: !755, inlinedAt: !1165)
!1190 = !DILocation(line: 186, column: 20, scope: !1145)
!1191 = !DILocation(line: 112, column: 2, scope: !917, inlinedAt: !1192)
!1192 = distinct !DILocation(line: 190, column: 2, scope: !1145)
!1193 = !DILocation(line: 112, column: 17, scope: !917, inlinedAt: !1192)
!1194 = !DILocation(line: 113, column: 2, scope: !917, inlinedAt: !1192)
!1195 = !DILocation(line: 114, column: 2, scope: !917, inlinedAt: !1192)
!1196 = !DILocation(line: 115, column: 2, scope: !917, inlinedAt: !1192)
!1197 = !DILocation(line: 116, column: 1, scope: !917, inlinedAt: !1192)
!1198 = !DILocation(line: 191, column: 2, scope: !1145)
!1199 = !DILocation(line: 13, column: 5, scope: !578, inlinedAt: !1200)
!1200 = distinct !DILocation(line: 193, column: 12, scope: !1145)
!1201 = !DILocation(line: 14, column: 5, scope: !578, inlinedAt: !1200)
!1202 = !DILocation(line: 13, column: 21, scope: !578, inlinedAt: !1200)
!1203 = !DILocation(line: 14, column: 20, scope: !578, inlinedAt: !1200)
!1204 = !DILocation(line: 16, column: 12, scope: !578, inlinedAt: !1200)
!1205 = !DILocation(line: 15, column: 9, scope: !578, inlinedAt: !1200)
!1206 = !DILocation(line: 17, column: 14, scope: !608, inlinedAt: !1200)
!1207 = !DILocation(line: 17, column: 9, scope: !578, inlinedAt: !1200)
!1208 = !DILocation(line: 17, column: 20, scope: !611, inlinedAt: !1200)
!1209 = !DILocation(line: 18, column: 15, scope: !578, inlinedAt: !1200)
!1210 = !DILocation(line: 18, column: 27, scope: !578, inlinedAt: !1200)
!1211 = !DILocation(line: 18, column: 24, scope: !578, inlinedAt: !1200)
!1212 = !DILocation(line: 18, column: 34, scope: !578, inlinedAt: !1200)
!1213 = !DILocation(line: 19, column: 1, scope: !578, inlinedAt: !1200)
!1214 = !DILocation(line: 176, column: 9, scope: !1145)
!1215 = !DILocation(line: 62, column: 23, scope: !760, inlinedAt: !1216)
!1216 = distinct !DILocation(line: 194, column: 2, scope: !1145)
!1217 = !DILocation(line: 62, column: 37, scope: !760, inlinedAt: !1216)
!1218 = !DILocation(line: 62, column: 51, scope: !760, inlinedAt: !1216)
!1219 = !DILocation(line: 64, column: 6, scope: !760, inlinedAt: !1216)
!1220 = !DILocation(line: 66, column: 4, scope: !773, inlinedAt: !1216)
!1221 = !DILocation(line: 64, column: 9, scope: !760, inlinedAt: !1216)
!1222 = !DILocation(line: 68, column: 6, scope: !777, inlinedAt: !1216)
!1223 = !DILocation(line: 70, column: 9, scope: !782, inlinedAt: !1216)
!1224 = !DILocation(line: 70, column: 20, scope: !782, inlinedAt: !1216)
!1225 = !DILocation(line: 70, column: 15, scope: !782, inlinedAt: !1216)
!1226 = !DILocation(line: 66, column: 24, scope: !787, inlinedAt: !1216)
!1227 = !DILocation(line: 66, column: 18, scope: !789, inlinedAt: !1216)
!1228 = !DILocation(line: 18, column: 12, scope: !578, inlinedAt: !1200)
!1229 = !DILocation(line: 18, column: 22, scope: !578, inlinedAt: !1200)
!1230 = !DILocation(line: 76, column: 6, scope: !794, inlinedAt: !1216)
!1231 = !DILocation(line: 64, column: 12, scope: !760, inlinedAt: !1216)
!1232 = !DILocation(line: 78, column: 10, scope: !801, inlinedAt: !1216)
!1233 = !DILocation(line: 80, column: 18, scope: !806, inlinedAt: !1216)
!1234 = !DILocation(line: 80, column: 35, scope: !806, inlinedAt: !1216)
!1235 = !DILocation(line: 80, column: 29, scope: !806, inlinedAt: !1216)
!1236 = !DILocation(line: 80, column: 27, scope: !806, inlinedAt: !1216)
!1237 = !DILocation(line: 80, column: 48, scope: !806, inlinedAt: !1216)
!1238 = !DILocation(line: 80, column: 42, scope: !806, inlinedAt: !1216)
!1239 = !DILocation(line: 80, column: 40, scope: !806, inlinedAt: !1216)
!1240 = !DILocation(line: 81, column: 29, scope: !806, inlinedAt: !1216)
!1241 = !DILocation(line: 81, column: 27, scope: !806, inlinedAt: !1216)
!1242 = !DILocation(line: 81, column: 42, scope: !806, inlinedAt: !1216)
!1243 = !DILocation(line: 81, column: 40, scope: !806, inlinedAt: !1216)
!1244 = !DILocation(line: 81, column: 18, scope: !806, inlinedAt: !1216)
!1245 = !DILocation(line: 78, column: 30, scope: !820, inlinedAt: !1216)
!1246 = !DILocation(line: 78, column: 24, scope: !822, inlinedAt: !1216)
!1247 = !DILocation(line: 76, column: 26, scope: !827, inlinedAt: !1216)
!1248 = !DILocation(line: 76, column: 20, scope: !829, inlinedAt: !1216)
!1249 = !DILocation(line: 74, column: 24, scope: !834, inlinedAt: !1216)
!1250 = !DILocation(line: 74, column: 18, scope: !836, inlinedAt: !1216)
!1251 = !DILocation(line: 74, column: 4, scope: !838, inlinedAt: !1216)
!1252 = !DILocation(line: 13, column: 5, scope: !578, inlinedAt: !1253)
!1253 = distinct !DILocation(line: 195, column: 10, scope: !1145)
!1254 = !DILocation(line: 14, column: 5, scope: !578, inlinedAt: !1253)
!1255 = !DILocation(line: 13, column: 21, scope: !578, inlinedAt: !1253)
!1256 = !DILocation(line: 14, column: 20, scope: !578, inlinedAt: !1253)
!1257 = !DILocation(line: 16, column: 12, scope: !578, inlinedAt: !1253)
!1258 = !DILocation(line: 15, column: 9, scope: !578, inlinedAt: !1253)
!1259 = !DILocation(line: 17, column: 14, scope: !608, inlinedAt: !1253)
!1260 = !DILocation(line: 17, column: 9, scope: !578, inlinedAt: !1253)
!1261 = !DILocation(line: 17, column: 20, scope: !611, inlinedAt: !1253)
!1262 = !DILocation(line: 18, column: 15, scope: !578, inlinedAt: !1253)
!1263 = !DILocation(line: 18, column: 12, scope: !578, inlinedAt: !1253)
!1264 = !DILocation(line: 18, column: 27, scope: !578, inlinedAt: !1253)
!1265 = !DILocation(line: 18, column: 24, scope: !578, inlinedAt: !1253)
!1266 = !DILocation(line: 18, column: 34, scope: !578, inlinedAt: !1253)
!1267 = !DILocation(line: 18, column: 22, scope: !578, inlinedAt: !1253)
!1268 = !DILocation(line: 19, column: 1, scope: !578, inlinedAt: !1253)
!1269 = !DILocation(line: 176, column: 18, scope: !1145)
!1270 = !DILocation(line: 196, column: 10, scope: !1145)
!1271 = !DILocation(line: 196, column: 50, scope: !1145)
!1272 = !DILocation(line: 196, column: 2, scope: !1145)
!1273 = !DILocation(line: 88, column: 32, scope: !843, inlinedAt: !1274)
!1274 = distinct !DILocation(line: 198, column: 2, scope: !1145)
!1275 = !DILocation(line: 88, column: 46, scope: !843, inlinedAt: !1274)
!1276 = !DILocation(line: 90, column: 10, scope: !843, inlinedAt: !1274)
!1277 = !DILocation(line: 90, column: 6, scope: !843, inlinedAt: !1274)
!1278 = !DILocation(line: 94, column: 2, scope: !857, inlinedAt: !1274)
!1279 = !DILocation(line: 90, column: 8, scope: !843, inlinedAt: !1274)
!1280 = !DILocation(line: 96, column: 3, scope: !861, inlinedAt: !1274)
!1281 = !DILocation(line: 96, column: 19, scope: !866, inlinedAt: !1274)
!1282 = !DILocation(line: 98, column: 26, scope: !869, inlinedAt: !1274)
!1283 = !DILocation(line: 98, column: 20, scope: !869, inlinedAt: !1274)
!1284 = !DILocation(line: 98, column: 32, scope: !869, inlinedAt: !1274)
!1285 = !DILocation(line: 24, column: 7, scope: !631, inlinedAt: !1286)
!1286 = distinct !DILocation(line: 38, column: 7, scope: !645, inlinedAt: !1287)
!1287 = distinct !DILocation(line: 98, column: 8, scope: !869, inlinedAt: !1274)
!1288 = !DILocation(line: 26, column: 13, scope: !633, inlinedAt: !1286)
!1289 = !DILocation(line: 24, column: 5, scope: !626, inlinedAt: !1286)
!1290 = !DILocation(line: 38, column: 7, scope: !645, inlinedAt: !1287)
!1291 = !DILocation(line: 38, column: 20, scope: !645, inlinedAt: !1287)
!1292 = !DILocation(line: 24, column: 7, scope: !631, inlinedAt: !1293)
!1293 = distinct !DILocation(line: 38, column: 32, scope: !655, inlinedAt: !1287)
!1294 = !DILocation(line: 26, column: 13, scope: !633, inlinedAt: !1293)
!1295 = !DILocation(line: 24, column: 5, scope: !626, inlinedAt: !1293)
!1296 = !DILocation(line: 38, column: 32, scope: !655, inlinedAt: !1287)
!1297 = !DILocation(line: 38, column: 45, scope: !655, inlinedAt: !1287)
!1298 = !DILocation(line: 45, column: 38, scope: !666, inlinedAt: !1287)
!1299 = !DILocation(line: 24, column: 7, scope: !631, inlinedAt: !1300)
!1300 = distinct !DILocation(line: 45, column: 31, scope: !666, inlinedAt: !1287)
!1301 = !DILocation(line: 26, column: 13, scope: !633, inlinedAt: !1300)
!1302 = !DILocation(line: 24, column: 5, scope: !626, inlinedAt: !1300)
!1303 = !DILocation(line: 45, column: 60, scope: !666, inlinedAt: !1287)
!1304 = !DILocation(line: 24, column: 7, scope: !631, inlinedAt: !1305)
!1305 = distinct !DILocation(line: 45, column: 53, scope: !677, inlinedAt: !1287)
!1306 = !DILocation(line: 26, column: 13, scope: !633, inlinedAt: !1305)
!1307 = !DILocation(line: 24, column: 5, scope: !626, inlinedAt: !1305)
!1308 = !DILocation(line: 45, column: 51, scope: !666, inlinedAt: !1287)
!1309 = !DILocation(line: 24, column: 7, scope: !631, inlinedAt: !1310)
!1310 = distinct !DILocation(line: 45, column: 24, scope: !684, inlinedAt: !1287)
!1311 = !DILocation(line: 26, column: 13, scope: !633, inlinedAt: !1310)
!1312 = !DILocation(line: 24, column: 5, scope: !626, inlinedAt: !1310)
!1313 = !DILocation(line: 45, column: 21, scope: !666, inlinedAt: !1287)
!1314 = !DILocation(line: 98, column: 8, scope: !869, inlinedAt: !1274)
!1315 = !DILocation(line: 98, column: 58, scope: !869, inlinedAt: !1274)
!1316 = !DILocation(line: 98, column: 8, scope: !870, inlinedAt: !1274)
!1317 = distinct !{!1317, !906, !907, !752, !753}
!1318 = !DILocation(line: 94, column: 18, scope: !909, inlinedAt: !1274)
!1319 = !DILocation(line: 94, column: 13, scope: !911, inlinedAt: !1274)
!1320 = !DILocation(line: 106, column: 2, scope: !843, inlinedAt: !1274)
!1321 = !DILocation(line: 200, column: 2, scope: !1145)
!1322 = !DILocation(line: 201, column: 2, scope: !1145)
!1323 = !DILocation(line: 202, column: 2, scope: !1145)
!1324 = !DILocation(line: 203, column: 2, scope: !1145)
!1325 = !DILocation(line: 205, column: 4, scope: !1145)
