; ModuleID = '<stdin>'
source_filename = "main.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.dim_str = type { i32, i32, i32, i32, i64, i64, i64, i64, i64 }
%struct.par_str = type { double }
%struct.box_str = type { i32, i32, i32, i32, i64, i32, [26 x %struct.nei_str] }
%struct.nei_str = type { i32, i32, i32, i32, i64 }
%struct.FOUR_VECTOR = type { double, double, double, double }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [35 x i8] c"thread block size of kernel = %d \0A\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"-boxes1d\00", align 1
@.str.6 = private unnamed_addr constant [34 x i8] c"Configuration used: boxes1d = %d\0A\00", align 1
@.str.7 = private unnamed_addr constant [11 x i8] c"result.txt\00", align 1
@.str.8 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.9 = private unnamed_addr constant [16 x i8] c"%f, %f, %f, %f\0A\00", align 1
@str = private unnamed_addr constant [25 x i8] c"ERROR: Unknown parameter\00"
@str.11 = private unnamed_addr constant [51 x i8] c"ERROR: Value to -boxes1d parameter in not a number\00"
@str.12 = private unnamed_addr constant [56 x i8] c"ERROR: Wrong value to -boxes1d parameter, cannot be <=0\00"
@0 = private unnamed_addr constant [7 x i8] c"strcmp\00"
@1 = private unnamed_addr constant [10 x i8] c"isInteger\00"
@2 = private unnamed_addr constant [7 x i8] c"strtol\00"
@3 = private unnamed_addr constant [5 x i8] c"puts\00"
@4 = private unnamed_addr constant [7 x i8] c"printf\00"
@5 = private unnamed_addr constant [6 x i8] c"srand\00"
@6 = private unnamed_addr constant [5 x i8] c"rand\00"
@7 = private unnamed_addr constant [7 x i8] c"malloc\00"
@8 = private unnamed_addr constant [21 x i8] c"llvm.memset.p0i8.i64\00"
@9 = private unnamed_addr constant [24 x i8] c"kernel_gpu_cuda_wrapper\00"
@10 = private unnamed_addr constant [6 x i8] c"fopen\00"
@11 = private unnamed_addr constant [8 x i8] c"fprintf\00"
@12 = private unnamed_addr constant [7 x i8] c"fclose\00"
@13 = private unnamed_addr constant [5 x i8] c"free\00"
@14 = private unnamed_addr constant [5 x i8] c"main\00"
@15 = private unnamed_addr constant [9 x i8] c"get_time\00"

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 !dbg !56 {
entry:
  %dim_cpu = alloca %struct.dim_str, align 8
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !60, metadata !166), !dbg !167
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !61, metadata !166), !dbg !168
  call void @callFunc(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @14, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @4, i32 0, i32 0), i32 53, i32 2), !dbg !169
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str, i64 0, i64 0), i32 128), !dbg !169
  call void @callFunc(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @14, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @15, i32 0, i32 0), i32 61, i32 10), !dbg !170
  %call1 = tail call i64 (...) @get_time() #6, !dbg !170
  tail call void @llvm.dbg.value(metadata i64 %call1, i64 0, metadata !62, metadata !166), !dbg !171
  tail call void @llvm.dbg.declare(metadata %struct.par_str* undef, metadata !77, metadata !166), !dbg !172
  %0 = bitcast %struct.dim_str* %dim_cpu to i8*, !dbg !173
  call void @llvm.lifetime.start(i64 56, i8* nonnull %0) #6, !dbg !173
  call void @callFunc(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @14, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @15, i32 0, i32 0), i32 84, i32 10), !dbg !174
  %call2 = tail call i64 (...) @get_time() #6, !dbg !174
  tail call void @llvm.dbg.value(metadata i64 %call2, i64 0, metadata !64, metadata !166), !dbg !175
  %boxes1d_arg = getelementptr inbounds %struct.dim_str, %struct.dim_str* %dim_cpu, i64 0, i32 3, !dbg !176
  store i32 1, i32* %boxes1d_arg, align 4, !dbg !177, !tbaa !178
  %cur_arg = getelementptr inbounds %struct.dim_str, %struct.dim_str* %dim_cpu, i64 0, i32 0, !dbg !184
  store i32 1, i32* %cur_arg, align 8, !dbg !185, !tbaa !187
  %cmp640 = icmp sgt i32 %argc, 1, !dbg !188
  br i1 %cmp640, label %cond.end.preheader, label %for.end, !dbg !190

cond.end.preheader:                               ; preds = %entry
  br label %cond.end, !dbg !192

for.cond:                                         ; preds = %if.then61
  store i32 %inc, i32* %cur_arg, align 8, !dbg !185, !tbaa !187
  %cmp = icmp slt i32 %inc, %argc, !dbg !188
  br i1 %cmp, label %cond.end, label %for.end.loopexit, !dbg !190, !llvm.loop !193

cond.end:                                         ; preds = %cond.end.preheader, %for.cond
  %1 = phi i32 [ %inc, %for.cond ], [ 1, %cond.end.preheader ]
  tail call void @llvm.dbg.value(metadata i64 8, i64 0, metadata !106, metadata !166), !dbg !192
  %idxprom44 = sext i32 %1 to i64, !dbg !196
  %arrayidx45 = getelementptr inbounds i8*, i8** %argv, i64 %idxprom44, !dbg !196
  %2 = load i8*, i8** %arrayidx45, align 8, !dbg !196, !tbaa !198
  call void @callFunc(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @14, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @0, i32 0, i32 0), i32 96, i32 6), !dbg !196
  %call46 = tail call i32 @strcmp(i8* %2, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0)) #6, !dbg !196
  %cmp47 = icmp eq i32 %call46, 0, !dbg !200
  br i1 %cmp47, label %if.then53, label %if.else82, !dbg !202

if.then53:                                        ; preds = %cond.end
  %add = add nsw i32 %1, 1, !dbg !204
  %idxprom56 = sext i32 %add to i64, !dbg !207
  %arrayidx57 = getelementptr inbounds i8*, i8** %argv, i64 %idxprom56, !dbg !207
  %3 = load i8*, i8** %arrayidx57, align 8, !dbg !207, !tbaa !198
  call void @callFunc(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @14, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8], [10 x i8]* @1, i32 0, i32 0), i32 100, i32 8), !dbg !210
  %call58 = tail call i32 @isInteger(i8* %3) #6, !dbg !210
  %cmp59 = icmp eq i32 %call58, 1, !dbg !211
  br i1 %cmp59, label %if.then61, label %if.else, !dbg !212

if.then61:                                        ; preds = %if.then53
  %4 = load i8*, i8** %arrayidx57, align 8, !dbg !213, !tbaa !198
  tail call void @llvm.dbg.value(metadata i8* %4, i64 0, metadata !215, metadata !166) #6, !dbg !221
  call void @callFunc(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @14, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @2, i32 0, i32 0), i32 280, i32 16), !dbg !223
  %call.i = tail call i64 @strtol(i8* nocapture nonnull %4, i8** null, i32 10) #6, !dbg !223
  %conv.i = trunc i64 %call.i to i32, !dbg !224
  store i32 %conv.i, i32* %boxes1d_arg, align 4, !dbg !225, !tbaa !178
  %cmp69 = icmp slt i32 %conv.i, 0, !dbg !226
  %inc = add nsw i32 %1, 2, !dbg !185
  br i1 %cmp69, label %if.then71, label %for.cond, !dbg !228

if.then71:                                        ; preds = %if.then61
  call void @callFunc(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @14, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @3, i32 0, i32 0), i32 103, i32 7), !dbg !229
  %puts607 = tail call i32 @puts(i8* getelementptr inbounds ([56 x i8], [56 x i8]* @str.12, i64 0, i64 0)), !dbg !229
  br label %cleanup, !dbg !231

if.else:                                          ; preds = %if.then53
  call void @callFunc(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @14, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @3, i32 0, i32 0), i32 110, i32 6), !dbg !232
  %puts606 = tail call i32 @puts(i8* getelementptr inbounds ([51 x i8], [51 x i8]* @str.11, i64 0, i64 0)), !dbg !232
  br label %cleanup, !dbg !234

if.else82:                                        ; preds = %cond.end
  call void @callFunc(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @14, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @3, i32 0, i32 0), i32 122, i32 4), !dbg !235
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @str, i64 0, i64 0)), !dbg !235
  br label %cleanup, !dbg !237

for.end.loopexit:                                 ; preds = %for.cond
  br label %for.end, !dbg !238

for.end:                                          ; preds = %for.end.loopexit, %entry
  %5 = phi i32 [ 1, %entry ], [ %conv.i, %for.end.loopexit ], !dbg !239
  call void @callFunc(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @14, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @4, i32 0, i32 0), i32 128, i32 2), !dbg !238
  %call87 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.6, i64 0, i64 0), i32 %5), !dbg !238
  call void @callFunc(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @14, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @15, i32 0, i32 0), i32 130, i32 10), !dbg !243
  %call88 = tail call i64 (...) @get_time() #6, !dbg !243
  tail call void @llvm.dbg.value(metadata i64 %call88, i64 0, metadata !65, metadata !166), !dbg !244
  tail call void @llvm.dbg.value(metadata double 5.000000e-01, i64 0, metadata !77, metadata !166), !dbg !172
  call void @callFunc(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @14, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @15, i32 0, i32 0), i32 138, i32 10), !dbg !245
  %call89 = tail call i64 (...) @get_time() #6, !dbg !245
  tail call void @llvm.dbg.value(metadata i64 %call89, i64 0, metadata !66, metadata !166), !dbg !246
  %mul = mul nsw i32 %5, %5, !dbg !247
  %mul93 = mul nsw i32 %mul, %5, !dbg !248
  %conv94 = sext i32 %mul93 to i64, !dbg !249
  %number_boxes = getelementptr inbounds %struct.dim_str, %struct.dim_str* %dim_cpu, i64 0, i32 4, !dbg !250
  store i64 %conv94, i64* %number_boxes, align 8, !dbg !251, !tbaa !252
  %mul96 = mul nsw i64 %conv94, 100, !dbg !253
  %space_elem = getelementptr inbounds %struct.dim_str, %struct.dim_str* %dim_cpu, i64 0, i32 6, !dbg !254
  store i64 %mul96, i64* %space_elem, align 8, !dbg !255, !tbaa !256
  %mul98 = mul nsw i64 %conv94, 3200, !dbg !257
  %space_mem = getelementptr inbounds %struct.dim_str, %struct.dim_str* %dim_cpu, i64 0, i32 7, !dbg !258
  store i64 %mul98, i64* %space_mem, align 8, !dbg !259, !tbaa !260
  %mul100 = mul nsw i64 %conv94, 800, !dbg !261
  %space_mem2 = getelementptr inbounds %struct.dim_str, %struct.dim_str* %dim_cpu, i64 0, i32 8, !dbg !262
  store i64 %mul100, i64* %space_mem2, align 8, !dbg !263, !tbaa !264
  %mul102 = mul nsw i64 %conv94, 656, !dbg !265
  %box_mem = getelementptr inbounds %struct.dim_str, %struct.dim_str* %dim_cpu, i64 0, i32 5, !dbg !266
  store i64 %mul102, i64* %box_mem, align 8, !dbg !267, !tbaa !268
  call void @callFunc(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @14, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @15, i32 0, i32 0), i32 155, i32 10), !dbg !269
  %call103 = tail call i64 (...) @get_time() #6, !dbg !269
  tail call void @llvm.dbg.value(metadata i64 %call103, i64 0, metadata !67, metadata !166), !dbg !270
  call void @callFunc(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @14, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @7, i32 0, i32 0), i32 166, i32 22), !dbg !271
  %call105 = tail call noalias i8* @malloc(i64 %mul102) #6, !dbg !271
  %6 = bitcast i8* %call105 to %struct.box_str*, !dbg !272
  tail call void @llvm.dbg.value(metadata %struct.box_str* %6, i64 0, metadata !95, metadata !166), !dbg !273
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !99, metadata !166), !dbg !274
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !71, metadata !166), !dbg !275
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !71, metadata !166), !dbg !275
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !99, metadata !166), !dbg !274
  %cmp108636 = icmp sgt i32 %5, 0, !dbg !276
  br i1 %cmp108636, label %for.cond116.preheader.preheader.preheader, label %for.end311, !dbg !277

