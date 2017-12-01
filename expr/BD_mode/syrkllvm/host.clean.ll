; ModuleID = 'syrk.cu'
source_filename = "syrk.cu"
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
@.str.3 = private unnamed_addr constant [16 x i8] c"%d, %d, %d, %d\0A\00", align 1
@stdout = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.4 = private unnamed_addr constant [22 x i8] c"GPU Runtime: %0.6lfs\0A\00", align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.6lf\0A\00", align 1
@.str.6 = private unnamed_addr constant [22 x i8] c"CPU Runtime: %0.6lfs\0A\00", align 1

; Function Attrs: nounwind uwtable
define double @_Z7rtclockv() local_unnamed_addr #0 !dbg !584 {
entry:
  %Tzp = alloca %struct.timezone, align 4
  %Tp = alloca %struct.timeval, align 8
  %0 = bitcast %struct.timezone* %Tzp to i8*, !dbg !605
  call void @llvm.lifetime.start(i64 8, i8* nonnull %0) #8, !dbg !605
  %1 = bitcast %struct.timeval* %Tp to i8*, !dbg !606
  call void @llvm.lifetime.start(i64 16, i8* nonnull %1) #8, !dbg !606
  tail call void @llvm.dbg.value(metadata %struct.timezone* %Tzp, i64 0, metadata !589, metadata !607), !dbg !608
  tail call void @llvm.dbg.value(metadata %struct.timeval* %Tp, i64 0, metadata !595, metadata !607), !dbg !609
  %call = call i32 @gettimeofday(%struct.timeval* nonnull %Tp, %struct.timezone* nonnull %Tzp) #8, !dbg !610
  tail call void @llvm.dbg.value(metadata i32 %call, i64 0, metadata !604, metadata !611), !dbg !612
  %cmp = icmp eq i32 %call, 0, !dbg !613
  br i1 %cmp, label %if.end, label %if.then, !dbg !615

if.then:                                          ; preds = %entry
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str, i64 0, i64 0), i32 %call), !dbg !616
  br label %if.end, !dbg !616

if.end:                                           ; preds = %entry, %if.then
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %Tp, i64 0, i32 0, !dbg !618
  %2 = load i64, i64* %tv_sec, align 8, !dbg !618, !tbaa !619
  %conv = sitofp i64 %2 to double, !dbg !624
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %Tp, i64 0, i32 1, !dbg !625
  %3 = load i64, i64* %tv_usec, align 8, !dbg !625, !tbaa !626
  %conv2 = sitofp i64 %3 to double, !dbg !627
  %mul = fmul double %conv2, 1.000000e-06, !dbg !628
  %add = fadd double %mul, %conv, !dbg !629
  call void @llvm.lifetime.end(i64 16, i8* nonnull %1) #8, !dbg !630
  call void @llvm.lifetime.end(i64 8, i8* nonnull %0) #8, !dbg !630
  ret double %add, !dbg !631
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
define float @_Z6absValf(float %a) local_unnamed_addr #3 !dbg !632 {
entry:
  tail call void @llvm.dbg.value(metadata float %a, i64 0, metadata !634, metadata !611), !dbg !635
  %cmp = fcmp olt float %a, 0.000000e+00, !dbg !636
  %mul = fsub float -0.000000e+00, %a, !dbg !638
  %retval.0 = select i1 %cmp, float %mul, float %a, !dbg !640
  ret float %retval.0, !dbg !641
}

; Function Attrs: nounwind readnone uwtable
define float @_Z11percentDiffdd(double %val1, double %val2) local_unnamed_addr #3 !dbg !642 {
entry:
  tail call void @llvm.dbg.value(metadata double %val1, i64 0, metadata !646, metadata !611), !dbg !648
  tail call void @llvm.dbg.value(metadata double %val2, i64 0, metadata !647, metadata !611), !dbg !649
  %conv = fptrunc double %val1 to float, !dbg !650
  tail call void @llvm.dbg.value(metadata float %conv, i64 0, metadata !634, metadata !611), !dbg !652
  %cmp.i = fcmp olt float %conv, 0.000000e+00, !dbg !654
  %mul.i = fsub float -0.000000e+00, %conv, !dbg !655
  %retval.0.i = select i1 %cmp.i, float %mul.i, float %conv, !dbg !656
  %conv1 = fpext float %retval.0.i to double, !dbg !657
  %cmp = fcmp olt double %conv1, 1.000000e-02, !dbg !658
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !659

land.lhs.true:                                    ; preds = %entry
  %conv2 = fptrunc double %val2 to float, !dbg !660
  tail call void @llvm.dbg.value(metadata float %conv2, i64 0, metadata !634, metadata !611), !dbg !662
  %cmp.i23 = fcmp olt float %conv2, 0.000000e+00, !dbg !664
  %mul.i24 = fsub float -0.000000e+00, %conv2, !dbg !665
  %retval.0.i25 = select i1 %cmp.i23, float %mul.i24, float %conv2, !dbg !666
  %conv4 = fpext float %retval.0.i25 to double, !dbg !667
  %cmp5 = fcmp olt double %conv4, 1.000000e-02, !dbg !668
  br i1 %cmp5, label %return, label %if.else, !dbg !669

if.else:                                          ; preds = %land.lhs.true, %entry
  %sub = fsub double %val1, %val2, !dbg !671
  %conv6 = fptrunc double %sub to float, !dbg !673
  tail call void @llvm.dbg.value(metadata float %conv6, i64 0, metadata !634, metadata !611), !dbg !674
  %cmp.i20 = fcmp olt float %conv6, 0.000000e+00, !dbg !676
  %mul.i21 = fsub float -0.000000e+00, %conv6, !dbg !677
  %retval.0.i22 = select i1 %cmp.i20, float %mul.i21, float %conv6, !dbg !678
  %add = fadd double %val1, 0x3E45798EE0000000, !dbg !679
  %conv8 = fptrunc double %add to float, !dbg !680
  tail call void @llvm.dbg.value(metadata float %conv8, i64 0, metadata !634, metadata !611), !dbg !681
  %cmp.i17 = fcmp olt float %conv8, 0.000000e+00, !dbg !684
  %mul.i18 = fsub float -0.000000e+00, %conv8, !dbg !685
  %retval.0.i19 = select i1 %cmp.i17, float %mul.i18, float %conv8, !dbg !686
  %div = fdiv float %retval.0.i22, %retval.0.i19, !dbg !687
  tail call void @llvm.dbg.value(metadata float %div, i64 0, metadata !634, metadata !611), !dbg !688
  %cmp.i14 = fcmp olt float %div, 0.000000e+00, !dbg !691
  %mul.i15 = fsub float -0.000000e+00, %div, !dbg !692
  %retval.0.i16 = select i1 %cmp.i14, float %mul.i15, float %div, !dbg !693
  %mul = fmul float %retval.0.i16, 1.000000e+02, !dbg !694
  br label %return, !dbg !695

return:                                           ; preds = %land.lhs.true, %if.else
  %retval.0 = phi float [ %mul, %if.else ], [ 0.000000e+00, %land.lhs.true ]
  ret float %retval.0, !dbg !696
}

; Function Attrs: nounwind uwtable
define void @_Z11init_arraysPfS_(float* nocapture %A, float* nocapture %C) local_unnamed_addr #0 !dbg !697 {
entry:
  tail call void @llvm.dbg.value(metadata float* %A, i64 0, metadata !701, metadata !611), !dbg !705
  tail call void @llvm.dbg.value(metadata float* %C, i64 0, metadata !702, metadata !611), !dbg !706
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !703, metadata !611), !dbg !707
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !703, metadata !611), !dbg !707
  br label %for.cond1.preheader, !dbg !708

for.cond1.preheader:                              ; preds = %for.inc21, %entry
  %indvars.iv45 = phi i64 [ 0, %entry ], [ %indvars.iv.next46, %for.inc21 ]
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !704, metadata !611), !dbg !711
  %0 = trunc i64 %indvars.iv45 to i32
  %conv = sitofp i32 %0 to float
  %1 = shl i64 %indvars.iv45, 9
  %broadcast.splatinsert72 = insertelement <4 x float> undef, float %conv, i32 0, !dbg !712
  %broadcast.splat73 = shufflevector <4 x float> %broadcast.splatinsert72, <4 x float> undef, <4 x i32> zeroinitializer, !dbg !712
  br label %vector.body55, !dbg !712

vector.body55:                                    ; preds = %vector.body55, %for.cond1.preheader
  %index60 = phi i64 [ 0, %for.cond1.preheader ], [ %index.next61.1, %vector.body55 ], !dbg !717
  %vec.ind68 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %for.cond1.preheader ], [ %vec.ind.next71.1, %vector.body55 ]
  %step.add69 = add <4 x i32> %vec.ind68, <i32 4, i32 4, i32 4, i32 4>, !dbg !717
  %2 = sitofp <4 x i32> %vec.ind68 to <4 x float>, !dbg !720
  %3 = sitofp <4 x i32> %step.add69 to <4 x float>, !dbg !720
  %4 = fmul <4 x float> %broadcast.splat73, %2, !dbg !722
  %5 = fmul <4 x float> %broadcast.splat73, %3, !dbg !722
  %6 = fmul <4 x float> %4, <float 1.953125e-03, float 1.953125e-03, float 1.953125e-03, float 1.953125e-03>, !dbg !723
  %7 = fmul <4 x float> %5, <float 1.953125e-03, float 1.953125e-03, float 1.953125e-03, float 1.953125e-03>, !dbg !723
  %8 = add nuw nsw i64 %index60, %1, !dbg !724
  %9 = getelementptr inbounds float, float* %A, i64 %8, !dbg !725
  %10 = bitcast float* %9 to <4 x float>*, !dbg !726
  store <4 x float> %6, <4 x float>* %10, align 4, !dbg !726, !tbaa !727
  %11 = getelementptr float, float* %9, i64 4, !dbg !726
  %12 = bitcast float* %11 to <4 x float>*, !dbg !726
  store <4 x float> %7, <4 x float>* %12, align 4, !dbg !726, !tbaa !727
  %index.next61 = or i64 %index60, 8, !dbg !717
  %vec.ind.next71 = add <4 x i32> %vec.ind68, <i32 8, i32 8, i32 8, i32 8>, !dbg !717
  %step.add69.1 = add <4 x i32> %vec.ind68, <i32 12, i32 12, i32 12, i32 12>, !dbg !717
  %13 = sitofp <4 x i32> %vec.ind.next71 to <4 x float>, !dbg !720
  %14 = sitofp <4 x i32> %step.add69.1 to <4 x float>, !dbg !720
  %15 = fmul <4 x float> %broadcast.splat73, %13, !dbg !722
  %16 = fmul <4 x float> %broadcast.splat73, %14, !dbg !722
  %17 = fmul <4 x float> %15, <float 1.953125e-03, float 1.953125e-03, float 1.953125e-03, float 1.953125e-03>, !dbg !723
  %18 = fmul <4 x float> %16, <float 1.953125e-03, float 1.953125e-03, float 1.953125e-03, float 1.953125e-03>, !dbg !723
  %19 = add nuw nsw i64 %index.next61, %1, !dbg !724
  %20 = getelementptr inbounds float, float* %A, i64 %19, !dbg !725
  %21 = bitcast float* %20 to <4 x float>*, !dbg !726
  store <4 x float> %17, <4 x float>* %21, align 4, !dbg !726, !tbaa !727
  %22 = getelementptr float, float* %20, i64 4, !dbg !726
  %23 = bitcast float* %22 to <4 x float>*, !dbg !726
  store <4 x float> %18, <4 x float>* %23, align 4, !dbg !726, !tbaa !727
  %index.next61.1 = add nsw i64 %index60, 16, !dbg !717
  %vec.ind.next71.1 = add <4 x i32> %vec.ind68, <i32 16, i32 16, i32 16, i32 16>, !dbg !717
  %24 = icmp eq i64 %index.next61.1, 512, !dbg !717
  br i1 %24, label %vector.ph, label %vector.body55, !dbg !717, !llvm.loop !729

vector.ph:                                        ; preds = %vector.body55
  %broadcast.splatinsert = insertelement <4 x float> undef, float %conv, i32 0, !dbg !734
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> undef, <4 x i32> zeroinitializer, !dbg !734
  br label %vector.body, !dbg !734

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ], !dbg !738
  %vec.ind51 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next54, %vector.body ]
  %step.add52 = add <4 x i32> %vec.ind51, <i32 4, i32 4, i32 4, i32 4>, !dbg !738
  %25 = sitofp <4 x i32> %vec.ind51 to <4 x float>, !dbg !734
  %26 = sitofp <4 x i32> %step.add52 to <4 x float>, !dbg !734
  %27 = fmul <4 x float> %broadcast.splat, %25, !dbg !740
  %28 = fmul <4 x float> %broadcast.splat, %26, !dbg !740
  %29 = fadd <4 x float> %27, <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>, !dbg !741
  %30 = fadd <4 x float> %28, <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>, !dbg !741
  %31 = fmul <4 x float> %29, <float 1.953125e-03, float 1.953125e-03, float 1.953125e-03, float 1.953125e-03>, !dbg !742
  %32 = fmul <4 x float> %30, <float 1.953125e-03, float 1.953125e-03, float 1.953125e-03, float 1.953125e-03>, !dbg !742
  %33 = add nuw nsw i64 %index, %1, !dbg !743
  %34 = getelementptr inbounds float, float* %C, i64 %33, !dbg !744
  %35 = bitcast float* %34 to <4 x float>*, !dbg !745
  store <4 x float> %31, <4 x float>* %35, align 4, !dbg !745, !tbaa !727
  %36 = getelementptr float, float* %34, i64 4, !dbg !745
  %37 = bitcast float* %36 to <4 x float>*, !dbg !745
  store <4 x float> %32, <4 x float>* %37, align 4, !dbg !745, !tbaa !727
  %index.next = add i64 %index, 8, !dbg !738
  %vec.ind.next54 = add <4 x i32> %vec.ind51, <i32 8, i32 8, i32 8, i32 8>, !dbg !738
  %38 = icmp eq i64 %index.next, 512, !dbg !738
  br i1 %38, label %for.inc21, label %vector.body, !dbg !738, !llvm.loop !746

for.inc21:                                        ; preds = %vector.body
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1, !dbg !749
  %exitcond49 = icmp eq i64 %indvars.iv.next46, 512, !dbg !751
  br i1 %exitcond49, label %for.end23, label %for.cond1.preheader, !dbg !708, !llvm.loop !753

for.end23:                                        ; preds = %for.inc21
  ret void, !dbg !756
}

; Function Attrs: nounwind uwtable
define void @_Z4syrkPfS_(float* nocapture readonly %A, float* nocapture %C) local_unnamed_addr #0 !dbg !757 {
entry:
  tail call void @llvm.dbg.value(metadata float* %A, i64 0, metadata !759, metadata !611), !dbg !764
  tail call void @llvm.dbg.value(metadata float* %C, i64 0, metadata !760, metadata !611), !dbg !765
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !761, metadata !611), !dbg !766
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !761, metadata !611), !dbg !766
  br label %for.cond1.preheader, !dbg !767

for.cond1.preheader:                              ; preds = %for.inc5, %entry
  %indvars.iv81 = phi i64 [ 0, %entry ], [ %indvars.iv.next82, %for.inc5 ]
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !762, metadata !611), !dbg !770
  %0 = shl i64 %indvars.iv81, 9
  br label %vector.body, !dbg !771

vector.body:                                      ; preds = %vector.body, %for.cond1.preheader
  %index = phi i64 [ 0, %for.cond1.preheader ], [ %index.next.1, %vector.body ], !dbg !776
  %1 = add nuw nsw i64 %index, %0, !dbg !779
  %2 = getelementptr inbounds float, float* %C, i64 %1, !dbg !781
  %3 = bitcast float* %2 to <4 x float>*, !dbg !782
  %wide.load = load <4 x float>, <4 x float>* %3, align 4, !dbg !782, !tbaa !727
  %4 = getelementptr float, float* %2, i64 4, !dbg !782
  %5 = bitcast float* %4 to <4 x float>*, !dbg !782
  %wide.load86 = load <4 x float>, <4 x float>* %5, align 4, !dbg !782, !tbaa !727
  %6 = fmul <4 x float> %wide.load, <float 4.546000e+03, float 4.546000e+03, float 4.546000e+03, float 4.546000e+03>, !dbg !782
  %7 = fmul <4 x float> %wide.load86, <float 4.546000e+03, float 4.546000e+03, float 4.546000e+03, float 4.546000e+03>, !dbg !782
  %8 = bitcast float* %2 to <4 x float>*, !dbg !782
  store <4 x float> %6, <4 x float>* %8, align 4, !dbg !782, !tbaa !727
  %9 = bitcast float* %4 to <4 x float>*, !dbg !782
  store <4 x float> %7, <4 x float>* %9, align 4, !dbg !782, !tbaa !727
  %index.next = or i64 %index, 8, !dbg !776
  %10 = add nuw nsw i64 %index.next, %0, !dbg !779
  %11 = getelementptr inbounds float, float* %C, i64 %10, !dbg !781
  %12 = bitcast float* %11 to <4 x float>*, !dbg !782
  %wide.load.1 = load <4 x float>, <4 x float>* %12, align 4, !dbg !782, !tbaa !727
  %13 = getelementptr float, float* %11, i64 4, !dbg !782
  %14 = bitcast float* %13 to <4 x float>*, !dbg !782
  %wide.load86.1 = load <4 x float>, <4 x float>* %14, align 4, !dbg !782, !tbaa !727
  %15 = fmul <4 x float> %wide.load.1, <float 4.546000e+03, float 4.546000e+03, float 4.546000e+03, float 4.546000e+03>, !dbg !782
  %16 = fmul <4 x float> %wide.load86.1, <float 4.546000e+03, float 4.546000e+03, float 4.546000e+03, float 4.546000e+03>, !dbg !782
  %17 = bitcast float* %11 to <4 x float>*, !dbg !782
  store <4 x float> %15, <4 x float>* %17, align 4, !dbg !782, !tbaa !727
  %18 = bitcast float* %13 to <4 x float>*, !dbg !782
  store <4 x float> %16, <4 x float>* %18, align 4, !dbg !782, !tbaa !727
  %index.next.1 = add nsw i64 %index, 16, !dbg !776
  %19 = icmp eq i64 %index.next.1, 512, !dbg !776
  br i1 %19, label %for.inc5, label %vector.body, !dbg !776, !llvm.loop !783

for.inc5:                                         ; preds = %vector.body
  %indvars.iv.next82 = add nuw nsw i64 %indvars.iv81, 1, !dbg !786
  %exitcond84 = icmp eq i64 %indvars.iv.next82, 512, !dbg !788
  br i1 %exitcond84, label %for.cond11.preheader.preheader, label %for.cond1.preheader, !dbg !767, !llvm.loop !790

for.cond11.preheader.preheader:                   ; preds = %for.inc5
  br label %for.cond11.preheader, !dbg !770

for.cond11.preheader:                             ; preds = %for.cond11.preheader.preheader, %for.inc38
  %indvars.iv73 = phi i64 [ %indvars.iv.next74, %for.inc38 ], [ 0, %for.cond11.preheader.preheader ]
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !762, metadata !611), !dbg !770
  %20 = shl nsw i64 %indvars.iv73, 9
  br label %for.cond14.preheader, !dbg !793

for.cond14.preheader:                             ; preds = %for.inc35, %for.cond11.preheader
  %indvars.iv68 = phi i64 [ 0, %for.cond11.preheader ], [ %indvars.iv.next69, %for.inc35 ]
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !763, metadata !611), !dbg !799
  %21 = shl i64 %indvars.iv68, 9
  %22 = add nuw nsw i64 %indvars.iv68, %20
  %arrayidx30 = getelementptr inbounds float, float* %C, i64 %22
  %.pre = load float, float* %arrayidx30, align 4, !tbaa !727
  br label %for.body16, !dbg !800

for.body16:                                       ; preds = %for.body16, %for.cond14.preheader
  %23 = phi float [ %.pre, %for.cond14.preheader ], [ %add31.1, %for.body16 ], !dbg !805
  %indvars.iv = phi i64 [ 0, %for.cond14.preheader ], [ %indvars.iv.next.1, %for.body16 ]
  %24 = add nuw nsw i64 %indvars.iv, %20, !dbg !808
  %arrayidx20 = getelementptr inbounds float, float* %A, i64 %24, !dbg !809
  %25 = load float, float* %arrayidx20, align 4, !dbg !809, !tbaa !727
  %mul21 = fmul float %25, 1.243500e+04, !dbg !810
  %26 = add nuw nsw i64 %indvars.iv, %21, !dbg !811
  %arrayidx25 = getelementptr inbounds float, float* %A, i64 %26, !dbg !812
  %27 = load float, float* %arrayidx25, align 4, !dbg !812, !tbaa !727
  %mul26 = fmul float %mul21, %27, !dbg !813
  %add31 = fadd float %23, %mul26, !dbg !805
  store float %add31, float* %arrayidx30, align 4, !dbg !805, !tbaa !727
  %indvars.iv.next = or i64 %indvars.iv, 1, !dbg !814
  %28 = add nuw nsw i64 %indvars.iv.next, %20, !dbg !808
  %arrayidx20.1 = getelementptr inbounds float, float* %A, i64 %28, !dbg !809
  %29 = load float, float* %arrayidx20.1, align 4, !dbg !809, !tbaa !727
  %mul21.1 = fmul float %29, 1.243500e+04, !dbg !810
  %30 = add nuw nsw i64 %indvars.iv.next, %21, !dbg !811
  %arrayidx25.1 = getelementptr inbounds float, float* %A, i64 %30, !dbg !812
  %31 = load float, float* %arrayidx25.1, align 4, !dbg !812, !tbaa !727
  %mul26.1 = fmul float %mul21.1, %31, !dbg !813
  %add31.1 = fadd float %add31, %mul26.1, !dbg !805
  store float %add31.1, float* %arrayidx30, align 4, !dbg !805, !tbaa !727
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2, !dbg !814
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 512, !dbg !816
  br i1 %exitcond.1, label %for.inc35, label %for.body16, !dbg !800, !llvm.loop !818

