; ModuleID = 'bicg.cu'
source_filename = "bicg.cu"
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
@NX = local_unnamed_addr global i32 -1, align 4, !dbg !0
@NY = local_unnamed_addr global i32 -1, align 4, !dbg !27
@.str.1 = private unnamed_addr constant [74 x i8] c"Non-Matching CPU-GPU Outputs Beyond Error Threshold of %4.2f Percent: %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [32 x i8] c"setting device %d with name %s\0A\00", align 1
@.str.3 = private unnamed_addr constant [14 x i8] c"grid1: %d, 1\0A\00", align 1
@.str.4 = private unnamed_addr constant [14 x i8] c"grid2: %d, 1\0A\00", align 1
@stdout = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.5 = private unnamed_addr constant [22 x i8] c"GPU Runtime: %0.6lfs\0A\00", align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.6 = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1
@.str.8 = private unnamed_addr constant [16 x i8] c"size = %d * %d\0A\00", align 1
@.str.9 = private unnamed_addr constant [22 x i8] c"CPU Runtime: %0.6lfs\0A\00", align 1
@str = private unnamed_addr constant [21 x i8] c"requires 2 arguments\00"

; Function Attrs: nounwind uwtable
define double @_Z7rtclockv() local_unnamed_addr #0 !dbg !585 {
entry:
  %Tzp = alloca %struct.timezone, align 4
  %Tp = alloca %struct.timeval, align 8
  %0 = bitcast %struct.timezone* %Tzp to i8*, !dbg !606
  call void @llvm.lifetime.start(i64 8, i8* nonnull %0) #8, !dbg !606
  %1 = bitcast %struct.timeval* %Tp to i8*, !dbg !607
  call void @llvm.lifetime.start(i64 16, i8* nonnull %1) #8, !dbg !607
  tail call void @llvm.dbg.value(metadata %struct.timezone* %Tzp, i64 0, metadata !590, metadata !608), !dbg !609
  tail call void @llvm.dbg.value(metadata %struct.timeval* %Tp, i64 0, metadata !596, metadata !608), !dbg !610
  %call = call i32 @gettimeofday(%struct.timeval* nonnull %Tp, %struct.timezone* nonnull %Tzp) #8, !dbg !611
  tail call void @llvm.dbg.value(metadata i32 %call, i64 0, metadata !605, metadata !612), !dbg !613
  %cmp = icmp eq i32 %call, 0, !dbg !614
  br i1 %cmp, label %if.end, label %if.then, !dbg !616

if.then:                                          ; preds = %entry
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str, i64 0, i64 0), i32 %call), !dbg !617
  br label %if.end, !dbg !617

if.end:                                           ; preds = %entry, %if.then
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %Tp, i64 0, i32 0, !dbg !619
  %2 = load i64, i64* %tv_sec, align 8, !dbg !619, !tbaa !620
  %conv = sitofp i64 %2 to double, !dbg !625
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %Tp, i64 0, i32 1, !dbg !626
  %3 = load i64, i64* %tv_usec, align 8, !dbg !626, !tbaa !627
  %conv2 = sitofp i64 %3 to double, !dbg !628
  %mul = fmul double %conv2, 1.000000e-06, !dbg !629
  %add = fadd double %mul, %conv, !dbg !630
  call void @llvm.lifetime.end(i64 16, i8* nonnull %1) #8, !dbg !631
  call void @llvm.lifetime.end(i64 8, i8* nonnull %0) #8, !dbg !631
  ret double %add, !dbg !632
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
define float @_Z6absValf(float %a) local_unnamed_addr #3 !dbg !633 {
entry:
  tail call void @llvm.dbg.value(metadata float %a, i64 0, metadata !635, metadata !612), !dbg !636
  %cmp = fcmp olt float %a, 0.000000e+00, !dbg !637
  %mul = fsub float -0.000000e+00, %a, !dbg !639
  %retval.0 = select i1 %cmp, float %mul, float %a, !dbg !641
  ret float %retval.0, !dbg !642
}

; Function Attrs: nounwind readnone uwtable
define float @_Z11percentDiffdd(double %val1, double %val2) local_unnamed_addr #3 !dbg !643 {
entry:
  tail call void @llvm.dbg.value(metadata double %val1, i64 0, metadata !647, metadata !612), !dbg !649
  tail call void @llvm.dbg.value(metadata double %val2, i64 0, metadata !648, metadata !612), !dbg !650
  %conv = fptrunc double %val1 to float, !dbg !651
  tail call void @llvm.dbg.value(metadata float %conv, i64 0, metadata !635, metadata !612), !dbg !653
  %cmp.i = fcmp olt float %conv, 0.000000e+00, !dbg !655
  %mul.i = fsub float -0.000000e+00, %conv, !dbg !656
  %retval.0.i = select i1 %cmp.i, float %mul.i, float %conv, !dbg !657
  %conv1 = fpext float %retval.0.i to double, !dbg !658
  %cmp = fcmp olt double %conv1, 1.000000e-02, !dbg !659
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !660

land.lhs.true:                                    ; preds = %entry
  %conv2 = fptrunc double %val2 to float, !dbg !661
  tail call void @llvm.dbg.value(metadata float %conv2, i64 0, metadata !635, metadata !612), !dbg !663
  %cmp.i23 = fcmp olt float %conv2, 0.000000e+00, !dbg !665
  %mul.i24 = fsub float -0.000000e+00, %conv2, !dbg !666
  %retval.0.i25 = select i1 %cmp.i23, float %mul.i24, float %conv2, !dbg !667
  %conv4 = fpext float %retval.0.i25 to double, !dbg !668
  %cmp5 = fcmp olt double %conv4, 1.000000e-02, !dbg !669
  br i1 %cmp5, label %return, label %if.else, !dbg !670

if.else:                                          ; preds = %land.lhs.true, %entry
  %sub = fsub double %val1, %val2, !dbg !672
  %conv6 = fptrunc double %sub to float, !dbg !674
  tail call void @llvm.dbg.value(metadata float %conv6, i64 0, metadata !635, metadata !612), !dbg !675
  %cmp.i20 = fcmp olt float %conv6, 0.000000e+00, !dbg !677
  %mul.i21 = fsub float -0.000000e+00, %conv6, !dbg !678
  %retval.0.i22 = select i1 %cmp.i20, float %mul.i21, float %conv6, !dbg !679
  %add = fadd double %val1, 0x3E45798EE0000000, !dbg !680
  %conv8 = fptrunc double %add to float, !dbg !681
  tail call void @llvm.dbg.value(metadata float %conv8, i64 0, metadata !635, metadata !612), !dbg !682
  %cmp.i17 = fcmp olt float %conv8, 0.000000e+00, !dbg !685
  %mul.i18 = fsub float -0.000000e+00, %conv8, !dbg !686
  %retval.0.i19 = select i1 %cmp.i17, float %mul.i18, float %conv8, !dbg !687
  %div = fdiv float %retval.0.i22, %retval.0.i19, !dbg !688
  tail call void @llvm.dbg.value(metadata float %div, i64 0, metadata !635, metadata !612), !dbg !689
  %cmp.i14 = fcmp olt float %div, 0.000000e+00, !dbg !692
  %mul.i15 = fsub float -0.000000e+00, %div, !dbg !693
  %retval.0.i16 = select i1 %cmp.i14, float %mul.i15, float %div, !dbg !694
  %mul = fmul float %retval.0.i16, 1.000000e+02, !dbg !695
  br label %return, !dbg !696

return:                                           ; preds = %land.lhs.true, %if.else
  %retval.0 = phi float [ %mul, %if.else ], [ 0.000000e+00, %land.lhs.true ]
  ret float %retval.0, !dbg !697
}

; Function Attrs: nounwind uwtable
define void @_Z10init_arrayPfS_S_(float* nocapture %A, float* nocapture %p, float* nocapture %r) local_unnamed_addr #0 !dbg !698 {
entry:
  tail call void @llvm.dbg.value(metadata float* %A, i64 0, metadata !702, metadata !612), !dbg !707
  tail call void @llvm.dbg.value(metadata float* %p, i64 0, metadata !703, metadata !612), !dbg !708
  tail call void @llvm.dbg.value(metadata float* %r, i64 0, metadata !704, metadata !612), !dbg !709
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !705, metadata !612), !dbg !710
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !705, metadata !612), !dbg !710
  %0 = load i32, i32* @NX, align 4, !dbg !711, !tbaa !715
  %cmp43 = icmp sgt i32 %0, 0, !dbg !717
  br i1 %cmp43, label %for.body.lr.ph, label %for.cond15.preheader, !dbg !718

for.body.lr.ph:                                   ; preds = %entry
  %1 = load i32, i32* @NY, align 4
  %cmp341 = icmp sgt i32 %1, 0
  %2 = sext i32 %1 to i64, !dbg !718
  %3 = sext i32 %0 to i64, !dbg !718
  %conv8 = sitofp i32 %0 to float
  %wide.trip.count = zext i32 %1 to i64
  %min.iters.check = icmp ult i32 %1, 4
  %4 = and i32 %1, 3
  %n.mod.vf = zext i32 %4 to i64
  %n.vec = sub nsw i64 %wide.trip.count, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %broadcast.splatinsert54 = insertelement <4 x float> undef, float %conv8, i32 0
  %broadcast.splat55 = shufflevector <4 x float> %broadcast.splatinsert54, <4 x float> undef, <4 x i32> zeroinitializer
  %cmp.n = icmp eq i32 %4, 0
  br label %for.body, !dbg !718

for.cond15.preheader.loopexit:                    ; preds = %for.inc12
  br label %for.cond15.preheader, !dbg !710

for.cond15.preheader:                             ; preds = %for.cond15.preheader.loopexit, %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !705, metadata !612), !dbg !710
  %5 = load i32, i32* @NY, align 4, !dbg !720, !tbaa !715
  %cmp1639 = icmp sgt i32 %5, 0, !dbg !724
  br i1 %cmp1639, label %for.body17.lr.ph, label %for.end25, !dbg !725

for.body17.lr.ph:                                 ; preds = %for.cond15.preheader
  %6 = sext i32 %5 to i64, !dbg !725
  %7 = add nsw i64 %6, -1, !dbg !725
  %xtraiter = and i64 %6, 3, !dbg !725
  %lcmp.mod = icmp eq i64 %xtraiter, 0, !dbg !725
  br i1 %lcmp.mod, label %for.body17.prol.loopexit, label %for.body17.prol.preheader, !dbg !725

for.body17.prol.preheader:                        ; preds = %for.body17.lr.ph
  br label %for.body17.prol, !dbg !725

for.body17.prol:                                  ; preds = %for.body17.prol, %for.body17.prol.preheader
  %indvars.iv.prol = phi i64 [ 0, %for.body17.prol.preheader ], [ %indvars.iv.next.prol, %for.body17.prol ]
  %prol.iter = phi i64 [ %xtraiter, %for.body17.prol.preheader ], [ %prol.iter.sub, %for.body17.prol ]
  %8 = trunc i64 %indvars.iv.prol to i32, !dbg !727
  %conv18.prol = sitofp i32 %8 to double, !dbg !727
  %mul19.prol = fmul double %conv18.prol, 0x400921FB54442D18, !dbg !729
  %conv20.prol = fptrunc double %mul19.prol to float, !dbg !727
  %arrayidx22.prol = getelementptr inbounds float, float* %p, i64 %indvars.iv.prol, !dbg !730
  store float %conv20.prol, float* %arrayidx22.prol, align 4, !dbg !731, !tbaa !732
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1, !dbg !734
  %prol.iter.sub = add i64 %prol.iter, -1, !dbg !725
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0, !dbg !725
  br i1 %prol.iter.cmp, label %for.body17.prol.loopexit.unr-lcssa, label %for.body17.prol, !dbg !725, !llvm.loop !736

for.body17.prol.loopexit.unr-lcssa:               ; preds = %for.body17.prol
  br label %for.body17.prol.loopexit, !dbg !725

for.body17.prol.loopexit:                         ; preds = %for.body17.lr.ph, %for.body17.prol.loopexit.unr-lcssa
  %indvars.iv.unr = phi i64 [ 0, %for.body17.lr.ph ], [ %indvars.iv.next.prol, %for.body17.prol.loopexit.unr-lcssa ]
  %9 = icmp ult i64 %7, 3, !dbg !725
  br i1 %9, label %for.end25.loopexit, label %for.body17.lr.ph.new, !dbg !725

for.body17.lr.ph.new:                             ; preds = %for.body17.prol.loopexit
  br label %for.body17, !dbg !725

for.body:                                         ; preds = %for.body.lr.ph, %for.inc12
  %indvars.iv49 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next50, %for.inc12 ]
  %10 = trunc i64 %indvars.iv49 to i32, !dbg !738
  %conv = sitofp i32 %10 to double, !dbg !738
  %mul = fmul double %conv, 0x400921FB54442D18, !dbg !740
  %conv1 = fptrunc double %mul to float, !dbg !738
  %arrayidx = getelementptr inbounds float, float* %r, i64 %indvars.iv49, !dbg !741
  store float %conv1, float* %arrayidx, align 4, !dbg !742, !tbaa !732
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !706, metadata !612), !dbg !743
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !706, metadata !612), !dbg !743
  br i1 %cmp341, label %for.body4.lr.ph, label %for.inc12, !dbg !744

for.body4.lr.ph:                                  ; preds = %for.body
  %conv5 = sitofp i32 %10 to float
  %11 = mul nsw i64 %indvars.iv49, %2
  br i1 %min.iters.check, label %for.body4.preheader, label %min.iters.checked, !dbg !744

min.iters.checked:                                ; preds = %for.body4.lr.ph
  br i1 %cmp.zero, label %for.body4.preheader, label %vector.ph, !dbg !744

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert = insertelement <4 x float> undef, float %conv5, i32 0, !dbg !744
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> undef, <4 x i32> zeroinitializer, !dbg !744
  br label %vector.body, !dbg !744

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ], !dbg !747
  %vec.ind52 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next53, %vector.body ]
  %12 = sitofp <4 x i32> %vec.ind52 to <4 x float>, !dbg !750
  %13 = fmul <4 x float> %broadcast.splat, %12, !dbg !752
  %14 = fdiv <4 x float> %13, %broadcast.splat55, !dbg !753
  %15 = add nsw i64 %11, %index, !dbg !754
  %16 = getelementptr inbounds float, float* %A, i64 %15, !dbg !755
  %17 = bitcast float* %16 to <4 x float>*, !dbg !756
  store <4 x float> %14, <4 x float>* %17, align 4, !dbg !756, !tbaa !732
  %index.next = add i64 %index, 4, !dbg !747
  %vec.ind.next53 = add <4 x i32> %vec.ind52, <i32 4, i32 4, i32 4, i32 4>, !dbg !747
  %18 = icmp eq i64 %index.next, %n.vec, !dbg !747
  br i1 %18, label %middle.block, label %vector.body, !dbg !747, !llvm.loop !757

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.inc12, label %for.body4.preheader, !dbg !744

for.body4.preheader:                              ; preds = %middle.block, %min.iters.checked, %for.body4.lr.ph
  %indvars.iv46.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %for.body4.lr.ph ], [ %n.vec, %middle.block ]
  br label %for.body4, !dbg !750

for.body4:                                        ; preds = %for.body4.preheader, %for.body4
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %for.body4 ], [ %indvars.iv46.ph, %for.body4.preheader ]
  %19 = trunc i64 %indvars.iv46 to i32, !dbg !750
  %conv6 = sitofp i32 %19 to float, !dbg !750
  %mul7 = fmul float %conv5, %conv6, !dbg !752
  %div = fdiv float %mul7, %conv8, !dbg !753
  %20 = add nsw i64 %11, %indvars.iv46, !dbg !754
  %arrayidx11 = getelementptr inbounds float, float* %A, i64 %20, !dbg !755
  store float %div, float* %arrayidx11, align 4, !dbg !756, !tbaa !732
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1, !dbg !747
  %exitcond = icmp eq i64 %indvars.iv.next47, %wide.trip.count, !dbg !762
  br i1 %exitcond, label %for.inc12.loopexit, label %for.body4, !dbg !744, !llvm.loop !764

for.inc12.loopexit:                               ; preds = %for.body4
  br label %for.inc12, !dbg !766

for.inc12:                                        ; preds = %for.inc12.loopexit, %middle.block, %for.body
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1, !dbg !766
  %cmp = icmp slt i64 %indvars.iv.next50, %3, !dbg !717
  br i1 %cmp, label %for.body, label %for.cond15.preheader.loopexit, !dbg !718, !llvm.loop !768

for.body17:                                       ; preds = %for.body17, %for.body17.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.body17.lr.ph.new ], [ %indvars.iv.next.3, %for.body17 ]
  %21 = trunc i64 %indvars.iv to i32, !dbg !727
  %conv18 = sitofp i32 %21 to double, !dbg !727
  %mul19 = fmul double %conv18, 0x400921FB54442D18, !dbg !729
  %conv20 = fptrunc double %mul19 to float, !dbg !727
  %arrayidx22 = getelementptr inbounds float, float* %p, i64 %indvars.iv, !dbg !730
  store float %conv20, float* %arrayidx22, align 4, !dbg !731, !tbaa !732
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !734
  %22 = trunc i64 %indvars.iv.next to i32, !dbg !727
  %conv18.1 = sitofp i32 %22 to double, !dbg !727
  %mul19.1 = fmul double %conv18.1, 0x400921FB54442D18, !dbg !729
  %conv20.1 = fptrunc double %mul19.1 to float, !dbg !727
  %arrayidx22.1 = getelementptr inbounds float, float* %p, i64 %indvars.iv.next, !dbg !730
  store float %conv20.1, float* %arrayidx22.1, align 4, !dbg !731, !tbaa !732
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2, !dbg !734
  %23 = trunc i64 %indvars.iv.next.1 to i32, !dbg !727
  %conv18.2 = sitofp i32 %23 to double, !dbg !727
  %mul19.2 = fmul double %conv18.2, 0x400921FB54442D18, !dbg !729
  %conv20.2 = fptrunc double %mul19.2 to float, !dbg !727
  %arrayidx22.2 = getelementptr inbounds float, float* %p, i64 %indvars.iv.next.1, !dbg !730
  store float %conv20.2, float* %arrayidx22.2, align 4, !dbg !731, !tbaa !732
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3, !dbg !734
  %24 = trunc i64 %indvars.iv.next.2 to i32, !dbg !727
  %conv18.3 = sitofp i32 %24 to double, !dbg !727
  %mul19.3 = fmul double %conv18.3, 0x400921FB54442D18, !dbg !729
  %conv20.3 = fptrunc double %mul19.3 to float, !dbg !727
  %arrayidx22.3 = getelementptr inbounds float, float* %p, i64 %indvars.iv.next.2, !dbg !730
  store float %conv20.3, float* %arrayidx22.3, align 4, !dbg !731, !tbaa !732
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4, !dbg !734
  %cmp16.3 = icmp slt i64 %indvars.iv.next.3, %6, !dbg !724
  br i1 %cmp16.3, label %for.body17, label %for.end25.loopexit.unr-lcssa, !dbg !725, !llvm.loop !771

for.end25.loopexit.unr-lcssa:                     ; preds = %for.body17
  br label %for.end25.loopexit, !dbg !774

for.end25.loopexit:                               ; preds = %for.body17.prol.loopexit, %for.end25.loopexit.unr-lcssa
  br label %for.end25, !dbg !774

for.end25:                                        ; preds = %for.end25.loopexit, %for.cond15.preheader
  ret void, !dbg !774
}

; Function Attrs: nounwind uwtable
define void @_Z14compareResultsPfS_S_S_(float* nocapture readonly %s, float* nocapture readonly %s_outputFromGpu, float* nocapture readonly %q, float* nocapture readonly %q_outputFromGpu) local_unnamed_addr #0 !dbg !775 {
entry:
  tail call void @llvm.dbg.value(metadata float* %s, i64 0, metadata !779, metadata !612), !dbg !785
  tail call void @llvm.dbg.value(metadata float* %s_outputFromGpu, i64 0, metadata !780, metadata !612), !dbg !786
  tail call void @llvm.dbg.value(metadata float* %q, i64 0, metadata !781, metadata !612), !dbg !787
  tail call void @llvm.dbg.value(metadata float* %q_outputFromGpu, i64 0, metadata !782, metadata !612), !dbg !788
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !784, metadata !612), !dbg !789
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !783, metadata !612), !dbg !790
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !784, metadata !612), !dbg !789
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !783, metadata !612), !dbg !790
  %0 = load i32, i32* @NX, align 4, !dbg !791, !tbaa !715
  %cmp69 = icmp sgt i32 %0, 0, !dbg !795
  br i1 %cmp69, label %for.body.lr.ph, label %for.cond7.preheader, !dbg !796

for.body.lr.ph:                                   ; preds = %entry
  %1 = sext i32 %0 to i64, !dbg !796
  %min.iters.check = icmp ult i32 %0, 8, !dbg !796
  br i1 %min.iters.check, label %for.body.preheader, label %min.iters.checked, !dbg !796

for.body.preheader:                               ; preds = %middle.block, %min.iters.checked, %for.body.lr.ph
  %indvars.iv73.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %for.body.lr.ph ], [ %n.vec, %middle.block ]
  %fail.071.ph = phi i32 [ 0, %min.iters.checked ], [ 0, %for.body.lr.ph ], [ %69, %middle.block ]
  br label %for.body, !dbg !798

min.iters.checked:                                ; preds = %for.body.lr.ph
  %n.vec = and i64 %1, -8, !dbg !796
  %cmp.zero = icmp eq i64 %n.vec, 0, !dbg !796
  br i1 %cmp.zero, label %for.body.preheader, label %vector.body.preheader, !dbg !796

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body, !dbg !798

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ], !dbg !801
  %vec.phi = phi <4 x i32> [ %66, %vector.body ], [ zeroinitializer, %vector.body.preheader ]
  %vec.phi76 = phi <4 x i32> [ %67, %vector.body ], [ zeroinitializer, %vector.body.preheader ]
  %2 = getelementptr inbounds float, float* %q, i64 %index, !dbg !798
  %3 = bitcast float* %2 to <4 x float>*, !dbg !798
  %wide.load = load <4 x float>, <4 x float>* %3, align 4, !dbg !798, !tbaa !732
  %4 = getelementptr float, float* %2, i64 4, !dbg !798
  %5 = bitcast float* %4 to <4 x float>*, !dbg !798
  %wide.load77 = load <4 x float>, <4 x float>* %5, align 4, !dbg !798, !tbaa !732
  %6 = getelementptr inbounds float, float* %q_outputFromGpu, i64 %index, !dbg !803
  %7 = bitcast float* %6 to <4 x float>*, !dbg !803
  %wide.load78 = load <4 x float>, <4 x float>* %7, align 4, !dbg !803, !tbaa !732
  %8 = getelementptr float, float* %6, i64 4, !dbg !803
  %9 = bitcast float* %8 to <4 x float>*, !dbg !803
  %wide.load79 = load <4 x float>, <4 x float>* %9, align 4, !dbg !803, !tbaa !732
  %10 = fcmp olt <4 x float> %wide.load, zeroinitializer, !dbg !804
  %11 = fcmp olt <4 x float> %wide.load77, zeroinitializer, !dbg !804
  %12 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %wide.load, !dbg !807
  %13 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %wide.load77, !dbg !807
  %14 = select <4 x i1> %10, <4 x float> %12, <4 x float> %wide.load, !dbg !808
  %15 = select <4 x i1> %11, <4 x float> %13, <4 x float> %wide.load77, !dbg !808
  %16 = fpext <4 x float> %14 to <4 x double>, !dbg !809
  %17 = fpext <4 x float> %15 to <4 x double>, !dbg !809
  %18 = fcmp olt <4 x double> %16, <double 1.000000e-02, double 1.000000e-02, double 1.000000e-02, double 1.000000e-02>, !dbg !810
  %19 = fcmp olt <4 x double> %17, <double 1.000000e-02, double 1.000000e-02, double 1.000000e-02, double 1.000000e-02>, !dbg !810
  %20 = fcmp olt <4 x float> %wide.load78, zeroinitializer, !dbg !811
  %21 = fcmp olt <4 x float> %wide.load79, zeroinitializer, !dbg !811
  %22 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %wide.load78, !dbg !813
  %23 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %wide.load79, !dbg !813
  %24 = select <4 x i1> %20, <4 x float> %22, <4 x float> %wide.load78, !dbg !814
  %25 = select <4 x i1> %21, <4 x float> %23, <4 x float> %wide.load79, !dbg !814
  %26 = fpext <4 x float> %24 to <4 x double>, !dbg !815
  %27 = fpext <4 x float> %25 to <4 x double>, !dbg !815
  %28 = fcmp olt <4 x double> %26, <double 1.000000e-02, double 1.000000e-02, double 1.000000e-02, double 1.000000e-02>, !dbg !816
  %29 = fcmp olt <4 x double> %27, <double 1.000000e-02, double 1.000000e-02, double 1.000000e-02, double 1.000000e-02>, !dbg !816
  %30 = fsub <4 x float> %wide.load, %wide.load78, !dbg !817
  %31 = fsub <4 x float> %wide.load77, %wide.load79, !dbg !817
  %32 = fcmp olt <4 x float> %30, zeroinitializer, !dbg !818
  %33 = fcmp olt <4 x float> %31, zeroinitializer, !dbg !818
  %34 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %30, !dbg !820
  %35 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %31, !dbg !820
  %36 = select <4 x i1> %32, <4 x float> %34, <4 x float> %30, !dbg !821
  %37 = select <4 x i1> %33, <4 x float> %35, <4 x float> %31, !dbg !821
  %38 = fadd <4 x float> %wide.load, <float 0x3E45798EE0000000, float 0x3E45798EE0000000, float 0x3E45798EE0000000, float 0x3E45798EE0000000>, !dbg !822
  %39 = fadd <4 x float> %wide.load77, <float 0x3E45798EE0000000, float 0x3E45798EE0000000, float 0x3E45798EE0000000, float 0x3E45798EE0000000>, !dbg !822
  %40 = fcmp olt <4 x float> %38, zeroinitializer, !dbg !823
  %41 = fcmp olt <4 x float> %39, zeroinitializer, !dbg !823
  %42 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %38, !dbg !825
  %43 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %39, !dbg !825
  %44 = select <4 x i1> %40, <4 x float> %42, <4 x float> %38, !dbg !826
  %45 = select <4 x i1> %41, <4 x float> %43, <4 x float> %39, !dbg !826
  %46 = fdiv <4 x float> %36, %44, !dbg !827
  %47 = fdiv <4 x float> %37, %45, !dbg !827
  %48 = fcmp olt <4 x float> %46, zeroinitializer, !dbg !828
  %49 = fcmp olt <4 x float> %47, zeroinitializer, !dbg !828
  %50 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %46, !dbg !830
  %51 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %47, !dbg !830
  %52 = select <4 x i1> %48, <4 x float> %50, <4 x float> %46, !dbg !831
  %53 = select <4 x i1> %49, <4 x float> %51, <4 x float> %47, !dbg !831
  %54 = fmul <4 x float> %52, <float 1.000000e+02, float 1.000000e+02, float 1.000000e+02, float 1.000000e+02>, !dbg !832
  %55 = fmul <4 x float> %53, <float 1.000000e+02, float 1.000000e+02, float 1.000000e+02, float 1.000000e+02>, !dbg !832
  %56 = and <4 x i1> %28, %18
  %57 = and <4 x i1> %29, %19
  %58 = fpext <4 x float> %54 to <4 x double>, !dbg !833
  %59 = select <4 x i1> %56, <4 x double> zeroinitializer, <4 x double> %58, !dbg !833
  %60 = fpext <4 x float> %55 to <4 x double>, !dbg !833
  %61 = select <4 x i1> %57, <4 x double> zeroinitializer, <4 x double> %60, !dbg !833
  %62 = fcmp ogt <4 x double> %59, <double 5.000000e-03, double 5.000000e-03, double 5.000000e-03, double 5.000000e-03>, !dbg !834
  %63 = fcmp ogt <4 x double> %61, <double 5.000000e-03, double 5.000000e-03, double 5.000000e-03, double 5.000000e-03>, !dbg !834
  %64 = zext <4 x i1> %62 to <4 x i32>, !dbg !835
  %65 = zext <4 x i1> %63 to <4 x i32>, !dbg !835
  %66 = add nsw <4 x i32> %vec.phi, %64, !dbg !835
  %67 = add nsw <4 x i32> %vec.phi76, %65, !dbg !835
  %index.next = add i64 %index, 8, !dbg !801
  %68 = icmp eq i64 %index.next, %n.vec, !dbg !801
  br i1 %68, label %middle.block, label %vector.body, !dbg !801, !llvm.loop !836

middle.block:                                     ; preds = %vector.body
  %bin.rdx = add <4 x i32> %67, %66, !dbg !835
  %rdx.shuf = shufflevector <4 x i32> %bin.rdx, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>, !dbg !835
  %bin.rdx81 = add <4 x i32> %bin.rdx, %rdx.shuf, !dbg !835
  %rdx.shuf82 = shufflevector <4 x i32> %bin.rdx81, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>, !dbg !835
  %bin.rdx83 = add <4 x i32> %bin.rdx81, %rdx.shuf82, !dbg !835
  %69 = extractelement <4 x i32> %bin.rdx83, i32 0, !dbg !835
  %cmp.n = icmp eq i64 %n.vec, %1
  br i1 %cmp.n, label %for.cond7.preheader, label %for.body.preheader, !dbg !796