for.cond116.preheader.preheader.preheader:        ; preds = %for.end
  br label %for.cond116.preheader.preheader, !dbg !279

for.cond116.preheader.preheader:                  ; preds = %for.cond116.preheader.preheader.preheader, %for.inc309
  %i.0638 = phi i32 [ %inc310, %for.inc309 ], [ 0, %for.cond116.preheader.preheader.preheader ]
  %nh.0637 = phi i32 [ %26, %for.inc309 ], [ 0, %for.cond116.preheader.preheader.preheader ]
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !72, metadata !166), !dbg !279
  tail call void @llvm.dbg.value(metadata i32 %nh.0637, i64 0, metadata !99, metadata !166), !dbg !274
  br label %for.body120.preheader, !dbg !280

for.body120.preheader:                            ; preds = %for.cond116.preheader.preheader, %for.inc306
  %j.0633 = phi i32 [ %inc307, %for.inc306 ], [ 0, %for.cond116.preheader.preheader ]
  %nh.1632 = phi i32 [ %26, %for.inc306 ], [ %nh.0637, %for.cond116.preheader.preheader ]
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !73, metadata !166), !dbg !280
  tail call void @llvm.dbg.value(metadata i32 %nh.1632, i64 0, metadata !99, metadata !166), !dbg !274
  %7 = sext i32 %nh.1632 to i64, !dbg !281
  br label %for.body120, !dbg !281

for.body120:                                      ; preds = %for.end301, %for.body120.preheader
  %indvars.iv651 = phi i64 [ %7, %for.body120.preheader ], [ %indvars.iv.next652, %for.end301 ]
  %k.0629 = phi i32 [ 0, %for.body120.preheader ], [ %add154.2, %for.end301 ]
  %x = getelementptr inbounds %struct.box_str, %struct.box_str* %6, i64 %indvars.iv651, i32 0, !dbg !289
  store i32 %k.0629, i32* %x, align 8, !dbg !290, !tbaa !291
  %y = getelementptr inbounds %struct.box_str, %struct.box_str* %6, i64 %indvars.iv651, i32 1, !dbg !293
  store i32 %j.0633, i32* %y, align 4, !dbg !294, !tbaa !295
  %z = getelementptr inbounds %struct.box_str, %struct.box_str* %6, i64 %indvars.iv651, i32 2, !dbg !296
  store i32 %i.0638, i32* %z, align 8, !dbg !297, !tbaa !298
  %number = getelementptr inbounds %struct.box_str, %struct.box_str* %6, i64 %indvars.iv651, i32 3, !dbg !299
  %8 = trunc i64 %indvars.iv651 to i32, !dbg !300
  store i32 %8, i32* %number, align 4, !dbg !300, !tbaa !301
  %9 = mul nsw i64 %indvars.iv651, 100, !dbg !302
  %offset = getelementptr inbounds %struct.box_str, %struct.box_str* %6, i64 %indvars.iv651, i32 4, !dbg !303
  store i64 %9, i64* %offset, align 8, !dbg !304, !tbaa !305
  %nn = getelementptr inbounds %struct.box_str, %struct.box_str* %6, i64 %indvars.iv651, i32 5, !dbg !306
  store i32 0, i32* %nn, align 8, !dbg !307, !tbaa !308
  tail call void @llvm.dbg.value(metadata i32 -1, i64 0, metadata !74, metadata !166), !dbg !309
  tail call void @llvm.dbg.value(metadata i32 -1, i64 0, metadata !74, metadata !166), !dbg !309
  %add154 = add nsw i32 %k.0629, -1
  %add154.2 = add nuw nsw i32 %k.0629, 1
  %cmp172.2 = icmp slt i32 %add154.2, %5
  br label %for.cond139.preheader, !dbg !310

for.cond139.preheader:                            ; preds = %for.inc299, %for.body120
  %10 = phi i32 [ 0, %for.body120 ], [ %56, %for.inc299 ]
  %l.0626 = phi i32 [ -1, %for.body120 ], [ %inc300, %for.inc299 ]
  tail call void @llvm.dbg.value(metadata i32 -1, i64 0, metadata !75, metadata !166), !dbg !313
  %add147 = add nsw i32 %l.0626, %i.0638
  %cmp162 = icmp slt i32 %add147, %5
  br label %for.cond143.preheader, !dbg !314

for.cond143.preheader:                            ; preds = %for.inc293.2, %for.cond139.preheader
  %11 = phi i32 [ %10, %for.cond139.preheader ], [ %56, %for.inc293.2 ]
  %m.0625 = phi i32 [ -1, %for.cond139.preheader ], [ %inc297, %for.inc293.2 ]
  tail call void @llvm.dbg.value(metadata i32 -1, i64 0, metadata !76, metadata !166), !dbg !319
  %add151 = add nsw i32 %m.0625, %j.0633
  %12 = or i32 %add151, %add147
  %cmp167 = icmp slt i32 %add151, %5
  %or.cond608 = and i1 %cmp162, %cmp167
  %13 = or i32 %m.0625, %l.0626
  %14 = or i32 %12, %add154, !dbg !320
  %15 = icmp sgt i32 %14, -1, !dbg !320
  %or.cond = and i1 %15, %or.cond608, !dbg !320
  br i1 %or.cond, label %if.then191, label %for.inc293, !dbg !320

if.then191:                                       ; preds = %for.cond143.preheader
  %idxprom198 = sext i32 %11 to i64, !dbg !327
  %x200 = getelementptr inbounds %struct.box_str, %struct.box_str* %6, i64 %indvars.iv651, i32 6, i64 %idxprom198, i32 0, !dbg !329
  store i32 %add154, i32* %x200, align 8, !dbg !330, !tbaa !331
  %16 = load i32, i32* %nn, align 8, !dbg !333, !tbaa !308
  %idxprom208 = sext i32 %16 to i64, !dbg !334
  %y210 = getelementptr inbounds %struct.box_str, %struct.box_str* %6, i64 %indvars.iv651, i32 6, i64 %idxprom208, i32 1, !dbg !335
  store i32 %add151, i32* %y210, align 4, !dbg !336, !tbaa !337
  %z220 = getelementptr inbounds %struct.box_str, %struct.box_str* %6, i64 %indvars.iv651, i32 6, i64 %idxprom208, i32 2, !dbg !338
  store i32 %add147, i32* %z220, align 8, !dbg !339, !tbaa !340
  %17 = load i32, i32* %nn, align 8, !dbg !341, !tbaa !308
  %idxprom227 = sext i32 %17 to i64, !dbg !342
  %z229 = getelementptr inbounds %struct.box_str, %struct.box_str* %6, i64 %indvars.iv651, i32 6, i64 %idxprom227, i32 2, !dbg !343
  %18 = load i32, i32* %z229, align 8, !dbg !343, !tbaa !340
  %mul231 = mul nsw i32 %5, %18, !dbg !344
  %y242 = getelementptr inbounds %struct.box_str, %struct.box_str* %6, i64 %indvars.iv651, i32 6, i64 %idxprom227, i32 1, !dbg !345
  %19 = load i32, i32* %y242, align 4, !dbg !345, !tbaa !337
  %mul233604 = add i32 %mul231, %19, !dbg !346
  %add245 = mul i32 %mul233604, %5, !dbg !346
  %x254 = getelementptr inbounds %struct.box_str, %struct.box_str* %6, i64 %indvars.iv651, i32 6, i64 %idxprom227, i32 0, !dbg !347
  %20 = load i32, i32* %x254, align 8, !dbg !347, !tbaa !331
  %add255 = add nsw i32 %add245, %20, !dbg !348
  %number264 = getelementptr inbounds %struct.box_str, %struct.box_str* %6, i64 %indvars.iv651, i32 6, i64 %idxprom227, i32 3, !dbg !349
  store i32 %add255, i32* %number264, align 4, !dbg !350, !tbaa !351
  %mul274 = mul nsw i32 %add255, 100, !dbg !352
  %conv275 = sext i32 %mul274 to i64, !dbg !353
  %offset284 = getelementptr inbounds %struct.box_str, %struct.box_str* %6, i64 %indvars.iv651, i32 6, i64 %idxprom227, i32 4, !dbg !354
  store i64 %conv275, i64* %offset284, align 8, !dbg !355, !tbaa !356
  %21 = load i32, i32* %nn, align 8, !dbg !357, !tbaa !308
  %add288 = add nsw i32 %21, 1, !dbg !358
  store i32 %add288, i32* %nn, align 8, !dbg !359, !tbaa !308
  br label %for.inc293, !dbg !360

for.inc293:                                       ; preds = %for.cond143.preheader, %if.then191
  %22 = phi i32 [ %11, %for.cond143.preheader ], [ %add288, %if.then191 ]
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !76, metadata !166), !dbg !319
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !76, metadata !166), !dbg !319
  %23 = or i32 %12, %k.0629, !dbg !320
  %24 = icmp sgt i32 %23, -1, !dbg !320
  %or.cond.1 = and i1 %24, %or.cond608, !dbg !320
  %or.cond.not.1 = xor i1 %or.cond.1, true, !dbg !320
  %25 = icmp eq i32 %13, 0, !dbg !361
  %or.cond643.1 = or i1 %25, %or.cond.not.1, !dbg !320
  br i1 %or.cond643.1, label %for.inc293.1, label %if.then191.1, !dbg !320