for.inc35:                                        ; preds = %for.body16
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1, !dbg !821
  %exitcond72 = icmp eq i64 %indvars.iv.next69, 512, !dbg !823
  br i1 %exitcond72, label %for.inc38, label %for.cond14.preheader, !dbg !793, !llvm.loop !825

for.inc38:                                        ; preds = %for.inc35
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1, !dbg !828
  %exitcond76 = icmp eq i64 %indvars.iv.next74, 512, !dbg !830
  br i1 %exitcond76, label %for.end40, label %for.cond11.preheader, !dbg !832, !llvm.loop !834

for.end40:                                        ; preds = %for.inc38
  ret void, !dbg !837
}

; Function Attrs: nounwind uwtable
define void @_Z14compareResultsPfS_(float* nocapture readonly %C, float* nocapture readonly %C_outputFromGpu) local_unnamed_addr #0 !dbg !838 {
entry:
  tail call void @llvm.dbg.value(metadata float* %C, i64 0, metadata !840, metadata !611), !dbg !845
  tail call void @llvm.dbg.value(metadata float* %C_outputFromGpu, i64 0, metadata !841, metadata !611), !dbg !846
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !844, metadata !611), !dbg !847
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !842, metadata !611), !dbg !848
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !844, metadata !611), !dbg !847
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !842, metadata !611), !dbg !848
  br label %for.cond1.preheader, !dbg !849

for.cond1.preheader:                              ; preds = %middle.block, %entry
  %indvars.iv31 = phi i64 [ 0, %entry ], [ %indvars.iv.next32, %middle.block ]
  %fail.029 = phi i32 [ 0, %entry ], [ %70, %middle.block ]
  tail call void @llvm.dbg.value(metadata i32 %fail.029, i64 0, metadata !844, metadata !611), !dbg !847
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !843, metadata !611), !dbg !852
  %0 = shl i64 %indvars.iv31, 9
  %1 = insertelement <4 x i32> <i32 undef, i32 0, i32 0, i32 0>, i32 %fail.029, i32 0, !dbg !853
  br label %vector.body, !dbg !853

vector.body:                                      ; preds = %vector.body, %for.cond1.preheader
  %index = phi i64 [ 0, %for.cond1.preheader ], [ %index.next, %vector.body ], !dbg !858
  %vec.phi = phi <4 x i32> [ %1, %for.cond1.preheader ], [ %67, %vector.body ]
  %vec.phi36 = phi <4 x i32> [ zeroinitializer, %for.cond1.preheader ], [ %68, %vector.body ]
  %2 = add nuw nsw i64 %index, %0, !dbg !861
  %3 = getelementptr inbounds float, float* %C, i64 %2, !dbg !864
  %4 = bitcast float* %3 to <4 x float>*, !dbg !864
  %wide.load = load <4 x float>, <4 x float>* %4, align 4, !dbg !864, !tbaa !727
  %5 = getelementptr float, float* %3, i64 4, !dbg !864
  %6 = bitcast float* %5 to <4 x float>*, !dbg !864
  %wide.load37 = load <4 x float>, <4 x float>* %6, align 4, !dbg !864, !tbaa !727
  %7 = getelementptr inbounds float, float* %C_outputFromGpu, i64 %2, !dbg !865
  %8 = bitcast float* %7 to <4 x float>*, !dbg !865
  %wide.load38 = load <4 x float>, <4 x float>* %8, align 4, !dbg !865, !tbaa !727
  %9 = getelementptr float, float* %7, i64 4, !dbg !865
  %10 = bitcast float* %9 to <4 x float>*, !dbg !865
  %wide.load39 = load <4 x float>, <4 x float>* %10, align 4, !dbg !865, !tbaa !727
  %11 = fcmp olt <4 x float> %wide.load, zeroinitializer, !dbg !866
  %12 = fcmp olt <4 x float> %wide.load37, zeroinitializer, !dbg !866
  %13 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %wide.load, !dbg !869
  %14 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %wide.load37, !dbg !869
  %15 = select <4 x i1> %11, <4 x float> %13, <4 x float> %wide.load, !dbg !870
  %16 = select <4 x i1> %12, <4 x float> %14, <4 x float> %wide.load37, !dbg !870
  %17 = fpext <4 x float> %15 to <4 x double>, !dbg !871
  %18 = fpext <4 x float> %16 to <4 x double>, !dbg !871
  %19 = fcmp olt <4 x double> %17, <double 1.000000e-02, double 1.000000e-02, double 1.000000e-02, double 1.000000e-02>, !dbg !872
  %20 = fcmp olt <4 x double> %18, <double 1.000000e-02, double 1.000000e-02, double 1.000000e-02, double 1.000000e-02>, !dbg !872
  %21 = fcmp olt <4 x float> %wide.load38, zeroinitializer, !dbg !873
  %22 = fcmp olt <4 x float> %wide.load39, zeroinitializer, !dbg !873
  %23 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %wide.load38, !dbg !875
  %24 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %wide.load39, !dbg !875
  %25 = select <4 x i1> %21, <4 x float> %23, <4 x float> %wide.load38, !dbg !876
  %26 = select <4 x i1> %22, <4 x float> %24, <4 x float> %wide.load39, !dbg !876
  %27 = fpext <4 x float> %25 to <4 x double>, !dbg !877
  %28 = fpext <4 x float> %26 to <4 x double>, !dbg !877
  %29 = fcmp olt <4 x double> %27, <double 1.000000e-02, double 1.000000e-02, double 1.000000e-02, double 1.000000e-02>, !dbg !878
  %30 = fcmp olt <4 x double> %28, <double 1.000000e-02, double 1.000000e-02, double 1.000000e-02, double 1.000000e-02>, !dbg !878
  %31 = fsub <4 x float> %wide.load, %wide.load38, !dbg !879
  %32 = fsub <4 x float> %wide.load37, %wide.load39, !dbg !879
  %33 = fcmp olt <4 x float> %31, zeroinitializer, !dbg !880
  %34 = fcmp olt <4 x float> %32, zeroinitializer, !dbg !880
  %35 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %31, !dbg !882
  %36 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %32, !dbg !882
  %37 = select <4 x i1> %33, <4 x float> %35, <4 x float> %31, !dbg !883
  %38 = select <4 x i1> %34, <4 x float> %36, <4 x float> %32, !dbg !883
  %39 = fadd <4 x float> %wide.load, <float 0x3E45798EE0000000, float 0x3E45798EE0000000, float 0x3E45798EE0000000, float 0x3E45798EE0000000>, !dbg !884
  %40 = fadd <4 x float> %wide.load37, <float 0x3E45798EE0000000, float 0x3E45798EE0000000, float 0x3E45798EE0000000, float 0x3E45798EE0000000>, !dbg !884
  %41 = fcmp olt <4 x float> %39, zeroinitializer, !dbg !885
  %42 = fcmp olt <4 x float> %40, zeroinitializer, !dbg !885
  %43 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %39, !dbg !887
  %44 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %40, !dbg !887
  %45 = select <4 x i1> %41, <4 x float> %43, <4 x float> %39, !dbg !888
  %46 = select <4 x i1> %42, <4 x float> %44, <4 x float> %40, !dbg !888
  %47 = fdiv <4 x float> %37, %45, !dbg !889
  %48 = fdiv <4 x float> %38, %46, !dbg !889
  %49 = fcmp olt <4 x float> %47, zeroinitializer, !dbg !890
  %50 = fcmp olt <4 x float> %48, zeroinitializer, !dbg !890
  %51 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %47, !dbg !892
  %52 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %48, !dbg !892
  %53 = select <4 x i1> %49, <4 x float> %51, <4 x float> %47, !dbg !893
  %54 = select <4 x i1> %50, <4 x float> %52, <4 x float> %48, !dbg !893
  %55 = fmul <4 x float> %53, <float 1.000000e+02, float 1.000000e+02, float 1.000000e+02, float 1.000000e+02>, !dbg !894
  %56 = fmul <4 x float> %54, <float 1.000000e+02, float 1.000000e+02, float 1.000000e+02, float 1.000000e+02>, !dbg !894
  %57 = and <4 x i1> %29, %19
  %58 = and <4 x i1> %30, %20
  %59 = fpext <4 x float> %55 to <4 x double>, !dbg !895
  %60 = select <4 x i1> %57, <4 x double> zeroinitializer, <4 x double> %59, !dbg !895
  %61 = fpext <4 x float> %56 to <4 x double>, !dbg !895
  %62 = select <4 x i1> %58, <4 x double> zeroinitializer, <4 x double> %61, !dbg !895
  %63 = fcmp ogt <4 x double> %60, <double 5.000000e-03, double 5.000000e-03, double 5.000000e-03, double 5.000000e-03>, !dbg !896
  %64 = fcmp ogt <4 x double> %62, <double 5.000000e-03, double 5.000000e-03, double 5.000000e-03, double 5.000000e-03>, !dbg !896
  %65 = zext <4 x i1> %63 to <4 x i32>, !dbg !897
  %66 = zext <4 x i1> %64 to <4 x i32>, !dbg !897
  %67 = add nsw <4 x i32> %vec.phi, %65, !dbg !897
  %68 = add nsw <4 x i32> %vec.phi36, %66, !dbg !897
  %index.next = add i64 %index, 8, !dbg !858
  %69 = icmp eq i64 %index.next, 512, !dbg !858
  br i1 %69, label %middle.block, label %vector.body, !dbg !858, !llvm.loop !898

middle.block:                                     ; preds = %vector.body
  %bin.rdx = add <4 x i32> %68, %67, !dbg !897
  %rdx.shuf = shufflevector <4 x i32> %bin.rdx, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>, !dbg !897
  %bin.rdx41 = add <4 x i32> %bin.rdx, %rdx.shuf, !dbg !897
  %rdx.shuf42 = shufflevector <4 x i32> %bin.rdx41, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>, !dbg !897
  %bin.rdx43 = add <4 x i32> %bin.rdx41, %rdx.shuf42, !dbg !897
  %70 = extractelement <4 x i32> %bin.rdx43, i32 0, !dbg !897
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1, !dbg !901
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !844, metadata !611), !dbg !847
  %exitcond34 = icmp eq i64 %indvars.iv.next32, 512, !dbg !903
  br i1 %exitcond34, label %for.end14, label %for.cond1.preheader, !dbg !849, !llvm.loop !905

for.end14:                                        ; preds = %middle.block
  %call15 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([74 x i8], [74 x i8]* @.str.1, i64 0, i64 0), double 5.000000e-03, i32 %70), !dbg !908
  ret void, !dbg !909
}

; Function Attrs: uwtable
define void @_Z13GPU_argv_initv() local_unnamed_addr #4 !dbg !910 {
entry:
  %deviceProp = alloca %struct.cudaDeviceProp, align 8
  %0 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %deviceProp, i64 0, i32 0, i64 0, !dbg !986
  call void @llvm.lifetime.start(i64 632, i8* nonnull %0) #8, !dbg !986
  tail call void @llvm.dbg.value(metadata %struct.cudaDeviceProp* %deviceProp, i64 0, metadata !912, metadata !607), !dbg !987
  %call = call i32 @cudaGetDeviceProperties(%struct.cudaDeviceProp* nonnull %deviceProp, i32 0), !dbg !988
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.2, i64 0, i64 0), i32 0, i8* nonnull %0), !dbg !989
  %call2 = call i32 @cudaSetDevice(i32 0), !dbg !990
  call void @llvm.lifetime.end(i64 632, i8* nonnull %0) #8, !dbg !991
  ret void, !dbg !991
}

declare i32 @cudaGetDeviceProperties(%struct.cudaDeviceProp*, i32) local_unnamed_addr #5

declare i32 @cudaSetDevice(i32) local_unnamed_addr #5

; Function Attrs: uwtable
define void @_Z11syrk_kernelffPfS_(float %ALPHA, float %BETA, float* %a, float* %c) #4 !dbg !992 {
entry:
  %ALPHA.addr = alloca float, align 4
  %BETA.addr = alloca float, align 4
  %a.addr = alloca float*, align 8
  %c.addr = alloca float*, align 8
  tail call void @llvm.dbg.value(metadata float %ALPHA, i64 0, metadata !996, metadata !611), !dbg !1000
  store float %ALPHA, float* %ALPHA.addr, align 4, !tbaa !727
  tail call void @llvm.dbg.value(metadata float %BETA, i64 0, metadata !997, metadata !611), !dbg !1001
  store float %BETA, float* %BETA.addr, align 4, !tbaa !727
  tail call void @llvm.dbg.value(metadata float* %a, i64 0, metadata !998, metadata !611), !dbg !1002
  store float* %a, float** %a.addr, align 8, !tbaa !1003
  tail call void @llvm.dbg.value(metadata float* %c, i64 0, metadata !999, metadata !611), !dbg !1005
  store float* %c, float** %c.addr, align 8, !tbaa !1003
  %0 = bitcast float* %ALPHA.addr to i8*, !dbg !1006
  %1 = call i32 @cudaSetupArgument(i8* nonnull %0, i64 4, i64 0), !dbg !1006
  %2 = icmp eq i32 %1, 0, !dbg !1006
  br i1 %2, label %setup.next, label %setup.end, !dbg !1006

setup.next:                                       ; preds = %entry
  %3 = bitcast float* %BETA.addr to i8*, !dbg !1007
  %4 = call i32 @cudaSetupArgument(i8* nonnull %3, i64 4, i64 4), !dbg !1007
  %5 = icmp eq i32 %4, 0, !dbg !1007
  br i1 %5, label %setup.next1, label %setup.end, !dbg !1007

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast float** %a.addr to i8*, !dbg !1009
  %7 = call i32 @cudaSetupArgument(i8* nonnull %6, i64 8, i64 8), !dbg !1009
  %8 = icmp eq i32 %7, 0, !dbg !1009
  br i1 %8, label %setup.next2, label %setup.end, !dbg !1009

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast float** %c.addr to i8*, !dbg !1011
  %10 = call i32 @cudaSetupArgument(i8* nonnull %9, i64 8, i64 16), !dbg !1011
  %11 = icmp eq i32 %10, 0, !dbg !1011
  br i1 %11, label %setup.next3, label %setup.end, !dbg !1011

setup.next3:                                      ; preds = %setup.next2
  %12 = call i32 @cudaLaunch(i8* bitcast (void (float, float, float*, float*)* @_Z11syrk_kernelffPfS_ to i8*)), !dbg !1013
  br label %setup.end, !dbg !1013

setup.end:                                        ; preds = %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !1015
}

declare i32 @cudaSetupArgument(i8*, i64, i64) local_unnamed_addr

declare i32 @cudaLaunch(i8*) local_unnamed_addr

; Function Attrs: uwtable
define void @_Z8syrkCudaPfS_S_(float* %A, float* %C, float* %C_outputFromGpu) local_unnamed_addr #4 !dbg !1016 {
entry:
  %Tzp.i36 = alloca %struct.timezone, align 4
  %Tp.i37 = alloca %struct.timeval, align 8
  %Tzp.i = alloca %struct.timezone, align 4
  %Tp.i = alloca %struct.timeval, align 8
  %A_gpu = alloca float*, align 8
  %C_gpu = alloca float*, align 8
  tail call void @llvm.dbg.value(metadata float* %A, i64 0, metadata !1020, metadata !611), !dbg !1052
  tail call void @llvm.dbg.value(metadata float* %C, i64 0, metadata !1021, metadata !611), !dbg !1053
  tail call void @llvm.dbg.value(metadata float* %C_outputFromGpu, i64 0, metadata !1022, metadata !611), !dbg !1054
  %0 = bitcast float** %A_gpu to i8*, !dbg !1055
  call void @llvm.lifetime.start(i64 8, i8* nonnull %0) #8, !dbg !1055
  %1 = bitcast float** %C_gpu to i8*, !dbg !1056
  call void @llvm.lifetime.start(i64 8, i8* nonnull %1) #8, !dbg !1056
  %2 = bitcast float** %A_gpu to i8**, !dbg !1057
  %call = call i32 @cudaMalloc(i8** nonnull %2, i64 1048576), !dbg !1058
  %3 = bitcast float** %C_gpu to i8**, !dbg !1059
  %call1 = call i32 @cudaMalloc(i8** nonnull %3, i64 1048576), !dbg !1060
  %4 = load i8*, i8** %2, align 8, !dbg !1061, !tbaa !1003
  %5 = bitcast float* %A to i8*, !dbg !1062
  %call2 = call i32 @cudaMemcpy(i8* %4, i8* %5, i64 1048576, i32 1), !dbg !1063
  %6 = load i8*, i8** %3, align 8, !dbg !1064, !tbaa !1003
  %7 = bitcast float* %C to i8*, !dbg !1065
  %call3 = call i32 @cudaMemcpy(i8* %6, i8* %7, i64 1048576, i32 1), !dbg !1066
  call void @llvm.dbg.value(metadata %struct.dim3* undef, i64 0, metadata !1027, metadata !607), !dbg !1067
  call void @llvm.dbg.value(metadata %struct.dim3* undef, i64 0, metadata !1051, metadata !607), !dbg !1068
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0), i32 32, i32 8, i32 16, i32 64), !dbg !1069
  %call12 = call i32 @cudaDeviceSetCacheConfig(i32 2), !dbg !1070
  %call13 = call i32 @cudaDeviceSynchronize(), !dbg !1071
  %8 = bitcast %struct.timezone* %Tzp.i36 to i8*, !dbg !1072
  call void @llvm.lifetime.start(i64 8, i8* nonnull %8) #8, !dbg !1072
  %9 = bitcast %struct.timeval* %Tp.i37 to i8*, !dbg !1074
  call void @llvm.lifetime.start(i64 16, i8* nonnull %9) #8, !dbg !1074
  call void @llvm.dbg.value(metadata %struct.timezone* %Tzp.i36, i64 0, metadata !589, metadata !607) #8, !dbg !1075
  call void @llvm.dbg.value(metadata %struct.timeval* %Tp.i37, i64 0, metadata !595, metadata !607) #8, !dbg !1076
  %call.i38 = call i32 @gettimeofday(%struct.timeval* nonnull %Tp.i37, %struct.timezone* nonnull %Tzp.i36) #8, !dbg !1077
  call void @llvm.dbg.value(metadata i32 %call.i38, i64 0, metadata !604, metadata !611) #8, !dbg !1078
  %cmp.i39 = icmp eq i32 %call.i38, 0, !dbg !1079
  br i1 %cmp.i39, label %_Z7rtclockv.exit48, label %if.then.i41, !dbg !1080

if.then.i41:                                      ; preds = %entry
  %call1.i40 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str, i64 0, i64 0), i32 %call.i38) #8, !dbg !1081
  br label %_Z7rtclockv.exit48, !dbg !1081

_Z7rtclockv.exit48:                               ; preds = %entry, %if.then.i41
  %tv_sec.i42 = getelementptr inbounds %struct.timeval, %struct.timeval* %Tp.i37, i64 0, i32 0, !dbg !1082
  %10 = load i64, i64* %tv_sec.i42, align 8, !dbg !1082, !tbaa !619
  %conv.i43 = sitofp i64 %10 to double, !dbg !1083
  %tv_usec.i44 = getelementptr inbounds %struct.timeval, %struct.timeval* %Tp.i37, i64 0, i32 1, !dbg !1084
  %11 = load i64, i64* %tv_usec.i44, align 8, !dbg !1084, !tbaa !626
  %conv2.i45 = sitofp i64 %11 to double, !dbg !1085
  %mul.i46 = fmul double %conv2.i45, 1.000000e-06, !dbg !1086
  %add.i47 = fadd double %mul.i46, %conv.i43, !dbg !1087
  call void @llvm.lifetime.end(i64 16, i8* nonnull %9) #8, !dbg !1088
  call void @llvm.lifetime.end(i64 8, i8* nonnull %8) #8, !dbg !1088
  call void @llvm.dbg.value(metadata double %add.i47, i64 0, metadata !1023, metadata !611), !dbg !1089
  %call16 = call i32 @cudaConfigureCall(i64 274877906960, i32 1, i64 34359738400, i32 1, i64 0, %struct.CUstream_st* null), !dbg !1090
  %tobool = icmp eq i32 %call16, 0, !dbg !1090
  br i1 %tobool, label %kcall.configok, label %kcall.end, !dbg !1091

kcall.configok:                                   ; preds = %_Z7rtclockv.exit48
  %12 = load float*, float** %A_gpu, align 8, !dbg !1092, !tbaa !1003
  call void @llvm.dbg.value(metadata float* %12, i64 0, metadata !1025, metadata !611), !dbg !1094
  %13 = load float*, float** %C_gpu, align 8, !dbg !1095, !tbaa !1003
  call void @llvm.dbg.value(metadata float* %13, i64 0, metadata !1026, metadata !611), !dbg !1096
  call void @_Z11syrk_kernelffPfS_(float 1.243500e+04, float 4.546000e+03, float* %12, float* %13), !dbg !1097
  br label %kcall.end, !dbg !1097

kcall.end:                                        ; preds = %_Z7rtclockv.exit48, %kcall.configok
  %call17 = call i32 @cudaDeviceSynchronize(), !dbg !1098
  %14 = bitcast %struct.timezone* %Tzp.i to i8*, !dbg !1099
  call void @llvm.lifetime.start(i64 8, i8* nonnull %14) #8, !dbg !1099
  %15 = bitcast %struct.timeval* %Tp.i to i8*, !dbg !1101
  call void @llvm.lifetime.start(i64 16, i8* nonnull %15) #8, !dbg !1101
  call void @llvm.dbg.value(metadata %struct.timezone* %Tzp.i, i64 0, metadata !589, metadata !607) #8, !dbg !1102
  call void @llvm.dbg.value(metadata %struct.timeval* %Tp.i, i64 0, metadata !595, metadata !607) #8, !dbg !1103
  %call.i = call i32 @gettimeofday(%struct.timeval* nonnull %Tp.i, %struct.timezone* nonnull %Tzp.i) #8, !dbg !1104
  call void @llvm.dbg.value(metadata i32 %call.i, i64 0, metadata !604, metadata !611) #8, !dbg !1105
  %cmp.i = icmp eq i32 %call.i, 0, !dbg !1106
  br i1 %cmp.i, label %_Z7rtclockv.exit, label %if.then.i, !dbg !1107