for.cond7.preheader.loopexit:                     ; preds = %_Z11percentDiffdd.exit
  br label %for.cond7.preheader, !dbg !789

for.cond7.preheader:                              ; preds = %for.cond7.preheader.loopexit, %middle.block, %entry
  %fail.0.lcssa = phi i32 [ 0, %entry ], [ %69, %middle.block ], [ %fail.1, %for.cond7.preheader.loopexit ]
  tail call void @llvm.dbg.value(metadata i32 %fail.0.lcssa, i64 0, metadata !784, metadata !612), !dbg !789
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !783, metadata !612), !dbg !790
  %70 = load i32, i32* @NY, align 4, !dbg !839, !tbaa !715
  %cmp866 = icmp sgt i32 %70, 0, !dbg !843
  br i1 %cmp866, label %for.body9.lr.ph, label %for.end24, !dbg !844

for.body9.lr.ph:                                  ; preds = %for.cond7.preheader
  %71 = sext i32 %70 to i64, !dbg !844
  %min.iters.check87 = icmp ult i32 %70, 8, !dbg !844
  br i1 %min.iters.check87, label %for.body9.preheader, label %min.iters.checked88, !dbg !844

for.body9.preheader:                              ; preds = %middle.block85, %min.iters.checked88, %for.body9.lr.ph
  %indvars.iv.ph = phi i64 [ 0, %min.iters.checked88 ], [ 0, %for.body9.lr.ph ], [ %n.vec90, %middle.block85 ]
  %fail.268.ph = phi i32 [ %fail.0.lcssa, %min.iters.checked88 ], [ %fail.0.lcssa, %for.body9.lr.ph ], [ %140, %middle.block85 ]
  br label %for.body9, !dbg !846

min.iters.checked88:                              ; preds = %for.body9.lr.ph
  %n.vec90 = and i64 %71, -8, !dbg !844
  %cmp.zero91 = icmp eq i64 %n.vec90, 0, !dbg !844
  br i1 %cmp.zero91, label %for.body9.preheader, label %vector.ph92, !dbg !844

vector.ph92:                                      ; preds = %min.iters.checked88
  %72 = insertelement <4 x i32> <i32 undef, i32 0, i32 0, i32 0>, i32 %fail.0.lcssa, i32 0, !dbg !844
  br label %vector.body84, !dbg !844

vector.body84:                                    ; preds = %vector.body84, %vector.ph92
  %index93 = phi i64 [ 0, %vector.ph92 ], [ %index.next94, %vector.body84 ], !dbg !849
  %vec.phi101 = phi <4 x i32> [ %72, %vector.ph92 ], [ %137, %vector.body84 ]
  %vec.phi102 = phi <4 x i32> [ zeroinitializer, %vector.ph92 ], [ %138, %vector.body84 ]
  %73 = getelementptr inbounds float, float* %s, i64 %index93, !dbg !846
  %74 = bitcast float* %73 to <4 x float>*, !dbg !846
  %wide.load103 = load <4 x float>, <4 x float>* %74, align 4, !dbg !846, !tbaa !732
  %75 = getelementptr float, float* %73, i64 4, !dbg !846
  %76 = bitcast float* %75 to <4 x float>*, !dbg !846
  %wide.load104 = load <4 x float>, <4 x float>* %76, align 4, !dbg !846, !tbaa !732
  %77 = getelementptr inbounds float, float* %s_outputFromGpu, i64 %index93, !dbg !851
  %78 = bitcast float* %77 to <4 x float>*, !dbg !851
  %wide.load105 = load <4 x float>, <4 x float>* %78, align 4, !dbg !851, !tbaa !732
  %79 = getelementptr float, float* %77, i64 4, !dbg !851
  %80 = bitcast float* %79 to <4 x float>*, !dbg !851
  %wide.load106 = load <4 x float>, <4 x float>* %80, align 4, !dbg !851, !tbaa !732
  %81 = fcmp olt <4 x float> %wide.load103, zeroinitializer, !dbg !852
  %82 = fcmp olt <4 x float> %wide.load104, zeroinitializer, !dbg !852
  %83 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %wide.load103, !dbg !855
  %84 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %wide.load104, !dbg !855
  %85 = select <4 x i1> %81, <4 x float> %83, <4 x float> %wide.load103, !dbg !856
  %86 = select <4 x i1> %82, <4 x float> %84, <4 x float> %wide.load104, !dbg !856
  %87 = fpext <4 x float> %85 to <4 x double>, !dbg !857
  %88 = fpext <4 x float> %86 to <4 x double>, !dbg !857
  %89 = fcmp olt <4 x double> %87, <double 1.000000e-02, double 1.000000e-02, double 1.000000e-02, double 1.000000e-02>, !dbg !858
  %90 = fcmp olt <4 x double> %88, <double 1.000000e-02, double 1.000000e-02, double 1.000000e-02, double 1.000000e-02>, !dbg !858
  %91 = fcmp olt <4 x float> %wide.load105, zeroinitializer, !dbg !859
  %92 = fcmp olt <4 x float> %wide.load106, zeroinitializer, !dbg !859
  %93 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %wide.load105, !dbg !861
  %94 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %wide.load106, !dbg !861
  %95 = select <4 x i1> %91, <4 x float> %93, <4 x float> %wide.load105, !dbg !862
  %96 = select <4 x i1> %92, <4 x float> %94, <4 x float> %wide.load106, !dbg !862
  %97 = fpext <4 x float> %95 to <4 x double>, !dbg !863
  %98 = fpext <4 x float> %96 to <4 x double>, !dbg !863
  %99 = fcmp olt <4 x double> %97, <double 1.000000e-02, double 1.000000e-02, double 1.000000e-02, double 1.000000e-02>, !dbg !864
  %100 = fcmp olt <4 x double> %98, <double 1.000000e-02, double 1.000000e-02, double 1.000000e-02, double 1.000000e-02>, !dbg !864
  %101 = fsub <4 x float> %wide.load103, %wide.load105, !dbg !865
  %102 = fsub <4 x float> %wide.load104, %wide.load106, !dbg !865
  %103 = fcmp olt <4 x float> %101, zeroinitializer, !dbg !866
  %104 = fcmp olt <4 x float> %102, zeroinitializer, !dbg !866
  %105 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %101, !dbg !868
  %106 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %102, !dbg !868
  %107 = select <4 x i1> %103, <4 x float> %105, <4 x float> %101, !dbg !869
  %108 = select <4 x i1> %104, <4 x float> %106, <4 x float> %102, !dbg !869
  %109 = fadd <4 x float> %wide.load103, <float 0x3E45798EE0000000, float 0x3E45798EE0000000, float 0x3E45798EE0000000, float 0x3E45798EE0000000>, !dbg !870
  %110 = fadd <4 x float> %wide.load104, <float 0x3E45798EE0000000, float 0x3E45798EE0000000, float 0x3E45798EE0000000, float 0x3E45798EE0000000>, !dbg !870
  %111 = fcmp olt <4 x float> %109, zeroinitializer, !dbg !871
  %112 = fcmp olt <4 x float> %110, zeroinitializer, !dbg !871
  %113 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %109, !dbg !873
  %114 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %110, !dbg !873
  %115 = select <4 x i1> %111, <4 x float> %113, <4 x float> %109, !dbg !874
  %116 = select <4 x i1> %112, <4 x float> %114, <4 x float> %110, !dbg !874
  %117 = fdiv <4 x float> %107, %115, !dbg !875
  %118 = fdiv <4 x float> %108, %116, !dbg !875
  %119 = fcmp olt <4 x float> %117, zeroinitializer, !dbg !876
  %120 = fcmp olt <4 x float> %118, zeroinitializer, !dbg !876
  %121 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %117, !dbg !878
  %122 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %118, !dbg !878
  %123 = select <4 x i1> %119, <4 x float> %121, <4 x float> %117, !dbg !879
  %124 = select <4 x i1> %120, <4 x float> %122, <4 x float> %118, !dbg !879
  %125 = fmul <4 x float> %123, <float 1.000000e+02, float 1.000000e+02, float 1.000000e+02, float 1.000000e+02>, !dbg !880
  %126 = fmul <4 x float> %124, <float 1.000000e+02, float 1.000000e+02, float 1.000000e+02, float 1.000000e+02>, !dbg !880
  %127 = and <4 x i1> %99, %89
  %128 = and <4 x i1> %100, %90
  %129 = fpext <4 x float> %125 to <4 x double>, !dbg !881
  %130 = select <4 x i1> %127, <4 x double> zeroinitializer, <4 x double> %129, !dbg !881
  %131 = fpext <4 x float> %126 to <4 x double>, !dbg !881
  %132 = select <4 x i1> %128, <4 x double> zeroinitializer, <4 x double> %131, !dbg !881
  %133 = fcmp ogt <4 x double> %130, <double 5.000000e-03, double 5.000000e-03, double 5.000000e-03, double 5.000000e-03>, !dbg !882
  %134 = fcmp ogt <4 x double> %132, <double 5.000000e-03, double 5.000000e-03, double 5.000000e-03, double 5.000000e-03>, !dbg !882
  %135 = zext <4 x i1> %133 to <4 x i32>, !dbg !883
  %136 = zext <4 x i1> %134 to <4 x i32>, !dbg !883
  %137 = add nsw <4 x i32> %vec.phi101, %135, !dbg !883
  %138 = add nsw <4 x i32> %vec.phi102, %136, !dbg !883
  %index.next94 = add i64 %index93, 8, !dbg !849
  %139 = icmp eq i64 %index.next94, %n.vec90, !dbg !849
  br i1 %139, label %middle.block85, label %vector.body84, !dbg !849, !llvm.loop !884

middle.block85:                                   ; preds = %vector.body84
  %bin.rdx109 = add <4 x i32> %138, %137, !dbg !883
  %rdx.shuf110 = shufflevector <4 x i32> %bin.rdx109, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>, !dbg !883
  %bin.rdx111 = add <4 x i32> %bin.rdx109, %rdx.shuf110, !dbg !883
  %rdx.shuf112 = shufflevector <4 x i32> %bin.rdx111, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>, !dbg !883
  %bin.rdx113 = add <4 x i32> %bin.rdx111, %rdx.shuf112, !dbg !883
  %140 = extractelement <4 x i32> %bin.rdx113, i32 0, !dbg !883
  %cmp.n96 = icmp eq i64 %n.vec90, %71
  br i1 %cmp.n96, label %for.end24, label %for.body9.preheader, !dbg !844

for.body:                                         ; preds = %for.body.preheader, %_Z11percentDiffdd.exit
  %indvars.iv73 = phi i64 [ %indvars.iv.next74, %_Z11percentDiffdd.exit ], [ %indvars.iv73.ph, %for.body.preheader ]
  %fail.071 = phi i32 [ %fail.1, %_Z11percentDiffdd.exit ], [ %fail.071.ph, %for.body.preheader ]
  %arrayidx = getelementptr inbounds float, float* %q, i64 %indvars.iv73, !dbg !798
  %141 = load float, float* %arrayidx, align 4, !dbg !798, !tbaa !732
  %arrayidx2 = getelementptr inbounds float, float* %q_outputFromGpu, i64 %indvars.iv73, !dbg !803
  %142 = load float, float* %arrayidx2, align 4, !dbg !803, !tbaa !732
  tail call void @llvm.dbg.value(metadata float %141, i64 0, metadata !635, metadata !612), !dbg !887
  %cmp.i.i = fcmp olt float %141, 0.000000e+00, !dbg !804
  %mul.i.i = fsub float -0.000000e+00, %141, !dbg !807
  %retval.0.i.i = select i1 %cmp.i.i, float %mul.i.i, float %141, !dbg !808
  %conv1.i = fpext float %retval.0.i.i to double, !dbg !809
  %cmp.i = fcmp olt double %conv1.i, 1.000000e-02, !dbg !810
  br i1 %cmp.i, label %land.lhs.true.i, label %if.else.i, !dbg !888

land.lhs.true.i:                                  ; preds = %for.body
  tail call void @llvm.dbg.value(metadata float %142, i64 0, metadata !635, metadata !612), !dbg !889
  %cmp.i23.i = fcmp olt float %142, 0.000000e+00, !dbg !811
  %mul.i24.i = fsub float -0.000000e+00, %142, !dbg !813
  %retval.0.i25.i = select i1 %cmp.i23.i, float %mul.i24.i, float %142, !dbg !814
  %conv4.i = fpext float %retval.0.i25.i to double, !dbg !815
  %cmp5.i = fcmp olt double %conv4.i, 1.000000e-02, !dbg !816
  br i1 %cmp5.i, label %_Z11percentDiffdd.exit, label %if.else.i, !dbg !890

if.else.i:                                        ; preds = %land.lhs.true.i, %for.body
  %conv6.i = fsub float %141, %142, !dbg !817
  tail call void @llvm.dbg.value(metadata float %conv6.i, i64 0, metadata !635, metadata !612), !dbg !891
  %cmp.i20.i = fcmp olt float %conv6.i, 0.000000e+00, !dbg !818
  %mul.i21.i = fsub float -0.000000e+00, %conv6.i, !dbg !820
  %retval.0.i22.i = select i1 %cmp.i20.i, float %mul.i21.i, float %conv6.i, !dbg !821
  %conv8.i = fadd float %141, 0x3E45798EE0000000, !dbg !822
  tail call void @llvm.dbg.value(metadata float %conv8.i, i64 0, metadata !635, metadata !612), !dbg !892
  %cmp.i17.i = fcmp olt float %conv8.i, 0.000000e+00, !dbg !823
  %mul.i18.i = fsub float -0.000000e+00, %conv8.i, !dbg !825
  %retval.0.i19.i = select i1 %cmp.i17.i, float %mul.i18.i, float %conv8.i, !dbg !826
  %div.i = fdiv float %retval.0.i22.i, %retval.0.i19.i, !dbg !827
  tail call void @llvm.dbg.value(metadata float %div.i, i64 0, metadata !635, metadata !612), !dbg !893
  %cmp.i14.i = fcmp olt float %div.i, 0.000000e+00, !dbg !828
  %mul.i15.i = fsub float -0.000000e+00, %div.i, !dbg !830
  %retval.0.i16.i = select i1 %cmp.i14.i, float %mul.i15.i, float %div.i, !dbg !831
  %mul.i = fmul float %retval.0.i16.i, 1.000000e+02, !dbg !832
  br label %_Z11percentDiffdd.exit, !dbg !894

_Z11percentDiffdd.exit:                           ; preds = %land.lhs.true.i, %if.else.i
  %retval.0.i = phi float [ %mul.i, %if.else.i ], [ 0.000000e+00, %land.lhs.true.i ]
  %conv4 = fpext float %retval.0.i to double, !dbg !833
  %cmp5 = fcmp ogt double %conv4, 5.000000e-03, !dbg !834
  %inc = zext i1 %cmp5 to i32, !dbg !835
  %fail.1 = add nsw i32 %fail.071, %inc, !dbg !835
  tail call void @llvm.dbg.value(metadata i32 %fail.1, i64 0, metadata !784, metadata !612), !dbg !789
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1, !dbg !801
  tail call void @llvm.dbg.value(metadata i32 %fail.1, i64 0, metadata !784, metadata !612), !dbg !789
  %cmp = icmp slt i64 %indvars.iv.next74, %1, !dbg !795
  br i1 %cmp, label %for.body, label %for.cond7.preheader.loopexit, !dbg !796, !llvm.loop !895

for.body9:                                        ; preds = %for.body9.preheader, %_Z11percentDiffdd.exit65
  %indvars.iv = phi i64 [ %indvars.iv.next, %_Z11percentDiffdd.exit65 ], [ %indvars.iv.ph, %for.body9.preheader ]
  %fail.268 = phi i32 [ %fail.3, %_Z11percentDiffdd.exit65 ], [ %fail.268.ph, %for.body9.preheader ]
  %arrayidx11 = getelementptr inbounds float, float* %s, i64 %indvars.iv, !dbg !846
  %143 = load float, float* %arrayidx11, align 4, !dbg !846, !tbaa !732
  %arrayidx14 = getelementptr inbounds float, float* %s_outputFromGpu, i64 %indvars.iv, !dbg !851
  %144 = load float, float* %arrayidx14, align 4, !dbg !851, !tbaa !732
  tail call void @llvm.dbg.value(metadata float %143, i64 0, metadata !635, metadata !612), !dbg !896
  %cmp.i.i37 = fcmp olt float %143, 0.000000e+00, !dbg !852
  %mul.i.i38 = fsub float -0.000000e+00, %143, !dbg !855
  %retval.0.i.i39 = select i1 %cmp.i.i37, float %mul.i.i38, float %143, !dbg !856
  %conv1.i40 = fpext float %retval.0.i.i39 to double, !dbg !857
  %cmp.i41 = fcmp olt double %conv1.i40, 1.000000e-02, !dbg !858
  br i1 %cmp.i41, label %land.lhs.true.i47, label %if.else.i63, !dbg !897

land.lhs.true.i47:                                ; preds = %for.body9
  tail call void @llvm.dbg.value(metadata float %144, i64 0, metadata !635, metadata !612), !dbg !898
  %cmp.i23.i42 = fcmp olt float %144, 0.000000e+00, !dbg !859
  %mul.i24.i43 = fsub float -0.000000e+00, %144, !dbg !861
  %retval.0.i25.i44 = select i1 %cmp.i23.i42, float %mul.i24.i43, float %144, !dbg !862
  %conv4.i45 = fpext float %retval.0.i25.i44 to double, !dbg !863
  %cmp5.i46 = fcmp olt double %conv4.i45, 1.000000e-02, !dbg !864
  br i1 %cmp5.i46, label %_Z11percentDiffdd.exit65, label %if.else.i63, !dbg !899

if.else.i63:                                      ; preds = %land.lhs.true.i47, %for.body9
  %conv6.i49 = fsub float %143, %144, !dbg !865
  tail call void @llvm.dbg.value(metadata float %conv6.i49, i64 0, metadata !635, metadata !612), !dbg !900
  %cmp.i20.i50 = fcmp olt float %conv6.i49, 0.000000e+00, !dbg !866
  %mul.i21.i51 = fsub float -0.000000e+00, %conv6.i49, !dbg !868
  %retval.0.i22.i52 = select i1 %cmp.i20.i50, float %mul.i21.i51, float %conv6.i49, !dbg !869
  %conv8.i54 = fadd float %143, 0x3E45798EE0000000, !dbg !870
  tail call void @llvm.dbg.value(metadata float %conv8.i54, i64 0, metadata !635, metadata !612), !dbg !901
  %cmp.i17.i55 = fcmp olt float %conv8.i54, 0.000000e+00, !dbg !871
  %mul.i18.i56 = fsub float -0.000000e+00, %conv8.i54, !dbg !873
  %retval.0.i19.i57 = select i1 %cmp.i17.i55, float %mul.i18.i56, float %conv8.i54, !dbg !874
  %div.i58 = fdiv float %retval.0.i22.i52, %retval.0.i19.i57, !dbg !875
  tail call void @llvm.dbg.value(metadata float %div.i58, i64 0, metadata !635, metadata !612), !dbg !902
  %cmp.i14.i59 = fcmp olt float %div.i58, 0.000000e+00, !dbg !876
  %mul.i15.i60 = fsub float -0.000000e+00, %div.i58, !dbg !878
  %retval.0.i16.i61 = select i1 %cmp.i14.i59, float %mul.i15.i60, float %div.i58, !dbg !879
  %mul.i62 = fmul float %retval.0.i16.i61, 1.000000e+02, !dbg !880
  br label %_Z11percentDiffdd.exit65, !dbg !903

_Z11percentDiffdd.exit65:                         ; preds = %land.lhs.true.i47, %if.else.i63
  %retval.0.i64 = phi float [ %mul.i62, %if.else.i63 ], [ 0.000000e+00, %land.lhs.true.i47 ]
  %conv17 = fpext float %retval.0.i64 to double, !dbg !881
  %cmp18 = fcmp ogt double %conv17, 5.000000e-03, !dbg !882
  %inc20 = zext i1 %cmp18 to i32, !dbg !883
  %fail.3 = add nsw i32 %fail.268, %inc20, !dbg !883
  tail call void @llvm.dbg.value(metadata i32 %fail.3, i64 0, metadata !784, metadata !612), !dbg !789
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !849
  tail call void @llvm.dbg.value(metadata i32 %fail.3, i64 0, metadata !784, metadata !612), !dbg !789
  %cmp8 = icmp slt i64 %indvars.iv.next, %71, !dbg !843
  br i1 %cmp8, label %for.body9, label %for.end24.loopexit, !dbg !844, !llvm.loop !904

for.end24.loopexit:                               ; preds = %_Z11percentDiffdd.exit65
  br label %for.end24, !dbg !905

for.end24:                                        ; preds = %for.end24.loopexit, %middle.block85, %for.cond7.preheader
  %fail.2.lcssa = phi i32 [ %fail.0.lcssa, %for.cond7.preheader ], [ %140, %middle.block85 ], [ %fail.3, %for.end24.loopexit ]
  %call25 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([74 x i8], [74 x i8]* @.str.1, i64 0, i64 0), double 5.000000e-03, i32 %fail.2.lcssa), !dbg !905
  ret void, !dbg !906
}

; Function Attrs: uwtable
define void @_Z13GPU_argv_initv() local_unnamed_addr #4 !dbg !907 {
entry:
  %deviceProp = alloca %struct.cudaDeviceProp, align 8
  %0 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %deviceProp, i64 0, i32 0, i64 0, !dbg !983
  call void @llvm.lifetime.start(i64 632, i8* nonnull %0) #8, !dbg !983
  tail call void @llvm.dbg.value(metadata %struct.cudaDeviceProp* %deviceProp, i64 0, metadata !909, metadata !608), !dbg !984
  %call = call i32 @cudaGetDeviceProperties(%struct.cudaDeviceProp* nonnull %deviceProp, i32 0), !dbg !985
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.2, i64 0, i64 0), i32 0, i8* nonnull %0), !dbg !986
  %call2 = call i32 @cudaSetDevice(i32 0), !dbg !987
  call void @llvm.lifetime.end(i64 632, i8* nonnull %0) #8, !dbg !988
  ret void, !dbg !988
}

declare i32 @cudaGetDeviceProperties(%struct.cudaDeviceProp*, i32) local_unnamed_addr #5

declare i32 @cudaSetDevice(i32) local_unnamed_addr #5

; Function Attrs: uwtable
define void @_Z12bicg_kernel1PfS_S_ii(float* %A, float* %r, float* %s, i32 %NX, i32 %NY) #4 !dbg !989 {
entry:
  %A.addr = alloca float*, align 8
  %r.addr = alloca float*, align 8
  %s.addr = alloca float*, align 8
  %NX.addr = alloca i32, align 4
  %NY.addr = alloca i32, align 4
  tail call void @llvm.dbg.value(metadata float* %A, i64 0, metadata !993, metadata !612), !dbg !998
  store float* %A, float** %A.addr, align 8, !tbaa !999
  tail call void @llvm.dbg.value(metadata float* %r, i64 0, metadata !994, metadata !612), !dbg !1001
  store float* %r, float** %r.addr, align 8, !tbaa !999
  tail call void @llvm.dbg.value(metadata float* %s, i64 0, metadata !995, metadata !612), !dbg !1002
  store float* %s, float** %s.addr, align 8, !tbaa !999
  tail call void @llvm.dbg.value(metadata i32 %NX, i64 0, metadata !996, metadata !612), !dbg !1003
  store i32 %NX, i32* %NX.addr, align 4, !tbaa !715
  tail call void @llvm.dbg.value(metadata i32 %NY, i64 0, metadata !997, metadata !612), !dbg !1004
  store i32 %NY, i32* %NY.addr, align 4, !tbaa !715
  %0 = bitcast float** %A.addr to i8*, !dbg !1005
  %1 = call i32 @cudaSetupArgument(i8* nonnull %0, i64 8, i64 0), !dbg !1005
  %2 = icmp eq i32 %1, 0, !dbg !1005
  br i1 %2, label %setup.next, label %setup.end, !dbg !1005

setup.next:                                       ; preds = %entry
  %3 = bitcast float** %r.addr to i8*, !dbg !1006
  %4 = call i32 @cudaSetupArgument(i8* nonnull %3, i64 8, i64 8), !dbg !1006
  %5 = icmp eq i32 %4, 0, !dbg !1006
  br i1 %5, label %setup.next1, label %setup.end, !dbg !1006

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast float** %s.addr to i8*, !dbg !1008
  %7 = call i32 @cudaSetupArgument(i8* nonnull %6, i64 8, i64 16), !dbg !1008
  %8 = icmp eq i32 %7, 0, !dbg !1008
  br i1 %8, label %setup.next2, label %setup.end, !dbg !1008

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast i32* %NX.addr to i8*, !dbg !1010
  %10 = call i32 @cudaSetupArgument(i8* nonnull %9, i64 4, i64 24), !dbg !1010
  %11 = icmp eq i32 %10, 0, !dbg !1010
  br i1 %11, label %setup.next3, label %setup.end, !dbg !1010

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast i32* %NY.addr to i8*, !dbg !1012
  %13 = call i32 @cudaSetupArgument(i8* nonnull %12, i64 4, i64 28), !dbg !1012
  %14 = icmp eq i32 %13, 0, !dbg !1012
  br i1 %14, label %setup.next4, label %setup.end, !dbg !1012

setup.next4:                                      ; preds = %setup.next3
  %15 = call i32 @cudaLaunch(i8* bitcast (void (float*, float*, float*, i32, i32)* @_Z12bicg_kernel1PfS_S_ii to i8*)), !dbg !1014
  br label %setup.end, !dbg !1014

setup.end:                                        ; preds = %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !1016
}

declare i32 @cudaSetupArgument(i8*, i64, i64) local_unnamed_addr

declare i32 @cudaLaunch(i8*) local_unnamed_addr

; Function Attrs: uwtable
define void @_Z12bicg_kernel2PfS_S_ii(float* %A, float* %p, float* %q, i32 %NX, i32 %NY) #4 !dbg !1017 {
entry:
  %A.addr = alloca float*, align 8
  %p.addr = alloca float*, align 8
  %q.addr = alloca float*, align 8
  %NX.addr = alloca i32, align 4
  %NY.addr = alloca i32, align 4
  tail call void @llvm.dbg.value(metadata float* %A, i64 0, metadata !1019, metadata !612), !dbg !1024
  store float* %A, float** %A.addr, align 8, !tbaa !999
  tail call void @llvm.dbg.value(metadata float* %p, i64 0, metadata !1020, metadata !612), !dbg !1025
  store float* %p, float** %p.addr, align 8, !tbaa !999
  tail call void @llvm.dbg.value(metadata float* %q, i64 0, metadata !1021, metadata !612), !dbg !1026
  store float* %q, float** %q.addr, align 8, !tbaa !999
  tail call void @llvm.dbg.value(metadata i32 %NX, i64 0, metadata !1022, metadata !612), !dbg !1027
  store i32 %NX, i32* %NX.addr, align 4, !tbaa !715
  tail call void @llvm.dbg.value(metadata i32 %NY, i64 0, metadata !1023, metadata !612), !dbg !1028
  store i32 %NY, i32* %NY.addr, align 4, !tbaa !715
  %0 = bitcast float** %A.addr to i8*, !dbg !1029
  %1 = call i32 @cudaSetupArgument(i8* nonnull %0, i64 8, i64 0), !dbg !1029
  %2 = icmp eq i32 %1, 0, !dbg !1029
  br i1 %2, label %setup.next, label %setup.end, !dbg !1029

setup.next:                                       ; preds = %entry
  %3 = bitcast float** %p.addr to i8*, !dbg !1030
  %4 = call i32 @cudaSetupArgument(i8* nonnull %3, i64 8, i64 8), !dbg !1030
  %5 = icmp eq i32 %4, 0, !dbg !1030
  br i1 %5, label %setup.next1, label %setup.end, !dbg !1030

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast float** %q.addr to i8*, !dbg !1032
  %7 = call i32 @cudaSetupArgument(i8* nonnull %6, i64 8, i64 16), !dbg !1032
  %8 = icmp eq i32 %7, 0, !dbg !1032
  br i1 %8, label %setup.next2, label %setup.end, !dbg !1032

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast i32* %NX.addr to i8*, !dbg !1034
  %10 = call i32 @cudaSetupArgument(i8* nonnull %9, i64 4, i64 24), !dbg !1034
  %11 = icmp eq i32 %10, 0, !dbg !1034
  br i1 %11, label %setup.next3, label %setup.end, !dbg !1034

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast i32* %NY.addr to i8*, !dbg !1036
  %13 = call i32 @cudaSetupArgument(i8* nonnull %12, i64 4, i64 28), !dbg !1036
  %14 = icmp eq i32 %13, 0, !dbg !1036
  br i1 %14, label %setup.next4, label %setup.end, !dbg !1036

setup.next4:                                      ; preds = %setup.next3
  %15 = call i32 @cudaLaunch(i8* bitcast (void (float*, float*, float*, i32, i32)* @_Z12bicg_kernel2PfS_S_ii to i8*)), !dbg !1038
  br label %setup.end, !dbg !1038

