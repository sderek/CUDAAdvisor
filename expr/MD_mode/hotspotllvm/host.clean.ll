; ModuleID = 'hotspot.cu'
source_filename = "hotspot.cu"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }
%struct.dim3 = type { i32, i32, i32 }
%struct.CUstream_st = type opaque

@t_chip = local_unnamed_addr global float 0x3F40624DE0000000, align 4, !dbg !0
@chip_height = local_unnamed_addr global float 0x3F90624DE0000000, align 4, !dbg !37
@chip_width = local_unnamed_addr global float 0x3F90624DE0000000, align 4, !dbg !39
@amb_temp = local_unnamed_addr global float 8.000000e+01, align 4, !dbg !41
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [11 x i8] c"error: %s\0A\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"%d\09%g\0A\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.5 = private unnamed_addr constant [25 x i8] c"not enough lines in file\00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"%f\00", align 1
@.str.7 = private unnamed_addr constant [20 x i8] c"invalid file format\00", align 1
@.str.8 = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1
@.str.9 = private unnamed_addr constant [100 x i8] c"Usage: %s <grid_rows/grid_cols> <pyramid_height> <sim_time> <temp_file> <power_file> <output_file>\0A\00", align 1
@.str.10 = private unnamed_addr constant [78 x i8] c"\09<grid_rows/grid_cols>  - number of rows/cols in the grid (positive integer)\0A\00", align 1
@.str.11 = private unnamed_addr constant [53 x i8] c"\09<pyramid_height> - pyramid heigh(positive integer)\0A\00", align 1
@.str.12 = private unnamed_addr constant [38 x i8] c"\09<sim_time>   - number of iterations\0A\00", align 1
@.str.13 = private unnamed_addr constant [89 x i8] c"\09<temp_file>  - name of the file containing the initial temperature values of each cell\0A\00", align 1
@.str.14 = private unnamed_addr constant [86 x i8] c"\09<power_file> - name of the file containing the dissipated power values of each cell\0A\00", align 1
@.str.15 = private unnamed_addr constant [42 x i8] c"\09<output_file> - name of the output file\0A\00", align 1
@.str.16 = private unnamed_addr constant [29 x i8] c"WG size of kernel = %d X %d\0A\00", align 1
@.str.17 = private unnamed_addr constant [26 x i8] c"unable to allocate memory\00", align 1
@.str.18 = private unnamed_addr constant [94 x i8] c"pyramidHeight: %d\0AgridSize: [%d, %d]\0Aborder:[%d, %d]\0AblockGrid:[%d, %d]\0AtargetBlock:[%d, %d]\0A\00", align 1
@str.21 = private unnamed_addr constant [24 x i8] c"The file was not opened\00"
@str.22 = private unnamed_addr constant [42 x i8] c"Start computing the transient temperature\00"
@str.23 = private unnamed_addr constant [18 x i8] c"Ending simulation\00"

; Function Attrs: nounwind uwtable
define double @_Z8get_timev() local_unnamed_addr #0 !dbg !600 {
entry:
  %time = alloca %struct.timeval, align 8
  %0 = bitcast %struct.timeval* %time to i8*, !dbg !613
  call void @llvm.lifetime.start(i64 16, i8* nonnull %0) #9, !dbg !613
  tail call void @llvm.dbg.value(metadata %struct.timeval* %time, i64 0, metadata !604, metadata !614), !dbg !615
  %call = call i32 @gettimeofday(%struct.timeval* nonnull %time, %struct.timezone* null) #9, !dbg !616
  %tobool = icmp eq i32 %call, 0, !dbg !616
  br i1 %tobool, label %if.end, label %cleanup, !dbg !618

if.end:                                           ; preds = %entry
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %time, i64 0, i32 0, !dbg !619
  %1 = load i64, i64* %tv_sec, align 8, !dbg !619, !tbaa !620
  %conv = sitofp i64 %1 to double, !dbg !625
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %time, i64 0, i32 1, !dbg !626
  %2 = load i64, i64* %tv_usec, align 8, !dbg !626, !tbaa !627
  %conv1 = sitofp i64 %2 to double, !dbg !628
  %mul = fmul double %conv1, 1.000000e-06, !dbg !629
  %add = fadd double %mul, %conv, !dbg !630
  br label %cleanup, !dbg !631

cleanup:                                          ; preds = %entry, %if.end
  %retval.0 = phi double [ %add, %if.end ], [ 0.000000e+00, %entry ]
  call void @llvm.lifetime.end(i64 16, i8* nonnull %0) #9, !dbg !632
  ret double %retval.0, !dbg !632
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: nounwind
declare i32 @gettimeofday(%struct.timeval* nocapture, %struct.timezone* nocapture) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define void @_Z5fatalPc(i8* %s) local_unnamed_addr #0 !dbg !633 {
entry:
  tail call void @llvm.dbg.value(metadata i8* %s, i64 0, metadata !637, metadata !638), !dbg !639
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !640, !tbaa !641
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i64 0, i64 0), i8* %s) #10, !dbg !643
  ret void, !dbg !644
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define void @_Z11writeoutputPfiiPc(float* nocapture readonly %vect, i32 %grid_rows, i32 %grid_cols, i8* nocapture readonly %file) local_unnamed_addr #0 !dbg !645 {
entry:
  %str = alloca [256 x i8], align 16
  tail call void @llvm.dbg.value(metadata float* %vect, i64 0, metadata !649, metadata !638), !dbg !711
  tail call void @llvm.dbg.value(metadata i32 %grid_rows, i64 0, metadata !650, metadata !638), !dbg !712
  tail call void @llvm.dbg.value(metadata i32 %grid_cols, i64 0, metadata !651, metadata !638), !dbg !713
  tail call void @llvm.dbg.value(metadata i8* %file, i64 0, metadata !652, metadata !638), !dbg !714
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !655, metadata !638), !dbg !715
  %0 = getelementptr inbounds [256 x i8], [256 x i8]* %str, i64 0, i64 0, !dbg !716
  call void @llvm.lifetime.start(i64 256, i8* nonnull %0) #9, !dbg !716
  tail call void @llvm.dbg.declare(metadata [256 x i8]* %str, metadata !707, metadata !638), !dbg !717
  %call = tail call %struct._IO_FILE* @fopen(i8* %file, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !718
  tail call void @llvm.dbg.value(metadata %struct._IO_FILE* %call, i64 0, metadata !656, metadata !638), !dbg !720
  %cmp = icmp eq %struct._IO_FILE* %call, null, !dbg !721
  br i1 %cmp, label %if.then, label %for.cond.preheader, !dbg !722

if.then:                                          ; preds = %entry
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @str.21, i64 0, i64 0)), !dbg !723
  br label %for.cond.preheader, !dbg !723

for.cond.preheader:                               ; preds = %if.then, %entry
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !653, metadata !638), !dbg !724
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !655, metadata !638), !dbg !715
  %cmp228 = icmp sgt i32 %grid_rows, 0, !dbg !725
  br i1 %cmp228, label %for.cond3.preheader.lr.ph, label %for.end12, !dbg !729

for.cond3.preheader.lr.ph:                        ; preds = %for.cond.preheader
  %cmp425 = icmp sgt i32 %grid_cols, 0
  %1 = sext i32 %grid_cols to i64, !dbg !729
  %wide.trip.count = zext i32 %grid_cols to i64
  %wide.trip.count35 = zext i32 %grid_rows to i64
  br label %for.cond3.preheader, !dbg !729

for.cond3.preheader:                              ; preds = %for.inc10, %for.cond3.preheader.lr.ph
  %indvars.iv32 = phi i64 [ 0, %for.cond3.preheader.lr.ph ], [ %indvars.iv.next33, %for.inc10 ]
  %index.029 = phi i32 [ 0, %for.cond3.preheader.lr.ph ], [ %index.1.lcssa, %for.inc10 ]
  tail call void @llvm.dbg.value(metadata i32 %index.029, i64 0, metadata !655, metadata !638), !dbg !715
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !654, metadata !638), !dbg !731
  br i1 %cmp425, label %for.body5.lr.ph, label %for.inc10, !dbg !732

for.body5.lr.ph:                                  ; preds = %for.cond3.preheader
  %2 = mul nsw i64 %indvars.iv32, %1
  br label %for.body5, !dbg !732

for.body5:                                        ; preds = %for.body5, %for.body5.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body5.lr.ph ], [ %indvars.iv.next, %for.body5 ]
  %index.127 = phi i32 [ %index.029, %for.body5.lr.ph ], [ %inc, %for.body5 ]
  %3 = add nsw i64 %indvars.iv, %2, !dbg !735
  %arrayidx = getelementptr inbounds float, float* %vect, i64 %3, !dbg !738
  %4 = load float, float* %arrayidx, align 4, !dbg !738, !tbaa !739
  %conv = fpext float %4 to double, !dbg !738
  %call6 = call i32 (i8*, i8*, ...) @sprintf(i8* nonnull %0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0), i32 %index.127, double %conv) #9, !dbg !741
  %call8 = call i32 @fputs(i8* nonnull %0, %struct._IO_FILE* %call), !dbg !742
  %inc = add nsw i32 %index.127, 1, !dbg !743
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !655, metadata !638), !dbg !715
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !744
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !655, metadata !638), !dbg !715
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count, !dbg !746
  br i1 %exitcond, label %for.inc10.loopexit, label %for.body5, !dbg !732, !llvm.loop !748

for.inc10.loopexit:                               ; preds = %for.body5
  %5 = add i32 %index.029, %grid_cols, !dbg !732
  br label %for.inc10, !dbg !751

for.inc10:                                        ; preds = %for.inc10.loopexit, %for.cond3.preheader
  %index.1.lcssa = phi i32 [ %index.029, %for.cond3.preheader ], [ %5, %for.inc10.loopexit ]
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1, !dbg !751
  tail call void @llvm.dbg.value(metadata i32 %index.1.lcssa, i64 0, metadata !655, metadata !638), !dbg !715
  %exitcond36 = icmp eq i64 %indvars.iv.next33, %wide.trip.count35, !dbg !725
  br i1 %exitcond36, label %for.end12.loopexit, label %for.cond3.preheader, !dbg !729, !llvm.loop !753

for.end12.loopexit:                               ; preds = %for.inc10
  br label %for.end12, !dbg !756

for.end12:                                        ; preds = %for.end12.loopexit, %for.cond.preheader
  %call13 = tail call i32 @fclose(%struct._IO_FILE* %call), !dbg !756
  call void @llvm.lifetime.end(i64 256, i8* nonnull %0) #9, !dbg !757
  ret void, !dbg !757
}

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @sprintf(i8* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputs(i8* nocapture readonly, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fclose(%struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define void @_Z9readinputPfiiPc(float* nocapture %vect, i32 %grid_rows, i32 %grid_cols, i8* nocapture readonly %file) local_unnamed_addr #0 !dbg !758 {
entry:
  %str = alloca [256 x i8], align 16
  %val = alloca float, align 4
  tail call void @llvm.dbg.value(metadata float* %vect, i64 0, metadata !760, metadata !638), !dbg !769
  tail call void @llvm.dbg.value(metadata i32 %grid_rows, i64 0, metadata !761, metadata !638), !dbg !770
  tail call void @llvm.dbg.value(metadata i32 %grid_cols, i64 0, metadata !762, metadata !638), !dbg !771
  tail call void @llvm.dbg.value(metadata i8* %file, i64 0, metadata !763, metadata !638), !dbg !772
  %0 = getelementptr inbounds [256 x i8], [256 x i8]* %str, i64 0, i64 0, !dbg !773
  call void @llvm.lifetime.start(i64 256, i8* nonnull %0) #9, !dbg !773
  tail call void @llvm.dbg.declare(metadata [256 x i8]* %str, metadata !767, metadata !638), !dbg !774
  %1 = bitcast float* %val to i8*, !dbg !775
  call void @llvm.lifetime.start(i64 4, i8* nonnull %1) #9, !dbg !775
  %call = tail call %struct._IO_FILE* @fopen(i8* %file, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i64 0, i64 0)), !dbg !776
  tail call void @llvm.dbg.value(metadata %struct._IO_FILE* %call, i64 0, metadata !766, metadata !638), !dbg !778
  %cmp = icmp eq %struct._IO_FILE* %call, null, !dbg !779
  br i1 %cmp, label %if.then, label %for.cond.preheader, !dbg !780

if.then:                                          ; preds = %entry
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @str.21, i64 0, i64 0)), !dbg !781
  br label %for.cond.preheader, !dbg !781

for.cond.preheader:                               ; preds = %if.then, %entry
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !764, metadata !638), !dbg !782
  %cmp233 = icmp sgt i32 %grid_rows, 0, !dbg !783
  br i1 %cmp233, label %for.cond3.preheader.lr.ph, label %for.end18, !dbg !787

for.cond3.preheader.lr.ph:                        ; preds = %for.cond.preheader
  %cmp531 = icmp sgt i32 %grid_cols, 0
  %2 = bitcast float* %val to i32*
  %3 = sext i32 %grid_cols to i64, !dbg !787
  %wide.trip.count = zext i32 %grid_cols to i64
  %wide.trip.count39 = zext i32 %grid_rows to i64
  br label %for.cond3.preheader, !dbg !787

for.cond3.preheader:                              ; preds = %for.inc16, %for.cond3.preheader.lr.ph
  %indvars.iv36 = phi i64 [ 0, %for.cond3.preheader.lr.ph ], [ %indvars.iv.next37, %for.inc16 ]
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !765, metadata !638), !dbg !789
  br i1 %cmp531, label %for.body6.lr.ph, label %for.inc16, !dbg !790

for.body6.lr.ph:                                  ; preds = %for.cond3.preheader
  %4 = mul nsw i64 %indvars.iv36, %3
  br label %for.body6, !dbg !790

for.body6:                                        ; preds = %if.end15, %for.body6.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body6.lr.ph ], [ %indvars.iv.next, %if.end15 ]
  %call7 = call i8* @fgets(i8* nonnull %0, i32 256, %struct._IO_FILE* %call), !dbg !793
  %call8 = call i32 @feof(%struct._IO_FILE* %call) #9, !dbg !796
  %tobool = icmp eq i32 %call8, 0, !dbg !796
  br i1 %tobool, label %if.end10, label %if.then9, !dbg !798

if.then9:                                         ; preds = %for.body6
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.5, i64 0, i64 0), i64 0, metadata !637, metadata !638) #9, !dbg !799
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !801, !tbaa !641
  %call.i = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.5, i64 0, i64 0)) #11, !dbg !802
  br label %if.end10, !dbg !803

if.end10:                                         ; preds = %for.body6, %if.then9
  call void @llvm.dbg.value(metadata float* %val, i64 0, metadata !768, metadata !614), !dbg !804
  %call12 = call i32 (i8*, i8*, ...) @sscanf(i8* nonnull %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i64 0, i64 0), float* nonnull %val) #9, !dbg !805
  %cmp13 = icmp eq i32 %call12, 1, !dbg !807
  br i1 %cmp13, label %if.end15, label %if.then14, !dbg !808

if.then14:                                        ; preds = %if.end10
  call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.7, i64 0, i64 0), i64 0, metadata !637, metadata !638) #9, !dbg !809
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !811, !tbaa !641
  %call.i30 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.7, i64 0, i64 0)) #11, !dbg !812
  br label %if.end15, !dbg !813

if.end15:                                         ; preds = %if.end10, %if.then14
  %7 = load i32, i32* %2, align 4, !dbg !814, !tbaa !739
  %8 = add nsw i64 %indvars.iv, %4, !dbg !815
  %arrayidx = getelementptr inbounds float, float* %vect, i64 %8, !dbg !816
  %9 = bitcast float* %arrayidx to i32*, !dbg !817
  store i32 %7, i32* %9, align 4, !dbg !817, !tbaa !739
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !818
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count, !dbg !820
  br i1 %exitcond, label %for.inc16.loopexit, label %for.body6, !dbg !790, !llvm.loop !822

for.inc16.loopexit:                               ; preds = %if.end15
  br label %for.inc16, !dbg !825

for.inc16:                                        ; preds = %for.inc16.loopexit, %for.cond3.preheader
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1, !dbg !825
  %exitcond40 = icmp eq i64 %indvars.iv.next37, %wide.trip.count39, !dbg !783
  br i1 %exitcond40, label %for.end18.loopexit, label %for.cond3.preheader, !dbg !787, !llvm.loop !827

for.end18.loopexit:                               ; preds = %for.inc16
  br label %for.end18, !dbg !830

for.end18:                                        ; preds = %for.end18.loopexit, %for.cond.preheader
  %call19 = call i32 @fclose(%struct._IO_FILE* %call), !dbg !830
  call void @llvm.lifetime.end(i64 4, i8* nonnull %1) #9, !dbg !831
  call void @llvm.lifetime.end(i64 256, i8* nonnull %0) #9, !dbg !831
  ret void, !dbg !831
}