for.inc299:                                       ; preds = %for.inc293.2
  %inc300 = add nsw i32 %l.0626, 1, !dbg !362
  tail call void @llvm.dbg.value(metadata i32 %inc300, i64 0, metadata !74, metadata !166), !dbg !309
  tail call void @llvm.dbg.value(metadata i32 %inc300, i64 0, metadata !74, metadata !166), !dbg !309
  %exitcond650 = icmp eq i32 %inc300, 2, !dbg !364
  br i1 %exitcond650, label %for.end301, label %for.cond139.preheader, !dbg !310, !llvm.loop !366

for.end301:                                       ; preds = %for.inc299
  %indvars.iv.next652 = add nsw i64 %indvars.iv651, 1, !dbg !369
  tail call void @llvm.dbg.value(metadata i32 %add154.2, i64 0, metadata !73, metadata !166), !dbg !280
  tail call void @llvm.dbg.value(metadata i32 %add154.2, i64 0, metadata !73, metadata !166), !dbg !280
  %exitcond654 = icmp eq i32 %add154.2, %5, !dbg !370
  br i1 %exitcond654, label %for.inc306, label %for.body120, !dbg !372, !llvm.loop !374

for.inc306:                                       ; preds = %for.end301
  %26 = add i32 %5, %nh.1632, !dbg !281
  %inc307 = add nuw nsw i32 %j.0633, 1, !dbg !377
  tail call void @llvm.dbg.value(metadata i32 %inc307, i64 0, metadata !72, metadata !166), !dbg !279
  tail call void @llvm.dbg.value(metadata i32 %inc307, i64 0, metadata !72, metadata !166), !dbg !279
  tail call void @llvm.dbg.value(metadata i32 %26, i64 0, metadata !99, metadata !166), !dbg !274
  %exitcond655 = icmp eq i32 %inc307, %5, !dbg !379
  br i1 %exitcond655, label %for.inc309, label %for.body120.preheader, !dbg !381, !llvm.loop !383

for.inc309:                                       ; preds = %for.inc306
  %inc310 = add nuw nsw i32 %i.0638, 1, !dbg !386
  tail call void @llvm.dbg.value(metadata i32 %inc310, i64 0, metadata !71, metadata !166), !dbg !275
  tail call void @llvm.dbg.value(metadata i32 %inc310, i64 0, metadata !71, metadata !166), !dbg !275
  tail call void @llvm.dbg.value(metadata i32 %26, i64 0, metadata !99, metadata !166), !dbg !274
  %cmp108 = icmp slt i32 %inc310, %5, !dbg !276
  br i1 %cmp108, label %for.cond116.preheader.preheader, label %for.end311.loopexit, !dbg !277, !llvm.loop !388

for.end311.loopexit:                              ; preds = %for.inc309
  br label %for.end311, !dbg !391

for.end311:                                       ; preds = %for.end311.loopexit, %for.end
  call void @callFunc(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @14, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @5, i32 0, i32 0), i32 230, i32 2), !dbg !391
  tail call void @srand(i32 7) #6, !dbg !391
  call void @callFunc(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @14, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @7, i32 0, i32 0), i32 233, i32 25), !dbg !392
  %call313 = tail call noalias i8* @malloc(i64 %mul98) #6, !dbg !392
  %27 = bitcast i8* %call313 to %struct.FOUR_VECTOR*, !dbg !393
  tail call void @llvm.dbg.value(metadata %struct.FOUR_VECTOR* %27, i64 0, metadata !96, metadata !166), !dbg !394
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !71, metadata !166), !dbg !275
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !71, metadata !166), !dbg !275
  %cmp317621 = icmp sgt i32 %mul93, 0, !dbg !395
  br i1 %cmp317621, label %for.body319.preheader, label %for.end351.thread, !dbg !399

for.body319.preheader:                            ; preds = %for.end311
  br label %for.body319, !dbg !401

for.end351.thread:                                ; preds = %for.end311
  call void @callFunc(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @14, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @7, i32 0, i32 0), i32 242, i32 16), !dbg !403
  %call353656 = tail call noalias i8* @malloc(i64 %mul100) #6, !dbg !403
  %28 = bitcast i8* %call353656 to double*, !dbg !404
  tail call void @llvm.dbg.value(metadata double* %29, i64 0, metadata !97, metadata !166), !dbg !405
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !71, metadata !166), !dbg !275
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !71, metadata !166), !dbg !275
  br label %for.end369.thread, !dbg !406

for.body319:                                      ; preds = %for.body319.preheader, %for.body319
  %indvars.iv648 = phi i64 [ %indvars.iv.next649, %for.body319 ], [ 0, %for.body319.preheader ]
  call void @callFunc(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @14, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0), i32 235, i32 18), !dbg !401
  %call320 = tail call i32 @rand() #6, !dbg !401
  %rem = srem i32 %call320, 10, !dbg !409
  %add321 = add nsw i32 %rem, 1, !dbg !410
  %conv322 = sitofp i32 %add321 to double, !dbg !411
  %div = fdiv double %conv322, 1.000000e+01, !dbg !412
  %v = getelementptr inbounds %struct.FOUR_VECTOR, %struct.FOUR_VECTOR* %27, i64 %indvars.iv648, i32 0, !dbg !413
  store double %div, double* %v, align 8, !dbg !414, !tbaa !415
  call void @callFunc(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @14, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0), i32 236, i32 18), !dbg !418
  %call325 = tail call i32 @rand() #6, !dbg !418
  %rem326 = srem i32 %call325, 10, !dbg !419
  %add327 = add nsw i32 %rem326, 1, !dbg !420
  %conv328 = sitofp i32 %add327 to double, !dbg !421
  %div329 = fdiv double %conv328, 1.000000e+01, !dbg !422
  %x332 = getelementptr inbounds %struct.FOUR_VECTOR, %struct.FOUR_VECTOR* %27, i64 %indvars.iv648, i32 1, !dbg !423
  store double %div329, double* %x332, align 8, !dbg !424, !tbaa !425
  call void @callFunc(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @14, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0), i32 237, i32 18), !dbg !426
  %call333 = tail call i32 @rand() #6, !dbg !426
  %rem334 = srem i32 %call333, 10, !dbg !427
  %add335 = add nsw i32 %rem334, 1, !dbg !428
  %conv336 = sitofp i32 %add335 to double, !dbg !429
  %div337 = fdiv double %conv336, 1.000000e+01, !dbg !430
  %y340 = getelementptr inbounds %struct.FOUR_VECTOR, %struct.FOUR_VECTOR* %27, i64 %indvars.iv648, i32 2, !dbg !431
  store double %div337, double* %y340, align 8, !dbg !432, !tbaa !433
  call void @callFunc(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @14, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0), i32 238, i32 18), !dbg !434
  %call341 = tail call i32 @rand() #6, !dbg !434
  %rem342 = srem i32 %call341, 10, !dbg !435
  %add343 = add nsw i32 %rem342, 1, !dbg !436
  %conv344 = sitofp i32 %add343 to double, !dbg !437
  %div345 = fdiv double %conv344, 1.000000e+01, !dbg !438
  %z348 = getelementptr inbounds %struct.FOUR_VECTOR, %struct.FOUR_VECTOR* %27, i64 %indvars.iv648, i32 3, !dbg !439
  store double %div345, double* %z348, align 8, !dbg !440, !tbaa !441
  %indvars.iv.next649 = add nuw i64 %indvars.iv648, 1, !dbg !442
  %cmp317 = icmp sgt i64 %mul96, %indvars.iv.next649, !dbg !395
  br i1 %cmp317, label %for.body319, label %for.end351, !dbg !399, !llvm.loop !444

for.end351:                                       ; preds = %for.body319
  call void @callFunc(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @14, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @7, i32 0, i32 0), i32 242, i32 16), !dbg !403
  %call353 = tail call noalias i8* @malloc(i64 %mul100) #6, !dbg !403
  %29 = bitcast i8* %call353 to double*, !dbg !404
  tail call void @llvm.dbg.value(metadata double* %29, i64 0, metadata !97, metadata !166), !dbg !405
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !71, metadata !166), !dbg !275
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !71, metadata !166), !dbg !275
  br i1 %cmp317621, label %for.body359.preheader, label %for.end369.thread, !dbg !406

for.body359.preheader:                            ; preds = %for.end351
  br label %for.body359, !dbg !447

for.body359:                                      ; preds = %for.body359.preheader, %for.body359
  %indvars.iv646 = phi i64 [ %indvars.iv.next647, %for.body359 ], [ 0, %for.body359.preheader ]
  call void @callFunc(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @14, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @6, i32 0, i32 0), i32 244, i32 16), !dbg !447
  %call360 = tail call i32 @rand() #6, !dbg !447
  %rem361 = srem i32 %call360, 10, !dbg !450
  %add362 = add nsw i32 %rem361, 1, !dbg !451
  %conv363 = sitofp i32 %add362 to double, !dbg !452
  %div364 = fdiv double %conv363, 1.000000e+01, !dbg !453
  %arrayidx366 = getelementptr inbounds double, double* %29, i64 %indvars.iv646, !dbg !454
  store double %div364, double* %arrayidx366, align 8, !dbg !455, !tbaa !456
  %indvars.iv.next647 = add nuw i64 %indvars.iv646, 1, !dbg !457
  %cmp357 = icmp sgt i64 %mul96, %indvars.iv.next647, !dbg !459
  br i1 %cmp357, label %for.body359, label %for.end369, !dbg !406, !llvm.loop !461

for.end369.thread:                                ; preds = %for.end351.thread, %for.end351
  %.ph = phi double* [ %29, %for.end351 ], [ %28, %for.end351.thread ]
  %call353657.ph = phi i8* [ %call353, %for.end351 ], [ %call353656, %for.end351.thread ]
  call void @callFunc(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @14, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @7, i32 0, i32 0), i32 248, i32 25), !dbg !464
  %call371658 = tail call noalias i8* @malloc(i64 %mul98) #6, !dbg !464
  %30 = bitcast i8* %call371658 to %struct.FOUR_VECTOR*, !dbg !465
  tail call void @llvm.dbg.value(metadata %struct.FOUR_VECTOR* %31, i64 0, metadata !98, metadata !166), !dbg !466
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !71, metadata !166), !dbg !275
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !71, metadata !166), !dbg !275
  br label %for.end392, !dbg !467

for.end369:                                       ; preds = %for.body359
  call void @callFunc(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @14, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @7, i32 0, i32 0), i32 248, i32 25), !dbg !464
  %call371 = tail call noalias i8* @malloc(i64 %mul98) #6, !dbg !464
  %31 = bitcast i8* %call371 to %struct.FOUR_VECTOR*, !dbg !465
  tail call void @llvm.dbg.value(metadata %struct.FOUR_VECTOR* %31, i64 0, metadata !98, metadata !166), !dbg !466
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !71, metadata !166), !dbg !275
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !71, metadata !166), !dbg !275
  br i1 %cmp317621, label %for.body377.preheader, label %for.end392, !dbg !467