setup.end:                                        ; preds = %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !1040
}

; Function Attrs: nounwind uwtable
define void @_Z8bicg_cpuPfS_S_S_S_(float* nocapture readonly %A, float* nocapture readonly %r, float* nocapture %s, float* nocapture readonly %p, float* nocapture %q) local_unnamed_addr #0 !dbg !1041 {
entry:
  tail call void @llvm.dbg.value(metadata float* %A, i64 0, metadata !1045, metadata !612), !dbg !1052
  tail call void @llvm.dbg.value(metadata float* %r, i64 0, metadata !1046, metadata !612), !dbg !1053
  tail call void @llvm.dbg.value(metadata float* %s, i64 0, metadata !1047, metadata !612), !dbg !1054
  tail call void @llvm.dbg.value(metadata float* %p, i64 0, metadata !1048, metadata !612), !dbg !1055
  tail call void @llvm.dbg.value(metadata float* %q, i64 0, metadata !1049, metadata !612), !dbg !1056
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !1050, metadata !612), !dbg !1057
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !1050, metadata !612), !dbg !1057
  %0 = load i32, i32* @NY, align 4, !dbg !1058, !tbaa !715
  %cmp65 = icmp sgt i32 %0, 0, !dbg !1062
  br i1 %cmp65, label %for.body.lr.ph, label %for.cond1.preheader, !dbg !1063

for.body.lr.ph:                                   ; preds = %entry
  %s74 = bitcast float* %s to i8*
  %1 = add nsw i32 %0, -1, !dbg !1063
  %2 = zext i32 %1 to i64, !dbg !1063
  %3 = shl nuw nsw i64 %2, 2, !dbg !1063
  %4 = add nuw nsw i64 %3, 4, !dbg !1063
  call void @llvm.memset.p0i8.i64(i8* %s74, i8 0, i64 %4, i32 4, i1 false), !dbg !1065
  br label %for.cond1.preheader, !dbg !1057

for.cond1.preheader:                              ; preds = %for.body.lr.ph, %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !1050, metadata !612), !dbg !1057
  %5 = load i32, i32* @NX, align 4, !dbg !1067, !tbaa !715
  %cmp262 = icmp sgt i32 %5, 0, !dbg !1071
  br i1 %cmp262, label %for.body3.lr.ph, label %for.end36, !dbg !1072

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  %6 = load i32, i32* @NY, align 4
  %cmp760 = icmp sgt i32 %6, 0
  %7 = sext i32 %6 to i64, !dbg !1072
  %8 = sext i32 %5 to i64, !dbg !1072
  %wide.trip.count = zext i32 %6 to i64
  br label %for.body3, !dbg !1072

for.body3:                                        ; preds = %for.body3.lr.ph, %for.inc34
  %indvars.iv68 = phi i64 [ 0, %for.body3.lr.ph ], [ %indvars.iv.next69, %for.inc34 ]
  %arrayidx5 = getelementptr inbounds float, float* %q, i64 %indvars.iv68, !dbg !1074
  store float 0.000000e+00, float* %arrayidx5, align 4, !dbg !1076, !tbaa !732
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !1051, metadata !612), !dbg !1077
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !1051, metadata !612), !dbg !1077
  br i1 %cmp760, label %for.body8.lr.ph, label %for.inc34, !dbg !1078

for.body8.lr.ph:                                  ; preds = %for.body3
  %arrayidx12 = getelementptr inbounds float, float* %r, i64 %indvars.iv68
  %9 = mul nsw i64 %indvars.iv68, %7
  br label %for.body8, !dbg !1078

for.body8:                                        ; preds = %for.body8, %for.body8.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body8.lr.ph ], [ %indvars.iv.next, %for.body8 ]
  %arrayidx10 = getelementptr inbounds float, float* %s, i64 %indvars.iv, !dbg !1081
  %10 = load float, float* %arrayidx10, align 4, !dbg !1081, !tbaa !732
  %11 = load float, float* %arrayidx12, align 4, !dbg !1084, !tbaa !732
  %12 = add nsw i64 %9, %indvars.iv, !dbg !1085
  %arrayidx14 = getelementptr inbounds float, float* %A, i64 %12, !dbg !1086
  %13 = load float, float* %arrayidx14, align 4, !dbg !1086, !tbaa !732
  %mul15 = fmul float %11, %13, !dbg !1087
  %add16 = fadd float %10, %mul15, !dbg !1088
  store float %add16, float* %arrayidx10, align 4, !dbg !1089, !tbaa !732
  %14 = load float, float* %arrayidx5, align 4, !dbg !1090, !tbaa !732
  %15 = load float, float* %arrayidx14, align 4, !dbg !1091, !tbaa !732
  %arrayidx26 = getelementptr inbounds float, float* %p, i64 %indvars.iv, !dbg !1092
  %16 = load float, float* %arrayidx26, align 4, !dbg !1092, !tbaa !732
  %mul27 = fmul float %15, %16, !dbg !1093
  %add28 = fadd float %14, %mul27, !dbg !1094
  store float %add28, float* %arrayidx5, align 4, !dbg !1095, !tbaa !732
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !1096
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count, !dbg !1098
  br i1 %exitcond, label %for.inc34.loopexit, label %for.body8, !dbg !1078, !llvm.loop !1100

for.inc34.loopexit:                               ; preds = %for.body8
  br label %for.inc34, !dbg !1103

for.inc34:                                        ; preds = %for.inc34.loopexit, %for.body3
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1, !dbg !1103
  %cmp2 = icmp slt i64 %indvars.iv.next69, %8, !dbg !1071
  br i1 %cmp2, label %for.body3, label %for.end36.loopexit, !dbg !1072, !llvm.loop !1105

for.end36.loopexit:                               ; preds = %for.inc34
  br label %for.end36, !dbg !1108

for.end36:                                        ; preds = %for.end36.loopexit, %for.cond1.preheader
  ret void, !dbg !1108
}

; Function Attrs: uwtable
define void @_Z8bicgCudaPfS_S_S_S_S_S_(float* %A, float* %r, float* %s, float* %p, float* %q, float* %s_outputFromGpu, float* %q_outputFromGpu) local_unnamed_addr #4 !dbg !1109 {
entry:
  %Tzp.i110 = alloca %struct.timezone, align 4
  %Tp.i111 = alloca %struct.timeval, align 8
  %Tzp.i97 = alloca %struct.timezone, align 4
  %Tp.i98 = alloca %struct.timeval, align 8
  %Tzp.i = alloca %struct.timezone, align 4
  %Tp.i = alloca %struct.timeval, align 8
  %A_gpu = alloca float*, align 8
  %q_gpu = alloca float*, align 8
  %p_gpu = alloca float*, align 8
  %r_gpu = alloca float*, align 8
  %s_gpu = alloca float*, align 8
  tail call void @llvm.dbg.value(metadata float* %A, i64 0, metadata !1113, metadata !612), !dbg !1154
  tail call void @llvm.dbg.value(metadata float* %r, i64 0, metadata !1114, metadata !612), !dbg !1155
  tail call void @llvm.dbg.value(metadata float* %s, i64 0, metadata !1115, metadata !612), !dbg !1156
  tail call void @llvm.dbg.value(metadata float* %p, i64 0, metadata !1116, metadata !612), !dbg !1157
  tail call void @llvm.dbg.value(metadata float* %q, i64 0, metadata !1117, metadata !612), !dbg !1158
  tail call void @llvm.dbg.value(metadata float* %s_outputFromGpu, i64 0, metadata !1118, metadata !612), !dbg !1159
  tail call void @llvm.dbg.value(metadata float* %q_outputFromGpu, i64 0, metadata !1119, metadata !612), !dbg !1160
  %0 = bitcast float** %A_gpu to i8*, !dbg !1161
  call void @llvm.lifetime.start(i64 8, i8* nonnull %0) #8, !dbg !1161
  %1 = bitcast float** %q_gpu to i8*, !dbg !1162
  call void @llvm.lifetime.start(i64 8, i8* nonnull %1) #8, !dbg !1162
  %2 = bitcast float** %p_gpu to i8*, !dbg !1163
  call void @llvm.lifetime.start(i64 8, i8* nonnull %2) #8, !dbg !1163
  %3 = bitcast float** %r_gpu to i8*, !dbg !1164
  call void @llvm.lifetime.start(i64 8, i8* nonnull %3) #8, !dbg !1164
  %4 = bitcast float** %s_gpu to i8*, !dbg !1165
  call void @llvm.lifetime.start(i64 8, i8* nonnull %4) #8, !dbg !1165
  %5 = bitcast float** %A_gpu to i8**, !dbg !1166
  %6 = load i32, i32* @NX, align 4, !dbg !1167, !tbaa !715
  %conv = sext i32 %6 to i64, !dbg !1167
  %mul = shl nsw i64 %conv, 2, !dbg !1168
  %7 = load i32, i32* @NY, align 4, !dbg !1169, !tbaa !715
  %conv1 = sext i32 %7 to i64, !dbg !1169
  %mul2 = mul i64 %mul, %conv1, !dbg !1170
  %call = call i32 @cudaMalloc(i8** nonnull %5, i64 %mul2), !dbg !1171
  %8 = bitcast float** %r_gpu to i8**, !dbg !1172
  %9 = load i32, i32* @NX, align 4, !dbg !1173, !tbaa !715
  %conv3 = sext i32 %9 to i64, !dbg !1173
  %mul4 = shl nsw i64 %conv3, 2, !dbg !1174
  %call5 = call i32 @cudaMalloc(i8** nonnull %8, i64 %mul4), !dbg !1175
  %10 = bitcast float** %s_gpu to i8**, !dbg !1176
  %11 = load i32, i32* @NY, align 4, !dbg !1177, !tbaa !715
  %conv6 = sext i32 %11 to i64, !dbg !1177
  %mul7 = shl nsw i64 %conv6, 2, !dbg !1178
  %call8 = call i32 @cudaMalloc(i8** nonnull %10, i64 %mul7), !dbg !1179
  %12 = bitcast float** %p_gpu to i8**, !dbg !1180
  %13 = load i32, i32* @NY, align 4, !dbg !1181, !tbaa !715
  %conv9 = sext i32 %13 to i64, !dbg !1181
  %mul10 = shl nsw i64 %conv9, 2, !dbg !1182
  %call11 = call i32 @cudaMalloc(i8** nonnull %12, i64 %mul10), !dbg !1183
  %14 = bitcast float** %q_gpu to i8**, !dbg !1184
  %15 = load i32, i32* @NX, align 4, !dbg !1185, !tbaa !715
  %conv12 = sext i32 %15 to i64, !dbg !1185
  %mul13 = shl nsw i64 %conv12, 2, !dbg !1186
  %call14 = call i32 @cudaMalloc(i8** nonnull %14, i64 %mul13), !dbg !1187
  %16 = load i8*, i8** %5, align 8, !dbg !1188, !tbaa !999
  %17 = bitcast float* %A to i8*, !dbg !1189
  %18 = load i32, i32* @NX, align 4, !dbg !1190, !tbaa !715
  %conv15 = sext i32 %18 to i64, !dbg !1190
  %mul16 = shl nsw i64 %conv15, 2, !dbg !1191
  %19 = load i32, i32* @NY, align 4, !dbg !1192, !tbaa !715
  %conv17 = sext i32 %19 to i64, !dbg !1192
  %mul18 = mul i64 %mul16, %conv17, !dbg !1193
  %call19 = call i32 @cudaMemcpy(i8* %16, i8* %17, i64 %mul18, i32 1), !dbg !1194
  %20 = load i8*, i8** %8, align 8, !dbg !1195, !tbaa !999
  %21 = bitcast float* %r to i8*, !dbg !1196
  %22 = load i32, i32* @NX, align 4, !dbg !1197, !tbaa !715
  %conv20 = sext i32 %22 to i64, !dbg !1197
  %mul21 = shl nsw i64 %conv20, 2, !dbg !1198
  %call22 = call i32 @cudaMemcpy(i8* %20, i8* %21, i64 %mul21, i32 1), !dbg !1199
  %23 = load i8*, i8** %10, align 8, !dbg !1200, !tbaa !999
  %24 = bitcast float* %s to i8*, !dbg !1201
  %25 = load i32, i32* @NY, align 4, !dbg !1202, !tbaa !715
  %conv23 = sext i32 %25 to i64, !dbg !1202
  %mul24 = shl nsw i64 %conv23, 2, !dbg !1203
  %call25 = call i32 @cudaMemcpy(i8* %23, i8* %24, i64 %mul24, i32 1), !dbg !1204
  %26 = load i8*, i8** %12, align 8, !dbg !1205, !tbaa !999
  %27 = bitcast float* %p to i8*, !dbg !1206
  %28 = load i32, i32* @NY, align 4, !dbg !1207, !tbaa !715
  %conv26 = sext i32 %28 to i64, !dbg !1207
  %mul27 = shl nsw i64 %conv26, 2, !dbg !1208
  %call28 = call i32 @cudaMemcpy(i8* %26, i8* %27, i64 %mul27, i32 1), !dbg !1209
  %29 = load i8*, i8** %14, align 8, !dbg !1210, !tbaa !999
  %30 = bitcast float* %q to i8*, !dbg !1211
  %31 = load i32, i32* @NX, align 4, !dbg !1212, !tbaa !715
  %conv29 = sext i32 %31 to i64, !dbg !1212
  %mul30 = shl nsw i64 %conv29, 2, !dbg !1213
  %call31 = call i32 @cudaMemcpy(i8* %29, i8* %30, i64 %mul30, i32 1), !dbg !1214
  call void @llvm.dbg.value(metadata %struct.dim3* undef, i64 0, metadata !1128, metadata !608), !dbg !1215
  %32 = load i32, i32* @NY, align 4, !dbg !1216, !tbaa !715
  %conv32 = sitofp i32 %32 to float, !dbg !1216
  %div = fmul float %conv32, 3.906250e-03, !dbg !1217
  %call35 = call float @llvm.ceil.f32(float %div), !dbg !1218
  %conv36 = fptoui float %call35 to i64, !dbg !1219
  %conv37 = trunc i64 %conv36 to i32, !dbg !1220
  call void @llvm.dbg.value(metadata %struct.dim3* undef, i64 0, metadata !1152, metadata !608), !dbg !1221
  %33 = load i32, i32* @NX, align 4, !dbg !1222, !tbaa !715
  %conv38 = sitofp i32 %33 to float, !dbg !1222
  %div41 = fmul float %conv38, 3.906250e-03, !dbg !1223
  %call43 = call float @llvm.ceil.f32(float %div41), !dbg !1224
  %conv44 = fptoui float %call43 to i64, !dbg !1225
  %conv45 = trunc i64 %conv44 to i32, !dbg !1226
  call void @llvm.dbg.value(metadata %struct.dim3* undef, i64 0, metadata !1153, metadata !608), !dbg !1227
  %call47 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i64 0, i64 0), i32 %conv37), !dbg !1228
  %call49 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.4, i64 0, i64 0), i32 %conv45), !dbg !1229
  %call50 = call i32 @cudaThreadSynchronize(), !dbg !1230
  %34 = bitcast %struct.timezone* %Tzp.i97 to i8*, !dbg !1231
  call void @llvm.lifetime.start(i64 8, i8* nonnull %34) #8, !dbg !1231
  %35 = bitcast %struct.timeval* %Tp.i98 to i8*, !dbg !1233
  call void @llvm.lifetime.start(i64 16, i8* nonnull %35) #8, !dbg !1233
  call void @llvm.dbg.value(metadata %struct.timezone* %Tzp.i97, i64 0, metadata !590, metadata !608) #8, !dbg !1234
  call void @llvm.dbg.value(metadata %struct.timeval* %Tp.i98, i64 0, metadata !596, metadata !608) #8, !dbg !1235
  %call.i99 = call i32 @gettimeofday(%struct.timeval* nonnull %Tp.i98, %struct.timezone* nonnull %Tzp.i97) #8, !dbg !1236
  call void @llvm.dbg.value(metadata i32 %call.i99, i64 0, metadata !605, metadata !612) #8, !dbg !1237
  %cmp.i100 = icmp eq i32 %call.i99, 0, !dbg !1238
  br i1 %cmp.i100, label %_Z7rtclockv.exit109, label %if.then.i102, !dbg !1239

if.then.i102:                                     ; preds = %entry
  %call1.i101 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str, i64 0, i64 0), i32 %call.i99) #8, !dbg !1240
  br label %_Z7rtclockv.exit109, !dbg !1240

_Z7rtclockv.exit109:                              ; preds = %entry, %if.then.i102
  %tv_sec.i103 = getelementptr inbounds %struct.timeval, %struct.timeval* %Tp.i98, i64 0, i32 0, !dbg !1241
  %36 = load i64, i64* %tv_sec.i103, align 8, !dbg !1241, !tbaa !620
  %conv.i104 = sitofp i64 %36 to double, !dbg !1242
  %tv_usec.i105 = getelementptr inbounds %struct.timeval, %struct.timeval* %Tp.i98, i64 0, i32 1, !dbg !1243
  %37 = load i64, i64* %tv_usec.i105, align 8, !dbg !1243, !tbaa !627
  %conv2.i106 = sitofp i64 %37 to double, !dbg !1244
  %mul.i107 = fmul double %conv2.i106, 1.000000e-06, !dbg !1245
  %add.i108 = fadd double %mul.i107, %conv.i104, !dbg !1246
  call void @llvm.lifetime.end(i64 16, i8* nonnull %35) #8, !dbg !1247
  call void @llvm.lifetime.end(i64 8, i8* nonnull %34) #8, !dbg !1247
  call void @llvm.dbg.value(metadata double %add.i108, i64 0, metadata !1120, metadata !612), !dbg !1248
  %grid1.sroa.0.sroa.0.0.insert.ext = and i64 %conv36, 4294967295, !dbg !1249
  %grid1.sroa.0.sroa.0.0.insert.insert = or i64 %grid1.sroa.0.sroa.0.0.insert.ext, 4294967296, !dbg !1249
  %call53 = call i32 @cudaConfigureCall(i64 %grid1.sroa.0.sroa.0.0.insert.insert, i32 1, i64 4294967552, i32 1, i64 0, %struct.CUstream_st* null), !dbg !1250
  %tobool = icmp eq i32 %call53, 0, !dbg !1250
  br i1 %tobool, label %kcall.configok, label %kcall.end, !dbg !1251

kcall.configok:                                   ; preds = %_Z7rtclockv.exit109
  %38 = load float*, float** %A_gpu, align 8, !dbg !1252, !tbaa !999
  call void @llvm.dbg.value(metadata float* %38, i64 0, metadata !1123, metadata !612), !dbg !1254
  %39 = load float*, float** %r_gpu, align 8, !dbg !1255, !tbaa !999
  call void @llvm.dbg.value(metadata float* %39, i64 0, metadata !1126, metadata !612), !dbg !1256
  %40 = load float*, float** %s_gpu, align 8, !dbg !1257, !tbaa !999
  call void @llvm.dbg.value(metadata float* %40, i64 0, metadata !1127, metadata !612), !dbg !1258
  %41 = load i32, i32* @NX, align 4, !dbg !1259, !tbaa !715
  %42 = load i32, i32* @NY, align 4, !dbg !1260, !tbaa !715
  call void @_Z12bicg_kernel1PfS_S_ii(float* %38, float* %39, float* %40, i32 %41, i32 %42), !dbg !1261
  br label %kcall.end, !dbg !1261

kcall.end:                                        ; preds = %_Z7rtclockv.exit109, %kcall.configok
  %call54 = call i32 @cudaThreadSynchronize(), !dbg !1262
  %43 = bitcast %struct.timezone* %Tzp.i110 to i8*, !dbg !1263
  call void @llvm.lifetime.start(i64 8, i8* nonnull %43) #8, !dbg !1263
  %44 = bitcast %struct.timeval* %Tp.i111 to i8*, !dbg !1265
  call void @llvm.lifetime.start(i64 16, i8* nonnull %44) #8, !dbg !1265
  call void @llvm.dbg.value(metadata %struct.timezone* %Tzp.i110, i64 0, metadata !590, metadata !608) #8, !dbg !1266
  call void @llvm.dbg.value(metadata %struct.timeval* %Tp.i111, i64 0, metadata !596, metadata !608) #8, !dbg !1267
  %call.i112 = call i32 @gettimeofday(%struct.timeval* nonnull %Tp.i111, %struct.timezone* nonnull %Tzp.i110) #8, !dbg !1268
  call void @llvm.dbg.value(metadata i32 %call.i112, i64 0, metadata !605, metadata !612) #8, !dbg !1269
  %cmp.i113 = icmp eq i32 %call.i112, 0, !dbg !1270
  br i1 %cmp.i113, label %_Z7rtclockv.exit122, label %if.then.i115, !dbg !1271

if.then.i115:                                     ; preds = %kcall.end
  %call1.i114 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str, i64 0, i64 0), i32 %call.i112) #8, !dbg !1272
  br label %_Z7rtclockv.exit122, !dbg !1272

_Z7rtclockv.exit122:                              ; preds = %kcall.end, %if.then.i115
  call void @llvm.lifetime.end(i64 16, i8* nonnull %44) #8, !dbg !1273
  call void @llvm.lifetime.end(i64 8, i8* nonnull %43) #8, !dbg !1273
  %grid2.sroa.0.sroa.0.0.insert.ext = and i64 %conv44, 4294967295, !dbg !1274
  %grid2.sroa.0.sroa.0.0.insert.insert = or i64 %grid2.sroa.0.sroa.0.0.insert.ext, 4294967296, !dbg !1274
  %call58 = call i32 @cudaConfigureCall(i64 %grid2.sroa.0.sroa.0.0.insert.insert, i32 1, i64 4294967552, i32 1, i64 0, %struct.CUstream_st* null), !dbg !1275
  %tobool59 = icmp eq i32 %call58, 0, !dbg !1275
  br i1 %tobool59, label %kcall.configok60, label %kcall.end61, !dbg !1276

kcall.configok60:                                 ; preds = %_Z7rtclockv.exit122
  %45 = load float*, float** %A_gpu, align 8, !dbg !1277, !tbaa !999
  call void @llvm.dbg.value(metadata float* %45, i64 0, metadata !1123, metadata !612), !dbg !1254
  %46 = load float*, float** %p_gpu, align 8, !dbg !1278, !tbaa !999
  call void @llvm.dbg.value(metadata float* %46, i64 0, metadata !1125, metadata !612), !dbg !1279
  %47 = load float*, float** %q_gpu, align 8, !dbg !1280, !tbaa !999
  call void @llvm.dbg.value(metadata float* %47, i64 0, metadata !1124, metadata !612), !dbg !1281
  %48 = load i32, i32* @NX, align 4, !dbg !1282, !tbaa !715
  %49 = load i32, i32* @NY, align 4, !dbg !1283, !tbaa !715
  call void @_Z12bicg_kernel2PfS_S_ii(float* %45, float* %46, float* %47, i32 %48, i32 %49), !dbg !1284
  br label %kcall.end61, !dbg !1284

kcall.end61:                                      ; preds = %_Z7rtclockv.exit122, %kcall.configok60
  %call62 = call i32 @cudaThreadSynchronize(), !dbg !1285
  %50 = bitcast %struct.timezone* %Tzp.i to i8*, !dbg !1286
  call void @llvm.lifetime.start(i64 8, i8* nonnull %50) #8, !dbg !1286
  %51 = bitcast %struct.timeval* %Tp.i to i8*, !dbg !1288
  call void @llvm.lifetime.start(i64 16, i8* nonnull %51) #8, !dbg !1288
  call void @llvm.dbg.value(metadata %struct.timezone* %Tzp.i, i64 0, metadata !590, metadata !608) #8, !dbg !1289
  call void @llvm.dbg.value(metadata %struct.timeval* %Tp.i, i64 0, metadata !596, metadata !608) #8, !dbg !1290
  %call.i = call i32 @gettimeofday(%struct.timeval* nonnull %Tp.i, %struct.timezone* nonnull %Tzp.i) #8, !dbg !1291
  call void @llvm.dbg.value(metadata i32 %call.i, i64 0, metadata !605, metadata !612) #8, !dbg !1292
  %cmp.i = icmp eq i32 %call.i, 0, !dbg !1293
  br i1 %cmp.i, label %_Z7rtclockv.exit, label %if.then.i, !dbg !1294

if.then.i:                                        ; preds = %kcall.end61
  %call1.i = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str, i64 0, i64 0), i32 %call.i) #8, !dbg !1295
  br label %_Z7rtclockv.exit, !dbg !1295

_Z7rtclockv.exit:                                 ; preds = %kcall.end61, %if.then.i
  %tv_sec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %Tp.i, i64 0, i32 0, !dbg !1296
  %52 = load i64, i64* %tv_sec.i, align 8, !dbg !1296, !tbaa !620
  %conv.i = sitofp i64 %52 to double, !dbg !1297
  %tv_usec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %Tp.i, i64 0, i32 1, !dbg !1298
  %53 = load i64, i64* %tv_usec.i, align 8, !dbg !1298, !tbaa !627
  %conv2.i = sitofp i64 %53 to double, !dbg !1299
  %mul.i = fmul double %conv2.i, 1.000000e-06, !dbg !1300
  %add.i = fadd double %mul.i, %conv.i, !dbg !1301
  call void @llvm.lifetime.end(i64 16, i8* nonnull %51) #8, !dbg !1302
  call void @llvm.lifetime.end(i64 8, i8* nonnull %50) #8, !dbg !1302
  call void @llvm.dbg.value(metadata double %add.i, i64 0, metadata !1121, metadata !612), !dbg !1303
  %54 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !1304, !tbaa !999
  %sub = fsub double %add.i, %add.i108, !dbg !1305
  %call64 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %54, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.5, i64 0, i64 0), double %sub), !dbg !1306
  %55 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1307, !tbaa !999
  %call66 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %55, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.6, i64 0, i64 0), double %sub) #9, !dbg !1308
  %56 = bitcast float* %s_outputFromGpu to i8*, !dbg !1309
  %57 = load i8*, i8** %10, align 8, !dbg !1310, !tbaa !999
  %58 = load i32, i32* @NY, align 4, !dbg !1311, !tbaa !715
  %conv67 = sext i32 %58 to i64, !dbg !1311
  %mul68 = shl nsw i64 %conv67, 2, !dbg !1312
  %call69 = call i32 @cudaMemcpy(i8* %56, i8* %57, i64 %mul68, i32 2), !dbg !1313
  %59 = bitcast float* %q_outputFromGpu to i8*, !dbg !1314
  %60 = load i8*, i8** %14, align 8, !dbg !1315, !tbaa !999
  %61 = load i32, i32* @NX, align 4, !dbg !1316, !tbaa !715
  %conv70 = sext i32 %61 to i64, !dbg !1316
  %mul71 = shl nsw i64 %conv70, 2, !dbg !1317
  %call72 = call i32 @cudaMemcpy(i8* %59, i8* %60, i64 %mul71, i32 2), !dbg !1318
  %62 = load i8*, i8** %5, align 8, !dbg !1319, !tbaa !999
  %call73 = call i32 @cudaFree(i8* %62), !dbg !1320
  %63 = load i8*, i8** %8, align 8, !dbg !1321, !tbaa !999
  %call74 = call i32 @cudaFree(i8* %63), !dbg !1322
  %64 = load i8*, i8** %10, align 8, !dbg !1323, !tbaa !999
  %call75 = call i32 @cudaFree(i8* %64), !dbg !1324
  %65 = load i8*, i8** %12, align 8, !dbg !1325, !tbaa !999
  %call76 = call i32 @cudaFree(i8* %65), !dbg !1326
  %66 = load i8*, i8** %14, align 8, !dbg !1327, !tbaa !999
  %call77 = call i32 @cudaFree(i8* %66), !dbg !1328
  call void @llvm.lifetime.end(i64 8, i8* nonnull %4) #8, !dbg !1329
  call void @llvm.lifetime.end(i64 8, i8* nonnull %3) #8, !dbg !1329
  call void @llvm.lifetime.end(i64 8, i8* nonnull %2) #8, !dbg !1329
  call void @llvm.lifetime.end(i64 8, i8* nonnull %1) #8, !dbg !1329
  call void @llvm.lifetime.end(i64 8, i8* nonnull %0) #8, !dbg !1329
  ret void, !dbg !1329
}

declare i32 @cudaMalloc(i8**, i64) local_unnamed_addr #5

declare i32 @cudaMemcpy(i8*, i8*, i64, i32) local_unnamed_addr #5

declare i32 @cudaThreadSynchronize() local_unnamed_addr #5

declare i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) local_unnamed_addr #5

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

declare i32 @cudaFree(i8*) local_unnamed_addr #5

; Function Attrs: norecurse uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #6 !dbg !1330 {
entry:
  %Tzp.i72 = alloca %struct.timezone, align 4
  %Tp.i73 = alloca %struct.timeval, align 8
  %Tzp.i = alloca %struct.timezone, align 4
  %Tp.i = alloca %struct.timeval, align 8
  %deviceProp.i = alloca %struct.cudaDeviceProp, align 8
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !1334, metadata !612), !dbg !1345
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !1335, metadata !612), !dbg !1346
  %cmp = icmp eq i32 %argc, 3, !dbg !1347
  br i1 %cmp, label %if.end, label %if.then, !dbg !1349