; Function Attrs: nounwind
declare i8* @fgets(i8*, i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @feof(%struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @sscanf(i8* nocapture readonly, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: uwtable
define void @_Z14calculate_tempiPfS_S_iiiiffffff(i32 %iteration, float* %power, float* %temp_src, float* %temp_dst, i32 %grid_cols, i32 %grid_rows, i32 %border_cols, i32 %border_rows, float %Cap, float %Rx, float %Ry, float %Rz, float %step, float %time_elapsed) #4 !dbg !832 {
entry:
  %iteration.addr = alloca i32, align 4
  %power.addr = alloca float*, align 8
  %temp_src.addr = alloca float*, align 8
  %temp_dst.addr = alloca float*, align 8
  %grid_cols.addr = alloca i32, align 4
  %grid_rows.addr = alloca i32, align 4
  %border_cols.addr = alloca i32, align 4
  %border_rows.addr = alloca i32, align 4
  %Cap.addr = alloca float, align 4
  %Rx.addr = alloca float, align 4
  %Ry.addr = alloca float, align 4
  %Rz.addr = alloca float, align 4
  %step.addr = alloca float, align 4
  %time_elapsed.addr = alloca float, align 4
  tail call void @llvm.dbg.value(metadata i32 %iteration, i64 0, metadata !836, metadata !638), !dbg !850
  store i32 %iteration, i32* %iteration.addr, align 4, !tbaa !851
  tail call void @llvm.dbg.value(metadata float* %power, i64 0, metadata !837, metadata !638), !dbg !853
  store float* %power, float** %power.addr, align 8, !tbaa !641
  tail call void @llvm.dbg.value(metadata float* %temp_src, i64 0, metadata !838, metadata !638), !dbg !854
  store float* %temp_src, float** %temp_src.addr, align 8, !tbaa !641
  tail call void @llvm.dbg.value(metadata float* %temp_dst, i64 0, metadata !839, metadata !638), !dbg !855
  store float* %temp_dst, float** %temp_dst.addr, align 8, !tbaa !641
  tail call void @llvm.dbg.value(metadata i32 %grid_cols, i64 0, metadata !840, metadata !638), !dbg !856
  store i32 %grid_cols, i32* %grid_cols.addr, align 4, !tbaa !851
  tail call void @llvm.dbg.value(metadata i32 %grid_rows, i64 0, metadata !841, metadata !638), !dbg !857
  store i32 %grid_rows, i32* %grid_rows.addr, align 4, !tbaa !851
  tail call void @llvm.dbg.value(metadata i32 %border_cols, i64 0, metadata !842, metadata !638), !dbg !858
  store i32 %border_cols, i32* %border_cols.addr, align 4, !tbaa !851
  tail call void @llvm.dbg.value(metadata i32 %border_rows, i64 0, metadata !843, metadata !638), !dbg !859
  store i32 %border_rows, i32* %border_rows.addr, align 4, !tbaa !851
  tail call void @llvm.dbg.value(metadata float %Cap, i64 0, metadata !844, metadata !638), !dbg !860
  store float %Cap, float* %Cap.addr, align 4, !tbaa !739
  tail call void @llvm.dbg.value(metadata float %Rx, i64 0, metadata !845, metadata !638), !dbg !861
  store float %Rx, float* %Rx.addr, align 4, !tbaa !739
  tail call void @llvm.dbg.value(metadata float %Ry, i64 0, metadata !846, metadata !638), !dbg !862
  store float %Ry, float* %Ry.addr, align 4, !tbaa !739
  tail call void @llvm.dbg.value(metadata float %Rz, i64 0, metadata !847, metadata !638), !dbg !863
  store float %Rz, float* %Rz.addr, align 4, !tbaa !739
  tail call void @llvm.dbg.value(metadata float %step, i64 0, metadata !848, metadata !638), !dbg !864
  store float %step, float* %step.addr, align 4, !tbaa !739
  tail call void @llvm.dbg.value(metadata float %time_elapsed, i64 0, metadata !849, metadata !638), !dbg !865
  store float %time_elapsed, float* %time_elapsed.addr, align 4, !tbaa !739
  %0 = bitcast i32* %iteration.addr to i8*, !dbg !866
  %1 = call i32 @cudaSetupArgument(i8* nonnull %0, i64 4, i64 0), !dbg !866
  %2 = icmp eq i32 %1, 0, !dbg !866
  br i1 %2, label %setup.next, label %setup.end, !dbg !866

setup.next:                                       ; preds = %entry
  %3 = bitcast float** %power.addr to i8*, !dbg !867
  %4 = call i32 @cudaSetupArgument(i8* nonnull %3, i64 8, i64 8), !dbg !867
  %5 = icmp eq i32 %4, 0, !dbg !867
  br i1 %5, label %setup.next1, label %setup.end, !dbg !867

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast float** %temp_src.addr to i8*, !dbg !869
  %7 = call i32 @cudaSetupArgument(i8* nonnull %6, i64 8, i64 16), !dbg !869
  %8 = icmp eq i32 %7, 0, !dbg !869
  br i1 %8, label %setup.next2, label %setup.end, !dbg !869

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast float** %temp_dst.addr to i8*, !dbg !871
  %10 = call i32 @cudaSetupArgument(i8* nonnull %9, i64 8, i64 24), !dbg !871
  %11 = icmp eq i32 %10, 0, !dbg !871
  br i1 %11, label %setup.next3, label %setup.end, !dbg !871

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast i32* %grid_cols.addr to i8*, !dbg !873
  %13 = call i32 @cudaSetupArgument(i8* nonnull %12, i64 4, i64 32), !dbg !873
  %14 = icmp eq i32 %13, 0, !dbg !873
  br i1 %14, label %setup.next4, label %setup.end, !dbg !873

setup.next4:                                      ; preds = %setup.next3
  %15 = bitcast i32* %grid_rows.addr to i8*, !dbg !875
  %16 = call i32 @cudaSetupArgument(i8* nonnull %15, i64 4, i64 36), !dbg !875
  %17 = icmp eq i32 %16, 0, !dbg !875
  br i1 %17, label %setup.next5, label %setup.end, !dbg !875

setup.next5:                                      ; preds = %setup.next4
  %18 = bitcast i32* %border_cols.addr to i8*, !dbg !877
  %19 = call i32 @cudaSetupArgument(i8* nonnull %18, i64 4, i64 40), !dbg !877
  %20 = icmp eq i32 %19, 0, !dbg !877
  br i1 %20, label %setup.next6, label %setup.end, !dbg !877

setup.next6:                                      ; preds = %setup.next5
  %21 = bitcast i32* %border_rows.addr to i8*, !dbg !879
  %22 = call i32 @cudaSetupArgument(i8* nonnull %21, i64 4, i64 44), !dbg !879
  %23 = icmp eq i32 %22, 0, !dbg !879
  br i1 %23, label %setup.next7, label %setup.end, !dbg !879

setup.next7:                                      ; preds = %setup.next6
  %24 = bitcast float* %Cap.addr to i8*, !dbg !881
  %25 = call i32 @cudaSetupArgument(i8* nonnull %24, i64 4, i64 48), !dbg !881
  %26 = icmp eq i32 %25, 0, !dbg !881
  br i1 %26, label %setup.next8, label %setup.end, !dbg !881

setup.next8:                                      ; preds = %setup.next7
  %27 = bitcast float* %Rx.addr to i8*, !dbg !883
  %28 = call i32 @cudaSetupArgument(i8* nonnull %27, i64 4, i64 52), !dbg !883
  %29 = icmp eq i32 %28, 0, !dbg !883
  br i1 %29, label %setup.next9, label %setup.end, !dbg !883

setup.next9:                                      ; preds = %setup.next8
  %30 = bitcast float* %Ry.addr to i8*, !dbg !885
  %31 = call i32 @cudaSetupArgument(i8* nonnull %30, i64 4, i64 56), !dbg !885
  %32 = icmp eq i32 %31, 0, !dbg !885
  br i1 %32, label %setup.next10, label %setup.end, !dbg !885

setup.next10:                                     ; preds = %setup.next9
  %33 = bitcast float* %Rz.addr to i8*, !dbg !887
  %34 = call i32 @cudaSetupArgument(i8* nonnull %33, i64 4, i64 60), !dbg !887
  %35 = icmp eq i32 %34, 0, !dbg !887
  br i1 %35, label %setup.next11, label %setup.end, !dbg !887

setup.next11:                                     ; preds = %setup.next10
  %36 = bitcast float* %step.addr to i8*, !dbg !889
  %37 = call i32 @cudaSetupArgument(i8* nonnull %36, i64 4, i64 64), !dbg !889
  %38 = icmp eq i32 %37, 0, !dbg !889
  br i1 %38, label %setup.next12, label %setup.end, !dbg !889

setup.next12:                                     ; preds = %setup.next11
  %39 = bitcast float* %time_elapsed.addr to i8*, !dbg !891
  %40 = call i32 @cudaSetupArgument(i8* nonnull %39, i64 4, i64 68), !dbg !891
  %41 = icmp eq i32 %40, 0, !dbg !891
  br i1 %41, label %setup.next13, label %setup.end, !dbg !891

setup.next13:                                     ; preds = %setup.next12
  %42 = call i32 @cudaLaunch(i8* bitcast (void (i32, float*, float*, float*, i32, i32, i32, i32, float, float, float, float, float, float)* @_Z14calculate_tempiPfS_S_iiiiffffff to i8*)), !dbg !893
  br label %setup.end, !dbg !893

setup.end:                                        ; preds = %setup.next13, %setup.next12, %setup.next11, %setup.next10, %setup.next9, %setup.next8, %setup.next7, %setup.next6, %setup.next5, %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !895
}

declare i32 @cudaSetupArgument(i8*, i64, i64) local_unnamed_addr

declare i32 @cudaLaunch(i8*) local_unnamed_addr

; Function Attrs: uwtable
define i32 @_Z17compute_tran_tempPfPS_iiiiiiii(float* %MatrixPower, float** nocapture readonly %MatrixTemp, i32 %col, i32 %row, i32 %total_iterations, i32 %num_iterations, i32 %blockCols, i32 %blockRows, i32 %borderCols, i32 %borderRows) local_unnamed_addr #4 !dbg !896 {
entry:
  %time.i94 = alloca %struct.timeval, align 8
  %time.i = alloca %struct.timeval, align 8
  tail call void @llvm.dbg.value(metadata float* %MatrixPower, i64 0, metadata !901, metadata !638), !dbg !954
  tail call void @llvm.dbg.value(metadata float** %MatrixTemp, i64 0, metadata !902, metadata !638), !dbg !955
  tail call void @llvm.dbg.value(metadata i32 %col, i64 0, metadata !903, metadata !638), !dbg !956
  tail call void @llvm.dbg.value(metadata i32 %row, i64 0, metadata !904, metadata !638), !dbg !957
  tail call void @llvm.dbg.value(metadata i32 %total_iterations, i64 0, metadata !905, metadata !638), !dbg !958
  tail call void @llvm.dbg.value(metadata i32 %num_iterations, i64 0, metadata !906, metadata !638), !dbg !959
  tail call void @llvm.dbg.value(metadata i32 %blockCols, i64 0, metadata !907, metadata !638), !dbg !960
  tail call void @llvm.dbg.value(metadata i32 %blockRows, i64 0, metadata !908, metadata !638), !dbg !961
  tail call void @llvm.dbg.value(metadata i32 %borderCols, i64 0, metadata !909, metadata !638), !dbg !962
  tail call void @llvm.dbg.value(metadata i32 %borderRows, i64 0, metadata !910, metadata !638), !dbg !963
  tail call void @llvm.dbg.value(metadata %struct.dim3* undef, i64 0, metadata !911, metadata !614), !dbg !964
  tail call void @llvm.dbg.value(metadata %struct.dim3* undef, i64 0, metadata !935, metadata !614), !dbg !965
  %0 = load float, float* @chip_height, align 4, !dbg !966, !tbaa !739
  %conv = sitofp i32 %row to float, !dbg !967
  %div = fdiv float %0, %conv, !dbg !968
  tail call void @llvm.dbg.value(metadata float %div, i64 0, metadata !936, metadata !638), !dbg !969
  %1 = load float, float* @chip_width, align 4, !dbg !970, !tbaa !739
  %conv1 = sitofp i32 %col to float, !dbg !971
  %div2 = fdiv float %1, %conv1, !dbg !972
  tail call void @llvm.dbg.value(metadata float %div2, i64 0, metadata !937, metadata !638), !dbg !973
  %2 = load float, float* @t_chip, align 4, !dbg !974, !tbaa !739
  %conv3 = fpext float %2 to double, !dbg !974
  %mul = fmul double %conv3, 8.750000e+05, !dbg !975
  %conv4 = fpext float %div2 to double, !dbg !976
  %mul5 = fmul double %mul, %conv4, !dbg !977
  %conv6 = fpext float %div to double, !dbg !978
  %mul7 = fmul double %mul5, %conv6, !dbg !979
  %conv8 = fptrunc double %mul7 to float, !dbg !980
  tail call void @llvm.dbg.value(metadata float %conv8, i64 0, metadata !938, metadata !638), !dbg !981
  %mul11 = fmul double %conv3, 2.000000e+02, !dbg !982
  %mul13 = fmul double %mul11, %conv6, !dbg !983
  %div14 = fdiv double %conv4, %mul13, !dbg !984
  %conv15 = fptrunc double %div14 to float, !dbg !985
  tail call void @llvm.dbg.value(metadata float %conv15, i64 0, metadata !939, metadata !638), !dbg !986
  %mul20 = fmul double %mul11, %conv4, !dbg !987
  %div21 = fdiv double %conv6, %mul20, !dbg !988
  %conv22 = fptrunc double %div21 to float, !dbg !989
  tail call void @llvm.dbg.value(metadata float %conv22, i64 0, metadata !940, metadata !638), !dbg !990
  %mul23 = fmul float %div, 1.000000e+02, !dbg !991
  %mul24 = fmul float %mul23, %div2, !dbg !992
  %div25 = fdiv float %2, %mul24, !dbg !993
  tail call void @llvm.dbg.value(metadata float %div25, i64 0, metadata !941, metadata !638), !dbg !994
  %mul27 = fmul double %conv3, 5.000000e-01, !dbg !995
  %mul28 = fmul double %mul27, 1.750000e+06, !dbg !996
  %div29 = fdiv double 3.000000e+06, %mul28, !dbg !997
  %conv30 = fptrunc double %div29 to float, !dbg !998
  tail call void @llvm.dbg.value(metadata float %conv30, i64 0, metadata !942, metadata !638), !dbg !999
  %conv31 = fpext float %conv30 to double, !dbg !1000
  %div32 = fdiv double 1.000000e-03, %conv31, !dbg !1001
  %conv33 = fptrunc double %div32 to float, !dbg !1002
  tail call void @llvm.dbg.value(metadata float %conv33, i64 0, metadata !943, metadata !638), !dbg !1003
  tail call void @llvm.dbg.value(metadata float 0x3F50624DE0000000, i64 0, metadata !945, metadata !638), !dbg !1004
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !946, metadata !638), !dbg !1005
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !947, metadata !638), !dbg !1006
  %call = tail call i32 @cudaDeviceSetCacheConfig(i32 2), !dbg !1007
  %call34 = tail call i32 @cudaDeviceSynchronize(), !dbg !1008
  %3 = bitcast %struct.timeval* %time.i94 to i8*, !dbg !1009
  call void @llvm.lifetime.start(i64 16, i8* nonnull %3) #9, !dbg !1009
  tail call void @llvm.dbg.value(metadata %struct.timeval* %time.i94, i64 0, metadata !604, metadata !614) #9, !dbg !1011
  %call.i95 = call i32 @gettimeofday(%struct.timeval* nonnull %time.i94, %struct.timezone* null) #9, !dbg !1012
  %tobool.i96 = icmp eq i32 %call.i95, 0, !dbg !1012
  br i1 %tobool.i96, label %if.end.i103, label %_Z8get_timev.exit105, !dbg !1013

if.end.i103:                                      ; preds = %entry
  %tv_sec.i97 = getelementptr inbounds %struct.timeval, %struct.timeval* %time.i94, i64 0, i32 0, !dbg !1014
  %4 = load i64, i64* %tv_sec.i97, align 8, !dbg !1014, !tbaa !620
  %conv.i98 = sitofp i64 %4 to double, !dbg !1015
  %tv_usec.i99 = getelementptr inbounds %struct.timeval, %struct.timeval* %time.i94, i64 0, i32 1, !dbg !1016
  %5 = load i64, i64* %tv_usec.i99, align 8, !dbg !1016, !tbaa !627
  %conv1.i100 = sitofp i64 %5 to double, !dbg !1017
  %mul.i101 = fmul double %conv1.i100, 1.000000e-06, !dbg !1018
  %add.i102 = fadd double %mul.i101, %conv.i98, !dbg !1019
  br label %_Z8get_timev.exit105, !dbg !1020

_Z8get_timev.exit105:                             ; preds = %entry, %if.end.i103
  %retval.0.i104 = phi double [ %add.i102, %if.end.i103 ], [ 0.000000e+00, %entry ]
  call void @llvm.lifetime.end(i64 16, i8* nonnull %3) #9, !dbg !1021
  tail call void @llvm.dbg.value(metadata double %retval.0.i104, i64 0, metadata !948, metadata !638), !dbg !1022
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !944, metadata !638), !dbg !1023
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !944, metadata !638), !dbg !1023
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !946, metadata !638), !dbg !1005
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !947, metadata !638), !dbg !1006
  %conv36 = sitofp i32 %total_iterations to float, !dbg !1024
  %cmp114 = icmp sgt i32 %total_iterations, 0, !dbg !1026
  br i1 %cmp114, label %for.body.lr.ph, label %for.end, !dbg !1027