for.body377.preheader:                            ; preds = %for.end369
  %32 = mul nsw i64 %conv94, 3200, !dbg !470
  call void @callFunc(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @14, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @8, i32 0, i32 0), i32 250, i32 15), !dbg !473
  call void @llvm.memset.p0i8.i64(i8* %call371, i8 0, i64 %32, i32 8, i1 false), !dbg !473
  br label %for.end392, !dbg !474

for.end392:                                       ; preds = %for.end369.thread, %for.body377.preheader, %for.end369
  %33 = phi %struct.FOUR_VECTOR* [ %30, %for.end369.thread ], [ %31, %for.body377.preheader ], [ %31, %for.end369 ]
  %call371660 = phi i8* [ %call371658, %for.end369.thread ], [ %call371, %for.body377.preheader ], [ %call371, %for.end369 ]
  %call353657659 = phi i8* [ %call353657.ph, %for.end369.thread ], [ %call353, %for.body377.preheader ], [ %call353, %for.end369 ]
  %34 = phi double* [ %.ph, %for.end369.thread ], [ %29, %for.body377.preheader ], [ %29, %for.end369 ]
  call void @callFunc(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @14, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @15, i32 0, i32 0), i32 256, i32 10), !dbg !474
  %call393 = tail call i64 (...) @get_time() #6, !dbg !474
  tail call void @llvm.dbg.value(metadata i64 %call393, i64 0, metadata !68, metadata !166), !dbg !475
  tail call void @llvm.dbg.value(metadata %struct.dim_str* %dim_cpu, i64 0, metadata !82, metadata !476), !dbg !477
  call void @callFunc(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @14, i32 0, i32 0), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @9, i32 0, i32 0), i32 266, i32 2), !dbg !478
  call void @kernel_gpu_cuda_wrapper(double 5.000000e-01, %struct.dim_str* byval nonnull align 8 %dim_cpu, %struct.box_str* %6, %struct.FOUR_VECTOR* %27, double* %34, %struct.FOUR_VECTOR* %33) #6, !dbg !478
  call void @callFunc(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @14, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @15, i32 0, i32 0), i32 273, i32 10), !dbg !479
  %call394 = call i64 (...) @get_time() #6, !dbg !479
  call void @llvm.dbg.value(metadata i64 %call394, i64 0, metadata !69, metadata !166), !dbg !480
  call void @callFunc(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @14, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @10, i32 0, i32 0), i32 282, i32 9), !dbg !481
  %call396 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.7, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8, i64 0, i64 0)), !dbg !481
  call void @llvm.dbg.value(metadata %struct._IO_FILE* %call396, i64 0, metadata !110, metadata !166), !dbg !482
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !71, metadata !166), !dbg !275
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !71, metadata !166), !dbg !275
  %35 = load i64, i64* %space_elem, align 8, !dbg !483, !tbaa !256
  %cmp400612 = icmp sgt i64 %35, 0, !dbg !487
  br i1 %cmp400612, label %for.body402.preheader, label %for.end418, !dbg !488

for.body402.preheader:                            ; preds = %for.end392
  br label %for.body402, !dbg !490

for.body402:                                      ; preds = %for.body402.preheader, %for.body402
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body402 ], [ 0, %for.body402.preheader ]
  %v405 = getelementptr inbounds %struct.FOUR_VECTOR, %struct.FOUR_VECTOR* %33, i64 %indvars.iv, i32 0, !dbg !490
  %36 = load double, double* %v405, align 8, !dbg !490, !tbaa !415
  %x408 = getelementptr inbounds %struct.FOUR_VECTOR, %struct.FOUR_VECTOR* %33, i64 %indvars.iv, i32 1, !dbg !492
  %37 = load double, double* %x408, align 8, !dbg !492, !tbaa !425
  %y411 = getelementptr inbounds %struct.FOUR_VECTOR, %struct.FOUR_VECTOR* %33, i64 %indvars.iv, i32 2, !dbg !493
  %38 = load double, double* %y411, align 8, !dbg !493, !tbaa !433
  %z414 = getelementptr inbounds %struct.FOUR_VECTOR, %struct.FOUR_VECTOR* %33, i64 %indvars.iv, i32 3, !dbg !494
  %39 = load double, double* %z414, align 8, !dbg !494, !tbaa !441
  call void @callFunc(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @14, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @11, i32 0, i32 0), i32 284, i32 10), !dbg !495
  %call415 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %call396, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.9, i64 0, i64 0), double %36, double %37, double %38, double %39), !dbg !495
  %indvars.iv.next = add nuw i64 %indvars.iv, 1, !dbg !496
  %40 = load i64, i64* %space_elem, align 8, !dbg !483, !tbaa !256
  %cmp400 = icmp sgt i64 %40, %indvars.iv.next, !dbg !487
  br i1 %cmp400, label %for.body402, label %for.end418.loopexit, !dbg !488, !llvm.loop !498

for.end418.loopexit:                              ; preds = %for.body402
  br label %for.end418, !dbg !501

for.end418:                                       ; preds = %for.end418.loopexit, %for.end392
  call void @callFunc(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @14, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @12, i32 0, i32 0), i32 286, i32 2), !dbg !501
  %call419 = call i32 @fclose(%struct._IO_FILE* %call396), !dbg !501
  call void @callFunc(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @14, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @13, i32 0, i32 0), i32 291, i32 2), !dbg !502
  call void @free(i8* %call313) #6, !dbg !502
  call void @callFunc(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @14, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @13, i32 0, i32 0), i32 292, i32 2), !dbg !503
  call void @free(i8* %call353657659) #6, !dbg !503
  call void @callFunc(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @14, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @13, i32 0, i32 0), i32 293, i32 2), !dbg !504
  call void @free(i8* %call371660) #6, !dbg !504
  call void @callFunc(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @14, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @13, i32 0, i32 0), i32 294, i32 2), !dbg !505
  call void @free(i8* %call105) #6, !dbg !505
  call void @callFunc(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @14, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @15, i32 0, i32 0), i32 296, i32 10), !dbg !506
  %call420 = call i64 (...) @get_time() #6, !dbg !506
  call void @llvm.dbg.value(metadata i64 %call420, i64 0, metadata !70, metadata !166), !dbg !507
  br label %cleanup

cleanup:                                          ; preds = %for.end418, %if.else82, %if.else, %if.then71
  call void @llvm.lifetime.end(i64 56, i8* nonnull %0) #6, !dbg !508
  call void @RetMain()
  ret i32 0, !dbg !509

if.then191.1:                                     ; preds = %for.inc293
  %idxprom198.1 = sext i32 %22 to i64, !dbg !327
  %x200.1 = getelementptr inbounds %struct.box_str, %struct.box_str* %6, i64 %indvars.iv651, i32 6, i64 %idxprom198.1, i32 0, !dbg !329
  store i32 %k.0629, i32* %x200.1, align 8, !dbg !330, !tbaa !331
  %41 = load i32, i32* %nn, align 8, !dbg !333, !tbaa !308
  %idxprom208.1 = sext i32 %41 to i64, !dbg !334
  %y210.1 = getelementptr inbounds %struct.box_str, %struct.box_str* %6, i64 %indvars.iv651, i32 6, i64 %idxprom208.1, i32 1, !dbg !335
  store i32 %add151, i32* %y210.1, align 4, !dbg !336, !tbaa !337
  %z220.1 = getelementptr inbounds %struct.box_str, %struct.box_str* %6, i64 %indvars.iv651, i32 6, i64 %idxprom208.1, i32 2, !dbg !338
  store i32 %add147, i32* %z220.1, align 8, !dbg !339, !tbaa !340
  %42 = load i32, i32* %nn, align 8, !dbg !341, !tbaa !308
  %idxprom227.1 = sext i32 %42 to i64, !dbg !342
  %z229.1 = getelementptr inbounds %struct.box_str, %struct.box_str* %6, i64 %indvars.iv651, i32 6, i64 %idxprom227.1, i32 2, !dbg !343
  %43 = load i32, i32* %z229.1, align 8, !dbg !343, !tbaa !340
  %mul231.1 = mul nsw i32 %5, %43, !dbg !344
  %y242.1 = getelementptr inbounds %struct.box_str, %struct.box_str* %6, i64 %indvars.iv651, i32 6, i64 %idxprom227.1, i32 1, !dbg !345
  %44 = load i32, i32* %y242.1, align 4, !dbg !345, !tbaa !337
  %mul233604.1 = add i32 %mul231.1, %44, !dbg !346
  %add245.1 = mul i32 %mul233604.1, %5, !dbg !346
  %x254.1 = getelementptr inbounds %struct.box_str, %struct.box_str* %6, i64 %indvars.iv651, i32 6, i64 %idxprom227.1, i32 0, !dbg !347
  %45 = load i32, i32* %x254.1, align 8, !dbg !347, !tbaa !331
  %add255.1 = add nsw i32 %add245.1, %45, !dbg !348
  %number264.1 = getelementptr inbounds %struct.box_str, %struct.box_str* %6, i64 %indvars.iv651, i32 6, i64 %idxprom227.1, i32 3, !dbg !349
  store i32 %add255.1, i32* %number264.1, align 4, !dbg !350, !tbaa !351
  %mul274.1 = mul nsw i32 %add255.1, 100, !dbg !352
  %conv275.1 = sext i32 %mul274.1 to i64, !dbg !353
  %offset284.1 = getelementptr inbounds %struct.box_str, %struct.box_str* %6, i64 %indvars.iv651, i32 6, i64 %idxprom227.1, i32 4, !dbg !354
  store i64 %conv275.1, i64* %offset284.1, align 8, !dbg !355, !tbaa !356
  %46 = load i32, i32* %nn, align 8, !dbg !357, !tbaa !308
  %add288.1 = add nsw i32 %46, 1, !dbg !358
  store i32 %add288.1, i32* %nn, align 8, !dbg !359, !tbaa !308
  br label %for.inc293.1, !dbg !360

for.inc293.1:                                     ; preds = %if.then191.1, %for.inc293
  %47 = phi i32 [ %add288.1, %if.then191.1 ], [ %22, %for.inc293 ]
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !76, metadata !166), !dbg !319
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !76, metadata !166), !dbg !319
  %48 = or i32 %12, %add154.2, !dbg !320
  %49 = icmp sgt i32 %48, -1, !dbg !320
  %or.cond611.2 = and i1 %cmp172.2, %or.cond608, !dbg !511
  %or.cond.2 = and i1 %49, %or.cond611.2, !dbg !320
  br i1 %or.cond.2, label %if.then191.2, label %for.inc293.2, !dbg !320