if.then:                                          ; preds = %entry
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @str, i64 0, i64 0)), !dbg !1350
  br label %cleanup, !dbg !1352

if.end:                                           ; preds = %entry
  %arrayidx = getelementptr inbounds i8*, i8** %argv, i64 1, !dbg !1353
  %0 = load i8*, i8** %arrayidx, align 8, !dbg !1353, !tbaa !999
  tail call void @llvm.dbg.value(metadata i8* %0, i64 0, metadata !309, metadata !612) #8, !dbg !1354
  %call.i = tail call i64 @strtol(i8* nocapture nonnull %0, i8** null, i32 10) #8, !dbg !1356
  %conv.i = trunc i64 %call.i to i32, !dbg !1356
  store i32 %conv.i, i32* @NX, align 4, !dbg !1357, !tbaa !715
  %arrayidx2 = getelementptr inbounds i8*, i8** %argv, i64 2, !dbg !1358
  %1 = load i8*, i8** %arrayidx2, align 8, !dbg !1358, !tbaa !999
  tail call void @llvm.dbg.value(metadata i8* %1, i64 0, metadata !309, metadata !612) #8, !dbg !1359
  %call.i58 = tail call i64 @strtol(i8* nocapture nonnull %1, i8** null, i32 10) #8, !dbg !1361
  %conv.i59 = trunc i64 %call.i58 to i32, !dbg !1361
  store i32 %conv.i59, i32* @NY, align 4, !dbg !1362, !tbaa !715
  %call4 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.8, i64 0, i64 0), i32 %conv.i, i32 %conv.i59), !dbg !1363
  %2 = load i32, i32* @NX, align 4, !dbg !1364, !tbaa !715
  %3 = load i32, i32* @NY, align 4, !dbg !1365, !tbaa !715
  %mul = mul nsw i32 %3, %2, !dbg !1366
  %conv = sext i32 %mul to i64, !dbg !1364
  %mul5 = shl nsw i64 %conv, 2, !dbg !1367
  %call6 = tail call noalias i8* @malloc(i64 %mul5) #8, !dbg !1368
  %4 = bitcast i8* %call6 to float*, !dbg !1369
  tail call void @llvm.dbg.value(metadata float* %4, i64 0, metadata !1338, metadata !612), !dbg !1370
  %conv7 = sext i32 %2 to i64, !dbg !1371
  %mul8 = shl nsw i64 %conv7, 2, !dbg !1372
  %call9 = tail call noalias i8* @malloc(i64 %mul8) #8, !dbg !1373
  %5 = bitcast i8* %call9 to float*, !dbg !1374
  tail call void @llvm.dbg.value(metadata float* %5, i64 0, metadata !1339, metadata !612), !dbg !1375
  %conv10 = sext i32 %3 to i64, !dbg !1376
  %mul11 = shl nsw i64 %conv10, 2, !dbg !1377
  %call12 = tail call noalias i8* @malloc(i64 %mul11) #8, !dbg !1378
  %6 = bitcast i8* %call12 to float*, !dbg !1379
  tail call void @llvm.dbg.value(metadata float* %6, i64 0, metadata !1340, metadata !612), !dbg !1380
  %call15 = tail call noalias i8* @malloc(i64 %mul11) #8, !dbg !1381
  %7 = bitcast i8* %call15 to float*, !dbg !1382
  tail call void @llvm.dbg.value(metadata float* %7, i64 0, metadata !1341, metadata !612), !dbg !1383
  %call18 = tail call noalias i8* @malloc(i64 %mul8) #8, !dbg !1384
  %8 = bitcast i8* %call18 to float*, !dbg !1385
  tail call void @llvm.dbg.value(metadata float* %8, i64 0, metadata !1342, metadata !612), !dbg !1386
  %call21 = tail call noalias i8* @malloc(i64 %mul11) #8, !dbg !1387
  %9 = bitcast i8* %call21 to float*, !dbg !1388
  tail call void @llvm.dbg.value(metadata float* %9, i64 0, metadata !1343, metadata !612), !dbg !1389
  %call24 = tail call noalias i8* @malloc(i64 %mul8) #8, !dbg !1390
  %10 = bitcast i8* %call24 to float*, !dbg !1391
  tail call void @llvm.dbg.value(metadata float* %10, i64 0, metadata !1344, metadata !612), !dbg !1392
  tail call void @llvm.dbg.value(metadata float* %4, i64 0, metadata !702, metadata !612), !dbg !1393
  tail call void @llvm.dbg.value(metadata float* %7, i64 0, metadata !703, metadata !612), !dbg !1395
  tail call void @llvm.dbg.value(metadata float* %5, i64 0, metadata !704, metadata !612), !dbg !1396
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !705, metadata !612), !dbg !1397
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !705, metadata !612), !dbg !1397
  %cmp43.i = icmp sgt i32 %2, 0, !dbg !1398
  br i1 %cmp43.i, label %for.body.lr.ph.i, label %for.cond15.preheader.i, !dbg !1399

for.body.lr.ph.i:                                 ; preds = %if.end
  %cmp341.i = icmp sgt i32 %3, 0
  %conv8.i = sitofp i32 %2 to float
  %wide.trip.count.i = zext i32 %3 to i64
  %min.iters.check = icmp ult i32 %3, 4
  %11 = and i32 %3, 3
  %n.mod.vf = zext i32 %11 to i64
  %n.vec = sub nsw i64 %wide.trip.count.i, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %broadcast.splatinsert90 = insertelement <4 x float> undef, float %conv8.i, i32 0
  %broadcast.splat91 = shufflevector <4 x float> %broadcast.splatinsert90, <4 x float> undef, <4 x i32> zeroinitializer
  %cmp.n = icmp eq i32 %11, 0
  br label %for.body.i, !dbg !1399

for.cond15.preheader.i.loopexit:                  ; preds = %for.inc12.i
  br label %for.cond15.preheader.i, !dbg !1397

for.cond15.preheader.i:                           ; preds = %for.cond15.preheader.i.loopexit, %if.end
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !705, metadata !612), !dbg !1397
  %cmp1639.i = icmp sgt i32 %3, 0, !dbg !1400
  br i1 %cmp1639.i, label %for.body17.i.preheader, label %_Z10init_arrayPfS_S_.exit, !dbg !1401

for.body17.i.preheader:                           ; preds = %for.cond15.preheader.i
  %12 = add nsw i64 %conv10, -1, !dbg !1402
  %xtraiter92 = and i64 %conv10, 3, !dbg !1402
  %lcmp.mod93 = icmp eq i64 %xtraiter92, 0, !dbg !1402
  br i1 %lcmp.mod93, label %for.body17.i.prol.loopexit, label %for.body17.i.prol.preheader, !dbg !1402

for.body17.i.prol.preheader:                      ; preds = %for.body17.i.preheader
  br label %for.body17.i.prol, !dbg !1402

for.body17.i.prol:                                ; preds = %for.body17.i.prol, %for.body17.i.prol.preheader
  %indvars.iv.i.prol = phi i64 [ %indvars.iv.next.i.prol, %for.body17.i.prol ], [ 0, %for.body17.i.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body17.i.prol ], [ %xtraiter92, %for.body17.i.prol.preheader ]
  %13 = trunc i64 %indvars.iv.i.prol to i32, !dbg !1402
  %conv18.i.prol = sitofp i32 %13 to double, !dbg !1402
  %mul19.i.prol = fmul double %conv18.i.prol, 0x400921FB54442D18, !dbg !1403
  %conv20.i.prol = fptrunc double %mul19.i.prol to float, !dbg !1402
  %arrayidx22.i.prol = getelementptr inbounds float, float* %7, i64 %indvars.iv.i.prol, !dbg !1404
  store float %conv20.i.prol, float* %arrayidx22.i.prol, align 4, !dbg !1405, !tbaa !732
  %indvars.iv.next.i.prol = add nuw nsw i64 %indvars.iv.i.prol, 1, !dbg !1406
  %prol.iter.sub = add i64 %prol.iter, -1, !dbg !1401
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0, !dbg !1401
  br i1 %prol.iter.cmp, label %for.body17.i.prol.loopexit.unr-lcssa, label %for.body17.i.prol, !dbg !1401, !llvm.loop !1407

for.body17.i.prol.loopexit.unr-lcssa:             ; preds = %for.body17.i.prol
  br label %for.body17.i.prol.loopexit, !dbg !1402

for.body17.i.prol.loopexit:                       ; preds = %for.body17.i.preheader, %for.body17.i.prol.loopexit.unr-lcssa
  %indvars.iv.i.unr = phi i64 [ 0, %for.body17.i.preheader ], [ %indvars.iv.next.i.prol, %for.body17.i.prol.loopexit.unr-lcssa ]
  %14 = icmp ult i64 %12, 3, !dbg !1402
  br i1 %14, label %_Z10init_arrayPfS_S_.exit.loopexit, label %for.body17.i.preheader.new, !dbg !1402

for.body17.i.preheader.new:                       ; preds = %for.body17.i.prol.loopexit
  br label %for.body17.i, !dbg !1402

for.body.i:                                       ; preds = %for.inc12.i, %for.body.lr.ph.i
  %indvars.iv49.i = phi i64 [ 0, %for.body.lr.ph.i ], [ %indvars.iv.next50.i, %for.inc12.i ]
  %15 = trunc i64 %indvars.iv49.i to i32, !dbg !1408
  %conv.i60 = sitofp i32 %15 to double, !dbg !1408
  %mul.i = fmul double %conv.i60, 0x400921FB54442D18, !dbg !1409
  %conv1.i = fptrunc double %mul.i to float, !dbg !1408
  %arrayidx.i = getelementptr inbounds float, float* %5, i64 %indvars.iv49.i, !dbg !1410
  store float %conv1.i, float* %arrayidx.i, align 4, !dbg !1411, !tbaa !732
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !706, metadata !612), !dbg !1412
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !706, metadata !612), !dbg !1412
  br i1 %cmp341.i, label %for.body4.lr.ph.i, label %for.inc12.i, !dbg !1413

for.body4.lr.ph.i:                                ; preds = %for.body.i
  %conv5.i = sitofp i32 %15 to float
  %16 = mul nsw i64 %indvars.iv49.i, %conv10
  br i1 %min.iters.check, label %for.body4.i.preheader, label %min.iters.checked, !dbg !1413

min.iters.checked:                                ; preds = %for.body4.lr.ph.i
  br i1 %cmp.zero, label %for.body4.i.preheader, label %vector.ph, !dbg !1413

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert = insertelement <4 x float> undef, float %conv5.i, i32 0, !dbg !1413
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> undef, <4 x i32> zeroinitializer, !dbg !1413
  br label %vector.body, !dbg !1413

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ], !dbg !1414
  %vec.ind88 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next89, %vector.body ]
  %17 = sitofp <4 x i32> %vec.ind88 to <4 x float>, !dbg !1415
  %18 = fmul <4 x float> %broadcast.splat, %17, !dbg !1416
  %19 = fdiv <4 x float> %18, %broadcast.splat91, !dbg !1417
  %20 = add nsw i64 %index, %16, !dbg !1418
  %21 = getelementptr inbounds float, float* %4, i64 %20, !dbg !1419
  %22 = bitcast float* %21 to <4 x float>*, !dbg !1420
  store <4 x float> %19, <4 x float>* %22, align 4, !dbg !1420, !tbaa !732
  %index.next = add i64 %index, 4, !dbg !1414
  %vec.ind.next89 = add <4 x i32> %vec.ind88, <i32 4, i32 4, i32 4, i32 4>, !dbg !1414
  %23 = icmp eq i64 %index.next, %n.vec, !dbg !1414
  br i1 %23, label %middle.block, label %vector.body, !dbg !1414, !llvm.loop !1421

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.inc12.i, label %for.body4.i.preheader, !dbg !1413

for.body4.i.preheader:                            ; preds = %middle.block, %min.iters.checked, %for.body4.lr.ph.i
  %indvars.iv46.i.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %for.body4.lr.ph.i ], [ %n.vec, %middle.block ]
  br label %for.body4.i, !dbg !1415

for.body4.i:                                      ; preds = %for.body4.i.preheader, %for.body4.i
  %indvars.iv46.i = phi i64 [ %indvars.iv.next47.i, %for.body4.i ], [ %indvars.iv46.i.ph, %for.body4.i.preheader ]
  %24 = trunc i64 %indvars.iv46.i to i32, !dbg !1415
  %conv6.i = sitofp i32 %24 to float, !dbg !1415
  %mul7.i = fmul float %conv5.i, %conv6.i, !dbg !1416
  %div.i = fdiv float %mul7.i, %conv8.i, !dbg !1417
  %25 = add nsw i64 %indvars.iv46.i, %16, !dbg !1418
  %arrayidx11.i = getelementptr inbounds float, float* %4, i64 %25, !dbg !1419
  store float %div.i, float* %arrayidx11.i, align 4, !dbg !1420, !tbaa !732
  %indvars.iv.next47.i = add nuw nsw i64 %indvars.iv46.i, 1, !dbg !1414
  %exitcond.i = icmp eq i64 %indvars.iv.next47.i, %wide.trip.count.i, !dbg !1422
  br i1 %exitcond.i, label %for.inc12.i.loopexit, label %for.body4.i, !dbg !1413, !llvm.loop !1423

for.inc12.i.loopexit:                             ; preds = %for.body4.i
  br label %for.inc12.i, !dbg !1424

for.inc12.i:                                      ; preds = %for.inc12.i.loopexit, %middle.block, %for.body.i
  %indvars.iv.next50.i = add nuw nsw i64 %indvars.iv49.i, 1, !dbg !1424
  %exitcond87 = icmp eq i64 %indvars.iv.next50.i, %conv7, !dbg !1398
  br i1 %exitcond87, label %for.cond15.preheader.i.loopexit, label %for.body.i, !dbg !1399, !llvm.loop !768

for.body17.i:                                     ; preds = %for.body17.i, %for.body17.i.preheader.new
  %indvars.iv.i = phi i64 [ %indvars.iv.i.unr, %for.body17.i.preheader.new ], [ %indvars.iv.next.i.3, %for.body17.i ]
  %26 = trunc i64 %indvars.iv.i to i32, !dbg !1402
  %conv18.i = sitofp i32 %26 to double, !dbg !1402
  %mul19.i = fmul double %conv18.i, 0x400921FB54442D18, !dbg !1403
  %conv20.i = fptrunc double %mul19.i to float, !dbg !1402
  %arrayidx22.i = getelementptr inbounds float, float* %7, i64 %indvars.iv.i, !dbg !1404
  store float %conv20.i, float* %arrayidx22.i, align 4, !dbg !1405, !tbaa !732
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !1406
  %27 = trunc i64 %indvars.iv.next.i to i32, !dbg !1402
  %conv18.i.1 = sitofp i32 %27 to double, !dbg !1402
  %mul19.i.1 = fmul double %conv18.i.1, 0x400921FB54442D18, !dbg !1403
  %conv20.i.1 = fptrunc double %mul19.i.1 to float, !dbg !1402
  %arrayidx22.i.1 = getelementptr inbounds float, float* %7, i64 %indvars.iv.next.i, !dbg !1404
  store float %conv20.i.1, float* %arrayidx22.i.1, align 4, !dbg !1405, !tbaa !732
  %indvars.iv.next.i.1 = add nsw i64 %indvars.iv.i, 2, !dbg !1406
  %28 = trunc i64 %indvars.iv.next.i.1 to i32, !dbg !1402
  %conv18.i.2 = sitofp i32 %28 to double, !dbg !1402
  %mul19.i.2 = fmul double %conv18.i.2, 0x400921FB54442D18, !dbg !1403
  %conv20.i.2 = fptrunc double %mul19.i.2 to float, !dbg !1402
  %arrayidx22.i.2 = getelementptr inbounds float, float* %7, i64 %indvars.iv.next.i.1, !dbg !1404
  store float %conv20.i.2, float* %arrayidx22.i.2, align 4, !dbg !1405, !tbaa !732
  %indvars.iv.next.i.2 = add nsw i64 %indvars.iv.i, 3, !dbg !1406
  %29 = trunc i64 %indvars.iv.next.i.2 to i32, !dbg !1402
  %conv18.i.3 = sitofp i32 %29 to double, !dbg !1402
  %mul19.i.3 = fmul double %conv18.i.3, 0x400921FB54442D18, !dbg !1403
  %conv20.i.3 = fptrunc double %mul19.i.3 to float, !dbg !1402
  %arrayidx22.i.3 = getelementptr inbounds float, float* %7, i64 %indvars.iv.next.i.2, !dbg !1404
  store float %conv20.i.3, float* %arrayidx22.i.3, align 4, !dbg !1405, !tbaa !732
  %indvars.iv.next.i.3 = add nsw i64 %indvars.iv.i, 4, !dbg !1406
  %exitcond86.3 = icmp eq i64 %indvars.iv.next.i.3, %conv10, !dbg !1400
  br i1 %exitcond86.3, label %_Z10init_arrayPfS_S_.exit.loopexit.unr-lcssa, label %for.body17.i, !dbg !1401, !llvm.loop !771

_Z10init_arrayPfS_S_.exit.loopexit.unr-lcssa:     ; preds = %for.body17.i
  br label %_Z10init_arrayPfS_S_.exit.loopexit, !dbg !1425

_Z10init_arrayPfS_S_.exit.loopexit:               ; preds = %for.body17.i.prol.loopexit, %_Z10init_arrayPfS_S_.exit.loopexit.unr-lcssa
  br label %_Z10init_arrayPfS_S_.exit, !dbg !1425

_Z10init_arrayPfS_S_.exit:                        ; preds = %_Z10init_arrayPfS_S_.exit.loopexit, %for.cond15.preheader.i
  %30 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %deviceProp.i, i64 0, i32 0, i64 0, !dbg !1425
  call void @llvm.lifetime.start(i64 632, i8* nonnull %30) #8, !dbg !1425
  tail call void @llvm.dbg.value(metadata %struct.cudaDeviceProp* %deviceProp.i, i64 0, metadata !909, metadata !608), !dbg !1427
  %call.i61 = call i32 @cudaGetDeviceProperties(%struct.cudaDeviceProp* nonnull %deviceProp.i, i32 0), !dbg !1428
  %call1.i = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.2, i64 0, i64 0), i32 0, i8* nonnull %30), !dbg !1429
  %call2.i = call i32 @cudaSetDevice(i32 0), !dbg !1430
  call void @llvm.lifetime.end(i64 632, i8* nonnull %30) #8, !dbg !1431
  call void @_Z8bicgCudaPfS_S_S_S_S_S_(float* %4, float* %5, float* %6, float* %7, float* %8, float* %9, float* %10), !dbg !1432
  %31 = bitcast %struct.timezone* %Tzp.i to i8*, !dbg !1433
  call void @llvm.lifetime.start(i64 8, i8* nonnull %31) #8, !dbg !1433
  %32 = bitcast %struct.timeval* %Tp.i to i8*, !dbg !1435
  call void @llvm.lifetime.start(i64 16, i8* nonnull %32) #8, !dbg !1435
  call void @llvm.dbg.value(metadata %struct.timezone* %Tzp.i, i64 0, metadata !590, metadata !608) #8, !dbg !1436
  call void @llvm.dbg.value(metadata %struct.timeval* %Tp.i, i64 0, metadata !596, metadata !608) #8, !dbg !1437
  %call.i62 = call i32 @gettimeofday(%struct.timeval* nonnull %Tp.i, %struct.timezone* nonnull %Tzp.i) #8, !dbg !1438
  call void @llvm.dbg.value(metadata i32 %call.i62, i64 0, metadata !605, metadata !612) #8, !dbg !1439
  %cmp.i63 = icmp eq i32 %call.i62, 0, !dbg !1440
  br i1 %cmp.i63, label %_Z7rtclockv.exit, label %if.then.i, !dbg !1441

if.then.i:                                        ; preds = %_Z10init_arrayPfS_S_.exit
  %call1.i64 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str, i64 0, i64 0), i32 %call.i62) #8, !dbg !1442
  br label %_Z7rtclockv.exit, !dbg !1442

_Z7rtclockv.exit:                                 ; preds = %_Z10init_arrayPfS_S_.exit, %if.then.i
  %tv_sec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %Tp.i, i64 0, i32 0, !dbg !1443
  %33 = load i64, i64* %tv_sec.i, align 8, !dbg !1443, !tbaa !620
  %conv.i65 = sitofp i64 %33 to double, !dbg !1444
  %tv_usec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %Tp.i, i64 0, i32 1, !dbg !1445
  %34 = load i64, i64* %tv_usec.i, align 8, !dbg !1445, !tbaa !627
  %conv2.i = sitofp i64 %34 to double, !dbg !1446
  %mul.i66 = fmul double %conv2.i, 1.000000e-06, !dbg !1447
  %add.i = fadd double %mul.i66, %conv.i65, !dbg !1448
  call void @llvm.lifetime.end(i64 16, i8* nonnull %32) #8, !dbg !1449
  call void @llvm.lifetime.end(i64 8, i8* nonnull %31) #8, !dbg !1449
  call void @llvm.dbg.value(metadata double %add.i, i64 0, metadata !1336, metadata !612), !dbg !1450
  call void @llvm.dbg.value(metadata float* %4, i64 0, metadata !1045, metadata !612) #8, !dbg !1451
  call void @llvm.dbg.value(metadata float* %5, i64 0, metadata !1046, metadata !612) #8, !dbg !1453
  call void @llvm.dbg.value(metadata float* %6, i64 0, metadata !1047, metadata !612) #8, !dbg !1454
  call void @llvm.dbg.value(metadata float* %7, i64 0, metadata !1048, metadata !612) #8, !dbg !1455
  call void @llvm.dbg.value(metadata float* %8, i64 0, metadata !1049, metadata !612) #8, !dbg !1456
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !1050, metadata !612) #8, !dbg !1457
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !1050, metadata !612) #8, !dbg !1457
  %35 = load i32, i32* @NY, align 4, !dbg !1458, !tbaa !715
  %cmp65.i = icmp sgt i32 %35, 0, !dbg !1459
  br i1 %cmp65.i, label %for.body.lr.ph.i67, label %for.cond1.preheader.i, !dbg !1460

for.body.lr.ph.i67:                               ; preds = %_Z7rtclockv.exit
  %36 = add nsw i32 %35, -1, !dbg !1460
  %37 = zext i32 %36 to i64, !dbg !1460
  %38 = shl nuw nsw i64 %37, 2, !dbg !1460
  %39 = add nuw nsw i64 %38, 4, !dbg !1460
  call void @llvm.memset.p0i8.i64(i8* %call12, i8 0, i64 %39, i32 4, i1 false) #8, !dbg !1461
  br label %for.cond1.preheader.i, !dbg !1457

for.cond1.preheader.i:                            ; preds = %for.body.lr.ph.i67, %_Z7rtclockv.exit
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !1050, metadata !612) #8, !dbg !1457
  %40 = load i32, i32* @NX, align 4, !dbg !1462, !tbaa !715
  %cmp262.i = icmp sgt i32 %40, 0, !dbg !1463
  br i1 %cmp262.i, label %for.body3.lr.ph.i, label %_Z8bicg_cpuPfS_S_S_S_.exit, !dbg !1464

for.body3.lr.ph.i:                                ; preds = %for.cond1.preheader.i
  %41 = sext i32 %35 to i64, !dbg !1464
  %42 = sext i32 %40 to i64, !dbg !1464
  %wide.trip.count.i68 = zext i32 %35 to i64
  %xtraiter = and i64 %wide.trip.count.i68, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %43 = icmp eq i32 %35, 1
  br label %for.body3.i, !dbg !1464

for.body3.i:                                      ; preds = %for.inc34.i, %for.body3.lr.ph.i
  %indvars.iv68.i = phi i64 [ 0, %for.body3.lr.ph.i ], [ %indvars.iv.next69.i, %for.inc34.i ]
  %arrayidx5.i = getelementptr inbounds float, float* %8, i64 %indvars.iv68.i, !dbg !1465
  store float 0.000000e+00, float* %arrayidx5.i, align 4, !dbg !1466, !tbaa !732
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !1051, metadata !612) #8, !dbg !1467
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !1051, metadata !612) #8, !dbg !1467
  br i1 %cmp65.i, label %for.body8.lr.ph.i, label %for.inc34.i, !dbg !1468

for.body8.lr.ph.i:                                ; preds = %for.body3.i
  %arrayidx12.i = getelementptr inbounds float, float* %5, i64 %indvars.iv68.i
  %44 = mul nsw i64 %indvars.iv68.i, %41
  %45 = load float, float* %arrayidx12.i, align 4, !tbaa !732
  br i1 %lcmp.mod, label %for.body8.i.prol.loopexit.unr-lcssa, label %for.body8.i.prol.preheader, !dbg !1468

for.body8.i.prol.preheader:                       ; preds = %for.body8.lr.ph.i
  br label %for.body8.i.prol, !dbg !1468

for.body8.i.prol:                                 ; preds = %for.body8.i.prol.preheader
  %46 = load float, float* %6, align 4, !dbg !1469, !tbaa !732
  %arrayidx14.i.prol = getelementptr inbounds float, float* %4, i64 %44, !dbg !1470
  %47 = load float, float* %arrayidx14.i.prol, align 4, !dbg !1470, !tbaa !732
  %mul15.i.prol = fmul float %45, %47, !dbg !1471
  %add16.i.prol = fadd float %46, %mul15.i.prol, !dbg !1472
  store float %add16.i.prol, float* %6, align 4, !dbg !1473, !tbaa !732
  %48 = load float, float* %7, align 4, !dbg !1474, !tbaa !732
  %mul27.i.prol = fmul float %47, %48, !dbg !1475
  %add28.i.prol = fadd float %mul27.i.prol, 0.000000e+00, !dbg !1476
  br label %for.body8.i.prol.loopexit.unr-lcssa, !dbg !1468

for.body8.i.prol.loopexit.unr-lcssa:              ; preds = %for.body8.lr.ph.i, %for.body8.i.prol
  %add28.i.lcssa.unr.ph = phi float [ %add28.i.prol, %for.body8.i.prol ], [ undef, %for.body8.lr.ph.i ]
  %add28.i85.unr.ph = phi float [ %add28.i.prol, %for.body8.i.prol ], [ 0.000000e+00, %for.body8.lr.ph.i ]
  %indvars.iv.i69.unr.ph = phi i64 [ 1, %for.body8.i.prol ], [ 0, %for.body8.lr.ph.i ]
  br label %for.body8.i.prol.loopexit, !dbg !1468

for.body8.i.prol.loopexit:                        ; preds = %for.body8.i.prol.loopexit.unr-lcssa
  br i1 %43, label %for.inc34.i.loopexit, label %for.body8.lr.ph.i.new, !dbg !1468

for.body8.lr.ph.i.new:                            ; preds = %for.body8.i.prol.loopexit
  br label %for.body8.i, !dbg !1468

for.body8.i:                                      ; preds = %for.body8.i, %for.body8.lr.ph.i.new
  %add28.i85 = phi float [ %add28.i85.unr.ph, %for.body8.lr.ph.i.new ], [ %add28.i.1, %for.body8.i ], !dbg !1469
  %indvars.iv.i69 = phi i64 [ %indvars.iv.i69.unr.ph, %for.body8.lr.ph.i.new ], [ %indvars.iv.next.i70.1, %for.body8.i ]
  %arrayidx10.i = getelementptr inbounds float, float* %6, i64 %indvars.iv.i69, !dbg !1469
  %49 = load float, float* %arrayidx10.i, align 4, !dbg !1469, !tbaa !732
  %50 = add nsw i64 %indvars.iv.i69, %44, !dbg !1477
  %arrayidx14.i = getelementptr inbounds float, float* %4, i64 %50, !dbg !1470
  %51 = load float, float* %arrayidx14.i, align 4, !dbg !1470, !tbaa !732
  %mul15.i = fmul float %45, %51, !dbg !1471
  %add16.i = fadd float %49, %mul15.i, !dbg !1472
  store float %add16.i, float* %arrayidx10.i, align 4, !dbg !1473, !tbaa !732
  %arrayidx26.i = getelementptr inbounds float, float* %7, i64 %indvars.iv.i69, !dbg !1474
  %52 = load float, float* %arrayidx26.i, align 4, !dbg !1474, !tbaa !732
  %mul27.i = fmul float %51, %52, !dbg !1475
  %add28.i = fadd float %add28.i85, %mul27.i, !dbg !1476
  %indvars.iv.next.i70 = add nuw nsw i64 %indvars.iv.i69, 1, !dbg !1478
  %arrayidx10.i.1 = getelementptr inbounds float, float* %6, i64 %indvars.iv.next.i70, !dbg !1469
  %53 = load float, float* %arrayidx10.i.1, align 4, !dbg !1469, !tbaa !732
  %54 = add nsw i64 %indvars.iv.next.i70, %44, !dbg !1477
  %arrayidx14.i.1 = getelementptr inbounds float, float* %4, i64 %54, !dbg !1470
  %55 = load float, float* %arrayidx14.i.1, align 4, !dbg !1470, !tbaa !732
  %mul15.i.1 = fmul float %45, %55, !dbg !1471
  %add16.i.1 = fadd float %53, %mul15.i.1, !dbg !1472
  store float %add16.i.1, float* %arrayidx10.i.1, align 4, !dbg !1473, !tbaa !732
  %arrayidx26.i.1 = getelementptr inbounds float, float* %7, i64 %indvars.iv.next.i70, !dbg !1474
  %56 = load float, float* %arrayidx26.i.1, align 4, !dbg !1474, !tbaa !732
  %mul27.i.1 = fmul float %55, %56, !dbg !1475
  %add28.i.1 = fadd float %add28.i, %mul27.i.1, !dbg !1476
  %indvars.iv.next.i70.1 = add nsw i64 %indvars.iv.i69, 2, !dbg !1478
  %exitcond.i71.1 = icmp eq i64 %indvars.iv.next.i70.1, %wide.trip.count.i68, !dbg !1479
  br i1 %exitcond.i71.1, label %for.inc34.i.loopexit.unr-lcssa, label %for.body8.i, !dbg !1468, !llvm.loop !1100