for.body.lr.ph:                                   ; preds = %_Z8get_timev.exit105
  %dimGrid.sroa.0.sroa.4.0.insert.ext = zext i32 %blockRows to i64
  %dimGrid.sroa.0.sroa.4.0.insert.shift = shl nuw i64 %dimGrid.sroa.0.sroa.4.0.insert.ext, 32
  %dimGrid.sroa.0.sroa.0.0.insert.ext = zext i32 %blockCols to i64
  %dimGrid.sroa.0.sroa.0.0.insert.insert = or i64 %dimGrid.sroa.0.sroa.4.0.insert.shift, %dimGrid.sroa.0.sroa.0.0.insert.ext
  %conv39 = sitofp i32 %num_iterations to float
  br label %for.body, !dbg !1027

for.body:                                         ; preds = %for.body.lr.ph, %kcall.end
  %t.0117 = phi float [ 0.000000e+00, %for.body.lr.ph ], [ %add, %kcall.end ]
  %src.0116 = phi i32 [ 1, %for.body.lr.ph ], [ %dst.0115, %kcall.end ]
  %dst.0115 = phi i32 [ 0, %for.body.lr.ph ], [ %src.0116, %kcall.end ]
  tail call void @llvm.dbg.value(metadata i32 %src.0116, i64 0, metadata !949, metadata !638), !dbg !1029
  tail call void @llvm.dbg.value(metadata i32 %dst.0115, i64 0, metadata !946, metadata !638), !dbg !1005
  tail call void @llvm.dbg.value(metadata i32 %src.0116, i64 0, metadata !947, metadata !638), !dbg !1006
  %call38 = tail call i32 @cudaConfigureCall(i64 %dimGrid.sroa.0.sroa.0.0.insert.insert, i32 1, i64 68719476752, i32 1, i64 0, %struct.CUstream_st* null), !dbg !1030
  %tobool = icmp eq i32 %call38, 0, !dbg !1030
  br i1 %tobool, label %kcall.configok, label %kcall.end, !dbg !1031

kcall.configok:                                   ; preds = %for.body
  %sub = fsub float %conv36, %t.0117, !dbg !1032
  %cmp41.inv = fcmp oge float %sub, %conv39, !dbg !1034
  %sub.conv39 = select i1 %cmp41.inv, float %conv39, float %sub, !dbg !1034
  %conv45 = fptosi float %sub.conv39 to i32, !dbg !1036
  %idxprom = sext i32 %dst.0115 to i64, !dbg !1038
  %arrayidx = getelementptr inbounds float*, float** %MatrixTemp, i64 %idxprom, !dbg !1038
  %6 = load float*, float** %arrayidx, align 8, !dbg !1038, !tbaa !641
  %idxprom46 = sext i32 %src.0116 to i64, !dbg !1039
  %arrayidx47 = getelementptr inbounds float*, float** %MatrixTemp, i64 %idxprom46, !dbg !1039
  %7 = load float*, float** %arrayidx47, align 8, !dbg !1039, !tbaa !641
  tail call void @_Z14calculate_tempiPfS_S_iiiiffffff(i32 %conv45, float* %MatrixPower, float* %6, float* %7, i32 %col, i32 %row, i32 %borderCols, i32 %borderRows, float %conv8, float %conv15, float %conv22, float %div25, float %conv33, float 0x3F50624DE0000000), !dbg !1040
  br label %kcall.end, !dbg !1040

kcall.end:                                        ; preds = %for.body, %kcall.configok
  %add = fadd float %t.0117, %conv39, !dbg !1041
  tail call void @llvm.dbg.value(metadata float %add, i64 0, metadata !944, metadata !638), !dbg !1023
  tail call void @llvm.dbg.value(metadata float %add, i64 0, metadata !944, metadata !638), !dbg !1023
  tail call void @llvm.dbg.value(metadata i32 %dst.0115, i64 0, metadata !946, metadata !638), !dbg !1005
  tail call void @llvm.dbg.value(metadata i32 %src.0116, i64 0, metadata !947, metadata !638), !dbg !1006
  %cmp = fcmp olt float %add, %conv36, !dbg !1026
  br i1 %cmp, label %for.body, label %for.end.loopexit, !dbg !1027, !llvm.loop !1043

for.end.loopexit:                                 ; preds = %kcall.end
  br label %for.end, !dbg !1046

for.end:                                          ; preds = %for.end.loopexit, %_Z8get_timev.exit105
  %dst.0.lcssa = phi i32 [ 0, %_Z8get_timev.exit105 ], [ %src.0116, %for.end.loopexit ]
  %call49 = tail call i32 @cudaDeviceSynchronize(), !dbg !1046
  %8 = bitcast %struct.timeval* %time.i to i8*, !dbg !1047
  call void @llvm.lifetime.start(i64 16, i8* nonnull %8) #9, !dbg !1047
  tail call void @llvm.dbg.value(metadata %struct.timeval* %time.i, i64 0, metadata !604, metadata !614) #9, !dbg !1049
  %call.i = call i32 @gettimeofday(%struct.timeval* nonnull %time.i, %struct.timezone* null) #9, !dbg !1050
  %tobool.i = icmp eq i32 %call.i, 0, !dbg !1050
  br i1 %tobool.i, label %if.end.i, label %_Z8get_timev.exit, !dbg !1051

if.end.i:                                         ; preds = %for.end
  %tv_sec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %time.i, i64 0, i32 0, !dbg !1052
  %9 = load i64, i64* %tv_sec.i, align 8, !dbg !1052, !tbaa !620
  %conv.i = sitofp i64 %9 to double, !dbg !1053
  %tv_usec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %time.i, i64 0, i32 1, !dbg !1054
  %10 = load i64, i64* %tv_usec.i, align 8, !dbg !1054, !tbaa !627
  %conv1.i = sitofp i64 %10 to double, !dbg !1055
  %mul.i = fmul double %conv1.i, 1.000000e-06, !dbg !1056
  %add.i = fadd double %mul.i, %conv.i, !dbg !1057
  br label %_Z8get_timev.exit, !dbg !1058

_Z8get_timev.exit:                                ; preds = %for.end, %if.end.i
  %retval.0.i = phi double [ %add.i, %if.end.i ], [ 0.000000e+00, %for.end ]
  call void @llvm.lifetime.end(i64 16, i8* nonnull %8) #9, !dbg !1059
  tail call void @llvm.dbg.value(metadata double %retval.0.i, i64 0, metadata !953, metadata !638), !dbg !1060
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1061, !tbaa !641
  %sub51 = fsub double %retval.0.i, %retval.0.i104, !dbg !1062
  %call52 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.8, i64 0, i64 0), double %sub51) #10, !dbg !1063
  ret i32 %dst.0.lcssa, !dbg !1064
}

declare i32 @cudaDeviceSetCacheConfig(i32) local_unnamed_addr #5

declare i32 @cudaDeviceSynchronize() local_unnamed_addr #5

declare i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) local_unnamed_addr #5

; Function Attrs: noreturn nounwind uwtable
define void @_Z5usageiPPc(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #6 !dbg !1065 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !1069, metadata !638), !dbg !1071
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !1070, metadata !638), !dbg !1072
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1073, !tbaa !641
  %1 = load i8*, i8** %argv, align 8, !dbg !1074, !tbaa !641
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([100 x i8], [100 x i8]* @.str.9, i64 0, i64 0), i8* %1) #10, !dbg !1075
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1076, !tbaa !641
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([78 x i8], [78 x i8]* @.str.10, i64 0, i64 0), i64 77, i64 1, %struct._IO_FILE* %2) #10, !dbg !1077
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1078, !tbaa !641
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.11, i64 0, i64 0), i64 52, i64 1, %struct._IO_FILE* %4) #10, !dbg !1079
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1080, !tbaa !641
  %7 = tail call i64 @fwrite(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.12, i64 0, i64 0), i64 37, i64 1, %struct._IO_FILE* %6) #10, !dbg !1081
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1082, !tbaa !641
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([89 x i8], [89 x i8]* @.str.13, i64 0, i64 0), i64 88, i64 1, %struct._IO_FILE* %8) #10, !dbg !1083
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1084, !tbaa !641
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([86 x i8], [86 x i8]* @.str.14, i64 0, i64 0), i64 85, i64 1, %struct._IO_FILE* %10) #10, !dbg !1085
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1086, !tbaa !641
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.15, i64 0, i64 0), i64 41, i64 1, %struct._IO_FILE* %12) #10, !dbg !1087
  tail call void @exit(i32 1) #12, !dbg !1088
  unreachable, !dbg !1088
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #7

; Function Attrs: norecurse uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #8 !dbg !1089 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !1093, metadata !638), !dbg !1095
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !1094, metadata !638), !dbg !1096
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.16, i64 0, i64 0), i32 16, i32 16), !dbg !1097
  tail call void @_Z3runiPPc(i32 %argc, i8** %argv), !dbg !1098
  ret i32 0, !dbg !1099
}

; Function Attrs: uwtable
define void @_Z3runiPPc(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #4 !dbg !1100 {
entry:
  %MatrixTemp = alloca [2 x float*], align 16
  %MatrixPower = alloca float*, align 8
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !1102, metadata !638), !dbg !1127
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !1103, metadata !638), !dbg !1128
  %call = tail call i32 @cudaDeviceSetLimit(i32 2, i64 629145600), !dbg !1129
  tail call void @llvm.dbg.value(metadata i32 60, i64 0, metadata !1113, metadata !638), !dbg !1130
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !1114, metadata !638), !dbg !1131
  %cmp = icmp eq i32 %argc, 7, !dbg !1132
  br i1 %cmp, label %if.end, label %if.then, !dbg !1134

if.then:                                          ; preds = %entry
  tail call void @_Z5usageiPPc(i32 undef, i8** %argv), !dbg !1135
  unreachable

if.end:                                           ; preds = %entry
  %arrayidx = getelementptr inbounds i8*, i8** %argv, i64 1, !dbg !1136
  %0 = load i8*, i8** %arrayidx, align 8, !dbg !1136, !tbaa !641
  tail call void @llvm.dbg.value(metadata i8* %0, i64 0, metadata !321, metadata !638) #9, !dbg !1138
  %call.i = tail call i64 @strtol(i8* nocapture nonnull %0, i8** null, i32 10) #9, !dbg !1140
  %conv.i = trunc i64 %call.i to i32, !dbg !1140
  tail call void @llvm.dbg.value(metadata i32 %conv.i, i64 0, metadata !1105, metadata !638), !dbg !1141
  %cmp2 = icmp slt i32 %conv.i, 1, !dbg !1142
  br i1 %cmp2, label %if.then14, label %lor.lhs.false6, !dbg !1143

lor.lhs.false6:                                   ; preds = %if.end
  tail call void @llvm.dbg.value(metadata i32 %conv.i, i64 0, metadata !1106, metadata !638), !dbg !1144
  %arrayidx7 = getelementptr inbounds i8*, i8** %argv, i64 2, !dbg !1145
  %1 = load i8*, i8** %arrayidx7, align 8, !dbg !1145, !tbaa !641
  tail call void @llvm.dbg.value(metadata i8* %1, i64 0, metadata !321, metadata !638) #9, !dbg !1146
  %call.i149 = tail call i64 @strtol(i8* nocapture nonnull %1, i8** null, i32 10) #9, !dbg !1148
  %conv.i150 = trunc i64 %call.i149 to i32, !dbg !1148
  tail call void @llvm.dbg.value(metadata i32 %conv.i150, i64 0, metadata !1114, metadata !638), !dbg !1131
  %cmp9 = icmp slt i32 %conv.i150, 1, !dbg !1149
  br i1 %cmp9, label %if.then14, label %lor.lhs.false10, !dbg !1150

lor.lhs.false10:                                  ; preds = %lor.lhs.false6
  %arrayidx11 = getelementptr inbounds i8*, i8** %argv, i64 3, !dbg !1151
  %2 = load i8*, i8** %arrayidx11, align 8, !dbg !1151, !tbaa !641
  tail call void @llvm.dbg.value(metadata i8* %2, i64 0, metadata !321, metadata !638) #9, !dbg !1152
  %call.i151 = tail call i64 @strtol(i8* nocapture nonnull %2, i8** null, i32 10) #9, !dbg !1154
  %conv.i152 = trunc i64 %call.i151 to i32, !dbg !1154
  tail call void @llvm.dbg.value(metadata i32 %conv.i152, i64 0, metadata !1113, metadata !638), !dbg !1130
  %cmp13 = icmp slt i32 %conv.i152, 1, !dbg !1155
  br i1 %cmp13, label %if.then14, label %if.end15, !dbg !1156

if.then14:                                        ; preds = %lor.lhs.false10, %lor.lhs.false6, %if.end
  tail call void @llvm.dbg.value(metadata i32 %conv.i, i64 0, metadata !1106, metadata !638), !dbg !1144
  tail call void @_Z5usageiPPc(i32 undef, i8** nonnull %argv), !dbg !1158
  unreachable

if.end15:                                         ; preds = %lor.lhs.false10
  tail call void @llvm.dbg.value(metadata i32 %conv.i, i64 0, metadata !1106, metadata !638), !dbg !1144
  tail call void @llvm.dbg.value(metadata i32 %conv.i152, i64 0, metadata !1113, metadata !638), !dbg !1130
  tail call void @llvm.dbg.value(metadata i32 %conv.i150, i64 0, metadata !1114, metadata !638), !dbg !1131
  %arrayidx16 = getelementptr inbounds i8*, i8** %argv, i64 4, !dbg !1159
  %3 = load i8*, i8** %arrayidx16, align 8, !dbg !1159, !tbaa !641
  tail call void @llvm.dbg.value(metadata i8* %3, i64 0, metadata !1110, metadata !638), !dbg !1160
  %arrayidx17 = getelementptr inbounds i8*, i8** %argv, i64 5, !dbg !1161
  %4 = load i8*, i8** %arrayidx17, align 8, !dbg !1161, !tbaa !641
  tail call void @llvm.dbg.value(metadata i8* %4, i64 0, metadata !1111, metadata !638), !dbg !1162
  %arrayidx18 = getelementptr inbounds i8*, i8** %argv, i64 6, !dbg !1163
  %5 = load i8*, i8** %arrayidx18, align 8, !dbg !1163, !tbaa !641
  tail call void @llvm.dbg.value(metadata i8* %5, i64 0, metadata !1112, metadata !638), !dbg !1164
  %mul = mul i64 %call.i, %call.i, !dbg !1165
  %mul19 = shl nsw i32 %conv.i150, 1, !dbg !1166
  tail call void @llvm.dbg.value(metadata i32 %conv.i150, i64 0, metadata !1115, metadata !638), !dbg !1167
  tail call void @llvm.dbg.value(metadata i32 %conv.i150, i64 0, metadata !1116, metadata !638), !dbg !1168
  %sub = sub nsw i32 16, %mul19, !dbg !1169
  tail call void @llvm.dbg.value(metadata i32 %sub, i64 0, metadata !1117, metadata !638), !dbg !1170
  tail call void @llvm.dbg.value(metadata i32 %sub, i64 0, metadata !1118, metadata !638), !dbg !1171
  %div25 = sdiv i32 %conv.i, %sub, !dbg !1172
  %rem = srem i32 %conv.i, %sub, !dbg !1173
  %not.cmp26 = icmp ne i32 %rem, 0, !dbg !1174
  %cond = zext i1 %not.cmp26 to i32, !dbg !1174
  %add = add nsw i32 %div25, %cond, !dbg !1175
  tail call void @llvm.dbg.value(metadata i32 %add, i64 0, metadata !1119, metadata !638), !dbg !1176
  tail call void @llvm.dbg.value(metadata i32 %add, i64 0, metadata !1120, metadata !638), !dbg !1177
  %conv148 = and i64 %mul, 4294967295, !dbg !1178
  %mul32 = shl nuw nsw i64 %conv148, 2, !dbg !1179
  %call33 = tail call noalias i8* @malloc(i64 %mul32) #9, !dbg !1180
  %6 = bitcast i8* %call33 to float*, !dbg !1181
  tail call void @llvm.dbg.value(metadata float* %6, i64 0, metadata !1107, metadata !638), !dbg !1182
  %call36 = tail call noalias i8* @malloc(i64 %mul32) #9, !dbg !1183
  %7 = bitcast i8* %call36 to float*, !dbg !1184
  tail call void @llvm.dbg.value(metadata float* %7, i64 0, metadata !1108, metadata !638), !dbg !1185
  %call38 = tail call noalias i8* @calloc(i64 %conv148, i64 4) #9, !dbg !1186
  %8 = bitcast i8* %call38 to float*, !dbg !1187
  tail call void @llvm.dbg.value(metadata float* %8, i64 0, metadata !1109, metadata !638), !dbg !1188
  %tobool = icmp ne i8* %call36, null, !dbg !1189
  %tobool40 = icmp ne i8* %call33, null, !dbg !1191
  %or.cond = and i1 %tobool40, %tobool, !dbg !1193
  %tobool42 = icmp ne i8* %call38, null, !dbg !1194
  %or.cond76 = and i1 %or.cond, %tobool42, !dbg !1193
  br i1 %or.cond76, label %if.end44, label %if.then43, !dbg !1193

if.then43:                                        ; preds = %if.end15
  tail call void @llvm.dbg.value(metadata i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.17, i64 0, i64 0), i64 0, metadata !637, metadata !638) #9, !dbg !1196
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1198, !tbaa !641
  %call.i153 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.17, i64 0, i64 0)) #11, !dbg !1199
  br label %if.end44, !dbg !1200