if.then191.2:                                     ; preds = %for.inc293.1
  %idxprom198.2 = sext i32 %47 to i64, !dbg !327
  %x200.2 = getelementptr inbounds %struct.box_str, %struct.box_str* %6, i64 %indvars.iv651, i32 6, i64 %idxprom198.2, i32 0, !dbg !329
  store i32 %add154.2, i32* %x200.2, align 8, !dbg !330, !tbaa !331
  %50 = load i32, i32* %nn, align 8, !dbg !333, !tbaa !308
  %idxprom208.2 = sext i32 %50 to i64, !dbg !334
  %y210.2 = getelementptr inbounds %struct.box_str, %struct.box_str* %6, i64 %indvars.iv651, i32 6, i64 %idxprom208.2, i32 1, !dbg !335
  store i32 %add151, i32* %y210.2, align 4, !dbg !336, !tbaa !337
  %z220.2 = getelementptr inbounds %struct.box_str, %struct.box_str* %6, i64 %indvars.iv651, i32 6, i64 %idxprom208.2, i32 2, !dbg !338
  store i32 %add147, i32* %z220.2, align 8, !dbg !339, !tbaa !340
  %51 = load i32, i32* %nn, align 8, !dbg !341, !tbaa !308
  %idxprom227.2 = sext i32 %51 to i64, !dbg !342
  %z229.2 = getelementptr inbounds %struct.box_str, %struct.box_str* %6, i64 %indvars.iv651, i32 6, i64 %idxprom227.2, i32 2, !dbg !343
  %52 = load i32, i32* %z229.2, align 8, !dbg !343, !tbaa !340
  %mul231.2 = mul nsw i32 %5, %52, !dbg !344
  %y242.2 = getelementptr inbounds %struct.box_str, %struct.box_str* %6, i64 %indvars.iv651, i32 6, i64 %idxprom227.2, i32 1, !dbg !345
  %53 = load i32, i32* %y242.2, align 4, !dbg !345, !tbaa !337
  %mul233604.2 = add i32 %mul231.2, %53, !dbg !346
  %add245.2 = mul i32 %mul233604.2, %5, !dbg !346
  %x254.2 = getelementptr inbounds %struct.box_str, %struct.box_str* %6, i64 %indvars.iv651, i32 6, i64 %idxprom227.2, i32 0, !dbg !347
  %54 = load i32, i32* %x254.2, align 8, !dbg !347, !tbaa !331
  %add255.2 = add nsw i32 %add245.2, %54, !dbg !348
  %number264.2 = getelementptr inbounds %struct.box_str, %struct.box_str* %6, i64 %indvars.iv651, i32 6, i64 %idxprom227.2, i32 3, !dbg !349
  store i32 %add255.2, i32* %number264.2, align 4, !dbg !350, !tbaa !351
  %mul274.2 = mul nsw i32 %add255.2, 100, !dbg !352
  %conv275.2 = sext i32 %mul274.2 to i64, !dbg !353
  %offset284.2 = getelementptr inbounds %struct.box_str, %struct.box_str* %6, i64 %indvars.iv651, i32 6, i64 %idxprom227.2, i32 4, !dbg !354
  store i64 %conv275.2, i64* %offset284.2, align 8, !dbg !355, !tbaa !356
  %55 = load i32, i32* %nn, align 8, !dbg !357, !tbaa !308
  %add288.2 = add nsw i32 %55, 1, !dbg !358
  store i32 %add288.2, i32* %nn, align 8, !dbg !359, !tbaa !308
  br label %for.inc293.2, !dbg !360

for.inc293.2:                                     ; preds = %for.inc293.1, %if.then191.2
  %56 = phi i32 [ %add288.2, %if.then191.2 ], [ %47, %for.inc293.1 ]
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !76, metadata !166), !dbg !319
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !76, metadata !166), !dbg !319
  %inc297 = add nsw i32 %m.0625, 1, !dbg !513
  tail call void @llvm.dbg.value(metadata i32 %inc297, i64 0, metadata !75, metadata !166), !dbg !313
  tail call void @llvm.dbg.value(metadata i32 %inc297, i64 0, metadata !75, metadata !166), !dbg !313
  %exitcond = icmp eq i32 %inc297, 2, !dbg !515
  br i1 %exitcond, label %for.inc299, label %for.cond143.preheader, !dbg !314, !llvm.loop !517
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #3

declare i64 @get_time(...) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #3

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8* nocapture, i8* nocapture) local_unnamed_addr #5

declare i32 @isInteger(i8*) local_unnamed_addr #4

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) local_unnamed_addr #2

; Function Attrs: nounwind
declare void @srand(i32) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @rand() local_unnamed_addr #2

declare void @kernel_gpu_cuda_wrapper(double, %struct.dim_str* byval align 8, %struct.box_str*, %struct.FOUR_VECTOR*, double*, %struct.FOUR_VECTOR*) local_unnamed_addr #4

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @fclose(%struct._IO_FILE* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) local_unnamed_addr #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #6

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #3

declare void @print1()

declare void @print2()

declare void @print3(i32)

declare void @print4(i64)

declare void @printea(i8*, i32)

declare void @RetMain()

declare void @takeString(i8*, i32)

declare void @callFunc(i8*, i8*, i32, i32)

declare void @recordMEvent(i8*, i64, i32, i32)

declare i32 @cudaDeviceSynchronize()