for.inc34.i.loopexit.unr-lcssa:                   ; preds = %for.body8.i
  br label %for.inc34.i.loopexit, !dbg !1480

for.inc34.i.loopexit:                             ; preds = %for.body8.i.prol.loopexit, %for.inc34.i.loopexit.unr-lcssa
  %add28.i.lcssa = phi float [ %add28.i.lcssa.unr.ph, %for.body8.i.prol.loopexit ], [ %add28.i.1, %for.inc34.i.loopexit.unr-lcssa ]
  store float %add28.i.lcssa, float* %arrayidx5.i, align 4, !dbg !1480, !tbaa !732
  br label %for.inc34.i, !dbg !1481

for.inc34.i:                                      ; preds = %for.inc34.i.loopexit, %for.body3.i
  %indvars.iv.next69.i = add nuw nsw i64 %indvars.iv68.i, 1, !dbg !1481
  %exitcond = icmp eq i64 %indvars.iv.next69.i, %42, !dbg !1463
  br i1 %exitcond, label %_Z8bicg_cpuPfS_S_S_S_.exit.loopexit, label %for.body3.i, !dbg !1464, !llvm.loop !1105

_Z8bicg_cpuPfS_S_S_S_.exit.loopexit:              ; preds = %for.inc34.i
  br label %_Z8bicg_cpuPfS_S_S_S_.exit, !dbg !1482

_Z8bicg_cpuPfS_S_S_S_.exit:                       ; preds = %_Z8bicg_cpuPfS_S_S_S_.exit.loopexit, %for.cond1.preheader.i
  %57 = bitcast %struct.timezone* %Tzp.i72 to i8*, !dbg !1482
  call void @llvm.lifetime.start(i64 8, i8* nonnull %57) #8, !dbg !1482
  %58 = bitcast %struct.timeval* %Tp.i73 to i8*, !dbg !1484
  call void @llvm.lifetime.start(i64 16, i8* nonnull %58) #8, !dbg !1484
  call void @llvm.dbg.value(metadata %struct.timezone* %Tzp.i72, i64 0, metadata !590, metadata !608) #8, !dbg !1485
  call void @llvm.dbg.value(metadata %struct.timeval* %Tp.i73, i64 0, metadata !596, metadata !608) #8, !dbg !1486
  %call.i74 = call i32 @gettimeofday(%struct.timeval* nonnull %Tp.i73, %struct.timezone* nonnull %Tzp.i72) #8, !dbg !1487
  call void @llvm.dbg.value(metadata i32 %call.i74, i64 0, metadata !605, metadata !612) #8, !dbg !1488
  %cmp.i75 = icmp eq i32 %call.i74, 0, !dbg !1489
  br i1 %cmp.i75, label %_Z7rtclockv.exit84, label %if.then.i77, !dbg !1490

if.then.i77:                                      ; preds = %_Z8bicg_cpuPfS_S_S_S_.exit
  %call1.i76 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str, i64 0, i64 0), i32 %call.i74) #8, !dbg !1491
  br label %_Z7rtclockv.exit84, !dbg !1491

_Z7rtclockv.exit84:                               ; preds = %_Z8bicg_cpuPfS_S_S_S_.exit, %if.then.i77
  %tv_sec.i78 = getelementptr inbounds %struct.timeval, %struct.timeval* %Tp.i73, i64 0, i32 0, !dbg !1492
  %59 = load i64, i64* %tv_sec.i78, align 8, !dbg !1492, !tbaa !620
  %conv.i79 = sitofp i64 %59 to double, !dbg !1493
  %tv_usec.i80 = getelementptr inbounds %struct.timeval, %struct.timeval* %Tp.i73, i64 0, i32 1, !dbg !1494
  %60 = load i64, i64* %tv_usec.i80, align 8, !dbg !1494, !tbaa !627
  %conv2.i81 = sitofp i64 %60 to double, !dbg !1495
  %mul.i82 = fmul double %conv2.i81, 1.000000e-06, !dbg !1496
  %add.i83 = fadd double %mul.i82, %conv.i79, !dbg !1497
  call void @llvm.lifetime.end(i64 16, i8* nonnull %58) #8, !dbg !1498
  call void @llvm.lifetime.end(i64 8, i8* nonnull %57) #8, !dbg !1498
  call void @llvm.dbg.value(metadata double %add.i83, i64 0, metadata !1337, metadata !612), !dbg !1499
  %61 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !1500, !tbaa !999
  %sub = fsub double %add.i83, %add.i, !dbg !1501
  %call27 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %61, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.9, i64 0, i64 0), double %sub), !dbg !1502
  call void @_Z14compareResultsPfS_S_S_(float* %6, float* %9, float* %8, float* %10), !dbg !1503
  call void @free(i8* %call6) #8, !dbg !1504
  call void @free(i8* %call9) #8, !dbg !1505
  call void @free(i8* %call12) #8, !dbg !1506
  call void @free(i8* %call15) #8, !dbg !1507
  call void @free(i8* %call18) #8, !dbg !1508
  call void @free(i8* %call21) #8, !dbg !1509
  call void @free(i8* %call24) #8, !dbg !1510
  br label %cleanup

cleanup:                                          ; preds = %_Z7rtclockv.exit84, %if.then
  %retval.0 = phi i32 [ 1, %if.then ], [ 0, %_Z7rtclockv.exit84 ]
  ret i32 %retval.0, !dbg !1511
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) local_unnamed_addr #2

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) local_unnamed_addr #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #7

; Function Attrs: nounwind readnone
declare float @llvm.ceil.f32(float) #7

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #8

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #1

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

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!582, !583}
!llvm.ident = !{!584}