if.end44:                                         ; preds = %if.end15, %if.then43
  %call45 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([94 x i8], [94 x i8]* @.str.18, i64 0, i64 0), i32 %conv.i150, i32 %conv.i, i32 %conv.i, i32 %conv.i150, i32 %conv.i150, i32 %add, i32 %add, i32 %sub, i32 %sub), !dbg !1201
  tail call void @_Z9readinputPfiiPc(float* %6, i32 %conv.i, i32 %conv.i, i8* %3), !dbg !1202
  tail call void @_Z9readinputPfiiPc(float* %7, i32 %conv.i, i32 %conv.i, i8* %4), !dbg !1203
  %10 = bitcast [2 x float*]* %MatrixTemp to i8*, !dbg !1204
  call void @llvm.lifetime.start(i64 16, i8* nonnull %10) #9, !dbg !1204
  tail call void @llvm.dbg.declare(metadata [2 x float*]* %MatrixTemp, metadata !1121, metadata !638), !dbg !1205
  %11 = bitcast float** %MatrixPower to i8*, !dbg !1204
  call void @llvm.lifetime.start(i64 8, i8* nonnull %11) #9, !dbg !1204
  %12 = bitcast [2 x float*]* %MatrixTemp to i8**, !dbg !1206
  %call49 = call i32 @cudaMalloc(i8** nonnull %12, i64 %mul32), !dbg !1207
  %arrayidx50 = getelementptr inbounds [2 x float*], [2 x float*]* %MatrixTemp, i64 0, i64 1, !dbg !1208
  %13 = bitcast float** %arrayidx50 to i8**, !dbg !1209
  %call53 = call i32 @cudaMalloc(i8** %13, i64 %mul32), !dbg !1210
  %14 = load i8*, i8** %12, align 16, !dbg !1211, !tbaa !641
  %call57 = call i32 @cudaMemcpy(i8* %14, i8* %call33, i64 %mul32, i32 1), !dbg !1212
  %15 = bitcast float** %MatrixPower to i8**, !dbg !1213
  %call60 = call i32 @cudaMalloc(i8** nonnull %15, i64 %mul32), !dbg !1214
  %16 = load i8*, i8** %15, align 8, !dbg !1215, !tbaa !641
  %call63 = call i32 @cudaMemcpy(i8* %16, i8* %call36, i64 %mul32, i32 1), !dbg !1216
  %puts = call i32 @puts(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @str.22, i64 0, i64 0)), !dbg !1217
  %17 = load float*, float** %MatrixPower, align 8, !dbg !1218, !tbaa !641
  call void @llvm.dbg.value(metadata float* %17, i64 0, metadata !1125, metadata !638), !dbg !1219
  %arraydecay = getelementptr inbounds [2 x float*], [2 x float*]* %MatrixTemp, i64 0, i64 0, !dbg !1220
  %call65 = call i32 @_Z17compute_tran_tempPfPS_iiiiiiii(float* %17, float** nonnull %arraydecay, i32 %conv.i, i32 %conv.i, i32 %conv.i152, i32 %conv.i150, i32 %add, i32 %add, i32 %conv.i150, i32 %conv.i150), !dbg !1221
  call void @llvm.dbg.value(metadata i32 %call65, i64 0, metadata !1126, metadata !638), !dbg !1222
  %puts147 = call i32 @puts(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @str.23, i64 0, i64 0)), !dbg !1223
  %idxprom = sext i32 %call65 to i64, !dbg !1224
  %arrayidx67 = getelementptr inbounds [2 x float*], [2 x float*]* %MatrixTemp, i64 0, i64 %idxprom, !dbg !1224
  %18 = bitcast float** %arrayidx67 to i8**, !dbg !1224
  %19 = load i8*, i8** %18, align 8, !dbg !1224, !tbaa !641
  %call70 = call i32 @cudaMemcpy(i8* %call38, i8* %19, i64 %mul32, i32 2), !dbg !1225
  call void @_Z11writeoutputPfiiPc(float* %8, i32 %conv.i, i32 %conv.i, i8* %5), !dbg !1226
  %20 = load i8*, i8** %15, align 8, !dbg !1227, !tbaa !641
  %call71 = call i32 @cudaFree(i8* %20), !dbg !1228
  %21 = load i8*, i8** %12, align 16, !dbg !1229, !tbaa !641
  %call73 = call i32 @cudaFree(i8* %21), !dbg !1230
  %22 = load i8*, i8** %13, align 8, !dbg !1231, !tbaa !641
  %call75 = call i32 @cudaFree(i8* %22), !dbg !1232
  call void @free(i8* %call38) #9, !dbg !1233
  call void @llvm.lifetime.end(i64 8, i8* nonnull %11) #9, !dbg !1234
  call void @llvm.lifetime.end(i64 16, i8* nonnull %10) #9, !dbg !1234
  ret void, !dbg !1234
}

declare i32 @cudaDeviceSetLimit(i32, i64) local_unnamed_addr #5

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) local_unnamed_addr #3

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) local_unnamed_addr #3

declare i32 @cudaMalloc(i8**, i64) local_unnamed_addr #5

declare i32 @cudaMemcpy(i8*, i8*, i64, i32) local_unnamed_addr #5

declare i32 @cudaFree(i8*) local_unnamed_addr #5

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) local_unnamed_addr #3

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #2

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #9

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #9

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { nounwind }
attributes #10 = { cold }
attributes #11 = { cold nounwind }
attributes #12 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!597, !598}
!llvm.ident = !{!599}