declare void @measureKernel(i32)

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!53, !54}
!llvm.ident = !{!55}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 5.0.0 (trunk 294196)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3)
!1 = !DIFile(filename: "main.c", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/lavaMDllvm")
!2 = !{}
!3 = !{!4, !7, !9, !12, !15, !40, !49, !21, !50, !52}
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !5, line: 62, baseType: !6)
!5 = !DIFile(filename: "/home/dshen/llvm/build/bin/../lib/clang/5.0.0/include/stddef.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/lavaMDllvm")
!6 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!10 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !11)
!11 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !14)
!14 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "box_str", file: !17, line: 64, baseType: !18)
!17 = !DIFile(filename: "././main.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/lavaMDllvm")
!18 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "box_str", file: !17, line: 52, size: 5248, elements: !19)
!19 = !{!20, !22, !23, !24, !25, !27, !28}
!20 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !18, file: !17, line: 56, baseType: !21, size: 32)
!21 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!22 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !18, file: !17, line: 56, baseType: !21, size: 32, offset: 32)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !18, file: !17, line: 56, baseType: !21, size: 32, offset: 64)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "number", scope: !18, file: !17, line: 57, baseType: !21, size: 32, offset: 96)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "offset", scope: !18, file: !17, line: 58, baseType: !26, size: 64, offset: 128)
!26 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "nn", scope: !18, file: !17, line: 61, baseType: !21, size: 32, offset: 192)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "nei", scope: !18, file: !17, line: 62, baseType: !29, size: 4992, offset: 256)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 4992, elements: !38)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "nei_str", file: !17, line: 50, baseType: !31)
!31 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "nei_str", file: !17, line: 42, size: 192, elements: !32)
!32 = !{!33, !34, !35, !36, !37}
!33 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !31, file: !17, line: 46, baseType: !21, size: 32)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !31, file: !17, line: 46, baseType: !21, size: 32, offset: 32)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !31, file: !17, line: 46, baseType: !21, size: 32, offset: 64)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "number", scope: !31, file: !17, line: 47, baseType: !21, size: 32, offset: 96)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "offset", scope: !31, file: !17, line: 48, baseType: !26, size: 64, offset: 128)
!38 = !{!39}
!39 = !DISubrange(count: 26)
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 64)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "FOUR_VECTOR", file: !17, line: 40, baseType: !42)
!42 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !17, line: 36, size: 256, elements: !43)
!43 = !{!44, !46, !47, !48}
!44 = !DIDerivedType(tag: DW_TAG_member, name: "v", scope: !42, file: !17, line: 38, baseType: !45, size: 64)
!45 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !42, file: !17, line: 38, baseType: !45, size: 64, offset: 64)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !42, file: !17, line: 38, baseType: !45, size: 64, offset: 128)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !42, file: !17, line: 38, baseType: !45, size: 64, offset: 192)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!53 = !{i32 2, !"Dwarf Version", i32 4}
!54 = !{i32 2, !"Debug Info Version", i32 3}
!55 = !{!"clang version 5.0.0 (trunk 294196)"}
!56 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 49, type: !57, isLocal: false, isDefinition: true, scopeLine: 51, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !59)
!57 = !DISubroutineType(types: !58)
!58 = !{!21, !21, !50}
!59 = !{!60, !61, !62, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !82, !95, !96, !97, !98, !99, !100, !106, !107, !109, !110}
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !1, line: 49, type: !21)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !1, line: 50, type: !50)
!62 = !DILocalVariable(name: "time0", scope: !56, file: !1, line: 59, type: !63)
!63 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!64 = !DILocalVariable(name: "time1", scope: !56, file: !1, line: 64, type: !63)
!65 = !DILocalVariable(name: "time2", scope: !56, file: !1, line: 65, type: !63)
!66 = !DILocalVariable(name: "time3", scope: !56, file: !1, line: 66, type: !63)
!67 = !DILocalVariable(name: "time4", scope: !56, file: !1, line: 67, type: !63)
!68 = !DILocalVariable(name: "time5", scope: !56, file: !1, line: 68, type: !63)
!69 = !DILocalVariable(name: "time6", scope: !56, file: !1, line: 69, type: !63)
!70 = !DILocalVariable(name: "time7", scope: !56, file: !1, line: 70, type: !63)
!71 = !DILocalVariable(name: "i", scope: !56, file: !1, line: 73, type: !21)
!72 = !DILocalVariable(name: "j", scope: !56, file: !1, line: 73, type: !21)
!73 = !DILocalVariable(name: "k", scope: !56, file: !1, line: 73, type: !21)
!74 = !DILocalVariable(name: "l", scope: !56, file: !1, line: 73, type: !21)
!75 = !DILocalVariable(name: "m", scope: !56, file: !1, line: 73, type: !21)
!76 = !DILocalVariable(name: "n", scope: !56, file: !1, line: 73, type: !21)
!77 = !DILocalVariable(name: "par_cpu", scope: !56, file: !1, line: 76, type: !78)
!78 = !DIDerivedType(tag: DW_TAG_typedef, name: "par_str", file: !17, line: 71, baseType: !79)
!79 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "par_str", file: !17, line: 66, size: 64, elements: !80)
!80 = !{!81}
!81 = !DIDerivedType(tag: DW_TAG_member, name: "alpha", scope: !79, file: !17, line: 69, baseType: !45, size: 64)
!82 = !DILocalVariable(name: "dim_cpu", scope: !56, file: !1, line: 77, type: !83)
!83 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim_str", file: !17, line: 89, baseType: !84)
!84 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim_str", file: !17, line: 73, size: 448, elements: !85)
!85 = !{!86, !87, !88, !89, !90, !91, !92, !93, !94}
!86 = !DIDerivedType(tag: DW_TAG_member, name: "cur_arg", scope: !84, file: !17, line: 77, baseType: !21, size: 32)
!87 = !DIDerivedType(tag: DW_TAG_member, name: "arch_arg", scope: !84, file: !17, line: 78, baseType: !21, size: 32, offset: 32)
!88 = !DIDerivedType(tag: DW_TAG_member, name: "cores_arg", scope: !84, file: !17, line: 79, baseType: !21, size: 32, offset: 64)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "boxes1d_arg", scope: !84, file: !17, line: 80, baseType: !21, size: 32, offset: 96)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "number_boxes", scope: !84, file: !17, line: 83, baseType: !26, size: 64, offset: 128)
!91 = !DIDerivedType(tag: DW_TAG_member, name: "box_mem", scope: !84, file: !17, line: 84, baseType: !26, size: 64, offset: 192)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "space_elem", scope: !84, file: !17, line: 85, baseType: !26, size: 64, offset: 256)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "space_mem", scope: !84, file: !17, line: 86, baseType: !26, size: 64, offset: 320)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "space_mem2", scope: !84, file: !17, line: 87, baseType: !26, size: 64, offset: 384)
!95 = !DILocalVariable(name: "box_cpu", scope: !56, file: !1, line: 78, type: !15)
!96 = !DILocalVariable(name: "rv_cpu", scope: !56, file: !1, line: 79, type: !40)
!97 = !DILocalVariable(name: "qv_cpu", scope: !56, file: !1, line: 80, type: !49)
!98 = !DILocalVariable(name: "fv_cpu", scope: !56, file: !1, line: 81, type: !40)
!99 = !DILocalVariable(name: "nh", scope: !56, file: !1, line: 82, type: !21)
!100 = !DILocalVariable(name: "__s1_len", scope: !101, file: !1, line: 96, type: !4)
!101 = distinct !DILexicalBlock(scope: !102, file: !1, line: 96, column: 6)
!102 = distinct !DILexicalBlock(scope: !103, file: !1, line: 96, column: 6)
!103 = distinct !DILexicalBlock(scope: !104, file: !1, line: 94, column: 65)
!104 = distinct !DILexicalBlock(scope: !105, file: !1, line: 94, column: 2)
!105 = distinct !DILexicalBlock(scope: !56, file: !1, line: 94, column: 2)
!106 = !DILocalVariable(name: "__s2_len", scope: !101, file: !1, line: 96, type: !4)
!107 = !DILocalVariable(name: "__s2", scope: !108, file: !1, line: 96, type: !9)
!108 = distinct !DILexicalBlock(scope: !101, file: !1, line: 96, column: 6)
!109 = !DILocalVariable(name: "__result", scope: !108, file: !1, line: 96, type: !21)
!110 = !DILocalVariable(name: "fptr", scope: !56, file: !1, line: 281, type: !111)
!111 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !112, size: 64)
!112 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !113, line: 48, baseType: !114)
!113 = !DIFile(filename: "/usr/include/stdio.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/lavaMDllvm")
!114 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !115, line: 245, size: 1728, elements: !116)
!115 = !DIFile(filename: "/usr/include/libio.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/lavaMDllvm")
!116 = !{!117, !118, !119, !120, !121, !122, !123, !124, !125, !126, !127, !128, !129, !137, !138, !139, !140, !143, !145, !147, !151, !154, !156, !157, !158, !159, !160, !161, !162}
!117 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !114, file: !115, line: 246, baseType: !21, size: 32)
!118 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !114, file: !115, line: 251, baseType: !51, size: 64, offset: 64)
!119 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !114, file: !115, line: 252, baseType: !51, size: 64, offset: 128)
!120 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !114, file: !115, line: 253, baseType: !51, size: 64, offset: 192)
!121 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !114, file: !115, line: 254, baseType: !51, size: 64, offset: 256)
!122 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !114, file: !115, line: 255, baseType: !51, size: 64, offset: 320)
!123 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !114, file: !115, line: 256, baseType: !51, size: 64, offset: 384)
!124 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !114, file: !115, line: 257, baseType: !51, size: 64, offset: 448)
!125 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !114, file: !115, line: 258, baseType: !51, size: 64, offset: 512)
!126 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !114, file: !115, line: 260, baseType: !51, size: 64, offset: 576)
!127 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !114, file: !115, line: 261, baseType: !51, size: 64, offset: 640)
!128 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !114, file: !115, line: 262, baseType: !51, size: 64, offset: 704)
!129 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !114, file: !115, line: 264, baseType: !130, size: 64, offset: 768)
!130 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !131, size: 64)
!131 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !115, line: 160, size: 192, elements: !132)
!132 = !{!133, !134, !136}
!133 = !DIDerivedType(tag: DW_TAG_member, name: "_next", scope: !131, file: !115, line: 161, baseType: !130, size: 64)
!134 = !DIDerivedType(tag: DW_TAG_member, name: "_sbuf", scope: !131, file: !115, line: 162, baseType: !135, size: 64, offset: 64)
!135 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !114, size: 64)
!136 = !DIDerivedType(tag: DW_TAG_member, name: "_pos", scope: !131, file: !115, line: 166, baseType: !21, size: 32, offset: 128)
!137 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !114, file: !115, line: 266, baseType: !135, size: 64, offset: 832)
!138 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !114, file: !115, line: 268, baseType: !21, size: 32, offset: 896)
!139 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !114, file: !115, line: 272, baseType: !21, size: 32, offset: 928)
!140 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !114, file: !115, line: 274, baseType: !141, size: 64, offset: 960)
!141 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !142, line: 131, baseType: !26)
!142 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/lavaMDllvm")
!143 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !114, file: !115, line: 278, baseType: !144, size: 16, offset: 1024)
!144 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!145 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !114, file: !115, line: 279, baseType: !146, size: 8, offset: 1040)
!146 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!147 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !114, file: !115, line: 280, baseType: !148, size: 8, offset: 1048)
!148 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 8, elements: !149)
!149 = !{!150}
!150 = !DISubrange(count: 1)
!151 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !114, file: !115, line: 284, baseType: !152, size: 64, offset: 1088)
!152 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !153, size: 64)
!153 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !115, line: 154, baseType: null)
!154 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !114, file: !115, line: 293, baseType: !155, size: 64, offset: 1152)
!155 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !142, line: 132, baseType: !26)
!156 = !DIDerivedType(tag: DW_TAG_member, name: "__pad1", scope: !114, file: !115, line: 302, baseType: !52, size: 64, offset: 1216)
!157 = !DIDerivedType(tag: DW_TAG_member, name: "__pad2", scope: !114, file: !115, line: 303, baseType: !52, size: 64, offset: 1280)
!158 = !DIDerivedType(tag: DW_TAG_member, name: "__pad3", scope: !114, file: !115, line: 304, baseType: !52, size: 64, offset: 1344)
!159 = !DIDerivedType(tag: DW_TAG_member, name: "__pad4", scope: !114, file: !115, line: 305, baseType: !52, size: 64, offset: 1408)
!160 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !114, file: !115, line: 306, baseType: !4, size: 64, offset: 1472)
!161 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !114, file: !115, line: 308, baseType: !21, size: 32, offset: 1536)
!162 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !114, file: !115, line: 310, baseType: !163, size: 160, offset: 1568)
!163 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 160, elements: !164)
!164 = !{!165}
!165 = !DISubrange(count: 20)
!166 = !DIExpression()
!167 = !DILocation(line: 49, column: 11, scope: !56)
!168 = !DILocation(line: 50, column: 9, scope: !56)
!169 = !DILocation(line: 53, column: 2, scope: !56)
!170 = !DILocation(line: 61, column: 10, scope: !56)
!171 = !DILocation(line: 59, column: 12, scope: !56)
!172 = !DILocation(line: 76, column: 10, scope: !56)
!173 = !DILocation(line: 77, column: 2, scope: !56)
!174 = !DILocation(line: 84, column: 10, scope: !56)
!175 = !DILocation(line: 64, column: 12, scope: !56)
!176 = !DILocation(line: 91, column: 10, scope: !56)
!177 = !DILocation(line: 91, column: 22, scope: !56)
!178 = !{!179, !180, i64 12}
!179 = !{!"dim_str", !180, i64 0, !180, i64 4, !180, i64 8, !180, i64 12, !183, i64 16, !183, i64 24, !183, i64 32, !183, i64 40, !183, i64 48}
!180 = !{!"int", !181, i64 0}
!181 = !{!"omnipotent char", !182, i64 0}
!182 = !{!"Simple C/C++ TBAA"}
!183 = !{!"long", !181, i64 0}
!184 = !DILocation(line: 94, column: 14, scope: !105)
!185 = !DILocation(line: 94, column: 62, scope: !186)
!186 = !DILexicalBlockFile(scope: !104, file: !1, discriminator: 2)
!187 = !{!179, !180, i64 0}
!188 = !DILocation(line: 94, column: 40, scope: !189)
!189 = !DILexicalBlockFile(scope: !104, file: !1, discriminator: 1)
!190 = !DILocation(line: 94, column: 2, scope: !191)
!191 = !DILexicalBlockFile(scope: !105, file: !1, discriminator: 1)
!192 = !DILocation(line: 96, column: 6, scope: !101)
!193 = distinct !{!193, !194, !195}
!194 = !DILocation(line: 94, column: 2, scope: !105)
!195 = !DILocation(line: 125, column: 2, scope: !105)
!196 = !DILocation(line: 96, column: 6, scope: !197)
!197 = !DILexicalBlockFile(scope: !101, file: !1, discriminator: 12)
!198 = !{!199, !199, i64 0}
!199 = !{!"any pointer", !181, i64 0}
!200 = !DILocation(line: 96, column: 47, scope: !201)
!201 = !DILexicalBlockFile(scope: !102, file: !1, discriminator: 13)
!202 = !DILocation(line: 96, column: 6, scope: !203)
!203 = !DILexicalBlockFile(scope: !103, file: !1, discriminator: 13)
!204 = !DILocation(line: 98, column: 28, scope: !205)
!205 = distinct !DILexicalBlock(scope: !206, file: !1, line: 98, column: 7)
!206 = distinct !DILexicalBlock(scope: !102, file: !1, line: 96, column: 51)
!207 = !DILocation(line: 100, column: 18, scope: !208)
!208 = distinct !DILexicalBlock(scope: !209, file: !1, line: 100, column: 8)
!209 = distinct !DILexicalBlock(scope: !205, file: !1, line: 98, column: 31)
!210 = !DILocation(line: 100, column: 8, scope: !208)
!211 = !DILocation(line: 100, column: 42, scope: !208)
!212 = !DILocation(line: 100, column: 8, scope: !209)
!213 = !DILocation(line: 101, column: 33, scope: !214)
!214 = distinct !DILexicalBlock(scope: !208, file: !1, line: 100, column: 46)
!215 = !DILocalVariable(name: "__nptr", arg: 1, scope: !216, file: !217, line: 278, type: !12)
!216 = distinct !DISubprogram(name: "atoi", scope: !217, file: !217, line: 278, type: !218, isLocal: false, isDefinition: true, scopeLine: 279, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !220)
!217 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/lavaMDllvm")
!218 = !DISubroutineType(types: !219)
!219 = !{!21, !12}
!220 = !{!215}
!221 = !DILocation(line: 278, column: 1, scope: !216, inlinedAt: !222)
!222 = distinct !DILocation(line: 101, column: 28, scope: !214)
!223 = !DILocation(line: 280, column: 16, scope: !216, inlinedAt: !222)
!224 = !DILocation(line: 280, column: 10, scope: !216, inlinedAt: !222)
!225 = !DILocation(line: 101, column: 26, scope: !214)
!226 = !DILocation(line: 102, column: 28, scope: !227)
!227 = distinct !DILexicalBlock(scope: !214, file: !1, line: 102, column: 9)
!228 = !DILocation(line: 102, column: 9, scope: !214)
!229 = !DILocation(line: 103, column: 7, scope: !230)
!230 = distinct !DILexicalBlock(scope: !227, file: !1, line: 102, column: 31)
!231 = !DILocation(line: 104, column: 7, scope: !230)
!232 = !DILocation(line: 110, column: 6, scope: !233)
!233 = distinct !DILexicalBlock(scope: !208, file: !1, line: 109, column: 9)
!234 = !DILocation(line: 111, column: 6, scope: !233)
!235 = !DILocation(line: 122, column: 4, scope: !236)
!236 = distinct !DILexicalBlock(scope: !102, file: !1, line: 121, column: 7)
!237 = !DILocation(line: 123, column: 4, scope: !236)
!238 = !DILocation(line: 128, column: 2, scope: !56)
!239 = !DILocation(line: 172, column: 21, scope: !240)
!240 = !DILexicalBlockFile(scope: !241, file: !1, discriminator: 1)
!241 = distinct !DILexicalBlock(scope: !242, file: !1, line: 172, column: 2)
!242 = distinct !DILexicalBlock(scope: !56, file: !1, line: 172, column: 2)
!243 = !DILocation(line: 130, column: 10, scope: !56)
!244 = !DILocation(line: 65, column: 12, scope: !56)
!245 = !DILocation(line: 138, column: 10, scope: !56)
!246 = !DILocation(line: 66, column: 12, scope: !56)
!247 = !DILocation(line: 145, column: 45, scope: !56)
!248 = !DILocation(line: 145, column: 67, scope: !56)
!249 = !DILocation(line: 145, column: 25, scope: !56)
!250 = !DILocation(line: 145, column: 10, scope: !56)
!251 = !DILocation(line: 145, column: 23, scope: !56)
!252 = !{!179, !183, i64 16}
!253 = !DILocation(line: 148, column: 44, scope: !56)
!254 = !DILocation(line: 148, column: 10, scope: !56)
!255 = !DILocation(line: 148, column: 21, scope: !56)
!256 = !{!179, !183, i64 32}
!257 = !DILocation(line: 149, column: 41, scope: !56)
!258 = !DILocation(line: 149, column: 10, scope: !56)
!259 = !DILocation(line: 149, column: 20, scope: !56)
!260 = !{!179, !183, i64 40}
!261 = !DILocation(line: 150, column: 42, scope: !56)
!262 = !DILocation(line: 150, column: 10, scope: !56)
!263 = !DILocation(line: 150, column: 21, scope: !56)
!264 = !{!179, !183, i64 48}
!265 = !DILocation(line: 153, column: 41, scope: !56)
!266 = !DILocation(line: 153, column: 10, scope: !56)
!267 = !DILocation(line: 153, column: 18, scope: !56)
!268 = !{!179, !183, i64 24}
!269 = !DILocation(line: 155, column: 10, scope: !56)
!270 = !DILocation(line: 67, column: 12, scope: !56)
!271 = !DILocation(line: 166, column: 22, scope: !56)
!272 = !DILocation(line: 166, column: 12, scope: !56)
!273 = !DILocation(line: 78, column: 11, scope: !56)
!274 = !DILocation(line: 82, column: 6, scope: !56)
!275 = !DILocation(line: 73, column: 6, scope: !56)
!276 = !DILocation(line: 172, column: 12, scope: !240)
!277 = !DILocation(line: 172, column: 2, scope: !278)
!278 = !DILexicalBlockFile(scope: !242, file: !1, discriminator: 1)
!279 = !DILocation(line: 73, column: 9, scope: !56)
!280 = !DILocation(line: 73, column: 12, scope: !56)
!281 = !DILocation(line: 179, column: 5, scope: !282)
!282 = distinct !DILexicalBlock(scope: !283, file: !1, line: 176, column: 40)
!283 = distinct !DILexicalBlock(scope: !284, file: !1, line: 176, column: 4)
!284 = distinct !DILexicalBlock(scope: !285, file: !1, line: 176, column: 4)
!285 = distinct !DILexicalBlock(scope: !286, file: !1, line: 174, column: 39)
!286 = distinct !DILexicalBlock(scope: !287, file: !1, line: 174, column: 3)
!287 = distinct !DILexicalBlock(scope: !288, file: !1, line: 174, column: 3)
!288 = distinct !DILexicalBlock(scope: !241, file: !1, line: 172, column: 38)
!289 = !DILocation(line: 179, column: 17, scope: !282)
!290 = !DILocation(line: 179, column: 19, scope: !282)
!291 = !{!292, !180, i64 0}
!292 = !{!"box_str", !180, i64 0, !180, i64 4, !180, i64 8, !180, i64 12, !183, i64 16, !180, i64 24, !181, i64 32}
!293 = !DILocation(line: 180, column: 17, scope: !282)
!294 = !DILocation(line: 180, column: 19, scope: !282)
!295 = !{!292, !180, i64 4}
!296 = !DILocation(line: 181, column: 17, scope: !282)
!297 = !DILocation(line: 181, column: 19, scope: !282)
!298 = !{!292, !180, i64 8}
!299 = !DILocation(line: 182, column: 17, scope: !282)
!300 = !DILocation(line: 182, column: 24, scope: !282)
!301 = !{!292, !180, i64 12}
!302 = !DILocation(line: 183, column: 29, scope: !282)
!303 = !DILocation(line: 183, column: 17, scope: !282)
!304 = !DILocation(line: 183, column: 24, scope: !282)
!305 = !{!292, !183, i64 16}
!306 = !DILocation(line: 186, column: 17, scope: !282)
!307 = !DILocation(line: 186, column: 20, scope: !282)
!308 = !{!292, !180, i64 24}
!309 = !DILocation(line: 73, column: 15, scope: !56)
!310 = !DILocation(line: 189, column: 5, scope: !311)
!311 = !DILexicalBlockFile(scope: !312, file: !1, discriminator: 1)
!312 = distinct !DILexicalBlock(scope: !282, file: !1, line: 189, column: 5)
!313 = !DILocation(line: 73, column: 18, scope: !56)
!314 = !DILocation(line: 191, column: 6, scope: !315)
!315 = !DILexicalBlockFile(scope: !316, file: !1, discriminator: 1)
!316 = distinct !DILexicalBlock(scope: !317, file: !1, line: 191, column: 6)
!317 = distinct !DILexicalBlock(scope: !318, file: !1, line: 189, column: 24)
!318 = distinct !DILexicalBlock(scope: !312, file: !1, line: 189, column: 5)
!319 = !DILocation(line: 73, column: 21, scope: !56)
!320 = !DILocation(line: 196, column: 24, scope: !321)
!321 = distinct !DILexicalBlock(scope: !322, file: !1, line: 196, column: 13)
!322 = distinct !DILexicalBlock(scope: !323, file: !1, line: 193, column: 26)
!323 = distinct !DILexicalBlock(scope: !324, file: !1, line: 193, column: 7)
!324 = distinct !DILexicalBlock(scope: !325, file: !1, line: 193, column: 7)
!325 = distinct !DILexicalBlock(scope: !326, file: !1, line: 191, column: 25)
!326 = distinct !DILexicalBlock(scope: !316, file: !1, line: 191, column: 6)
!327 = !DILocation(line: 200, column: 9, scope: !328)
!328 = distinct !DILexicalBlock(scope: !321, file: !1, line: 197, column: 41)
!329 = !DILocation(line: 200, column: 41, scope: !328)
!330 = !DILocation(line: 200, column: 43, scope: !328)
!331 = !{!332, !180, i64 0}
!332 = !{!"nei_str", !180, i64 0, !180, i64 4, !180, i64 8, !180, i64 12, !183, i64 16}
!333 = !DILocation(line: 201, column: 37, scope: !328)
!334 = !DILocation(line: 201, column: 9, scope: !328)
!335 = !DILocation(line: 201, column: 41, scope: !328)
!336 = !DILocation(line: 201, column: 43, scope: !328)
!337 = !{!332, !180, i64 4}
!338 = !DILocation(line: 202, column: 41, scope: !328)
!339 = !DILocation(line: 202, column: 43, scope: !328)
!340 = !{!332, !180, i64 8}
!341 = !DILocation(line: 203, column: 79, scope: !328)
!342 = !DILocation(line: 203, column: 51, scope: !328)
!343 = !DILocation(line: 203, column: 83, scope: !328)
!344 = !DILocation(line: 203, column: 85, scope: !328)
!345 = !DILocation(line: 204, column: 53, scope: !328)
!346 = !DILocation(line: 203, column: 130, scope: !328)
!347 = !DILocation(line: 205, column: 53, scope: !328)
!348 = !DILocation(line: 204, column: 78, scope: !328)
!349 = !DILocation(line: 203, column: 41, scope: !328)
!350 = !DILocation(line: 203, column: 48, scope: !328)
!351 = !{!332, !180, i64 12}
!352 = !DILocation(line: 206, column: 89, scope: !328)
!353 = !DILocation(line: 206, column: 50, scope: !328)
!354 = !DILocation(line: 206, column: 41, scope: !328)
!355 = !DILocation(line: 206, column: 48, scope: !328)
!356 = !{!332, !183, i64 16}
!357 = !DILocation(line: 209, column: 38, scope: !328)
!358 = !DILocation(line: 209, column: 41, scope: !328)
!359 = !DILocation(line: 209, column: 24, scope: !328)
!360 = !DILocation(line: 211, column: 8, scope: !328)
!361 = !DILocation(line: 197, column: 16, scope: !321)
!362 = !DILocation(line: 189, column: 21, scope: !363)
!363 = !DILexicalBlockFile(scope: !318, file: !1, discriminator: 2)
!364 = !DILocation(line: 189, column: 16, scope: !365)
!365 = !DILexicalBlockFile(scope: !318, file: !1, discriminator: 1)
!366 = distinct !{!366, !367, !368}
!367 = !DILocation(line: 189, column: 5, scope: !312)
!368 = !DILocation(line: 215, column: 5, scope: !312)
!369 = !DILocation(line: 218, column: 13, scope: !282)
!370 = !DILocation(line: 176, column: 14, scope: !371)
!371 = !DILexicalBlockFile(scope: !283, file: !1, discriminator: 1)
!372 = !DILocation(line: 176, column: 4, scope: !373)
!373 = !DILexicalBlockFile(scope: !284, file: !1, discriminator: 1)
!374 = distinct !{!374, !375, !376}
!375 = !DILocation(line: 176, column: 4, scope: !284)
!376 = !DILocation(line: 220, column: 4, scope: !284)
!377 = !DILocation(line: 174, column: 36, scope: !378)
!378 = !DILexicalBlockFile(scope: !286, file: !1, discriminator: 2)
!379 = !DILocation(line: 174, column: 13, scope: !380)
!380 = !DILexicalBlockFile(scope: !286, file: !1, discriminator: 1)
!381 = !DILocation(line: 174, column: 3, scope: !382)
!382 = !DILexicalBlockFile(scope: !287, file: !1, discriminator: 1)
!383 = distinct !{!383, !384, !385}
!384 = !DILocation(line: 174, column: 3, scope: !287)
!385 = !DILocation(line: 221, column: 3, scope: !287)
!386 = !DILocation(line: 172, column: 35, scope: !387)
!387 = !DILexicalBlockFile(scope: !241, file: !1, discriminator: 2)
!388 = distinct !{!388, !389, !390}
!389 = !DILocation(line: 172, column: 2, scope: !242)
!390 = !DILocation(line: 222, column: 2, scope: !242)
!391 = !DILocation(line: 230, column: 2, scope: !56)
!392 = !DILocation(line: 233, column: 25, scope: !56)
!393 = !DILocation(line: 233, column: 11, scope: !56)
!394 = !DILocation(line: 79, column: 15, scope: !56)
!395 = !DILocation(line: 234, column: 12, scope: !396)
!396 = !DILexicalBlockFile(scope: !397, file: !1, discriminator: 1)
!397 = distinct !DILexicalBlock(scope: !398, file: !1, line: 234, column: 2)
!398 = distinct !DILexicalBlock(scope: !56, file: !1, line: 234, column: 2)
!399 = !DILocation(line: 234, column: 2, scope: !400)
!400 = !DILexicalBlockFile(scope: !398, file: !1, discriminator: 1)
!401 = !DILocation(line: 235, column: 18, scope: !402)
!402 = distinct !DILexicalBlock(scope: !397, file: !1, line: 234, column: 39)
!403 = !DILocation(line: 242, column: 16, scope: !56)
!404 = !DILocation(line: 242, column: 11, scope: !56)
!405 = !DILocation(line: 80, column: 6, scope: !56)
!406 = !DILocation(line: 243, column: 2, scope: !407)
!407 = !DILexicalBlockFile(scope: !408, file: !1, discriminator: 1)
!408 = distinct !DILexicalBlock(scope: !56, file: !1, line: 243, column: 2)
!409 = !DILocation(line: 235, column: 24, scope: !402)
!410 = !DILocation(line: 235, column: 28, scope: !402)
!411 = !DILocation(line: 235, column: 17, scope: !402)
!412 = !DILocation(line: 235, column: 33, scope: !402)
!413 = !DILocation(line: 235, column: 13, scope: !402)
!414 = !DILocation(line: 235, column: 15, scope: !402)
!415 = !{!416, !417, i64 0}
!416 = !{!"", !417, i64 0, !417, i64 8, !417, i64 16, !417, i64 24}
!417 = !{!"double", !181, i64 0}
!418 = !DILocation(line: 236, column: 18, scope: !402)
!419 = !DILocation(line: 236, column: 24, scope: !402)
!420 = !DILocation(line: 236, column: 28, scope: !402)
!421 = !DILocation(line: 236, column: 17, scope: !402)
!422 = !DILocation(line: 236, column: 33, scope: !402)
!423 = !DILocation(line: 236, column: 13, scope: !402)
!424 = !DILocation(line: 236, column: 15, scope: !402)
!425 = !{!416, !417, i64 8}
!426 = !DILocation(line: 237, column: 18, scope: !402)
!427 = !DILocation(line: 237, column: 24, scope: !402)
!428 = !DILocation(line: 237, column: 28, scope: !402)
!429 = !DILocation(line: 237, column: 17, scope: !402)
!430 = !DILocation(line: 237, column: 33, scope: !402)
!431 = !DILocation(line: 237, column: 13, scope: !402)
!432 = !DILocation(line: 237, column: 15, scope: !402)
!433 = !{!416, !417, i64 16}
!434 = !DILocation(line: 238, column: 18, scope: !402)
!435 = !DILocation(line: 238, column: 24, scope: !402)
!436 = !DILocation(line: 238, column: 28, scope: !402)
!437 = !DILocation(line: 238, column: 17, scope: !402)
!438 = !DILocation(line: 238, column: 33, scope: !402)
!439 = !DILocation(line: 238, column: 13, scope: !402)
!440 = !DILocation(line: 238, column: 15, scope: !402)
!441 = !{!416, !417, i64 24}
!442 = !DILocation(line: 234, column: 36, scope: !443)
!443 = !DILexicalBlockFile(scope: !397, file: !1, discriminator: 2)
!444 = distinct !{!444, !445, !446}
!445 = !DILocation(line: 234, column: 2, scope: !398)
!446 = !DILocation(line: 239, column: 2, scope: !398)
!447 = !DILocation(line: 244, column: 16, scope: !448)
!448 = distinct !DILexicalBlock(scope: !449, file: !1, line: 243, column: 39)
!449 = distinct !DILexicalBlock(scope: !408, file: !1, line: 243, column: 2)
!450 = !DILocation(line: 244, column: 22, scope: !448)
!451 = !DILocation(line: 244, column: 26, scope: !448)
!452 = !DILocation(line: 244, column: 15, scope: !448)
!453 = !DILocation(line: 244, column: 31, scope: !448)
!454 = !DILocation(line: 244, column: 3, scope: !448)
!455 = !DILocation(line: 244, column: 13, scope: !448)
!456 = !{!417, !417, i64 0}
!457 = !DILocation(line: 243, column: 36, scope: !458)
!458 = !DILexicalBlockFile(scope: !449, file: !1, discriminator: 2)
!459 = !DILocation(line: 243, column: 12, scope: !460)
!460 = !DILexicalBlockFile(scope: !449, file: !1, discriminator: 1)
!461 = distinct !{!461, !462, !463}
!462 = !DILocation(line: 243, column: 2, scope: !408)
!463 = !DILocation(line: 245, column: 2, scope: !408)
!464 = !DILocation(line: 248, column: 25, scope: !56)
!465 = !DILocation(line: 248, column: 11, scope: !56)
!466 = !DILocation(line: 81, column: 15, scope: !56)
!467 = !DILocation(line: 249, column: 2, scope: !468)
!468 = !DILexicalBlockFile(scope: !469, file: !1, discriminator: 1)
!469 = distinct !DILexicalBlock(scope: !56, file: !1, line: 249, column: 2)
!470 = !DILocation(line: 250, column: 13, scope: !471)
!471 = distinct !DILexicalBlock(scope: !472, file: !1, line: 249, column: 39)
!472 = distinct !DILexicalBlock(scope: !469, file: !1, line: 249, column: 2)
!473 = !DILocation(line: 250, column: 15, scope: !471)
!474 = !DILocation(line: 256, column: 10, scope: !56)
!475 = !DILocation(line: 68, column: 12, scope: !56)
!476 = !DIExpression(DW_OP_deref)
!477 = !DILocation(line: 77, column: 10, scope: !56)
!478 = !DILocation(line: 266, column: 2, scope: !56)
!479 = !DILocation(line: 273, column: 10, scope: !56)
!480 = !DILocation(line: 69, column: 12, scope: !56)
!481 = !DILocation(line: 282, column: 9, scope: !56)
!482 = !DILocation(line: 281, column: 15, scope: !56)
!483 = !DILocation(line: 283, column: 21, scope: !484)
!484 = !DILexicalBlockFile(scope: !485, file: !1, discriminator: 1)
!485 = distinct !DILexicalBlock(scope: !486, file: !1, line: 283, column: 2)
!486 = distinct !DILexicalBlock(scope: !56, file: !1, line: 283, column: 2)
!487 = !DILocation(line: 283, column: 12, scope: !484)
!488 = !DILocation(line: 283, column: 2, scope: !489)
!489 = !DILexicalBlockFile(scope: !486, file: !1, discriminator: 1)
!490 = !DILocation(line: 284, column: 54, scope: !491)
!491 = distinct !DILexicalBlock(scope: !485, file: !1, line: 283, column: 39)
!492 = !DILocation(line: 284, column: 67, scope: !491)
!493 = !DILocation(line: 284, column: 80, scope: !491)
!494 = !DILocation(line: 284, column: 93, scope: !491)
!495 = !DILocation(line: 284, column: 10, scope: !491)
!496 = !DILocation(line: 283, column: 36, scope: !497)
!497 = !DILexicalBlockFile(scope: !485, file: !1, discriminator: 2)
!498 = distinct !{!498, !499, !500}
!499 = !DILocation(line: 283, column: 2, scope: !486)
!500 = !DILocation(line: 285, column: 2, scope: !486)
!501 = !DILocation(line: 286, column: 2, scope: !56)
!502 = !DILocation(line: 291, column: 2, scope: !56)
!503 = !DILocation(line: 292, column: 2, scope: !56)
!504 = !DILocation(line: 293, column: 2, scope: !56)
!505 = !DILocation(line: 294, column: 2, scope: !56)
!506 = !DILocation(line: 296, column: 10, scope: !56)
!507 = !DILocation(line: 70, column: 12, scope: !56)
!508 = !DILocation(line: 323, column: 1, scope: !56)
!509 = !DILocation(line: 323, column: 1, scope: !510)
!510 = !DILexicalBlockFile(scope: !56, file: !1, discriminator: 1)
!511 = !DILocation(line: 196, column: 85, scope: !512)
!512 = !DILexicalBlockFile(scope: !321, file: !1, discriminator: 4)
!513 = !DILocation(line: 191, column: 22, scope: !514)
!514 = !DILexicalBlockFile(scope: !326, file: !1, discriminator: 2)
!515 = !DILocation(line: 191, column: 17, scope: !516)
!516 = !DILexicalBlockFile(scope: !326, file: !1, discriminator: 1)
!517 = distinct !{!517, !518, !519}
!518 = !DILocation(line: 191, column: 6, scope: !316)
!519 = !DILocation(line: 214, column: 6, scope: !316)