!0 = !DIGlobalVariableExpression(var: !1)
!1 = distinct !DIGlobalVariable(name: "NX", scope: !2, file: !3, line: 27, type: !22, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !3, producer: "clang version 5.0.0 (trunk 294196)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !13, globals: !26, imports: !29)
!3 = !DIFile(filename: "bicg.cu", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/bicgllvm")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaMemcpyKind", file: !6, line: 796, size: 32, elements: !7, identifier: "_ZTS14cudaMemcpyKind")
!6 = !DIFile(filename: "/usr/local/cuda/include/driver_types.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/bicgllvm")
!7 = !{!8, !9, !10, !11, !12}
!8 = !DIEnumerator(name: "cudaMemcpyHostToHost", value: 0)
!9 = !DIEnumerator(name: "cudaMemcpyHostToDevice", value: 1)
!10 = !DIEnumerator(name: "cudaMemcpyDeviceToHost", value: 2)
!11 = !DIEnumerator(name: "cudaMemcpyDeviceToDevice", value: 3)
!12 = !DIEnumerator(name: "cudaMemcpyDefault", value: 4)
!13 = !{!14, !16, !18, !15, !21, !22, !23}
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "DATA_TYPE", file: !3, line: 42, baseType: !15)
!15 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !19, line: 62, baseType: !20)
!19 = !DIFile(filename: "/home/dshen/llvm/build/bin/../lib/clang/5.0.0/include/stddef.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/bicgllvm")
!20 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!26 = !{!0, !27}
!27 = !DIGlobalVariableExpression(var: !28)
!28 = distinct !DIGlobalVariable(name: "NY", scope: !2, file: !3, line: 28, type: !22, isLocal: false, isDefinition: true)
!29 = !{!30, !37, !41, !43, !45, !47, !49, !53, !55, !57, !59, !61, !63, !65, !67, !69, !71, !73, !75, !77, !79, !81, !85, !87, !89, !91, !95, !100, !102, !104, !109, !113, !115, !117, !119, !121, !123, !125, !127, !129, !134, !138, !140, !142, !146, !148, !150, !152, !154, !156, !160, !162, !164, !169, !176, !180, !182, !184, !188, !190, !192, !196, !198, !200, !204, !206, !208, !210, !212, !214, !216, !218, !220, !222, !227, !229, !231, !235, !237, !239, !241, !243, !245, !247, !249, !253, !257, !259, !261, !266, !268, !270, !272, !274, !276, !278, !282, !288, !292, !296, !301, !304, !310, !314, !325, !329, !333, !337, !341, !345, !347, !351, !355, !359, !367, !371, !375, !379, !383, !388, !393, !397, !401, !403, !411, !415, !423, !425, !427, !431, !435, !439, !444, !448, !453, !454, !455, !456, !459, !460, !461, !462, !463, !464, !465, !468, !470, !472, !474, !476, !478, !480, !482, !485, !487, !489, !491, !493, !495, !497, !499, !501, !503, !505, !507, !509, !511, !513, !515, !517, !519, !521, !523, !525, !527, !529, !531, !533, !535, !537, !539, !541, !543, !545, !547, !549, !553, !554, !556, !558, !560, !562, !564, !566, !568, !570, !572, !574, !576, !578, !580}
!30 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !33, line: 201)
!31 = !DINamespace(name: "std", scope: null, file: !32, line: 195)
!32 = !DIFile(filename: "/home/dshen/llvm/build/bin/../lib/clang/5.0.0/include/__clang_cuda_math_forward_declares.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/bicgllvm")
!33 = !DISubprogram(name: "abs", linkageName: "_ZL3absx", scope: !32, file: !32, line: 44, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!34 = !DISubroutineType(types: !35)
!35 = !{!36, !36}
!36 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!37 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !38, line: 202)
!38 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !32, file: !32, line: 46, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!39 = !DISubroutineType(types: !40)
!40 = !{!15, !15}
!41 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !42, line: 203)
!42 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !32, file: !32, line: 48, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!43 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !44, line: 204)
!44 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !32, file: !32, line: 50, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!45 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !46, line: 205)
!46 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !32, file: !32, line: 52, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!47 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !48, line: 206)
!48 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !32, file: !32, line: 56, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!49 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !50, line: 207)
!50 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !32, file: !32, line: 54, type: !51, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!51 = !DISubroutineType(types: !52)
!52 = !{!15, !15, !15}
!53 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !54, line: 208)
!54 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !32, file: !32, line: 58, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!55 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !56, line: 209)
!56 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !32, file: !32, line: 60, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!57 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !58, line: 210)
!58 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !32, file: !32, line: 62, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!59 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !60, line: 211)
!60 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !32, file: !32, line: 64, type: !51, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!61 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !62, line: 212)
!62 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !32, file: !32, line: 66, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!63 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !64, line: 213)
!64 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !32, file: !32, line: 68, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!65 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !66, line: 214)
!66 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !32, file: !32, line: 72, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!67 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !68, line: 215)
!68 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !32, file: !32, line: 70, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!69 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !70, line: 216)
!70 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !32, file: !32, line: 76, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!71 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !72, line: 217)
!72 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !32, file: !32, line: 74, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!73 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !74, line: 218)
!74 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !32, file: !32, line: 78, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!75 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !76, line: 219)
!76 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !32, file: !32, line: 80, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!77 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !78, line: 220)
!78 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !32, file: !32, line: 82, type: !51, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!79 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !80, line: 221)
!80 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !32, file: !32, line: 84, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!81 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !82, line: 222)
!82 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !32, file: !32, line: 86, type: !83, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!83 = !DISubroutineType(types: !84)
!84 = !{!15, !15, !15, !15}
!85 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !86, line: 223)
!86 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !32, file: !32, line: 88, type: !51, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!87 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !88, line: 224)
!88 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !32, file: !32, line: 90, type: !51, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!89 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !90, line: 225)
!90 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !32, file: !32, line: 92, type: !51, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!91 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !92, line: 226)
!92 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !32, file: !32, line: 94, type: !93, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!93 = !DISubroutineType(types: !94)
!94 = !{!22, !15}
!95 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !96, line: 227)
!96 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !32, file: !32, line: 96, type: !97, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!97 = !DISubroutineType(types: !98)
!98 = !{!15, !15, !99}
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!100 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !101, line: 228)
!101 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !32, file: !32, line: 98, type: !51, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!102 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !103, line: 229)
!103 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !32, file: !32, line: 100, type: !93, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!104 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !105, line: 230)
!105 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !32, file: !32, line: 102, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!106 = !DISubroutineType(types: !107)
!107 = !{!108, !15}
!108 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!109 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !110, line: 231)
!110 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !32, file: !32, line: 106, type: !111, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!111 = !DISubroutineType(types: !112)
!112 = !{!108, !15, !15}
!113 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !114, line: 232)
!114 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !32, file: !32, line: 105, type: !111, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!115 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !116, line: 233)
!116 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !32, file: !32, line: 108, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!117 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !118, line: 234)
!118 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !32, file: !32, line: 112, type: !111, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !120, line: 235)
!120 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !32, file: !32, line: 111, type: !111, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !122, line: 236)
!122 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !32, file: !32, line: 114, type: !111, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !124, line: 237)
!124 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !32, file: !32, line: 116, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!125 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !126, line: 238)
!126 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !32, file: !32, line: 118, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !128, line: 239)
!128 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !32, file: !32, line: 120, type: !111, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!129 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !130, line: 240)
!130 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !32, file: !32, line: 121, type: !131, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!131 = !DISubroutineType(types: !132)
!132 = !{!133, !133}
!133 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!134 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !135, line: 241)
!135 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !32, file: !32, line: 123, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!136 = !DISubroutineType(types: !137)
!137 = !{!15, !15, !22}
!138 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !139, line: 242)
!139 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !32, file: !32, line: 125, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!140 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !141, line: 243)
!141 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !32, file: !32, line: 126, type: !34, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!142 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !143, line: 244)
!143 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !32, file: !32, line: 128, type: !144, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!144 = !DISubroutineType(types: !145)
!145 = !{!36, !15}
!146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !147, line: 245)
!147 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !32, file: !32, line: 138, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!148 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !149, line: 246)
!149 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !32, file: !32, line: 130, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!150 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !151, line: 247)
!151 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !32, file: !32, line: 132, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !153, line: 248)
!153 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !32, file: !32, line: 134, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!154 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !155, line: 249)
!155 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !32, file: !32, line: 136, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !157, line: 250)
!157 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !32, file: !32, line: 140, type: !158, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!158 = !DISubroutineType(types: !159)
!159 = !{!133, !15}
!160 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !161, line: 251)
!161 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !32, file: !32, line: 142, type: !158, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!162 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !163, line: 252)
!163 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !32, file: !32, line: 143, type: !144, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!164 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !165, line: 253)
!165 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !32, file: !32, line: 145, type: !166, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!166 = !DISubroutineType(types: !167)
!167 = !{!15, !15, !168}
!168 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!169 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !170, line: 254)
!170 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !32, file: !32, line: 146, type: !171, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!171 = !DISubroutineType(types: !172)
!172 = !{!173, !174}
!173 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!174 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !175, size: 64)
!175 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !25)
!176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !177, line: 255)
!177 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !32, file: !32, line: 147, type: !178, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!178 = !DISubroutineType(types: !179)
!179 = !{!15, !174}
!180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !181, line: 256)
!181 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !32, file: !32, line: 149, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !183, line: 257)
!183 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !32, file: !32, line: 151, type: !51, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !185, line: 258)
!185 = !DISubprogram(name: "nexttoward", linkageName: "_ZL10nexttowardfd", scope: !32, file: !32, line: 153, type: !186, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!186 = !DISubroutineType(types: !187)
!187 = !{!15, !15, !173}
!188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !189, line: 259)
!189 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !32, file: !32, line: 158, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !191, line: 260)
!191 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !32, file: !32, line: 160, type: !51, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !193, line: 261)
!193 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !32, file: !32, line: 162, type: !194, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!194 = !DISubroutineType(types: !195)
!195 = !{!15, !15, !15, !99}
!196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !197, line: 262)
!197 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !32, file: !32, line: 164, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !199, line: 263)
!199 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !32, file: !32, line: 166, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !201, line: 264)
!201 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !32, file: !32, line: 168, type: !202, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!202 = !DISubroutineType(types: !203)
!203 = !{!15, !15, !133}
!204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !205, line: 265)
!205 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !32, file: !32, line: 170, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!206 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !207, line: 266)
!207 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !32, file: !32, line: 172, type: !106, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !209, line: 267)
!209 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !32, file: !32, line: 174, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !211, line: 268)
!211 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !32, file: !32, line: 176, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !213, line: 269)
!213 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !32, file: !32, line: 178, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !215, line: 270)
!215 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !32, file: !32, line: 180, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !217, line: 271)
!217 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !32, file: !32, line: 182, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !219, line: 272)
!219 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !32, file: !32, line: 184, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !221, line: 273)
!221 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !32, file: !32, line: 186, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !223, line: 102)
!223 = !DISubprogram(name: "acos", scope: !224, file: !224, line: 54, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!224 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/bicgllvm")
!225 = !DISubroutineType(types: !226)
!226 = !{!173, !173}
!227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !228, line: 121)
!228 = !DISubprogram(name: "asin", scope: !224, file: !224, line: 56, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!229 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !230, line: 140)
!230 = !DISubprogram(name: "atan", scope: !224, file: !224, line: 58, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!231 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !232, line: 159)
!232 = !DISubprogram(name: "atan2", scope: !224, file: !224, line: 60, type: !233, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!233 = !DISubroutineType(types: !234)
!234 = !{!173, !173, !173}
!235 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !236, line: 180)
!236 = !DISubprogram(name: "ceil", scope: !224, file: !224, line: 178, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!237 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !238, line: 199)
!238 = !DISubprogram(name: "cos", scope: !224, file: !224, line: 63, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!239 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !240, line: 218)
!240 = !DISubprogram(name: "cosh", scope: !224, file: !224, line: 72, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!241 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !242, line: 237)
!242 = !DISubprogram(name: "exp", scope: !224, file: !224, line: 100, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!243 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !244, line: 256)
!244 = !DISubprogram(name: "fabs", scope: !224, file: !224, line: 181, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!245 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !246, line: 275)
!246 = !DISubprogram(name: "floor", scope: !224, file: !224, line: 184, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !248, line: 294)
!248 = !DISubprogram(name: "fmod", scope: !224, file: !224, line: 187, type: !233, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!249 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !250, line: 315)
!250 = !DISubprogram(name: "frexp", scope: !224, file: !224, line: 103, type: !251, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!251 = !DISubroutineType(types: !252)
!252 = !{!173, !173, !99}
!253 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !254, line: 334)
!254 = !DISubprogram(name: "ldexp", scope: !224, file: !224, line: 106, type: !255, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!255 = !DISubroutineType(types: !256)
!256 = !{!173, !173, !22}
!257 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !258, line: 353)
!258 = !DISubprogram(name: "log", scope: !224, file: !224, line: 109, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!259 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !260, line: 372)
!260 = !DISubprogram(name: "log10", scope: !224, file: !224, line: 112, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !262, line: 391)
!262 = !DISubprogram(name: "modf", scope: !224, file: !224, line: 115, type: !263, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!263 = !DISubroutineType(types: !264)
!264 = !{!173, !173, !265}
!265 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !173, size: 64)
!266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !267, line: 403)
!267 = !DISubprogram(name: "pow", scope: !224, file: !224, line: 153, type: !233, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !269, line: 440)
!269 = !DISubprogram(name: "sin", scope: !224, file: !224, line: 65, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!270 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !271, line: 459)
!271 = !DISubprogram(name: "sinh", scope: !224, file: !224, line: 74, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!272 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !273, line: 478)
!273 = !DISubprogram(name: "sqrt", scope: !224, file: !224, line: 156, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!274 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !275, line: 497)
!275 = !DISubprogram(name: "tan", scope: !224, file: !224, line: 67, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!276 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !277, line: 516)
!277 = !DISubprogram(name: "tanh", scope: !224, file: !224, line: 76, type: !225, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !279, line: 118)
!279 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !280, line: 101, baseType: !281)
!280 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/bicgllvm")
!281 = !DICompositeType(tag: DW_TAG_structure_type, file: !280, line: 97, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !283, line: 119)
!283 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !280, line: 109, baseType: !284)
!284 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !280, line: 105, size: 128, elements: !285, identifier: "_ZTS6ldiv_t")
!285 = !{!286, !287}
!286 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !284, file: !280, line: 107, baseType: !133, size: 64)
!287 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !284, file: !280, line: 108, baseType: !133, size: 64, offset: 64)
!288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !289, line: 121)
!289 = !DISubprogram(name: "abort", scope: !280, file: !280, line: 515, type: !290, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: true)
!290 = !DISubroutineType(types: !291)
!291 = !{null}
!292 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !293, line: 122)
!293 = !DISubprogram(name: "abs", scope: !280, file: !280, line: 775, type: !294, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!294 = !DISubroutineType(types: !295)
!295 = !{!22, !22}
!296 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !297, line: 123)
!297 = !DISubprogram(name: "atexit", scope: !280, file: !280, line: 519, type: !298, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!298 = !DISubroutineType(types: !299)
!299 = !{!22, !300}
!300 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !290, size: 64)
!301 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !302, line: 129)
!302 = !DISubprogram(name: "atof", scope: !303, file: !303, line: 26, type: !171, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!303 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/bicgllvm")
!304 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !305, line: 130)
!305 = distinct !DISubprogram(name: "atoi", scope: !280, file: !280, line: 278, type: !306, isLocal: false, isDefinition: true, scopeLine: 279, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !308)
!306 = !DISubroutineType(types: !307)
!307 = !{!22, !174}
!308 = !{!309}
!309 = !DILocalVariable(name: "__nptr", arg: 1, scope: !305, file: !280, line: 278, type: !174)
!310 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !311, line: 131)
!311 = !DISubprogram(name: "atol", scope: !280, file: !280, line: 283, type: !312, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!312 = !DISubroutineType(types: !313)
!313 = !{!133, !174}
!314 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !315, line: 132)
!315 = !DISubprogram(name: "bsearch", scope: !316, file: !316, line: 20, type: !317, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!316 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdlib-bsearch.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/bicgllvm")
!317 = !DISubroutineType(types: !318)
!318 = !{!17, !319, !319, !18, !18, !321}
!319 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !320, size: 64)
!320 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!321 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !280, line: 742, baseType: !322)
!322 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !323, size: 64)
!323 = !DISubroutineType(types: !324)
!324 = !{!22, !319, !319}
!325 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !326, line: 133)
!326 = !DISubprogram(name: "calloc", scope: !280, file: !280, line: 468, type: !327, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!327 = !DISubroutineType(types: !328)
!328 = !{!17, !18, !18}
!329 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !330, line: 134)
!330 = !DISubprogram(name: "div", scope: !280, file: !280, line: 789, type: !331, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!331 = !DISubroutineType(types: !332)
!332 = !{!279, !22, !22}
!333 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !334, line: 135)
!334 = !DISubprogram(name: "exit", scope: !280, file: !280, line: 543, type: !335, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: true)
!335 = !DISubroutineType(types: !336)
!336 = !{null, !22}
!337 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !338, line: 136)
!338 = !DISubprogram(name: "free", scope: !280, file: !280, line: 483, type: !339, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!339 = !DISubroutineType(types: !340)
!340 = !{null, !17}
!341 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !342, line: 137)
!342 = !DISubprogram(name: "getenv", scope: !280, file: !280, line: 564, type: !343, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!343 = !DISubroutineType(types: !344)
!344 = !{!24, !174}
!345 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !346, line: 138)
!346 = !DISubprogram(name: "labs", scope: !280, file: !280, line: 776, type: !131, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!347 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !348, line: 139)
!348 = !DISubprogram(name: "ldiv", scope: !280, file: !280, line: 791, type: !349, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!349 = !DISubroutineType(types: !350)
!350 = !{!283, !133, !133}
!351 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !352, line: 140)
!352 = !DISubprogram(name: "malloc", scope: !280, file: !280, line: 466, type: !353, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!353 = !DISubroutineType(types: !354)
!354 = !{!17, !18}
!355 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !356, line: 142)
!356 = !DISubprogram(name: "mblen", scope: !280, file: !280, line: 863, type: !357, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!357 = !DISubroutineType(types: !358)
!358 = !{!22, !174, !18}
!359 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !360, line: 143)
!360 = !DISubprogram(name: "mbstowcs", scope: !280, file: !280, line: 874, type: !361, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!361 = !DISubroutineType(types: !362)
!362 = !{!18, !363, !366, !18}
!363 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !364)
!364 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !365, size: 64)
!365 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!366 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !174)
!367 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !368, line: 144)
!368 = !DISubprogram(name: "mbtowc", scope: !280, file: !280, line: 866, type: !369, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!369 = !DISubroutineType(types: !370)
!370 = !{!22, !363, !366, !18}
!371 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !372, line: 146)
!372 = !DISubprogram(name: "qsort", scope: !280, file: !280, line: 765, type: !373, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!373 = !DISubroutineType(types: !374)
!374 = !{null, !17, !18, !18, !321}
!375 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !376, line: 152)
!376 = !DISubprogram(name: "rand", scope: !280, file: !280, line: 374, type: !377, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!377 = !DISubroutineType(types: !378)
!378 = !{!22}
!379 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !380, line: 153)
!380 = !DISubprogram(name: "realloc", scope: !280, file: !280, line: 480, type: !381, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!381 = !DISubroutineType(types: !382)
!382 = !{!17, !17, !18}
!383 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !384, line: 154)
!384 = !DISubprogram(name: "srand", scope: !280, file: !280, line: 376, type: !385, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!385 = !DISubroutineType(types: !386)
!386 = !{null, !387}
!387 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!388 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !389, line: 155)
!389 = !DISubprogram(name: "strtod", scope: !280, file: !280, line: 164, type: !390, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!390 = !DISubroutineType(types: !391)
!391 = !{!173, !366, !392}
!392 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !23)
!393 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !394, line: 156)
!394 = !DISubprogram(name: "strtol", scope: !280, file: !280, line: 183, type: !395, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!395 = !DISubroutineType(types: !396)
!396 = !{!133, !366, !392, !22}
!397 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !398, line: 157)
!398 = !DISubprogram(name: "strtoul", scope: !280, file: !280, line: 187, type: !399, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!399 = !DISubroutineType(types: !400)
!400 = !{!20, !366, !392, !22}
!401 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !402, line: 158)
!402 = !DISubprogram(name: "system", scope: !280, file: !280, line: 717, type: !306, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!403 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !404, line: 160)
!404 = !DISubprogram(name: "wcstombs", scope: !280, file: !280, line: 877, type: !405, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!405 = !DISubroutineType(types: !406)
!406 = !{!18, !407, !408, !18}
!407 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !24)
!408 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !409)
!409 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !410, size: 64)
!410 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !365)
!411 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !412, line: 161)
!412 = !DISubprogram(name: "wctomb", scope: !280, file: !280, line: 870, type: !413, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!413 = !DISubroutineType(types: !414)
!414 = !{!22, !24, !365}
!415 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !416, entity: !418, line: 201)
!416 = !DINamespace(name: "__gnu_cxx", scope: null, file: !417, line: 68)
!417 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/bits/cpp_type_traits.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/bicgllvm")
!418 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !280, line: 121, baseType: !419)
!419 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !280, line: 117, size: 128, elements: !420, identifier: "_ZTS7lldiv_t")
!420 = !{!421, !422}
!421 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !419, file: !280, line: 119, baseType: !36, size: 64)
!422 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !419, file: !280, line: 120, baseType: !36, size: 64, offset: 64)
!423 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !416, entity: !424, line: 207)
!424 = !DISubprogram(name: "_Exit", scope: !280, file: !280, line: 557, type: !335, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: true)
!425 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !416, entity: !426, line: 211)
!426 = !DISubprogram(name: "llabs", scope: !280, file: !280, line: 780, type: !34, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!427 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !416, entity: !428, line: 217)
!428 = !DISubprogram(name: "lldiv", scope: !280, file: !280, line: 797, type: !429, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!429 = !DISubroutineType(types: !430)
!430 = !{!418, !36, !36}
!431 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !416, entity: !432, line: 228)
!432 = !DISubprogram(name: "atoll", scope: !280, file: !280, line: 292, type: !433, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!433 = !DISubroutineType(types: !434)
!434 = !{!36, !174}
!435 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !416, entity: !436, line: 229)
!436 = !DISubprogram(name: "strtoll", scope: !280, file: !280, line: 209, type: !437, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!437 = !DISubroutineType(types: !438)
!438 = !{!36, !366, !392, !22}
!439 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !416, entity: !440, line: 230)
!440 = !DISubprogram(name: "strtoull", scope: !280, file: !280, line: 214, type: !441, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!441 = !DISubroutineType(types: !442)
!442 = !{!443, !366, !392, !22}
!443 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!444 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !416, entity: !445, line: 232)
!445 = !DISubprogram(name: "strtof", scope: !280, file: !280, line: 172, type: !446, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!446 = !DISubroutineType(types: !447)
!447 = !{!15, !366, !392}
!448 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !416, entity: !449, line: 233)
!449 = !DISubprogram(name: "strtold", scope: !280, file: !280, line: 175, type: !450, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!450 = !DISubroutineType(types: !451)
!451 = !{!452, !366, !392}
!452 = !DIBasicType(name: "long double", size: 128, encoding: DW_ATE_float)
!453 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !418, line: 241)
!454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !424, line: 243)
!455 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !426, line: 245)
!456 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !457, line: 246)
!457 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !416, file: !458, line: 214, type: !429, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!458 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/cstdlib", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/bicgllvm")
!459 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !428, line: 247)
!460 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !432, line: 249)
!461 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !445, line: 250)
!462 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !436, line: 251)
!463 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !440, line: 252)
!464 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !449, line: 253)
!465 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !466, line: 418)
!466 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !467, file: !467, line: 1126, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!467 = !DIFile(filename: "/usr/local/cuda/include/math_functions.hpp", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/bicgllvm")
!468 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !469, line: 419)
!469 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !467, file: !467, line: 1154, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!470 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !471, line: 420)
!471 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !467, file: !467, line: 1121, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!472 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !473, line: 421)
!473 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !467, file: !467, line: 1159, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!474 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !475, line: 422)
!475 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !467, file: !467, line: 1111, type: !51, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!476 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !477, line: 423)
!477 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !467, file: !467, line: 1116, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!478 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !479, line: 424)
!479 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !467, file: !467, line: 1164, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !481, line: 425)
!481 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !467, file: !467, line: 1199, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!482 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !483, line: 426)
!483 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !484, file: !484, line: 647, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!484 = !DIFile(filename: "/usr/local/cuda/include/device_functions.hpp", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/bicgllvm")
!485 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !486, line: 427)
!486 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !467, file: !467, line: 973, type: !51, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!487 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !488, line: 428)
!488 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !467, file: !467, line: 1027, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!489 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !490, line: 429)
!490 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !467, file: !467, line: 1096, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!491 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !492, line: 430)
!492 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !467, file: !467, line: 1259, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!493 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !494, line: 431)
!494 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !467, file: !467, line: 1249, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!495 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !496, line: 432)
!496 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !484, file: !484, line: 637, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!497 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !498, line: 433)
!498 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !467, file: !467, line: 1078, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!499 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !500, line: 434)
!500 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !467, file: !467, line: 1169, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!501 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !502, line: 435)
!502 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !484, file: !484, line: 582, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!503 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !504, line: 436)
!504 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !467, file: !467, line: 1385, type: !51, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!505 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !506, line: 437)
!506 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !484, file: !484, line: 572, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!507 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !508, line: 438)
!508 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !467, file: !467, line: 1337, type: !83, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!509 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !510, line: 439)
!510 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !484, file: !484, line: 602, type: !51, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!511 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !512, line: 440)
!512 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !484, file: !484, line: 597, type: !51, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!513 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !514, line: 441)
!514 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !467, file: !467, line: 1322, type: !51, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!515 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !516, line: 442)
!516 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !467, file: !467, line: 1312, type: !97, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!517 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !518, line: 443)
!518 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !467, file: !467, line: 1174, type: !51, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!519 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !520, line: 444)
!520 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !467, file: !467, line: 1390, type: !93, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!521 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !522, line: 445)
!522 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !467, file: !467, line: 1289, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!523 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !524, line: 446)
!524 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !467, file: !467, line: 1284, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!525 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !526, line: 447)
!526 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !467, file: !467, line: 933, type: !144, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!527 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !528, line: 448)
!528 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !467, file: !467, line: 1371, type: !144, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!529 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !530, line: 449)
!530 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !467, file: !467, line: 1140, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!531 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !532, line: 450)
!532 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !467, file: !467, line: 1149, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!533 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !534, line: 451)
!534 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !467, file: !467, line: 1069, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!535 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !536, line: 452)
!536 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !467, file: !467, line: 1395, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!537 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !538, line: 453)
!538 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !467, file: !467, line: 1131, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!539 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !540, line: 454)
!540 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !467, file: !467, line: 924, type: !158, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!541 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !542, line: 455)
!542 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !467, file: !467, line: 1376, type: !158, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!543 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !544, line: 456)
!544 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !467, file: !467, line: 1317, type: !166, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!545 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !546, line: 457)
!546 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !467, file: !467, line: 938, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!547 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !548, line: 458)
!548 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !467, file: !467, line: 1002, type: !51, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!549 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !550, line: 459)
!550 = !DISubprogram(name: "nexttowardf", scope: !224, file: !224, line: 284, type: !551, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!551 = !DISubroutineType(types: !552)
!552 = !{!15, !15, !452}
!553 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !550, line: 460)
!554 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !555, line: 461)
!555 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !467, file: !467, line: 1352, type: !51, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!556 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !557, line: 462)
!557 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !467, file: !467, line: 1327, type: !51, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!558 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !559, line: 463)
!559 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !467, file: !467, line: 1332, type: !194, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!560 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !561, line: 464)
!561 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !467, file: !467, line: 919, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!562 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !563, line: 465)
!563 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !467, file: !467, line: 1366, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!564 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !565, line: 466)
!565 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !467, file: !467, line: 1299, type: !202, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!566 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !567, line: 467)
!567 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !467, file: !467, line: 1294, type: !136, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!568 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !569, line: 468)
!569 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !467, file: !467, line: 1018, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!570 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !571, line: 469)
!571 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !467, file: !467, line: 1101, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!572 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !573, line: 470)
!573 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !484, file: !484, line: 887, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!574 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !575, line: 471)
!575 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !467, file: !467, line: 1060, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!576 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !577, line: 472)
!577 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !467, file: !467, line: 1106, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!578 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !579, line: 473)
!579 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !467, file: !467, line: 1361, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!580 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !31, entity: !581, line: 474)
!581 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !484, file: !484, line: 642, type: !39, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!582 = !{i32 2, !"Dwarf Version", i32 4}
!583 = !{i32 2, !"Debug Info Version", i32 3}
!584 = !{!"clang version 5.0.0 (trunk 294196)"}
!585 = distinct !DISubprogram(name: "rtclock", linkageName: "_Z7rtclockv", scope: !586, file: !586, line: 11, type: !587, isLocal: false, isDefinition: true, scopeLine: 12, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !589)
!586 = !DIFile(filename: "./../../common/polybenchUtilFuncts.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/bicgllvm")
!587 = !DISubroutineType(types: !588)
!588 = !{!173}
!589 = !{!590, !596, !605}
!590 = !DILocalVariable(name: "Tzp", scope: !585, file: !586, line: 13, type: !591)
!591 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timezone", file: !592, line: 55, size: 64, elements: !593, identifier: "_ZTS8timezone")
!592 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/time.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/bicgllvm")
!593 = !{!594, !595}
!594 = !DIDerivedType(tag: DW_TAG_member, name: "tz_minuteswest", scope: !591, file: !592, line: 57, baseType: !22, size: 32)
!595 = !DIDerivedType(tag: DW_TAG_member, name: "tz_dsttime", scope: !591, file: !592, line: 58, baseType: !22, size: 32, offset: 32)
!596 = !DILocalVariable(name: "Tp", scope: !585, file: !586, line: 14, type: !597)
!597 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timeval", file: !598, line: 30, size: 128, elements: !599, identifier: "_ZTS7timeval")
!598 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/time.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/bicgllvm")
!599 = !{!600, !603}
!600 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !597, file: !598, line: 32, baseType: !601, size: 64)
!601 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !602, line: 139, baseType: !133)
!602 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/bicgllvm")
!603 = !DIDerivedType(tag: DW_TAG_member, name: "tv_usec", scope: !597, file: !598, line: 33, baseType: !604, size: 64, offset: 64)
!604 = !DIDerivedType(tag: DW_TAG_typedef, name: "__suseconds_t", file: !602, line: 141, baseType: !133)
!605 = !DILocalVariable(name: "stat", scope: !585, file: !586, line: 15, type: !22)
!606 = !DILocation(line: 13, column: 5, scope: !585)
!607 = !DILocation(line: 14, column: 5, scope: !585)
!608 = !DIExpression(DW_OP_deref)
!609 = !DILocation(line: 13, column: 21, scope: !585)
!610 = !DILocation(line: 14, column: 20, scope: !585)
!611 = !DILocation(line: 16, column: 12, scope: !585)
!612 = !DIExpression()
!613 = !DILocation(line: 15, column: 9, scope: !585)
!614 = !DILocation(line: 17, column: 14, scope: !615)
!615 = distinct !DILexicalBlock(scope: !585, file: !586, line: 17, column: 9)
!616 = !DILocation(line: 17, column: 9, scope: !585)
!617 = !DILocation(line: 17, column: 20, scope: !618)
!618 = !DILexicalBlockFile(scope: !615, file: !586, discriminator: 1)
!619 = !DILocation(line: 18, column: 15, scope: !585)
!620 = !{!621, !622, i64 0}
!621 = !{!"_ZTS7timeval", !622, i64 0, !622, i64 8}
!622 = !{!"long", !623, i64 0}
!623 = !{!"omnipotent char", !624, i64 0}
!624 = !{!"Simple C++ TBAA"}
!625 = !DILocation(line: 18, column: 12, scope: !585)
!626 = !DILocation(line: 18, column: 27, scope: !585)
!627 = !{!621, !622, i64 8}
!628 = !DILocation(line: 18, column: 24, scope: !585)
!629 = !DILocation(line: 18, column: 34, scope: !585)
!630 = !DILocation(line: 18, column: 22, scope: !585)
!631 = !DILocation(line: 19, column: 1, scope: !585)
!632 = !DILocation(line: 18, column: 5, scope: !585)
!633 = distinct !DISubprogram(name: "absVal", linkageName: "_Z6absValf", scope: !586, file: !586, line: 22, type: !39, isLocal: false, isDefinition: true, scopeLine: 23, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !634)
!634 = !{!635}
!635 = !DILocalVariable(name: "a", arg: 1, scope: !633, file: !586, line: 22, type: !15)
!636 = !DILocation(line: 22, column: 20, scope: !633)
!637 = !DILocation(line: 24, column: 7, scope: !638)
!638 = distinct !DILexicalBlock(scope: !633, file: !586, line: 24, column: 5)
!639 = !DILocation(line: 26, column: 13, scope: !640)
!640 = distinct !DILexicalBlock(scope: !638, file: !586, line: 25, column: 2)
!641 = !DILocation(line: 24, column: 5, scope: !633)
!642 = !DILocation(line: 32, column: 1, scope: !633)
!643 = distinct !DISubprogram(name: "percentDiff", linkageName: "_Z11percentDiffdd", scope: !586, file: !586, line: 36, type: !644, isLocal: false, isDefinition: true, scopeLine: 37, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !646)
!644 = !DISubroutineType(types: !645)
!645 = !{!15, !173, !173}
!646 = !{!647, !648}
!647 = !DILocalVariable(name: "val1", arg: 1, scope: !643, file: !586, line: 36, type: !173)
!648 = !DILocalVariable(name: "val2", arg: 2, scope: !643, file: !586, line: 36, type: !173)
!649 = !DILocation(line: 36, column: 26, scope: !643)
!650 = !DILocation(line: 36, column: 39, scope: !643)
!651 = !DILocation(line: 38, column: 14, scope: !652)
!652 = distinct !DILexicalBlock(scope: !643, file: !586, line: 38, column: 6)
!653 = !DILocation(line: 22, column: 20, scope: !633, inlinedAt: !654)
!654 = distinct !DILocation(line: 38, column: 7, scope: !652)
!655 = !DILocation(line: 24, column: 7, scope: !638, inlinedAt: !654)
!656 = !DILocation(line: 26, column: 13, scope: !640, inlinedAt: !654)
!657 = !DILocation(line: 24, column: 5, scope: !633, inlinedAt: !654)
!658 = !DILocation(line: 38, column: 7, scope: !652)
!659 = !DILocation(line: 38, column: 20, scope: !652)
!660 = !DILocation(line: 38, column: 28, scope: !652)
!661 = !DILocation(line: 38, column: 39, scope: !662)
!662 = !DILexicalBlockFile(scope: !652, file: !586, discriminator: 1)
!663 = !DILocation(line: 22, column: 20, scope: !633, inlinedAt: !664)
!664 = distinct !DILocation(line: 38, column: 32, scope: !662)
!665 = !DILocation(line: 24, column: 7, scope: !638, inlinedAt: !664)
!666 = !DILocation(line: 26, column: 13, scope: !640, inlinedAt: !664)
!667 = !DILocation(line: 24, column: 5, scope: !633, inlinedAt: !664)
!668 = !DILocation(line: 38, column: 32, scope: !662)
!669 = !DILocation(line: 38, column: 45, scope: !662)
!670 = !DILocation(line: 38, column: 6, scope: !671)
!671 = !DILexicalBlockFile(scope: !643, file: !586, discriminator: 1)
!672 = !DILocation(line: 45, column: 43, scope: !673)
!673 = distinct !DILexicalBlock(scope: !652, file: !586, line: 44, column: 2)
!674 = !DILocation(line: 45, column: 38, scope: !673)
!675 = !DILocation(line: 22, column: 20, scope: !633, inlinedAt: !676)
!676 = distinct !DILocation(line: 45, column: 31, scope: !673)
!677 = !DILocation(line: 24, column: 7, scope: !638, inlinedAt: !676)
!678 = !DILocation(line: 26, column: 13, scope: !640, inlinedAt: !676)
!679 = !DILocation(line: 24, column: 5, scope: !633, inlinedAt: !676)
!680 = !DILocation(line: 45, column: 65, scope: !673)
!681 = !DILocation(line: 45, column: 60, scope: !673)
!682 = !DILocation(line: 22, column: 20, scope: !633, inlinedAt: !683)
!683 = distinct !DILocation(line: 45, column: 53, scope: !684)
!684 = !DILexicalBlockFile(scope: !673, file: !586, discriminator: 1)
!685 = !DILocation(line: 24, column: 7, scope: !638, inlinedAt: !683)
!686 = !DILocation(line: 26, column: 13, scope: !640, inlinedAt: !683)
!687 = !DILocation(line: 24, column: 5, scope: !633, inlinedAt: !683)
!688 = !DILocation(line: 45, column: 51, scope: !673)
!689 = !DILocation(line: 22, column: 20, scope: !633, inlinedAt: !690)
!690 = distinct !DILocation(line: 45, column: 24, scope: !691)
!691 = !DILexicalBlockFile(scope: !673, file: !586, discriminator: 2)
!692 = !DILocation(line: 24, column: 7, scope: !638, inlinedAt: !690)
!693 = !DILocation(line: 26, column: 13, scope: !640, inlinedAt: !690)
!694 = !DILocation(line: 24, column: 5, scope: !633, inlinedAt: !690)
!695 = !DILocation(line: 45, column: 21, scope: !673)
!696 = !DILocation(line: 45, column: 7, scope: !673)
!697 = !DILocation(line: 47, column: 1, scope: !643)
!698 = distinct !DISubprogram(name: "init_array", linkageName: "_Z10init_arrayPfS_S_", scope: !3, file: !3, line: 46, type: !699, isLocal: false, isDefinition: true, scopeLine: 47, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !701)
!699 = !DISubroutineType(types: !700)
!700 = !{null, !21, !21, !21}
!701 = !{!702, !703, !704, !705, !706}
!702 = !DILocalVariable(name: "A", arg: 1, scope: !698, file: !3, line: 46, type: !21)
!703 = !DILocalVariable(name: "p", arg: 2, scope: !698, file: !3, line: 46, type: !21)
!704 = !DILocalVariable(name: "r", arg: 3, scope: !698, file: !3, line: 46, type: !21)
!705 = !DILocalVariable(name: "i", scope: !698, file: !3, line: 48, type: !22)
!706 = !DILocalVariable(name: "j", scope: !698, file: !3, line: 48, type: !22)
!707 = !DILocation(line: 46, column: 28, scope: !698)
!708 = !DILocation(line: 46, column: 42, scope: !698)
!709 = !DILocation(line: 46, column: 56, scope: !698)
!710 = !DILocation(line: 48, column: 6, scope: !698)
!711 = !DILocation(line: 50, column: 20, scope: !712)
!712 = !DILexicalBlockFile(scope: !713, file: !3, discriminator: 1)
!713 = distinct !DILexicalBlock(scope: !714, file: !3, line: 50, column: 4)
!714 = distinct !DILexicalBlock(scope: !698, file: !3, line: 50, column: 4)
!715 = !{!716, !716, i64 0}
!716 = !{!"int", !623, i64 0}
!717 = !DILocation(line: 50, column: 18, scope: !712)
!718 = !DILocation(line: 50, column: 4, scope: !719)
!719 = !DILexicalBlockFile(scope: !714, file: !3, discriminator: 1)
!720 = !DILocation(line: 60, column: 18, scope: !721)
!721 = !DILexicalBlockFile(scope: !722, file: !3, discriminator: 1)
!722 = distinct !DILexicalBlock(scope: !723, file: !3, line: 60, column: 2)
!723 = distinct !DILexicalBlock(scope: !698, file: !3, line: 60, column: 2)
!724 = !DILocation(line: 60, column: 16, scope: !721)
!725 = !DILocation(line: 60, column: 2, scope: !726)
!726 = !DILexicalBlockFile(scope: !723, file: !3, discriminator: 1)
!727 = !DILocation(line: 62, column: 14, scope: !728)
!728 = distinct !DILexicalBlock(scope: !722, file: !3, line: 61, column: 2)
!729 = !DILocation(line: 62, column: 16, scope: !728)
!730 = !DILocation(line: 62, column: 7, scope: !728)
!731 = !DILocation(line: 62, column: 12, scope: !728)
!732 = !{!733, !733, i64 0}
!733 = !{!"float", !623, i64 0}
!734 = !DILocation(line: 60, column: 23, scope: !735)
!735 = !DILexicalBlockFile(scope: !722, file: !3, discriminator: 2)
!736 = distinct !{!736, !737}
!737 = !{!"llvm.loop.unroll.disable"}
!738 = !DILocation(line: 52, column: 14, scope: !739)
!739 = distinct !DILexicalBlock(scope: !713, file: !3, line: 51, column: 2)
!740 = !DILocation(line: 52, column: 16, scope: !739)
!741 = !DILocation(line: 52, column: 7, scope: !739)
!742 = !DILocation(line: 52, column: 12, scope: !739)
!743 = !DILocation(line: 48, column: 9, scope: !698)
!744 = !DILocation(line: 54, column: 7, scope: !745)
!745 = !DILexicalBlockFile(scope: !746, file: !3, discriminator: 1)
!746 = distinct !DILexicalBlock(scope: !739, file: !3, line: 54, column: 7)
!747 = !DILocation(line: 54, column: 28, scope: !748)
!748 = !DILexicalBlockFile(scope: !749, file: !3, discriminator: 2)
!749 = distinct !DILexicalBlock(scope: !746, file: !3, line: 54, column: 7)
!750 = !DILocation(line: 56, column: 39, scope: !751)
!751 = distinct !DILexicalBlock(scope: !749, file: !3, line: 55, column: 3)
!752 = !DILocation(line: 56, column: 38, scope: !751)
!753 = !DILocation(line: 56, column: 42, scope: !751)
!754 = !DILocation(line: 56, column: 17, scope: !751)
!755 = !DILocation(line: 56, column: 10, scope: !751)
!756 = !DILocation(line: 56, column: 22, scope: !751)
!757 = distinct !{!757, !758, !759, !760, !761}
!758 = !DILocation(line: 54, column: 7, scope: !746)
!759 = !DILocation(line: 57, column: 3, scope: !746)
!760 = !{!"llvm.loop.vectorize.width", i32 1}
!761 = !{!"llvm.loop.interleave.count", i32 1}
!762 = !DILocation(line: 54, column: 21, scope: !763)
!763 = !DILexicalBlockFile(scope: !749, file: !3, discriminator: 1)
!764 = distinct !{!764, !758, !759, !765, !760, !761}
!765 = !{!"llvm.loop.unroll.runtime.disable"}
!766 = !DILocation(line: 50, column: 25, scope: !767)
!767 = !DILexicalBlockFile(scope: !713, file: !3, discriminator: 2)
!768 = distinct !{!768, !769, !770}
!769 = !DILocation(line: 50, column: 4, scope: !714)
!770 = !DILocation(line: 58, column: 3, scope: !714)
!771 = distinct !{!771, !772, !773}
!772 = !DILocation(line: 60, column: 2, scope: !723)
!773 = !DILocation(line: 63, column: 2, scope: !723)
!774 = !DILocation(line: 64, column: 1, scope: !698)
!775 = distinct !DISubprogram(name: "compareResults", linkageName: "_Z14compareResultsPfS_S_S_", scope: !3, file: !3, line: 67, type: !776, isLocal: false, isDefinition: true, scopeLine: 68, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !778)
!776 = !DISubroutineType(types: !777)
!777 = !{null, !21, !21, !21, !21}
!778 = !{!779, !780, !781, !782, !783, !784}
!779 = !DILocalVariable(name: "s", arg: 1, scope: !775, file: !3, line: 67, type: !21)
!780 = !DILocalVariable(name: "s_outputFromGpu", arg: 2, scope: !775, file: !3, line: 67, type: !21)
!781 = !DILocalVariable(name: "q", arg: 3, scope: !775, file: !3, line: 67, type: !21)
!782 = !DILocalVariable(name: "q_outputFromGpu", arg: 4, scope: !775, file: !3, line: 67, type: !21)
!783 = !DILocalVariable(name: "i", scope: !775, file: !3, line: 69, type: !22)
!784 = !DILocalVariable(name: "fail", scope: !775, file: !3, line: 69, type: !22)
!785 = !DILocation(line: 67, column: 32, scope: !775)
!786 = !DILocation(line: 67, column: 46, scope: !775)
!787 = !DILocation(line: 67, column: 74, scope: !775)
!788 = !DILocation(line: 67, column: 88, scope: !775)
!789 = !DILocation(line: 69, column: 8, scope: !775)
!790 = !DILocation(line: 69, column: 6, scope: !775)
!791 = !DILocation(line: 73, column: 14, scope: !792)
!792 = !DILexicalBlockFile(scope: !793, file: !3, discriminator: 1)
!793 = distinct !DILexicalBlock(scope: !794, file: !3, line: 73, column: 2)
!794 = distinct !DILexicalBlock(scope: !775, file: !3, line: 73, column: 2)
!795 = !DILocation(line: 73, column: 13, scope: !792)
!796 = !DILocation(line: 73, column: 2, scope: !797)
!797 = !DILexicalBlockFile(scope: !794, file: !3, discriminator: 1)
!798 = !DILocation(line: 75, column: 19, scope: !799)
!799 = distinct !DILexicalBlock(scope: !800, file: !3, line: 75, column: 7)
!800 = distinct !DILexicalBlock(scope: !793, file: !3, line: 74, column: 2)
!801 = !DILocation(line: 73, column: 19, scope: !802)
!802 = !DILexicalBlockFile(scope: !793, file: !3, discriminator: 2)
!803 = !DILocation(line: 75, column: 25, scope: !799)
!804 = !DILocation(line: 24, column: 7, scope: !638, inlinedAt: !805)
!805 = distinct !DILocation(line: 38, column: 7, scope: !652, inlinedAt: !806)
!806 = distinct !DILocation(line: 75, column: 7, scope: !799)
!807 = !DILocation(line: 26, column: 13, scope: !640, inlinedAt: !805)
!808 = !DILocation(line: 24, column: 5, scope: !633, inlinedAt: !805)
!809 = !DILocation(line: 38, column: 7, scope: !652, inlinedAt: !806)
!810 = !DILocation(line: 38, column: 20, scope: !652, inlinedAt: !806)
!811 = !DILocation(line: 24, column: 7, scope: !638, inlinedAt: !812)
!812 = distinct !DILocation(line: 38, column: 32, scope: !662, inlinedAt: !806)
!813 = !DILocation(line: 26, column: 13, scope: !640, inlinedAt: !812)
!814 = !DILocation(line: 24, column: 5, scope: !633, inlinedAt: !812)
!815 = !DILocation(line: 38, column: 32, scope: !662, inlinedAt: !806)
!816 = !DILocation(line: 38, column: 45, scope: !662, inlinedAt: !806)
!817 = !DILocation(line: 45, column: 38, scope: !673, inlinedAt: !806)
!818 = !DILocation(line: 24, column: 7, scope: !638, inlinedAt: !819)
!819 = distinct !DILocation(line: 45, column: 31, scope: !673, inlinedAt: !806)
!820 = !DILocation(line: 26, column: 13, scope: !640, inlinedAt: !819)
!821 = !DILocation(line: 24, column: 5, scope: !633, inlinedAt: !819)
!822 = !DILocation(line: 45, column: 60, scope: !673, inlinedAt: !806)
!823 = !DILocation(line: 24, column: 7, scope: !638, inlinedAt: !824)
!824 = distinct !DILocation(line: 45, column: 53, scope: !684, inlinedAt: !806)
!825 = !DILocation(line: 26, column: 13, scope: !640, inlinedAt: !824)
!826 = !DILocation(line: 24, column: 5, scope: !633, inlinedAt: !824)
!827 = !DILocation(line: 45, column: 51, scope: !673, inlinedAt: !806)
!828 = !DILocation(line: 24, column: 7, scope: !638, inlinedAt: !829)
!829 = distinct !DILocation(line: 45, column: 24, scope: !691, inlinedAt: !806)
!830 = !DILocation(line: 26, column: 13, scope: !640, inlinedAt: !829)
!831 = !DILocation(line: 24, column: 5, scope: !633, inlinedAt: !829)
!832 = !DILocation(line: 45, column: 21, scope: !673, inlinedAt: !806)
!833 = !DILocation(line: 75, column: 7, scope: !799)
!834 = !DILocation(line: 75, column: 45, scope: !799)
!835 = !DILocation(line: 75, column: 7, scope: !800)
!836 = distinct !{!836, !837, !838, !760, !761}
!837 = !DILocation(line: 73, column: 2, scope: !794)
!838 = !DILocation(line: 79, column: 2, scope: !794)
!839 = !DILocation(line: 81, column: 14, scope: !840)
!840 = !DILexicalBlockFile(scope: !841, file: !3, discriminator: 1)
!841 = distinct !DILexicalBlock(scope: !842, file: !3, line: 81, column: 2)
!842 = distinct !DILexicalBlock(scope: !775, file: !3, line: 81, column: 2)
!843 = !DILocation(line: 81, column: 13, scope: !840)
!844 = !DILocation(line: 81, column: 2, scope: !845)
!845 = !DILexicalBlockFile(scope: !842, file: !3, discriminator: 1)
!846 = !DILocation(line: 83, column: 19, scope: !847)
!847 = distinct !DILexicalBlock(scope: !848, file: !3, line: 83, column: 7)
!848 = distinct !DILexicalBlock(scope: !841, file: !3, line: 82, column: 2)
!849 = !DILocation(line: 81, column: 19, scope: !850)
!850 = !DILexicalBlockFile(scope: !841, file: !3, discriminator: 2)
!851 = !DILocation(line: 83, column: 25, scope: !847)
!852 = !DILocation(line: 24, column: 7, scope: !638, inlinedAt: !853)
!853 = distinct !DILocation(line: 38, column: 7, scope: !652, inlinedAt: !854)
!854 = distinct !DILocation(line: 83, column: 7, scope: !847)
!855 = !DILocation(line: 26, column: 13, scope: !640, inlinedAt: !853)
!856 = !DILocation(line: 24, column: 5, scope: !633, inlinedAt: !853)
!857 = !DILocation(line: 38, column: 7, scope: !652, inlinedAt: !854)
!858 = !DILocation(line: 38, column: 20, scope: !652, inlinedAt: !854)
!859 = !DILocation(line: 24, column: 7, scope: !638, inlinedAt: !860)
!860 = distinct !DILocation(line: 38, column: 32, scope: !662, inlinedAt: !854)
!861 = !DILocation(line: 26, column: 13, scope: !640, inlinedAt: !860)
!862 = !DILocation(line: 24, column: 5, scope: !633, inlinedAt: !860)
!863 = !DILocation(line: 38, column: 32, scope: !662, inlinedAt: !854)
!864 = !DILocation(line: 38, column: 45, scope: !662, inlinedAt: !854)
!865 = !DILocation(line: 45, column: 38, scope: !673, inlinedAt: !854)
!866 = !DILocation(line: 24, column: 7, scope: !638, inlinedAt: !867)
!867 = distinct !DILocation(line: 45, column: 31, scope: !673, inlinedAt: !854)
!868 = !DILocation(line: 26, column: 13, scope: !640, inlinedAt: !867)
!869 = !DILocation(line: 24, column: 5, scope: !633, inlinedAt: !867)
!870 = !DILocation(line: 45, column: 60, scope: !673, inlinedAt: !854)
!871 = !DILocation(line: 24, column: 7, scope: !638, inlinedAt: !872)
!872 = distinct !DILocation(line: 45, column: 53, scope: !684, inlinedAt: !854)
!873 = !DILocation(line: 26, column: 13, scope: !640, inlinedAt: !872)
!874 = !DILocation(line: 24, column: 5, scope: !633, inlinedAt: !872)
!875 = !DILocation(line: 45, column: 51, scope: !673, inlinedAt: !854)
!876 = !DILocation(line: 24, column: 7, scope: !638, inlinedAt: !877)
!877 = distinct !DILocation(line: 45, column: 24, scope: !691, inlinedAt: !854)
!878 = !DILocation(line: 26, column: 13, scope: !640, inlinedAt: !877)
!879 = !DILocation(line: 24, column: 5, scope: !633, inlinedAt: !877)
!880 = !DILocation(line: 45, column: 21, scope: !673, inlinedAt: !854)
!881 = !DILocation(line: 83, column: 7, scope: !847)
!882 = !DILocation(line: 83, column: 45, scope: !847)
!883 = !DILocation(line: 83, column: 7, scope: !848)
!884 = distinct !{!884, !885, !886, !760, !761}
!885 = !DILocation(line: 81, column: 2, scope: !842)
!886 = !DILocation(line: 87, column: 2, scope: !842)
!887 = !DILocation(line: 22, column: 20, scope: !633, inlinedAt: !805)
!888 = !DILocation(line: 38, column: 28, scope: !652, inlinedAt: !806)
!889 = !DILocation(line: 22, column: 20, scope: !633, inlinedAt: !812)
!890 = !DILocation(line: 38, column: 6, scope: !671, inlinedAt: !806)
!891 = !DILocation(line: 22, column: 20, scope: !633, inlinedAt: !819)
!892 = !DILocation(line: 22, column: 20, scope: !633, inlinedAt: !824)
!893 = !DILocation(line: 22, column: 20, scope: !633, inlinedAt: !829)
!894 = !DILocation(line: 45, column: 7, scope: !673, inlinedAt: !806)
!895 = distinct !{!895, !837, !838, !765, !760, !761}
!896 = !DILocation(line: 22, column: 20, scope: !633, inlinedAt: !853)
!897 = !DILocation(line: 38, column: 28, scope: !652, inlinedAt: !854)
!898 = !DILocation(line: 22, column: 20, scope: !633, inlinedAt: !860)
!899 = !DILocation(line: 38, column: 6, scope: !671, inlinedAt: !854)
!900 = !DILocation(line: 22, column: 20, scope: !633, inlinedAt: !867)
!901 = !DILocation(line: 22, column: 20, scope: !633, inlinedAt: !872)
!902 = !DILocation(line: 22, column: 20, scope: !633, inlinedAt: !877)
!903 = !DILocation(line: 45, column: 7, scope: !673, inlinedAt: !854)
!904 = distinct !{!904, !885, !886, !765, !760, !761}
!905 = !DILocation(line: 90, column: 2, scope: !775)
!906 = !DILocation(line: 91, column: 1, scope: !775)
!907 = distinct !DISubprogram(name: "GPU_argv_init", linkageName: "_Z13GPU_argv_initv", scope: !3, file: !3, line: 94, type: !290, isLocal: false, isDefinition: true, scopeLine: 95, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !908)
!908 = !{!909}
!909 = !DILocalVariable(name: "deviceProp", scope: !907, file: !3, line: 96, type: !910)
!910 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "cudaDeviceProp", file: !6, line: 1257, size: 5056, elements: !911, identifier: "_ZTS14cudaDeviceProp")
!911 = !{!912, !916, !917, !918, !919, !920, !921, !922, !926, !927, !928, !929, !930, !931, !932, !933, !934, !935, !936, !937, !938, !939, !940, !941, !942, !946, !947, !948, !949, !950, !951, !952, !953, !954, !955, !956, !957, !958, !959, !960, !961, !962, !963, !964, !965, !966, !967, !968, !969, !970, !971, !972, !973, !974, !975, !976, !977, !978, !979, !980, !981, !982}
!912 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !910, file: !6, line: 1259, baseType: !913, size: 2048)
!913 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 2048, elements: !914)
!914 = !{!915}
!915 = !DISubrange(count: 256)
!916 = !DIDerivedType(tag: DW_TAG_member, name: "totalGlobalMem", scope: !910, file: !6, line: 1260, baseType: !18, size: 64, offset: 2048)
!917 = !DIDerivedType(tag: DW_TAG_member, name: "sharedMemPerBlock", scope: !910, file: !6, line: 1261, baseType: !18, size: 64, offset: 2112)
!918 = !DIDerivedType(tag: DW_TAG_member, name: "regsPerBlock", scope: !910, file: !6, line: 1262, baseType: !22, size: 32, offset: 2176)
!919 = !DIDerivedType(tag: DW_TAG_member, name: "warpSize", scope: !910, file: !6, line: 1263, baseType: !22, size: 32, offset: 2208)
!920 = !DIDerivedType(tag: DW_TAG_member, name: "memPitch", scope: !910, file: !6, line: 1264, baseType: !18, size: 64, offset: 2240)
!921 = !DIDerivedType(tag: DW_TAG_member, name: "maxThreadsPerBlock", scope: !910, file: !6, line: 1265, baseType: !22, size: 32, offset: 2304)
!922 = !DIDerivedType(tag: DW_TAG_member, name: "maxThreadsDim", scope: !910, file: !6, line: 1266, baseType: !923, size: 96, offset: 2336)
!923 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 96, elements: !924)
!924 = !{!925}
!925 = !DISubrange(count: 3)
!926 = !DIDerivedType(tag: DW_TAG_member, name: "maxGridSize", scope: !910, file: !6, line: 1267, baseType: !923, size: 96, offset: 2432)
!927 = !DIDerivedType(tag: DW_TAG_member, name: "clockRate", scope: !910, file: !6, line: 1268, baseType: !22, size: 32, offset: 2528)
!928 = !DIDerivedType(tag: DW_TAG_member, name: "totalConstMem", scope: !910, file: !6, line: 1269, baseType: !18, size: 64, offset: 2560)
!929 = !DIDerivedType(tag: DW_TAG_member, name: "major", scope: !910, file: !6, line: 1270, baseType: !22, size: 32, offset: 2624)
!930 = !DIDerivedType(tag: DW_TAG_member, name: "minor", scope: !910, file: !6, line: 1271, baseType: !22, size: 32, offset: 2656)
!931 = !DIDerivedType(tag: DW_TAG_member, name: "textureAlignment", scope: !910, file: !6, line: 1272, baseType: !18, size: 64, offset: 2688)
!932 = !DIDerivedType(tag: DW_TAG_member, name: "texturePitchAlignment", scope: !910, file: !6, line: 1273, baseType: !18, size: 64, offset: 2752)
!933 = !DIDerivedType(tag: DW_TAG_member, name: "deviceOverlap", scope: !910, file: !6, line: 1274, baseType: !22, size: 32, offset: 2816)
!934 = !DIDerivedType(tag: DW_TAG_member, name: "multiProcessorCount", scope: !910, file: !6, line: 1275, baseType: !22, size: 32, offset: 2848)
!935 = !DIDerivedType(tag: DW_TAG_member, name: "kernelExecTimeoutEnabled", scope: !910, file: !6, line: 1276, baseType: !22, size: 32, offset: 2880)
!936 = !DIDerivedType(tag: DW_TAG_member, name: "integrated", scope: !910, file: !6, line: 1277, baseType: !22, size: 32, offset: 2912)
!937 = !DIDerivedType(tag: DW_TAG_member, name: "canMapHostMemory", scope: !910, file: !6, line: 1278, baseType: !22, size: 32, offset: 2944)
!938 = !DIDerivedType(tag: DW_TAG_member, name: "computeMode", scope: !910, file: !6, line: 1279, baseType: !22, size: 32, offset: 2976)
!939 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture1D", scope: !910, file: !6, line: 1280, baseType: !22, size: 32, offset: 3008)
!940 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture1DMipmap", scope: !910, file: !6, line: 1281, baseType: !22, size: 32, offset: 3040)
!941 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture1DLinear", scope: !910, file: !6, line: 1282, baseType: !22, size: 32, offset: 3072)
!942 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2D", scope: !910, file: !6, line: 1283, baseType: !943, size: 64, offset: 3104)
!943 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 64, elements: !944)
!944 = !{!945}
!945 = !DISubrange(count: 2)
!946 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2DMipmap", scope: !910, file: !6, line: 1284, baseType: !943, size: 64, offset: 3168)
!947 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2DLinear", scope: !910, file: !6, line: 1285, baseType: !923, size: 96, offset: 3232)
!948 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2DGather", scope: !910, file: !6, line: 1286, baseType: !943, size: 64, offset: 3328)
!949 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture3D", scope: !910, file: !6, line: 1287, baseType: !923, size: 96, offset: 3392)
!950 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture3DAlt", scope: !910, file: !6, line: 1288, baseType: !923, size: 96, offset: 3488)
!951 = !DIDerivedType(tag: DW_TAG_member, name: "maxTextureCubemap", scope: !910, file: !6, line: 1289, baseType: !22, size: 32, offset: 3584)
!952 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture1DLayered", scope: !910, file: !6, line: 1290, baseType: !943, size: 64, offset: 3616)
!953 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2DLayered", scope: !910, file: !6, line: 1291, baseType: !923, size: 96, offset: 3680)
!954 = !DIDerivedType(tag: DW_TAG_member, name: "maxTextureCubemapLayered", scope: !910, file: !6, line: 1292, baseType: !943, size: 64, offset: 3776)
!955 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface1D", scope: !910, file: !6, line: 1293, baseType: !22, size: 32, offset: 3840)
!956 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface2D", scope: !910, file: !6, line: 1294, baseType: !943, size: 64, offset: 3872)
!957 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface3D", scope: !910, file: !6, line: 1295, baseType: !923, size: 96, offset: 3936)
!958 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface1DLayered", scope: !910, file: !6, line: 1296, baseType: !943, size: 64, offset: 4032)
!959 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface2DLayered", scope: !910, file: !6, line: 1297, baseType: !923, size: 96, offset: 4096)
!960 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurfaceCubemap", scope: !910, file: !6, line: 1298, baseType: !22, size: 32, offset: 4192)
!961 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurfaceCubemapLayered", scope: !910, file: !6, line: 1299, baseType: !943, size: 64, offset: 4224)
!962 = !DIDerivedType(tag: DW_TAG_member, name: "surfaceAlignment", scope: !910, file: !6, line: 1300, baseType: !18, size: 64, offset: 4288)
!963 = !DIDerivedType(tag: DW_TAG_member, name: "concurrentKernels", scope: !910, file: !6, line: 1301, baseType: !22, size: 32, offset: 4352)
!964 = !DIDerivedType(tag: DW_TAG_member, name: "ECCEnabled", scope: !910, file: !6, line: 1302, baseType: !22, size: 32, offset: 4384)
!965 = !DIDerivedType(tag: DW_TAG_member, name: "pciBusID", scope: !910, file: !6, line: 1303, baseType: !22, size: 32, offset: 4416)
!966 = !DIDerivedType(tag: DW_TAG_member, name: "pciDeviceID", scope: !910, file: !6, line: 1304, baseType: !22, size: 32, offset: 4448)
!967 = !DIDerivedType(tag: DW_TAG_member, name: "pciDomainID", scope: !910, file: !6, line: 1305, baseType: !22, size: 32, offset: 4480)
!968 = !DIDerivedType(tag: DW_TAG_member, name: "tccDriver", scope: !910, file: !6, line: 1306, baseType: !22, size: 32, offset: 4512)
!969 = !DIDerivedType(tag: DW_TAG_member, name: "asyncEngineCount", scope: !910, file: !6, line: 1307, baseType: !22, size: 32, offset: 4544)
!970 = !DIDerivedType(tag: DW_TAG_member, name: "unifiedAddressing", scope: !910, file: !6, line: 1308, baseType: !22, size: 32, offset: 4576)
!971 = !DIDerivedType(tag: DW_TAG_member, name: "memoryClockRate", scope: !910, file: !6, line: 1309, baseType: !22, size: 32, offset: 4608)
!972 = !DIDerivedType(tag: DW_TAG_member, name: "memoryBusWidth", scope: !910, file: !6, line: 1310, baseType: !22, size: 32, offset: 4640)
!973 = !DIDerivedType(tag: DW_TAG_member, name: "l2CacheSize", scope: !910, file: !6, line: 1311, baseType: !22, size: 32, offset: 4672)
!974 = !DIDerivedType(tag: DW_TAG_member, name: "maxThreadsPerMultiProcessor", scope: !910, file: !6, line: 1312, baseType: !22, size: 32, offset: 4704)
!975 = !DIDerivedType(tag: DW_TAG_member, name: "streamPrioritiesSupported", scope: !910, file: !6, line: 1313, baseType: !22, size: 32, offset: 4736)
!976 = !DIDerivedType(tag: DW_TAG_member, name: "globalL1CacheSupported", scope: !910, file: !6, line: 1314, baseType: !22, size: 32, offset: 4768)
!977 = !DIDerivedType(tag: DW_TAG_member, name: "localL1CacheSupported", scope: !910, file: !6, line: 1315, baseType: !22, size: 32, offset: 4800)
!978 = !DIDerivedType(tag: DW_TAG_member, name: "sharedMemPerMultiprocessor", scope: !910, file: !6, line: 1316, baseType: !18, size: 64, offset: 4864)
!979 = !DIDerivedType(tag: DW_TAG_member, name: "regsPerMultiprocessor", scope: !910, file: !6, line: 1317, baseType: !22, size: 32, offset: 4928)
!980 = !DIDerivedType(tag: DW_TAG_member, name: "managedMemory", scope: !910, file: !6, line: 1318, baseType: !22, size: 32, offset: 4960)
!981 = !DIDerivedType(tag: DW_TAG_member, name: "isMultiGpuBoard", scope: !910, file: !6, line: 1319, baseType: !22, size: 32, offset: 4992)
!982 = !DIDerivedType(tag: DW_TAG_member, name: "multiGpuBoardGroupID", scope: !910, file: !6, line: 1320, baseType: !22, size: 32, offset: 5024)
!983 = !DILocation(line: 96, column: 2, scope: !907)
!984 = !DILocation(line: 96, column: 17, scope: !907)
!985 = !DILocation(line: 97, column: 2, scope: !907)
!986 = !DILocation(line: 98, column: 2, scope: !907)
!987 = !DILocation(line: 99, column: 2, scope: !907)
!988 = !DILocation(line: 100, column: 1, scope: !907)
!989 = distinct !DISubprogram(name: "bicg_kernel1", linkageName: "_Z12bicg_kernel1PfS_S_ii", scope: !3, file: !3, line: 104, type: !990, isLocal: false, isDefinition: true, scopeLine: 105, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !992)
!990 = !DISubroutineType(types: !991)
!991 = !{null, !21, !21, !21, !22, !22}
!992 = !{!993, !994, !995, !996, !997}
!993 = !DILocalVariable(name: "A", arg: 1, scope: !989, file: !3, line: 104, type: !21)
!994 = !DILocalVariable(name: "r", arg: 2, scope: !989, file: !3, line: 104, type: !21)
!995 = !DILocalVariable(name: "s", arg: 3, scope: !989, file: !3, line: 104, type: !21)
!996 = !DILocalVariable(name: "NX", arg: 4, scope: !989, file: !3, line: 104, type: !22)
!997 = !DILocalVariable(name: "NY", arg: 5, scope: !989, file: !3, line: 104, type: !22)
!998 = !DILocation(line: 104, column: 41, scope: !989)
!999 = !{!1000, !1000, i64 0}
!1000 = !{!"any pointer", !623, i64 0}
!1001 = !DILocation(line: 104, column: 55, scope: !989)
!1002 = !DILocation(line: 104, column: 69, scope: !989)
!1003 = !DILocation(line: 104, column: 76, scope: !989)
!1004 = !DILocation(line: 104, column: 84, scope: !989)
!1005 = !DILocation(line: 105, column: 1, scope: !989)
!1006 = !DILocation(line: 105, column: 1, scope: !1007)
!1007 = !DILexicalBlockFile(scope: !989, file: !3, discriminator: 1)
!1008 = !DILocation(line: 105, column: 1, scope: !1009)
!1009 = !DILexicalBlockFile(scope: !989, file: !3, discriminator: 2)
!1010 = !DILocation(line: 105, column: 1, scope: !1011)
!1011 = !DILexicalBlockFile(scope: !989, file: !3, discriminator: 3)
!1012 = !DILocation(line: 105, column: 1, scope: !1013)
!1013 = !DILexicalBlockFile(scope: !989, file: !3, discriminator: 4)
!1014 = !DILocation(line: 105, column: 1, scope: !1015)
!1015 = !DILexicalBlockFile(scope: !989, file: !3, discriminator: 5)
!1016 = !DILocation(line: 118, column: 1, scope: !989)
!1017 = distinct !DISubprogram(name: "bicg_kernel2", linkageName: "_Z12bicg_kernel2PfS_S_ii", scope: !3, file: !3, line: 122, type: !990, isLocal: false, isDefinition: true, scopeLine: 123, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !1018)
!1018 = !{!1019, !1020, !1021, !1022, !1023}
!1019 = !DILocalVariable(name: "A", arg: 1, scope: !1017, file: !3, line: 122, type: !21)
!1020 = !DILocalVariable(name: "p", arg: 2, scope: !1017, file: !3, line: 122, type: !21)
!1021 = !DILocalVariable(name: "q", arg: 3, scope: !1017, file: !3, line: 122, type: !21)
!1022 = !DILocalVariable(name: "NX", arg: 4, scope: !1017, file: !3, line: 122, type: !22)
!1023 = !DILocalVariable(name: "NY", arg: 5, scope: !1017, file: !3, line: 122, type: !22)
!1024 = !DILocation(line: 122, column: 41, scope: !1017)
!1025 = !DILocation(line: 122, column: 55, scope: !1017)
!1026 = !DILocation(line: 122, column: 69, scope: !1017)
!1027 = !DILocation(line: 122, column: 76, scope: !1017)
!1028 = !DILocation(line: 122, column: 84, scope: !1017)
!1029 = !DILocation(line: 123, column: 1, scope: !1017)
!1030 = !DILocation(line: 123, column: 1, scope: !1031)
!1031 = !DILexicalBlockFile(scope: !1017, file: !3, discriminator: 1)
!1032 = !DILocation(line: 123, column: 1, scope: !1033)
!1033 = !DILexicalBlockFile(scope: !1017, file: !3, discriminator: 2)
!1034 = !DILocation(line: 123, column: 1, scope: !1035)
!1035 = !DILexicalBlockFile(scope: !1017, file: !3, discriminator: 3)
!1036 = !DILocation(line: 123, column: 1, scope: !1037)
!1037 = !DILexicalBlockFile(scope: !1017, file: !3, discriminator: 4)
!1038 = !DILocation(line: 123, column: 1, scope: !1039)
!1039 = !DILexicalBlockFile(scope: !1017, file: !3, discriminator: 5)
!1040 = !DILocation(line: 136, column: 1, scope: !1017)
!1041 = distinct !DISubprogram(name: "bicg_cpu", linkageName: "_Z8bicg_cpuPfS_S_S_S_", scope: !3, file: !3, line: 139, type: !1042, isLocal: false, isDefinition: true, scopeLine: 140, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !1044)
!1042 = !DISubroutineType(types: !1043)
!1043 = !{null, !21, !21, !21, !21, !21}
!1044 = !{!1045, !1046, !1047, !1048, !1049, !1050, !1051}
!1045 = !DILocalVariable(name: "A", arg: 1, scope: !1041, file: !3, line: 139, type: !21)
!1046 = !DILocalVariable(name: "r", arg: 2, scope: !1041, file: !3, line: 139, type: !21)
!1047 = !DILocalVariable(name: "s", arg: 3, scope: !1041, file: !3, line: 139, type: !21)
!1048 = !DILocalVariable(name: "p", arg: 4, scope: !1041, file: !3, line: 139, type: !21)
!1049 = !DILocalVariable(name: "q", arg: 5, scope: !1041, file: !3, line: 139, type: !21)
!1050 = !DILocalVariable(name: "i", scope: !1041, file: !3, line: 141, type: !22)
!1051 = !DILocalVariable(name: "j", scope: !1041, file: !3, line: 141, type: !22)
!1052 = !DILocation(line: 139, column: 26, scope: !1041)
!1053 = !DILocation(line: 139, column: 40, scope: !1041)
!1054 = !DILocation(line: 139, column: 54, scope: !1041)
!1055 = !DILocation(line: 139, column: 68, scope: !1041)
!1056 = !DILocation(line: 139, column: 82, scope: !1041)
!1057 = !DILocation(line: 141, column: 6, scope: !1041)
!1058 = !DILocation(line: 143, column: 20, scope: !1059)
!1059 = !DILexicalBlockFile(scope: !1060, file: !3, discriminator: 1)
!1060 = distinct !DILexicalBlock(scope: !1061, file: !3, line: 143, column: 4)
!1061 = distinct !DILexicalBlock(scope: !1041, file: !3, line: 143, column: 4)
!1062 = !DILocation(line: 143, column: 18, scope: !1059)
!1063 = !DILocation(line: 143, column: 4, scope: !1064)
!1064 = !DILexicalBlockFile(scope: !1061, file: !3, discriminator: 1)
!1065 = !DILocation(line: 145, column: 8, scope: !1066)
!1066 = distinct !DILexicalBlock(scope: !1060, file: !3, line: 144, column: 2)
!1067 = !DILocation(line: 148, column: 22, scope: !1068)
!1068 = !DILexicalBlockFile(scope: !1069, file: !3, discriminator: 1)
!1069 = distinct !DILexicalBlock(scope: !1070, file: !3, line: 148, column: 6)
!1070 = distinct !DILexicalBlock(scope: !1041, file: !3, line: 148, column: 6)
!1071 = !DILocation(line: 148, column: 20, scope: !1068)
!1072 = !DILocation(line: 148, column: 6, scope: !1073)
!1073 = !DILexicalBlockFile(scope: !1070, file: !3, discriminator: 1)
!1074 = !DILocation(line: 150, column: 3, scope: !1075)
!1075 = distinct !DILexicalBlock(scope: !1069, file: !3, line: 149, column: 6)
!1076 = !DILocation(line: 150, column: 8, scope: !1075)
!1077 = !DILocation(line: 141, column: 8, scope: !1041)
!1078 = !DILocation(line: 151, column: 3, scope: !1079)
!1079 = !DILexicalBlockFile(scope: !1080, file: !3, discriminator: 1)
!1080 = distinct !DILexicalBlock(scope: !1075, file: !3, line: 151, column: 3)
!1081 = !DILocation(line: 153, column: 15, scope: !1082)
!1082 = distinct !DILexicalBlock(scope: !1083, file: !3, line: 152, column: 5)
!1083 = distinct !DILexicalBlock(scope: !1080, file: !3, line: 151, column: 3)
!1084 = !DILocation(line: 153, column: 22, scope: !1082)
!1085 = !DILocation(line: 153, column: 36, scope: !1082)
!1086 = !DILocation(line: 153, column: 29, scope: !1082)
!1087 = !DILocation(line: 153, column: 27, scope: !1082)
!1088 = !DILocation(line: 153, column: 20, scope: !1082)
!1089 = !DILocation(line: 153, column: 13, scope: !1082)
!1090 = !DILocation(line: 154, column: 15, scope: !1082)
!1091 = !DILocation(line: 154, column: 22, scope: !1082)
!1092 = !DILocation(line: 154, column: 36, scope: !1082)
!1093 = !DILocation(line: 154, column: 34, scope: !1082)
!1094 = !DILocation(line: 154, column: 20, scope: !1082)
!1095 = !DILocation(line: 154, column: 13, scope: !1082)
!1096 = !DILocation(line: 151, column: 24, scope: !1097)
!1097 = !DILexicalBlockFile(scope: !1083, file: !3, discriminator: 2)
!1098 = !DILocation(line: 151, column: 17, scope: !1099)
!1099 = !DILexicalBlockFile(scope: !1083, file: !3, discriminator: 1)
!1100 = distinct !{!1100, !1101, !1102}
!1101 = !DILocation(line: 151, column: 3, scope: !1080)
!1102 = !DILocation(line: 155, column: 5, scope: !1080)
!1103 = !DILocation(line: 148, column: 27, scope: !1104)
!1104 = !DILexicalBlockFile(scope: !1069, file: !3, discriminator: 2)
!1105 = distinct !{!1105, !1106, !1107}
!1106 = !DILocation(line: 148, column: 6, scope: !1070)
!1107 = !DILocation(line: 156, column: 2, scope: !1070)
!1108 = !DILocation(line: 157, column: 1, scope: !1041)
!1109 = distinct !DISubprogram(name: "bicgCuda", linkageName: "_Z8bicgCudaPfS_S_S_S_S_S_", scope: !3, file: !3, line: 160, type: !1110, isLocal: false, isDefinition: true, scopeLine: 162, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !1112)
!1110 = !DISubroutineType(types: !1111)
!1111 = !{null, !21, !21, !21, !21, !21, !21, !21}
!1112 = !{!1113, !1114, !1115, !1116, !1117, !1118, !1119, !1120, !1121, !1122, !1123, !1124, !1125, !1126, !1127, !1128, !1152, !1153}
!1113 = !DILocalVariable(name: "A", arg: 1, scope: !1109, file: !3, line: 160, type: !21)
!1114 = !DILocalVariable(name: "r", arg: 2, scope: !1109, file: !3, line: 160, type: !21)
!1115 = !DILocalVariable(name: "s", arg: 3, scope: !1109, file: !3, line: 160, type: !21)
!1116 = !DILocalVariable(name: "p", arg: 4, scope: !1109, file: !3, line: 160, type: !21)
!1117 = !DILocalVariable(name: "q", arg: 5, scope: !1109, file: !3, line: 160, type: !21)
!1118 = !DILocalVariable(name: "s_outputFromGpu", arg: 6, scope: !1109, file: !3, line: 161, type: !21)
!1119 = !DILocalVariable(name: "q_outputFromGpu", arg: 7, scope: !1109, file: !3, line: 161, type: !21)
!1120 = !DILocalVariable(name: "t_start", scope: !1109, file: !3, line: 163, type: !173)
!1121 = !DILocalVariable(name: "t_end", scope: !1109, file: !3, line: 163, type: !173)
!1122 = !DILocalVariable(name: "t_m", scope: !1109, file: !3, line: 163, type: !173)
!1123 = !DILocalVariable(name: "A_gpu", scope: !1109, file: !3, line: 165, type: !21)
!1124 = !DILocalVariable(name: "q_gpu", scope: !1109, file: !3, line: 166, type: !21)
!1125 = !DILocalVariable(name: "p_gpu", scope: !1109, file: !3, line: 167, type: !21)
!1126 = !DILocalVariable(name: "r_gpu", scope: !1109, file: !3, line: 168, type: !21)
!1127 = !DILocalVariable(name: "s_gpu", scope: !1109, file: !3, line: 169, type: !21)
!1128 = !DILocalVariable(name: "block", scope: !1109, file: !3, line: 182, type: !1129)
!1129 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !1130, line: 427, baseType: !1131)
!1130 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/bicgllvm")
!1131 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !1130, line: 417, size: 96, elements: !1132, identifier: "_ZTS4dim3")
!1132 = !{!1133, !1134, !1135, !1136, !1140, !1149}
!1133 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1131, file: !1130, line: 419, baseType: !387, size: 32)
!1134 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1131, file: !1130, line: 419, baseType: !387, size: 32, offset: 32)
!1135 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1131, file: !1130, line: 419, baseType: !387, size: 32, offset: 64)
!1136 = !DISubprogram(name: "dim3", scope: !1131, file: !1130, line: 421, type: !1137, isLocal: false, isDefinition: false, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: true)
!1137 = !DISubroutineType(types: !1138)
!1138 = !{null, !1139, !387, !387, !387}
!1139 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1131, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1140 = !DISubprogram(name: "dim3", scope: !1131, file: !1130, line: 422, type: !1141, isLocal: false, isDefinition: false, scopeLine: 422, flags: DIFlagPrototyped, isOptimized: true)
!1141 = !DISubroutineType(types: !1142)
!1142 = !{null, !1139, !1143}
!1143 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !1130, line: 383, baseType: !1144)
!1144 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !1130, line: 190, size: 96, elements: !1145, identifier: "_ZTS5uint3")
!1145 = !{!1146, !1147, !1148}
!1146 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1144, file: !1130, line: 192, baseType: !387, size: 32)
!1147 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1144, file: !1130, line: 192, baseType: !387, size: 32, offset: 32)
!1148 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1144, file: !1130, line: 192, baseType: !387, size: 32, offset: 64)
!1149 = !DISubprogram(name: "operator uint3", linkageName: "_ZN4dim3cv5uint3Ev", scope: !1131, file: !1130, line: 423, type: !1150, isLocal: false, isDefinition: false, scopeLine: 423, flags: DIFlagPrototyped, isOptimized: true)
!1150 = !DISubroutineType(types: !1151)
!1151 = !{!1143, !1139}
!1152 = !DILocalVariable(name: "grid1", scope: !1109, file: !3, line: 183, type: !1129)
!1153 = !DILocalVariable(name: "grid2", scope: !1109, file: !3, line: 184, type: !1129)
!1154 = !DILocation(line: 160, column: 26, scope: !1109)
!1155 = !DILocation(line: 160, column: 40, scope: !1109)
!1156 = !DILocation(line: 160, column: 54, scope: !1109)
!1157 = !DILocation(line: 160, column: 68, scope: !1109)
!1158 = !DILocation(line: 160, column: 82, scope: !1109)
!1159 = !DILocation(line: 161, column: 15, scope: !1109)
!1160 = !DILocation(line: 161, column: 43, scope: !1109)
!1161 = !DILocation(line: 165, column: 2, scope: !1109)
!1162 = !DILocation(line: 166, column: 2, scope: !1109)
!1163 = !DILocation(line: 167, column: 2, scope: !1109)
!1164 = !DILocation(line: 168, column: 2, scope: !1109)
!1165 = !DILocation(line: 169, column: 2, scope: !1109)
!1166 = !DILocation(line: 171, column: 13, scope: !1109)
!1167 = !DILocation(line: 171, column: 50, scope: !1109)
!1168 = !DILocation(line: 171, column: 48, scope: !1109)
!1169 = !DILocation(line: 171, column: 55, scope: !1109)
!1170 = !DILocation(line: 171, column: 53, scope: !1109)
!1171 = !DILocation(line: 171, column: 2, scope: !1109)
!1172 = !DILocation(line: 172, column: 13, scope: !1109)
!1173 = !DILocation(line: 172, column: 50, scope: !1109)
!1174 = !DILocation(line: 172, column: 48, scope: !1109)
!1175 = !DILocation(line: 172, column: 2, scope: !1109)
!1176 = !DILocation(line: 173, column: 13, scope: !1109)
!1177 = !DILocation(line: 173, column: 50, scope: !1109)
!1178 = !DILocation(line: 173, column: 48, scope: !1109)
!1179 = !DILocation(line: 173, column: 2, scope: !1109)
!1180 = !DILocation(line: 174, column: 13, scope: !1109)
!1181 = !DILocation(line: 174, column: 50, scope: !1109)
!1182 = !DILocation(line: 174, column: 48, scope: !1109)
!1183 = !DILocation(line: 174, column: 2, scope: !1109)
!1184 = !DILocation(line: 175, column: 13, scope: !1109)
!1185 = !DILocation(line: 175, column: 50, scope: !1109)
!1186 = !DILocation(line: 175, column: 48, scope: !1109)
!1187 = !DILocation(line: 175, column: 2, scope: !1109)
!1188 = !DILocation(line: 176, column: 13, scope: !1109)
!1189 = !DILocation(line: 176, column: 20, scope: !1109)
!1190 = !DILocation(line: 176, column: 43, scope: !1109)
!1191 = !DILocation(line: 176, column: 41, scope: !1109)
!1192 = !DILocation(line: 176, column: 48, scope: !1109)
!1193 = !DILocation(line: 176, column: 46, scope: !1109)
!1194 = !DILocation(line: 176, column: 2, scope: !1109)
!1195 = !DILocation(line: 177, column: 13, scope: !1109)
!1196 = !DILocation(line: 177, column: 20, scope: !1109)
!1197 = !DILocation(line: 177, column: 43, scope: !1109)
!1198 = !DILocation(line: 177, column: 41, scope: !1109)
!1199 = !DILocation(line: 177, column: 2, scope: !1109)
!1200 = !DILocation(line: 178, column: 13, scope: !1109)
!1201 = !DILocation(line: 178, column: 20, scope: !1109)
!1202 = !DILocation(line: 178, column: 43, scope: !1109)
!1203 = !DILocation(line: 178, column: 41, scope: !1109)
!1204 = !DILocation(line: 178, column: 2, scope: !1109)
!1205 = !DILocation(line: 179, column: 13, scope: !1109)
!1206 = !DILocation(line: 179, column: 20, scope: !1109)
!1207 = !DILocation(line: 179, column: 43, scope: !1109)
!1208 = !DILocation(line: 179, column: 41, scope: !1109)
!1209 = !DILocation(line: 179, column: 2, scope: !1109)
!1210 = !DILocation(line: 180, column: 13, scope: !1109)
!1211 = !DILocation(line: 180, column: 20, scope: !1109)
!1212 = !DILocation(line: 180, column: 43, scope: !1109)
!1213 = !DILocation(line: 180, column: 41, scope: !1109)
!1214 = !DILocation(line: 180, column: 2, scope: !1109)
!1215 = !DILocation(line: 182, column: 7, scope: !1109)
!1216 = !DILocation(line: 183, column: 36, scope: !1109)
!1217 = !DILocation(line: 183, column: 40, scope: !1109)
!1218 = !DILocation(line: 183, column: 22, scope: !1109)
!1219 = !DILocation(line: 183, column: 21, scope: !1109)
!1220 = !DILocation(line: 183, column: 13, scope: !1109)
!1221 = !DILocation(line: 183, column: 7, scope: !1109)
!1222 = !DILocation(line: 184, column: 36, scope: !1109)
!1223 = !DILocation(line: 184, column: 40, scope: !1109)
!1224 = !DILocation(line: 184, column: 22, scope: !1109)
!1225 = !DILocation(line: 184, column: 21, scope: !1109)
!1226 = !DILocation(line: 184, column: 13, scope: !1109)
!1227 = !DILocation(line: 184, column: 7, scope: !1109)
!1228 = !DILocation(line: 187, column: 2, scope: !1109)
!1229 = !DILocation(line: 188, column: 2, scope: !1109)
!1230 = !DILocation(line: 192, column: 2, scope: !1109)
!1231 = !DILocation(line: 13, column: 5, scope: !585, inlinedAt: !1232)
!1232 = distinct !DILocation(line: 193, column: 12, scope: !1109)
!1233 = !DILocation(line: 14, column: 5, scope: !585, inlinedAt: !1232)
!1234 = !DILocation(line: 13, column: 21, scope: !585, inlinedAt: !1232)
!1235 = !DILocation(line: 14, column: 20, scope: !585, inlinedAt: !1232)
!1236 = !DILocation(line: 16, column: 12, scope: !585, inlinedAt: !1232)
!1237 = !DILocation(line: 15, column: 9, scope: !585, inlinedAt: !1232)
!1238 = !DILocation(line: 17, column: 14, scope: !615, inlinedAt: !1232)
!1239 = !DILocation(line: 17, column: 9, scope: !585, inlinedAt: !1232)
!1240 = !DILocation(line: 17, column: 20, scope: !618, inlinedAt: !1232)
!1241 = !DILocation(line: 18, column: 15, scope: !585, inlinedAt: !1232)
!1242 = !DILocation(line: 18, column: 12, scope: !585, inlinedAt: !1232)
!1243 = !DILocation(line: 18, column: 27, scope: !585, inlinedAt: !1232)
!1244 = !DILocation(line: 18, column: 24, scope: !585, inlinedAt: !1232)
!1245 = !DILocation(line: 18, column: 34, scope: !585, inlinedAt: !1232)
!1246 = !DILocation(line: 18, column: 22, scope: !585, inlinedAt: !1232)
!1247 = !DILocation(line: 19, column: 1, scope: !585, inlinedAt: !1232)
!1248 = !DILocation(line: 163, column: 9, scope: !1109)
!1249 = !DILocation(line: 194, column: 18, scope: !1109)
!1250 = !DILocation(line: 194, column: 14, scope: !1109)
!1251 = !DILocation(line: 194, column: 2, scope: !1109)
!1252 = !DILocation(line: 194, column: 35, scope: !1253)
!1253 = !DILexicalBlockFile(scope: !1109, file: !3, discriminator: 1)
!1254 = !DILocation(line: 165, column: 13, scope: !1109)
!1255 = !DILocation(line: 194, column: 42, scope: !1253)
!1256 = !DILocation(line: 168, column: 13, scope: !1109)
!1257 = !DILocation(line: 194, column: 49, scope: !1253)
!1258 = !DILocation(line: 169, column: 13, scope: !1109)
!1259 = !DILocation(line: 194, column: 56, scope: !1253)
!1260 = !DILocation(line: 194, column: 60, scope: !1253)
!1261 = !DILocation(line: 194, column: 2, scope: !1253)
!1262 = !DILocation(line: 196, column: 2, scope: !1109)
!1263 = !DILocation(line: 13, column: 5, scope: !585, inlinedAt: !1264)
!1264 = distinct !DILocation(line: 197, column: 8, scope: !1109)
!1265 = !DILocation(line: 14, column: 5, scope: !585, inlinedAt: !1264)
!1266 = !DILocation(line: 13, column: 21, scope: !585, inlinedAt: !1264)
!1267 = !DILocation(line: 14, column: 20, scope: !585, inlinedAt: !1264)
!1268 = !DILocation(line: 16, column: 12, scope: !585, inlinedAt: !1264)
!1269 = !DILocation(line: 15, column: 9, scope: !585, inlinedAt: !1264)
!1270 = !DILocation(line: 17, column: 14, scope: !615, inlinedAt: !1264)
!1271 = !DILocation(line: 17, column: 9, scope: !585, inlinedAt: !1264)
!1272 = !DILocation(line: 17, column: 20, scope: !618, inlinedAt: !1264)
!1273 = !DILocation(line: 19, column: 1, scope: !585, inlinedAt: !1264)
!1274 = !DILocation(line: 199, column: 18, scope: !1109)
!1275 = !DILocation(line: 199, column: 14, scope: !1109)
!1276 = !DILocation(line: 199, column: 2, scope: !1109)
!1277 = !DILocation(line: 199, column: 35, scope: !1253)
!1278 = !DILocation(line: 199, column: 42, scope: !1253)
!1279 = !DILocation(line: 167, column: 13, scope: !1109)
!1280 = !DILocation(line: 199, column: 49, scope: !1253)
!1281 = !DILocation(line: 166, column: 13, scope: !1109)
!1282 = !DILocation(line: 199, column: 56, scope: !1253)
!1283 = !DILocation(line: 199, column: 60, scope: !1253)
!1284 = !DILocation(line: 199, column: 2, scope: !1253)
!1285 = !DILocation(line: 200, column: 2, scope: !1109)
!1286 = !DILocation(line: 13, column: 5, scope: !585, inlinedAt: !1287)
!1287 = distinct !DILocation(line: 201, column: 10, scope: !1109)
!1288 = !DILocation(line: 14, column: 5, scope: !585, inlinedAt: !1287)
!1289 = !DILocation(line: 13, column: 21, scope: !585, inlinedAt: !1287)
!1290 = !DILocation(line: 14, column: 20, scope: !585, inlinedAt: !1287)
!1291 = !DILocation(line: 16, column: 12, scope: !585, inlinedAt: !1287)
!1292 = !DILocation(line: 15, column: 9, scope: !585, inlinedAt: !1287)
!1293 = !DILocation(line: 17, column: 14, scope: !615, inlinedAt: !1287)
!1294 = !DILocation(line: 17, column: 9, scope: !585, inlinedAt: !1287)
!1295 = !DILocation(line: 17, column: 20, scope: !618, inlinedAt: !1287)
!1296 = !DILocation(line: 18, column: 15, scope: !585, inlinedAt: !1287)
!1297 = !DILocation(line: 18, column: 12, scope: !585, inlinedAt: !1287)
!1298 = !DILocation(line: 18, column: 27, scope: !585, inlinedAt: !1287)
!1299 = !DILocation(line: 18, column: 24, scope: !585, inlinedAt: !1287)
!1300 = !DILocation(line: 18, column: 34, scope: !585, inlinedAt: !1287)
!1301 = !DILocation(line: 18, column: 22, scope: !585, inlinedAt: !1287)
!1302 = !DILocation(line: 19, column: 1, scope: !585, inlinedAt: !1287)
!1303 = !DILocation(line: 163, column: 18, scope: !1109)
!1304 = !DILocation(line: 202, column: 10, scope: !1109)
!1305 = !DILocation(line: 202, column: 50, scope: !1109)
!1306 = !DILocation(line: 202, column: 2, scope: !1109)
!1307 = !DILocation(line: 203, column: 10, scope: !1109)
!1308 = !DILocation(line: 203, column: 2, scope: !1109)
!1309 = !DILocation(line: 207, column: 13, scope: !1109)
!1310 = !DILocation(line: 207, column: 30, scope: !1109)
!1311 = !DILocation(line: 207, column: 57, scope: !1109)
!1312 = !DILocation(line: 207, column: 55, scope: !1109)
!1313 = !DILocation(line: 207, column: 2, scope: !1109)
!1314 = !DILocation(line: 208, column: 13, scope: !1109)
!1315 = !DILocation(line: 208, column: 30, scope: !1109)
!1316 = !DILocation(line: 208, column: 57, scope: !1109)
!1317 = !DILocation(line: 208, column: 55, scope: !1109)
!1318 = !DILocation(line: 208, column: 2, scope: !1109)
!1319 = !DILocation(line: 210, column: 11, scope: !1109)
!1320 = !DILocation(line: 210, column: 2, scope: !1109)
!1321 = !DILocation(line: 211, column: 11, scope: !1109)
!1322 = !DILocation(line: 211, column: 2, scope: !1109)
!1323 = !DILocation(line: 212, column: 11, scope: !1109)
!1324 = !DILocation(line: 212, column: 2, scope: !1109)
!1325 = !DILocation(line: 213, column: 11, scope: !1109)
!1326 = !DILocation(line: 213, column: 2, scope: !1109)
!1327 = !DILocation(line: 214, column: 11, scope: !1109)
!1328 = !DILocation(line: 214, column: 2, scope: !1109)
!1329 = !DILocation(line: 215, column: 1, scope: !1109)
!1330 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 218, type: !1331, isLocal: false, isDefinition: true, scopeLine: 219, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !1333)
!1331 = !DISubroutineType(types: !1332)
!1332 = !{!22, !22, !23}
!1333 = !{!1334, !1335, !1336, !1337, !1338, !1339, !1340, !1341, !1342, !1343, !1344}
!1334 = !DILocalVariable(name: "argc", arg: 1, scope: !1330, file: !3, line: 218, type: !22)
!1335 = !DILocalVariable(name: "argv", arg: 2, scope: !1330, file: !3, line: 218, type: !23)
!1336 = !DILocalVariable(name: "t_start", scope: !1330, file: !3, line: 220, type: !173)
!1337 = !DILocalVariable(name: "t_end", scope: !1330, file: !3, line: 220, type: !173)
!1338 = !DILocalVariable(name: "A", scope: !1330, file: !3, line: 232, type: !21)
!1339 = !DILocalVariable(name: "r", scope: !1330, file: !3, line: 233, type: !21)
!1340 = !DILocalVariable(name: "s", scope: !1330, file: !3, line: 234, type: !21)
!1341 = !DILocalVariable(name: "p", scope: !1330, file: !3, line: 235, type: !21)
!1342 = !DILocalVariable(name: "q", scope: !1330, file: !3, line: 236, type: !21)
!1343 = !DILocalVariable(name: "s_outputFromGpu", scope: !1330, file: !3, line: 237, type: !21)
!1344 = !DILocalVariable(name: "q_outputFromGpu", scope: !1330, file: !3, line: 238, type: !21)
!1345 = !DILocation(line: 218, column: 14, scope: !1330)
!1346 = !DILocation(line: 218, column: 27, scope: !1330)
!1347 = !DILocation(line: 222, column: 11, scope: !1348)
!1348 = distinct !DILexicalBlock(scope: !1330, file: !3, line: 222, column: 6)
!1349 = !DILocation(line: 222, column: 6, scope: !1330)
!1350 = !DILocation(line: 224, column: 3, scope: !1351)
!1351 = distinct !DILexicalBlock(scope: !1348, file: !3, line: 223, column: 2)
!1352 = !DILocation(line: 225, column: 3, scope: !1351)
!1353 = !DILocation(line: 228, column: 12, scope: !1330)
!1354 = !DILocation(line: 278, column: 1, scope: !305, inlinedAt: !1355)
!1355 = distinct !DILocation(line: 228, column: 7, scope: !1330)
!1356 = !DILocation(line: 280, column: 16, scope: !305, inlinedAt: !1355)
!1357 = !DILocation(line: 228, column: 5, scope: !1330)
!1358 = !DILocation(line: 229, column: 12, scope: !1330)
!1359 = !DILocation(line: 278, column: 1, scope: !305, inlinedAt: !1360)
!1360 = distinct !DILocation(line: 229, column: 7, scope: !1330)
!1361 = !DILocation(line: 280, column: 16, scope: !305, inlinedAt: !1360)
!1362 = !DILocation(line: 229, column: 5, scope: !1330)
!1363 = !DILocation(line: 230, column: 2, scope: !1330)
!1364 = !DILocation(line: 240, column: 25, scope: !1330)
!1365 = !DILocation(line: 240, column: 28, scope: !1330)
!1366 = !DILocation(line: 240, column: 27, scope: !1330)
!1367 = !DILocation(line: 240, column: 30, scope: !1330)
!1368 = !DILocation(line: 240, column: 18, scope: !1330)
!1369 = !DILocation(line: 240, column: 6, scope: !1330)
!1370 = !DILocation(line: 232, column: 13, scope: !1330)
!1371 = !DILocation(line: 241, column: 25, scope: !1330)
!1372 = !DILocation(line: 241, column: 27, scope: !1330)
!1373 = !DILocation(line: 241, column: 18, scope: !1330)
!1374 = !DILocation(line: 241, column: 6, scope: !1330)
!1375 = !DILocation(line: 233, column: 13, scope: !1330)
!1376 = !DILocation(line: 242, column: 25, scope: !1330)
!1377 = !DILocation(line: 242, column: 27, scope: !1330)
!1378 = !DILocation(line: 242, column: 18, scope: !1330)
!1379 = !DILocation(line: 242, column: 6, scope: !1330)
!1380 = !DILocation(line: 234, column: 13, scope: !1330)
!1381 = !DILocation(line: 243, column: 18, scope: !1330)
!1382 = !DILocation(line: 243, column: 6, scope: !1330)
!1383 = !DILocation(line: 235, column: 13, scope: !1330)
!1384 = !DILocation(line: 244, column: 18, scope: !1330)
!1385 = !DILocation(line: 244, column: 6, scope: !1330)
!1386 = !DILocation(line: 236, column: 13, scope: !1330)
!1387 = !DILocation(line: 245, column: 32, scope: !1330)
!1388 = !DILocation(line: 245, column: 20, scope: !1330)
!1389 = !DILocation(line: 237, column: 13, scope: !1330)
!1390 = !DILocation(line: 246, column: 32, scope: !1330)
!1391 = !DILocation(line: 246, column: 20, scope: !1330)
!1392 = !DILocation(line: 238, column: 13, scope: !1330)
!1393 = !DILocation(line: 46, column: 28, scope: !698, inlinedAt: !1394)
!1394 = distinct !DILocation(line: 248, column: 2, scope: !1330)
!1395 = !DILocation(line: 46, column: 42, scope: !698, inlinedAt: !1394)
!1396 = !DILocation(line: 46, column: 56, scope: !698, inlinedAt: !1394)
!1397 = !DILocation(line: 48, column: 6, scope: !698, inlinedAt: !1394)
!1398 = !DILocation(line: 50, column: 18, scope: !712, inlinedAt: !1394)
!1399 = !DILocation(line: 50, column: 4, scope: !719, inlinedAt: !1394)
!1400 = !DILocation(line: 60, column: 16, scope: !721, inlinedAt: !1394)
!1401 = !DILocation(line: 60, column: 2, scope: !726, inlinedAt: !1394)
!1402 = !DILocation(line: 62, column: 14, scope: !728, inlinedAt: !1394)
!1403 = !DILocation(line: 62, column: 16, scope: !728, inlinedAt: !1394)
!1404 = !DILocation(line: 62, column: 7, scope: !728, inlinedAt: !1394)
!1405 = !DILocation(line: 62, column: 12, scope: !728, inlinedAt: !1394)
!1406 = !DILocation(line: 60, column: 23, scope: !735, inlinedAt: !1394)
!1407 = distinct !{!1407, !737}
!1408 = !DILocation(line: 52, column: 14, scope: !739, inlinedAt: !1394)
!1409 = !DILocation(line: 52, column: 16, scope: !739, inlinedAt: !1394)
!1410 = !DILocation(line: 52, column: 7, scope: !739, inlinedAt: !1394)
!1411 = !DILocation(line: 52, column: 12, scope: !739, inlinedAt: !1394)
!1412 = !DILocation(line: 48, column: 9, scope: !698, inlinedAt: !1394)
!1413 = !DILocation(line: 54, column: 7, scope: !745, inlinedAt: !1394)
!1414 = !DILocation(line: 54, column: 28, scope: !748, inlinedAt: !1394)
!1415 = !DILocation(line: 56, column: 39, scope: !751, inlinedAt: !1394)
!1416 = !DILocation(line: 56, column: 38, scope: !751, inlinedAt: !1394)
!1417 = !DILocation(line: 56, column: 42, scope: !751, inlinedAt: !1394)
!1418 = !DILocation(line: 56, column: 17, scope: !751, inlinedAt: !1394)
!1419 = !DILocation(line: 56, column: 10, scope: !751, inlinedAt: !1394)
!1420 = !DILocation(line: 56, column: 22, scope: !751, inlinedAt: !1394)
!1421 = distinct !{!1421, !758, !759, !760, !761}
!1422 = !DILocation(line: 54, column: 21, scope: !763, inlinedAt: !1394)
!1423 = distinct !{!1423, !758, !759, !765, !760, !761}
!1424 = !DILocation(line: 50, column: 25, scope: !767, inlinedAt: !1394)
!1425 = !DILocation(line: 96, column: 2, scope: !907, inlinedAt: !1426)
!1426 = distinct !DILocation(line: 250, column: 2, scope: !1330)
!1427 = !DILocation(line: 96, column: 17, scope: !907, inlinedAt: !1426)
!1428 = !DILocation(line: 97, column: 2, scope: !907, inlinedAt: !1426)
!1429 = !DILocation(line: 98, column: 2, scope: !907, inlinedAt: !1426)
!1430 = !DILocation(line: 99, column: 2, scope: !907, inlinedAt: !1426)
!1431 = !DILocation(line: 100, column: 1, scope: !907, inlinedAt: !1426)
!1432 = !DILocation(line: 252, column: 2, scope: !1330)
!1433 = !DILocation(line: 13, column: 5, scope: !585, inlinedAt: !1434)
!1434 = distinct !DILocation(line: 254, column: 12, scope: !1330)
!1435 = !DILocation(line: 14, column: 5, scope: !585, inlinedAt: !1434)
!1436 = !DILocation(line: 13, column: 21, scope: !585, inlinedAt: !1434)
!1437 = !DILocation(line: 14, column: 20, scope: !585, inlinedAt: !1434)
!1438 = !DILocation(line: 16, column: 12, scope: !585, inlinedAt: !1434)
!1439 = !DILocation(line: 15, column: 9, scope: !585, inlinedAt: !1434)
!1440 = !DILocation(line: 17, column: 14, scope: !615, inlinedAt: !1434)
!1441 = !DILocation(line: 17, column: 9, scope: !585, inlinedAt: !1434)
!1442 = !DILocation(line: 17, column: 20, scope: !618, inlinedAt: !1434)
!1443 = !DILocation(line: 18, column: 15, scope: !585, inlinedAt: !1434)
!1444 = !DILocation(line: 18, column: 12, scope: !585, inlinedAt: !1434)
!1445 = !DILocation(line: 18, column: 27, scope: !585, inlinedAt: !1434)
!1446 = !DILocation(line: 18, column: 24, scope: !585, inlinedAt: !1434)
!1447 = !DILocation(line: 18, column: 34, scope: !585, inlinedAt: !1434)
!1448 = !DILocation(line: 18, column: 22, scope: !585, inlinedAt: !1434)
!1449 = !DILocation(line: 19, column: 1, scope: !585, inlinedAt: !1434)
!1450 = !DILocation(line: 220, column: 9, scope: !1330)
!1451 = !DILocation(line: 139, column: 26, scope: !1041, inlinedAt: !1452)
!1452 = distinct !DILocation(line: 255, column: 2, scope: !1330)
!1453 = !DILocation(line: 139, column: 40, scope: !1041, inlinedAt: !1452)
!1454 = !DILocation(line: 139, column: 54, scope: !1041, inlinedAt: !1452)
!1455 = !DILocation(line: 139, column: 68, scope: !1041, inlinedAt: !1452)
!1456 = !DILocation(line: 139, column: 82, scope: !1041, inlinedAt: !1452)
!1457 = !DILocation(line: 141, column: 6, scope: !1041, inlinedAt: !1452)
!1458 = !DILocation(line: 143, column: 20, scope: !1059, inlinedAt: !1452)
!1459 = !DILocation(line: 143, column: 18, scope: !1059, inlinedAt: !1452)
!1460 = !DILocation(line: 143, column: 4, scope: !1064, inlinedAt: !1452)
!1461 = !DILocation(line: 145, column: 8, scope: !1066, inlinedAt: !1452)
!1462 = !DILocation(line: 148, column: 22, scope: !1068, inlinedAt: !1452)
!1463 = !DILocation(line: 148, column: 20, scope: !1068, inlinedAt: !1452)
!1464 = !DILocation(line: 148, column: 6, scope: !1073, inlinedAt: !1452)
!1465 = !DILocation(line: 150, column: 3, scope: !1075, inlinedAt: !1452)
!1466 = !DILocation(line: 150, column: 8, scope: !1075, inlinedAt: !1452)
!1467 = !DILocation(line: 141, column: 8, scope: !1041, inlinedAt: !1452)
!1468 = !DILocation(line: 151, column: 3, scope: !1079, inlinedAt: !1452)
!1469 = !DILocation(line: 153, column: 15, scope: !1082, inlinedAt: !1452)
!1470 = !DILocation(line: 153, column: 29, scope: !1082, inlinedAt: !1452)
!1471 = !DILocation(line: 153, column: 27, scope: !1082, inlinedAt: !1452)
!1472 = !DILocation(line: 153, column: 20, scope: !1082, inlinedAt: !1452)
!1473 = !DILocation(line: 153, column: 13, scope: !1082, inlinedAt: !1452)
!1474 = !DILocation(line: 154, column: 36, scope: !1082, inlinedAt: !1452)
!1475 = !DILocation(line: 154, column: 34, scope: !1082, inlinedAt: !1452)
!1476 = !DILocation(line: 154, column: 20, scope: !1082, inlinedAt: !1452)
!1477 = !DILocation(line: 153, column: 36, scope: !1082, inlinedAt: !1452)
!1478 = !DILocation(line: 151, column: 24, scope: !1097, inlinedAt: !1452)
!1479 = !DILocation(line: 151, column: 17, scope: !1099, inlinedAt: !1452)
!1480 = !DILocation(line: 154, column: 13, scope: !1082, inlinedAt: !1452)
!1481 = !DILocation(line: 148, column: 27, scope: !1104, inlinedAt: !1452)
!1482 = !DILocation(line: 13, column: 5, scope: !585, inlinedAt: !1483)
!1483 = distinct !DILocation(line: 256, column: 10, scope: !1330)
!1484 = !DILocation(line: 14, column: 5, scope: !585, inlinedAt: !1483)
!1485 = !DILocation(line: 13, column: 21, scope: !585, inlinedAt: !1483)
!1486 = !DILocation(line: 14, column: 20, scope: !585, inlinedAt: !1483)
!1487 = !DILocation(line: 16, column: 12, scope: !585, inlinedAt: !1483)
!1488 = !DILocation(line: 15, column: 9, scope: !585, inlinedAt: !1483)
!1489 = !DILocation(line: 17, column: 14, scope: !615, inlinedAt: !1483)
!1490 = !DILocation(line: 17, column: 9, scope: !585, inlinedAt: !1483)
!1491 = !DILocation(line: 17, column: 20, scope: !618, inlinedAt: !1483)
!1492 = !DILocation(line: 18, column: 15, scope: !585, inlinedAt: !1483)
!1493 = !DILocation(line: 18, column: 12, scope: !585, inlinedAt: !1483)
!1494 = !DILocation(line: 18, column: 27, scope: !585, inlinedAt: !1483)
!1495 = !DILocation(line: 18, column: 24, scope: !585, inlinedAt: !1483)
!1496 = !DILocation(line: 18, column: 34, scope: !585, inlinedAt: !1483)
!1497 = !DILocation(line: 18, column: 22, scope: !585, inlinedAt: !1483)
!1498 = !DILocation(line: 19, column: 1, scope: !585, inlinedAt: !1483)
!1499 = !DILocation(line: 220, column: 18, scope: !1330)
!1500 = !DILocation(line: 258, column: 10, scope: !1330)
!1501 = !DILocation(line: 258, column: 50, scope: !1330)
!1502 = !DILocation(line: 258, column: 2, scope: !1330)
!1503 = !DILocation(line: 260, column: 2, scope: !1330)
!1504 = !DILocation(line: 262, column: 2, scope: !1330)
!1505 = !DILocation(line: 263, column: 2, scope: !1330)
!1506 = !DILocation(line: 264, column: 2, scope: !1330)
!1507 = !DILocation(line: 265, column: 2, scope: !1330)
!1508 = !DILocation(line: 266, column: 2, scope: !1330)
!1509 = !DILocation(line: 267, column: 2, scope: !1330)
!1510 = !DILocation(line: 268, column: 2, scope: !1330)
!1511 = !DILocation(line: 271, column: 1, scope: !1512)
!1512 = !DILexicalBlockFile(scope: !1330, file: !3, discriminator: 1)