if.then.i:                                        ; preds = %kcall.end
  %call1.i = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str, i64 0, i64 0), i32 %call.i) #8, !dbg !1108
  br label %_Z7rtclockv.exit, !dbg !1108

_Z7rtclockv.exit:                                 ; preds = %kcall.end, %if.then.i
  %tv_sec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %Tp.i, i64 0, i32 0, !dbg !1109
  %16 = load i64, i64* %tv_sec.i, align 8, !dbg !1109, !tbaa !619
  %conv.i = sitofp i64 %16 to double, !dbg !1110
  %tv_usec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %Tp.i, i64 0, i32 1, !dbg !1111
  %17 = load i64, i64* %tv_usec.i, align 8, !dbg !1111, !tbaa !626
  %conv2.i = sitofp i64 %17 to double, !dbg !1112
  %mul.i = fmul double %conv2.i, 1.000000e-06, !dbg !1113
  %add.i = fadd double %mul.i, %conv.i, !dbg !1114
  call void @llvm.lifetime.end(i64 16, i8* nonnull %15) #8, !dbg !1115
  call void @llvm.lifetime.end(i64 8, i8* nonnull %14) #8, !dbg !1115
  call void @llvm.dbg.value(metadata double %add.i, i64 0, metadata !1024, metadata !611), !dbg !1116
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !1117, !tbaa !1003
  %sub = fsub double %add.i, %add.i47, !dbg !1118
  %call19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.4, i64 0, i64 0), double %sub), !dbg !1119
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1120, !tbaa !1003
  %call21 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %sub) #9, !dbg !1121
  %20 = bitcast float* %C_outputFromGpu to i8*, !dbg !1122
  %21 = load i8*, i8** %3, align 8, !dbg !1123, !tbaa !1003
  %call22 = call i32 @cudaMemcpy(i8* %20, i8* %21, i64 1048576, i32 2), !dbg !1124
  %22 = load i8*, i8** %2, align 8, !dbg !1125, !tbaa !1003
  %call23 = call i32 @cudaFree(i8* %22), !dbg !1126
  %23 = load i8*, i8** %3, align 8, !dbg !1127, !tbaa !1003
  %call24 = call i32 @cudaFree(i8* %23), !dbg !1128
  call void @llvm.lifetime.end(i64 8, i8* nonnull %1) #8, !dbg !1129
  call void @llvm.lifetime.end(i64 8, i8* nonnull %0) #8, !dbg !1129
  ret void, !dbg !1129
}

declare i32 @cudaMalloc(i8**, i64) local_unnamed_addr #5

declare i32 @cudaMemcpy(i8*, i8*, i64, i32) local_unnamed_addr #5

declare i32 @cudaDeviceSetCacheConfig(i32) local_unnamed_addr #5

declare i32 @cudaDeviceSynchronize() local_unnamed_addr #5

declare i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) local_unnamed_addr #5

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

declare i32 @cudaFree(i8*) local_unnamed_addr #5

; Function Attrs: norecurse uwtable
define i32 @main() local_unnamed_addr #6 !dbg !1130 {
entry:
  %Tzp.i36 = alloca %struct.timezone, align 4
  %Tp.i37 = alloca %struct.timeval, align 8
  %Tzp.i = alloca %struct.timezone, align 4
  %Tp.i = alloca %struct.timeval, align 8
  %deviceProp.i = alloca %struct.cudaDeviceProp, align 8
  %call = tail call noalias i8* @malloc(i64 1048576) #8, !dbg !1137
  %0 = bitcast i8* %call to float*, !dbg !1138
  tail call void @llvm.dbg.value(metadata float* %0, i64 0, metadata !1134, metadata !611), !dbg !1139
  %call1 = tail call noalias i8* @malloc(i64 1048576) #8, !dbg !1140
  %1 = bitcast i8* %call1 to float*, !dbg !1141
  tail call void @llvm.dbg.value(metadata float* %1, i64 0, metadata !1135, metadata !611), !dbg !1142
  %call2 = tail call noalias i8* @malloc(i64 1048576) #8, !dbg !1143
  tail call void @llvm.dbg.value(metadata float* %41, i64 0, metadata !1136, metadata !611), !dbg !1144
  tail call void @llvm.dbg.value(metadata float* %0, i64 0, metadata !701, metadata !611), !dbg !1145
  tail call void @llvm.dbg.value(metadata float* %1, i64 0, metadata !702, metadata !611), !dbg !1147
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !703, metadata !611), !dbg !1148
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !703, metadata !611), !dbg !1148
  br label %for.cond1.preheader.i, !dbg !1149

for.cond1.preheader.i:                            ; preds = %for.inc21.i, %entry
  %indvars.iv45.i = phi i64 [ 0, %entry ], [ %indvars.iv.next46.i, %for.inc21.i ]
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !704, metadata !611), !dbg !1150
  %2 = trunc i64 %indvars.iv45.i to i32
  %conv.i = sitofp i32 %2 to float
  %3 = shl i64 %indvars.iv45.i, 9
  %broadcast.splatinsert71 = insertelement <4 x float> undef, float %conv.i, i32 0, !dbg !1151
  %broadcast.splat72 = shufflevector <4 x float> %broadcast.splatinsert71, <4 x float> undef, <4 x i32> zeroinitializer, !dbg !1151
  br label %vector.body54, !dbg !1151

vector.body54:                                    ; preds = %vector.body54, %for.cond1.preheader.i
  %index59 = phi i64 [ 0, %for.cond1.preheader.i ], [ %index.next60.1, %vector.body54 ], !dbg !1152
  %vec.ind67 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %for.cond1.preheader.i ], [ %vec.ind.next70.1, %vector.body54 ]
  %step.add68 = add <4 x i32> %vec.ind67, <i32 4, i32 4, i32 4, i32 4>, !dbg !1152
  %4 = sitofp <4 x i32> %vec.ind67 to <4 x float>, !dbg !1153
  %5 = sitofp <4 x i32> %step.add68 to <4 x float>, !dbg !1153
  %6 = fmul <4 x float> %broadcast.splat72, %4, !dbg !1154
  %7 = fmul <4 x float> %broadcast.splat72, %5, !dbg !1154
  %8 = fmul <4 x float> %6, <float 1.953125e-03, float 1.953125e-03, float 1.953125e-03, float 1.953125e-03>, !dbg !1155
  %9 = fmul <4 x float> %7, <float 1.953125e-03, float 1.953125e-03, float 1.953125e-03, float 1.953125e-03>, !dbg !1155
  %10 = add nuw nsw i64 %index59, %3, !dbg !1156
  %11 = getelementptr inbounds float, float* %0, i64 %10, !dbg !1157
  %12 = bitcast float* %11 to <4 x float>*, !dbg !1158
  store <4 x float> %8, <4 x float>* %12, align 4, !dbg !1158, !tbaa !727
  %13 = getelementptr float, float* %11, i64 4, !dbg !1158
  %14 = bitcast float* %13 to <4 x float>*, !dbg !1158
  store <4 x float> %9, <4 x float>* %14, align 4, !dbg !1158, !tbaa !727
  %index.next60 = or i64 %index59, 8, !dbg !1152
  %vec.ind.next70 = add <4 x i32> %vec.ind67, <i32 8, i32 8, i32 8, i32 8>, !dbg !1152
  %step.add68.1 = add <4 x i32> %vec.ind67, <i32 12, i32 12, i32 12, i32 12>, !dbg !1152
  %15 = sitofp <4 x i32> %vec.ind.next70 to <4 x float>, !dbg !1153
  %16 = sitofp <4 x i32> %step.add68.1 to <4 x float>, !dbg !1153
  %17 = fmul <4 x float> %broadcast.splat72, %15, !dbg !1154
  %18 = fmul <4 x float> %broadcast.splat72, %16, !dbg !1154
  %19 = fmul <4 x float> %17, <float 1.953125e-03, float 1.953125e-03, float 1.953125e-03, float 1.953125e-03>, !dbg !1155
  %20 = fmul <4 x float> %18, <float 1.953125e-03, float 1.953125e-03, float 1.953125e-03, float 1.953125e-03>, !dbg !1155
  %21 = add nuw nsw i64 %index.next60, %3, !dbg !1156
  %22 = getelementptr inbounds float, float* %0, i64 %21, !dbg !1157
  %23 = bitcast float* %22 to <4 x float>*, !dbg !1158
  store <4 x float> %19, <4 x float>* %23, align 4, !dbg !1158, !tbaa !727
  %24 = getelementptr float, float* %22, i64 4, !dbg !1158
  %25 = bitcast float* %24 to <4 x float>*, !dbg !1158
  store <4 x float> %20, <4 x float>* %25, align 4, !dbg !1158, !tbaa !727
  %index.next60.1 = add nsw i64 %index59, 16, !dbg !1152
  %vec.ind.next70.1 = add <4 x i32> %vec.ind67, <i32 16, i32 16, i32 16, i32 16>, !dbg !1152
  %26 = icmp eq i64 %index.next60.1, 512, !dbg !1152
  br i1 %26, label %vector.ph, label %vector.body54, !dbg !1152, !llvm.loop !1159

vector.ph:                                        ; preds = %vector.body54
  %broadcast.splatinsert = insertelement <4 x float> undef, float %conv.i, i32 0, !dbg !1160
  %broadcast.splat = shufflevector <4 x float> %broadcast.splatinsert, <4 x float> undef, <4 x i32> zeroinitializer, !dbg !1160
  br label %vector.body, !dbg !1160

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ], !dbg !1161
  %vec.ind50 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %vector.ph ], [ %vec.ind.next53, %vector.body ]
  %step.add51 = add <4 x i32> %vec.ind50, <i32 4, i32 4, i32 4, i32 4>, !dbg !1161
  %27 = sitofp <4 x i32> %vec.ind50 to <4 x float>, !dbg !1160
  %28 = sitofp <4 x i32> %step.add51 to <4 x float>, !dbg !1160
  %29 = fmul <4 x float> %broadcast.splat, %27, !dbg !1162
  %30 = fmul <4 x float> %broadcast.splat, %28, !dbg !1162
  %31 = fadd <4 x float> %29, <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>, !dbg !1163
  %32 = fadd <4 x float> %30, <float 2.000000e+00, float 2.000000e+00, float 2.000000e+00, float 2.000000e+00>, !dbg !1163
  %33 = fmul <4 x float> %31, <float 1.953125e-03, float 1.953125e-03, float 1.953125e-03, float 1.953125e-03>, !dbg !1164
  %34 = fmul <4 x float> %32, <float 1.953125e-03, float 1.953125e-03, float 1.953125e-03, float 1.953125e-03>, !dbg !1164
  %35 = add nuw nsw i64 %index, %3, !dbg !1165
  %36 = getelementptr inbounds float, float* %1, i64 %35, !dbg !1166
  %37 = bitcast float* %36 to <4 x float>*, !dbg !1167
  store <4 x float> %33, <4 x float>* %37, align 4, !dbg !1167, !tbaa !727
  %38 = getelementptr float, float* %36, i64 4, !dbg !1167
  %39 = bitcast float* %38 to <4 x float>*, !dbg !1167
  store <4 x float> %34, <4 x float>* %39, align 4, !dbg !1167, !tbaa !727
  %index.next = add i64 %index, 8, !dbg !1161
  %vec.ind.next53 = add <4 x i32> %vec.ind50, <i32 8, i32 8, i32 8, i32 8>, !dbg !1161
  %40 = icmp eq i64 %index.next, 512, !dbg !1161
  br i1 %40, label %for.inc21.i, label %vector.body, !dbg !1161, !llvm.loop !1168

for.inc21.i:                                      ; preds = %vector.body
  %indvars.iv.next46.i = add nuw nsw i64 %indvars.iv45.i, 1, !dbg !1169
  %exitcond49.i = icmp eq i64 %indvars.iv.next46.i, 512, !dbg !1170
  br i1 %exitcond49.i, label %_Z11init_arraysPfS_.exit, label %for.cond1.preheader.i, !dbg !1149, !llvm.loop !753

_Z11init_arraysPfS_.exit:                         ; preds = %for.inc21.i
  %41 = bitcast i8* %call2 to float*, !dbg !1171
  %42 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %deviceProp.i, i64 0, i32 0, i64 0, !dbg !1172
  call void @llvm.lifetime.start(i64 632, i8* nonnull %42) #8, !dbg !1172
  tail call void @llvm.dbg.value(metadata %struct.cudaDeviceProp* %deviceProp.i, i64 0, metadata !912, metadata !607), !dbg !1174
  %call.i = call i32 @cudaGetDeviceProperties(%struct.cudaDeviceProp* nonnull %deviceProp.i, i32 0), !dbg !1175
  %call1.i = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.2, i64 0, i64 0), i32 0, i8* nonnull %42), !dbg !1176
  %call2.i = call i32 @cudaSetDevice(i32 0), !dbg !1177
  call void @llvm.lifetime.end(i64 632, i8* nonnull %42) #8, !dbg !1178
  call void @_Z8syrkCudaPfS_S_(float* %0, float* nonnull %1, float* %41), !dbg !1179
  %43 = bitcast %struct.timezone* %Tzp.i to i8*, !dbg !1180
  call void @llvm.lifetime.start(i64 8, i8* nonnull %43) #8, !dbg !1180
  %44 = bitcast %struct.timeval* %Tp.i to i8*, !dbg !1182
  call void @llvm.lifetime.start(i64 16, i8* nonnull %44) #8, !dbg !1182
  call void @llvm.dbg.value(metadata %struct.timezone* %Tzp.i, i64 0, metadata !589, metadata !607) #8, !dbg !1183
  call void @llvm.dbg.value(metadata %struct.timeval* %Tp.i, i64 0, metadata !595, metadata !607) #8, !dbg !1184
  %call.i26 = call i32 @gettimeofday(%struct.timeval* nonnull %Tp.i, %struct.timezone* nonnull %Tzp.i) #8, !dbg !1185
  call void @llvm.dbg.value(metadata i32 %call.i26, i64 0, metadata !604, metadata !611) #8, !dbg !1186
  %cmp.i = icmp eq i32 %call.i26, 0, !dbg !1187
  br i1 %cmp.i, label %_Z7rtclockv.exit, label %if.then.i, !dbg !1188

if.then.i:                                        ; preds = %_Z11init_arraysPfS_.exit
  %call1.i27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str, i64 0, i64 0), i32 %call.i26) #8, !dbg !1189
  br label %_Z7rtclockv.exit, !dbg !1189

_Z7rtclockv.exit:                                 ; preds = %_Z11init_arraysPfS_.exit, %if.then.i
  %tv_sec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %Tp.i, i64 0, i32 0, !dbg !1190
  %45 = load i64, i64* %tv_sec.i, align 8, !dbg !1190, !tbaa !619
  %tv_usec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %Tp.i, i64 0, i32 1, !dbg !1191
  %46 = load i64, i64* %tv_usec.i, align 8, !dbg !1191, !tbaa !626
  %conv2.i = sitofp i64 %46 to double, !dbg !1192
  %mul.i29 = fmul double %conv2.i, 1.000000e-06, !dbg !1193
  call void @llvm.lifetime.end(i64 16, i8* nonnull %44) #8, !dbg !1194
  call void @llvm.lifetime.end(i64 8, i8* nonnull %43) #8, !dbg !1194
  call void @llvm.dbg.value(metadata double %add.i, i64 0, metadata !1132, metadata !611), !dbg !1195
  tail call void @llvm.dbg.value(metadata float* %0, i64 0, metadata !759, metadata !611), !dbg !1196
  tail call void @llvm.dbg.value(metadata float* %1, i64 0, metadata !760, metadata !611), !dbg !1198
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !761, metadata !611), !dbg !1199
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !761, metadata !611), !dbg !1199
  br label %for.cond1.preheader.i30, !dbg !1200

for.cond1.preheader.i30:                          ; preds = %for.inc5.i, %_Z7rtclockv.exit
  %indvars.iv81.i = phi i64 [ 0, %_Z7rtclockv.exit ], [ %indvars.iv.next82.i, %for.inc5.i ]
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !762, metadata !611), !dbg !1201
  %47 = shl i64 %indvars.iv81.i, 9
  br label %vector.body73, !dbg !1202

vector.body73:                                    ; preds = %vector.body73, %for.cond1.preheader.i30
  %index78 = phi i64 [ 0, %for.cond1.preheader.i30 ], [ %index.next79.1, %vector.body73 ], !dbg !1203
  %48 = add nuw nsw i64 %index78, %47, !dbg !1204
  %49 = getelementptr inbounds float, float* %1, i64 %48, !dbg !1205
  %50 = bitcast float* %49 to <4 x float>*, !dbg !1206
  %wide.load = load <4 x float>, <4 x float>* %50, align 4, !dbg !1206, !tbaa !727
  %51 = getelementptr float, float* %49, i64 4, !dbg !1206
  %52 = bitcast float* %51 to <4 x float>*, !dbg !1206
  %wide.load85 = load <4 x float>, <4 x float>* %52, align 4, !dbg !1206, !tbaa !727
  %53 = fmul <4 x float> %wide.load, <float 4.546000e+03, float 4.546000e+03, float 4.546000e+03, float 4.546000e+03>, !dbg !1206
  %54 = fmul <4 x float> %wide.load85, <float 4.546000e+03, float 4.546000e+03, float 4.546000e+03, float 4.546000e+03>, !dbg !1206
  %55 = bitcast float* %49 to <4 x float>*, !dbg !1206
  store <4 x float> %53, <4 x float>* %55, align 4, !dbg !1206, !tbaa !727
  %56 = bitcast float* %51 to <4 x float>*, !dbg !1206
  store <4 x float> %54, <4 x float>* %56, align 4, !dbg !1206, !tbaa !727
  %index.next79 = or i64 %index78, 8, !dbg !1203
  %57 = add nuw nsw i64 %index.next79, %47, !dbg !1204
  %58 = getelementptr inbounds float, float* %1, i64 %57, !dbg !1205
  %59 = bitcast float* %58 to <4 x float>*, !dbg !1206
  %wide.load.1 = load <4 x float>, <4 x float>* %59, align 4, !dbg !1206, !tbaa !727
  %60 = getelementptr float, float* %58, i64 4, !dbg !1206
  %61 = bitcast float* %60 to <4 x float>*, !dbg !1206
  %wide.load85.1 = load <4 x float>, <4 x float>* %61, align 4, !dbg !1206, !tbaa !727
  %62 = fmul <4 x float> %wide.load.1, <float 4.546000e+03, float 4.546000e+03, float 4.546000e+03, float 4.546000e+03>, !dbg !1206
  %63 = fmul <4 x float> %wide.load85.1, <float 4.546000e+03, float 4.546000e+03, float 4.546000e+03, float 4.546000e+03>, !dbg !1206
  %64 = bitcast float* %58 to <4 x float>*, !dbg !1206
  store <4 x float> %62, <4 x float>* %64, align 4, !dbg !1206, !tbaa !727
  %65 = bitcast float* %60 to <4 x float>*, !dbg !1206
  store <4 x float> %63, <4 x float>* %65, align 4, !dbg !1206, !tbaa !727
  %index.next79.1 = add nsw i64 %index78, 16, !dbg !1203
  %66 = icmp eq i64 %index.next79.1, 512, !dbg !1203
  br i1 %66, label %for.inc5.i, label %vector.body73, !dbg !1203, !llvm.loop !1207

for.inc5.i:                                       ; preds = %vector.body73
  %indvars.iv.next82.i = add nuw nsw i64 %indvars.iv81.i, 1, !dbg !1208
  %exitcond84.i = icmp eq i64 %indvars.iv.next82.i, 512, !dbg !1209
  br i1 %exitcond84.i, label %for.cond11.preheader.i.preheader, label %for.cond1.preheader.i30, !dbg !1200, !llvm.loop !790

for.cond11.preheader.i.preheader:                 ; preds = %for.inc5.i
  %conv.i28 = sitofp i64 %45 to double, !dbg !1210
  %add.i = fadd double %mul.i29, %conv.i28, !dbg !1211
  br label %for.cond11.preheader.i, !dbg !1201

for.cond11.preheader.i:                           ; preds = %for.cond11.preheader.i.preheader, %for.inc38.i
  %indvars.iv73.i = phi i64 [ %indvars.iv.next74.i, %for.inc38.i ], [ 0, %for.cond11.preheader.i.preheader ]
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !762, metadata !611), !dbg !1201
  %67 = shl nsw i64 %indvars.iv73.i, 9
  br label %for.cond14.preheader.i, !dbg !1212

for.cond14.preheader.i:                           ; preds = %for.inc35.i, %for.cond11.preheader.i
  %indvars.iv68.i = phi i64 [ 0, %for.cond11.preheader.i ], [ %indvars.iv.next69.i, %for.inc35.i ]
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !763, metadata !611), !dbg !1213
  %68 = shl i64 %indvars.iv68.i, 9
  %69 = add nuw nsw i64 %indvars.iv68.i, %67
  %arrayidx30.i = getelementptr inbounds float, float* %1, i64 %69
  %.pre.i = load float, float* %arrayidx30.i, align 4, !tbaa !727
  br label %for.body16.i, !dbg !1214