!0 = !DIGlobalVariableExpression(var: !1)
!1 = distinct !DIGlobalVariable(name: "t_chip", scope: !2, file: !3, line: 30, type: !29, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !3, producer: "clang version 5.0.0 (trunk 294196)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !26, globals: !36, imports: !43)
!3 = !DIFile(filename: "hotspot.cu", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/hotspotllvm")
!4 = !{!5, !12, !19}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaFuncCache", file: !6, line: 1112, size: 32, elements: !7, identifier: "_ZTS13cudaFuncCache")
!6 = !DIFile(filename: "/usr/local/cuda/include/driver_types.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/hotspotllvm")
!7 = !{!8, !9, !10, !11}
!8 = !DIEnumerator(name: "cudaFuncCachePreferNone", value: 0)
!9 = !DIEnumerator(name: "cudaFuncCachePreferShared", value: 1)
!10 = !DIEnumerator(name: "cudaFuncCachePreferL1", value: 2)
!11 = !DIEnumerator(name: "cudaFuncCachePreferEqual", value: 3)
!12 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaLimit", file: !6, line: 1145, size: 32, elements: !13, identifier: "_ZTS9cudaLimit")
!13 = !{!14, !15, !16, !17, !18}
!14 = !DIEnumerator(name: "cudaLimitStackSize", value: 0)
!15 = !DIEnumerator(name: "cudaLimitPrintfFifoSize", value: 1)
!16 = !DIEnumerator(name: "cudaLimitMallocHeapSize", value: 2)
!17 = !DIEnumerator(name: "cudaLimitDevRuntimeSyncDepth", value: 3)
!18 = !DIEnumerator(name: "cudaLimitDevRuntimePendingLaunchCount", value: 4)
!19 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaMemcpyKind", file: !6, line: 796, size: 32, elements: !20, identifier: "_ZTS14cudaMemcpyKind")
!20 = !{!21, !22, !23, !24, !25}
!21 = !DIEnumerator(name: "cudaMemcpyHostToHost", value: 0)
!22 = !DIEnumerator(name: "cudaMemcpyHostToDevice", value: 1)
!23 = !DIEnumerator(name: "cudaMemcpyDeviceToHost", value: 2)
!24 = !DIEnumerator(name: "cudaMemcpyDeviceToDevice", value: 3)
!25 = !DIEnumerator(name: "cudaMemcpyDefault", value: 4)
!26 = !{!27, !28, !30, !32, !33}
!27 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!29 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!30 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !31, size: 64)
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!32 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64)
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 64)
!35 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!36 = !{!0, !37, !39, !41}
!37 = !DIGlobalVariableExpression(var: !38)
!38 = distinct !DIGlobalVariable(name: "chip_height", scope: !2, file: !3, line: 31, type: !29, isLocal: false, isDefinition: true)
!39 = !DIGlobalVariableExpression(var: !40)
!40 = distinct !DIGlobalVariable(name: "chip_width", scope: !2, file: !3, line: 32, type: !29, isLocal: false, isDefinition: true)
!41 = !DIGlobalVariableExpression(var: !42)
!42 = distinct !DIGlobalVariable(name: "amb_temp", scope: !2, file: !3, line: 34, type: !29, isLocal: false, isDefinition: true)
!43 = !{!44, !51, !55, !57, !59, !61, !63, !67, !69, !71, !73, !75, !77, !79, !81, !83, !85, !87, !89, !91, !93, !95, !99, !101, !103, !105, !109, !114, !116, !118, !123, !127, !129, !131, !133, !135, !137, !139, !141, !143, !148, !152, !154, !156, !160, !162, !164, !166, !168, !170, !174, !176, !178, !182, !188, !192, !194, !196, !200, !202, !204, !208, !210, !212, !216, !218, !220, !222, !224, !226, !228, !230, !232, !234, !239, !241, !243, !247, !249, !251, !253, !255, !257, !259, !261, !265, !269, !271, !273, !278, !280, !282, !284, !286, !288, !290, !294, !300, !304, !308, !313, !316, !322, !326, !340, !344, !348, !352, !356, !360, !362, !366, !370, !374, !382, !386, !390, !394, !398, !403, !408, !412, !416, !418, !426, !430, !438, !440, !442, !446, !450, !454, !459, !463, !468, !469, !470, !471, !474, !475, !476, !477, !478, !479, !480, !483, !485, !487, !489, !491, !493, !495, !497, !500, !502, !504, !506, !508, !510, !512, !514, !516, !518, !520, !522, !524, !526, !528, !530, !532, !534, !536, !538, !540, !542, !544, !546, !548, !550, !552, !554, !556, !558, !560, !562, !564, !568, !569, !571, !573, !575, !577, !579, !581, !583, !585, !587, !589, !591, !593, !595}
!44 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !47, line: 201)
!45 = !DINamespace(name: "std", scope: null, file: !46, line: 195)
!46 = !DIFile(filename: "/home/dshen/llvm/build/bin/../lib/clang/5.0.0/include/__clang_cuda_math_forward_declares.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/hotspotllvm")
!47 = !DISubprogram(name: "abs", linkageName: "_ZL3absx", scope: !46, file: !46, line: 44, type: !48, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!48 = !DISubroutineType(types: !49)
!49 = !{!50, !50}
!50 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!51 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !52, line: 202)
!52 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !46, file: !46, line: 46, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!53 = !DISubroutineType(types: !54)
!54 = !{!29, !29}
!55 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !56, line: 203)
!56 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !46, file: !46, line: 48, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!57 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !58, line: 204)
!58 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !46, file: !46, line: 50, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!59 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !60, line: 205)
!60 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !46, file: !46, line: 52, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!61 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !62, line: 206)
!62 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !46, file: !46, line: 56, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!63 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !64, line: 207)
!64 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !46, file: !46, line: 54, type: !65, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!65 = !DISubroutineType(types: !66)
!66 = !{!29, !29, !29}
!67 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !68, line: 208)
!68 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !46, file: !46, line: 58, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!69 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !70, line: 209)
!70 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !46, file: !46, line: 60, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!71 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !72, line: 210)
!72 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !46, file: !46, line: 62, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!73 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !74, line: 211)
!74 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !46, file: !46, line: 64, type: !65, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!75 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !76, line: 212)
!76 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !46, file: !46, line: 66, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!77 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !78, line: 213)
!78 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !46, file: !46, line: 68, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!79 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !80, line: 214)
!80 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !46, file: !46, line: 72, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!81 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !82, line: 215)
!82 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !46, file: !46, line: 70, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!83 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !84, line: 216)
!84 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !46, file: !46, line: 76, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!85 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !86, line: 217)
!86 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !46, file: !46, line: 74, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!87 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !88, line: 218)
!88 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !46, file: !46, line: 78, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!89 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !90, line: 219)
!90 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !46, file: !46, line: 80, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!91 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !92, line: 220)
!92 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !46, file: !46, line: 82, type: !65, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!93 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !94, line: 221)
!94 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !46, file: !46, line: 84, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!95 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !96, line: 222)
!96 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !46, file: !46, line: 86, type: !97, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!97 = !DISubroutineType(types: !98)
!98 = !{!29, !29, !29, !29}
!99 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !100, line: 223)
!100 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !46, file: !46, line: 88, type: !65, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!101 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !102, line: 224)
!102 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !46, file: !46, line: 90, type: !65, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!103 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !104, line: 225)
!104 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !46, file: !46, line: 92, type: !65, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!105 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !106, line: 226)
!106 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !46, file: !46, line: 94, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!107 = !DISubroutineType(types: !108)
!108 = !{!32, !29}
!109 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !110, line: 227)
!110 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !46, file: !46, line: 96, type: !111, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!111 = !DISubroutineType(types: !112)
!112 = !{!29, !29, !113}
!113 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!114 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !115, line: 228)
!115 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !46, file: !46, line: 98, type: !65, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!116 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !117, line: 229)
!117 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !46, file: !46, line: 100, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!118 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !119, line: 230)
!119 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !46, file: !46, line: 102, type: !120, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!120 = !DISubroutineType(types: !121)
!121 = !{!122, !29}
!122 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !124, line: 231)
!124 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !46, file: !46, line: 106, type: !125, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!125 = !DISubroutineType(types: !126)
!126 = !{!122, !29, !29}
!127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !128, line: 232)
!128 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !46, file: !46, line: 105, type: !125, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!129 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !130, line: 233)
!130 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !46, file: !46, line: 108, type: !120, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!131 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !132, line: 234)
!132 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !46, file: !46, line: 112, type: !125, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!133 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !134, line: 235)
!134 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !46, file: !46, line: 111, type: !125, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !136, line: 236)
!136 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !46, file: !46, line: 114, type: !125, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !138, line: 237)
!138 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !46, file: !46, line: 116, type: !120, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !140, line: 238)
!140 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !46, file: !46, line: 118, type: !120, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !142, line: 239)
!142 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !46, file: !46, line: 120, type: !125, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !144, line: 240)
!144 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !46, file: !46, line: 121, type: !145, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!145 = !DISubroutineType(types: !146)
!146 = !{!147, !147}
!147 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!148 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !149, line: 241)
!149 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !46, file: !46, line: 123, type: !150, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!150 = !DISubroutineType(types: !151)
!151 = !{!29, !29, !32}
!152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !153, line: 242)
!153 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !46, file: !46, line: 125, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!154 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !155, line: 243)
!155 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !46, file: !46, line: 126, type: !48, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !157, line: 244)
!157 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !46, file: !46, line: 128, type: !158, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!158 = !DISubroutineType(types: !159)
!159 = !{!50, !29}
!160 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !161, line: 245)
!161 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !46, file: !46, line: 138, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!162 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !163, line: 246)
!163 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !46, file: !46, line: 130, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!164 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !165, line: 247)
!165 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !46, file: !46, line: 132, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!166 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !167, line: 248)
!167 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !46, file: !46, line: 134, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!168 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !169, line: 249)
!169 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !46, file: !46, line: 136, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !171, line: 250)
!171 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !46, file: !46, line: 140, type: !172, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!172 = !DISubroutineType(types: !173)
!173 = !{!147, !29}
!174 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !175, line: 251)
!175 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !46, file: !46, line: 142, type: !172, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !177, line: 252)
!177 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !46, file: !46, line: 143, type: !158, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !179, line: 253)
!179 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !46, file: !46, line: 145, type: !180, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!180 = !DISubroutineType(types: !181)
!181 = !{!29, !29, !28}
!182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !183, line: 254)
!183 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !46, file: !46, line: 146, type: !184, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!184 = !DISubroutineType(types: !185)
!185 = !{!27, !186}
!186 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !187, size: 64)
!187 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !35)
!188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !189, line: 255)
!189 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !46, file: !46, line: 147, type: !190, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!190 = !DISubroutineType(types: !191)
!191 = !{!29, !186}
!192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !193, line: 256)
!193 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !46, file: !46, line: 149, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !195, line: 257)
!195 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !46, file: !46, line: 151, type: !65, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !197, line: 258)
!197 = !DISubprogram(name: "nexttoward", linkageName: "_ZL10nexttowardfd", scope: !46, file: !46, line: 153, type: !198, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!198 = !DISubroutineType(types: !199)
!199 = !{!29, !29, !27}
!200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !201, line: 259)
!201 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !46, file: !46, line: 158, type: !150, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !203, line: 260)
!203 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !46, file: !46, line: 160, type: !65, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !205, line: 261)
!205 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !46, file: !46, line: 162, type: !206, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!206 = !DISubroutineType(types: !207)
!207 = !{!29, !29, !29, !113}
!208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !209, line: 262)
!209 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !46, file: !46, line: 164, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !211, line: 263)
!211 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !46, file: !46, line: 166, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !213, line: 264)
!213 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !46, file: !46, line: 168, type: !214, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!214 = !DISubroutineType(types: !215)
!215 = !{!29, !29, !147}
!216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !217, line: 265)
!217 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !46, file: !46, line: 170, type: !150, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !219, line: 266)
!219 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !46, file: !46, line: 172, type: !120, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !221, line: 267)
!221 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !46, file: !46, line: 174, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !223, line: 268)
!223 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !46, file: !46, line: 176, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !225, line: 269)
!225 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !46, file: !46, line: 178, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !227, line: 270)
!227 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !46, file: !46, line: 180, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!228 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !229, line: 271)
!229 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !46, file: !46, line: 182, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !231, line: 272)
!231 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !46, file: !46, line: 184, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !233, line: 273)
!233 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !46, file: !46, line: 186, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !235, line: 102)
!235 = !DISubprogram(name: "acos", scope: !236, file: !236, line: 54, type: !237, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!236 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/hotspotllvm")
!237 = !DISubroutineType(types: !238)
!238 = !{!27, !27}
!239 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !240, line: 121)
!240 = !DISubprogram(name: "asin", scope: !236, file: !236, line: 56, type: !237, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!241 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !242, line: 140)
!242 = !DISubprogram(name: "atan", scope: !236, file: !236, line: 58, type: !237, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!243 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !244, line: 159)
!244 = !DISubprogram(name: "atan2", scope: !236, file: !236, line: 60, type: !245, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!245 = !DISubroutineType(types: !246)
!246 = !{!27, !27, !27}
!247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !248, line: 180)
!248 = !DISubprogram(name: "ceil", scope: !236, file: !236, line: 178, type: !237, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!249 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !250, line: 199)
!250 = !DISubprogram(name: "cos", scope: !236, file: !236, line: 63, type: !237, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!251 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !252, line: 218)
!252 = !DISubprogram(name: "cosh", scope: !236, file: !236, line: 72, type: !237, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!253 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !254, line: 237)
!254 = !DISubprogram(name: "exp", scope: !236, file: !236, line: 100, type: !237, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!255 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !256, line: 256)
!256 = !DISubprogram(name: "fabs", scope: !236, file: !236, line: 181, type: !237, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!257 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !258, line: 275)
!258 = !DISubprogram(name: "floor", scope: !236, file: !236, line: 184, type: !237, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!259 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !260, line: 294)
!260 = !DISubprogram(name: "fmod", scope: !236, file: !236, line: 187, type: !245, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !262, line: 315)
!262 = !DISubprogram(name: "frexp", scope: !236, file: !236, line: 103, type: !263, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!263 = !DISubroutineType(types: !264)
!264 = !{!27, !27, !113}
!265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !266, line: 334)
!266 = !DISubprogram(name: "ldexp", scope: !236, file: !236, line: 106, type: !267, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!267 = !DISubroutineType(types: !268)
!268 = !{!27, !27, !32}
!269 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !270, line: 353)
!270 = !DISubprogram(name: "log", scope: !236, file: !236, line: 109, type: !237, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!271 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !272, line: 372)
!272 = !DISubprogram(name: "log10", scope: !236, file: !236, line: 112, type: !237, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!273 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !274, line: 391)
!274 = !DISubprogram(name: "modf", scope: !236, file: !236, line: 115, type: !275, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!275 = !DISubroutineType(types: !276)
!276 = !{!27, !27, !277}
!277 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !279, line: 403)
!279 = !DISubprogram(name: "pow", scope: !236, file: !236, line: 153, type: !245, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !281, line: 440)
!281 = !DISubprogram(name: "sin", scope: !236, file: !236, line: 65, type: !237, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !283, line: 459)
!283 = !DISubprogram(name: "sinh", scope: !236, file: !236, line: 74, type: !237, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !285, line: 478)
!285 = !DISubprogram(name: "sqrt", scope: !236, file: !236, line: 156, type: !237, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!286 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !287, line: 497)
!287 = !DISubprogram(name: "tan", scope: !236, file: !236, line: 67, type: !237, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !289, line: 516)
!289 = !DISubprogram(name: "tanh", scope: !236, file: !236, line: 76, type: !237, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!290 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !291, line: 118)
!291 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !292, line: 101, baseType: !293)
!292 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/hotspotllvm")
!293 = !DICompositeType(tag: DW_TAG_structure_type, file: !292, line: 97, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!294 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !295, line: 119)
!295 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !292, line: 109, baseType: !296)
!296 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !292, line: 105, size: 128, elements: !297, identifier: "_ZTS6ldiv_t")
!297 = !{!298, !299}
!298 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !296, file: !292, line: 107, baseType: !147, size: 64)
!299 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !296, file: !292, line: 108, baseType: !147, size: 64, offset: 64)
!300 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !301, line: 121)
!301 = !DISubprogram(name: "abort", scope: !292, file: !292, line: 515, type: !302, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: true)
!302 = !DISubroutineType(types: !303)
!303 = !{null}
!304 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !305, line: 122)
!305 = !DISubprogram(name: "abs", scope: !292, file: !292, line: 775, type: !306, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!306 = !DISubroutineType(types: !307)
!307 = !{!32, !32}
!308 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !309, line: 123)
!309 = !DISubprogram(name: "atexit", scope: !292, file: !292, line: 519, type: !310, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!310 = !DISubroutineType(types: !311)
!311 = !{!32, !312}
!312 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !302, size: 64)
!313 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !314, line: 129)
!314 = !DISubprogram(name: "atof", scope: !315, file: !315, line: 26, type: !184, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!315 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/hotspotllvm")
!316 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !317, line: 130)
!317 = distinct !DISubprogram(name: "atoi", scope: !292, file: !292, line: 278, type: !318, isLocal: false, isDefinition: true, scopeLine: 279, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !320)
!318 = !DISubroutineType(types: !319)
!319 = !{!32, !186}
!320 = !{!321}
!321 = !DILocalVariable(name: "__nptr", arg: 1, scope: !317, file: !292, line: 278, type: !186)
!322 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !323, line: 131)
!323 = !DISubprogram(name: "atol", scope: !292, file: !292, line: 283, type: !324, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!324 = !DISubroutineType(types: !325)
!325 = !{!147, !186}
!326 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !327, line: 132)
!327 = !DISubprogram(name: "bsearch", scope: !328, file: !328, line: 20, type: !329, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!328 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdlib-bsearch.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/hotspotllvm")
!329 = !DISubroutineType(types: !330)
!330 = !{!31, !331, !331, !333, !333, !336}
!331 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !332, size: 64)
!332 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!333 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !334, line: 62, baseType: !335)
!334 = !DIFile(filename: "/home/dshen/llvm/build/bin/../lib/clang/5.0.0/include/stddef.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/hotspotllvm")
!335 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!336 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !292, line: 742, baseType: !337)
!337 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !338, size: 64)
!338 = !DISubroutineType(types: !339)
!339 = !{!32, !331, !331}
!340 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !341, line: 133)
!341 = !DISubprogram(name: "calloc", scope: !292, file: !292, line: 468, type: !342, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!342 = !DISubroutineType(types: !343)
!343 = !{!31, !333, !333}
!344 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !345, line: 134)
!345 = !DISubprogram(name: "div", scope: !292, file: !292, line: 789, type: !346, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!346 = !DISubroutineType(types: !347)
!347 = !{!291, !32, !32}
!348 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !349, line: 135)
!349 = !DISubprogram(name: "exit", scope: !292, file: !292, line: 543, type: !350, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: true)
!350 = !DISubroutineType(types: !351)
!351 = !{null, !32}
!352 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !353, line: 136)
!353 = !DISubprogram(name: "free", scope: !292, file: !292, line: 483, type: !354, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!354 = !DISubroutineType(types: !355)
!355 = !{null, !31}
!356 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !357, line: 137)
!357 = !DISubprogram(name: "getenv", scope: !292, file: !292, line: 564, type: !358, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!358 = !DISubroutineType(types: !359)
!359 = !{!34, !186}
!360 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !361, line: 138)
!361 = !DISubprogram(name: "labs", scope: !292, file: !292, line: 776, type: !145, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!362 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !363, line: 139)
!363 = !DISubprogram(name: "ldiv", scope: !292, file: !292, line: 791, type: !364, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!364 = !DISubroutineType(types: !365)
!365 = !{!295, !147, !147}
!366 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !367, line: 140)
!367 = !DISubprogram(name: "malloc", scope: !292, file: !292, line: 466, type: !368, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!368 = !DISubroutineType(types: !369)
!369 = !{!31, !333}
!370 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !371, line: 142)
!371 = !DISubprogram(name: "mblen", scope: !292, file: !292, line: 863, type: !372, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!372 = !DISubroutineType(types: !373)
!373 = !{!32, !186, !333}
!374 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !375, line: 143)
!375 = !DISubprogram(name: "mbstowcs", scope: !292, file: !292, line: 874, type: !376, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!376 = !DISubroutineType(types: !377)
!377 = !{!333, !378, !381, !333}
!378 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !379)
!379 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !380, size: 64)
!380 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!381 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !186)
!382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !383, line: 144)
!383 = !DISubprogram(name: "mbtowc", scope: !292, file: !292, line: 866, type: !384, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!384 = !DISubroutineType(types: !385)
!385 = !{!32, !378, !381, !333}
!386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !387, line: 146)
!387 = !DISubprogram(name: "qsort", scope: !292, file: !292, line: 765, type: !388, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!388 = !DISubroutineType(types: !389)
!389 = !{null, !31, !333, !333, !336}
!390 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !391, line: 152)
!391 = !DISubprogram(name: "rand", scope: !292, file: !292, line: 374, type: !392, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!392 = !DISubroutineType(types: !393)
!393 = !{!32}
!394 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !395, line: 153)
!395 = !DISubprogram(name: "realloc", scope: !292, file: !292, line: 480, type: !396, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!396 = !DISubroutineType(types: !397)
!397 = !{!31, !31, !333}
!398 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !399, line: 154)
!399 = !DISubprogram(name: "srand", scope: !292, file: !292, line: 376, type: !400, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!400 = !DISubroutineType(types: !401)
!401 = !{null, !402}
!402 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!403 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !404, line: 155)
!404 = !DISubprogram(name: "strtod", scope: !292, file: !292, line: 164, type: !405, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!405 = !DISubroutineType(types: !406)
!406 = !{!27, !381, !407}
!407 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !33)
!408 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !409, line: 156)
!409 = !DISubprogram(name: "strtol", scope: !292, file: !292, line: 183, type: !410, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!410 = !DISubroutineType(types: !411)
!411 = !{!147, !381, !407, !32}
!412 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !413, line: 157)
!413 = !DISubprogram(name: "strtoul", scope: !292, file: !292, line: 187, type: !414, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!414 = !DISubroutineType(types: !415)
!415 = !{!335, !381, !407, !32}
!416 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !417, line: 158)
!417 = !DISubprogram(name: "system", scope: !292, file: !292, line: 717, type: !318, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!418 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !419, line: 160)
!419 = !DISubprogram(name: "wcstombs", scope: !292, file: !292, line: 877, type: !420, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!420 = !DISubroutineType(types: !421)
!421 = !{!333, !422, !423, !333}
!422 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !34)
!423 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !424)
!424 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !425, size: 64)
!425 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !380)
!426 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !427, line: 161)
!427 = !DISubprogram(name: "wctomb", scope: !292, file: !292, line: 870, type: !428, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!428 = !DISubroutineType(types: !429)
!429 = !{!32, !34, !380}
!430 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !431, entity: !433, line: 201)
!431 = !DINamespace(name: "__gnu_cxx", scope: null, file: !432, line: 68)
!432 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/bits/cpp_type_traits.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/hotspotllvm")
!433 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !292, line: 121, baseType: !434)
!434 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !292, line: 117, size: 128, elements: !435, identifier: "_ZTS7lldiv_t")
!435 = !{!436, !437}
!436 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !434, file: !292, line: 119, baseType: !50, size: 64)
!437 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !434, file: !292, line: 120, baseType: !50, size: 64, offset: 64)
!438 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !431, entity: !439, line: 207)
!439 = !DISubprogram(name: "_Exit", scope: !292, file: !292, line: 557, type: !350, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: true)
!440 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !431, entity: !441, line: 211)
!441 = !DISubprogram(name: "llabs", scope: !292, file: !292, line: 780, type: !48, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!442 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !431, entity: !443, line: 217)
!443 = !DISubprogram(name: "lldiv", scope: !292, file: !292, line: 797, type: !444, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!444 = !DISubroutineType(types: !445)
!445 = !{!433, !50, !50}
!446 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !431, entity: !447, line: 228)
!447 = !DISubprogram(name: "atoll", scope: !292, file: !292, line: 292, type: !448, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!448 = !DISubroutineType(types: !449)
!449 = !{!50, !186}
!450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !431, entity: !451, line: 229)
!451 = !DISubprogram(name: "strtoll", scope: !292, file: !292, line: 209, type: !452, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!452 = !DISubroutineType(types: !453)
!453 = !{!50, !381, !407, !32}
!454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !431, entity: !455, line: 230)
!455 = !DISubprogram(name: "strtoull", scope: !292, file: !292, line: 214, type: !456, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!456 = !DISubroutineType(types: !457)
!457 = !{!458, !381, !407, !32}
!458 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!459 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !431, entity: !460, line: 232)
!460 = !DISubprogram(name: "strtof", scope: !292, file: !292, line: 172, type: !461, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!461 = !DISubroutineType(types: !462)
!462 = !{!29, !381, !407}
!463 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !431, entity: !464, line: 233)
!464 = !DISubprogram(name: "strtold", scope: !292, file: !292, line: 175, type: !465, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!465 = !DISubroutineType(types: !466)
!466 = !{!467, !381, !407}
!467 = !DIBasicType(name: "long double", size: 128, encoding: DW_ATE_float)
!468 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !433, line: 241)
!469 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !439, line: 243)
!470 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !441, line: 245)
!471 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !472, line: 246)
!472 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !431, file: !473, line: 214, type: !444, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!473 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/cstdlib", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/hotspotllvm")
!474 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !443, line: 247)
!475 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !447, line: 249)
!476 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !460, line: 250)
!477 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !451, line: 251)
!478 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !455, line: 252)
!479 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !464, line: 253)
!480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !481, line: 418)
!481 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !482, file: !482, line: 1126, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!482 = !DIFile(filename: "/usr/local/cuda/include/math_functions.hpp", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/hotspotllvm")
!483 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !484, line: 419)
!484 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !482, file: !482, line: 1154, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!485 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !486, line: 420)
!486 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !482, file: !482, line: 1121, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!487 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !488, line: 421)
!488 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !482, file: !482, line: 1159, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!489 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !490, line: 422)
!490 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !482, file: !482, line: 1111, type: !65, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!491 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !492, line: 423)
!492 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !482, file: !482, line: 1116, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!493 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !494, line: 424)
!494 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !482, file: !482, line: 1164, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!495 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !496, line: 425)
!496 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !482, file: !482, line: 1199, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!497 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !498, line: 426)
!498 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !499, file: !499, line: 647, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!499 = !DIFile(filename: "/usr/local/cuda/include/device_functions.hpp", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/hotspotllvm")
!500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !501, line: 427)
!501 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !482, file: !482, line: 973, type: !65, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !503, line: 428)
!503 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !482, file: !482, line: 1027, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!504 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !505, line: 429)
!505 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !482, file: !482, line: 1096, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !507, line: 430)
!507 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !482, file: !482, line: 1259, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!508 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !509, line: 431)
!509 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !482, file: !482, line: 1249, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !511, line: 432)
!511 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !499, file: !499, line: 637, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!512 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !513, line: 433)
!513 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !482, file: !482, line: 1078, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!514 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !515, line: 434)
!515 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !482, file: !482, line: 1169, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!516 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !517, line: 435)
!517 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !499, file: !499, line: 582, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!518 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !519, line: 436)
!519 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !482, file: !482, line: 1385, type: !65, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!520 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !521, line: 437)
!521 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !499, file: !499, line: 572, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!522 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !523, line: 438)
!523 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !482, file: !482, line: 1337, type: !97, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !525, line: 439)
!525 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !499, file: !499, line: 602, type: !65, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!526 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !527, line: 440)
!527 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !499, file: !499, line: 597, type: !65, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !529, line: 441)
!529 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !482, file: !482, line: 1322, type: !65, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!530 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !531, line: 442)
!531 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !482, file: !482, line: 1312, type: !111, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!532 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !533, line: 443)
!533 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !482, file: !482, line: 1174, type: !65, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!534 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !535, line: 444)
!535 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !482, file: !482, line: 1390, type: !107, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !537, line: 445)
!537 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !482, file: !482, line: 1289, type: !150, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!538 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !539, line: 446)
!539 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !482, file: !482, line: 1284, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !541, line: 447)
!541 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !482, file: !482, line: 933, type: !158, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !543, line: 448)
!543 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !482, file: !482, line: 1371, type: !158, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!544 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !545, line: 449)
!545 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !482, file: !482, line: 1140, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!546 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !547, line: 450)
!547 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !482, file: !482, line: 1149, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!548 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !549, line: 451)
!549 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !482, file: !482, line: 1069, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!550 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !551, line: 452)
!551 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !482, file: !482, line: 1395, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!552 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !553, line: 453)
!553 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !482, file: !482, line: 1131, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!554 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !555, line: 454)
!555 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !482, file: !482, line: 924, type: !172, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!556 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !557, line: 455)
!557 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !482, file: !482, line: 1376, type: !172, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!558 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !559, line: 456)
!559 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !482, file: !482, line: 1317, type: !180, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!560 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !561, line: 457)
!561 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !482, file: !482, line: 938, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!562 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !563, line: 458)
!563 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !482, file: !482, line: 1002, type: !65, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!564 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !565, line: 459)
!565 = !DISubprogram(name: "nexttowardf", scope: !236, file: !236, line: 284, type: !566, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!566 = !DISubroutineType(types: !567)
!567 = !{!29, !29, !467}
!568 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !565, line: 460)
!569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !570, line: 461)
!570 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !482, file: !482, line: 1352, type: !65, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !572, line: 462)
!572 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !482, file: !482, line: 1327, type: !65, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!573 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !574, line: 463)
!574 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !482, file: !482, line: 1332, type: !206, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!575 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !576, line: 464)
!576 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !482, file: !482, line: 919, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!577 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !578, line: 465)
!578 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !482, file: !482, line: 1366, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!579 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !580, line: 466)
!580 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !482, file: !482, line: 1299, type: !214, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!581 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !582, line: 467)
!582 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !482, file: !482, line: 1294, type: !150, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!583 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !584, line: 468)
!584 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !482, file: !482, line: 1018, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!585 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !586, line: 469)
!586 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !482, file: !482, line: 1101, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!587 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !588, line: 470)
!588 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !499, file: !499, line: 887, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!589 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !590, line: 471)
!590 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !482, file: !482, line: 1060, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!591 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !592, line: 472)
!592 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !482, file: !482, line: 1106, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!593 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !594, line: 473)
!594 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !482, file: !482, line: 1361, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!595 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !45, entity: !596, line: 474)
!596 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !499, file: !499, line: 642, type: !53, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!597 = !{i32 2, !"Dwarf Version", i32 4}
!598 = !{i32 2, !"Debug Info Version", i32 3}
!599 = !{!"clang version 5.0.0 (trunk 294196)"}
!600 = distinct !DISubprogram(name: "get_time", linkageName: "_Z8get_timev", scope: !3, file: !3, line: 43, type: !601, isLocal: false, isDefinition: true, scopeLine: 43, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !603)
!601 = !DISubroutineType(types: !602)
!602 = !{!27}
!603 = !{!604}
!604 = !DILocalVariable(name: "time", scope: !600, file: !3, line: 44, type: !605)
!605 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timeval", file: !606, line: 30, size: 128, elements: !607, identifier: "_ZTS7timeval")
!606 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/time.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/hotspotllvm")
!607 = !{!608, !611}
!608 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !605, file: !606, line: 32, baseType: !609, size: 64)
!609 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !610, line: 139, baseType: !147)
!610 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/hotspotllvm")
!611 = !DIDerivedType(tag: DW_TAG_member, name: "tv_usec", scope: !605, file: !606, line: 33, baseType: !612, size: 64, offset: 64)
!612 = !DIDerivedType(tag: DW_TAG_typedef, name: "__suseconds_t", file: !610, line: 141, baseType: !147)
!613 = !DILocation(line: 44, column: 5, scope: !600)
!614 = !DIExpression(DW_OP_deref)
!615 = !DILocation(line: 44, column: 20, scope: !600)
!616 = !DILocation(line: 45, column: 9, scope: !617)
!617 = distinct !DILexicalBlock(scope: !600, file: !3, line: 45, column: 9)
!618 = !DILocation(line: 45, column: 9, scope: !600)
!619 = !DILocation(line: 49, column: 25, scope: !600)
!620 = !{!621, !622, i64 0}
!621 = !{!"_ZTS7timeval", !622, i64 0, !622, i64 8}
!622 = !{!"long", !623, i64 0}
!623 = !{!"omnipotent char", !624, i64 0}
!624 = !{!"Simple C++ TBAA"}
!625 = !DILocation(line: 49, column: 20, scope: !600)
!626 = !DILocation(line: 49, column: 47, scope: !600)
!627 = !{!621, !622, i64 8}
!628 = !DILocation(line: 49, column: 42, scope: !600)
!629 = !DILocation(line: 49, column: 55, scope: !600)
!630 = !DILocation(line: 49, column: 32, scope: !600)
!631 = !DILocation(line: 49, column: 5, scope: !600)
!632 = !DILocation(line: 50, column: 1, scope: !600)
!633 = distinct !DISubprogram(name: "fatal", linkageName: "_Z5fatalPc", scope: !3, file: !3, line: 53, type: !634, isLocal: false, isDefinition: true, scopeLine: 54, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !636)
!634 = !DISubroutineType(types: !635)
!635 = !{null, !34}
!636 = !{!637}
!637 = !DILocalVariable(name: "s", arg: 1, scope: !633, file: !3, line: 53, type: !34)
!638 = !DIExpression()
!639 = !DILocation(line: 53, column: 13, scope: !633)
!640 = !DILocation(line: 55, column: 10, scope: !633)
!641 = !{!642, !642, i64 0}
!642 = !{!"any pointer", !623, i64 0}
!643 = !DILocation(line: 55, column: 2, scope: !633)
!644 = !DILocation(line: 57, column: 1, scope: !633)
!645 = distinct !DISubprogram(name: "writeoutput", linkageName: "_Z11writeoutputPfiiPc", scope: !3, file: !3, line: 59, type: !646, isLocal: false, isDefinition: true, scopeLine: 59, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !648)
!646 = !DISubroutineType(types: !647)
!647 = !{null, !28, !32, !32, !34}
!648 = !{!649, !650, !651, !652, !653, !654, !655, !656, !707}
!649 = !DILocalVariable(name: "vect", arg: 1, scope: !645, file: !3, line: 59, type: !28)
!650 = !DILocalVariable(name: "grid_rows", arg: 2, scope: !645, file: !3, line: 59, type: !32)
!651 = !DILocalVariable(name: "grid_cols", arg: 3, scope: !645, file: !3, line: 59, type: !32)
!652 = !DILocalVariable(name: "file", arg: 4, scope: !645, file: !3, line: 59, type: !34)
!653 = !DILocalVariable(name: "i", scope: !645, file: !3, line: 61, type: !32)
!654 = !DILocalVariable(name: "j", scope: !645, file: !3, line: 61, type: !32)
!655 = !DILocalVariable(name: "index", scope: !645, file: !3, line: 61, type: !32)
!656 = !DILocalVariable(name: "fp", scope: !645, file: !3, line: 62, type: !657)
!657 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !658, size: 64)
!658 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !659, line: 48, baseType: !660)
!659 = !DIFile(filename: "/usr/include/stdio.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/hotspotllvm")
!660 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !661, line: 245, size: 1728, elements: !662, identifier: "_ZTS8_IO_FILE")
!661 = !DIFile(filename: "/usr/include/libio.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/hotspotllvm")
!662 = !{!663, !664, !665, !666, !667, !668, !669, !670, !671, !672, !673, !674, !675, !678, !680, !681, !682, !684, !686, !688, !692, !695, !697, !698, !699, !700, !701, !702, !703}
!663 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !660, file: !661, line: 246, baseType: !32, size: 32)
!664 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !660, file: !661, line: 251, baseType: !34, size: 64, offset: 64)
!665 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !660, file: !661, line: 252, baseType: !34, size: 64, offset: 128)
!666 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !660, file: !661, line: 253, baseType: !34, size: 64, offset: 192)
!667 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !660, file: !661, line: 254, baseType: !34, size: 64, offset: 256)
!668 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !660, file: !661, line: 255, baseType: !34, size: 64, offset: 320)
!669 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !660, file: !661, line: 256, baseType: !34, size: 64, offset: 384)
!670 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !660, file: !661, line: 257, baseType: !34, size: 64, offset: 448)
!671 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !660, file: !661, line: 258, baseType: !34, size: 64, offset: 512)
!672 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !660, file: !661, line: 260, baseType: !34, size: 64, offset: 576)
!673 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !660, file: !661, line: 261, baseType: !34, size: 64, offset: 640)
!674 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !660, file: !661, line: 262, baseType: !34, size: 64, offset: 704)
!675 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !660, file: !661, line: 264, baseType: !676, size: 64, offset: 768)
!676 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !677, size: 64)
!677 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !661, line: 160, flags: DIFlagFwdDecl, identifier: "_ZTS10_IO_marker")
!678 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !660, file: !661, line: 266, baseType: !679, size: 64, offset: 832)
!679 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !660, size: 64)
!680 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !660, file: !661, line: 268, baseType: !32, size: 32, offset: 896)
!681 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !660, file: !661, line: 272, baseType: !32, size: 32, offset: 928)
!682 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !660, file: !661, line: 274, baseType: !683, size: 64, offset: 960)
!683 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !610, line: 131, baseType: !147)
!684 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !660, file: !661, line: 278, baseType: !685, size: 16, offset: 1024)
!685 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!686 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !660, file: !661, line: 279, baseType: !687, size: 8, offset: 1040)
!687 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!688 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !660, file: !661, line: 280, baseType: !689, size: 8, offset: 1048)
!689 = !DICompositeType(tag: DW_TAG_array_type, baseType: !35, size: 8, elements: !690)
!690 = !{!691}
!691 = !DISubrange(count: 1)
!692 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !660, file: !661, line: 284, baseType: !693, size: 64, offset: 1088)
!693 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !694, size: 64)
!694 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !661, line: 154, baseType: null)
!695 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !660, file: !661, line: 293, baseType: !696, size: 64, offset: 1152)
!696 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !610, line: 132, baseType: !147)
!697 = !DIDerivedType(tag: DW_TAG_member, name: "__pad1", scope: !660, file: !661, line: 302, baseType: !31, size: 64, offset: 1216)
!698 = !DIDerivedType(tag: DW_TAG_member, name: "__pad2", scope: !660, file: !661, line: 303, baseType: !31, size: 64, offset: 1280)
!699 = !DIDerivedType(tag: DW_TAG_member, name: "__pad3", scope: !660, file: !661, line: 304, baseType: !31, size: 64, offset: 1344)
!700 = !DIDerivedType(tag: DW_TAG_member, name: "__pad4", scope: !660, file: !661, line: 305, baseType: !31, size: 64, offset: 1408)
!701 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !660, file: !661, line: 306, baseType: !333, size: 64, offset: 1472)
!702 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !660, file: !661, line: 308, baseType: !32, size: 32, offset: 1536)
!703 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !660, file: !661, line: 310, baseType: !704, size: 160, offset: 1568)
!704 = !DICompositeType(tag: DW_TAG_array_type, baseType: !35, size: 160, elements: !705)
!705 = !{!706}
!706 = !DISubrange(count: 20)
!707 = !DILocalVariable(name: "str", scope: !645, file: !3, line: 63, type: !708)
!708 = !DICompositeType(tag: DW_TAG_array_type, baseType: !35, size: 2048, elements: !709)
!709 = !{!710}
!710 = !DISubrange(count: 256)
!711 = !DILocation(line: 59, column: 25, scope: !645)
!712 = !DILocation(line: 59, column: 35, scope: !645)
!713 = !DILocation(line: 59, column: 50, scope: !645)
!714 = !DILocation(line: 59, column: 67, scope: !645)
!715 = !DILocation(line: 61, column: 11, scope: !645)
!716 = !DILocation(line: 63, column: 2, scope: !645)
!717 = !DILocation(line: 63, column: 7, scope: !645)
!718 = !DILocation(line: 65, column: 12, scope: !719)
!719 = distinct !DILexicalBlock(scope: !645, file: !3, line: 65, column: 6)
!720 = !DILocation(line: 62, column: 8, scope: !645)
!721 = !DILocation(line: 65, column: 31, scope: !719)
!722 = !DILocation(line: 65, column: 6, scope: !645)
!723 = !DILocation(line: 66, column: 11, scope: !719)
!724 = !DILocation(line: 61, column: 6, scope: !645)
!725 = !DILocation(line: 69, column: 14, scope: !726)
!726 = !DILexicalBlockFile(scope: !727, file: !3, discriminator: 1)
!727 = distinct !DILexicalBlock(scope: !728, file: !3, line: 69, column: 2)
!728 = distinct !DILexicalBlock(scope: !645, file: !3, line: 69, column: 2)
!729 = !DILocation(line: 69, column: 2, scope: !730)
!730 = !DILexicalBlockFile(scope: !728, file: !3, discriminator: 1)
!731 = !DILocation(line: 61, column: 8, scope: !645)
!732 = !DILocation(line: 70, column: 3, scope: !733)
!733 = !DILexicalBlockFile(scope: !734, file: !3, discriminator: 1)
!734 = distinct !DILexicalBlock(scope: !727, file: !3, line: 70, column: 3)
!735 = !DILocation(line: 73, column: 52, scope: !736)
!736 = distinct !DILexicalBlock(scope: !737, file: !3, line: 71, column: 3)
!737 = distinct !DILexicalBlock(scope: !734, file: !3, line: 70, column: 3)
!738 = !DILocation(line: 73, column: 36, scope: !736)
!739 = !{!740, !740, i64 0}
!740 = !{!"float", !623, i64 0}
!741 = !DILocation(line: 73, column: 4, scope: !736)
!742 = !DILocation(line: 74, column: 4, scope: !736)
!743 = !DILocation(line: 75, column: 9, scope: !736)
!744 = !DILocation(line: 70, column: 29, scope: !745)
!745 = !DILexicalBlockFile(scope: !737, file: !3, discriminator: 2)
!746 = !DILocation(line: 70, column: 15, scope: !747)
!747 = !DILexicalBlockFile(scope: !737, file: !3, discriminator: 1)
!748 = distinct !{!748, !749, !750}
!749 = !DILocation(line: 70, column: 3, scope: !734)
!750 = !DILocation(line: 76, column: 3, scope: !734)
!751 = !DILocation(line: 69, column: 28, scope: !752)
!752 = !DILexicalBlockFile(scope: !727, file: !3, discriminator: 2)
!753 = distinct !{!753, !754, !755}
!754 = !DILocation(line: 69, column: 2, scope: !728)
!755 = !DILocation(line: 76, column: 3, scope: !728)
!756 = !DILocation(line: 78, column: 7, scope: !645)
!757 = !DILocation(line: 79, column: 1, scope: !645)
!758 = distinct !DISubprogram(name: "readinput", linkageName: "_Z9readinputPfiiPc", scope: !3, file: !3, line: 82, type: !646, isLocal: false, isDefinition: true, scopeLine: 82, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !759)
!759 = !{!760, !761, !762, !763, !764, !765, !766, !767, !768}
!760 = !DILocalVariable(name: "vect", arg: 1, scope: !758, file: !3, line: 82, type: !28)
!761 = !DILocalVariable(name: "grid_rows", arg: 2, scope: !758, file: !3, line: 82, type: !32)
!762 = !DILocalVariable(name: "grid_cols", arg: 3, scope: !758, file: !3, line: 82, type: !32)
!763 = !DILocalVariable(name: "file", arg: 4, scope: !758, file: !3, line: 82, type: !34)
!764 = !DILocalVariable(name: "i", scope: !758, file: !3, line: 84, type: !32)
!765 = !DILocalVariable(name: "j", scope: !758, file: !3, line: 84, type: !32)
!766 = !DILocalVariable(name: "fp", scope: !758, file: !3, line: 85, type: !657)
!767 = !DILocalVariable(name: "str", scope: !758, file: !3, line: 86, type: !708)
!768 = !DILocalVariable(name: "val", scope: !758, file: !3, line: 87, type: !29)
!769 = !DILocation(line: 82, column: 23, scope: !758)
!770 = !DILocation(line: 82, column: 33, scope: !758)
!771 = !DILocation(line: 82, column: 48, scope: !758)
!772 = !DILocation(line: 82, column: 65, scope: !758)
!773 = !DILocation(line: 86, column: 2, scope: !758)
!774 = !DILocation(line: 86, column: 7, scope: !758)
!775 = !DILocation(line: 87, column: 2, scope: !758)
!776 = !DILocation(line: 89, column: 13, scope: !777)
!777 = distinct !DILexicalBlock(scope: !758, file: !3, line: 89, column: 6)
!778 = !DILocation(line: 85, column: 8, scope: !758)
!779 = !DILocation(line: 89, column: 32, scope: !777)
!780 = !DILocation(line: 89, column: 6, scope: !758)
!781 = !DILocation(line: 90, column: 13, scope: !777)
!782 = !DILocation(line: 84, column: 8, scope: !758)
!783 = !DILocation(line: 93, column: 14, scope: !784)
!784 = !DILexicalBlockFile(scope: !785, file: !3, discriminator: 1)
!785 = distinct !DILexicalBlock(scope: !786, file: !3, line: 93, column: 2)
!786 = distinct !DILexicalBlock(scope: !758, file: !3, line: 93, column: 2)
!787 = !DILocation(line: 93, column: 2, scope: !788)
!788 = !DILexicalBlockFile(scope: !786, file: !3, discriminator: 1)
!789 = !DILocation(line: 84, column: 10, scope: !758)
!790 = !DILocation(line: 94, column: 3, scope: !791)
!791 = !DILexicalBlockFile(scope: !792, file: !3, discriminator: 1)
!792 = distinct !DILexicalBlock(scope: !785, file: !3, line: 94, column: 3)
!793 = !DILocation(line: 96, column: 3, scope: !794)
!794 = distinct !DILexicalBlock(scope: !795, file: !3, line: 95, column: 3)
!795 = distinct !DILexicalBlock(scope: !792, file: !3, line: 94, column: 3)
!796 = !DILocation(line: 97, column: 7, scope: !797)
!797 = distinct !DILexicalBlock(scope: !794, file: !3, line: 97, column: 7)
!798 = !DILocation(line: 97, column: 7, scope: !794)
!799 = !DILocation(line: 53, column: 13, scope: !633, inlinedAt: !800)
!800 = distinct !DILocation(line: 98, column: 4, scope: !797)
!801 = !DILocation(line: 55, column: 10, scope: !633, inlinedAt: !800)
!802 = !DILocation(line: 55, column: 2, scope: !633, inlinedAt: !800)
!803 = !DILocation(line: 98, column: 4, scope: !797)
!804 = !DILocation(line: 87, column: 8, scope: !758)
!805 = !DILocation(line: 100, column: 8, scope: !806)
!806 = distinct !DILexicalBlock(scope: !794, file: !3, line: 100, column: 7)
!807 = !DILocation(line: 100, column: 32, scope: !806)
!808 = !DILocation(line: 100, column: 7, scope: !794)
!809 = !DILocation(line: 53, column: 13, scope: !633, inlinedAt: !810)
!810 = distinct !DILocation(line: 101, column: 4, scope: !806)
!811 = !DILocation(line: 55, column: 10, scope: !633, inlinedAt: !810)
!812 = !DILocation(line: 55, column: 2, scope: !633, inlinedAt: !810)
!813 = !DILocation(line: 101, column: 4, scope: !806)
!814 = !DILocation(line: 102, column: 25, scope: !794)
!815 = !DILocation(line: 102, column: 19, scope: !794)
!816 = !DILocation(line: 102, column: 3, scope: !794)
!817 = !DILocation(line: 102, column: 23, scope: !794)
!818 = !DILocation(line: 94, column: 32, scope: !819)
!819 = !DILexicalBlockFile(scope: !795, file: !3, discriminator: 2)
!820 = !DILocation(line: 94, column: 15, scope: !821)
!821 = !DILexicalBlockFile(scope: !795, file: !3, discriminator: 1)
!822 = distinct !{!822, !823, !824}
!823 = !DILocation(line: 94, column: 3, scope: !792)
!824 = !DILocation(line: 103, column: 2, scope: !792)
!825 = !DILocation(line: 93, column: 31, scope: !826)
!826 = !DILexicalBlockFile(scope: !785, file: !3, discriminator: 2)
!827 = distinct !{!827, !828, !829}
!828 = !DILocation(line: 93, column: 2, scope: !786)
!829 = !DILocation(line: 103, column: 2, scope: !786)
!830 = !DILocation(line: 105, column: 2, scope: !758)
!831 = !DILocation(line: 107, column: 1, scope: !758)
!832 = distinct !DISubprogram(name: "calculate_temp", linkageName: "_Z14calculate_tempiPfS_S_iiiiffffff", scope: !3, file: !3, line: 113, type: !833, isLocal: false, isDefinition: true, scopeLine: 126, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !835)
!833 = !DISubroutineType(types: !834)
!834 = !{null, !32, !28, !28, !28, !32, !32, !32, !32, !29, !29, !29, !29, !29, !29}
!835 = !{!836, !837, !838, !839, !840, !841, !842, !843, !844, !845, !846, !847, !848, !849}
!836 = !DILocalVariable(name: "iteration", arg: 1, scope: !832, file: !3, line: 113, type: !32)
!837 = !DILocalVariable(name: "power", arg: 2, scope: !832, file: !3, line: 114, type: !28)
!838 = !DILocalVariable(name: "temp_src", arg: 3, scope: !832, file: !3, line: 115, type: !28)
!839 = !DILocalVariable(name: "temp_dst", arg: 4, scope: !832, file: !3, line: 116, type: !28)
!840 = !DILocalVariable(name: "grid_cols", arg: 5, scope: !832, file: !3, line: 117, type: !32)
!841 = !DILocalVariable(name: "grid_rows", arg: 6, scope: !832, file: !3, line: 118, type: !32)
!842 = !DILocalVariable(name: "border_cols", arg: 7, scope: !832, file: !3, line: 119, type: !32)
!843 = !DILocalVariable(name: "border_rows", arg: 8, scope: !832, file: !3, line: 120, type: !32)
!844 = !DILocalVariable(name: "Cap", arg: 9, scope: !832, file: !3, line: 121, type: !29)
!845 = !DILocalVariable(name: "Rx", arg: 10, scope: !832, file: !3, line: 122, type: !29)
!846 = !DILocalVariable(name: "Ry", arg: 11, scope: !832, file: !3, line: 123, type: !29)
!847 = !DILocalVariable(name: "Rz", arg: 12, scope: !832, file: !3, line: 124, type: !29)
!848 = !DILocalVariable(name: "step", arg: 13, scope: !832, file: !3, line: 125, type: !29)
!849 = !DILocalVariable(name: "time_elapsed", arg: 14, scope: !832, file: !3, line: 126, type: !29)
!850 = !DILocation(line: 113, column: 36, scope: !832)
!851 = !{!852, !852, i64 0}
!852 = !{!"int", !623, i64 0}
!853 = !DILocation(line: 114, column: 39, scope: !832)
!854 = !DILocation(line: 115, column: 39, scope: !832)
!855 = !DILocation(line: 116, column: 39, scope: !832)
!856 = !DILocation(line: 117, column: 36, scope: !832)
!857 = !DILocation(line: 118, column: 36, scope: !832)
!858 = !DILocation(line: 119, column: 15, scope: !832)
!859 = !DILocation(line: 120, column: 15, scope: !832)
!860 = !DILocation(line: 121, column: 38, scope: !832)
!861 = !DILocation(line: 122, column: 38, scope: !832)
!862 = !DILocation(line: 123, column: 38, scope: !832)
!863 = !DILocation(line: 124, column: 38, scope: !832)
!864 = !DILocation(line: 125, column: 38, scope: !832)
!865 = !DILocation(line: 126, column: 38, scope: !832)
!866 = !DILocation(line: 126, column: 51, scope: !832)
!867 = !DILocation(line: 126, column: 51, scope: !868)
!868 = !DILexicalBlockFile(scope: !832, file: !3, discriminator: 1)
!869 = !DILocation(line: 126, column: 51, scope: !870)
!870 = !DILexicalBlockFile(scope: !832, file: !3, discriminator: 2)
!871 = !DILocation(line: 126, column: 51, scope: !872)
!872 = !DILexicalBlockFile(scope: !832, file: !3, discriminator: 3)
!873 = !DILocation(line: 126, column: 51, scope: !874)
!874 = !DILexicalBlockFile(scope: !832, file: !3, discriminator: 4)
!875 = !DILocation(line: 126, column: 51, scope: !876)
!876 = !DILexicalBlockFile(scope: !832, file: !3, discriminator: 5)
!877 = !DILocation(line: 126, column: 51, scope: !878)
!878 = !DILexicalBlockFile(scope: !832, file: !3, discriminator: 6)
!879 = !DILocation(line: 126, column: 51, scope: !880)
!880 = !DILexicalBlockFile(scope: !832, file: !3, discriminator: 7)
!881 = !DILocation(line: 126, column: 51, scope: !882)
!882 = !DILexicalBlockFile(scope: !832, file: !3, discriminator: 8)
!883 = !DILocation(line: 126, column: 51, scope: !884)
!884 = !DILexicalBlockFile(scope: !832, file: !3, discriminator: 9)
!885 = !DILocation(line: 126, column: 51, scope: !886)
!886 = !DILexicalBlockFile(scope: !832, file: !3, discriminator: 10)
!887 = !DILocation(line: 126, column: 51, scope: !888)
!888 = !DILexicalBlockFile(scope: !832, file: !3, discriminator: 11)
!889 = !DILocation(line: 126, column: 51, scope: !890)
!890 = !DILexicalBlockFile(scope: !832, file: !3, discriminator: 12)
!891 = !DILocation(line: 126, column: 51, scope: !892)
!892 = !DILexicalBlockFile(scope: !832, file: !3, discriminator: 13)
!893 = !DILocation(line: 126, column: 51, scope: !894)
!894 = !DILexicalBlockFile(scope: !832, file: !3, discriminator: 14)
!895 = !DILocation(line: 224, column: 1, scope: !832)
!896 = distinct !DISubprogram(name: "compute_tran_temp", linkageName: "_Z17compute_tran_tempPfPS_iiiiiiii", scope: !3, file: !3, line: 230, type: !897, isLocal: false, isDefinition: true, scopeLine: 232, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !900)
!897 = !DISubroutineType(types: !898)
!898 = !{!32, !28, !899, !32, !32, !32, !32, !32, !32, !32, !32}
!899 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!900 = !{!901, !902, !903, !904, !905, !906, !907, !908, !909, !910, !911, !935, !936, !937, !938, !939, !940, !941, !942, !943, !944, !945, !946, !947, !948, !949, !953}
!901 = !DILocalVariable(name: "MatrixPower", arg: 1, scope: !896, file: !3, line: 230, type: !28)
!902 = !DILocalVariable(name: "MatrixTemp", arg: 2, scope: !896, file: !3, line: 230, type: !899)
!903 = !DILocalVariable(name: "col", arg: 3, scope: !896, file: !3, line: 230, type: !32)
!904 = !DILocalVariable(name: "row", arg: 4, scope: !896, file: !3, line: 230, type: !32)
!905 = !DILocalVariable(name: "total_iterations", arg: 5, scope: !896, file: !3, line: 231, type: !32)
!906 = !DILocalVariable(name: "num_iterations", arg: 6, scope: !896, file: !3, line: 231, type: !32)
!907 = !DILocalVariable(name: "blockCols", arg: 7, scope: !896, file: !3, line: 231, type: !32)
!908 = !DILocalVariable(name: "blockRows", arg: 8, scope: !896, file: !3, line: 231, type: !32)
!909 = !DILocalVariable(name: "borderCols", arg: 9, scope: !896, file: !3, line: 231, type: !32)
!910 = !DILocalVariable(name: "borderRows", arg: 10, scope: !896, file: !3, line: 231, type: !32)
!911 = !DILocalVariable(name: "dimBlock", scope: !896, file: !3, line: 233, type: !912)
!912 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !913, line: 427, baseType: !914)
!913 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/hotspotllvm")
!914 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !913, line: 417, size: 96, elements: !915, identifier: "_ZTS4dim3")
!915 = !{!916, !917, !918, !919, !923, !932}
!916 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !914, file: !913, line: 419, baseType: !402, size: 32)
!917 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !914, file: !913, line: 419, baseType: !402, size: 32, offset: 32)
!918 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !914, file: !913, line: 419, baseType: !402, size: 32, offset: 64)
!919 = !DISubprogram(name: "dim3", scope: !914, file: !913, line: 421, type: !920, isLocal: false, isDefinition: false, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: true)
!920 = !DISubroutineType(types: !921)
!921 = !{null, !922, !402, !402, !402}
!922 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !914, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!923 = !DISubprogram(name: "dim3", scope: !914, file: !913, line: 422, type: !924, isLocal: false, isDefinition: false, scopeLine: 422, flags: DIFlagPrototyped, isOptimized: true)
!924 = !DISubroutineType(types: !925)
!925 = !{null, !922, !926}
!926 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !913, line: 383, baseType: !927)
!927 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !913, line: 190, size: 96, elements: !928, identifier: "_ZTS5uint3")
!928 = !{!929, !930, !931}
!929 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !927, file: !913, line: 192, baseType: !402, size: 32)
!930 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !927, file: !913, line: 192, baseType: !402, size: 32, offset: 32)
!931 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !927, file: !913, line: 192, baseType: !402, size: 32, offset: 64)
!932 = !DISubprogram(name: "operator uint3", linkageName: "_ZN4dim3cv5uint3Ev", scope: !914, file: !913, line: 423, type: !933, isLocal: false, isDefinition: false, scopeLine: 423, flags: DIFlagPrototyped, isOptimized: true)
!933 = !DISubroutineType(types: !934)
!934 = !{!926, !922}
!935 = !DILocalVariable(name: "dimGrid", scope: !896, file: !3, line: 234, type: !912)
!936 = !DILocalVariable(name: "grid_height", scope: !896, file: !3, line: 236, type: !29)
!937 = !DILocalVariable(name: "grid_width", scope: !896, file: !3, line: 237, type: !29)
!938 = !DILocalVariable(name: "Cap", scope: !896, file: !3, line: 239, type: !29)
!939 = !DILocalVariable(name: "Rx", scope: !896, file: !3, line: 240, type: !29)
!940 = !DILocalVariable(name: "Ry", scope: !896, file: !3, line: 241, type: !29)
!941 = !DILocalVariable(name: "Rz", scope: !896, file: !3, line: 242, type: !29)
!942 = !DILocalVariable(name: "max_slope", scope: !896, file: !3, line: 244, type: !29)
!943 = !DILocalVariable(name: "step", scope: !896, file: !3, line: 245, type: !29)
!944 = !DILocalVariable(name: "t", scope: !896, file: !3, line: 246, type: !29)
!945 = !DILocalVariable(name: "time_elapsed", scope: !896, file: !3, line: 247, type: !29)
!946 = !DILocalVariable(name: "src", scope: !896, file: !3, line: 250, type: !32)
!947 = !DILocalVariable(name: "dst", scope: !896, file: !3, line: 250, type: !32)
!948 = !DILocalVariable(name: "time0", scope: !896, file: !3, line: 257, type: !27)
!949 = !DILocalVariable(name: "temp", scope: !950, file: !3, line: 259, type: !32)
!950 = distinct !DILexicalBlock(scope: !951, file: !3, line: 258, column: 55)
!951 = distinct !DILexicalBlock(scope: !952, file: !3, line: 258, column: 2)
!952 = distinct !DILexicalBlock(scope: !896, file: !3, line: 258, column: 2)
!953 = !DILocalVariable(name: "time1", scope: !896, file: !3, line: 267, type: !27)
!954 = !DILocation(line: 230, column: 30, scope: !896)
!955 = !DILocation(line: 230, column: 49, scope: !896)
!956 = !DILocation(line: 230, column: 68, scope: !896)
!957 = !DILocation(line: 230, column: 77, scope: !896)
!958 = !DILocation(line: 231, column: 7, scope: !896)
!959 = !DILocation(line: 231, column: 29, scope: !896)
!960 = !DILocation(line: 231, column: 49, scope: !896)
!961 = !DILocation(line: 231, column: 64, scope: !896)
!962 = !DILocation(line: 231, column: 79, scope: !896)
!963 = !DILocation(line: 231, column: 95, scope: !896)
!964 = !DILocation(line: 233, column: 14, scope: !896)
!965 = !DILocation(line: 234, column: 14, scope: !896)
!966 = !DILocation(line: 236, column: 22, scope: !896)
!967 = !DILocation(line: 236, column: 36, scope: !896)
!968 = !DILocation(line: 236, column: 34, scope: !896)
!969 = !DILocation(line: 236, column: 8, scope: !896)
!970 = !DILocation(line: 237, column: 21, scope: !896)
!971 = !DILocation(line: 237, column: 34, scope: !896)
!972 = !DILocation(line: 237, column: 32, scope: !896)
!973 = !DILocation(line: 237, column: 8, scope: !896)
!974 = !DILocation(line: 239, column: 43, scope: !896)
!975 = !DILocation(line: 239, column: 41, scope: !896)
!976 = !DILocation(line: 239, column: 52, scope: !896)
!977 = !DILocation(line: 239, column: 50, scope: !896)
!978 = !DILocation(line: 239, column: 65, scope: !896)
!979 = !DILocation(line: 239, column: 63, scope: !896)
!980 = !DILocation(line: 239, column: 14, scope: !896)
!981 = !DILocation(line: 239, column: 8, scope: !896)
!982 = !DILocation(line: 240, column: 38, scope: !896)
!983 = !DILocation(line: 240, column: 47, scope: !896)
!984 = !DILocation(line: 240, column: 24, scope: !896)
!985 = !DILocation(line: 240, column: 13, scope: !896)
!986 = !DILocation(line: 240, column: 8, scope: !896)
!987 = !DILocation(line: 241, column: 48, scope: !896)
!988 = !DILocation(line: 241, column: 25, scope: !896)
!989 = !DILocation(line: 241, column: 13, scope: !896)
!990 = !DILocation(line: 241, column: 8, scope: !896)
!991 = !DILocation(line: 242, column: 28, scope: !896)
!992 = !DILocation(line: 242, column: 42, scope: !896)
!993 = !DILocation(line: 242, column: 20, scope: !896)
!994 = !DILocation(line: 242, column: 8, scope: !896)
!995 = !DILocation(line: 244, column: 42, scope: !896)
!996 = !DILocation(line: 244, column: 51, scope: !896)
!997 = !DILocation(line: 244, column: 27, scope: !896)
!998 = !DILocation(line: 244, column: 20, scope: !896)
!999 = !DILocation(line: 244, column: 8, scope: !896)
!1000 = !DILocation(line: 245, column: 27, scope: !896)
!1001 = !DILocation(line: 245, column: 25, scope: !896)
!1002 = !DILocation(line: 245, column: 15, scope: !896)
!1003 = !DILocation(line: 245, column: 8, scope: !896)
!1004 = !DILocation(line: 247, column: 15, scope: !896)
!1005 = !DILocation(line: 250, column: 13, scope: !896)
!1006 = !DILocation(line: 250, column: 22, scope: !896)
!1007 = !DILocation(line: 252, column: 2, scope: !896)
!1008 = !DILocation(line: 255, column: 2, scope: !896)
!1009 = !DILocation(line: 44, column: 5, scope: !600, inlinedAt: !1010)
!1010 = distinct !DILocation(line: 257, column: 17, scope: !896)
!1011 = !DILocation(line: 44, column: 20, scope: !600, inlinedAt: !1010)
!1012 = !DILocation(line: 45, column: 9, scope: !617, inlinedAt: !1010)
!1013 = !DILocation(line: 45, column: 9, scope: !600, inlinedAt: !1010)
!1014 = !DILocation(line: 49, column: 25, scope: !600, inlinedAt: !1010)
!1015 = !DILocation(line: 49, column: 20, scope: !600, inlinedAt: !1010)
!1016 = !DILocation(line: 49, column: 47, scope: !600, inlinedAt: !1010)
!1017 = !DILocation(line: 49, column: 42, scope: !600, inlinedAt: !1010)
!1018 = !DILocation(line: 49, column: 55, scope: !600, inlinedAt: !1010)
!1019 = !DILocation(line: 49, column: 32, scope: !600, inlinedAt: !1010)
!1020 = !DILocation(line: 49, column: 5, scope: !600, inlinedAt: !1010)
!1021 = !DILocation(line: 50, column: 1, scope: !600, inlinedAt: !1010)
!1022 = !DILocation(line: 257, column: 9, scope: !896)
!1023 = !DILocation(line: 246, column: 8, scope: !896)
!1024 = !DILocation(line: 258, column: 18, scope: !1025)
!1025 = !DILexicalBlockFile(scope: !951, file: !3, discriminator: 1)
!1026 = !DILocation(line: 258, column: 16, scope: !1025)
!1027 = !DILocation(line: 258, column: 2, scope: !1028)
!1028 = !DILexicalBlockFile(scope: !952, file: !3, discriminator: 1)
!1029 = !DILocation(line: 259, column: 17, scope: !950)
!1030 = !DILocation(line: 262, column: 27, scope: !950)
!1031 = !DILocation(line: 262, column: 13, scope: !950)
!1032 = !DILocation(line: 262, column: 51, scope: !1033)
!1033 = !DILexicalBlockFile(scope: !950, file: !3, discriminator: 1)
!1034 = !DILocation(line: 262, column: 51, scope: !1035)
!1035 = !DILexicalBlockFile(scope: !950, file: !3, discriminator: 3)
!1036 = !DILocation(line: 262, column: 51, scope: !1037)
!1037 = !DILexicalBlockFile(scope: !950, file: !3, discriminator: 4)
!1038 = !DILocation(line: 262, column: 104, scope: !1037)
!1039 = !DILocation(line: 262, column: 120, scope: !1037)
!1040 = !DILocation(line: 262, column: 13, scope: !1037)
!1041 = !DILocation(line: 258, column: 37, scope: !1042)
!1042 = !DILexicalBlockFile(scope: !951, file: !3, discriminator: 2)
!1043 = distinct !{!1043, !1044, !1045}
!1044 = !DILocation(line: 258, column: 2, scope: !952)
!1045 = !DILocation(line: 264, column: 2, scope: !952)
!1046 = !DILocation(line: 266, column: 2, scope: !896)
!1047 = !DILocation(line: 44, column: 5, scope: !600, inlinedAt: !1048)
!1048 = distinct !DILocation(line: 267, column: 17, scope: !896)
!1049 = !DILocation(line: 44, column: 20, scope: !600, inlinedAt: !1048)
!1050 = !DILocation(line: 45, column: 9, scope: !617, inlinedAt: !1048)
!1051 = !DILocation(line: 45, column: 9, scope: !600, inlinedAt: !1048)
!1052 = !DILocation(line: 49, column: 25, scope: !600, inlinedAt: !1048)
!1053 = !DILocation(line: 49, column: 20, scope: !600, inlinedAt: !1048)
!1054 = !DILocation(line: 49, column: 47, scope: !600, inlinedAt: !1048)
!1055 = !DILocation(line: 49, column: 42, scope: !600, inlinedAt: !1048)
!1056 = !DILocation(line: 49, column: 55, scope: !600, inlinedAt: !1048)
!1057 = !DILocation(line: 49, column: 32, scope: !600, inlinedAt: !1048)
!1058 = !DILocation(line: 49, column: 5, scope: !600, inlinedAt: !1048)
!1059 = !DILocation(line: 50, column: 1, scope: !600, inlinedAt: !1048)
!1060 = !DILocation(line: 267, column: 9, scope: !896)
!1061 = !DILocation(line: 268, column: 10, scope: !896)
!1062 = !DILocation(line: 268, column: 30, scope: !896)
!1063 = !DILocation(line: 268, column: 2, scope: !896)
!1064 = !DILocation(line: 269, column: 9, scope: !896)
!1065 = distinct !DISubprogram(name: "usage", linkageName: "_Z5usageiPPc", scope: !3, file: !3, line: 272, type: !1066, isLocal: false, isDefinition: true, scopeLine: 273, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !1068)
!1066 = !DISubroutineType(types: !1067)
!1067 = !{null, !32, !33}
!1068 = !{!1069, !1070}
!1069 = !DILocalVariable(name: "argc", arg: 1, scope: !1065, file: !3, line: 272, type: !32)
!1070 = !DILocalVariable(name: "argv", arg: 2, scope: !1065, file: !3, line: 272, type: !33)
!1071 = !DILocation(line: 272, column: 16, scope: !1065)
!1072 = !DILocation(line: 272, column: 29, scope: !1065)
!1073 = !DILocation(line: 274, column: 10, scope: !1065)
!1074 = !DILocation(line: 274, column: 122, scope: !1065)
!1075 = !DILocation(line: 274, column: 2, scope: !1065)
!1076 = !DILocation(line: 275, column: 10, scope: !1065)
!1077 = !DILocation(line: 275, column: 2, scope: !1065)
!1078 = !DILocation(line: 276, column: 10, scope: !1065)
!1079 = !DILocation(line: 276, column: 2, scope: !1065)
!1080 = !DILocation(line: 277, column: 10, scope: !1065)
!1081 = !DILocation(line: 277, column: 2, scope: !1065)
!1082 = !DILocation(line: 278, column: 10, scope: !1065)
!1083 = !DILocation(line: 278, column: 2, scope: !1065)
!1084 = !DILocation(line: 279, column: 10, scope: !1065)
!1085 = !DILocation(line: 279, column: 2, scope: !1065)
!1086 = !DILocation(line: 280, column: 10, scope: !1065)
!1087 = !DILocation(line: 280, column: 2, scope: !1065)
!1088 = !DILocation(line: 281, column: 2, scope: !1065)
!1089 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 284, type: !1090, isLocal: false, isDefinition: true, scopeLine: 285, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !1092)
!1090 = !DISubroutineType(types: !1091)
!1091 = !{!32, !32, !33}
!1092 = !{!1093, !1094}
!1093 = !DILocalVariable(name: "argc", arg: 1, scope: !1089, file: !3, line: 284, type: !32)
!1094 = !DILocalVariable(name: "argv", arg: 2, scope: !1089, file: !3, line: 284, type: !33)
!1095 = !DILocation(line: 284, column: 14, scope: !1089)
!1096 = !DILocation(line: 284, column: 27, scope: !1089)
!1097 = !DILocation(line: 286, column: 3, scope: !1089)
!1098 = !DILocation(line: 288, column: 5, scope: !1089)
!1099 = !DILocation(line: 290, column: 5, scope: !1089)
!1100 = distinct !DISubprogram(name: "run", linkageName: "_Z3runiPPc", scope: !3, file: !3, line: 293, type: !1066, isLocal: false, isDefinition: true, scopeLine: 294, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !1101)
!1101 = !{!1102, !1103, !1104, !1105, !1106, !1107, !1108, !1109, !1110, !1111, !1112, !1113, !1114, !1115, !1116, !1117, !1118, !1119, !1120, !1121, !1125, !1126}
!1102 = !DILocalVariable(name: "argc", arg: 1, scope: !1100, file: !3, line: 293, type: !32)
!1103 = !DILocalVariable(name: "argv", arg: 2, scope: !1100, file: !3, line: 293, type: !33)
!1104 = !DILocalVariable(name: "size", scope: !1100, file: !3, line: 295, type: !32)
!1105 = !DILocalVariable(name: "grid_rows", scope: !1100, file: !3, line: 296, type: !32)
!1106 = !DILocalVariable(name: "grid_cols", scope: !1100, file: !3, line: 296, type: !32)
!1107 = !DILocalVariable(name: "FilesavingTemp", scope: !1100, file: !3, line: 297, type: !28)
!1108 = !DILocalVariable(name: "FilesavingPower", scope: !1100, file: !3, line: 297, type: !28)
!1109 = !DILocalVariable(name: "MatrixOut", scope: !1100, file: !3, line: 297, type: !28)
!1110 = !DILocalVariable(name: "tfile", scope: !1100, file: !3, line: 298, type: !34)
!1111 = !DILocalVariable(name: "pfile", scope: !1100, file: !3, line: 298, type: !34)
!1112 = !DILocalVariable(name: "ofile", scope: !1100, file: !3, line: 298, type: !34)
!1113 = !DILocalVariable(name: "total_iterations", scope: !1100, file: !3, line: 303, type: !32)
!1114 = !DILocalVariable(name: "pyramid_height", scope: !1100, file: !3, line: 304, type: !32)
!1115 = !DILocalVariable(name: "borderCols", scope: !1100, file: !3, line: 322, type: !32)
!1116 = !DILocalVariable(name: "borderRows", scope: !1100, file: !3, line: 323, type: !32)
!1117 = !DILocalVariable(name: "smallBlockCol", scope: !1100, file: !3, line: 324, type: !32)
!1118 = !DILocalVariable(name: "smallBlockRow", scope: !1100, file: !3, line: 325, type: !32)
!1119 = !DILocalVariable(name: "blockCols", scope: !1100, file: !3, line: 326, type: !32)
!1120 = !DILocalVariable(name: "blockRows", scope: !1100, file: !3, line: 327, type: !32)
!1121 = !DILocalVariable(name: "MatrixTemp", scope: !1100, file: !3, line: 342, type: !1122)
!1122 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 128, elements: !1123)
!1123 = !{!1124}
!1124 = !DISubrange(count: 2)
!1125 = !DILocalVariable(name: "MatrixPower", scope: !1100, file: !3, line: 342, type: !28)
!1126 = !DILocalVariable(name: "ret", scope: !1100, file: !3, line: 350, type: !32)
!1127 = !DILocation(line: 293, column: 14, scope: !1100)
!1128 = !DILocation(line: 293, column: 27, scope: !1100)
!1129 = !DILocation(line: 300, column: 2, scope: !1100)
!1130 = !DILocation(line: 303, column: 9, scope: !1100)
!1131 = !DILocation(line: 304, column: 9, scope: !1100)
!1132 = !DILocation(line: 306, column: 11, scope: !1133)
!1133 = distinct !DILexicalBlock(scope: !1100, file: !3, line: 306, column: 6)
!1134 = !DILocation(line: 306, column: 6, scope: !1100)
!1135 = !DILocation(line: 307, column: 3, scope: !1133)
!1136 = !DILocation(line: 308, column: 23, scope: !1137)
!1137 = distinct !DILexicalBlock(scope: !1100, file: !3, line: 308, column: 5)
!1138 = !DILocation(line: 278, column: 1, scope: !317, inlinedAt: !1139)
!1139 = distinct !DILocation(line: 308, column: 18, scope: !1137)
!1140 = !DILocation(line: 280, column: 16, scope: !317, inlinedAt: !1139)
!1141 = !DILocation(line: 296, column: 9, scope: !1100)
!1142 = !DILocation(line: 308, column: 32, scope: !1137)
!1143 = !DILocation(line: 308, column: 35, scope: !1137)
!1144 = !DILocation(line: 296, column: 19, scope: !1100)
!1145 = !DILocation(line: 310, column: 31, scope: !1137)
!1146 = !DILocation(line: 278, column: 1, scope: !317, inlinedAt: !1147)
!1147 = distinct !DILocation(line: 310, column: 26, scope: !1137)
!1148 = !DILocation(line: 280, column: 16, scope: !317, inlinedAt: !1147)
!1149 = !DILocation(line: 310, column: 40, scope: !1137)
!1150 = !DILocation(line: 310, column: 43, scope: !1137)
!1151 = !DILocation(line: 311, column: 33, scope: !1137)
!1152 = !DILocation(line: 278, column: 1, scope: !317, inlinedAt: !1153)
!1153 = distinct !DILocation(line: 311, column: 28, scope: !1137)
!1154 = !DILocation(line: 280, column: 16, scope: !317, inlinedAt: !1153)
!1155 = !DILocation(line: 311, column: 42, scope: !1137)
!1156 = !DILocation(line: 308, column: 5, scope: !1157)
!1157 = !DILexicalBlockFile(scope: !1100, file: !3, discriminator: 1)
!1158 = !DILocation(line: 312, column: 3, scope: !1137)
!1159 = !DILocation(line: 314, column: 8, scope: !1100)
!1160 = !DILocation(line: 298, column: 11, scope: !1100)
!1161 = !DILocation(line: 315, column: 11, scope: !1100)
!1162 = !DILocation(line: 298, column: 19, scope: !1100)
!1163 = !DILocation(line: 316, column: 11, scope: !1100)
!1164 = !DILocation(line: 298, column: 27, scope: !1100)
!1165 = !DILocation(line: 318, column: 19, scope: !1100)
!1166 = !DILocation(line: 322, column: 38, scope: !1100)
!1167 = !DILocation(line: 322, column: 9, scope: !1100)
!1168 = !DILocation(line: 323, column: 9, scope: !1100)
!1169 = !DILocation(line: 324, column: 35, scope: !1100)
!1170 = !DILocation(line: 324, column: 9, scope: !1100)
!1171 = !DILocation(line: 325, column: 9, scope: !1100)
!1172 = !DILocation(line: 326, column: 30, scope: !1100)
!1173 = !DILocation(line: 326, column: 56, scope: !1100)
!1174 = !DILocation(line: 326, column: 46, scope: !1100)
!1175 = !DILocation(line: 326, column: 44, scope: !1100)
!1176 = !DILocation(line: 326, column: 9, scope: !1100)
!1177 = !DILocation(line: 327, column: 9, scope: !1100)
!1178 = !DILocation(line: 329, column: 39, scope: !1100)
!1179 = !DILocation(line: 329, column: 43, scope: !1100)
!1180 = !DILocation(line: 329, column: 32, scope: !1100)
!1181 = !DILocation(line: 329, column: 22, scope: !1100)
!1182 = !DILocation(line: 297, column: 12, scope: !1100)
!1183 = !DILocation(line: 330, column: 33, scope: !1100)
!1184 = !DILocation(line: 330, column: 23, scope: !1100)
!1185 = !DILocation(line: 297, column: 28, scope: !1100)
!1186 = !DILocation(line: 331, column: 27, scope: !1100)
!1187 = !DILocation(line: 331, column: 17, scope: !1100)
!1188 = !DILocation(line: 297, column: 45, scope: !1100)
!1189 = !DILocation(line: 333, column: 10, scope: !1190)
!1190 = distinct !DILexicalBlock(scope: !1100, file: !3, line: 333, column: 9)
!1191 = !DILocation(line: 333, column: 30, scope: !1192)
!1192 = !DILexicalBlockFile(scope: !1190, file: !3, discriminator: 1)
!1193 = !DILocation(line: 333, column: 26, scope: !1190)
!1194 = !DILocation(line: 333, column: 49, scope: !1195)
!1195 = !DILexicalBlockFile(scope: !1190, file: !3, discriminator: 2)
!1196 = !DILocation(line: 53, column: 13, scope: !633, inlinedAt: !1197)
!1197 = distinct !DILocation(line: 334, column: 9, scope: !1190)
!1198 = !DILocation(line: 55, column: 10, scope: !633, inlinedAt: !1197)
!1199 = !DILocation(line: 55, column: 2, scope: !633, inlinedAt: !1197)
!1200 = !DILocation(line: 334, column: 9, scope: !1190)
!1201 = !DILocation(line: 336, column: 5, scope: !1100)
!1202 = !DILocation(line: 339, column: 5, scope: !1100)
!1203 = !DILocation(line: 340, column: 5, scope: !1100)
!1204 = !DILocation(line: 342, column: 5, scope: !1100)
!1205 = !DILocation(line: 342, column: 12, scope: !1100)
!1206 = !DILocation(line: 343, column: 16, scope: !1100)
!1207 = !DILocation(line: 343, column: 5, scope: !1100)
!1208 = !DILocation(line: 344, column: 25, scope: !1100)
!1209 = !DILocation(line: 344, column: 16, scope: !1100)
!1210 = !DILocation(line: 344, column: 5, scope: !1100)
!1211 = !DILocation(line: 345, column: 16, scope: !1100)
!1212 = !DILocation(line: 345, column: 5, scope: !1100)
!1213 = !DILocation(line: 347, column: 16, scope: !1100)
!1214 = !DILocation(line: 347, column: 5, scope: !1100)
!1215 = !DILocation(line: 348, column: 16, scope: !1100)
!1216 = !DILocation(line: 348, column: 5, scope: !1100)
!1217 = !DILocation(line: 349, column: 5, scope: !1100)
!1218 = !DILocation(line: 350, column: 33, scope: !1100)
!1219 = !DILocation(line: 342, column: 28, scope: !1100)
!1220 = !DILocation(line: 350, column: 45, scope: !1100)
!1221 = !DILocation(line: 350, column: 15, scope: !1100)
!1222 = !DILocation(line: 350, column: 9, scope: !1100)
!1223 = !DILocation(line: 352, column: 2, scope: !1100)
!1224 = !DILocation(line: 353, column: 27, scope: !1100)
!1225 = !DILocation(line: 353, column: 5, scope: !1100)
!1226 = !DILocation(line: 355, column: 5, scope: !1100)
!1227 = !DILocation(line: 357, column: 14, scope: !1100)
!1228 = !DILocation(line: 357, column: 5, scope: !1100)
!1229 = !DILocation(line: 358, column: 14, scope: !1100)
!1230 = !DILocation(line: 358, column: 5, scope: !1100)
!1231 = !DILocation(line: 359, column: 14, scope: !1100)
!1232 = !DILocation(line: 359, column: 5, scope: !1100)
!1233 = !DILocation(line: 360, column: 5, scope: !1100)
!1234 = !DILocation(line: 361, column: 1, scope: !1100)