for.body16.i:                                     ; preds = %for.body16.i, %for.cond14.preheader.i
  %70 = phi float [ %.pre.i, %for.cond14.preheader.i ], [ %add31.i.1, %for.body16.i ], !dbg !1215
  %indvars.iv.i33 = phi i64 [ 0, %for.cond14.preheader.i ], [ %indvars.iv.next.i34.1, %for.body16.i ]
  %71 = add nuw nsw i64 %indvars.iv.i33, %67, !dbg !1216
  %arrayidx20.i = getelementptr inbounds float, float* %0, i64 %71, !dbg !1217
  %72 = load float, float* %arrayidx20.i, align 4, !dbg !1217, !tbaa !727
  %mul21.i = fmul float %72, 1.243500e+04, !dbg !1218
  %73 = add nuw nsw i64 %indvars.iv.i33, %68, !dbg !1219
  %arrayidx25.i = getelementptr inbounds float, float* %0, i64 %73, !dbg !1220
  %74 = load float, float* %arrayidx25.i, align 4, !dbg !1220, !tbaa !727
  %mul26.i = fmul float %mul21.i, %74, !dbg !1221
  %add31.i = fadd float %70, %mul26.i, !dbg !1215
  %indvars.iv.next.i34 = or i64 %indvars.iv.i33, 1, !dbg !1222
  %75 = add nuw nsw i64 %indvars.iv.next.i34, %67, !dbg !1216
  %arrayidx20.i.1 = getelementptr inbounds float, float* %0, i64 %75, !dbg !1217
  %76 = load float, float* %arrayidx20.i.1, align 4, !dbg !1217, !tbaa !727
  %mul21.i.1 = fmul float %76, 1.243500e+04, !dbg !1218
  %77 = add nuw nsw i64 %indvars.iv.next.i34, %68, !dbg !1219
  %arrayidx25.i.1 = getelementptr inbounds float, float* %0, i64 %77, !dbg !1220
  %78 = load float, float* %arrayidx25.i.1, align 4, !dbg !1220, !tbaa !727
  %mul26.i.1 = fmul float %mul21.i.1, %78, !dbg !1221
  %add31.i.1 = fadd float %add31.i, %mul26.i.1, !dbg !1215
  %indvars.iv.next.i34.1 = add nsw i64 %indvars.iv.i33, 2, !dbg !1222
  %exitcond.i35.1 = icmp eq i64 %indvars.iv.next.i34.1, 512, !dbg !1223
  br i1 %exitcond.i35.1, label %for.inc35.i, label %for.body16.i, !dbg !1214, !llvm.loop !818

for.inc35.i:                                      ; preds = %for.body16.i
  store float %add31.i.1, float* %arrayidx30.i, align 4, !dbg !1215, !tbaa !727
  %indvars.iv.next69.i = add nuw nsw i64 %indvars.iv68.i, 1, !dbg !1224
  %exitcond72.i = icmp eq i64 %indvars.iv.next69.i, 512, !dbg !1225
  br i1 %exitcond72.i, label %for.inc38.i, label %for.cond14.preheader.i, !dbg !1212, !llvm.loop !825

for.inc38.i:                                      ; preds = %for.inc35.i
  %indvars.iv.next74.i = add nuw nsw i64 %indvars.iv73.i, 1, !dbg !1226
  %exitcond76.i = icmp eq i64 %indvars.iv.next74.i, 512, !dbg !1227
  br i1 %exitcond76.i, label %_Z4syrkPfS_.exit, label %for.cond11.preheader.i, !dbg !1228, !llvm.loop !834

_Z4syrkPfS_.exit:                                 ; preds = %for.inc38.i
  %79 = bitcast %struct.timezone* %Tzp.i36 to i8*, !dbg !1229
  call void @llvm.lifetime.start(i64 8, i8* nonnull %79) #8, !dbg !1229
  %80 = bitcast %struct.timeval* %Tp.i37 to i8*, !dbg !1231
  call void @llvm.lifetime.start(i64 16, i8* nonnull %80) #8, !dbg !1231
  call void @llvm.dbg.value(metadata %struct.timezone* %Tzp.i36, i64 0, metadata !589, metadata !607) #8, !dbg !1232
  call void @llvm.dbg.value(metadata %struct.timeval* %Tp.i37, i64 0, metadata !595, metadata !607) #8, !dbg !1233
  %call.i38 = call i32 @gettimeofday(%struct.timeval* nonnull %Tp.i37, %struct.timezone* nonnull %Tzp.i36) #8, !dbg !1234
  call void @llvm.dbg.value(metadata i32 %call.i38, i64 0, metadata !604, metadata !611) #8, !dbg !1235
  %cmp.i39 = icmp eq i32 %call.i38, 0, !dbg !1236
  br i1 %cmp.i39, label %_Z7rtclockv.exit48, label %if.then.i41, !dbg !1237

if.then.i41:                                      ; preds = %_Z4syrkPfS_.exit
  %call1.i40 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str, i64 0, i64 0), i32 %call.i38) #8, !dbg !1238
  br label %_Z7rtclockv.exit48, !dbg !1238

_Z7rtclockv.exit48:                               ; preds = %_Z4syrkPfS_.exit, %if.then.i41
  %tv_sec.i42 = getelementptr inbounds %struct.timeval, %struct.timeval* %Tp.i37, i64 0, i32 0, !dbg !1239
  %81 = load i64, i64* %tv_sec.i42, align 8, !dbg !1239, !tbaa !619
  %conv.i43 = sitofp i64 %81 to double, !dbg !1240
  %tv_usec.i44 = getelementptr inbounds %struct.timeval, %struct.timeval* %Tp.i37, i64 0, i32 1, !dbg !1241
  %82 = load i64, i64* %tv_usec.i44, align 8, !dbg !1241, !tbaa !626
  %conv2.i45 = sitofp i64 %82 to double, !dbg !1242
  %mul.i46 = fmul double %conv2.i45, 1.000000e-06, !dbg !1243
  %add.i47 = fadd double %mul.i46, %conv.i43, !dbg !1244
  call void @llvm.lifetime.end(i64 16, i8* nonnull %80) #8, !dbg !1245
  call void @llvm.lifetime.end(i64 8, i8* nonnull %79) #8, !dbg !1245
  call void @llvm.dbg.value(metadata double %add.i47, i64 0, metadata !1133, metadata !611), !dbg !1246
  %83 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !dbg !1247, !tbaa !1003
  %sub = fsub double %add.i47, %add.i, !dbg !1248
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %83, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.6, i64 0, i64 0), double %sub), !dbg !1249
  call void @llvm.dbg.value(metadata float* %1, i64 0, metadata !840, metadata !611) #8, !dbg !1250
  call void @llvm.dbg.value(metadata float* %41, i64 0, metadata !841, metadata !611) #8, !dbg !1252
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !844, metadata !611) #8, !dbg !1253
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !842, metadata !611) #8, !dbg !1254
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !844, metadata !611) #8, !dbg !1253
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !842, metadata !611) #8, !dbg !1254
  br label %for.cond1.preheader.i20, !dbg !1255

for.cond1.preheader.i20:                          ; preds = %middle.block87, %_Z7rtclockv.exit48
  %indvars.iv31.i = phi i64 [ 0, %_Z7rtclockv.exit48 ], [ %indvars.iv.next32.i, %middle.block87 ]
  %fail.029.i = phi i32 [ 0, %_Z7rtclockv.exit48 ], [ %154, %middle.block87 ]
  call void @llvm.dbg.value(metadata i32 %fail.029.i, i64 0, metadata !844, metadata !611) #8, !dbg !1253
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !843, metadata !611) #8, !dbg !1256
  %84 = shl i64 %indvars.iv31.i, 9
  %85 = insertelement <4 x i32> <i32 undef, i32 0, i32 0, i32 0>, i32 %fail.029.i, i32 0, !dbg !1257
  br label %vector.body86, !dbg !1257

vector.body86:                                    ; preds = %vector.body86, %for.cond1.preheader.i20
  %index91 = phi i64 [ 0, %for.cond1.preheader.i20 ], [ %index.next92, %vector.body86 ], !dbg !1258
  %vec.phi = phi <4 x i32> [ %85, %for.cond1.preheader.i20 ], [ %151, %vector.body86 ]
  %vec.phi99 = phi <4 x i32> [ zeroinitializer, %for.cond1.preheader.i20 ], [ %152, %vector.body86 ]
  %86 = add nuw nsw i64 %index91, %84, !dbg !1259
  %87 = getelementptr inbounds float, float* %1, i64 %86, !dbg !1260
  %88 = bitcast float* %87 to <4 x float>*, !dbg !1260
  %wide.load100 = load <4 x float>, <4 x float>* %88, align 4, !dbg !1260, !tbaa !727
  %89 = getelementptr float, float* %87, i64 4, !dbg !1260
  %90 = bitcast float* %89 to <4 x float>*, !dbg !1260
  %wide.load101 = load <4 x float>, <4 x float>* %90, align 4, !dbg !1260, !tbaa !727
  %91 = getelementptr inbounds float, float* %41, i64 %86, !dbg !1261
  %92 = bitcast float* %91 to <4 x float>*, !dbg !1261
  %wide.load102 = load <4 x float>, <4 x float>* %92, align 4, !dbg !1261, !tbaa !727
  %93 = getelementptr float, float* %91, i64 4, !dbg !1261
  %94 = bitcast float* %93 to <4 x float>*, !dbg !1261
  %wide.load103 = load <4 x float>, <4 x float>* %94, align 4, !dbg !1261, !tbaa !727
  %95 = fcmp olt <4 x float> %wide.load100, zeroinitializer, !dbg !1262
  %96 = fcmp olt <4 x float> %wide.load101, zeroinitializer, !dbg !1262
  %97 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %wide.load100, !dbg !1265
  %98 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %wide.load101, !dbg !1265
  %99 = select <4 x i1> %95, <4 x float> %97, <4 x float> %wide.load100, !dbg !1266
  %100 = select <4 x i1> %96, <4 x float> %98, <4 x float> %wide.load101, !dbg !1266
  %101 = fpext <4 x float> %99 to <4 x double>, !dbg !1267
  %102 = fpext <4 x float> %100 to <4 x double>, !dbg !1267
  %103 = fcmp olt <4 x double> %101, <double 1.000000e-02, double 1.000000e-02, double 1.000000e-02, double 1.000000e-02>, !dbg !1268
  %104 = fcmp olt <4 x double> %102, <double 1.000000e-02, double 1.000000e-02, double 1.000000e-02, double 1.000000e-02>, !dbg !1268
  %105 = fcmp olt <4 x float> %wide.load102, zeroinitializer, !dbg !1269
  %106 = fcmp olt <4 x float> %wide.load103, zeroinitializer, !dbg !1269
  %107 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %wide.load102, !dbg !1271
  %108 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %wide.load103, !dbg !1271
  %109 = select <4 x i1> %105, <4 x float> %107, <4 x float> %wide.load102, !dbg !1272
  %110 = select <4 x i1> %106, <4 x float> %108, <4 x float> %wide.load103, !dbg !1272
  %111 = fpext <4 x float> %109 to <4 x double>, !dbg !1273
  %112 = fpext <4 x float> %110 to <4 x double>, !dbg !1273
  %113 = fcmp olt <4 x double> %111, <double 1.000000e-02, double 1.000000e-02, double 1.000000e-02, double 1.000000e-02>, !dbg !1274
  %114 = fcmp olt <4 x double> %112, <double 1.000000e-02, double 1.000000e-02, double 1.000000e-02, double 1.000000e-02>, !dbg !1274
  %115 = fsub <4 x float> %wide.load100, %wide.load102, !dbg !1275
  %116 = fsub <4 x float> %wide.load101, %wide.load103, !dbg !1275
  %117 = fcmp olt <4 x float> %115, zeroinitializer, !dbg !1276
  %118 = fcmp olt <4 x float> %116, zeroinitializer, !dbg !1276
  %119 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %115, !dbg !1278
  %120 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %116, !dbg !1278
  %121 = select <4 x i1> %117, <4 x float> %119, <4 x float> %115, !dbg !1279
  %122 = select <4 x i1> %118, <4 x float> %120, <4 x float> %116, !dbg !1279
  %123 = fadd <4 x float> %wide.load100, <float 0x3E45798EE0000000, float 0x3E45798EE0000000, float 0x3E45798EE0000000, float 0x3E45798EE0000000>, !dbg !1280
  %124 = fadd <4 x float> %wide.load101, <float 0x3E45798EE0000000, float 0x3E45798EE0000000, float 0x3E45798EE0000000, float 0x3E45798EE0000000>, !dbg !1280
  %125 = fcmp olt <4 x float> %123, zeroinitializer, !dbg !1281
  %126 = fcmp olt <4 x float> %124, zeroinitializer, !dbg !1281
  %127 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %123, !dbg !1283
  %128 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %124, !dbg !1283
  %129 = select <4 x i1> %125, <4 x float> %127, <4 x float> %123, !dbg !1284
  %130 = select <4 x i1> %126, <4 x float> %128, <4 x float> %124, !dbg !1284
  %131 = fdiv <4 x float> %121, %129, !dbg !1285
  %132 = fdiv <4 x float> %122, %130, !dbg !1285
  %133 = fcmp olt <4 x float> %131, zeroinitializer, !dbg !1286
  %134 = fcmp olt <4 x float> %132, zeroinitializer, !dbg !1286
  %135 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %131, !dbg !1288
  %136 = fsub <4 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %132, !dbg !1288
  %137 = select <4 x i1> %133, <4 x float> %135, <4 x float> %131, !dbg !1289
  %138 = select <4 x i1> %134, <4 x float> %136, <4 x float> %132, !dbg !1289
  %139 = fmul <4 x float> %137, <float 1.000000e+02, float 1.000000e+02, float 1.000000e+02, float 1.000000e+02>, !dbg !1290
  %140 = fmul <4 x float> %138, <float 1.000000e+02, float 1.000000e+02, float 1.000000e+02, float 1.000000e+02>, !dbg !1290
  %141 = and <4 x i1> %113, %103
  %142 = and <4 x i1> %114, %104
  %143 = fpext <4 x float> %139 to <4 x double>, !dbg !1291
  %144 = select <4 x i1> %141, <4 x double> zeroinitializer, <4 x double> %143, !dbg !1291
  %145 = fpext <4 x float> %140 to <4 x double>, !dbg !1291
  %146 = select <4 x i1> %142, <4 x double> zeroinitializer, <4 x double> %145, !dbg !1291
  %147 = fcmp ogt <4 x double> %144, <double 5.000000e-03, double 5.000000e-03, double 5.000000e-03, double 5.000000e-03>, !dbg !1292
  %148 = fcmp ogt <4 x double> %146, <double 5.000000e-03, double 5.000000e-03, double 5.000000e-03, double 5.000000e-03>, !dbg !1292
  %149 = zext <4 x i1> %147 to <4 x i32>, !dbg !1293
  %150 = zext <4 x i1> %148 to <4 x i32>, !dbg !1293
  %151 = add nsw <4 x i32> %vec.phi, %149, !dbg !1293
  %152 = add nsw <4 x i32> %vec.phi99, %150, !dbg !1293
  %index.next92 = add i64 %index91, 8, !dbg !1258
  %153 = icmp eq i64 %index.next92, 512, !dbg !1258
  br i1 %153, label %middle.block87, label %vector.body86, !dbg !1258, !llvm.loop !1294

middle.block87:                                   ; preds = %vector.body86
  %bin.rdx = add <4 x i32> %152, %151, !dbg !1293
  %rdx.shuf = shufflevector <4 x i32> %bin.rdx, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>, !dbg !1293
  %bin.rdx105 = add <4 x i32> %bin.rdx, %rdx.shuf, !dbg !1293
  %rdx.shuf106 = shufflevector <4 x i32> %bin.rdx105, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>, !dbg !1293
  %bin.rdx107 = add <4 x i32> %bin.rdx105, %rdx.shuf106, !dbg !1293
  %154 = extractelement <4 x i32> %bin.rdx107, i32 0, !dbg !1293
  %indvars.iv.next32.i = add nuw nsw i64 %indvars.iv31.i, 1, !dbg !1295
  call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !844, metadata !611) #8, !dbg !1253
  %exitcond34.i = icmp eq i64 %indvars.iv.next32.i, 512, !dbg !1296
  br i1 %exitcond34.i, label %_Z14compareResultsPfS_.exit, label %for.cond1.preheader.i20, !dbg !1255, !llvm.loop !905

_Z14compareResultsPfS_.exit:                      ; preds = %middle.block87
  %call15.i = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([74 x i8], [74 x i8]* @.str.1, i64 0, i64 0), double 5.000000e-03, i32 %154) #8, !dbg !1297
  call void @free(i8* %call) #8, !dbg !1298
  call void @free(i8* nonnull %call1) #8, !dbg !1299
  call void @free(i8* nonnull %call2) #8, !dbg !1300
  ret i32 0, !dbg !1301
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
!llvm.module.flags = !{!581, !582}
!llvm.ident = !{!583}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !1, producer: "clang version 5.0.0 (trunk 294196)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !17, imports: !26)
!1 = !DIFile(filename: "syrk.cu", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/syrkllvm")
!2 = !{!3, !11}
!3 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaMemcpyKind", file: !4, line: 796, size: 32, elements: !5, identifier: "_ZTS14cudaMemcpyKind")
!4 = !DIFile(filename: "/usr/local/cuda/include/driver_types.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/syrkllvm")
!5 = !{!6, !7, !8, !9, !10}
!6 = !DIEnumerator(name: "cudaMemcpyHostToHost", value: 0)
!7 = !DIEnumerator(name: "cudaMemcpyHostToDevice", value: 1)
!8 = !DIEnumerator(name: "cudaMemcpyDeviceToHost", value: 2)
!9 = !DIEnumerator(name: "cudaMemcpyDeviceToDevice", value: 3)
!10 = !DIEnumerator(name: "cudaMemcpyDefault", value: 4)
!11 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaFuncCache", file: !4, line: 1112, size: 32, elements: !12, identifier: "_ZTS13cudaFuncCache")
!12 = !{!13, !14, !15, !16}
!13 = !DIEnumerator(name: "cudaFuncCachePreferNone", value: 0)
!14 = !DIEnumerator(name: "cudaFuncCachePreferShared", value: 1)
!15 = !DIEnumerator(name: "cudaFuncCachePreferL1", value: 2)
!16 = !DIEnumerator(name: "cudaFuncCachePreferEqual", value: 3)
!17 = !{!18, !20, !22, !19, !25}
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "DATA_TYPE", file: !1, line: 38, baseType: !19)
!19 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !23, line: 62, baseType: !24)
!23 = !DIFile(filename: "/home/dshen/llvm/build/bin/../lib/clang/5.0.0/include/stddef.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/syrkllvm")
!24 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!26 = !{!27, !34, !38, !40, !42, !44, !46, !50, !52, !54, !56, !58, !60, !62, !64, !66, !68, !70, !72, !74, !76, !78, !82, !84, !86, !88, !93, !98, !100, !102, !107, !111, !113, !115, !117, !119, !121, !123, !125, !127, !132, !136, !138, !140, !144, !146, !148, !150, !152, !154, !158, !160, !162, !167, !175, !179, !181, !183, !187, !189, !191, !195, !197, !199, !203, !205, !207, !209, !211, !213, !215, !217, !219, !221, !226, !228, !230, !234, !236, !238, !240, !242, !244, !246, !248, !252, !256, !258, !260, !265, !267, !269, !271, !273, !275, !277, !281, !287, !291, !295, !300, !303, !307, !311, !322, !326, !330, !334, !338, !343, !345, !349, !353, !357, !365, !369, !373, !377, !381, !386, !392, !396, !400, !402, !410, !414, !422, !424, !426, !430, !434, !438, !443, !447, !452, !453, !454, !455, !458, !459, !460, !461, !462, !463, !464, !467, !469, !471, !473, !475, !477, !479, !481, !484, !486, !488, !490, !492, !494, !496, !498, !500, !502, !504, !506, !508, !510, !512, !514, !516, !518, !520, !522, !524, !526, !528, !530, !532, !534, !536, !538, !540, !542, !544, !546, !548, !552, !553, !555, !557, !559, !561, !563, !565, !567, !569, !571, !573, !575, !577, !579}
!27 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !30, line: 201)
!28 = !DINamespace(name: "std", scope: null, file: !29, line: 195)
!29 = !DIFile(filename: "/home/dshen/llvm/build/bin/../lib/clang/5.0.0/include/__clang_cuda_math_forward_declares.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/syrkllvm")
!30 = !DISubprogram(name: "abs", linkageName: "_ZL3absx", scope: !29, file: !29, line: 44, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!31 = !DISubroutineType(types: !32)
!32 = !{!33, !33}
!33 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!34 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !35, line: 202)
!35 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !29, file: !29, line: 46, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!36 = !DISubroutineType(types: !37)
!37 = !{!19, !19}
!38 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !39, line: 203)
!39 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !29, file: !29, line: 48, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!40 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !41, line: 204)
!41 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !29, file: !29, line: 50, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!42 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !43, line: 205)
!43 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !29, file: !29, line: 52, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!44 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !45, line: 206)
!45 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !29, file: !29, line: 56, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!46 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !47, line: 207)
!47 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !29, file: !29, line: 54, type: !48, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!48 = !DISubroutineType(types: !49)
!49 = !{!19, !19, !19}
!50 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !51, line: 208)
!51 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !29, file: !29, line: 58, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!52 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !53, line: 209)
!53 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !29, file: !29, line: 60, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!54 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !55, line: 210)
!55 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !29, file: !29, line: 62, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!56 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !57, line: 211)
!57 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !29, file: !29, line: 64, type: !48, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!58 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !59, line: 212)
!59 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !29, file: !29, line: 66, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!60 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !61, line: 213)
!61 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !29, file: !29, line: 68, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!62 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !63, line: 214)
!63 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !29, file: !29, line: 72, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!64 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !65, line: 215)
!65 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !29, file: !29, line: 70, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!66 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !67, line: 216)
!67 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !29, file: !29, line: 76, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!68 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !69, line: 217)
!69 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !29, file: !29, line: 74, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!70 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !71, line: 218)
!71 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !29, file: !29, line: 78, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!72 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !73, line: 219)
!73 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !29, file: !29, line: 80, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!74 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !75, line: 220)
!75 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !29, file: !29, line: 82, type: !48, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!76 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !77, line: 221)
!77 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !29, file: !29, line: 84, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!78 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !79, line: 222)
!79 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !29, file: !29, line: 86, type: !80, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!80 = !DISubroutineType(types: !81)
!81 = !{!19, !19, !19, !19}
!82 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !83, line: 223)
!83 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !29, file: !29, line: 88, type: !48, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!84 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !85, line: 224)
!85 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !29, file: !29, line: 90, type: !48, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!86 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !87, line: 225)
!87 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !29, file: !29, line: 92, type: !48, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!88 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !89, line: 226)
!89 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !29, file: !29, line: 94, type: !90, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!90 = !DISubroutineType(types: !91)
!91 = !{!92, !19}
!92 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!93 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !94, line: 227)
!94 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !29, file: !29, line: 96, type: !95, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!95 = !DISubroutineType(types: !96)
!96 = !{!19, !19, !97}
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 64)
!98 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !99, line: 228)
!99 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !29, file: !29, line: 98, type: !48, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!100 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !101, line: 229)
!101 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !29, file: !29, line: 100, type: !90, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!102 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !103, line: 230)
!103 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !29, file: !29, line: 102, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!104 = !DISubroutineType(types: !105)
!105 = !{!106, !19}
!106 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!107 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !108, line: 231)
!108 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !29, file: !29, line: 106, type: !109, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!109 = !DISubroutineType(types: !110)
!110 = !{!106, !19, !19}
!111 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !112, line: 232)
!112 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !29, file: !29, line: 105, type: !109, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!113 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !114, line: 233)
!114 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !29, file: !29, line: 108, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!115 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !116, line: 234)
!116 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !29, file: !29, line: 112, type: !109, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!117 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !118, line: 235)
!118 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !29, file: !29, line: 111, type: !109, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !120, line: 236)
!120 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !29, file: !29, line: 114, type: !109, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !122, line: 237)
!122 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !29, file: !29, line: 116, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !124, line: 238)
!124 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !29, file: !29, line: 118, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!125 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !126, line: 239)
!126 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !29, file: !29, line: 120, type: !109, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !128, line: 240)
!128 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !29, file: !29, line: 121, type: !129, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!129 = !DISubroutineType(types: !130)
!130 = !{!131, !131}
!131 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!132 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !133, line: 241)
!133 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !29, file: !29, line: 123, type: !134, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!134 = !DISubroutineType(types: !135)
!135 = !{!19, !19, !92}
!136 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !137, line: 242)
!137 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !29, file: !29, line: 125, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!138 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !139, line: 243)
!139 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !29, file: !29, line: 126, type: !31, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!140 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !141, line: 244)
!141 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !29, file: !29, line: 128, type: !142, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!142 = !DISubroutineType(types: !143)
!143 = !{!33, !19}
!144 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !145, line: 245)
!145 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !29, file: !29, line: 138, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !147, line: 246)
!147 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !29, file: !29, line: 130, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!148 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !149, line: 247)
!149 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !29, file: !29, line: 132, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!150 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !151, line: 248)
!151 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !29, file: !29, line: 134, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !153, line: 249)
!153 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !29, file: !29, line: 136, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!154 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !155, line: 250)
!155 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !29, file: !29, line: 140, type: !156, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!156 = !DISubroutineType(types: !157)
!157 = !{!131, !19}
!158 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !159, line: 251)
!159 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !29, file: !29, line: 142, type: !156, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!160 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !161, line: 252)
!161 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !29, file: !29, line: 143, type: !142, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!162 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !163, line: 253)
!163 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !29, file: !29, line: 145, type: !164, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!164 = !DISubroutineType(types: !165)
!165 = !{!19, !19, !166}
!166 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!167 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !168, line: 254)
!168 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !29, file: !29, line: 146, type: !169, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!169 = !DISubroutineType(types: !170)
!170 = !{!171, !172}
!171 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!172 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !173, size: 64)
!173 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !174)
!174 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !176, line: 255)
!176 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !29, file: !29, line: 147, type: !177, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!177 = !DISubroutineType(types: !178)
!178 = !{!19, !172}
!179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !180, line: 256)
!180 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !29, file: !29, line: 149, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!181 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !182, line: 257)
!182 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !29, file: !29, line: 151, type: !48, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !184, line: 258)
!184 = !DISubprogram(name: "nexttoward", linkageName: "_ZL10nexttowardfd", scope: !29, file: !29, line: 153, type: !185, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!185 = !DISubroutineType(types: !186)
!186 = !{!19, !19, !171}
!187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !188, line: 259)
!188 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !29, file: !29, line: 158, type: !134, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!189 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !190, line: 260)
!190 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !29, file: !29, line: 160, type: !48, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !192, line: 261)
!192 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !29, file: !29, line: 162, type: !193, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!193 = !DISubroutineType(types: !194)
!194 = !{!19, !19, !19, !97}
!195 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !196, line: 262)
!196 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !29, file: !29, line: 164, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!197 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !198, line: 263)
!198 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !29, file: !29, line: 166, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !200, line: 264)
!200 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !29, file: !29, line: 168, type: !201, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!201 = !DISubroutineType(types: !202)
!202 = !{!19, !19, !131}
!203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !204, line: 265)
!204 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !29, file: !29, line: 170, type: !134, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!205 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !206, line: 266)
!206 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !29, file: !29, line: 172, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!207 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !208, line: 267)
!208 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !29, file: !29, line: 174, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !210, line: 268)
!210 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !29, file: !29, line: 176, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!211 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !212, line: 269)
!212 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !29, file: !29, line: 178, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !214, line: 270)
!214 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !29, file: !29, line: 180, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !216, line: 271)
!216 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !29, file: !29, line: 182, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!217 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !218, line: 272)
!218 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !29, file: !29, line: 184, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!219 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !220, line: 273)
!220 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !29, file: !29, line: 186, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!221 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !222, line: 102)
!222 = !DISubprogram(name: "acos", scope: !223, file: !223, line: 54, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!223 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/syrkllvm")
!224 = !DISubroutineType(types: !225)
!225 = !{!171, !171}
!226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !227, line: 121)
!227 = !DISubprogram(name: "asin", scope: !223, file: !223, line: 56, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!228 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !229, line: 140)
!229 = !DISubprogram(name: "atan", scope: !223, file: !223, line: 58, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !231, line: 159)
!231 = !DISubprogram(name: "atan2", scope: !223, file: !223, line: 60, type: !232, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!232 = !DISubroutineType(types: !233)
!233 = !{!171, !171, !171}
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !235, line: 180)
!235 = !DISubprogram(name: "ceil", scope: !223, file: !223, line: 178, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !237, line: 199)
!237 = !DISubprogram(name: "cos", scope: !223, file: !223, line: 63, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !239, line: 218)
!239 = !DISubprogram(name: "cosh", scope: !223, file: !223, line: 72, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !241, line: 237)
!241 = !DISubprogram(name: "exp", scope: !223, file: !223, line: 100, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !243, line: 256)
!243 = !DISubprogram(name: "fabs", scope: !223, file: !223, line: 181, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!244 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !245, line: 275)
!245 = !DISubprogram(name: "floor", scope: !223, file: !223, line: 184, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !247, line: 294)
!247 = !DISubprogram(name: "fmod", scope: !223, file: !223, line: 187, type: !232, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!248 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !249, line: 315)
!249 = !DISubprogram(name: "frexp", scope: !223, file: !223, line: 103, type: !250, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!250 = !DISubroutineType(types: !251)
!251 = !{!171, !171, !97}
!252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !253, line: 334)
!253 = !DISubprogram(name: "ldexp", scope: !223, file: !223, line: 106, type: !254, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!254 = !DISubroutineType(types: !255)
!255 = !{!171, !171, !92}
!256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !257, line: 353)
!257 = !DISubprogram(name: "log", scope: !223, file: !223, line: 109, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !259, line: 372)
!259 = !DISubprogram(name: "log10", scope: !223, file: !223, line: 112, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !261, line: 391)
!261 = !DISubprogram(name: "modf", scope: !223, file: !223, line: 115, type: !262, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!262 = !DISubroutineType(types: !263)
!263 = !{!171, !171, !264}
!264 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !171, size: 64)
!265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !266, line: 403)
!266 = !DISubprogram(name: "pow", scope: !223, file: !223, line: 153, type: !232, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!267 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !268, line: 440)
!268 = !DISubprogram(name: "sin", scope: !223, file: !223, line: 65, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!269 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !270, line: 459)
!270 = !DISubprogram(name: "sinh", scope: !223, file: !223, line: 74, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!271 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !272, line: 478)
!272 = !DISubprogram(name: "sqrt", scope: !223, file: !223, line: 156, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!273 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !274, line: 497)
!274 = !DISubprogram(name: "tan", scope: !223, file: !223, line: 67, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!275 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !276, line: 516)
!276 = !DISubprogram(name: "tanh", scope: !223, file: !223, line: 76, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!277 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !278, line: 118)
!278 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !279, line: 101, baseType: !280)
!279 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/syrkllvm")
!280 = !DICompositeType(tag: DW_TAG_structure_type, file: !279, line: 97, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!281 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !282, line: 119)
!282 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !279, line: 109, baseType: !283)
!283 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !279, line: 105, size: 128, elements: !284, identifier: "_ZTS6ldiv_t")
!284 = !{!285, !286}
!285 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !283, file: !279, line: 107, baseType: !131, size: 64)
!286 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !283, file: !279, line: 108, baseType: !131, size: 64, offset: 64)
!287 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !288, line: 121)
!288 = !DISubprogram(name: "abort", scope: !279, file: !279, line: 515, type: !289, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: true)
!289 = !DISubroutineType(types: !290)
!290 = !{null}
!291 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !292, line: 122)
!292 = !DISubprogram(name: "abs", scope: !279, file: !279, line: 775, type: !293, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!293 = !DISubroutineType(types: !294)
!294 = !{!92, !92}
!295 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !296, line: 123)
!296 = !DISubprogram(name: "atexit", scope: !279, file: !279, line: 519, type: !297, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!297 = !DISubroutineType(types: !298)
!298 = !{!92, !299}
!299 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !289, size: 64)
!300 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !301, line: 129)
!301 = !DISubprogram(name: "atof", scope: !302, file: !302, line: 26, type: !169, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!302 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/syrkllvm")
!303 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !304, line: 130)
!304 = !DISubprogram(name: "atoi", scope: !279, file: !279, line: 278, type: !305, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!305 = !DISubroutineType(types: !306)
!306 = !{!92, !172}
!307 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !308, line: 131)
!308 = !DISubprogram(name: "atol", scope: !279, file: !279, line: 283, type: !309, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!309 = !DISubroutineType(types: !310)
!310 = !{!131, !172}
!311 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !312, line: 132)
!312 = !DISubprogram(name: "bsearch", scope: !313, file: !313, line: 20, type: !314, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!313 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdlib-bsearch.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/syrkllvm")
!314 = !DISubroutineType(types: !315)
!315 = !{!21, !316, !316, !22, !22, !318}
!316 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !317, size: 64)
!317 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!318 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !279, line: 742, baseType: !319)
!319 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !320, size: 64)
!320 = !DISubroutineType(types: !321)
!321 = !{!92, !316, !316}
!322 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !323, line: 133)
!323 = !DISubprogram(name: "calloc", scope: !279, file: !279, line: 468, type: !324, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!324 = !DISubroutineType(types: !325)
!325 = !{!21, !22, !22}
!326 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !327, line: 134)
!327 = !DISubprogram(name: "div", scope: !279, file: !279, line: 789, type: !328, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!328 = !DISubroutineType(types: !329)
!329 = !{!278, !92, !92}
!330 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !331, line: 135)
!331 = !DISubprogram(name: "exit", scope: !279, file: !279, line: 543, type: !332, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: true)
!332 = !DISubroutineType(types: !333)
!333 = !{null, !92}
!334 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !335, line: 136)
!335 = !DISubprogram(name: "free", scope: !279, file: !279, line: 483, type: !336, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!336 = !DISubroutineType(types: !337)
!337 = !{null, !21}
!338 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !339, line: 137)
!339 = !DISubprogram(name: "getenv", scope: !279, file: !279, line: 564, type: !340, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!340 = !DISubroutineType(types: !341)
!341 = !{!342, !172}
!342 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !174, size: 64)
!343 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !344, line: 138)
!344 = !DISubprogram(name: "labs", scope: !279, file: !279, line: 776, type: !129, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!345 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !346, line: 139)
!346 = !DISubprogram(name: "ldiv", scope: !279, file: !279, line: 791, type: !347, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!347 = !DISubroutineType(types: !348)
!348 = !{!282, !131, !131}
!349 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !350, line: 140)
!350 = !DISubprogram(name: "malloc", scope: !279, file: !279, line: 466, type: !351, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!351 = !DISubroutineType(types: !352)
!352 = !{!21, !22}
!353 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !354, line: 142)
!354 = !DISubprogram(name: "mblen", scope: !279, file: !279, line: 863, type: !355, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!355 = !DISubroutineType(types: !356)
!356 = !{!92, !172, !22}
!357 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !358, line: 143)
!358 = !DISubprogram(name: "mbstowcs", scope: !279, file: !279, line: 874, type: !359, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!359 = !DISubroutineType(types: !360)
!360 = !{!22, !361, !364, !22}
!361 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !362)
!362 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !363, size: 64)
!363 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!364 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !172)
!365 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !366, line: 144)
!366 = !DISubprogram(name: "mbtowc", scope: !279, file: !279, line: 866, type: !367, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!367 = !DISubroutineType(types: !368)
!368 = !{!92, !361, !364, !22}
!369 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !370, line: 146)
!370 = !DISubprogram(name: "qsort", scope: !279, file: !279, line: 765, type: !371, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!371 = !DISubroutineType(types: !372)
!372 = !{null, !21, !22, !22, !318}
!373 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !374, line: 152)
!374 = !DISubprogram(name: "rand", scope: !279, file: !279, line: 374, type: !375, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!375 = !DISubroutineType(types: !376)
!376 = !{!92}
!377 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !378, line: 153)
!378 = !DISubprogram(name: "realloc", scope: !279, file: !279, line: 480, type: !379, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!379 = !DISubroutineType(types: !380)
!380 = !{!21, !21, !22}
!381 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !382, line: 154)
!382 = !DISubprogram(name: "srand", scope: !279, file: !279, line: 376, type: !383, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!383 = !DISubroutineType(types: !384)
!384 = !{null, !385}
!385 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !387, line: 155)
!387 = !DISubprogram(name: "strtod", scope: !279, file: !279, line: 164, type: !388, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!388 = !DISubroutineType(types: !389)
!389 = !{!171, !364, !390}
!390 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !391)
!391 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !342, size: 64)
!392 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !393, line: 156)
!393 = !DISubprogram(name: "strtol", scope: !279, file: !279, line: 183, type: !394, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!394 = !DISubroutineType(types: !395)
!395 = !{!131, !364, !390, !92}
!396 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !397, line: 157)
!397 = !DISubprogram(name: "strtoul", scope: !279, file: !279, line: 187, type: !398, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!398 = !DISubroutineType(types: !399)
!399 = !{!24, !364, !390, !92}
!400 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !401, line: 158)
!401 = !DISubprogram(name: "system", scope: !279, file: !279, line: 717, type: !305, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!402 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !403, line: 160)
!403 = !DISubprogram(name: "wcstombs", scope: !279, file: !279, line: 877, type: !404, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!404 = !DISubroutineType(types: !405)
!405 = !{!22, !406, !407, !22}
!406 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !342)
!407 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !408)
!408 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !409, size: 64)
!409 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !363)
!410 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !411, line: 161)
!411 = !DISubprogram(name: "wctomb", scope: !279, file: !279, line: 870, type: !412, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!412 = !DISubroutineType(types: !413)
!413 = !{!92, !342, !363}
!414 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !415, entity: !417, line: 201)
!415 = !DINamespace(name: "__gnu_cxx", scope: null, file: !416, line: 68)
!416 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/bits/cpp_type_traits.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/syrkllvm")
!417 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !279, line: 121, baseType: !418)
!418 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !279, line: 117, size: 128, elements: !419, identifier: "_ZTS7lldiv_t")
!419 = !{!420, !421}
!420 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !418, file: !279, line: 119, baseType: !33, size: 64)
!421 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !418, file: !279, line: 120, baseType: !33, size: 64, offset: 64)
!422 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !415, entity: !423, line: 207)
!423 = !DISubprogram(name: "_Exit", scope: !279, file: !279, line: 557, type: !332, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: true)
!424 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !415, entity: !425, line: 211)
!425 = !DISubprogram(name: "llabs", scope: !279, file: !279, line: 780, type: !31, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!426 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !415, entity: !427, line: 217)
!427 = !DISubprogram(name: "lldiv", scope: !279, file: !279, line: 797, type: !428, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!428 = !DISubroutineType(types: !429)
!429 = !{!417, !33, !33}
!430 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !415, entity: !431, line: 228)
!431 = !DISubprogram(name: "atoll", scope: !279, file: !279, line: 292, type: !432, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!432 = !DISubroutineType(types: !433)
!433 = !{!33, !172}
!434 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !415, entity: !435, line: 229)
!435 = !DISubprogram(name: "strtoll", scope: !279, file: !279, line: 209, type: !436, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!436 = !DISubroutineType(types: !437)
!437 = !{!33, !364, !390, !92}
!438 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !415, entity: !439, line: 230)
!439 = !DISubprogram(name: "strtoull", scope: !279, file: !279, line: 214, type: !440, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!440 = !DISubroutineType(types: !441)
!441 = !{!442, !364, !390, !92}
!442 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!443 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !415, entity: !444, line: 232)
!444 = !DISubprogram(name: "strtof", scope: !279, file: !279, line: 172, type: !445, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!445 = !DISubroutineType(types: !446)
!446 = !{!19, !364, !390}
!447 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !415, entity: !448, line: 233)
!448 = !DISubprogram(name: "strtold", scope: !279, file: !279, line: 175, type: !449, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!449 = !DISubroutineType(types: !450)
!450 = !{!451, !364, !390}
!451 = !DIBasicType(name: "long double", size: 128, encoding: DW_ATE_float)
!452 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !417, line: 241)
!453 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !423, line: 243)
!454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !425, line: 245)
!455 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !456, line: 246)
!456 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !415, file: !457, line: 214, type: !428, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!457 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/cstdlib", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/syrkllvm")
!458 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !427, line: 247)
!459 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !431, line: 249)
!460 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !444, line: 250)
!461 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !435, line: 251)
!462 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !439, line: 252)
!463 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !448, line: 253)
!464 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !465, line: 418)
!465 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !466, file: !466, line: 1126, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!466 = !DIFile(filename: "/usr/local/cuda/include/math_functions.hpp", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/syrkllvm")
!467 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !468, line: 419)
!468 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !466, file: !466, line: 1154, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!469 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !470, line: 420)
!470 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !466, file: !466, line: 1121, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!471 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !472, line: 421)
!472 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !466, file: !466, line: 1159, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!473 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !474, line: 422)
!474 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !466, file: !466, line: 1111, type: !48, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!475 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !476, line: 423)
!476 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !466, file: !466, line: 1116, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!477 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !478, line: 424)
!478 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !466, file: !466, line: 1164, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!479 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !480, line: 425)
!480 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !466, file: !466, line: 1199, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!481 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !482, line: 426)
!482 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !483, file: !483, line: 647, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!483 = !DIFile(filename: "/usr/local/cuda/include/device_functions.hpp", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/syrkllvm")
!484 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !485, line: 427)
!485 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !466, file: !466, line: 973, type: !48, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!486 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !487, line: 428)
!487 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !466, file: !466, line: 1027, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!488 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !489, line: 429)
!489 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !466, file: !466, line: 1096, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!490 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !491, line: 430)
!491 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !466, file: !466, line: 1259, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!492 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !493, line: 431)
!493 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !466, file: !466, line: 1249, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !495, line: 432)
!495 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !483, file: !483, line: 637, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !497, line: 433)
!497 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !466, file: !466, line: 1078, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !499, line: 434)
!499 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !466, file: !466, line: 1169, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !501, line: 435)
!501 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !483, file: !483, line: 582, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !503, line: 436)
!503 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !466, file: !466, line: 1385, type: !48, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!504 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !505, line: 437)
!505 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !483, file: !483, line: 572, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !507, line: 438)
!507 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !466, file: !466, line: 1337, type: !80, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!508 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !509, line: 439)
!509 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !483, file: !483, line: 602, type: !48, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !511, line: 440)
!511 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !483, file: !483, line: 597, type: !48, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!512 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !513, line: 441)
!513 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !466, file: !466, line: 1322, type: !48, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!514 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !515, line: 442)
!515 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !466, file: !466, line: 1312, type: !95, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!516 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !517, line: 443)
!517 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !466, file: !466, line: 1174, type: !48, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!518 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !519, line: 444)
!519 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !466, file: !466, line: 1390, type: !90, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!520 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !521, line: 445)
!521 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !466, file: !466, line: 1289, type: !134, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!522 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !523, line: 446)
!523 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !466, file: !466, line: 1284, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !525, line: 447)
!525 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !466, file: !466, line: 933, type: !142, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!526 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !527, line: 448)
!527 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !466, file: !466, line: 1371, type: !142, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !529, line: 449)
!529 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !466, file: !466, line: 1140, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!530 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !531, line: 450)
!531 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !466, file: !466, line: 1149, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!532 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !533, line: 451)
!533 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !466, file: !466, line: 1069, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!534 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !535, line: 452)
!535 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !466, file: !466, line: 1395, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !537, line: 453)
!537 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !466, file: !466, line: 1131, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!538 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !539, line: 454)
!539 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !466, file: !466, line: 924, type: !156, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !541, line: 455)
!541 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !466, file: !466, line: 1376, type: !156, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !543, line: 456)
!543 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !466, file: !466, line: 1317, type: !164, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!544 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !545, line: 457)
!545 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !466, file: !466, line: 938, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!546 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !547, line: 458)
!547 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !466, file: !466, line: 1002, type: !48, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!548 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !549, line: 459)
!549 = !DISubprogram(name: "nexttowardf", scope: !223, file: !223, line: 284, type: !550, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!550 = !DISubroutineType(types: !551)
!551 = !{!19, !19, !451}
!552 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !549, line: 460)
!553 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !554, line: 461)
!554 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !466, file: !466, line: 1352, type: !48, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !556, line: 462)
!556 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !466, file: !466, line: 1327, type: !48, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !558, line: 463)
!558 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !466, file: !466, line: 1332, type: !193, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !560, line: 464)
!560 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !466, file: !466, line: 919, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !562, line: 465)
!562 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !466, file: !466, line: 1366, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !564, line: 466)
!564 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !466, file: !466, line: 1299, type: !201, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !566, line: 467)
!566 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !466, file: !466, line: 1294, type: !134, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!567 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !568, line: 468)
!568 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !466, file: !466, line: 1018, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !570, line: 469)
!570 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !466, file: !466, line: 1101, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !572, line: 470)
!572 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !483, file: !483, line: 887, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!573 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !574, line: 471)
!574 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !466, file: !466, line: 1060, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!575 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !576, line: 472)
!576 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !466, file: !466, line: 1106, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!577 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !578, line: 473)
!578 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !466, file: !466, line: 1361, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!579 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !580, line: 474)
!580 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !483, file: !483, line: 642, type: !36, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!581 = !{i32 2, !"Dwarf Version", i32 4}
!582 = !{i32 2, !"Debug Info Version", i32 3}
!583 = !{!"clang version 5.0.0 (trunk 294196)"}
!584 = distinct !DISubprogram(name: "rtclock", linkageName: "_Z7rtclockv", scope: !585, file: !585, line: 11, type: !586, isLocal: false, isDefinition: true, scopeLine: 12, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !588)
!585 = !DIFile(filename: "./../../common/polybenchUtilFuncts.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/syrkllvm")
!586 = !DISubroutineType(types: !587)
!587 = !{!171}
!588 = !{!589, !595, !604}
!589 = !DILocalVariable(name: "Tzp", scope: !584, file: !585, line: 13, type: !590)
!590 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timezone", file: !591, line: 55, size: 64, elements: !592, identifier: "_ZTS8timezone")
!591 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/time.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/syrkllvm")
!592 = !{!593, !594}
!593 = !DIDerivedType(tag: DW_TAG_member, name: "tz_minuteswest", scope: !590, file: !591, line: 57, baseType: !92, size: 32)
!594 = !DIDerivedType(tag: DW_TAG_member, name: "tz_dsttime", scope: !590, file: !591, line: 58, baseType: !92, size: 32, offset: 32)
!595 = !DILocalVariable(name: "Tp", scope: !584, file: !585, line: 14, type: !596)
!596 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timeval", file: !597, line: 30, size: 128, elements: !598, identifier: "_ZTS7timeval")
!597 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/time.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/syrkllvm")
!598 = !{!599, !602}
!599 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !596, file: !597, line: 32, baseType: !600, size: 64)
!600 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !601, line: 139, baseType: !131)
!601 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/syrkllvm")
!602 = !DIDerivedType(tag: DW_TAG_member, name: "tv_usec", scope: !596, file: !597, line: 33, baseType: !603, size: 64, offset: 64)
!603 = !DIDerivedType(tag: DW_TAG_typedef, name: "__suseconds_t", file: !601, line: 141, baseType: !131)
!604 = !DILocalVariable(name: "stat", scope: !584, file: !585, line: 15, type: !92)
!605 = !DILocation(line: 13, column: 5, scope: !584)
!606 = !DILocation(line: 14, column: 5, scope: !584)
!607 = !DIExpression(DW_OP_deref)
!608 = !DILocation(line: 13, column: 21, scope: !584)
!609 = !DILocation(line: 14, column: 20, scope: !584)
!610 = !DILocation(line: 16, column: 12, scope: !584)
!611 = !DIExpression()
!612 = !DILocation(line: 15, column: 9, scope: !584)
!613 = !DILocation(line: 17, column: 14, scope: !614)
!614 = distinct !DILexicalBlock(scope: !584, file: !585, line: 17, column: 9)
!615 = !DILocation(line: 17, column: 9, scope: !584)
!616 = !DILocation(line: 17, column: 20, scope: !617)
!617 = !DILexicalBlockFile(scope: !614, file: !585, discriminator: 1)
!618 = !DILocation(line: 18, column: 15, scope: !584)
!619 = !{!620, !621, i64 0}
!620 = !{!"_ZTS7timeval", !621, i64 0, !621, i64 8}
!621 = !{!"long", !622, i64 0}
!622 = !{!"omnipotent char", !623, i64 0}
!623 = !{!"Simple C++ TBAA"}
!624 = !DILocation(line: 18, column: 12, scope: !584)
!625 = !DILocation(line: 18, column: 27, scope: !584)
!626 = !{!620, !621, i64 8}
!627 = !DILocation(line: 18, column: 24, scope: !584)
!628 = !DILocation(line: 18, column: 34, scope: !584)
!629 = !DILocation(line: 18, column: 22, scope: !584)
!630 = !DILocation(line: 19, column: 1, scope: !584)
!631 = !DILocation(line: 18, column: 5, scope: !584)
!632 = distinct !DISubprogram(name: "absVal", linkageName: "_Z6absValf", scope: !585, file: !585, line: 22, type: !36, isLocal: false, isDefinition: true, scopeLine: 23, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !633)
!633 = !{!634}
!634 = !DILocalVariable(name: "a", arg: 1, scope: !632, file: !585, line: 22, type: !19)
!635 = !DILocation(line: 22, column: 20, scope: !632)
!636 = !DILocation(line: 24, column: 7, scope: !637)
!637 = distinct !DILexicalBlock(scope: !632, file: !585, line: 24, column: 5)
!638 = !DILocation(line: 26, column: 13, scope: !639)
!639 = distinct !DILexicalBlock(scope: !637, file: !585, line: 25, column: 2)
!640 = !DILocation(line: 24, column: 5, scope: !632)
!641 = !DILocation(line: 32, column: 1, scope: !632)
!642 = distinct !DISubprogram(name: "percentDiff", linkageName: "_Z11percentDiffdd", scope: !585, file: !585, line: 36, type: !643, isLocal: false, isDefinition: true, scopeLine: 37, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !645)
!643 = !DISubroutineType(types: !644)
!644 = !{!19, !171, !171}
!645 = !{!646, !647}
!646 = !DILocalVariable(name: "val1", arg: 1, scope: !642, file: !585, line: 36, type: !171)
!647 = !DILocalVariable(name: "val2", arg: 2, scope: !642, file: !585, line: 36, type: !171)
!648 = !DILocation(line: 36, column: 26, scope: !642)
!649 = !DILocation(line: 36, column: 39, scope: !642)
!650 = !DILocation(line: 38, column: 14, scope: !651)
!651 = distinct !DILexicalBlock(scope: !642, file: !585, line: 38, column: 6)
!652 = !DILocation(line: 22, column: 20, scope: !632, inlinedAt: !653)
!653 = distinct !DILocation(line: 38, column: 7, scope: !651)
!654 = !DILocation(line: 24, column: 7, scope: !637, inlinedAt: !653)
!655 = !DILocation(line: 26, column: 13, scope: !639, inlinedAt: !653)
!656 = !DILocation(line: 24, column: 5, scope: !632, inlinedAt: !653)
!657 = !DILocation(line: 38, column: 7, scope: !651)
!658 = !DILocation(line: 38, column: 20, scope: !651)
!659 = !DILocation(line: 38, column: 28, scope: !651)
!660 = !DILocation(line: 38, column: 39, scope: !661)
!661 = !DILexicalBlockFile(scope: !651, file: !585, discriminator: 1)
!662 = !DILocation(line: 22, column: 20, scope: !632, inlinedAt: !663)
!663 = distinct !DILocation(line: 38, column: 32, scope: !661)
!664 = !DILocation(line: 24, column: 7, scope: !637, inlinedAt: !663)
!665 = !DILocation(line: 26, column: 13, scope: !639, inlinedAt: !663)
!666 = !DILocation(line: 24, column: 5, scope: !632, inlinedAt: !663)
!667 = !DILocation(line: 38, column: 32, scope: !661)
!668 = !DILocation(line: 38, column: 45, scope: !661)
!669 = !DILocation(line: 38, column: 6, scope: !670)
!670 = !DILexicalBlockFile(scope: !642, file: !585, discriminator: 1)
!671 = !DILocation(line: 45, column: 43, scope: !672)
!672 = distinct !DILexicalBlock(scope: !651, file: !585, line: 44, column: 2)
!673 = !DILocation(line: 45, column: 38, scope: !672)
!674 = !DILocation(line: 22, column: 20, scope: !632, inlinedAt: !675)
!675 = distinct !DILocation(line: 45, column: 31, scope: !672)
!676 = !DILocation(line: 24, column: 7, scope: !637, inlinedAt: !675)
!677 = !DILocation(line: 26, column: 13, scope: !639, inlinedAt: !675)
!678 = !DILocation(line: 24, column: 5, scope: !632, inlinedAt: !675)
!679 = !DILocation(line: 45, column: 65, scope: !672)
!680 = !DILocation(line: 45, column: 60, scope: !672)
!681 = !DILocation(line: 22, column: 20, scope: !632, inlinedAt: !682)
!682 = distinct !DILocation(line: 45, column: 53, scope: !683)
!683 = !DILexicalBlockFile(scope: !672, file: !585, discriminator: 1)
!684 = !DILocation(line: 24, column: 7, scope: !637, inlinedAt: !682)
!685 = !DILocation(line: 26, column: 13, scope: !639, inlinedAt: !682)
!686 = !DILocation(line: 24, column: 5, scope: !632, inlinedAt: !682)
!687 = !DILocation(line: 45, column: 51, scope: !672)
!688 = !DILocation(line: 22, column: 20, scope: !632, inlinedAt: !689)
!689 = distinct !DILocation(line: 45, column: 24, scope: !690)
!690 = !DILexicalBlockFile(scope: !672, file: !585, discriminator: 2)
!691 = !DILocation(line: 24, column: 7, scope: !637, inlinedAt: !689)
!692 = !DILocation(line: 26, column: 13, scope: !639, inlinedAt: !689)
!693 = !DILocation(line: 24, column: 5, scope: !632, inlinedAt: !689)
!694 = !DILocation(line: 45, column: 21, scope: !672)
!695 = !DILocation(line: 45, column: 7, scope: !672)
!696 = !DILocation(line: 47, column: 1, scope: !642)
!697 = distinct !DISubprogram(name: "init_arrays", linkageName: "_Z11init_arraysPfS_", scope: !1, file: !1, line: 42, type: !698, isLocal: false, isDefinition: true, scopeLine: 43, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !700)
!698 = !DISubroutineType(types: !699)
!699 = !{null, !25, !25}
!700 = !{!701, !702, !703, !704}
!701 = !DILocalVariable(name: "A", arg: 1, scope: !697, file: !1, line: 42, type: !25)
!702 = !DILocalVariable(name: "C", arg: 2, scope: !697, file: !1, line: 42, type: !25)
!703 = !DILocalVariable(name: "i", scope: !697, file: !1, line: 44, type: !92)
!704 = !DILocalVariable(name: "j", scope: !697, file: !1, line: 44, type: !92)
!705 = !DILocation(line: 42, column: 29, scope: !697)
!706 = !DILocation(line: 42, column: 43, scope: !697)
!707 = !DILocation(line: 44, column: 6, scope: !697)
!708 = !DILocation(line: 46, column: 2, scope: !709)
!709 = !DILexicalBlockFile(scope: !710, file: !1, discriminator: 1)
!710 = distinct !DILexicalBlock(scope: !697, file: !1, line: 46, column: 2)
!711 = !DILocation(line: 44, column: 9, scope: !697)
!712 = !DILocation(line: 48, column: 3, scope: !713)
!713 = !DILexicalBlockFile(scope: !714, file: !1, discriminator: 1)
!714 = distinct !DILexicalBlock(scope: !715, file: !1, line: 48, column: 3)
!715 = distinct !DILexicalBlock(scope: !716, file: !1, line: 47, column: 6)
!716 = distinct !DILexicalBlock(scope: !710, file: !1, line: 46, column: 2)
!717 = !DILocation(line: 48, column: 23, scope: !718)
!718 = !DILexicalBlockFile(scope: !719, file: !1, discriminator: 2)
!719 = distinct !DILexicalBlock(scope: !714, file: !1, line: 48, column: 3)
!720 = !DILocation(line: 50, column: 32, scope: !721)
!721 = distinct !DILexicalBlock(scope: !719, file: !1, line: 49, column: 3)
!722 = !DILocation(line: 50, column: 31, scope: !721)
!723 = !DILocation(line: 50, column: 35, scope: !721)
!724 = !DILocation(line: 50, column: 10, scope: !721)
!725 = !DILocation(line: 50, column: 4, scope: !721)
!726 = !DILocation(line: 50, column: 15, scope: !721)
!727 = !{!728, !728, i64 0}
!728 = !{!"float", !622, i64 0}
!729 = distinct !{!729, !730, !731, !732, !733}
!730 = !DILocation(line: 48, column: 3, scope: !714)
!731 = !DILocation(line: 51, column: 3, scope: !714)
!732 = !{!"llvm.loop.vectorize.width", i32 1}
!733 = !{!"llvm.loop.interleave.count", i32 1}
!734 = !DILocation(line: 55, column: 32, scope: !735)
!735 = distinct !DILexicalBlock(scope: !736, file: !1, line: 54, column: 3)
!736 = distinct !DILexicalBlock(scope: !737, file: !1, line: 53, column: 3)
!737 = distinct !DILexicalBlock(scope: !715, file: !1, line: 53, column: 3)
!738 = !DILocation(line: 53, column: 23, scope: !739)
!739 = !DILexicalBlockFile(scope: !736, file: !1, discriminator: 2)
!740 = !DILocation(line: 55, column: 31, scope: !735)
!741 = !DILocation(line: 55, column: 34, scope: !735)
!742 = !DILocation(line: 55, column: 39, scope: !735)
!743 = !DILocation(line: 55, column: 10, scope: !735)
!744 = !DILocation(line: 55, column: 4, scope: !735)
!745 = !DILocation(line: 55, column: 15, scope: !735)
!746 = distinct !{!746, !747, !748, !732, !733}
!747 = !DILocation(line: 53, column: 3, scope: !737)
!748 = !DILocation(line: 56, column: 3, scope: !737)
!749 = !DILocation(line: 46, column: 22, scope: !750)
!750 = !DILexicalBlockFile(scope: !716, file: !1, discriminator: 2)
!751 = !DILocation(line: 46, column: 16, scope: !752)
!752 = !DILexicalBlockFile(scope: !716, file: !1, discriminator: 1)
!753 = distinct !{!753, !754, !755}
!754 = !DILocation(line: 46, column: 2, scope: !710)
!755 = !DILocation(line: 57, column: 2, scope: !710)
!756 = !DILocation(line: 58, column: 1, scope: !697)
!757 = distinct !DISubprogram(name: "syrk", linkageName: "_Z4syrkPfS_", scope: !1, file: !1, line: 61, type: !698, isLocal: false, isDefinition: true, scopeLine: 62, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !758)
!758 = !{!759, !760, !761, !762, !763}
!759 = !DILocalVariable(name: "A", arg: 1, scope: !757, file: !1, line: 61, type: !25)
!760 = !DILocalVariable(name: "C", arg: 2, scope: !757, file: !1, line: 61, type: !25)
!761 = !DILocalVariable(name: "i", scope: !757, file: !1, line: 63, type: !92)
!762 = !DILocalVariable(name: "j", scope: !757, file: !1, line: 63, type: !92)
!763 = !DILocalVariable(name: "k", scope: !757, file: !1, line: 63, type: !92)
!764 = !DILocation(line: 61, column: 22, scope: !757)
!765 = !DILocation(line: 61, column: 36, scope: !757)
!766 = !DILocation(line: 63, column: 6, scope: !757)
!767 = !DILocation(line: 66, column: 2, scope: !768)
!768 = !DILexicalBlockFile(scope: !769, file: !1, discriminator: 1)
!769 = distinct !DILexicalBlock(scope: !757, file: !1, line: 66, column: 2)
!770 = !DILocation(line: 63, column: 9, scope: !757)
!771 = !DILocation(line: 68, column: 3, scope: !772)
!772 = !DILexicalBlockFile(scope: !773, file: !1, discriminator: 1)
!773 = distinct !DILexicalBlock(scope: !774, file: !1, line: 68, column: 3)
!774 = distinct !DILexicalBlock(scope: !775, file: !1, line: 67, column: 2)
!775 = distinct !DILexicalBlock(scope: !769, file: !1, line: 66, column: 2)
!776 = !DILocation(line: 68, column: 23, scope: !777)
!777 = !DILexicalBlockFile(scope: !778, file: !1, discriminator: 2)
!778 = distinct !DILexicalBlock(scope: !773, file: !1, line: 68, column: 3)
!779 = !DILocation(line: 70, column: 10, scope: !780)
!780 = distinct !DILexicalBlock(scope: !778, file: !1, line: 69, column: 3)
!781 = !DILocation(line: 70, column: 4, scope: !780)
!782 = !DILocation(line: 70, column: 15, scope: !780)
!783 = distinct !{!783, !784, !785, !732, !733}
!784 = !DILocation(line: 68, column: 3, scope: !773)
!785 = !DILocation(line: 71, column: 3, scope: !773)
!786 = !DILocation(line: 66, column: 22, scope: !787)
!787 = !DILexicalBlockFile(scope: !775, file: !1, discriminator: 2)
!788 = !DILocation(line: 66, column: 16, scope: !789)
!789 = !DILexicalBlockFile(scope: !775, file: !1, discriminator: 1)
!790 = distinct !{!790, !791, !792}
!791 = !DILocation(line: 66, column: 2, scope: !769)
!792 = !DILocation(line: 72, column: 2, scope: !769)
!793 = !DILocation(line: 76, column: 3, scope: !794)
!794 = !DILexicalBlockFile(scope: !795, file: !1, discriminator: 1)
!795 = distinct !DILexicalBlock(scope: !796, file: !1, line: 76, column: 3)
!796 = distinct !DILexicalBlock(scope: !797, file: !1, line: 75, column: 2)
!797 = distinct !DILexicalBlock(scope: !798, file: !1, line: 74, column: 2)
!798 = distinct !DILexicalBlock(scope: !757, file: !1, line: 74, column: 2)
!799 = !DILocation(line: 63, column: 12, scope: !757)
!800 = !DILocation(line: 78, column: 4, scope: !801)
!801 = !DILexicalBlockFile(scope: !802, file: !1, discriminator: 1)
!802 = distinct !DILexicalBlock(scope: !803, file: !1, line: 78, column: 4)
!803 = distinct !DILexicalBlock(scope: !804, file: !1, line: 77, column: 3)
!804 = distinct !DILexicalBlock(scope: !795, file: !1, line: 76, column: 3)
!805 = !DILocation(line: 80, column: 16, scope: !806)
!806 = distinct !DILexicalBlock(scope: !807, file: !1, line: 79, column: 4)
!807 = distinct !DILexicalBlock(scope: !802, file: !1, line: 78, column: 4)
!808 = !DILocation(line: 80, column: 33, scope: !806)
!809 = !DILocation(line: 80, column: 27, scope: !806)
!810 = !DILocation(line: 80, column: 25, scope: !806)
!811 = !DILocation(line: 80, column: 46, scope: !806)
!812 = !DILocation(line: 80, column: 40, scope: !806)
!813 = !DILocation(line: 80, column: 38, scope: !806)
!814 = !DILocation(line: 78, column: 24, scope: !815)
!815 = !DILexicalBlockFile(scope: !807, file: !1, discriminator: 2)
!816 = !DILocation(line: 78, column: 18, scope: !817)
!817 = !DILexicalBlockFile(scope: !807, file: !1, discriminator: 1)
!818 = distinct !{!818, !819, !820}
!819 = !DILocation(line: 78, column: 4, scope: !802)
!820 = !DILocation(line: 81, column: 4, scope: !802)
!821 = !DILocation(line: 76, column: 23, scope: !822)
!822 = !DILexicalBlockFile(scope: !804, file: !1, discriminator: 2)
!823 = !DILocation(line: 76, column: 17, scope: !824)
!824 = !DILexicalBlockFile(scope: !804, file: !1, discriminator: 1)
!825 = distinct !{!825, !826, !827}
!826 = !DILocation(line: 76, column: 3, scope: !795)
!827 = !DILocation(line: 82, column: 3, scope: !795)
!828 = !DILocation(line: 74, column: 22, scope: !829)
!829 = !DILexicalBlockFile(scope: !797, file: !1, discriminator: 2)
!830 = !DILocation(line: 74, column: 16, scope: !831)
!831 = !DILexicalBlockFile(scope: !797, file: !1, discriminator: 1)
!832 = !DILocation(line: 74, column: 2, scope: !833)
!833 = !DILexicalBlockFile(scope: !798, file: !1, discriminator: 1)
!834 = distinct !{!834, !835, !836}
!835 = !DILocation(line: 74, column: 2, scope: !798)
!836 = !DILocation(line: 83, column: 2, scope: !798)
!837 = !DILocation(line: 84, column: 1, scope: !757)
!838 = distinct !DISubprogram(name: "compareResults", linkageName: "_Z14compareResultsPfS_", scope: !1, file: !1, line: 87, type: !698, isLocal: false, isDefinition: true, scopeLine: 88, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !839)
!839 = !{!840, !841, !842, !843, !844}
!840 = !DILocalVariable(name: "C", arg: 1, scope: !838, file: !1, line: 87, type: !25)
!841 = !DILocalVariable(name: "C_outputFromGpu", arg: 2, scope: !838, file: !1, line: 87, type: !25)
!842 = !DILocalVariable(name: "i", scope: !838, file: !1, line: 89, type: !92)
!843 = !DILocalVariable(name: "j", scope: !838, file: !1, line: 89, type: !92)
!844 = !DILocalVariable(name: "fail", scope: !838, file: !1, line: 89, type: !92)
!845 = !DILocation(line: 87, column: 32, scope: !838)
!846 = !DILocation(line: 87, column: 46, scope: !838)
!847 = !DILocation(line: 89, column: 10, scope: !838)
!848 = !DILocation(line: 89, column: 6, scope: !838)
!849 = !DILocation(line: 93, column: 2, scope: !850)
!850 = !DILexicalBlockFile(scope: !851, file: !1, discriminator: 1)
!851 = distinct !DILexicalBlock(scope: !838, file: !1, line: 93, column: 2)
!852 = !DILocation(line: 89, column: 8, scope: !838)
!853 = !DILocation(line: 95, column: 3, scope: !854)
!854 = !DILexicalBlockFile(scope: !855, file: !1, discriminator: 1)
!855 = distinct !DILexicalBlock(scope: !856, file: !1, line: 95, column: 3)
!856 = distinct !DILexicalBlock(scope: !857, file: !1, line: 94, column: 2)
!857 = distinct !DILexicalBlock(scope: !851, file: !1, line: 93, column: 2)
!858 = !DILocation(line: 95, column: 19, scope: !859)
!859 = !DILexicalBlockFile(scope: !860, file: !1, discriminator: 2)
!860 = distinct !DILexicalBlock(scope: !855, file: !1, line: 95, column: 3)
!861 = !DILocation(line: 97, column: 26, scope: !862)
!862 = distinct !DILexicalBlock(scope: !863, file: !1, line: 97, column: 8)
!863 = distinct !DILexicalBlock(scope: !860, file: !1, line: 96, column: 3)
!864 = !DILocation(line: 97, column: 20, scope: !862)
!865 = !DILocation(line: 97, column: 32, scope: !862)
!866 = !DILocation(line: 24, column: 7, scope: !637, inlinedAt: !867)
!867 = distinct !DILocation(line: 38, column: 7, scope: !651, inlinedAt: !868)
!868 = distinct !DILocation(line: 97, column: 8, scope: !862)
!869 = !DILocation(line: 26, column: 13, scope: !639, inlinedAt: !867)
!870 = !DILocation(line: 24, column: 5, scope: !632, inlinedAt: !867)
!871 = !DILocation(line: 38, column: 7, scope: !651, inlinedAt: !868)
!872 = !DILocation(line: 38, column: 20, scope: !651, inlinedAt: !868)
!873 = !DILocation(line: 24, column: 7, scope: !637, inlinedAt: !874)
!874 = distinct !DILocation(line: 38, column: 32, scope: !661, inlinedAt: !868)
!875 = !DILocation(line: 26, column: 13, scope: !639, inlinedAt: !874)
!876 = !DILocation(line: 24, column: 5, scope: !632, inlinedAt: !874)
!877 = !DILocation(line: 38, column: 32, scope: !661, inlinedAt: !868)
!878 = !DILocation(line: 38, column: 45, scope: !661, inlinedAt: !868)
!879 = !DILocation(line: 45, column: 38, scope: !672, inlinedAt: !868)
!880 = !DILocation(line: 24, column: 7, scope: !637, inlinedAt: !881)
!881 = distinct !DILocation(line: 45, column: 31, scope: !672, inlinedAt: !868)
!882 = !DILocation(line: 26, column: 13, scope: !639, inlinedAt: !881)
!883 = !DILocation(line: 24, column: 5, scope: !632, inlinedAt: !881)
!884 = !DILocation(line: 45, column: 60, scope: !672, inlinedAt: !868)
!885 = !DILocation(line: 24, column: 7, scope: !637, inlinedAt: !886)
!886 = distinct !DILocation(line: 45, column: 53, scope: !683, inlinedAt: !868)
!887 = !DILocation(line: 26, column: 13, scope: !639, inlinedAt: !886)
!888 = !DILocation(line: 24, column: 5, scope: !632, inlinedAt: !886)
!889 = !DILocation(line: 45, column: 51, scope: !672, inlinedAt: !868)
!890 = !DILocation(line: 24, column: 7, scope: !637, inlinedAt: !891)
!891 = distinct !DILocation(line: 45, column: 24, scope: !690, inlinedAt: !868)
!892 = !DILocation(line: 26, column: 13, scope: !639, inlinedAt: !891)
!893 = !DILocation(line: 24, column: 5, scope: !632, inlinedAt: !891)
!894 = !DILocation(line: 45, column: 21, scope: !672, inlinedAt: !868)
!895 = !DILocation(line: 97, column: 8, scope: !862)
!896 = !DILocation(line: 97, column: 58, scope: !862)
!897 = !DILocation(line: 97, column: 8, scope: !863)
!898 = distinct !{!898, !899, !900, !732, !733}
!899 = !DILocation(line: 95, column: 3, scope: !855)
!900 = !DILocation(line: 101, column: 3, scope: !855)
!901 = !DILocation(line: 93, column: 18, scope: !902)
!902 = !DILexicalBlockFile(scope: !857, file: !1, discriminator: 2)
!903 = !DILocation(line: 93, column: 13, scope: !904)
!904 = !DILexicalBlockFile(scope: !857, file: !1, discriminator: 1)
!905 = distinct !{!905, !906, !907}
!906 = !DILocation(line: 93, column: 2, scope: !851)
!907 = !DILocation(line: 102, column: 2, scope: !851)
!908 = !DILocation(line: 105, column: 2, scope: !838)
!909 = !DILocation(line: 106, column: 1, scope: !838)
!910 = distinct !DISubprogram(name: "GPU_argv_init", linkageName: "_Z13GPU_argv_initv", scope: !1, file: !1, line: 109, type: !289, isLocal: false, isDefinition: true, scopeLine: 110, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !911)
!911 = !{!912}
!912 = !DILocalVariable(name: "deviceProp", scope: !910, file: !1, line: 111, type: !913)
!913 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "cudaDeviceProp", file: !4, line: 1257, size: 5056, elements: !914, identifier: "_ZTS14cudaDeviceProp")
!914 = !{!915, !919, !920, !921, !922, !923, !924, !925, !929, !930, !931, !932, !933, !934, !935, !936, !937, !938, !939, !940, !941, !942, !943, !944, !945, !949, !950, !951, !952, !953, !954, !955, !956, !957, !958, !959, !960, !961, !962, !963, !964, !965, !966, !967, !968, !969, !970, !971, !972, !973, !974, !975, !976, !977, !978, !979, !980, !981, !982, !983, !984, !985}
!915 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !913, file: !4, line: 1259, baseType: !916, size: 2048)
!916 = !DICompositeType(tag: DW_TAG_array_type, baseType: !174, size: 2048, elements: !917)
!917 = !{!918}
!918 = !DISubrange(count: 256)
!919 = !DIDerivedType(tag: DW_TAG_member, name: "totalGlobalMem", scope: !913, file: !4, line: 1260, baseType: !22, size: 64, offset: 2048)
!920 = !DIDerivedType(tag: DW_TAG_member, name: "sharedMemPerBlock", scope: !913, file: !4, line: 1261, baseType: !22, size: 64, offset: 2112)
!921 = !DIDerivedType(tag: DW_TAG_member, name: "regsPerBlock", scope: !913, file: !4, line: 1262, baseType: !92, size: 32, offset: 2176)
!922 = !DIDerivedType(tag: DW_TAG_member, name: "warpSize", scope: !913, file: !4, line: 1263, baseType: !92, size: 32, offset: 2208)
!923 = !DIDerivedType(tag: DW_TAG_member, name: "memPitch", scope: !913, file: !4, line: 1264, baseType: !22, size: 64, offset: 2240)
!924 = !DIDerivedType(tag: DW_TAG_member, name: "maxThreadsPerBlock", scope: !913, file: !4, line: 1265, baseType: !92, size: 32, offset: 2304)
!925 = !DIDerivedType(tag: DW_TAG_member, name: "maxThreadsDim", scope: !913, file: !4, line: 1266, baseType: !926, size: 96, offset: 2336)
!926 = !DICompositeType(tag: DW_TAG_array_type, baseType: !92, size: 96, elements: !927)
!927 = !{!928}
!928 = !DISubrange(count: 3)
!929 = !DIDerivedType(tag: DW_TAG_member, name: "maxGridSize", scope: !913, file: !4, line: 1267, baseType: !926, size: 96, offset: 2432)
!930 = !DIDerivedType(tag: DW_TAG_member, name: "clockRate", scope: !913, file: !4, line: 1268, baseType: !92, size: 32, offset: 2528)
!931 = !DIDerivedType(tag: DW_TAG_member, name: "totalConstMem", scope: !913, file: !4, line: 1269, baseType: !22, size: 64, offset: 2560)
!932 = !DIDerivedType(tag: DW_TAG_member, name: "major", scope: !913, file: !4, line: 1270, baseType: !92, size: 32, offset: 2624)
!933 = !DIDerivedType(tag: DW_TAG_member, name: "minor", scope: !913, file: !4, line: 1271, baseType: !92, size: 32, offset: 2656)
!934 = !DIDerivedType(tag: DW_TAG_member, name: "textureAlignment", scope: !913, file: !4, line: 1272, baseType: !22, size: 64, offset: 2688)
!935 = !DIDerivedType(tag: DW_TAG_member, name: "texturePitchAlignment", scope: !913, file: !4, line: 1273, baseType: !22, size: 64, offset: 2752)
!936 = !DIDerivedType(tag: DW_TAG_member, name: "deviceOverlap", scope: !913, file: !4, line: 1274, baseType: !92, size: 32, offset: 2816)
!937 = !DIDerivedType(tag: DW_TAG_member, name: "multiProcessorCount", scope: !913, file: !4, line: 1275, baseType: !92, size: 32, offset: 2848)
!938 = !DIDerivedType(tag: DW_TAG_member, name: "kernelExecTimeoutEnabled", scope: !913, file: !4, line: 1276, baseType: !92, size: 32, offset: 2880)
!939 = !DIDerivedType(tag: DW_TAG_member, name: "integrated", scope: !913, file: !4, line: 1277, baseType: !92, size: 32, offset: 2912)
!940 = !DIDerivedType(tag: DW_TAG_member, name: "canMapHostMemory", scope: !913, file: !4, line: 1278, baseType: !92, size: 32, offset: 2944)
!941 = !DIDerivedType(tag: DW_TAG_member, name: "computeMode", scope: !913, file: !4, line: 1279, baseType: !92, size: 32, offset: 2976)
!942 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture1D", scope: !913, file: !4, line: 1280, baseType: !92, size: 32, offset: 3008)
!943 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture1DMipmap", scope: !913, file: !4, line: 1281, baseType: !92, size: 32, offset: 3040)
!944 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture1DLinear", scope: !913, file: !4, line: 1282, baseType: !92, size: 32, offset: 3072)
!945 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2D", scope: !913, file: !4, line: 1283, baseType: !946, size: 64, offset: 3104)
!946 = !DICompositeType(tag: DW_TAG_array_type, baseType: !92, size: 64, elements: !947)
!947 = !{!948}
!948 = !DISubrange(count: 2)
!949 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2DMipmap", scope: !913, file: !4, line: 1284, baseType: !946, size: 64, offset: 3168)
!950 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2DLinear", scope: !913, file: !4, line: 1285, baseType: !926, size: 96, offset: 3232)
!951 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2DGather", scope: !913, file: !4, line: 1286, baseType: !946, size: 64, offset: 3328)
!952 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture3D", scope: !913, file: !4, line: 1287, baseType: !926, size: 96, offset: 3392)
!953 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture3DAlt", scope: !913, file: !4, line: 1288, baseType: !926, size: 96, offset: 3488)
!954 = !DIDerivedType(tag: DW_TAG_member, name: "maxTextureCubemap", scope: !913, file: !4, line: 1289, baseType: !92, size: 32, offset: 3584)
!955 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture1DLayered", scope: !913, file: !4, line: 1290, baseType: !946, size: 64, offset: 3616)
!956 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2DLayered", scope: !913, file: !4, line: 1291, baseType: !926, size: 96, offset: 3680)
!957 = !DIDerivedType(tag: DW_TAG_member, name: "maxTextureCubemapLayered", scope: !913, file: !4, line: 1292, baseType: !946, size: 64, offset: 3776)
!958 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface1D", scope: !913, file: !4, line: 1293, baseType: !92, size: 32, offset: 3840)
!959 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface2D", scope: !913, file: !4, line: 1294, baseType: !946, size: 64, offset: 3872)
!960 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface3D", scope: !913, file: !4, line: 1295, baseType: !926, size: 96, offset: 3936)
!961 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface1DLayered", scope: !913, file: !4, line: 1296, baseType: !946, size: 64, offset: 4032)
!962 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface2DLayered", scope: !913, file: !4, line: 1297, baseType: !926, size: 96, offset: 4096)
!963 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurfaceCubemap", scope: !913, file: !4, line: 1298, baseType: !92, size: 32, offset: 4192)
!964 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurfaceCubemapLayered", scope: !913, file: !4, line: 1299, baseType: !946, size: 64, offset: 4224)
!965 = !DIDerivedType(tag: DW_TAG_member, name: "surfaceAlignment", scope: !913, file: !4, line: 1300, baseType: !22, size: 64, offset: 4288)
!966 = !DIDerivedType(tag: DW_TAG_member, name: "concurrentKernels", scope: !913, file: !4, line: 1301, baseType: !92, size: 32, offset: 4352)
!967 = !DIDerivedType(tag: DW_TAG_member, name: "ECCEnabled", scope: !913, file: !4, line: 1302, baseType: !92, size: 32, offset: 4384)
!968 = !DIDerivedType(tag: DW_TAG_member, name: "pciBusID", scope: !913, file: !4, line: 1303, baseType: !92, size: 32, offset: 4416)
!969 = !DIDerivedType(tag: DW_TAG_member, name: "pciDeviceID", scope: !913, file: !4, line: 1304, baseType: !92, size: 32, offset: 4448)
!970 = !DIDerivedType(tag: DW_TAG_member, name: "pciDomainID", scope: !913, file: !4, line: 1305, baseType: !92, size: 32, offset: 4480)
!971 = !DIDerivedType(tag: DW_TAG_member, name: "tccDriver", scope: !913, file: !4, line: 1306, baseType: !92, size: 32, offset: 4512)
!972 = !DIDerivedType(tag: DW_TAG_member, name: "asyncEngineCount", scope: !913, file: !4, line: 1307, baseType: !92, size: 32, offset: 4544)
!973 = !DIDerivedType(tag: DW_TAG_member, name: "unifiedAddressing", scope: !913, file: !4, line: 1308, baseType: !92, size: 32, offset: 4576)
!974 = !DIDerivedType(tag: DW_TAG_member, name: "memoryClockRate", scope: !913, file: !4, line: 1309, baseType: !92, size: 32, offset: 4608)
!975 = !DIDerivedType(tag: DW_TAG_member, name: "memoryBusWidth", scope: !913, file: !4, line: 1310, baseType: !92, size: 32, offset: 4640)
!976 = !DIDerivedType(tag: DW_TAG_member, name: "l2CacheSize", scope: !913, file: !4, line: 1311, baseType: !92, size: 32, offset: 4672)
!977 = !DIDerivedType(tag: DW_TAG_member, name: "maxThreadsPerMultiProcessor", scope: !913, file: !4, line: 1312, baseType: !92, size: 32, offset: 4704)
!978 = !DIDerivedType(tag: DW_TAG_member, name: "streamPrioritiesSupported", scope: !913, file: !4, line: 1313, baseType: !92, size: 32, offset: 4736)
!979 = !DIDerivedType(tag: DW_TAG_member, name: "globalL1CacheSupported", scope: !913, file: !4, line: 1314, baseType: !92, size: 32, offset: 4768)
!980 = !DIDerivedType(tag: DW_TAG_member, name: "localL1CacheSupported", scope: !913, file: !4, line: 1315, baseType: !92, size: 32, offset: 4800)
!981 = !DIDerivedType(tag: DW_TAG_member, name: "sharedMemPerMultiprocessor", scope: !913, file: !4, line: 1316, baseType: !22, size: 64, offset: 4864)
!982 = !DIDerivedType(tag: DW_TAG_member, name: "regsPerMultiprocessor", scope: !913, file: !4, line: 1317, baseType: !92, size: 32, offset: 4928)
!983 = !DIDerivedType(tag: DW_TAG_member, name: "managedMemory", scope: !913, file: !4, line: 1318, baseType: !92, size: 32, offset: 4960)
!984 = !DIDerivedType(tag: DW_TAG_member, name: "isMultiGpuBoard", scope: !913, file: !4, line: 1319, baseType: !92, size: 32, offset: 4992)
!985 = !DIDerivedType(tag: DW_TAG_member, name: "multiGpuBoardGroupID", scope: !913, file: !4, line: 1320, baseType: !92, size: 32, offset: 5024)
!986 = !DILocation(line: 111, column: 2, scope: !910)
!987 = !DILocation(line: 111, column: 17, scope: !910)
!988 = !DILocation(line: 112, column: 2, scope: !910)
!989 = !DILocation(line: 113, column: 2, scope: !910)
!990 = !DILocation(line: 114, column: 2, scope: !910)
!991 = !DILocation(line: 117, column: 1, scope: !910)
!992 = distinct !DISubprogram(name: "syrk_kernel", linkageName: "_Z11syrk_kernelffPfS_", scope: !1, file: !1, line: 120, type: !993, isLocal: false, isDefinition: true, scopeLine: 121, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !995)
!993 = !DISubroutineType(types: !994)
!994 = !{null, !18, !18, !25, !25}
!995 = !{!996, !997, !998, !999}
!996 = !DILocalVariable(name: "ALPHA", arg: 1, scope: !992, file: !1, line: 120, type: !18)
!997 = !DILocalVariable(name: "BETA", arg: 2, scope: !992, file: !1, line: 120, type: !18)
!998 = !DILocalVariable(name: "a", arg: 3, scope: !992, file: !1, line: 120, type: !25)
!999 = !DILocalVariable(name: "c", arg: 4, scope: !992, file: !1, line: 120, type: !25)
!1000 = !DILocation(line: 120, column: 39, scope: !992)
!1001 = !DILocation(line: 120, column: 56, scope: !992)
!1002 = !DILocation(line: 120, column: 73, scope: !992)
!1003 = !{!1004, !1004, i64 0}
!1004 = !{!"any pointer", !622, i64 0}
!1005 = !DILocation(line: 120, column: 87, scope: !992)
!1006 = !DILocation(line: 121, column: 1, scope: !992)
!1007 = !DILocation(line: 121, column: 1, scope: !1008)
!1008 = !DILexicalBlockFile(scope: !992, file: !1, discriminator: 1)
!1009 = !DILocation(line: 121, column: 1, scope: !1010)
!1010 = !DILexicalBlockFile(scope: !992, file: !1, discriminator: 2)
!1011 = !DILocation(line: 121, column: 1, scope: !1012)
!1012 = !DILexicalBlockFile(scope: !992, file: !1, discriminator: 3)
!1013 = !DILocation(line: 121, column: 1, scope: !1014)
!1014 = !DILexicalBlockFile(scope: !992, file: !1, discriminator: 4)
!1015 = !DILocation(line: 135, column: 1, scope: !992)
!1016 = distinct !DISubprogram(name: "syrkCuda", linkageName: "_Z8syrkCudaPfS_S_", scope: !1, file: !1, line: 138, type: !1017, isLocal: false, isDefinition: true, scopeLine: 139, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !1019)
!1017 = !DISubroutineType(types: !1018)
!1018 = !{null, !25, !25, !25}
!1019 = !{!1020, !1021, !1022, !1023, !1024, !1025, !1026, !1027, !1051}
!1020 = !DILocalVariable(name: "A", arg: 1, scope: !1016, file: !1, line: 138, type: !25)
!1021 = !DILocalVariable(name: "C", arg: 2, scope: !1016, file: !1, line: 138, type: !25)
!1022 = !DILocalVariable(name: "C_outputFromGpu", arg: 3, scope: !1016, file: !1, line: 138, type: !25)
!1023 = !DILocalVariable(name: "t_start", scope: !1016, file: !1, line: 140, type: !171)
!1024 = !DILocalVariable(name: "t_end", scope: !1016, file: !1, line: 140, type: !171)
!1025 = !DILocalVariable(name: "A_gpu", scope: !1016, file: !1, line: 142, type: !25)
!1026 = !DILocalVariable(name: "C_gpu", scope: !1016, file: !1, line: 143, type: !25)
!1027 = !DILocalVariable(name: "block", scope: !1016, file: !1, line: 150, type: !1028)
!1028 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !1029, line: 427, baseType: !1030)
!1029 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/syrkllvm")
!1030 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !1029, line: 417, size: 96, elements: !1031, identifier: "_ZTS4dim3")
!1031 = !{!1032, !1033, !1034, !1035, !1039, !1048}
!1032 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1030, file: !1029, line: 419, baseType: !385, size: 32)
!1033 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1030, file: !1029, line: 419, baseType: !385, size: 32, offset: 32)
!1034 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1030, file: !1029, line: 419, baseType: !385, size: 32, offset: 64)
!1035 = !DISubprogram(name: "dim3", scope: !1030, file: !1029, line: 421, type: !1036, isLocal: false, isDefinition: false, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: true)
!1036 = !DISubroutineType(types: !1037)
!1037 = !{null, !1038, !385, !385, !385}
!1038 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1030, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1039 = !DISubprogram(name: "dim3", scope: !1030, file: !1029, line: 422, type: !1040, isLocal: false, isDefinition: false, scopeLine: 422, flags: DIFlagPrototyped, isOptimized: true)
!1040 = !DISubroutineType(types: !1041)
!1041 = !{null, !1038, !1042}
!1042 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !1029, line: 383, baseType: !1043)
!1043 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !1029, line: 190, size: 96, elements: !1044, identifier: "_ZTS5uint3")
!1044 = !{!1045, !1046, !1047}
!1045 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1043, file: !1029, line: 192, baseType: !385, size: 32)
!1046 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1043, file: !1029, line: 192, baseType: !385, size: 32, offset: 32)
!1047 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1043, file: !1029, line: 192, baseType: !385, size: 32, offset: 64)
!1048 = !DISubprogram(name: "operator uint3", linkageName: "_ZN4dim3cv5uint3Ev", scope: !1030, file: !1029, line: 423, type: !1049, isLocal: false, isDefinition: false, scopeLine: 423, flags: DIFlagPrototyped, isOptimized: true)
!1049 = !DISubroutineType(types: !1050)
!1050 = !{!1042, !1038}
!1051 = !DILocalVariable(name: "grid", scope: !1016, file: !1, line: 151, type: !1028)
!1052 = !DILocation(line: 138, column: 26, scope: !1016)
!1053 = !DILocation(line: 138, column: 40, scope: !1016)
!1054 = !DILocation(line: 138, column: 54, scope: !1016)
!1055 = !DILocation(line: 142, column: 2, scope: !1016)
!1056 = !DILocation(line: 143, column: 2, scope: !1016)
!1057 = !DILocation(line: 145, column: 13, scope: !1016)
!1058 = !DILocation(line: 145, column: 2, scope: !1016)
!1059 = !DILocation(line: 146, column: 13, scope: !1016)
!1060 = !DILocation(line: 146, column: 2, scope: !1016)
!1061 = !DILocation(line: 147, column: 13, scope: !1016)
!1062 = !DILocation(line: 147, column: 20, scope: !1016)
!1063 = !DILocation(line: 147, column: 2, scope: !1016)
!1064 = !DILocation(line: 148, column: 13, scope: !1016)
!1065 = !DILocation(line: 148, column: 20, scope: !1016)
!1066 = !DILocation(line: 148, column: 2, scope: !1016)
!1067 = !DILocation(line: 150, column: 7, scope: !1016)
!1068 = !DILocation(line: 151, column: 7, scope: !1016)
!1069 = !DILocation(line: 153, column: 2, scope: !1016)
!1070 = !DILocation(line: 155, column: 9, scope: !1016)
!1071 = !DILocation(line: 158, column: 2, scope: !1016)
!1072 = !DILocation(line: 13, column: 5, scope: !584, inlinedAt: !1073)
!1073 = distinct !DILocation(line: 159, column: 12, scope: !1016)
!1074 = !DILocation(line: 14, column: 5, scope: !584, inlinedAt: !1073)
!1075 = !DILocation(line: 13, column: 21, scope: !584, inlinedAt: !1073)
!1076 = !DILocation(line: 14, column: 20, scope: !584, inlinedAt: !1073)
!1077 = !DILocation(line: 16, column: 12, scope: !584, inlinedAt: !1073)
!1078 = !DILocation(line: 15, column: 9, scope: !584, inlinedAt: !1073)
!1079 = !DILocation(line: 17, column: 14, scope: !614, inlinedAt: !1073)
!1080 = !DILocation(line: 17, column: 9, scope: !584, inlinedAt: !1073)
!1081 = !DILocation(line: 17, column: 20, scope: !617, inlinedAt: !1073)
!1082 = !DILocation(line: 18, column: 15, scope: !584, inlinedAt: !1073)
!1083 = !DILocation(line: 18, column: 12, scope: !584, inlinedAt: !1073)
!1084 = !DILocation(line: 18, column: 27, scope: !584, inlinedAt: !1073)
!1085 = !DILocation(line: 18, column: 24, scope: !584, inlinedAt: !1073)
!1086 = !DILocation(line: 18, column: 34, scope: !584, inlinedAt: !1073)
!1087 = !DILocation(line: 18, column: 22, scope: !584, inlinedAt: !1073)
!1088 = !DILocation(line: 19, column: 1, scope: !584, inlinedAt: !1073)
!1089 = !DILocation(line: 140, column: 9, scope: !1016)
!1090 = !DILocation(line: 160, column: 13, scope: !1016)
!1091 = !DILocation(line: 160, column: 2, scope: !1016)
!1092 = !DILocation(line: 160, column: 43, scope: !1093)
!1093 = !DILexicalBlockFile(scope: !1016, file: !1, discriminator: 1)
!1094 = !DILocation(line: 142, column: 13, scope: !1016)
!1095 = !DILocation(line: 160, column: 49, scope: !1093)
!1096 = !DILocation(line: 143, column: 13, scope: !1016)
!1097 = !DILocation(line: 160, column: 2, scope: !1093)
!1098 = !DILocation(line: 161, column: 2, scope: !1016)
!1099 = !DILocation(line: 13, column: 5, scope: !584, inlinedAt: !1100)
!1100 = distinct !DILocation(line: 162, column: 10, scope: !1016)
!1101 = !DILocation(line: 14, column: 5, scope: !584, inlinedAt: !1100)
!1102 = !DILocation(line: 13, column: 21, scope: !584, inlinedAt: !1100)
!1103 = !DILocation(line: 14, column: 20, scope: !584, inlinedAt: !1100)
!1104 = !DILocation(line: 16, column: 12, scope: !584, inlinedAt: !1100)
!1105 = !DILocation(line: 15, column: 9, scope: !584, inlinedAt: !1100)
!1106 = !DILocation(line: 17, column: 14, scope: !614, inlinedAt: !1100)
!1107 = !DILocation(line: 17, column: 9, scope: !584, inlinedAt: !1100)
!1108 = !DILocation(line: 17, column: 20, scope: !617, inlinedAt: !1100)
!1109 = !DILocation(line: 18, column: 15, scope: !584, inlinedAt: !1100)
!1110 = !DILocation(line: 18, column: 12, scope: !584, inlinedAt: !1100)
!1111 = !DILocation(line: 18, column: 27, scope: !584, inlinedAt: !1100)
!1112 = !DILocation(line: 18, column: 24, scope: !584, inlinedAt: !1100)
!1113 = !DILocation(line: 18, column: 34, scope: !584, inlinedAt: !1100)
!1114 = !DILocation(line: 18, column: 22, scope: !584, inlinedAt: !1100)
!1115 = !DILocation(line: 19, column: 1, scope: !584, inlinedAt: !1100)
!1116 = !DILocation(line: 140, column: 18, scope: !1016)
!1117 = !DILocation(line: 163, column: 10, scope: !1016)
!1118 = !DILocation(line: 163, column: 50, scope: !1016)
!1119 = !DILocation(line: 163, column: 2, scope: !1016)
!1120 = !DILocation(line: 164, column: 10, scope: !1016)
!1121 = !DILocation(line: 164, column: 2, scope: !1016)
!1122 = !DILocation(line: 166, column: 13, scope: !1016)
!1123 = !DILocation(line: 166, column: 30, scope: !1016)
!1124 = !DILocation(line: 166, column: 2, scope: !1016)
!1125 = !DILocation(line: 168, column: 11, scope: !1016)
!1126 = !DILocation(line: 168, column: 2, scope: !1016)
!1127 = !DILocation(line: 169, column: 11, scope: !1016)
!1128 = !DILocation(line: 169, column: 2, scope: !1016)
!1129 = !DILocation(line: 170, column: 1, scope: !1016)
!1130 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 173, type: !375, isLocal: false, isDefinition: true, scopeLine: 174, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !1131)
!1131 = !{!1132, !1133, !1134, !1135, !1136}
!1132 = !DILocalVariable(name: "t_start", scope: !1130, file: !1, line: 175, type: !171)
!1133 = !DILocalVariable(name: "t_end", scope: !1130, file: !1, line: 175, type: !171)
!1134 = !DILocalVariable(name: "A", scope: !1130, file: !1, line: 177, type: !25)
!1135 = !DILocalVariable(name: "C", scope: !1130, file: !1, line: 178, type: !25)
!1136 = !DILocalVariable(name: "C_outputFromGpu", scope: !1130, file: !1, line: 179, type: !25)
!1137 = !DILocation(line: 181, column: 18, scope: !1130)
!1138 = !DILocation(line: 181, column: 6, scope: !1130)
!1139 = !DILocation(line: 177, column: 13, scope: !1130)
!1140 = !DILocation(line: 182, column: 18, scope: !1130)
!1141 = !DILocation(line: 182, column: 6, scope: !1130)
!1142 = !DILocation(line: 178, column: 13, scope: !1130)
!1143 = !DILocation(line: 183, column: 32, scope: !1130)
!1144 = !DILocation(line: 179, column: 13, scope: !1130)
!1145 = !DILocation(line: 42, column: 29, scope: !697, inlinedAt: !1146)
!1146 = distinct !DILocation(line: 185, column: 2, scope: !1130)
!1147 = !DILocation(line: 42, column: 43, scope: !697, inlinedAt: !1146)
!1148 = !DILocation(line: 44, column: 6, scope: !697, inlinedAt: !1146)
!1149 = !DILocation(line: 46, column: 2, scope: !709, inlinedAt: !1146)
!1150 = !DILocation(line: 44, column: 9, scope: !697, inlinedAt: !1146)
!1151 = !DILocation(line: 48, column: 3, scope: !713, inlinedAt: !1146)
!1152 = !DILocation(line: 48, column: 23, scope: !718, inlinedAt: !1146)
!1153 = !DILocation(line: 50, column: 32, scope: !721, inlinedAt: !1146)
!1154 = !DILocation(line: 50, column: 31, scope: !721, inlinedAt: !1146)
!1155 = !DILocation(line: 50, column: 35, scope: !721, inlinedAt: !1146)
!1156 = !DILocation(line: 50, column: 10, scope: !721, inlinedAt: !1146)
!1157 = !DILocation(line: 50, column: 4, scope: !721, inlinedAt: !1146)
!1158 = !DILocation(line: 50, column: 15, scope: !721, inlinedAt: !1146)
!1159 = distinct !{!1159, !730, !731, !732, !733}
!1160 = !DILocation(line: 55, column: 32, scope: !735, inlinedAt: !1146)
!1161 = !DILocation(line: 53, column: 23, scope: !739, inlinedAt: !1146)
!1162 = !DILocation(line: 55, column: 31, scope: !735, inlinedAt: !1146)
!1163 = !DILocation(line: 55, column: 34, scope: !735, inlinedAt: !1146)
!1164 = !DILocation(line: 55, column: 39, scope: !735, inlinedAt: !1146)
!1165 = !DILocation(line: 55, column: 10, scope: !735, inlinedAt: !1146)
!1166 = !DILocation(line: 55, column: 4, scope: !735, inlinedAt: !1146)
!1167 = !DILocation(line: 55, column: 15, scope: !735, inlinedAt: !1146)
!1168 = distinct !{!1168, !747, !748, !732, !733}
!1169 = !DILocation(line: 46, column: 22, scope: !750, inlinedAt: !1146)
!1170 = !DILocation(line: 46, column: 16, scope: !752, inlinedAt: !1146)
!1171 = !DILocation(line: 183, column: 20, scope: !1130)
!1172 = !DILocation(line: 111, column: 2, scope: !910, inlinedAt: !1173)
!1173 = distinct !DILocation(line: 187, column: 2, scope: !1130)
!1174 = !DILocation(line: 111, column: 17, scope: !910, inlinedAt: !1173)
!1175 = !DILocation(line: 112, column: 2, scope: !910, inlinedAt: !1173)
!1176 = !DILocation(line: 113, column: 2, scope: !910, inlinedAt: !1173)
!1177 = !DILocation(line: 114, column: 2, scope: !910, inlinedAt: !1173)
!1178 = !DILocation(line: 117, column: 1, scope: !910, inlinedAt: !1173)
!1179 = !DILocation(line: 188, column: 2, scope: !1130)
!1180 = !DILocation(line: 13, column: 5, scope: !584, inlinedAt: !1181)
!1181 = distinct !DILocation(line: 190, column: 12, scope: !1130)
!1182 = !DILocation(line: 14, column: 5, scope: !584, inlinedAt: !1181)
!1183 = !DILocation(line: 13, column: 21, scope: !584, inlinedAt: !1181)
!1184 = !DILocation(line: 14, column: 20, scope: !584, inlinedAt: !1181)
!1185 = !DILocation(line: 16, column: 12, scope: !584, inlinedAt: !1181)
!1186 = !DILocation(line: 15, column: 9, scope: !584, inlinedAt: !1181)
!1187 = !DILocation(line: 17, column: 14, scope: !614, inlinedAt: !1181)
!1188 = !DILocation(line: 17, column: 9, scope: !584, inlinedAt: !1181)
!1189 = !DILocation(line: 17, column: 20, scope: !617, inlinedAt: !1181)
!1190 = !DILocation(line: 18, column: 15, scope: !584, inlinedAt: !1181)
!1191 = !DILocation(line: 18, column: 27, scope: !584, inlinedAt: !1181)
!1192 = !DILocation(line: 18, column: 24, scope: !584, inlinedAt: !1181)
!1193 = !DILocation(line: 18, column: 34, scope: !584, inlinedAt: !1181)
!1194 = !DILocation(line: 19, column: 1, scope: !584, inlinedAt: !1181)
!1195 = !DILocation(line: 175, column: 9, scope: !1130)
!1196 = !DILocation(line: 61, column: 22, scope: !757, inlinedAt: !1197)
!1197 = distinct !DILocation(line: 191, column: 2, scope: !1130)
!1198 = !DILocation(line: 61, column: 36, scope: !757, inlinedAt: !1197)
!1199 = !DILocation(line: 63, column: 6, scope: !757, inlinedAt: !1197)
!1200 = !DILocation(line: 66, column: 2, scope: !768, inlinedAt: !1197)
!1201 = !DILocation(line: 63, column: 9, scope: !757, inlinedAt: !1197)
!1202 = !DILocation(line: 68, column: 3, scope: !772, inlinedAt: !1197)
!1203 = !DILocation(line: 68, column: 23, scope: !777, inlinedAt: !1197)
!1204 = !DILocation(line: 70, column: 10, scope: !780, inlinedAt: !1197)
!1205 = !DILocation(line: 70, column: 4, scope: !780, inlinedAt: !1197)
!1206 = !DILocation(line: 70, column: 15, scope: !780, inlinedAt: !1197)
!1207 = distinct !{!1207, !784, !785, !732, !733}
!1208 = !DILocation(line: 66, column: 22, scope: !787, inlinedAt: !1197)
!1209 = !DILocation(line: 66, column: 16, scope: !789, inlinedAt: !1197)
!1210 = !DILocation(line: 18, column: 12, scope: !584, inlinedAt: !1181)
!1211 = !DILocation(line: 18, column: 22, scope: !584, inlinedAt: !1181)
!1212 = !DILocation(line: 76, column: 3, scope: !794, inlinedAt: !1197)
!1213 = !DILocation(line: 63, column: 12, scope: !757, inlinedAt: !1197)
!1214 = !DILocation(line: 78, column: 4, scope: !801, inlinedAt: !1197)
!1215 = !DILocation(line: 80, column: 16, scope: !806, inlinedAt: !1197)
!1216 = !DILocation(line: 80, column: 33, scope: !806, inlinedAt: !1197)
!1217 = !DILocation(line: 80, column: 27, scope: !806, inlinedAt: !1197)
!1218 = !DILocation(line: 80, column: 25, scope: !806, inlinedAt: !1197)
!1219 = !DILocation(line: 80, column: 46, scope: !806, inlinedAt: !1197)
!1220 = !DILocation(line: 80, column: 40, scope: !806, inlinedAt: !1197)
!1221 = !DILocation(line: 80, column: 38, scope: !806, inlinedAt: !1197)
!1222 = !DILocation(line: 78, column: 24, scope: !815, inlinedAt: !1197)
!1223 = !DILocation(line: 78, column: 18, scope: !817, inlinedAt: !1197)
!1224 = !DILocation(line: 76, column: 23, scope: !822, inlinedAt: !1197)
!1225 = !DILocation(line: 76, column: 17, scope: !824, inlinedAt: !1197)
!1226 = !DILocation(line: 74, column: 22, scope: !829, inlinedAt: !1197)
!1227 = !DILocation(line: 74, column: 16, scope: !831, inlinedAt: !1197)
!1228 = !DILocation(line: 74, column: 2, scope: !833, inlinedAt: !1197)
!1229 = !DILocation(line: 13, column: 5, scope: !584, inlinedAt: !1230)
!1230 = distinct !DILocation(line: 192, column: 10, scope: !1130)
!1231 = !DILocation(line: 14, column: 5, scope: !584, inlinedAt: !1230)
!1232 = !DILocation(line: 13, column: 21, scope: !584, inlinedAt: !1230)
!1233 = !DILocation(line: 14, column: 20, scope: !584, inlinedAt: !1230)
!1234 = !DILocation(line: 16, column: 12, scope: !584, inlinedAt: !1230)
!1235 = !DILocation(line: 15, column: 9, scope: !584, inlinedAt: !1230)
!1236 = !DILocation(line: 17, column: 14, scope: !614, inlinedAt: !1230)
!1237 = !DILocation(line: 17, column: 9, scope: !584, inlinedAt: !1230)
!1238 = !DILocation(line: 17, column: 20, scope: !617, inlinedAt: !1230)
!1239 = !DILocation(line: 18, column: 15, scope: !584, inlinedAt: !1230)
!1240 = !DILocation(line: 18, column: 12, scope: !584, inlinedAt: !1230)
!1241 = !DILocation(line: 18, column: 27, scope: !584, inlinedAt: !1230)
!1242 = !DILocation(line: 18, column: 24, scope: !584, inlinedAt: !1230)
!1243 = !DILocation(line: 18, column: 34, scope: !584, inlinedAt: !1230)
!1244 = !DILocation(line: 18, column: 22, scope: !584, inlinedAt: !1230)
!1245 = !DILocation(line: 19, column: 1, scope: !584, inlinedAt: !1230)
!1246 = !DILocation(line: 175, column: 18, scope: !1130)
!1247 = !DILocation(line: 193, column: 10, scope: !1130)
!1248 = !DILocation(line: 193, column: 50, scope: !1130)
!1249 = !DILocation(line: 193, column: 2, scope: !1130)
!1250 = !DILocation(line: 87, column: 32, scope: !838, inlinedAt: !1251)
!1251 = distinct !DILocation(line: 195, column: 2, scope: !1130)
!1252 = !DILocation(line: 87, column: 46, scope: !838, inlinedAt: !1251)
!1253 = !DILocation(line: 89, column: 10, scope: !838, inlinedAt: !1251)
!1254 = !DILocation(line: 89, column: 6, scope: !838, inlinedAt: !1251)
!1255 = !DILocation(line: 93, column: 2, scope: !850, inlinedAt: !1251)
!1256 = !DILocation(line: 89, column: 8, scope: !838, inlinedAt: !1251)
!1257 = !DILocation(line: 95, column: 3, scope: !854, inlinedAt: !1251)
!1258 = !DILocation(line: 95, column: 19, scope: !859, inlinedAt: !1251)
!1259 = !DILocation(line: 97, column: 26, scope: !862, inlinedAt: !1251)
!1260 = !DILocation(line: 97, column: 20, scope: !862, inlinedAt: !1251)
!1261 = !DILocation(line: 97, column: 32, scope: !862, inlinedAt: !1251)
!1262 = !DILocation(line: 24, column: 7, scope: !637, inlinedAt: !1263)
!1263 = distinct !DILocation(line: 38, column: 7, scope: !651, inlinedAt: !1264)
!1264 = distinct !DILocation(line: 97, column: 8, scope: !862, inlinedAt: !1251)
!1265 = !DILocation(line: 26, column: 13, scope: !639, inlinedAt: !1263)
!1266 = !DILocation(line: 24, column: 5, scope: !632, inlinedAt: !1263)
!1267 = !DILocation(line: 38, column: 7, scope: !651, inlinedAt: !1264)
!1268 = !DILocation(line: 38, column: 20, scope: !651, inlinedAt: !1264)
!1269 = !DILocation(line: 24, column: 7, scope: !637, inlinedAt: !1270)
!1270 = distinct !DILocation(line: 38, column: 32, scope: !661, inlinedAt: !1264)
!1271 = !DILocation(line: 26, column: 13, scope: !639, inlinedAt: !1270)
!1272 = !DILocation(line: 24, column: 5, scope: !632, inlinedAt: !1270)
!1273 = !DILocation(line: 38, column: 32, scope: !661, inlinedAt: !1264)
!1274 = !DILocation(line: 38, column: 45, scope: !661, inlinedAt: !1264)
!1275 = !DILocation(line: 45, column: 38, scope: !672, inlinedAt: !1264)
!1276 = !DILocation(line: 24, column: 7, scope: !637, inlinedAt: !1277)
!1277 = distinct !DILocation(line: 45, column: 31, scope: !672, inlinedAt: !1264)
!1278 = !DILocation(line: 26, column: 13, scope: !639, inlinedAt: !1277)
!1279 = !DILocation(line: 24, column: 5, scope: !632, inlinedAt: !1277)
!1280 = !DILocation(line: 45, column: 60, scope: !672, inlinedAt: !1264)
!1281 = !DILocation(line: 24, column: 7, scope: !637, inlinedAt: !1282)
!1282 = distinct !DILocation(line: 45, column: 53, scope: !683, inlinedAt: !1264)
!1283 = !DILocation(line: 26, column: 13, scope: !639, inlinedAt: !1282)
!1284 = !DILocation(line: 24, column: 5, scope: !632, inlinedAt: !1282)
!1285 = !DILocation(line: 45, column: 51, scope: !672, inlinedAt: !1264)
!1286 = !DILocation(line: 24, column: 7, scope: !637, inlinedAt: !1287)
!1287 = distinct !DILocation(line: 45, column: 24, scope: !690, inlinedAt: !1264)
!1288 = !DILocation(line: 26, column: 13, scope: !639, inlinedAt: !1287)
!1289 = !DILocation(line: 24, column: 5, scope: !632, inlinedAt: !1287)
!1290 = !DILocation(line: 45, column: 21, scope: !672, inlinedAt: !1264)
!1291 = !DILocation(line: 97, column: 8, scope: !862, inlinedAt: !1251)
!1292 = !DILocation(line: 97, column: 58, scope: !862, inlinedAt: !1251)
!1293 = !DILocation(line: 97, column: 8, scope: !863, inlinedAt: !1251)
!1294 = distinct !{!1294, !899, !900, !732, !733}
!1295 = !DILocation(line: 93, column: 18, scope: !902, inlinedAt: !1251)
!1296 = !DILocation(line: 93, column: 13, scope: !904, inlinedAt: !1251)
!1297 = !DILocation(line: 105, column: 2, scope: !838, inlinedAt: !1251)
!1298 = !DILocation(line: 197, column: 2, scope: !1130)
!1299 = !DILocation(line: 198, column: 2, scope: !1130)
!1300 = !DILocation(line: 199, column: 2, scope: !1130)
!1301 = !DILocation(line: 201, column: 2, scope: !1130)
