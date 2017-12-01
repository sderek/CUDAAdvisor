; ModuleID = 'nn_cuda.cu'
source_filename = "nn_cuda.cu"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }
%struct.latLong = type { float, float }
%"class.std::vector" = type { %"struct.std::_Vector_base" }
%"struct.std::_Vector_base" = type { %"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl" }
%"struct.std::_Vector_base<record, std::allocator<record> >::_Vector_impl" = type { %struct.record*, %struct.record*, %struct.record* }
%struct.record = type { [53 x i8], float }
%"class.std::vector.0" = type { %"struct.std::_Vector_base.1" }
%"struct.std::_Vector_base.1" = type { %"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl" }
%"struct.std::_Vector_base<latLong, std::allocator<latLong> >::_Vector_impl" = type { %struct.latLong*, %struct.latLong*, %struct.latLong* }
%struct.cudaDeviceProp = type { [256 x i8], i64, i64, i32, i32, i64, i32, [3 x i32], [3 x i32], i32, i64, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, [2 x i32], [2 x i32], [3 x i32], [2 x i32], [3 x i32], [3 x i32], i32, [2 x i32], [3 x i32], [2 x i32], i32, [2 x i32], [3 x i32], [2 x i32], [3 x i32], i32, [2 x i32], i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i32, i32, i32, i32 }
%struct.dim3 = type { i32, i32, i32 }
%struct.CUstream_st = type opaque
%"class.__gnu_cxx::__normal_iterator" = type { %struct.latLong* }
%"class.__gnu_cxx::__normal_iterator.5" = type { %struct.record* }

$_ZNSt6vectorI7latLongSaIS0_EE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_ = comdat any

$_ZNSt6vectorI6recordSaIS0_EE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_ = comdat any

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [25 x i8] c"Error: Input too large.\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"%s --> Distance=%f\0A\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.5 = private unnamed_addr constant [24 x i8] c"error reading filelist\0A\00", align 1
@str = private unnamed_addr constant [23 x i8] c"Nearest Neighbor Usage\00"
@str.25 = private unnamed_addr constant [89 x i8] c"nearestNeighbor [filename] -r [int] -lat [float] -lng [float] [-hqt] [-p [int] -d [int]]\00"
@str.26 = private unnamed_addr constant [9 x i8] c"example:\00"
@str.27 = private unnamed_addr constant [54 x i8] c"$ ./nearestNeighbor filelist.txt -r 5 -lat 30 -lng 90\00"
@str.28 = private unnamed_addr constant [58 x i8] c"filename     the filename that lists the data input files\00"
@str.29 = private unnamed_addr constant [59 x i8] c"-r [int]     the number of records to return (default: 10)\00"
@str.30 = private unnamed_addr constant [61 x i8] c"-lat [float] the latitude for nearest neighbors (default: 0)\00"
@str.31 = private unnamed_addr constant [62 x i8] c"-lng [float] the longitude for nearest neighbors (default: 0)\00"
@str.32 = private unnamed_addr constant [35 x i8] c"-h, --help   Display the help file\00"
@str.33 = private unnamed_addr constant [51 x i8] c"-q           Quiet mode. Suppress all text output.\00"
@str.34 = private unnamed_addr constant [39 x i8] c"-t           Print timing information.\00"
@str.35 = private unnamed_addr constant [72 x i8] c"-p [int]     Choose the platform (must choose both platform and device)\00"
@str.36 = private unnamed_addr constant [70 x i8] c"-d [int]     Choose the device (must choose both platform and device)\00"
@str.37 = private unnamed_addr constant [59 x i8] c"Notes: 1. The filename is required as the first parameter.\00"
@str.38 = private unnamed_addr constant [60 x i8] c"       2. If you declare either the device or the platform,\00"
@str.39 = private unnamed_addr constant [34 x i8] c"          you must declare both.\0A\00"
@str.40 = private unnamed_addr constant [19 x i8] c"error opening a db\00"

; Function Attrs: nounwind uwtable
define double @_Z8get_timev() local_unnamed_addr #0 !dbg !1315 {
entry:
  %time = alloca %struct.timeval, align 8
  %0 = bitcast %struct.timeval* %time to i8*, !dbg !1328
  call void @llvm.lifetime.start(i64 16, i8* nonnull %0) #11, !dbg !1328
  tail call void @llvm.dbg.value(metadata %struct.timeval* %time, i64 0, metadata !1319, metadata !1329), !dbg !1330
  %call = call i32 @gettimeofday(%struct.timeval* nonnull %time, %struct.timezone* null) #11, !dbg !1331
  %tobool = icmp eq i32 %call, 0, !dbg !1331
  br i1 %tobool, label %if.end, label %cleanup, !dbg !1333

if.end:                                           ; preds = %entry
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %time, i64 0, i32 0, !dbg !1334
  %1 = load i64, i64* %tv_sec, align 8, !dbg !1334, !tbaa !1335
  %conv = sitofp i64 %1 to double, !dbg !1340
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %time, i64 0, i32 1, !dbg !1341
  %2 = load i64, i64* %tv_usec, align 8, !dbg !1341, !tbaa !1342
  %conv1 = sitofp i64 %2 to double, !dbg !1343
  %mul = fmul double %conv1, 1.000000e-06, !dbg !1344
  %add = fadd double %mul, %conv, !dbg !1345
  br label %cleanup, !dbg !1346

cleanup:                                          ; preds = %entry, %if.end
  %retval.0 = phi double [ %add, %if.end ], [ 0.000000e+00, %entry ]
  call void @llvm.lifetime.end(i64 16, i8* nonnull %0) #11, !dbg !1347
  ret double %retval.0, !dbg !1347
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: nounwind
declare i32 @gettimeofday(%struct.timeval* nocapture, %struct.timezone* nocapture) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: uwtable
define void @_Z6euclidP7latLongPfiff(%struct.latLong* %d_locations, float* %d_distances, i32 %numRecords, float %lat, float %lng) #4 !dbg !1348 {
entry:
  %d_locations.addr = alloca %struct.latLong*, align 8
  %d_distances.addr = alloca float*, align 8
  %numRecords.addr = alloca i32, align 4
  %lat.addr = alloca float, align 4
  %lng.addr = alloca float, align 4
  tail call void @llvm.dbg.value(metadata %struct.latLong* %d_locations, i64 0, metadata !1354, metadata !1359), !dbg !1360
  store %struct.latLong* %d_locations, %struct.latLong** %d_locations.addr, align 8, !tbaa !1361
  tail call void @llvm.dbg.value(metadata float* %d_distances, i64 0, metadata !1355, metadata !1359), !dbg !1363
  store float* %d_distances, float** %d_distances.addr, align 8, !tbaa !1361
  tail call void @llvm.dbg.value(metadata i32 %numRecords, i64 0, metadata !1356, metadata !1359), !dbg !1364
  store i32 %numRecords, i32* %numRecords.addr, align 4, !tbaa !1365
  tail call void @llvm.dbg.value(metadata float %lat, i64 0, metadata !1357, metadata !1359), !dbg !1367
  store float %lat, float* %lat.addr, align 4, !tbaa !1368
  tail call void @llvm.dbg.value(metadata float %lng, i64 0, metadata !1358, metadata !1359), !dbg !1370
  store float %lng, float* %lng.addr, align 4, !tbaa !1368
  %0 = bitcast %struct.latLong** %d_locations.addr to i8*, !dbg !1371
  %1 = call i32 @cudaSetupArgument(i8* nonnull %0, i64 8, i64 0), !dbg !1371
  %2 = icmp eq i32 %1, 0, !dbg !1371
  br i1 %2, label %setup.next, label %setup.end, !dbg !1371

setup.next:                                       ; preds = %entry
  %3 = bitcast float** %d_distances.addr to i8*, !dbg !1372
  %4 = call i32 @cudaSetupArgument(i8* nonnull %3, i64 8, i64 8), !dbg !1372
  %5 = icmp eq i32 %4, 0, !dbg !1372
  br i1 %5, label %setup.next1, label %setup.end, !dbg !1372

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast i32* %numRecords.addr to i8*, !dbg !1374
  %7 = call i32 @cudaSetupArgument(i8* nonnull %6, i64 4, i64 16), !dbg !1374
  %8 = icmp eq i32 %7, 0, !dbg !1374
  br i1 %8, label %setup.next2, label %setup.end, !dbg !1374

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast float* %lat.addr to i8*, !dbg !1376
  %10 = call i32 @cudaSetupArgument(i8* nonnull %9, i64 4, i64 20), !dbg !1376
  %11 = icmp eq i32 %10, 0, !dbg !1376
  br i1 %11, label %setup.next3, label %setup.end, !dbg !1376

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast float* %lng.addr to i8*, !dbg !1378
  %13 = call i32 @cudaSetupArgument(i8* nonnull %12, i64 4, i64 24), !dbg !1378
  %14 = icmp eq i32 %13, 0, !dbg !1378
  br i1 %14, label %setup.next4, label %setup.end, !dbg !1378

setup.next4:                                      ; preds = %setup.next3
  %15 = call i32 @cudaLaunch(i8* bitcast (void (%struct.latLong*, float*, i32, float, float)* @_Z6euclidP7latLongPfiff to i8*)), !dbg !1380
  br label %setup.end, !dbg !1380

setup.end:                                        ; preds = %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !1382
}

declare i32 @cudaSetupArgument(i8*, i64, i64) local_unnamed_addr

declare i32 @cudaLaunch(i8*) local_unnamed_addr

; Function Attrs: norecurse uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #5 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) !dbg !1383 {
invoke.cont:
  %time.i212 = alloca %struct.timeval, align 8
  %time.i = alloca %struct.timeval, align 8
  %lat = alloca float, align 4
  %lng = alloca float, align 4
  %quiet = alloca i32, align 4
  %timing = alloca i32, align 4
  %platform = alloca i32, align 4
  %device = alloca i32, align 4
  %records = alloca %"class.std::vector", align 8
  %locations = alloca %"class.std::vector.0", align 8
  %filename = alloca [100 x i8], align 16
  %resultsCount = alloca i32, align 4
  %d_locations = alloca %struct.latLong*, align 8
  %d_distances = alloca float*, align 8
  %deviceProp = alloca %struct.cudaDeviceProp, align 8
  %totalDeviceMemory = alloca i64, align 8
  %freeDeviceMemory = alloca i64, align 8
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !1387, metadata !1359), !dbg !1516
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !1388, metadata !1359), !dbg !1517
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !1389, metadata !1359), !dbg !1518
  %0 = bitcast float* %lat to i8*, !dbg !1519
  call void @llvm.lifetime.start(i64 4, i8* nonnull %0) #11, !dbg !1519
  %1 = bitcast float* %lng to i8*, !dbg !1519
  call void @llvm.lifetime.start(i64 4, i8* nonnull %1) #11, !dbg !1519
  %2 = bitcast i32* %quiet to i8*, !dbg !1520
  call void @llvm.lifetime.start(i64 4, i8* nonnull %2) #11, !dbg !1520
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !1392, metadata !1359), !dbg !1521
  store i32 0, i32* %quiet, align 4, !dbg !1521, !tbaa !1365
  %3 = bitcast i32* %timing to i8*, !dbg !1520
  call void @llvm.lifetime.start(i64 4, i8* nonnull %3) #11, !dbg !1520
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !1393, metadata !1359), !dbg !1522
  store i32 0, i32* %timing, align 4, !dbg !1522, !tbaa !1365
  %4 = bitcast i32* %platform to i8*, !dbg !1520
  call void @llvm.lifetime.start(i64 4, i8* nonnull %4) #11, !dbg !1520
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !1394, metadata !1359), !dbg !1523
  store i32 0, i32* %platform, align 4, !dbg !1523, !tbaa !1365
  %5 = bitcast i32* %device to i8*, !dbg !1520
  call void @llvm.lifetime.start(i64 4, i8* nonnull %5) #11, !dbg !1520
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !1395, metadata !1359), !dbg !1524
  store i32 0, i32* %device, align 4, !dbg !1524, !tbaa !1365
  %6 = bitcast %"class.std::vector"* %records to i8*, !dbg !1525
  call void @llvm.lifetime.start(i64 24, i8* nonnull %6) #11, !dbg !1525
  tail call void @llvm.dbg.value(metadata %"class.std::vector"* %records, i64 0, metadata !1396, metadata !1329), !dbg !1526
  tail call void @llvm.dbg.value(metadata %"class.std::vector"* %records, i64 0, metadata !1527, metadata !1359), !dbg !1531
  call void @llvm.memset.p0i8.i64(i8* nonnull %6, i8 0, i64 24, i32 8, i1 false) #11, !dbg !1533
  %7 = bitcast %"class.std::vector.0"* %locations to i8*, !dbg !1544
  call void @llvm.lifetime.start(i64 24, i8* nonnull %7) #11, !dbg !1544
  tail call void @llvm.dbg.value(metadata %"class.std::vector.0"* %locations, i64 0, metadata !1545, metadata !1359), !dbg !1549
  call void @llvm.memset.p0i8.i64(i8* nonnull %7, i8 0, i64 24, i32 8, i1 false) #11, !dbg !1551
  %8 = getelementptr inbounds [100 x i8], [100 x i8]* %filename, i64 0, i64 0, !dbg !1562
  call void @llvm.lifetime.start(i64 100, i8* nonnull %8) #11, !dbg !1562
  tail call void @llvm.dbg.declare(metadata [100 x i8]* %filename, metadata !1398, metadata !1359), !dbg !1563
  %9 = bitcast i32* %resultsCount to i8*, !dbg !1564
  call void @llvm.lifetime.start(i64 4, i8* nonnull %9) #11, !dbg !1564
  tail call void @llvm.dbg.value(metadata i32 10, i64 0, metadata !1402, metadata !1359), !dbg !1565
  store i32 10, i32* %resultsCount, align 4, !dbg !1565, !tbaa !1365
  tail call void @llvm.dbg.value(metadata float* %lat, i64 0, metadata !1390, metadata !1329), !dbg !1566
  tail call void @llvm.dbg.value(metadata float* %lng, i64 0, metadata !1391, metadata !1329), !dbg !1567
  tail call void @llvm.dbg.value(metadata i32* %quiet, i64 0, metadata !1392, metadata !1329), !dbg !1521
  tail call void @llvm.dbg.value(metadata i32* %timing, i64 0, metadata !1393, metadata !1329), !dbg !1522
  tail call void @llvm.dbg.value(metadata i32* %platform, i64 0, metadata !1394, metadata !1329), !dbg !1523
  tail call void @llvm.dbg.value(metadata i32* %device, i64 0, metadata !1395, metadata !1329), !dbg !1524
  tail call void @llvm.dbg.value(metadata i32* %resultsCount, i64 0, metadata !1402, metadata !1329), !dbg !1565
  %call = call i32 @_Z16parseCommandlineiPPcS_PiPfS2_S1_S1_S1_S1_(i32 %argc, i8** %argv, i8* nonnull %8, i32* nonnull %resultsCount, float* nonnull %lat, float* nonnull %lng, i32* nonnull %quiet, i32* nonnull %timing, i32* nonnull %platform, i32* nonnull %device), !dbg !1568
  %tobool = icmp eq i32 %call, 0, !dbg !1570
  br i1 %tobool, label %if.end, label %if.then, !dbg !1572

if.then:                                          ; preds = %invoke.cont
  invoke void @_Z10printUsagev()
          to label %cleanup unwind label %lpad1, !dbg !1574

lpad1:                                            ; preds = %if.end, %if.then
  %10 = landingpad { i8*, i32 }
          cleanup, !dbg !1576
  %11 = extractvalue { i8*, i32 } %10, 0, !dbg !1576
  %12 = extractvalue { i8*, i32 } %10, 1, !dbg !1576
  br label %ehcleanup118, !dbg !1576

if.end:                                           ; preds = %invoke.cont
  %call6 = invoke i32 @_Z8loadDataPcRSt6vectorI6recordSaIS1_EERS0_I7latLongSaIS5_EE(i8* nonnull %8, %"class.std::vector"* nonnull dereferenceable(24) %records, %"class.std::vector.0"* nonnull dereferenceable(24) %locations)
          to label %invoke.cont5 unwind label %lpad1, !dbg !1577

invoke.cont5:                                     ; preds = %if.end
  call void @llvm.dbg.value(metadata i32 %call6, i64 0, metadata !1403, metadata !1359), !dbg !1578
  %13 = load i32, i32* %resultsCount, align 4, !dbg !1579, !tbaa !1365
  call void @llvm.dbg.value(metadata i32 %13, i64 0, metadata !1402, metadata !1359), !dbg !1565
  %cmp = icmp sgt i32 %13, %call6, !dbg !1581
  br i1 %cmp, label %if.then7, label %if.end8, !dbg !1582

if.then7:                                         ; preds = %invoke.cont5
  call void @llvm.dbg.value(metadata i32 %call6, i64 0, metadata !1402, metadata !1359), !dbg !1565
  store i32 %call6, i32* %resultsCount, align 4, !dbg !1583, !tbaa !1365
  br label %if.end8, !dbg !1585

if.end8:                                          ; preds = %if.then7, %invoke.cont5
  %14 = phi i32 [ %call6, %if.then7 ], [ %13, %invoke.cont5 ]
  %15 = bitcast %struct.latLong** %d_locations to i8*, !dbg !1586
  call void @llvm.lifetime.start(i64 8, i8* nonnull %15) #11, !dbg !1586
  %16 = bitcast float** %d_distances to i8*, !dbg !1587
  call void @llvm.lifetime.start(i64 8, i8* nonnull %16) #11, !dbg !1587
  %17 = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %deviceProp, i64 0, i32 0, i64 0, !dbg !1588
  call void @llvm.lifetime.start(i64 632, i8* nonnull %17) #11, !dbg !1588
  %call11 = invoke i32 @cudaGetDeviceProperties(%struct.cudaDeviceProp* nonnull %deviceProp, i32 0)
          to label %invoke.cont10 unwind label %lpad9, !dbg !1589

invoke.cont10:                                    ; preds = %if.end8
  %call13 = invoke i32 @cudaThreadSynchronize()
          to label %invoke.cont12 unwind label %lpad9, !dbg !1590

invoke.cont12:                                    ; preds = %invoke.cont10
  %arrayidx = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %deviceProp, i64 0, i32 8, i64 0, !dbg !1591
  %18 = load i32, i32* %arrayidx, align 8, !dbg !1591, !tbaa !1365
  %conv = sext i32 %18 to i64, !dbg !1591
  call void @llvm.dbg.value(metadata i64 %conv, i64 0, metadata !1481, metadata !1359), !dbg !1592
  %maxThreadsPerBlock = getelementptr inbounds %struct.cudaDeviceProp, %struct.cudaDeviceProp* %deviceProp, i64 0, i32 6, !dbg !1593
  %19 = load i32, i32* %maxThreadsPerBlock, align 8, !dbg !1593, !tbaa !1594
  %20 = icmp slt i32 %19, 256, !dbg !1593
  %cond = select i1 %20, i32 %19, i32 256, !dbg !1593
  %conv16 = sext i32 %cond to i64, !dbg !1596
  call void @llvm.dbg.value(metadata i64 %conv16, i64 0, metadata !1482, metadata !1359), !dbg !1598
  %21 = bitcast i64* %totalDeviceMemory to i8*, !dbg !1599
  call void @llvm.lifetime.start(i64 8, i8* nonnull %21) #11, !dbg !1599
  %22 = bitcast i64* %freeDeviceMemory to i8*, !dbg !1600
  call void @llvm.lifetime.start(i64 8, i8* nonnull %22) #11, !dbg !1600
  %call19 = invoke i32 @cudaMemGetInfo(i64* nonnull %freeDeviceMemory, i64* nonnull %totalDeviceMemory)
          to label %invoke.cont18 unwind label %lpad17, !dbg !1601

invoke.cont18:                                    ; preds = %invoke.cont12
  %call21 = invoke i32 @cudaThreadSynchronize()
          to label %invoke.cont20 unwind label %lpad17, !dbg !1602

invoke.cont20:                                    ; preds = %invoke.cont18
  %23 = load i64, i64* %freeDeviceMemory, align 8, !dbg !1603, !tbaa !1604
  call void @llvm.dbg.value(metadata i64 %23, i64 0, metadata !1484, metadata !1359), !dbg !1605
  %mul = mul i64 %23, 85, !dbg !1606
  %div22 = udiv i64 %mul, 1200, !dbg !1607
  call void @llvm.dbg.value(metadata i64 %div22, i64 0, metadata !1486, metadata !1359), !dbg !1608
  %conv23 = sext i32 %call6 to i64, !dbg !1609
  %cmp24 = icmp ult i64 %div22, %conv23, !dbg !1611
  br i1 %cmp24, label %if.then25, label %if.end29, !dbg !1612

if.then25:                                        ; preds = %invoke.cont20
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1613, !tbaa !1361
  %25 = call i64 @fwrite(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str, i64 0, i64 0), i64 24, i64 1, %struct._IO_FILE* %24) #12, !dbg !1615
  call void @exit(i32 1) #13, !dbg !1616
  unreachable, !dbg !1616

lpad9:                                            ; preds = %invoke.cont10, %if.end8
  %26 = landingpad { i8*, i32 }
          cleanup, !dbg !1617
  %27 = extractvalue { i8*, i32 } %26, 0, !dbg !1617
  %28 = extractvalue { i8*, i32 } %26, 1, !dbg !1617
  br label %ehcleanup113, !dbg !1617

lpad17:                                           ; preds = %invoke.cont18, %invoke.cont12
  %29 = landingpad { i8*, i32 }
          cleanup, !dbg !1619
  br label %ehcleanup109, !dbg !1619

if.end29:                                         ; preds = %invoke.cont20
  %add = add nsw i64 %conv23, -1, !dbg !1620
  %sub = add nsw i64 %add, %conv16, !dbg !1620
  %div31 = udiv i64 %sub, %conv16, !dbg !1620
  call void @llvm.dbg.value(metadata i64 %div31, i64 0, metadata !1487, metadata !1359), !dbg !1621
  %add32 = add nsw i64 %conv, -1, !dbg !1622
  %sub33 = add i64 %add32, %div31, !dbg !1622
  %div34 = udiv i64 %sub33, %conv, !dbg !1622
  call void @llvm.dbg.value(metadata i64 %div34, i64 0, metadata !1488, metadata !1359), !dbg !1623
  %add35 = add i64 %div31, -1, !dbg !1624
  %sub36 = add i64 %add35, %div34, !dbg !1624
  %div37 = udiv i64 %sub36, %div34, !dbg !1624
  call void @llvm.dbg.value(metadata i64 %div37, i64 0, metadata !1489, metadata !1359), !dbg !1625
  call void @llvm.dbg.value(metadata %struct.dim3* undef, i64 0, metadata !1490, metadata !1329), !dbg !1626
  tail call void @llvm.dbg.value(metadata %struct.dim3* undef, i64 0, metadata !1627, metadata !1359), !dbg !1634
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !1632, metadata !1359), !dbg !1636
  %mul43 = shl nsw i64 %conv23, 2, !dbg !1637
  %call44 = call noalias i8* @malloc(i64 %mul43) #11, !dbg !1638
  %30 = bitcast i8* %call44 to float*, !dbg !1639
  call void @llvm.dbg.value(metadata float* %30, i64 0, metadata !1404, metadata !1359), !dbg !1640
  %31 = bitcast %struct.latLong** %d_locations to i8**, !dbg !1641
  %mul46 = shl nsw i64 %conv23, 3, !dbg !1642
  %call49 = invoke i32 @cudaMalloc(i8** nonnull %31, i64 %mul46)
          to label %invoke.cont48 unwind label %lpad47, !dbg !1643

invoke.cont48:                                    ; preds = %if.end29
  %32 = bitcast float** %d_distances to i8**, !dbg !1644
  %call53 = invoke i32 @cudaMalloc(i8** nonnull %32, i64 %mul43)
          to label %invoke.cont52 unwind label %lpad47, !dbg !1645

invoke.cont52:                                    ; preds = %invoke.cont48
  %33 = load i8*, i8** %31, align 8, !dbg !1646, !tbaa !1361
  call void @llvm.dbg.value(metadata %"class.std::vector.0"* %locations, i64 0, metadata !1397, metadata !1329), !dbg !1647
  tail call void @llvm.dbg.value(metadata %"class.std::vector.0"* %locations, i64 0, metadata !1648, metadata !1359), !dbg !1652
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !1651, metadata !1359), !dbg !1654
  %34 = bitcast %"class.std::vector.0"* %locations to i8**, !dbg !1655
  %35 = load i8*, i8** %34, align 8, !dbg !1655, !tbaa !1656
  %call59 = invoke i32 @cudaMemcpy(i8* %33, i8* %35, i64 %mul46, i32 1)
          to label %invoke.cont58 unwind label %lpad47, !dbg !1659

invoke.cont58:                                    ; preds = %invoke.cont52
  %call61 = invoke i32 @cudaThreadSynchronize()
          to label %invoke.cont60 unwind label %lpad47, !dbg !1660

invoke.cont60:                                    ; preds = %invoke.cont58
  %36 = bitcast %struct.timeval* %time.i to i8*, !dbg !1661
  call void @llvm.lifetime.start(i64 16, i8* nonnull %36) #11, !dbg !1661
  call void @llvm.dbg.value(metadata %struct.timeval* %time.i, i64 0, metadata !1319, metadata !1329) #11, !dbg !1663
  %call.i = call i32 @gettimeofday(%struct.timeval* nonnull %time.i, %struct.timezone* null) #11, !dbg !1664
  %tobool.i = icmp eq i32 %call.i, 0, !dbg !1664
  br i1 %tobool.i, label %if.end.i, label %_Z8get_timev.exit, !dbg !1665

if.end.i:                                         ; preds = %invoke.cont60
  %tv_sec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %time.i, i64 0, i32 0, !dbg !1666
  %37 = load i64, i64* %tv_sec.i, align 8, !dbg !1666, !tbaa !1335
  %conv.i = sitofp i64 %37 to double, !dbg !1667
  %tv_usec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %time.i, i64 0, i32 1, !dbg !1668
  %38 = load i64, i64* %tv_usec.i, align 8, !dbg !1668, !tbaa !1342
  %conv1.i = sitofp i64 %38 to double, !dbg !1669
  %mul.i = fmul double %conv1.i, 1.000000e-06, !dbg !1670
  %add.i = fadd double %mul.i, %conv.i, !dbg !1671
  br label %_Z8get_timev.exit, !dbg !1672

_Z8get_timev.exit:                                ; preds = %invoke.cont60, %if.end.i
  %retval.0.i = phi double [ %add.i, %if.end.i ], [ 0.000000e+00, %invoke.cont60 ]
  call void @llvm.lifetime.end(i64 16, i8* nonnull %36) #11, !dbg !1673
  call void @llvm.dbg.value(metadata double %retval.0.i, i64 0, metadata !1514, metadata !1359), !dbg !1674
  %gridDim.sroa.0.sroa.5.0.insert.shift = shl i64 %div34, 32, !dbg !1675
  %gridDim.sroa.0.sroa.0.0.insert.ext = and i64 %div37, 4294967295, !dbg !1675
  %gridDim.sroa.0.sroa.0.0.insert.insert = or i64 %gridDim.sroa.0.sroa.0.0.insert.ext, %gridDim.sroa.0.sroa.5.0.insert.shift, !dbg !1675
  tail call void @llvm.dbg.value(metadata %struct.dim3* undef, i64 0, metadata !1627, metadata !1359), !dbg !1676
  tail call void @llvm.dbg.value(metadata i32 %cond, i64 0, metadata !1630, metadata !1359), !dbg !1678
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !1631, metadata !1359), !dbg !1679
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !1632, metadata !1359), !dbg !1680
  %agg.tmp64.sroa.0.0.insert.ext = zext i32 %cond to i64, !dbg !1681
  %agg.tmp64.sroa.0.4.insert.insert = or i64 %agg.tmp64.sroa.0.0.insert.ext, 4294967296, !dbg !1682
  %call69 = invoke i32 @cudaConfigureCall(i64 %gridDim.sroa.0.sroa.0.0.insert.insert, i32 1, i64 %agg.tmp64.sroa.0.4.insert.insert, i32 1, i64 0, %struct.CUstream_st* null)
          to label %invoke.cont68 unwind label %lpad66, !dbg !1683

invoke.cont68:                                    ; preds = %_Z8get_timev.exit
  %tobool70 = icmp eq i32 %call69, 0, !dbg !1684
  br i1 %tobool70, label %kcall.configok, label %kcall.end, !dbg !1685

kcall.configok:                                   ; preds = %invoke.cont68
  %39 = load %struct.latLong*, %struct.latLong** %d_locations, align 8, !dbg !1686, !tbaa !1361
  call void @llvm.dbg.value(metadata %struct.latLong* %39, i64 0, metadata !1405, metadata !1359), !dbg !1687
  %40 = load float*, float** %d_distances, align 8, !dbg !1688, !tbaa !1361
  call void @llvm.dbg.value(metadata float* %40, i64 0, metadata !1406, metadata !1359), !dbg !1689
  %41 = load float, float* %lat, align 4, !dbg !1690, !tbaa !1368
  call void @llvm.dbg.value(metadata float %41, i64 0, metadata !1390, metadata !1359), !dbg !1566
  %42 = load float, float* %lng, align 4, !dbg !1691, !tbaa !1368
  call void @llvm.dbg.value(metadata float %42, i64 0, metadata !1391, metadata !1359), !dbg !1567
  invoke void @_Z6euclidP7latLongPfiff(%struct.latLong* %39, float* %40, i32 %call6, float %41, float %42)
          to label %kcall.end unwind label %lpad66, !dbg !1692

lpad47:                                           ; preds = %invoke.cont58, %invoke.cont52, %invoke.cont48, %if.end29
  %43 = landingpad { i8*, i32 }
          cleanup, !dbg !1693
  br label %ehcleanup109, !dbg !1693

lpad66:                                           ; preds = %kcall.end, %kcall.configok, %_Z8get_timev.exit
  %44 = landingpad { i8*, i32 }
          cleanup, !dbg !1695
  br label %ehcleanup109, !dbg !1695

kcall.end:                                        ; preds = %invoke.cont68, %kcall.configok
  %call73 = invoke i32 @cudaThreadSynchronize()
          to label %invoke.cont72 unwind label %lpad66, !dbg !1697

invoke.cont72:                                    ; preds = %kcall.end
  %45 = bitcast %struct.timeval* %time.i212 to i8*, !dbg !1698
  call void @llvm.lifetime.start(i64 16, i8* nonnull %45) #11, !dbg !1698
  call void @llvm.dbg.value(metadata %struct.timeval* %time.i212, i64 0, metadata !1319, metadata !1329) #11, !dbg !1700
  %call.i213 = call i32 @gettimeofday(%struct.timeval* nonnull %time.i212, %struct.timezone* null) #11, !dbg !1701
  %tobool.i214 = icmp eq i32 %call.i213, 0, !dbg !1701
  br i1 %tobool.i214, label %if.end.i221, label %_Z8get_timev.exit223, !dbg !1702

if.end.i221:                                      ; preds = %invoke.cont72
  %tv_sec.i215 = getelementptr inbounds %struct.timeval, %struct.timeval* %time.i212, i64 0, i32 0, !dbg !1703
  %46 = load i64, i64* %tv_sec.i215, align 8, !dbg !1703, !tbaa !1335
  %conv.i216 = sitofp i64 %46 to double, !dbg !1704
  %tv_usec.i217 = getelementptr inbounds %struct.timeval, %struct.timeval* %time.i212, i64 0, i32 1, !dbg !1705
  %47 = load i64, i64* %tv_usec.i217, align 8, !dbg !1705, !tbaa !1342
  %conv1.i218 = sitofp i64 %47 to double, !dbg !1706
  %mul.i219 = fmul double %conv1.i218, 1.000000e-06, !dbg !1707
  %add.i220 = fadd double %mul.i219, %conv.i216, !dbg !1708
  br label %_Z8get_timev.exit223, !dbg !1709

_Z8get_timev.exit223:                             ; preds = %invoke.cont72, %if.end.i221
  %retval.0.i222 = phi double [ %add.i220, %if.end.i221 ], [ 0.000000e+00, %invoke.cont72 ]
  call void @llvm.lifetime.end(i64 16, i8* nonnull %45) #11, !dbg !1710
  call void @llvm.dbg.value(metadata double %retval.0.i222, i64 0, metadata !1515, metadata !1359), !dbg !1711
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1712, !tbaa !1361
  %sub76 = fsub double %retval.0.i222, %retval.0.i, !dbg !1713
  %call79 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %48, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), double %sub76) #12, !dbg !1714
  %49 = load i8*, i8** %32, align 8, !dbg !1715, !tbaa !1361
  %call83 = invoke i32 @cudaMemcpy(i8* %call44, i8* %49, i64 %mul43, i32 2)
          to label %invoke.cont82 unwind label %lpad77, !dbg !1716

invoke.cont82:                                    ; preds = %_Z8get_timev.exit223
  call void @llvm.dbg.value(metadata i32 %14, i64 0, metadata !1402, metadata !1359), !dbg !1565
  call void @llvm.dbg.value(metadata %"class.std::vector"* %records, i64 0, metadata !1717, metadata !1359) #11, !dbg !1733
  call void @llvm.dbg.value(metadata float* %30, i64 0, metadata !1722, metadata !1359) #11, !dbg !1735
  call void @llvm.dbg.value(metadata i32 %call6, i64 0, metadata !1723, metadata !1359) #11, !dbg !1736
  call void @llvm.dbg.value(metadata i32 %14, i64 0, metadata !1724, metadata !1359) #11, !dbg !1737
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !1725, metadata !1359) #11, !dbg !1738
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !1725, metadata !1359) #11, !dbg !1738
  %cmp71.i = icmp sgt i32 %14, 0, !dbg !1739
  br i1 %cmp71.i, label %for.cond1.preheader.lr.ph.i, label %if.end98, !dbg !1743

for.cond1.preheader.lr.ph.i:                      ; preds = %invoke.cont82
  %_M_start.i.i = getelementptr inbounds %"class.std::vector", %"class.std::vector"* %records, i64 0, i32 0, i32 0, i32 0
  %wide.trip.count77.i = zext i32 %14 to i64
  %wide.trip.count.i = zext i32 %call6 to i64
  %50 = load %struct.record*, %struct.record** %_M_start.i.i, align 8, !tbaa !1745
  %51 = add nsw i64 %wide.trip.count.i, -1, !dbg !1743
  br label %for.cond1.preheader.i, !dbg !1743

for.cond1.preheader.i:                            ; preds = %for.end.i, %for.cond1.preheader.lr.ph.i
  %indvars.iv75.i = phi i64 [ 0, %for.cond1.preheader.lr.ph.i ], [ %indvars.iv.next76.i, %for.end.i ]
  call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !1726, metadata !1359) #11, !dbg !1748
  call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !1728, metadata !1359) #11, !dbg !1749
  %52 = sub i64 %51, %indvars.iv75.i, !dbg !1750
  %cmp268.i = icmp slt i64 %indvars.iv75.i, %conv23, !dbg !1750
  %53 = trunc i64 %indvars.iv75.i to i32, !dbg !1755
  br i1 %cmp268.i, label %for.body3.i.preheader, label %for.end.i, !dbg !1755

for.body3.i.preheader:                            ; preds = %for.cond1.preheader.i
  %54 = sub i64 %wide.trip.count.i, %indvars.iv75.i, !dbg !1750
  %xtraiter = and i64 %54, 3, !dbg !1757
  %lcmp.mod = icmp eq i64 %xtraiter, 0, !dbg !1757
  br i1 %lcmp.mod, label %for.body3.i.prol.loopexit, label %for.body3.i.prol.preheader, !dbg !1757

for.body3.i.prol.preheader:                       ; preds = %for.body3.i.preheader
  br label %for.body3.i.prol, !dbg !1757

for.body3.i.prol:                                 ; preds = %for.body3.i.prol, %for.body3.i.prol.preheader
  %indvars.iv73.i.prol = phi i64 [ %indvars.iv.next74.i.prol, %for.body3.i.prol ], [ %indvars.iv75.i, %for.body3.i.prol.preheader ]
  %minLoc.069.i.prol = phi i32 [ %minLoc.1.i.prol, %for.body3.i.prol ], [ %53, %for.body3.i.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body3.i.prol ], [ %xtraiter, %for.body3.i.prol.preheader ]
  %arrayidx.i.prol = getelementptr inbounds float, float* %30, i64 %indvars.iv73.i.prol, !dbg !1757
  %55 = load float, float* %arrayidx.i.prol, align 4, !dbg !1757, !tbaa !1368
  call void @llvm.dbg.value(metadata float %55, i64 0, metadata !1727, metadata !1359) #11, !dbg !1759
  %idxprom4.i.prol = sext i32 %minLoc.069.i.prol to i64, !dbg !1760
  %arrayidx5.i.prol = getelementptr inbounds float, float* %30, i64 %idxprom4.i.prol, !dbg !1760
  %56 = load float, float* %arrayidx5.i.prol, align 4, !dbg !1760, !tbaa !1368
  %cmp6.i.prol = fcmp olt float %55, %56, !dbg !1762
  call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !1728, metadata !1359) #11, !dbg !1749
  %57 = trunc i64 %indvars.iv73.i.prol to i32, !dbg !1763
  %minLoc.1.i.prol = select i1 %cmp6.i.prol, i32 %57, i32 %minLoc.069.i.prol, !dbg !1763
  call void @llvm.dbg.value(metadata i32 %minLoc.1.i.prol, i64 0, metadata !1728, metadata !1359) #11, !dbg !1749
  %indvars.iv.next74.i.prol = add nuw nsw i64 %indvars.iv73.i.prol, 1, !dbg !1764
  call void @llvm.dbg.value(metadata i32 %minLoc.1.i.prol, i64 0, metadata !1728, metadata !1359) #11, !dbg !1749
  %prol.iter.sub = add i64 %prol.iter, -1, !dbg !1755
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0, !dbg !1755
  br i1 %prol.iter.cmp, label %for.body3.i.prol.loopexit.unr-lcssa, label %for.body3.i.prol, !dbg !1755, !llvm.loop !1766

for.body3.i.prol.loopexit.unr-lcssa:              ; preds = %for.body3.i.prol
  br label %for.body3.i.prol.loopexit, !dbg !1757

for.body3.i.prol.loopexit:                        ; preds = %for.body3.i.preheader, %for.body3.i.prol.loopexit.unr-lcssa
  %minLoc.1.i.lcssa.unr = phi i32 [ undef, %for.body3.i.preheader ], [ %minLoc.1.i.prol, %for.body3.i.prol.loopexit.unr-lcssa ]
  %indvars.iv73.i.unr = phi i64 [ %indvars.iv75.i, %for.body3.i.preheader ], [ %indvars.iv.next74.i.prol, %for.body3.i.prol.loopexit.unr-lcssa ]
  %minLoc.069.i.unr = phi i32 [ %53, %for.body3.i.preheader ], [ %minLoc.1.i.prol, %for.body3.i.prol.loopexit.unr-lcssa ]
  %58 = icmp ult i64 %52, 3, !dbg !1757
  br i1 %58, label %for.end.i.loopexit, label %for.body3.i.preheader.new, !dbg !1757

for.body3.i.preheader.new:                        ; preds = %for.body3.i.prol.loopexit
  br label %for.body3.i, !dbg !1757

for.body3.i:                                      ; preds = %for.body3.i, %for.body3.i.preheader.new
  %indvars.iv73.i = phi i64 [ %indvars.iv73.i.unr, %for.body3.i.preheader.new ], [ %indvars.iv.next74.i.3, %for.body3.i ]
  %minLoc.069.i = phi i32 [ %minLoc.069.i.unr, %for.body3.i.preheader.new ], [ %minLoc.1.i.3, %for.body3.i ]
  %arrayidx.i = getelementptr inbounds float, float* %30, i64 %indvars.iv73.i, !dbg !1757
  %59 = load float, float* %arrayidx.i, align 4, !dbg !1757, !tbaa !1368
  call void @llvm.dbg.value(metadata float %59, i64 0, metadata !1727, metadata !1359) #11, !dbg !1759
  %idxprom4.i = sext i32 %minLoc.069.i to i64, !dbg !1760
  %arrayidx5.i = getelementptr inbounds float, float* %30, i64 %idxprom4.i, !dbg !1760
  %60 = load float, float* %arrayidx5.i, align 4, !dbg !1760, !tbaa !1368
  %cmp6.i = fcmp olt float %59, %60, !dbg !1762
  call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !1728, metadata !1359) #11, !dbg !1749
  %61 = trunc i64 %indvars.iv73.i to i32, !dbg !1763
  %minLoc.1.i = select i1 %cmp6.i, i32 %61, i32 %minLoc.069.i, !dbg !1763
  call void @llvm.dbg.value(metadata i32 %minLoc.1.i, i64 0, metadata !1728, metadata !1359) #11, !dbg !1749
  %indvars.iv.next74.i = add nuw nsw i64 %indvars.iv73.i, 1, !dbg !1764
  call void @llvm.dbg.value(metadata i32 %minLoc.1.i, i64 0, metadata !1728, metadata !1359) #11, !dbg !1749
  %arrayidx.i.1 = getelementptr inbounds float, float* %30, i64 %indvars.iv.next74.i, !dbg !1757
  %62 = load float, float* %arrayidx.i.1, align 4, !dbg !1757, !tbaa !1368
  call void @llvm.dbg.value(metadata float %59, i64 0, metadata !1727, metadata !1359) #11, !dbg !1759
  %idxprom4.i.1 = sext i32 %minLoc.1.i to i64, !dbg !1760
  %arrayidx5.i.1 = getelementptr inbounds float, float* %30, i64 %idxprom4.i.1, !dbg !1760
  %63 = load float, float* %arrayidx5.i.1, align 4, !dbg !1760, !tbaa !1368
  %cmp6.i.1 = fcmp olt float %62, %63, !dbg !1762
  call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !1728, metadata !1359) #11, !dbg !1749
  %64 = trunc i64 %indvars.iv.next74.i to i32, !dbg !1763
  %minLoc.1.i.1 = select i1 %cmp6.i.1, i32 %64, i32 %minLoc.1.i, !dbg !1763
  call void @llvm.dbg.value(metadata i32 %minLoc.1.i, i64 0, metadata !1728, metadata !1359) #11, !dbg !1749
  %indvars.iv.next74.i.1 = add nsw i64 %indvars.iv73.i, 2, !dbg !1764
  call void @llvm.dbg.value(metadata i32 %minLoc.1.i, i64 0, metadata !1728, metadata !1359) #11, !dbg !1749
  %arrayidx.i.2 = getelementptr inbounds float, float* %30, i64 %indvars.iv.next74.i.1, !dbg !1757
  %65 = load float, float* %arrayidx.i.2, align 4, !dbg !1757, !tbaa !1368
  call void @llvm.dbg.value(metadata float %59, i64 0, metadata !1727, metadata !1359) #11, !dbg !1759
  %idxprom4.i.2 = sext i32 %minLoc.1.i.1 to i64, !dbg !1760
  %arrayidx5.i.2 = getelementptr inbounds float, float* %30, i64 %idxprom4.i.2, !dbg !1760
  %66 = load float, float* %arrayidx5.i.2, align 4, !dbg !1760, !tbaa !1368
  %cmp6.i.2 = fcmp olt float %65, %66, !dbg !1762
  call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !1728, metadata !1359) #11, !dbg !1749
  %67 = trunc i64 %indvars.iv.next74.i.1 to i32, !dbg !1763
  %minLoc.1.i.2 = select i1 %cmp6.i.2, i32 %67, i32 %minLoc.1.i.1, !dbg !1763
  call void @llvm.dbg.value(metadata i32 %minLoc.1.i, i64 0, metadata !1728, metadata !1359) #11, !dbg !1749
  %indvars.iv.next74.i.2 = add nsw i64 %indvars.iv73.i, 3, !dbg !1764
  call void @llvm.dbg.value(metadata i32 %minLoc.1.i, i64 0, metadata !1728, metadata !1359) #11, !dbg !1749
  %arrayidx.i.3 = getelementptr inbounds float, float* %30, i64 %indvars.iv.next74.i.2, !dbg !1757
  %68 = load float, float* %arrayidx.i.3, align 4, !dbg !1757, !tbaa !1368
  call void @llvm.dbg.value(metadata float %59, i64 0, metadata !1727, metadata !1359) #11, !dbg !1759
  %idxprom4.i.3 = sext i32 %minLoc.1.i.2 to i64, !dbg !1760
  %arrayidx5.i.3 = getelementptr inbounds float, float* %30, i64 %idxprom4.i.3, !dbg !1760
  %69 = load float, float* %arrayidx5.i.3, align 4, !dbg !1760, !tbaa !1368
  %cmp6.i.3 = fcmp olt float %68, %69, !dbg !1762
  call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !1728, metadata !1359) #11, !dbg !1749
  %70 = trunc i64 %indvars.iv.next74.i.2 to i32, !dbg !1763
  %minLoc.1.i.3 = select i1 %cmp6.i.3, i32 %70, i32 %minLoc.1.i.2, !dbg !1763
  call void @llvm.dbg.value(metadata i32 %minLoc.1.i, i64 0, metadata !1728, metadata !1359) #11, !dbg !1749
  %indvars.iv.next74.i.3 = add nsw i64 %indvars.iv73.i, 4, !dbg !1764
  call void @llvm.dbg.value(metadata i32 %minLoc.1.i, i64 0, metadata !1728, metadata !1359) #11, !dbg !1749
  %exitcond.i.3 = icmp eq i64 %indvars.iv.next74.i.3, %wide.trip.count.i, !dbg !1750
  br i1 %exitcond.i.3, label %for.end.i.loopexit.unr-lcssa, label %for.body3.i, !dbg !1755, !llvm.loop !1768

for.end.i.loopexit.unr-lcssa:                     ; preds = %for.body3.i
  br label %for.end.i.loopexit, !dbg !1771

for.end.i.loopexit:                               ; preds = %for.body3.i.prol.loopexit, %for.end.i.loopexit.unr-lcssa
  %minLoc.1.i.lcssa = phi i32 [ %minLoc.1.i.lcssa.unr, %for.body3.i.prol.loopexit ], [ %minLoc.1.i.3, %for.end.i.loopexit.unr-lcssa ]
  br label %for.end.i, !dbg !1771

for.end.i:                                        ; preds = %for.end.i.loopexit, %for.cond1.preheader.i
  %minLoc.0.lcssa.i = phi i32 [ %53, %for.cond1.preheader.i ], [ %minLoc.1.i.lcssa, %for.end.i.loopexit ]
  call void @llvm.dbg.value(metadata %"class.std::vector"* %records, i64 0, metadata !1774, metadata !1359) #11, !dbg !1771
  call void @llvm.dbg.value(metadata i64 %indvars.iv75.i, i64 0, metadata !1775, metadata !1359) #11, !dbg !1777
  %conv7.i = sext i32 %minLoc.0.lcssa.i to i64, !dbg !1778
  call void @llvm.dbg.value(metadata %"class.std::vector"* %records, i64 0, metadata !1774, metadata !1359) #11, !dbg !1779
  call void @llvm.dbg.value(metadata i64 %conv7.i, i64 0, metadata !1775, metadata !1359) #11, !dbg !1781
  call void @llvm.dbg.value(metadata %"class.std::vector"* %records, i64 0, metadata !1774, metadata !1359) #11, !dbg !1782
  call void @llvm.dbg.value(metadata i64 %indvars.iv75.i, i64 0, metadata !1775, metadata !1359) #11, !dbg !1785
  %71 = getelementptr inbounds %struct.record, %struct.record* %50, i64 %indvars.iv75.i, i32 0, i64 0, !dbg !1786
  %72 = getelementptr inbounds %struct.record, %struct.record* %50, i64 %conv7.i, i32 0, i64 0, !dbg !1786
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %71, i8* %72, i64 60, i32 4, i1 false) #11, !dbg !1786, !tbaa.struct !1787
  call void @llvm.dbg.value(metadata %"class.std::vector"* %records, i64 0, metadata !1774, metadata !1359) #11, !dbg !1789
  call void @llvm.dbg.value(metadata i64 %conv7.i, i64 0, metadata !1775, metadata !1359) #11, !dbg !1791
  %arrayidx14.i = getelementptr inbounds float, float* %30, i64 %indvars.iv75.i, !dbg !1792
  %73 = bitcast float* %arrayidx14.i to i32*, !dbg !1792
  %74 = load i32, i32* %73, align 4, !dbg !1792, !tbaa !1368
  %arrayidx16.i = getelementptr inbounds float, float* %30, i64 %conv7.i, !dbg !1793
  %75 = bitcast float* %arrayidx16.i to i32*, !dbg !1793
  %76 = load i32, i32* %75, align 4, !dbg !1793, !tbaa !1368
  store i32 %76, i32* %73, align 4, !dbg !1794, !tbaa !1368
  store i32 %74, i32* %75, align 4, !dbg !1795, !tbaa !1368
  %77 = load i32, i32* %73, align 4, !dbg !1796, !tbaa !1368
  call void @llvm.dbg.value(metadata %"class.std::vector"* %records, i64 0, metadata !1774, metadata !1359) #11, !dbg !1797
  call void @llvm.dbg.value(metadata i64 %indvars.iv75.i, i64 0, metadata !1775, metadata !1359) #11, !dbg !1799
  %distance.i = getelementptr inbounds %struct.record, %struct.record* %50, i64 %indvars.iv75.i, i32 1, !dbg !1800
  %78 = bitcast float* %distance.i to i32*, !dbg !1801
  store i32 %77, i32* %78, align 4, !dbg !1801, !tbaa !1802
  %indvars.iv.next76.i = add nuw nsw i64 %indvars.iv75.i, 1, !dbg !1804
  %exitcond78.i = icmp eq i64 %indvars.iv.next76.i, %wide.trip.count77.i, !dbg !1739
  br i1 %exitcond78.i, label %invoke.cont84, label %for.cond1.preheader.i, !dbg !1743, !llvm.loop !1806

invoke.cont84:                                    ; preds = %for.end.i
  %79 = load i32, i32* %quiet, align 4, !dbg !1809, !tbaa !1365
  call void @llvm.dbg.value(metadata i32 %79, i64 0, metadata !1392, metadata !1359), !dbg !1521
  %tobool85 = icmp eq i32 %79, 0, !dbg !1809
  %or.cond = and i1 %tobool85, %cmp71.i, !dbg !1811
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !1389, metadata !1359), !dbg !1518
  br i1 %or.cond, label %for.body.lr.ph, label %if.end98, !dbg !1811

for.body.lr.ph:                                   ; preds = %invoke.cont84
  %_M_start.i225 = getelementptr inbounds %"class.std::vector", %"class.std::vector"* %records, i64 0, i32 0, i32 0, i32 0
  %80 = sext i32 %14 to i64, !dbg !1812
  br label %for.body, !dbg !1812

for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.body ]
  call void @llvm.dbg.value(metadata %"class.std::vector"* %records, i64 0, metadata !1396, metadata !1329), !dbg !1526
  tail call void @llvm.dbg.value(metadata %"class.std::vector"* %records, i64 0, metadata !1774, metadata !1359), !dbg !1815
  tail call void @llvm.dbg.value(metadata i64 %indvars.iv, i64 0, metadata !1775, metadata !1359), !dbg !1819
  %81 = load %struct.record*, %struct.record** %_M_start.i225, align 8, !dbg !1820, !tbaa !1745
  %arraydecay91 = getelementptr inbounds %struct.record, %struct.record* %81, i64 %indvars.iv, i32 0, i64 0, !dbg !1821
  call void @llvm.dbg.value(metadata %"class.std::vector"* %records, i64 0, metadata !1396, metadata !1329), !dbg !1526
  tail call void @llvm.dbg.value(metadata %"class.std::vector"* %records, i64 0, metadata !1774, metadata !1359), !dbg !1823
  tail call void @llvm.dbg.value(metadata i64 %indvars.iv, i64 0, metadata !1775, metadata !1359), !dbg !1825
  %distance = getelementptr inbounds %struct.record, %struct.record* %81, i64 %indvars.iv, i32 1, !dbg !1826
  %82 = load float, float* %distance, align 4, !dbg !1826, !tbaa !1802
  %conv95 = fpext float %82 to double, !dbg !1828
  %call97 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0), i8* %arraydecay91, double %conv95), !dbg !1829
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !1830
  call void @llvm.dbg.value(metadata i32 %14, i64 0, metadata !1402, metadata !1359), !dbg !1565
  %cmp87 = icmp slt i64 %indvars.iv.next, %80, !dbg !1832
  br i1 %cmp87, label %for.body, label %if.end98.loopexit, !dbg !1812, !llvm.loop !1834

lpad77:                                           ; preds = %invoke.cont99, %if.end98, %_Z8get_timev.exit223
  %83 = landingpad { i8*, i32 }
          cleanup, !dbg !1837
  br label %ehcleanup109, !dbg !1837

if.end98.loopexit:                                ; preds = %for.body
  br label %if.end98, !dbg !1839

if.end98:                                         ; preds = %if.end98.loopexit, %invoke.cont82, %invoke.cont84
  call void @free(i8* %call44) #11, !dbg !1839
  %84 = load i8*, i8** %31, align 8, !dbg !1840, !tbaa !1361
  %call100 = invoke i32 @cudaFree(i8* %84)
          to label %invoke.cont99 unwind label %lpad77, !dbg !1841

invoke.cont99:                                    ; preds = %if.end98
  %85 = load i8*, i8** %32, align 8, !dbg !1842, !tbaa !1361
  %call102 = invoke i32 @cudaFree(i8* %85)
          to label %invoke.cont101 unwind label %lpad77, !dbg !1843

invoke.cont101:                                   ; preds = %invoke.cont99
  call void @llvm.lifetime.end(i64 8, i8* nonnull %22) #11, !dbg !1844
  call void @llvm.lifetime.end(i64 8, i8* nonnull %21) #11, !dbg !1844
  call void @llvm.lifetime.end(i64 632, i8* nonnull %17) #11, !dbg !1844
  call void @llvm.lifetime.end(i64 8, i8* nonnull %16) #11, !dbg !1844
  call void @llvm.lifetime.end(i64 8, i8* nonnull %15) #11, !dbg !1844
  br label %cleanup, !dbg !1845

cleanup:                                          ; preds = %if.then, %invoke.cont101
  call void @llvm.lifetime.end(i64 4, i8* nonnull %9) #11, !dbg !1844
  call void @llvm.lifetime.end(i64 100, i8* nonnull %8) #11, !dbg !1844
  call void @llvm.dbg.value(metadata %"class.std::vector.0"* %locations, i64 0, metadata !1847, metadata !1359), !dbg !1850
  %_M_start.i6.i208 = getelementptr inbounds %"class.std::vector.0", %"class.std::vector.0"* %locations, i64 0, i32 0, i32 0, i32 0, !dbg !1853
  %86 = load %struct.latLong*, %struct.latLong** %_M_start.i6.i208, align 8, !dbg !1853, !tbaa !1656
  call void @llvm.dbg.value(metadata %struct.latLong* %86, i64 0, metadata !1861, metadata !1359), !dbg !1866
  %tobool.i.i7.i209 = icmp eq %struct.latLong* %86, null, !dbg !1868
  br i1 %tobool.i.i7.i209, label %invoke.cont123, label %if.then.i.i8.i210, !dbg !1870

if.then.i.i8.i210:                                ; preds = %cleanup
  call void @llvm.dbg.value(metadata %struct.latLong* %86, i64 0, metadata !1871, metadata !1359) #11, !dbg !1877
  %87 = bitcast %struct.latLong* %86 to i8*, !dbg !1879
  call void @_ZdlPv(i8* %87) #11, !dbg !1880
  br label %invoke.cont123, !dbg !1881

invoke.cont123:                                   ; preds = %if.then.i.i8.i210, %cleanup
  call void @llvm.lifetime.end(i64 24, i8* nonnull %7) #11, !dbg !1844
  call void @llvm.dbg.value(metadata %"class.std::vector"* %records, i64 0, metadata !1396, metadata !1329), !dbg !1526
  call void @llvm.dbg.value(metadata %"class.std::vector"* %records, i64 0, metadata !1882, metadata !1359), !dbg !1885
  %_M_start.i6.i201 = getelementptr inbounds %"class.std::vector", %"class.std::vector"* %records, i64 0, i32 0, i32 0, i32 0, !dbg !1888
  %88 = load %struct.record*, %struct.record** %_M_start.i6.i201, align 8, !dbg !1888, !tbaa !1745
  call void @llvm.dbg.value(metadata %struct.record* %88, i64 0, metadata !1896, metadata !1359), !dbg !1901
  %tobool.i.i7.i202 = icmp eq %struct.record* %88, null, !dbg !1903
  br i1 %tobool.i.i7.i202, label %_ZNSt6vectorI6recordSaIS0_EED2Ev.exit204, label %if.then.i.i8.i203, !dbg !1905

if.then.i.i8.i203:                                ; preds = %invoke.cont123
  call void @llvm.dbg.value(metadata %struct.record* %88, i64 0, metadata !1906, metadata !1359) #11, !dbg !1912
  %89 = getelementptr inbounds %struct.record, %struct.record* %88, i64 0, i32 0, i64 0, !dbg !1914
  call void @_ZdlPv(i8* %89) #11, !dbg !1915
  br label %_ZNSt6vectorI6recordSaIS0_EED2Ev.exit204, !dbg !1916

_ZNSt6vectorI6recordSaIS0_EED2Ev.exit204:         ; preds = %invoke.cont123, %if.then.i.i8.i203
  call void @llvm.lifetime.end(i64 24, i8* nonnull %6) #11, !dbg !1844
  call void @llvm.lifetime.end(i64 4, i8* nonnull %5) #11, !dbg !1844
  call void @llvm.lifetime.end(i64 4, i8* nonnull %4) #11, !dbg !1844
  call void @llvm.lifetime.end(i64 4, i8* nonnull %3) #11, !dbg !1844
  call void @llvm.lifetime.end(i64 4, i8* nonnull %2) #11, !dbg !1844
  call void @llvm.lifetime.end(i64 4, i8* nonnull %1) #11, !dbg !1844
  call void @llvm.lifetime.end(i64 4, i8* nonnull %0) #11, !dbg !1844
  ret i32 0, !dbg !1917

ehcleanup109:                                     ; preds = %lpad47, %lpad77, %lpad66, %lpad17
  %.sink196.sink197.sink235 = phi { i8*, i32 } [ %29, %lpad17 ], [ %43, %lpad47 ], [ %83, %lpad77 ], [ %44, %lpad66 ]
  %90 = extractvalue { i8*, i32 } %.sink196.sink197.sink235, 0
  %91 = extractvalue { i8*, i32 } %.sink196.sink197.sink235, 1
  call void @llvm.lifetime.end(i64 8, i8* nonnull %22) #11, !dbg !1844
  call void @llvm.lifetime.end(i64 8, i8* nonnull %21) #11, !dbg !1844
  br label %ehcleanup113, !dbg !1919

ehcleanup113:                                     ; preds = %ehcleanup109, %lpad9
  %ehselector.slot.4 = phi i32 [ %91, %ehcleanup109 ], [ %28, %lpad9 ]
  %exn.slot.4 = phi i8* [ %90, %ehcleanup109 ], [ %27, %lpad9 ]
  call void @llvm.lifetime.end(i64 632, i8* nonnull %17) #11, !dbg !1844
  call void @llvm.lifetime.end(i64 8, i8* nonnull %16) #11, !dbg !1844
  call void @llvm.lifetime.end(i64 8, i8* nonnull %15) #11, !dbg !1844
  br label %ehcleanup118, !dbg !1921

ehcleanup118:                                     ; preds = %ehcleanup113, %lpad1
  %ehselector.slot.5 = phi i32 [ %12, %lpad1 ], [ %ehselector.slot.4, %ehcleanup113 ]
  %exn.slot.5 = phi i8* [ %11, %lpad1 ], [ %exn.slot.4, %ehcleanup113 ]
  call void @llvm.lifetime.end(i64 4, i8* nonnull %9) #11, !dbg !1844
  call void @llvm.lifetime.end(i64 100, i8* nonnull %8) #11, !dbg !1844
  call void @llvm.dbg.value(metadata %"class.std::vector.0"* %locations, i64 0, metadata !1847, metadata !1359), !dbg !1923
  %_M_start.i6.i198 = getelementptr inbounds %"class.std::vector.0", %"class.std::vector.0"* %locations, i64 0, i32 0, i32 0, i32 0, !dbg !1926
  %92 = load %struct.latLong*, %struct.latLong** %_M_start.i6.i198, align 8, !dbg !1926, !tbaa !1656
  call void @llvm.dbg.value(metadata %struct.latLong* %92, i64 0, metadata !1861, metadata !1359), !dbg !1928
  %tobool.i.i7.i199 = icmp eq %struct.latLong* %92, null, !dbg !1930
  br i1 %tobool.i.i7.i199, label %ehcleanup129, label %if.then.i.i8.i200, !dbg !1931

if.then.i.i8.i200:                                ; preds = %ehcleanup118
  call void @llvm.dbg.value(metadata %struct.latLong* %92, i64 0, metadata !1871, metadata !1359) #11, !dbg !1932
  %93 = bitcast %struct.latLong* %92 to i8*, !dbg !1934
  call void @_ZdlPv(i8* %93) #11, !dbg !1935
  br label %ehcleanup129, !dbg !1936

ehcleanup129:                                     ; preds = %ehcleanup118, %if.then.i.i8.i200
  call void @llvm.lifetime.end(i64 24, i8* nonnull %7) #11, !dbg !1844
  call void @llvm.dbg.value(metadata %"class.std::vector"* %records, i64 0, metadata !1882, metadata !1359), !dbg !1937
  %_M_start.i6.i = getelementptr inbounds %"class.std::vector", %"class.std::vector"* %records, i64 0, i32 0, i32 0, i32 0, !dbg !1940
  %94 = load %struct.record*, %struct.record** %_M_start.i6.i, align 8, !dbg !1940, !tbaa !1745
  call void @llvm.dbg.value(metadata %struct.record* %94, i64 0, metadata !1896, metadata !1359), !dbg !1942
  %tobool.i.i7.i = icmp eq %struct.record* %94, null, !dbg !1944
  br i1 %tobool.i.i7.i, label %invoke.cont130, label %if.then.i.i8.i, !dbg !1945

if.then.i.i8.i:                                   ; preds = %ehcleanup129
  call void @llvm.dbg.value(metadata %struct.record* %94, i64 0, metadata !1906, metadata !1359) #11, !dbg !1946
  %95 = getelementptr inbounds %struct.record, %struct.record* %94, i64 0, i32 0, i64 0, !dbg !1948
  call void @_ZdlPv(i8* %95) #11, !dbg !1949
  br label %invoke.cont130, !dbg !1950

invoke.cont130:                                   ; preds = %if.then.i.i8.i, %ehcleanup129
  call void @llvm.lifetime.end(i64 24, i8* nonnull %6) #11, !dbg !1844
  call void @llvm.lifetime.end(i64 4, i8* nonnull %5) #11, !dbg !1844
  call void @llvm.lifetime.end(i64 4, i8* nonnull %4) #11, !dbg !1844
  call void @llvm.lifetime.end(i64 4, i8* nonnull %3) #11, !dbg !1844
  call void @llvm.lifetime.end(i64 4, i8* nonnull %2) #11, !dbg !1844
  call void @llvm.lifetime.end(i64 4, i8* nonnull %1) #11, !dbg !1844
  call void @llvm.lifetime.end(i64 4, i8* nonnull %0) #11, !dbg !1844
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn.slot.5, 0, !dbg !1951
  %lpad.val147 = insertvalue { i8*, i32 } %lpad.val, i32 %ehselector.slot.5, 1, !dbg !1951
  resume { i8*, i32 } %lpad.val147, !dbg !1951
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: nounwind uwtable
define i32 @_Z16parseCommandlineiPPcS_PiPfS2_S1_S1_S1_S1_(i32 %argc, i8** nocapture readonly %argv, i8* %filename, i32* nocapture %r, float* nocapture %lat, float* nocapture %lng, i32* nocapture %q, i32* nocapture %t, i32* nocapture %p, i32* nocapture %d) local_unnamed_addr #0 !dbg !1953 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !1957, metadata !1359), !dbg !1969
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !1958, metadata !1359), !dbg !1970
  tail call void @llvm.dbg.value(metadata i8* %filename, i64 0, metadata !1959, metadata !1359), !dbg !1971
  tail call void @llvm.dbg.value(metadata i32* %r, i64 0, metadata !1960, metadata !1359), !dbg !1972
  tail call void @llvm.dbg.value(metadata float* %lat, i64 0, metadata !1961, metadata !1359), !dbg !1973
  tail call void @llvm.dbg.value(metadata float* %lng, i64 0, metadata !1962, metadata !1359), !dbg !1974
  tail call void @llvm.dbg.value(metadata i32* %q, i64 0, metadata !1963, metadata !1359), !dbg !1975
  tail call void @llvm.dbg.value(metadata i32* %t, i64 0, metadata !1964, metadata !1359), !dbg !1976
  tail call void @llvm.dbg.value(metadata i32* %p, i64 0, metadata !1965, metadata !1359), !dbg !1977
  tail call void @llvm.dbg.value(metadata i32* %d, i64 0, metadata !1966, metadata !1359), !dbg !1978
  %cmp = icmp slt i32 %argc, 2, !dbg !1979
  br i1 %cmp, label %cleanup53, label %for.body.preheader, !dbg !1981

for.body.preheader:                               ; preds = %entry
  %arrayidx = getelementptr inbounds i8*, i8** %argv, i64 1, !dbg !1982
  %0 = load i8*, i8** %arrayidx, align 8, !dbg !1982, !tbaa !1361
  %call = tail call i8* @strncpy(i8* %filename, i8* %0, i64 100) #11, !dbg !1983
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !1967, metadata !1359), !dbg !1984
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !1967, metadata !1359), !dbg !1984
  br label %for.body, !dbg !1985

for.body:                                         ; preds = %for.body.preheader, %for.inc
  %i.086 = phi i32 [ %inc45, %for.inc ], [ 1, %for.body.preheader ]
  %idxprom = sext i32 %i.086 to i64, !dbg !1985
  %arrayidx2 = getelementptr inbounds i8*, i8** %argv, i64 %idxprom, !dbg !1985
  %1 = load i8*, i8** %arrayidx2, align 8, !dbg !1985, !tbaa !1361
  %2 = load i8, i8* %1, align 1, !dbg !1985, !tbaa !1788
  %cmp4 = icmp eq i8 %2, 45, !dbg !1990
  br i1 %cmp4, label %if.then5, label %for.inc, !dbg !1991

if.then5:                                         ; preds = %for.body
  %arrayidx8 = getelementptr inbounds i8, i8* %1, i64 1, !dbg !1992
  %3 = load i8, i8* %arrayidx8, align 1, !dbg !1992, !tbaa !1788
  tail call void @llvm.dbg.value(metadata i8 %3, i64 0, metadata !1968, metadata !1359), !dbg !1994
  %conv9 = sext i8 %3 to i32, !dbg !1995
  switch i32 %conv9, label %for.inc [
    i32 114, label %sw.bb
    i32 108, label %sw.bb13
    i32 104, label %cleanup53.loopexit
    i32 113, label %sw.bb32
    i32 116, label %sw.bb33
    i32 112, label %sw.bb34
    i32 100, label %sw.bb39
  ], !dbg !1996

sw.bb:                                            ; preds = %if.then5
  %inc = add nsw i32 %i.086, 1, !dbg !1997
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !1967, metadata !1359), !dbg !1984
  %idxprom10 = sext i32 %inc to i64, !dbg !1999
  %arrayidx11 = getelementptr inbounds i8*, i8** %argv, i64 %idxprom10, !dbg !1999
  %4 = load i8*, i8** %arrayidx11, align 8, !dbg !1999, !tbaa !1361
  tail call void @llvm.dbg.value(metadata i8* %4, i64 0, metadata !1035, metadata !1359) #11, !dbg !2000
  %call.i = tail call i64 @strtol(i8* nocapture nonnull %4, i8** null, i32 10) #11, !dbg !2002
  %conv.i = trunc i64 %call.i to i32, !dbg !2002
  store i32 %conv.i, i32* %r, align 4, !dbg !2003, !tbaa !1365
  br label %for.inc, !dbg !2004

sw.bb13:                                          ; preds = %if.then5
  %arrayidx16 = getelementptr inbounds i8, i8* %1, i64 2, !dbg !2005
  %5 = load i8, i8* %arrayidx16, align 1, !dbg !2005, !tbaa !1788
  %cmp18 = icmp eq i8 %5, 97, !dbg !2007
  %add = add nsw i32 %i.086, 1
  %idxprom20 = sext i32 %add to i64
  %arrayidx21 = getelementptr inbounds i8*, i8** %argv, i64 %idxprom20
  %6 = load i8*, i8** %arrayidx21, align 8, !tbaa !1361
  tail call void @llvm.dbg.value(metadata i8* %6, i64 0, metadata !1029, metadata !1359) #11, !dbg !2008
  %call.i80 = tail call double @strtod(i8* nocapture nonnull %6, i8** null) #11, !dbg !2011
  %conv23 = fptrunc double %call.i80 to float
  %.sink = select i1 %cmp18, float* %lat, float* %lng, !dbg !2012
  store float %conv23, float* %.sink, align 4, !tbaa !1368
  tail call void @llvm.dbg.value(metadata i32 %add, i64 0, metadata !1967, metadata !1359), !dbg !1984
  br label %for.inc, !dbg !2013

sw.bb32:                                          ; preds = %if.then5
  store i32 1, i32* %q, align 4, !dbg !2014, !tbaa !1365
  br label %for.inc, !dbg !2015

sw.bb33:                                          ; preds = %if.then5
  store i32 1, i32* %t, align 4, !dbg !2016, !tbaa !1365
  br label %for.inc, !dbg !2017

sw.bb34:                                          ; preds = %if.then5
  %inc35 = add nsw i32 %i.086, 1, !dbg !2018
  tail call void @llvm.dbg.value(metadata i32 %inc35, i64 0, metadata !1967, metadata !1359), !dbg !1984
  %idxprom36 = sext i32 %inc35 to i64, !dbg !2019
  %arrayidx37 = getelementptr inbounds i8*, i8** %argv, i64 %idxprom36, !dbg !2019
  %7 = load i8*, i8** %arrayidx37, align 8, !dbg !2019, !tbaa !1361
  tail call void @llvm.dbg.value(metadata i8* %7, i64 0, metadata !1035, metadata !1359) #11, !dbg !2020
  %call.i81 = tail call i64 @strtol(i8* nocapture nonnull %7, i8** null, i32 10) #11, !dbg !2022
  %conv.i82 = trunc i64 %call.i81 to i32, !dbg !2022
  store i32 %conv.i82, i32* %p, align 4, !dbg !2023, !tbaa !1365
  br label %for.inc, !dbg !2024

sw.bb39:                                          ; preds = %if.then5
  %inc40 = add nsw i32 %i.086, 1, !dbg !2025
  tail call void @llvm.dbg.value(metadata i32 %inc40, i64 0, metadata !1967, metadata !1359), !dbg !1984
  %idxprom41 = sext i32 %inc40 to i64, !dbg !2026
  %arrayidx42 = getelementptr inbounds i8*, i8** %argv, i64 %idxprom41, !dbg !2026
  %8 = load i8*, i8** %arrayidx42, align 8, !dbg !2026, !tbaa !1361
  tail call void @llvm.dbg.value(metadata i8* %8, i64 0, metadata !1035, metadata !1359) #11, !dbg !2027
  %call.i83 = tail call i64 @strtol(i8* nocapture nonnull %8, i8** null, i32 10) #11, !dbg !2029
  %conv.i84 = trunc i64 %call.i83 to i32, !dbg !2029
  store i32 %conv.i84, i32* %d, align 4, !dbg !2030, !tbaa !1365
  br label %for.inc, !dbg !2031

for.inc:                                          ; preds = %for.body, %if.then5, %sw.bb39, %sw.bb34, %sw.bb33, %sw.bb32, %sw.bb13, %sw.bb
  %i.1 = phi i32 [ %i.086, %if.then5 ], [ %inc40, %sw.bb39 ], [ %inc35, %sw.bb34 ], [ %i.086, %sw.bb33 ], [ %i.086, %sw.bb32 ], [ %add, %sw.bb13 ], [ %inc, %sw.bb ], [ %i.086, %for.body ]
  tail call void @llvm.dbg.value(metadata i32 %i.1, i64 0, metadata !1967, metadata !1359), !dbg !1984
  %inc45 = add nsw i32 %i.1, 1, !dbg !2032
  tail call void @llvm.dbg.value(metadata i32 %inc45, i64 0, metadata !1967, metadata !1359), !dbg !1984
  tail call void @llvm.dbg.value(metadata i32 %inc45, i64 0, metadata !1967, metadata !1359), !dbg !1984
  %cmp1 = icmp slt i32 %inc45, %argc, !dbg !2034
  br i1 %cmp1, label %for.body, label %for.end, !dbg !2036, !llvm.loop !2038

for.end:                                          ; preds = %for.inc
  %9 = load i32, i32* %d, align 4, !dbg !2041, !tbaa !1365
  %cmp46 = icmp sgt i32 %9, -1, !dbg !2043
  %10 = load i32, i32* %p, align 4, !dbg !2044, !tbaa !1365
  %cmp47 = icmp slt i32 %10, 0, !dbg !2046
  %or.cond = and i1 %cmp46, %cmp47, !dbg !2047
  br i1 %or.cond, label %cleanup53, label %lor.lhs.false, !dbg !2047

lor.lhs.false:                                    ; preds = %for.end
  %cmp48 = icmp sgt i32 %10, -1, !dbg !2048
  %cmp50 = icmp slt i32 %9, 0, !dbg !2050
  %or.cond79 = and i1 %cmp50, %cmp48, !dbg !2052
  %. = zext i1 %or.cond79 to i32, !dbg !2052
  ret i32 %., !dbg !2052

cleanup53.loopexit:                               ; preds = %if.then5
  br label %cleanup53, !dbg !2053

cleanup53:                                        ; preds = %cleanup53.loopexit, %for.end, %entry
  ret i32 1, !dbg !2053
}

; Function Attrs: uwtable
define void @_Z10printUsagev() local_unnamed_addr #4 !dbg !2054 {
entry:
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @str, i64 0, i64 0)), !dbg !2055
  %putchar = tail call i32 @putchar(i32 10), !dbg !2056
  %puts23 = tail call i32 @puts(i8* getelementptr inbounds ([89 x i8], [89 x i8]* @str.25, i64 0, i64 0)), !dbg !2057
  %putchar24 = tail call i32 @putchar(i32 10), !dbg !2058
  %puts25 = tail call i32 @puts(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @str.26, i64 0, i64 0)), !dbg !2059
  %puts26 = tail call i32 @puts(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @str.27, i64 0, i64 0)), !dbg !2060
  %putchar27 = tail call i32 @putchar(i32 10), !dbg !2061
  %puts28 = tail call i32 @puts(i8* getelementptr inbounds ([58 x i8], [58 x i8]* @str.28, i64 0, i64 0)), !dbg !2062
  %puts29 = tail call i32 @puts(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @str.29, i64 0, i64 0)), !dbg !2063
  %puts30 = tail call i32 @puts(i8* getelementptr inbounds ([61 x i8], [61 x i8]* @str.30, i64 0, i64 0)), !dbg !2064
  %puts31 = tail call i32 @puts(i8* getelementptr inbounds ([62 x i8], [62 x i8]* @str.31, i64 0, i64 0)), !dbg !2065
  %putchar32 = tail call i32 @putchar(i32 10), !dbg !2066
  %puts33 = tail call i32 @puts(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @str.32, i64 0, i64 0)), !dbg !2067
  %puts34 = tail call i32 @puts(i8* getelementptr inbounds ([51 x i8], [51 x i8]* @str.33, i64 0, i64 0)), !dbg !2068
  %puts35 = tail call i32 @puts(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @str.34, i64 0, i64 0)), !dbg !2069
  %putchar36 = tail call i32 @putchar(i32 10), !dbg !2070
  %puts37 = tail call i32 @puts(i8* getelementptr inbounds ([72 x i8], [72 x i8]* @str.35, i64 0, i64 0)), !dbg !2071
  %puts38 = tail call i32 @puts(i8* getelementptr inbounds ([70 x i8], [70 x i8]* @str.36, i64 0, i64 0)), !dbg !2072
  %putchar39 = tail call i32 @putchar(i32 10), !dbg !2073
  %putchar40 = tail call i32 @putchar(i32 10), !dbg !2074
  %puts41 = tail call i32 @puts(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @str.37, i64 0, i64 0)), !dbg !2075
  %puts42 = tail call i32 @puts(i8* getelementptr inbounds ([60 x i8], [60 x i8]* @str.38, i64 0, i64 0)), !dbg !2076
  %puts43 = tail call i32 @puts(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @str.39, i64 0, i64 0)), !dbg !2077
  ret void, !dbg !2078
}

; Function Attrs: uwtable
define i32 @_Z8loadDataPcRSt6vectorI6recordSaIS1_EERS0_I7latLongSaIS5_EE(i8* nocapture readonly %filename, %"class.std::vector"* dereferenceable(24) %records, %"class.std::vector.0"* dereferenceable(24) %locations) local_unnamed_addr #4 !dbg !2079 {
entry:
  %dbname = alloca [64 x i8], align 16
  %record = alloca %struct.record, align 4
  %latLong = alloca i64, align 8
  %tmpcast = bitcast i64* %latLong to %struct.latLong*
  %substr = alloca [6 x i8], align 1
  %substr96 = getelementptr inbounds [6 x i8], [6 x i8]* %substr, i64 0, i64 0
  tail call void @llvm.dbg.value(metadata i8* %filename, i64 0, metadata !2083, metadata !1359), !dbg !2152
  tail call void @llvm.dbg.value(metadata %"class.std::vector"* %records, i64 0, metadata !2084, metadata !1359), !dbg !2153
  tail call void @llvm.dbg.value(metadata %"class.std::vector.0"* %locations, i64 0, metadata !2085, metadata !1359), !dbg !2154
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !2138, metadata !1359), !dbg !2155
  %0 = getelementptr inbounds [64 x i8], [64 x i8]* %dbname, i64 0, i64 0, !dbg !2156
  call void @llvm.lifetime.start(i64 64, i8* nonnull %0) #11, !dbg !2156
  tail call void @llvm.dbg.declare(metadata [64 x i8]* %dbname, metadata !2139, metadata !1359), !dbg !2157
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !2143, metadata !1359), !dbg !2158
  %call = tail call %struct._IO_FILE* @fopen(i8* %filename, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)), !dbg !2159
  tail call void @llvm.dbg.value(metadata %struct._IO_FILE* %call, i64 0, metadata !2086, metadata !1359), !dbg !2160
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !2143, metadata !1359), !dbg !2158
  %call191 = call i32 @feof(%struct._IO_FILE* %call) #11, !dbg !2161
  %lnot92 = icmp eq i32 %call191, 0, !dbg !2163
  br i1 %lnot92, label %while.body.lr.ph, label %while.end49, !dbg !2164

while.body.lr.ph:                                 ; preds = %entry
  %1 = getelementptr inbounds %struct.record, %struct.record* %record, i64 0, i32 0, i64 0
  %2 = bitcast i64* %latLong to i8*
  %3 = getelementptr inbounds [6 x i8], [6 x i8]* %substr, i64 0, i64 0
  %arrayidx26 = getelementptr inbounds [6 x i8], [6 x i8]* %substr, i64 0, i64 5
  %lat = bitcast i64* %latLong to float*
  %lng = getelementptr inbounds %struct.latLong, %struct.latLong* %tmpcast, i64 0, i32 1
  %_M_finish.i = getelementptr inbounds %"class.std::vector.0", %"class.std::vector.0"* %locations, i64 0, i32 0, i32 0, i32 1
  %_M_end_of_storage.i = getelementptr inbounds %"class.std::vector.0", %"class.std::vector.0"* %locations, i64 0, i32 0, i32 0, i32 2
  %_M_finish.i75 = getelementptr inbounds %"class.std::vector", %"class.std::vector"* %records, i64 0, i32 0, i32 0, i32 1
  %_M_end_of_storage.i76 = getelementptr inbounds %"class.std::vector", %"class.std::vector"* %records, i64 0, i32 0, i32 0, i32 2
  %scevgep = getelementptr inbounds %struct.record, %struct.record* %record, i64 0, i32 0, i64 28, !dbg !2164
  %scevgep97 = getelementptr inbounds %struct.record, %struct.record* %record, i64 0, i32 0, i64 33, !dbg !2164
  br label %while.body, !dbg !2164

while.body:                                       ; preds = %while.body.lr.ph, %while.end
  %recNum.093 = phi i32 [ 0, %while.body.lr.ph ], [ %recNum.183, %while.end ]
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %call, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i64 0, i64 0), i8* nonnull %0), !dbg !2165
  %cmp = icmp eq i32 %call2, 1, !dbg !2167
  br i1 %cmp, label %if.end, label %if.then, !dbg !2168

if.then:                                          ; preds = %while.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !2169, !tbaa !1361
  %5 = call i64 @fwrite(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.5, i64 0, i64 0), i64 23, i64 1, %struct._IO_FILE* %4) #12, !dbg !2171
  call void @exit(i32 0) #13, !dbg !2172
  unreachable, !dbg !2172

if.end:                                           ; preds = %while.body
  %call5 = call %struct._IO_FILE* @fopen(i8* nonnull %0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)), !dbg !2173
  call void @llvm.dbg.value(metadata %struct._IO_FILE* %call5, i64 0, metadata !2137, metadata !1359), !dbg !2174
  %tobool6 = icmp eq %struct._IO_FILE* %call5, null, !dbg !2175
  br i1 %tobool6, label %if.then7, label %while.cond10.preheader, !dbg !2177

while.cond10.preheader:                           ; preds = %if.end
  call void @llvm.dbg.value(metadata i32 %recNum.093, i64 0, metadata !2143, metadata !1359), !dbg !2158
  %call1188 = call i32 @feof(%struct._IO_FILE* nonnull %call5) #11, !dbg !2178
  %lnot1389 = icmp eq i32 %call1188, 0, !dbg !2180
  br i1 %lnot1389, label %while.body14.preheader, label %while.end, !dbg !2181

while.body14.preheader:                           ; preds = %while.cond10.preheader
  br label %while.body14, !dbg !2182

if.then7:                                         ; preds = %if.end
  %puts = call i32 @puts(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @str.40, i64 0, i64 0)), !dbg !2183
  call void @exit(i32 1) #13, !dbg !2185
  unreachable, !dbg !2185

while.body14:                                     ; preds = %while.body14.preheader, %cleanup.thread
  %recNum.190 = phi i32 [ %inc46, %cleanup.thread ], [ %recNum.093, %while.body14.preheader ]
  call void @llvm.lifetime.start(i64 60, i8* nonnull %1) #11, !dbg !2182
  call void @llvm.lifetime.start(i64 8, i8* nonnull %2) #11, !dbg !2186
  %call16 = call i8* @fgets(i8* nonnull %1, i32 49, %struct._IO_FILE* nonnull %call5), !dbg !2187
  %call17 = call i32 @fgetc(%struct._IO_FILE* nonnull %call5), !dbg !2188
  %call18 = call i32 @feof(%struct._IO_FILE* nonnull %call5) #11, !dbg !2189
  %tobool19 = icmp eq i32 %call18, 0, !dbg !2189
  br i1 %tobool19, label %if.end21, label %cleanup, !dbg !2191

if.end21:                                         ; preds = %while.body14
  call void @llvm.lifetime.start(i64 6, i8* nonnull %3) #11, !dbg !2192
  call void @llvm.dbg.declare(metadata [6 x i8]* %substr, metadata !2148, metadata !1359), !dbg !2193
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !2138, metadata !1359), !dbg !2155
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !2138, metadata !1359), !dbg !2155
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %substr96, i8* %scevgep, i64 5, i32 1, i1 false), !dbg !2194
  store i8 0, i8* %arrayidx26, align 1, !dbg !2198, !tbaa !1788
  call void @llvm.dbg.value(metadata i8* %3, i64 0, metadata !1029, metadata !1359) #11, !dbg !2199
  %call.i = call double @strtod(i8* nocapture nonnull %3, i8** null) #11, !dbg !2201
  %conv = fptrunc double %call.i to float, !dbg !2202
  store float %conv, float* %lat, align 8, !dbg !2203, !tbaa !2204
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !2138, metadata !1359), !dbg !2155
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !2138, metadata !1359), !dbg !2155
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %substr96, i8* %scevgep97, i64 5, i32 1, i1 false), !dbg !2206
  store i8 0, i8* %arrayidx26, align 1, !dbg !2210, !tbaa !1788
  call void @llvm.dbg.value(metadata i8* %3, i64 0, metadata !1029, metadata !1359) #11, !dbg !2211
  %call.i74 = call double @strtod(i8* nocapture nonnull %3, i8** null) #11, !dbg !2213
  %conv45 = fptrunc double %call.i74 to float, !dbg !2214
  store float %conv45, float* %lng, align 4, !dbg !2215, !tbaa !2216
  call void @llvm.dbg.value(metadata %struct.latLong* %tmpcast, i64 0, metadata !2147, metadata !1329), !dbg !2217
  call void @llvm.dbg.value(metadata %"class.std::vector.0"* %locations, i64 0, metadata !2218, metadata !1359), !dbg !2222
  call void @llvm.dbg.value(metadata %struct.latLong* %tmpcast, i64 0, metadata !2221, metadata !1359), !dbg !2224
  %6 = load %struct.latLong*, %struct.latLong** %_M_finish.i, align 8, !dbg !2225, !tbaa !2227
  %7 = load %struct.latLong*, %struct.latLong** %_M_end_of_storage.i, align 8, !dbg !2228, !tbaa !2229
  %cmp.i = icmp eq %struct.latLong* %6, %7, !dbg !2230
  br i1 %cmp.i, label %if.else.i, label %if.then.i, !dbg !2231

if.then.i:                                        ; preds = %if.end21
  call void @llvm.dbg.value(metadata %struct.latLong* %6, i64 0, metadata !2232, metadata !1359), !dbg !2240
  call void @llvm.dbg.value(metadata %struct.latLong* %tmpcast, i64 0, metadata !2239, metadata !1359), !dbg !2243
  call void @llvm.dbg.value(metadata %struct.latLong* %6, i64 0, metadata !2244, metadata !1359), !dbg !2249
  call void @llvm.dbg.value(metadata %struct.latLong* %tmpcast, i64 0, metadata !2248, metadata !1359), !dbg !2251
  %8 = bitcast %struct.latLong* %6 to i64*, !dbg !2252
  %9 = load i64, i64* %latLong, align 8, !dbg !2252
  store i64 %9, i64* %8, align 4, !dbg !2252
  %10 = load %struct.latLong*, %struct.latLong** %_M_finish.i, align 8, !dbg !2253, !tbaa !2227
  %incdec.ptr.i = getelementptr inbounds %struct.latLong, %struct.latLong* %10, i64 1, !dbg !2253
  store %struct.latLong* %incdec.ptr.i, %struct.latLong** %_M_finish.i, align 8, !dbg !2253, !tbaa !2227
  br label %_ZNSt6vectorI7latLongSaIS0_EE9push_backERKS0_.exit, !dbg !2254

if.else.i:                                        ; preds = %if.end21
  call void @_ZNSt6vectorI7latLongSaIS0_EE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_(%"class.std::vector.0"* nonnull %locations, %struct.latLong* %6, %struct.latLong* nonnull dereferenceable(8) %tmpcast), !dbg !2255
  br label %_ZNSt6vectorI7latLongSaIS0_EE9push_backERKS0_.exit

_ZNSt6vectorI7latLongSaIS0_EE9push_backERKS0_.exit: ; preds = %if.then.i, %if.else.i
  call void @llvm.dbg.value(metadata %struct.record* %record, i64 0, metadata !2144, metadata !1329), !dbg !2257
  call void @llvm.dbg.value(metadata %"class.std::vector"* %records, i64 0, metadata !2258, metadata !1359), !dbg !2262
  call void @llvm.dbg.value(metadata %struct.record* %record, i64 0, metadata !2261, metadata !1359), !dbg !2264
  %11 = load %struct.record*, %struct.record** %_M_finish.i75, align 8, !dbg !2265, !tbaa !2267
  %12 = load %struct.record*, %struct.record** %_M_end_of_storage.i76, align 8, !dbg !2268, !tbaa !2269
  %cmp.i77 = icmp eq %struct.record* %11, %12, !dbg !2270
  br i1 %cmp.i77, label %if.else.i80, label %if.then.i79, !dbg !2271

if.then.i79:                                      ; preds = %_ZNSt6vectorI7latLongSaIS0_EE9push_backERKS0_.exit
  call void @llvm.dbg.value(metadata %struct.record* %11, i64 0, metadata !2272, metadata !1359), !dbg !2280
  call void @llvm.dbg.value(metadata %struct.record* %record, i64 0, metadata !2279, metadata !1359), !dbg !2283
  call void @llvm.dbg.value(metadata %struct.record* %11, i64 0, metadata !2284, metadata !1359) #11, !dbg !2289
  call void @llvm.dbg.value(metadata %struct.record* %record, i64 0, metadata !2288, metadata !1359) #11, !dbg !2291
  %13 = getelementptr inbounds %struct.record, %struct.record* %11, i64 0, i32 0, i64 0, !dbg !2292
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* nonnull %1, i64 60, i32 4, i1 false) #11, !dbg !2293, !tbaa.struct !1787
  %14 = load %struct.record*, %struct.record** %_M_finish.i75, align 8, !dbg !2294, !tbaa !2267
  %incdec.ptr.i78 = getelementptr inbounds %struct.record, %struct.record* %14, i64 1, !dbg !2294
  store %struct.record* %incdec.ptr.i78, %struct.record** %_M_finish.i75, align 8, !dbg !2294, !tbaa !2267
  br label %cleanup.thread, !dbg !2295

if.else.i80:                                      ; preds = %_ZNSt6vectorI7latLongSaIS0_EE9push_backERKS0_.exit
  call void @_ZNSt6vectorI6recordSaIS0_EE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_(%"class.std::vector"* nonnull %records, %struct.record* %11, %struct.record* nonnull dereferenceable(60) %record), !dbg !2296
  br label %cleanup.thread

cleanup.thread:                                   ; preds = %if.else.i80, %if.then.i79
  %inc46 = add nsw i32 %recNum.190, 1, !dbg !2298
  call void @llvm.dbg.value(metadata i32 %inc46, i64 0, metadata !2143, metadata !1359), !dbg !2158
  call void @llvm.lifetime.end(i64 6, i8* nonnull %3) #11, !dbg !2299
  call void @llvm.dbg.value(metadata i32 %recNum.190, i64 0, metadata !2143, metadata !1359), !dbg !2158
  call void @llvm.lifetime.end(i64 8, i8* nonnull %2) #11, !dbg !2299
  call void @llvm.lifetime.end(i64 60, i8* nonnull %1) #11, !dbg !2299
  call void @llvm.dbg.value(metadata i32 %inc46, i64 0, metadata !2143, metadata !1359), !dbg !2158
  %call11 = call i32 @feof(%struct._IO_FILE* nonnull %call5) #11, !dbg !2178
  %lnot13 = icmp eq i32 %call11, 0, !dbg !2180
  br i1 %lnot13, label %while.body14, label %while.end.loopexit, !dbg !2181

cleanup:                                          ; preds = %while.body14
  call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !2143, metadata !1359), !dbg !2158
  call void @llvm.lifetime.end(i64 8, i8* nonnull %2) #11, !dbg !2299
  call void @llvm.lifetime.end(i64 60, i8* nonnull %1) #11, !dbg !2299
  br label %while.end

while.end.loopexit:                               ; preds = %cleanup.thread
  br label %while.end, !dbg !2158

while.end:                                        ; preds = %while.end.loopexit, %while.cond10.preheader, %cleanup
  %recNum.183 = phi i32 [ %recNum.190, %cleanup ], [ %recNum.093, %while.cond10.preheader ], [ %inc46, %while.end.loopexit ]
  call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !2143, metadata !1359), !dbg !2158
  %call48 = call i32 @fclose(%struct._IO_FILE* nonnull %call5), !dbg !2300
  call void @llvm.dbg.value(metadata i32 %recNum.183, i64 0, metadata !2143, metadata !1359), !dbg !2158
  %call1 = call i32 @feof(%struct._IO_FILE* %call) #11, !dbg !2161
  %lnot = icmp eq i32 %call1, 0, !dbg !2163
  br i1 %lnot, label %while.body, label %while.end49.loopexit, !dbg !2164, !llvm.loop !2301

while.end49.loopexit:                             ; preds = %while.end
  br label %while.end49, !dbg !2304

while.end49:                                      ; preds = %while.end49.loopexit, %entry
  %recNum.0.lcssa = phi i32 [ 0, %entry ], [ %recNum.183, %while.end49.loopexit ]
  %call50 = call i32 @fclose(%struct._IO_FILE* %call), !dbg !2304
  call void @llvm.lifetime.end(i64 64, i8* nonnull %0) #11, !dbg !2305
  ret i32 %recNum.0.lcssa, !dbg !2306
}

declare i32 @cudaGetDeviceProperties(%struct.cudaDeviceProp*, i32) local_unnamed_addr #6

declare i32 @cudaThreadSynchronize() local_unnamed_addr #6

declare i32 @cudaMemGetInfo(i64*, i64*) local_unnamed_addr #6

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #7

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) local_unnamed_addr #3

declare i32 @cudaMalloc(i8**, i64) local_unnamed_addr #6

declare i32 @cudaMemcpy(i8*, i8*, i64, i32) local_unnamed_addr #6

declare i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) local_unnamed_addr #6

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define void @_Z10findLowestRSt6vectorI6recordSaIS0_EEPfii(%"class.std::vector"* nocapture readonly dereferenceable(24) %records, float* nocapture %distances, i32 %numRecords, i32 %topN) local_unnamed_addr #0 !dbg !1718 {
entry:
  tail call void @llvm.dbg.value(metadata %"class.std::vector"* %records, i64 0, metadata !1717, metadata !1359), !dbg !2307
  tail call void @llvm.dbg.value(metadata float* %distances, i64 0, metadata !1722, metadata !1359), !dbg !2308
  tail call void @llvm.dbg.value(metadata i32 %numRecords, i64 0, metadata !1723, metadata !1359), !dbg !2309
  tail call void @llvm.dbg.value(metadata i32 %topN, i64 0, metadata !1724, metadata !1359), !dbg !2310
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !1725, metadata !1359), !dbg !2311
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !1725, metadata !1359), !dbg !2311
  %cmp71 = icmp sgt i32 %topN, 0, !dbg !2312
  br i1 %cmp71, label %for.cond1.preheader.lr.ph, label %for.end27, !dbg !2313

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %_M_start.i = getelementptr inbounds %"class.std::vector", %"class.std::vector"* %records, i64 0, i32 0, i32 0, i32 0
  %0 = sext i32 %numRecords to i64, !dbg !2313
  %wide.trip.count77 = zext i32 %topN to i64
  %wide.trip.count = zext i32 %numRecords to i64
  %1 = add nsw i64 %wide.trip.count, -1, !dbg !2313
  br label %for.cond1.preheader, !dbg !2313

for.cond1.preheader:                              ; preds = %for.end, %for.cond1.preheader.lr.ph
  %indvars.iv75 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next76, %for.end ]
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !1726, metadata !1359), !dbg !2314
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !1728, metadata !1359), !dbg !2315
  %2 = sub i64 %1, %indvars.iv75, !dbg !2316
  %cmp268 = icmp slt i64 %indvars.iv75, %0, !dbg !2316
  %3 = trunc i64 %indvars.iv75 to i32, !dbg !2317
  br i1 %cmp268, label %for.body3.preheader, label %for.end, !dbg !2317

for.body3.preheader:                              ; preds = %for.cond1.preheader
  %4 = sub i64 %wide.trip.count, %indvars.iv75, !dbg !2316
  %xtraiter = and i64 %4, 3, !dbg !2318
  %lcmp.mod = icmp eq i64 %xtraiter, 0, !dbg !2318
  br i1 %lcmp.mod, label %for.body3.prol.loopexit, label %for.body3.prol.preheader, !dbg !2318

for.body3.prol.preheader:                         ; preds = %for.body3.preheader
  br label %for.body3.prol, !dbg !2318

for.body3.prol:                                   ; preds = %for.body3.prol, %for.body3.prol.preheader
  %indvars.iv73.prol = phi i64 [ %indvars.iv.next74.prol, %for.body3.prol ], [ %indvars.iv75, %for.body3.prol.preheader ]
  %minLoc.069.prol = phi i32 [ %minLoc.1.prol, %for.body3.prol ], [ %3, %for.body3.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body3.prol ], [ %xtraiter, %for.body3.prol.preheader ]
  %arrayidx.prol = getelementptr inbounds float, float* %distances, i64 %indvars.iv73.prol, !dbg !2318
  %5 = load float, float* %arrayidx.prol, align 4, !dbg !2318, !tbaa !1368
  tail call void @llvm.dbg.value(metadata float %5, i64 0, metadata !1727, metadata !1359), !dbg !2319
  %idxprom4.prol = sext i32 %minLoc.069.prol to i64, !dbg !2320
  %arrayidx5.prol = getelementptr inbounds float, float* %distances, i64 %idxprom4.prol, !dbg !2320
  %6 = load float, float* %arrayidx5.prol, align 4, !dbg !2320, !tbaa !1368
  %cmp6.prol = fcmp olt float %5, %6, !dbg !2321
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !1728, metadata !1359), !dbg !2315
  %7 = trunc i64 %indvars.iv73.prol to i32, !dbg !2322
  %minLoc.1.prol = select i1 %cmp6.prol, i32 %7, i32 %minLoc.069.prol, !dbg !2322
  tail call void @llvm.dbg.value(metadata i32 %minLoc.1.prol, i64 0, metadata !1728, metadata !1359), !dbg !2315
  %indvars.iv.next74.prol = add nuw nsw i64 %indvars.iv73.prol, 1, !dbg !2323
  tail call void @llvm.dbg.value(metadata i32 %minLoc.1.prol, i64 0, metadata !1728, metadata !1359), !dbg !2315
  %prol.iter.sub = add i64 %prol.iter, -1, !dbg !2317
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0, !dbg !2317
  br i1 %prol.iter.cmp, label %for.body3.prol.loopexit.unr-lcssa, label %for.body3.prol, !dbg !2317, !llvm.loop !2324

for.body3.prol.loopexit.unr-lcssa:                ; preds = %for.body3.prol
  br label %for.body3.prol.loopexit, !dbg !2318

for.body3.prol.loopexit:                          ; preds = %for.body3.preheader, %for.body3.prol.loopexit.unr-lcssa
  %minLoc.1.lcssa.unr = phi i32 [ undef, %for.body3.preheader ], [ %minLoc.1.prol, %for.body3.prol.loopexit.unr-lcssa ]
  %indvars.iv73.unr = phi i64 [ %indvars.iv75, %for.body3.preheader ], [ %indvars.iv.next74.prol, %for.body3.prol.loopexit.unr-lcssa ]
  %minLoc.069.unr = phi i32 [ %3, %for.body3.preheader ], [ %minLoc.1.prol, %for.body3.prol.loopexit.unr-lcssa ]
  %8 = icmp ult i64 %2, 3, !dbg !2318
  br i1 %8, label %for.end.loopexit, label %for.body3.preheader.new, !dbg !2318

for.body3.preheader.new:                          ; preds = %for.body3.prol.loopexit
  br label %for.body3, !dbg !2318

for.body3:                                        ; preds = %for.body3, %for.body3.preheader.new
  %indvars.iv73 = phi i64 [ %indvars.iv73.unr, %for.body3.preheader.new ], [ %indvars.iv.next74.3, %for.body3 ]
  %minLoc.069 = phi i32 [ %minLoc.069.unr, %for.body3.preheader.new ], [ %minLoc.1.3, %for.body3 ]
  %arrayidx = getelementptr inbounds float, float* %distances, i64 %indvars.iv73, !dbg !2318
  %9 = load float, float* %arrayidx, align 4, !dbg !2318, !tbaa !1368
  tail call void @llvm.dbg.value(metadata float %9, i64 0, metadata !1727, metadata !1359), !dbg !2319
  %idxprom4 = sext i32 %minLoc.069 to i64, !dbg !2320
  %arrayidx5 = getelementptr inbounds float, float* %distances, i64 %idxprom4, !dbg !2320
  %10 = load float, float* %arrayidx5, align 4, !dbg !2320, !tbaa !1368
  %cmp6 = fcmp olt float %9, %10, !dbg !2321
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !1728, metadata !1359), !dbg !2315
  %11 = trunc i64 %indvars.iv73 to i32, !dbg !2322
  %minLoc.1 = select i1 %cmp6, i32 %11, i32 %minLoc.069, !dbg !2322
  tail call void @llvm.dbg.value(metadata i32 %minLoc.1, i64 0, metadata !1728, metadata !1359), !dbg !2315
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1, !dbg !2323
  tail call void @llvm.dbg.value(metadata i32 %minLoc.1, i64 0, metadata !1728, metadata !1359), !dbg !2315
  %arrayidx.1 = getelementptr inbounds float, float* %distances, i64 %indvars.iv.next74, !dbg !2318
  %12 = load float, float* %arrayidx.1, align 4, !dbg !2318, !tbaa !1368
  tail call void @llvm.dbg.value(metadata float %9, i64 0, metadata !1727, metadata !1359), !dbg !2319
  %idxprom4.1 = sext i32 %minLoc.1 to i64, !dbg !2320
  %arrayidx5.1 = getelementptr inbounds float, float* %distances, i64 %idxprom4.1, !dbg !2320
  %13 = load float, float* %arrayidx5.1, align 4, !dbg !2320, !tbaa !1368
  %cmp6.1 = fcmp olt float %12, %13, !dbg !2321
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !1728, metadata !1359), !dbg !2315
  %14 = trunc i64 %indvars.iv.next74 to i32, !dbg !2322
  %minLoc.1.1 = select i1 %cmp6.1, i32 %14, i32 %minLoc.1, !dbg !2322
  tail call void @llvm.dbg.value(metadata i32 %minLoc.1, i64 0, metadata !1728, metadata !1359), !dbg !2315
  %indvars.iv.next74.1 = add nsw i64 %indvars.iv73, 2, !dbg !2323
  tail call void @llvm.dbg.value(metadata i32 %minLoc.1, i64 0, metadata !1728, metadata !1359), !dbg !2315
  %arrayidx.2 = getelementptr inbounds float, float* %distances, i64 %indvars.iv.next74.1, !dbg !2318
  %15 = load float, float* %arrayidx.2, align 4, !dbg !2318, !tbaa !1368
  tail call void @llvm.dbg.value(metadata float %9, i64 0, metadata !1727, metadata !1359), !dbg !2319
  %idxprom4.2 = sext i32 %minLoc.1.1 to i64, !dbg !2320
  %arrayidx5.2 = getelementptr inbounds float, float* %distances, i64 %idxprom4.2, !dbg !2320
  %16 = load float, float* %arrayidx5.2, align 4, !dbg !2320, !tbaa !1368
  %cmp6.2 = fcmp olt float %15, %16, !dbg !2321
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !1728, metadata !1359), !dbg !2315
  %17 = trunc i64 %indvars.iv.next74.1 to i32, !dbg !2322
  %minLoc.1.2 = select i1 %cmp6.2, i32 %17, i32 %minLoc.1.1, !dbg !2322
  tail call void @llvm.dbg.value(metadata i32 %minLoc.1, i64 0, metadata !1728, metadata !1359), !dbg !2315
  %indvars.iv.next74.2 = add nsw i64 %indvars.iv73, 3, !dbg !2323
  tail call void @llvm.dbg.value(metadata i32 %minLoc.1, i64 0, metadata !1728, metadata !1359), !dbg !2315
  %arrayidx.3 = getelementptr inbounds float, float* %distances, i64 %indvars.iv.next74.2, !dbg !2318
  %18 = load float, float* %arrayidx.3, align 4, !dbg !2318, !tbaa !1368
  tail call void @llvm.dbg.value(metadata float %9, i64 0, metadata !1727, metadata !1359), !dbg !2319
  %idxprom4.3 = sext i32 %minLoc.1.2 to i64, !dbg !2320
  %arrayidx5.3 = getelementptr inbounds float, float* %distances, i64 %idxprom4.3, !dbg !2320
  %19 = load float, float* %arrayidx5.3, align 4, !dbg !2320, !tbaa !1368
  %cmp6.3 = fcmp olt float %18, %19, !dbg !2321
  tail call void @llvm.dbg.value(metadata i32 undef, i64 0, metadata !1728, metadata !1359), !dbg !2315
  %20 = trunc i64 %indvars.iv.next74.2 to i32, !dbg !2322
  %minLoc.1.3 = select i1 %cmp6.3, i32 %20, i32 %minLoc.1.2, !dbg !2322
  tail call void @llvm.dbg.value(metadata i32 %minLoc.1, i64 0, metadata !1728, metadata !1359), !dbg !2315
  %indvars.iv.next74.3 = add nsw i64 %indvars.iv73, 4, !dbg !2323
  tail call void @llvm.dbg.value(metadata i32 %minLoc.1, i64 0, metadata !1728, metadata !1359), !dbg !2315
  %exitcond.3 = icmp eq i64 %indvars.iv.next74.3, %wide.trip.count, !dbg !2316
  br i1 %exitcond.3, label %for.end.loopexit.unr-lcssa, label %for.body3, !dbg !2317, !llvm.loop !1768

for.end.loopexit.unr-lcssa:                       ; preds = %for.body3
  br label %for.end.loopexit, !dbg !2325

for.end.loopexit:                                 ; preds = %for.body3.prol.loopexit, %for.end.loopexit.unr-lcssa
  %minLoc.1.lcssa = phi i32 [ %minLoc.1.lcssa.unr, %for.body3.prol.loopexit ], [ %minLoc.1.3, %for.end.loopexit.unr-lcssa ]
  br label %for.end, !dbg !2325

for.end:                                          ; preds = %for.end.loopexit, %for.cond1.preheader
  %minLoc.0.lcssa = phi i32 [ %3, %for.cond1.preheader ], [ %minLoc.1.lcssa, %for.end.loopexit ]
  tail call void @llvm.dbg.value(metadata %"class.std::vector"* %records, i64 0, metadata !1774, metadata !1359), !dbg !2325
  tail call void @llvm.dbg.value(metadata i64 %indvars.iv75, i64 0, metadata !1775, metadata !1359), !dbg !2327
  %21 = load %struct.record*, %struct.record** %_M_start.i, align 8, !dbg !2328, !tbaa !1745
  %conv7 = sext i32 %minLoc.0.lcssa to i64, !dbg !2329
  tail call void @llvm.dbg.value(metadata %"class.std::vector"* %records, i64 0, metadata !1774, metadata !1359), !dbg !2330
  tail call void @llvm.dbg.value(metadata i64 %conv7, i64 0, metadata !1775, metadata !1359), !dbg !2332
  tail call void @llvm.dbg.value(metadata %"class.std::vector"* %records, i64 0, metadata !1774, metadata !1359), !dbg !2333
  tail call void @llvm.dbg.value(metadata i64 %indvars.iv75, i64 0, metadata !1775, metadata !1359), !dbg !2335
  %22 = getelementptr inbounds %struct.record, %struct.record* %21, i64 %indvars.iv75, i32 0, i64 0, !dbg !2336
  %23 = getelementptr inbounds %struct.record, %struct.record* %21, i64 %conv7, i32 0, i64 0, !dbg !2336
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %22, i8* %23, i64 60, i32 4, i1 false), !dbg !2336, !tbaa.struct !1787
  tail call void @llvm.dbg.value(metadata %"class.std::vector"* %records, i64 0, metadata !1774, metadata !1359), !dbg !2337
  tail call void @llvm.dbg.value(metadata i64 %conv7, i64 0, metadata !1775, metadata !1359), !dbg !2339
  %24 = load %struct.record*, %struct.record** %_M_start.i, align 8, !dbg !2340, !tbaa !1745
  %25 = getelementptr inbounds %struct.record, %struct.record* %24, i64 %conv7, i32 0, i64 0, !dbg !2341
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %25, i8* %22, i64 60, i32 4, i1 false), !dbg !2341, !tbaa.struct !1787
  %arrayidx14 = getelementptr inbounds float, float* %distances, i64 %indvars.iv75, !dbg !2342
  %26 = bitcast float* %arrayidx14 to i32*, !dbg !2342
  %27 = load i32, i32* %26, align 4, !dbg !2342, !tbaa !1368
  %arrayidx16 = getelementptr inbounds float, float* %distances, i64 %conv7, !dbg !2343
  %28 = bitcast float* %arrayidx16 to i32*, !dbg !2343
  %29 = load i32, i32* %28, align 4, !dbg !2343, !tbaa !1368
  store i32 %29, i32* %26, align 4, !dbg !2344, !tbaa !1368
  store i32 %27, i32* %28, align 4, !dbg !2345, !tbaa !1368
  %30 = load i32, i32* %26, align 4, !dbg !2346, !tbaa !1368
  tail call void @llvm.dbg.value(metadata %"class.std::vector"* %records, i64 0, metadata !1774, metadata !1359), !dbg !2347
  tail call void @llvm.dbg.value(metadata i64 %indvars.iv75, i64 0, metadata !1775, metadata !1359), !dbg !2349
  %31 = load %struct.record*, %struct.record** %_M_start.i, align 8, !dbg !2350, !tbaa !1745
  %distance = getelementptr inbounds %struct.record, %struct.record* %31, i64 %indvars.iv75, i32 1, !dbg !2351
  %32 = bitcast float* %distance to i32*, !dbg !2352
  store i32 %30, i32* %32, align 4, !dbg !2352, !tbaa !1802
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1, !dbg !2353
  %exitcond78 = icmp eq i64 %indvars.iv.next76, %wide.trip.count77, !dbg !2312
  br i1 %exitcond78, label %for.end27.loopexit, label %for.cond1.preheader, !dbg !2313, !llvm.loop !1806

for.end27.loopexit:                               ; preds = %for.end
  br label %for.end27, !dbg !2354

for.end27:                                        ; preds = %for.end27.loopexit, %entry
  ret void, !dbg !2354
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

declare i32 @cudaFree(i8*) local_unnamed_addr #6

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @feof(%struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fscanf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i8* @fgets(i8*, i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fgetc(%struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fclose(%struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i8* @strncpy(i8*, i8* nocapture readonly, i64) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @strtod(i8* readonly, i8** nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) local_unnamed_addr #3

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) local_unnamed_addr #8

; Function Attrs: uwtable
define linkonce_odr void @_ZNSt6vectorI7latLongSaIS0_EE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_(%"class.std::vector.0"* %this, %struct.latLong* %__position.coerce, %struct.latLong* dereferenceable(8) %__x) local_unnamed_addr #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) !dbg !2355 {
entry:
  %0 = ptrtoint %struct.latLong* %__position.coerce to i64
  tail call void @llvm.dbg.value(metadata %"class.std::vector.0"* %this, i64 0, metadata !2358, metadata !1359), !dbg !2370
  tail call void @llvm.dbg.value(metadata %struct.latLong* %__x, i64 0, metadata !2360, metadata !1359), !dbg !2371
  %_M_finish = getelementptr inbounds %"class.std::vector.0", %"class.std::vector.0"* %this, i64 0, i32 0, i32 0, i32 1, !dbg !2372
  %1 = load %struct.latLong*, %struct.latLong** %_M_finish, align 8, !dbg !2372, !tbaa !2227
  %_M_end_of_storage = getelementptr inbounds %"class.std::vector.0", %"class.std::vector.0"* %this, i64 0, i32 0, i32 0, i32 2, !dbg !2373
  %2 = load %struct.latLong*, %struct.latLong** %_M_end_of_storage, align 8, !dbg !2373, !tbaa !2229
  %cmp = icmp eq %struct.latLong* %1, %2, !dbg !2374
  br i1 %cmp, label %if.else, label %if.then, !dbg !2375

if.then:                                          ; preds = %entry
  %add.ptr = getelementptr inbounds %struct.latLong, %struct.latLong* %1, i64 -1, !dbg !2376
  tail call void @llvm.dbg.value(metadata %struct.latLong* %1, i64 0, metadata !2232, metadata !1359), !dbg !2377
  tail call void @llvm.dbg.value(metadata %struct.latLong* %add.ptr, i64 0, metadata !2239, metadata !1359), !dbg !2379
  tail call void @llvm.dbg.value(metadata %struct.latLong* %1, i64 0, metadata !2244, metadata !1359), !dbg !2380
  tail call void @llvm.dbg.value(metadata %struct.latLong* %add.ptr, i64 0, metadata !2248, metadata !1359), !dbg !2382
  %3 = bitcast %struct.latLong* %add.ptr to i64*, !dbg !2383
  %4 = bitcast %struct.latLong* %1 to i64*, !dbg !2383
  %5 = load i64, i64* %3, align 4, !dbg !2383
  store i64 %5, i64* %4, align 4, !dbg !2383
  %6 = load %struct.latLong*, %struct.latLong** %_M_finish, align 8, !dbg !2384, !tbaa !2227
  %incdec.ptr = getelementptr inbounds %struct.latLong, %struct.latLong* %6, i64 1, !dbg !2384
  store %struct.latLong* %incdec.ptr, %struct.latLong** %_M_finish, align 8, !dbg !2384, !tbaa !2227
  %7 = bitcast %struct.latLong* %__x to i64*, !dbg !2385
  %8 = load i64, i64* %7, align 4, !dbg !2385
  tail call void @llvm.dbg.value(metadata %"class.__gnu_cxx::__normal_iterator"* undef, i64 0, metadata !2359, metadata !1329), !dbg !2386
  %add.ptr12 = getelementptr inbounds %struct.latLong, %struct.latLong* %6, i64 -1, !dbg !2387
  tail call void @llvm.dbg.value(metadata %struct.latLong* %__position.coerce, i64 0, metadata !2388, metadata !1359), !dbg !2399
  tail call void @llvm.dbg.value(metadata %struct.latLong* %add.ptr12, i64 0, metadata !2397, metadata !1359), !dbg !2402
  tail call void @llvm.dbg.value(metadata %struct.latLong* %6, i64 0, metadata !2398, metadata !1359), !dbg !2403
  tail call void @llvm.dbg.value(metadata %struct.latLong* %__position.coerce, i64 0, metadata !2404, metadata !1359), !dbg !2411
  tail call void @llvm.dbg.value(metadata %struct.latLong* %add.ptr12, i64 0, metadata !2409, metadata !1359), !dbg !2413
  tail call void @llvm.dbg.value(metadata %struct.latLong* %6, i64 0, metadata !2410, metadata !1359), !dbg !2414
  tail call void @llvm.dbg.value(metadata %struct.latLong* %__position.coerce, i64 0, metadata !2415, metadata !1359), !dbg !2422
  tail call void @llvm.dbg.value(metadata %struct.latLong* %add.ptr12, i64 0, metadata !2418, metadata !1359), !dbg !2424
  tail call void @llvm.dbg.value(metadata %struct.latLong* %6, i64 0, metadata !2419, metadata !1359), !dbg !2425
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !2420, metadata !1359), !dbg !2426
  tail call void @llvm.dbg.value(metadata %struct.latLong* %__position.coerce, i64 0, metadata !2427, metadata !1359) #11, !dbg !2452
  tail call void @llvm.dbg.value(metadata %struct.latLong* %add.ptr12, i64 0, metadata !2448, metadata !1359) #11, !dbg !2454
  tail call void @llvm.dbg.value(metadata %struct.latLong* %6, i64 0, metadata !2449, metadata !1359) #11, !dbg !2455
  %sub.ptr.lhs.cast.i.i.i.i = ptrtoint %struct.latLong* %add.ptr12 to i64, !dbg !2456
  %sub.ptr.sub.i.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i.i, %0, !dbg !2456
  %sub.ptr.div.i.i.i.i = ashr exact i64 %sub.ptr.sub.i.i.i.i, 3, !dbg !2456
  tail call void @llvm.dbg.value(metadata i64 %sub.ptr.div.i.i.i.i, i64 0, metadata !2450, metadata !1359) #11, !dbg !2457
  %tobool.i.i.i.i = icmp eq i64 %sub.ptr.div.i.i.i.i, 0, !dbg !2458
  br i1 %tobool.i.i.i.i, label %_ZSt13copy_backwardIP7latLongS1_ET0_T_S3_S2_.exit, label %if.then.i.i.i.i, !dbg !2460

if.then.i.i.i.i:                                  ; preds = %if.then
  %idx.neg.i.i.i.i = sub nsw i64 0, %sub.ptr.div.i.i.i.i, !dbg !2461
  %.pre.i.i.i.i = getelementptr inbounds %struct.latLong, %struct.latLong* %6, i64 %idx.neg.i.i.i.i
  %9 = bitcast %struct.latLong* %.pre.i.i.i.i to i8*, !dbg !2462
  %10 = bitcast %struct.latLong* %__position.coerce to i8*, !dbg !2462
  tail call void @llvm.memmove.p0i8.p0i8.i64(i8* %9, i8* %10, i64 %sub.ptr.sub.i.i.i.i, i32 4, i1 false) #11, !dbg !2462
  br label %_ZSt13copy_backwardIP7latLongS1_ET0_T_S3_S2_.exit, !dbg !2462

_ZSt13copy_backwardIP7latLongS1_ET0_T_S3_S2_.exit: ; preds = %if.then, %if.then.i.i.i.i
  tail call void @llvm.dbg.value(metadata %"class.__gnu_cxx::__normal_iterator"* undef, i64 0, metadata !2359, metadata !1329), !dbg !2386
  %11 = bitcast %struct.latLong* %__position.coerce to i64*, !dbg !2463
  store i64 %8, i64* %11, align 4, !dbg !2463
  br label %if.end70, !dbg !2464

if.else:                                          ; preds = %entry
  %12 = ptrtoint %struct.latLong* %1 to i64, !dbg !2375
  tail call void @llvm.dbg.value(metadata %"class.std::vector.0"* %this, i64 0, metadata !2465, metadata !1359), !dbg !2472
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !2468, metadata !1359), !dbg !2474
  tail call void @llvm.dbg.value(metadata %"class.std::vector.0"* %this, i64 0, metadata !2475, metadata !1359), !dbg !2478
  %13 = bitcast %struct.latLong** %_M_finish to i64*, !dbg !2482
  %14 = bitcast %"class.std::vector.0"* %this to i64*, !dbg !2483
  %15 = load i64, i64* %14, align 8, !dbg !2483, !tbaa !1361
  %sub.ptr.sub.i21.i = sub i64 %12, %15, !dbg !2484
  %sub.ptr.div.i22.i = ashr exact i64 %sub.ptr.sub.i21.i, 3, !dbg !2484
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !2468, metadata !1359), !dbg !2474
  tail call void @llvm.dbg.value(metadata %"class.std::vector.0"* %this, i64 0, metadata !2475, metadata !1359), !dbg !2485
  tail call void @llvm.dbg.value(metadata %"class.std::vector.0"* %this, i64 0, metadata !2475, metadata !1359), !dbg !2487
  %cmp.i.i113 = icmp eq i64 %sub.ptr.div.i22.i, 0, !dbg !2490
  %.sroa.speculated.i = select i1 %cmp.i.i113, i64 1, i64 %sub.ptr.div.i22.i, !dbg !2504
  %add.i = add nsw i64 %.sroa.speculated.i, %sub.ptr.div.i22.i, !dbg !2505
  tail call void @llvm.dbg.value(metadata i64 %add.i, i64 0, metadata !2470, metadata !1359), !dbg !2506
  tail call void @llvm.dbg.value(metadata %"class.std::vector.0"* %this, i64 0, metadata !2475, metadata !1359), !dbg !2507
  %cmp7.i = icmp ult i64 %add.i, %sub.ptr.div.i22.i, !dbg !2509
  %cmp9.i = icmp ugt i64 %add.i, 2305843009213693951, !dbg !2510
  %or.cond.i = or i1 %cmp7.i, %cmp9.i, !dbg !2511
  %cond.i114 = select i1 %or.cond.i, i64 2305843009213693951, i64 %add.i, !dbg !2511
  tail call void @llvm.dbg.value(metadata i64 %cond.i114, i64 0, metadata !2364, metadata !1359), !dbg !2512
  tail call void @llvm.dbg.value(metadata %"class.std::vector.0"* %this, i64 0, metadata !2513, metadata !1359), !dbg !2516
  tail call void @llvm.dbg.value(metadata %"class.__gnu_cxx::__normal_iterator"* undef, i64 0, metadata !2518, metadata !1359), !dbg !2523
  %16 = getelementptr inbounds %"class.std::vector.0", %"class.std::vector.0"* %this, i64 0, i32 0, i32 0, i32 0, !dbg !2525
  tail call void @llvm.dbg.value(metadata %"class.__gnu_cxx::__normal_iterator"* undef, i64 0, metadata !2359, metadata !1329), !dbg !2386
  tail call void @llvm.dbg.value(metadata %"class.__gnu_cxx::__normal_iterator"* undef, i64 0, metadata !2526, metadata !1359), !dbg !2533
  tail call void @llvm.dbg.value(metadata %"class.__gnu_cxx::__normal_iterator"* undef, i64 0, metadata !2532, metadata !1359), !dbg !2536
  %sub.ptr.sub.i = sub i64 %0, %15, !dbg !2537
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, 3, !dbg !2537
  tail call void @llvm.dbg.value(metadata i64 %sub.ptr.div.i, i64 0, metadata !2367, metadata !1359), !dbg !2538
  tail call void @llvm.dbg.value(metadata i64 %cond.i114, i64 0, metadata !2539, metadata !1359), !dbg !2543
  %cmp.i = icmp eq i64 %cond.i114, 0, !dbg !2545
  %17 = inttoptr i64 %15 to %struct.latLong*, !dbg !2546
  br i1 %cmp.i, label %invoke.cont, label %cond.true.i, !dbg !2546

cond.true.i:                                      ; preds = %if.else
  tail call void @llvm.dbg.value(metadata i64 %cond.i114, i64 0, metadata !2547, metadata !1359), !dbg !2552
  tail call void @llvm.dbg.value(metadata i8* null, i64 0, metadata !2551, metadata !1359), !dbg !2555
  %cmp.i.i = icmp ugt i64 %cond.i114, 2305843009213693951, !dbg !2556
  br i1 %cmp.i.i, label %if.then.i.i, label %_ZN9__gnu_cxx13new_allocatorI7latLongE8allocateEmPKv.exit.i, !dbg !2558

if.then.i.i:                                      ; preds = %cond.true.i
  tail call void @_ZSt17__throw_bad_allocv() #14, !dbg !2559
  unreachable, !dbg !2559

_ZN9__gnu_cxx13new_allocatorI7latLongE8allocateEmPKv.exit.i: ; preds = %cond.true.i
  %mul.i.i = shl i64 %cond.i114, 3, !dbg !2560
  %call2.i.i = tail call i8* @_Znwm(i64 %mul.i.i), !dbg !2561
  %18 = bitcast i8* %call2.i.i to %struct.latLong*, !dbg !2562
  %.pre = load %struct.latLong*, %struct.latLong** %16, align 8, !tbaa !1656
  br label %invoke.cont, !dbg !2563

invoke.cont:                                      ; preds = %_ZN9__gnu_cxx13new_allocatorI7latLongE8allocateEmPKv.exit.i, %if.else
  %19 = phi %struct.latLong* [ %.pre, %_ZN9__gnu_cxx13new_allocatorI7latLongE8allocateEmPKv.exit.i ], [ %17, %if.else ]
  %20 = phi i8* [ %call2.i.i, %_ZN9__gnu_cxx13new_allocatorI7latLongE8allocateEmPKv.exit.i ], [ null, %if.else ], !dbg !2564
  %cond.i = phi %struct.latLong* [ %18, %_ZN9__gnu_cxx13new_allocatorI7latLongE8allocateEmPKv.exit.i ], [ null, %if.else ], !dbg !2564
  tail call void @llvm.dbg.value(metadata %struct.latLong* %cond.i, i64 0, metadata !2368, metadata !1359), !dbg !2566
  tail call void @llvm.dbg.value(metadata %struct.latLong* %cond.i, i64 0, metadata !2369, metadata !1359), !dbg !2567
  %add.ptr24 = getelementptr inbounds %struct.latLong, %struct.latLong* %cond.i, i64 %sub.ptr.div.i, !dbg !2568
  tail call void @llvm.dbg.value(metadata %struct.latLong* %add.ptr24, i64 0, metadata !2232, metadata !1359), !dbg !2570
  tail call void @llvm.dbg.value(metadata %struct.latLong* %__x, i64 0, metadata !2239, metadata !1359), !dbg !2572
  tail call void @llvm.dbg.value(metadata %struct.latLong* %add.ptr24, i64 0, metadata !2244, metadata !1359), !dbg !2573
  tail call void @llvm.dbg.value(metadata %struct.latLong* %__x, i64 0, metadata !2248, metadata !1359), !dbg !2575
  %21 = bitcast %struct.latLong* %__x to i64*, !dbg !2576
  %22 = bitcast %struct.latLong* %add.ptr24 to i64*, !dbg !2576
  %23 = load i64, i64* %21, align 4, !dbg !2576
  store i64 %23, i64* %22, align 4, !dbg !2576
  tail call void @llvm.dbg.value(metadata %struct.latLong* null, i64 0, metadata !2369, metadata !1359), !dbg !2567
  tail call void @llvm.dbg.value(metadata %"class.__gnu_cxx::__normal_iterator"* undef, i64 0, metadata !2359, metadata !1329), !dbg !2386
  tail call void @llvm.dbg.value(metadata %struct.latLong* %19, i64 0, metadata !2577, metadata !1359), !dbg !2590
  tail call void @llvm.dbg.value(metadata %struct.latLong* %__position.coerce, i64 0, metadata !2587, metadata !1359), !dbg !2592
  tail call void @llvm.dbg.value(metadata %struct.latLong* %cond.i, i64 0, metadata !2588, metadata !1359), !dbg !2593
  tail call void @llvm.dbg.value(metadata %struct.latLong* %19, i64 0, metadata !2594, metadata !1359), !dbg !2601
  tail call void @llvm.dbg.value(metadata %struct.latLong* %__position.coerce, i64 0, metadata !2598, metadata !1359), !dbg !2603
  tail call void @llvm.dbg.value(metadata %struct.latLong* %cond.i, i64 0, metadata !2599, metadata !1359), !dbg !2604
  tail call void @llvm.dbg.value(metadata %struct.latLong* %19, i64 0, metadata !2605, metadata !1359), !dbg !2611
  tail call void @llvm.dbg.value(metadata %struct.latLong* %__position.coerce, i64 0, metadata !2609, metadata !1359), !dbg !2613
  tail call void @llvm.dbg.value(metadata %struct.latLong* %cond.i, i64 0, metadata !2610, metadata !1359), !dbg !2614
  tail call void @llvm.dbg.value(metadata %struct.latLong* %19, i64 0, metadata !2615, metadata !1359), !dbg !2624
  tail call void @llvm.dbg.value(metadata %struct.latLong* %__position.coerce, i64 0, metadata !2622, metadata !1359), !dbg !2626
  tail call void @llvm.dbg.value(metadata %struct.latLong* %cond.i, i64 0, metadata !2623, metadata !1359), !dbg !2627
  tail call void @llvm.dbg.value(metadata %struct.latLong* %19, i64 0, metadata !2628, metadata !1359), !dbg !2636
  tail call void @llvm.dbg.value(metadata %struct.latLong* %__position.coerce, i64 0, metadata !2634, metadata !1359), !dbg !2638
  tail call void @llvm.dbg.value(metadata %struct.latLong* %cond.i, i64 0, metadata !2635, metadata !1359), !dbg !2639
  tail call void @llvm.dbg.value(metadata %struct.latLong* %19, i64 0, metadata !2640, metadata !1359), !dbg !2646
  tail call void @llvm.dbg.value(metadata %struct.latLong* %__position.coerce, i64 0, metadata !2644, metadata !1359), !dbg !2648
  tail call void @llvm.dbg.value(metadata %struct.latLong* %cond.i, i64 0, metadata !2645, metadata !1359), !dbg !2649
  tail call void @llvm.dbg.value(metadata %struct.latLong* %19, i64 0, metadata !2650, metadata !1359), !dbg !2656
  tail call void @llvm.dbg.value(metadata %struct.latLong* %__position.coerce, i64 0, metadata !2653, metadata !1359), !dbg !2659
  tail call void @llvm.dbg.value(metadata %struct.latLong* %cond.i, i64 0, metadata !2654, metadata !1359), !dbg !2660
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !2655, metadata !1359), !dbg !2661
  tail call void @llvm.dbg.value(metadata %struct.latLong* %19, i64 0, metadata !2662, metadata !1359) #11, !dbg !2670
  tail call void @llvm.dbg.value(metadata %struct.latLong* %__position.coerce, i64 0, metadata !2667, metadata !1359) #11, !dbg !2672
  tail call void @llvm.dbg.value(metadata %struct.latLong* %cond.i, i64 0, metadata !2668, metadata !1359) #11, !dbg !2673
  %sub.ptr.rhs.cast.i.i.i.i.i.i.i.i103 = ptrtoint %struct.latLong* %19 to i64, !dbg !2674
  %sub.ptr.sub.i.i.i.i.i.i.i.i104 = sub i64 %0, %sub.ptr.rhs.cast.i.i.i.i.i.i.i.i103, !dbg !2674
  %sub.ptr.div.i.i.i.i.i.i.i.i105 = ashr exact i64 %sub.ptr.sub.i.i.i.i.i.i.i.i104, 3, !dbg !2674
  tail call void @llvm.dbg.value(metadata i64 %sub.ptr.div.i.i.i.i.i.i.i.i105, i64 0, metadata !2669, metadata !1359) #11, !dbg !2675
  %tobool.i.i.i.i.i.i.i.i106 = icmp eq i64 %sub.ptr.div.i.i.i.i.i.i.i.i105, 0, !dbg !2676
  br i1 %tobool.i.i.i.i.i.i.i.i106, label %invoke.cont30, label %if.then.i.i.i.i.i.i.i.i107, !dbg !2678

if.then.i.i.i.i.i.i.i.i107:                       ; preds = %invoke.cont
  %24 = bitcast %struct.latLong* %19 to i8*, !dbg !2679
  tail call void @llvm.memmove.p0i8.p0i8.i64(i8* %20, i8* %24, i64 %sub.ptr.sub.i.i.i.i.i.i.i.i104, i32 4, i1 false) #11, !dbg !2679
  br label %invoke.cont30, !dbg !2679

invoke.cont30:                                    ; preds = %if.then.i.i.i.i.i.i.i.i107, %invoke.cont
  %add.ptr.i.i.i.i.i.i.i.i108 = getelementptr inbounds %struct.latLong, %struct.latLong* %cond.i, i64 %sub.ptr.div.i.i.i.i.i.i.i.i105, !dbg !2680
  tail call void @llvm.dbg.value(metadata %struct.latLong* %add.ptr.i.i.i.i.i.i.i.i108, i64 0, metadata !2369, metadata !1359), !dbg !2567
  %incdec.ptr32 = getelementptr inbounds %struct.latLong, %struct.latLong* %add.ptr.i.i.i.i.i.i.i.i108, i64 1, !dbg !2681
  tail call void @llvm.dbg.value(metadata %struct.latLong* %incdec.ptr32, i64 0, metadata !2369, metadata !1359), !dbg !2567
  tail call void @llvm.dbg.value(metadata %"class.__gnu_cxx::__normal_iterator"* undef, i64 0, metadata !2359, metadata !1329), !dbg !2386
  %25 = load i64, i64* %13, align 8, !dbg !2682, !tbaa !2227
  tail call void @llvm.dbg.value(metadata %struct.latLong* %__position.coerce, i64 0, metadata !2577, metadata !1359), !dbg !2684
  tail call void @llvm.dbg.value(metadata %struct.latLong* %incdec.ptr32, i64 0, metadata !2588, metadata !1359), !dbg !2686
  tail call void @llvm.dbg.value(metadata %struct.latLong* %__position.coerce, i64 0, metadata !2594, metadata !1359), !dbg !2687
  tail call void @llvm.dbg.value(metadata %struct.latLong* %incdec.ptr32, i64 0, metadata !2599, metadata !1359), !dbg !2689
  tail call void @llvm.dbg.value(metadata %struct.latLong* %__position.coerce, i64 0, metadata !2605, metadata !1359), !dbg !2690
  tail call void @llvm.dbg.value(metadata %struct.latLong* %incdec.ptr32, i64 0, metadata !2610, metadata !1359), !dbg !2692
  tail call void @llvm.dbg.value(metadata %struct.latLong* %__position.coerce, i64 0, metadata !2615, metadata !1359), !dbg !2693
  tail call void @llvm.dbg.value(metadata %struct.latLong* %incdec.ptr32, i64 0, metadata !2623, metadata !1359), !dbg !2695
  tail call void @llvm.dbg.value(metadata %struct.latLong* %__position.coerce, i64 0, metadata !2628, metadata !1359), !dbg !2696
  tail call void @llvm.dbg.value(metadata %struct.latLong* %incdec.ptr32, i64 0, metadata !2635, metadata !1359), !dbg !2698
  tail call void @llvm.dbg.value(metadata %struct.latLong* %__position.coerce, i64 0, metadata !2640, metadata !1359), !dbg !2699
  tail call void @llvm.dbg.value(metadata %struct.latLong* %incdec.ptr32, i64 0, metadata !2645, metadata !1359), !dbg !2701
  tail call void @llvm.dbg.value(metadata %struct.latLong* %__position.coerce, i64 0, metadata !2650, metadata !1359), !dbg !2702
  tail call void @llvm.dbg.value(metadata %struct.latLong* %incdec.ptr32, i64 0, metadata !2654, metadata !1359), !dbg !2704
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !2655, metadata !1359), !dbg !2705
  tail call void @llvm.dbg.value(metadata %struct.latLong* %__position.coerce, i64 0, metadata !2662, metadata !1359) #11, !dbg !2706
  tail call void @llvm.dbg.value(metadata %struct.latLong* %incdec.ptr32, i64 0, metadata !2668, metadata !1359) #11, !dbg !2708
  %sub.ptr.sub.i.i.i.i.i.i.i.i = sub i64 %25, %0, !dbg !2709
  %sub.ptr.div.i.i.i.i.i.i.i.i = ashr exact i64 %sub.ptr.sub.i.i.i.i.i.i.i.i, 3, !dbg !2709
  tail call void @llvm.dbg.value(metadata i64 %sub.ptr.div.i.i.i.i.i.i.i.i, i64 0, metadata !2669, metadata !1359) #11, !dbg !2710
  %tobool.i.i.i.i.i.i.i.i = icmp eq i64 %sub.ptr.div.i.i.i.i.i.i.i.i, 0, !dbg !2711
  br i1 %tobool.i.i.i.i.i.i.i.i, label %invoke.cont39, label %if.then.i.i.i.i.i.i.i.i, !dbg !2712

if.then.i.i.i.i.i.i.i.i:                          ; preds = %invoke.cont30
  %26 = bitcast %struct.latLong* %incdec.ptr32 to i8*, !dbg !2713
  %27 = bitcast %struct.latLong* %__position.coerce to i8*, !dbg !2713
  tail call void @llvm.memmove.p0i8.p0i8.i64(i8* %26, i8* %27, i64 %sub.ptr.sub.i.i.i.i.i.i.i.i, i32 4, i1 false) #11, !dbg !2713
  br label %invoke.cont39, !dbg !2713

invoke.cont39:                                    ; preds = %if.then.i.i.i.i.i.i.i.i, %invoke.cont30
  %add.ptr.i.i.i.i.i.i.i.i = getelementptr inbounds %struct.latLong, %struct.latLong* %incdec.ptr32, i64 %sub.ptr.div.i.i.i.i.i.i.i.i, !dbg !2714
  tail call void @llvm.dbg.value(metadata %struct.latLong* %add.ptr.i.i.i.i.i.i.i.i, i64 0, metadata !2369, metadata !1359), !dbg !2567
  tail call void @llvm.dbg.value(metadata %struct.latLong* %19, i64 0, metadata !1861, metadata !1359), !dbg !2715
  %tobool.i97 = icmp eq %struct.latLong* %19, null, !dbg !2717
  br i1 %tobool.i97, label %_ZNSt12_Vector_baseI7latLongSaIS0_EE13_M_deallocateEPS0_m.exit99, label %if.then.i98, !dbg !2718

if.then.i98:                                      ; preds = %invoke.cont39
  tail call void @llvm.dbg.value(metadata %struct.latLong* %19, i64 0, metadata !1871, metadata !1359) #11, !dbg !2719
  %28 = bitcast %struct.latLong* %19 to i8*, !dbg !2721
  tail call void @_ZdlPv(i8* %28) #11, !dbg !2722
  br label %_ZNSt12_Vector_baseI7latLongSaIS0_EE13_M_deallocateEPS0_m.exit99, !dbg !2723

_ZNSt12_Vector_baseI7latLongSaIS0_EE13_M_deallocateEPS0_m.exit99: ; preds = %invoke.cont39, %if.then.i98
  %29 = bitcast %"class.std::vector.0"* %this to i8**, !dbg !2724
  store i8* %20, i8** %29, align 8, !dbg !2724, !tbaa !1656
  store %struct.latLong* %add.ptr.i.i.i.i.i.i.i.i, %struct.latLong** %_M_finish, align 8, !dbg !2725, !tbaa !2227
  %add.ptr67 = getelementptr inbounds %struct.latLong, %struct.latLong* %cond.i, i64 %cond.i114, !dbg !2726
  store %struct.latLong* %add.ptr67, %struct.latLong** %_M_end_of_storage, align 8, !dbg !2727, !tbaa !2229
  br label %if.end70

if.end70:                                         ; preds = %_ZNSt12_Vector_baseI7latLongSaIS0_EE13_M_deallocateEPS0_m.exit99, %_ZSt13copy_backwardIP7latLongS1_ET0_T_S3_S2_.exit
  ret void, !dbg !2728
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: noreturn
declare void @_ZSt17__throw_bad_allocv() local_unnamed_addr #9

; Function Attrs: nobuiltin
declare noalias nonnull i8* @_Znwm(i64) local_unnamed_addr #10

; Function Attrs: uwtable
define linkonce_odr void @_ZNSt6vectorI6recordSaIS0_EE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_(%"class.std::vector"* %this, %struct.record* %__position.coerce, %struct.record* dereferenceable(60) %__x) local_unnamed_addr #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) !dbg !2730 {
entry:
  %__x_copy = alloca %struct.record, align 4
  %0 = ptrtoint %struct.record* %__position.coerce to i64
  tail call void @llvm.dbg.value(metadata %"class.std::vector"* %this, i64 0, metadata !2732, metadata !1359), !dbg !2743
  tail call void @llvm.dbg.value(metadata %struct.record* %__x, i64 0, metadata !2734, metadata !1359), !dbg !2744
  %_M_finish = getelementptr inbounds %"class.std::vector", %"class.std::vector"* %this, i64 0, i32 0, i32 0, i32 1, !dbg !2745
  %1 = load %struct.record*, %struct.record** %_M_finish, align 8, !dbg !2745, !tbaa !2267
  %_M_end_of_storage = getelementptr inbounds %"class.std::vector", %"class.std::vector"* %this, i64 0, i32 0, i32 0, i32 2, !dbg !2746
  %2 = load %struct.record*, %struct.record** %_M_end_of_storage, align 8, !dbg !2746, !tbaa !2269
  %cmp = icmp eq %struct.record* %1, %2, !dbg !2747
  br i1 %cmp, label %if.else, label %if.then, !dbg !2748

if.then:                                          ; preds = %entry
  tail call void @llvm.dbg.value(metadata %struct.record* %1, i64 0, metadata !2272, metadata !1359), !dbg !2749
  tail call void @llvm.dbg.value(metadata %struct.record* %1, i64 0, metadata !2284, metadata !1359) #11, !dbg !2751
  %3 = getelementptr inbounds %struct.record, %struct.record* %1, i64 0, i32 0, i64 0, !dbg !2753
  %4 = getelementptr inbounds %struct.record, %struct.record* %1, i64 -1, i32 0, i64 0, !dbg !2754
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* nonnull %4, i64 60, i32 4, i1 false) #11, !dbg !2754, !tbaa.struct !1787
  %5 = load %struct.record*, %struct.record** %_M_finish, align 8, !dbg !2755, !tbaa !2267
  %incdec.ptr = getelementptr inbounds %struct.record, %struct.record* %5, i64 1, !dbg !2755
  store %struct.record* %incdec.ptr, %struct.record** %_M_finish, align 8, !dbg !2755, !tbaa !2267
  %__x_copy.0.__x_copy.0..sroa_idx = getelementptr inbounds %struct.record, %struct.record* %__x_copy, i64 0, i32 0, i64 0, !dbg !2756
  call void @llvm.lifetime.start(i64 60, i8* nonnull %__x_copy.0.__x_copy.0..sroa_idx), !dbg !2756
  %6 = getelementptr inbounds %struct.record, %struct.record* %__x, i64 0, i32 0, i64 0, !dbg !2757
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %__x_copy.0.__x_copy.0..sroa_idx, i8* nonnull %6, i64 60, i32 4, i1 false), !dbg !2757, !tbaa.struct !1787
  tail call void @llvm.dbg.value(metadata %"class.__gnu_cxx::__normal_iterator.5"* undef, i64 0, metadata !2733, metadata !1329), !dbg !2758
  %add.ptr12 = getelementptr inbounds %struct.record, %struct.record* %5, i64 -1, !dbg !2759
  tail call void @llvm.dbg.value(metadata %struct.record* %__position.coerce, i64 0, metadata !2760, metadata !1359), !dbg !2770
  tail call void @llvm.dbg.value(metadata %struct.record* %add.ptr12, i64 0, metadata !2768, metadata !1359), !dbg !2773
  tail call void @llvm.dbg.value(metadata %struct.record* %5, i64 0, metadata !2769, metadata !1359), !dbg !2774
  tail call void @llvm.dbg.value(metadata %struct.record* %__position.coerce, i64 0, metadata !2775, metadata !1359), !dbg !2781
  tail call void @llvm.dbg.value(metadata %struct.record* %add.ptr12, i64 0, metadata !2779, metadata !1359), !dbg !2783
  tail call void @llvm.dbg.value(metadata %struct.record* %5, i64 0, metadata !2780, metadata !1359), !dbg !2784
  tail call void @llvm.dbg.value(metadata %struct.record* %__position.coerce, i64 0, metadata !2785, metadata !1359), !dbg !2791
  tail call void @llvm.dbg.value(metadata %struct.record* %add.ptr12, i64 0, metadata !2788, metadata !1359), !dbg !2793
  tail call void @llvm.dbg.value(metadata %struct.record* %5, i64 0, metadata !2789, metadata !1359), !dbg !2794
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !2790, metadata !1359), !dbg !2795
  tail call void @llvm.dbg.value(metadata %struct.record* %__position.coerce, i64 0, metadata !2796, metadata !1359) #11, !dbg !2805
  tail call void @llvm.dbg.value(metadata %struct.record* %add.ptr12, i64 0, metadata !2802, metadata !1359) #11, !dbg !2807
  tail call void @llvm.dbg.value(metadata %struct.record* %5, i64 0, metadata !2803, metadata !1359) #11, !dbg !2808
  %sub.ptr.lhs.cast.i.i.i.i = ptrtoint %struct.record* %add.ptr12 to i64, !dbg !2809
  %sub.ptr.sub.i.i.i.i = sub i64 %sub.ptr.lhs.cast.i.i.i.i, %0, !dbg !2809
  %7 = icmp eq i64 %sub.ptr.sub.i.i.i.i, 0, !dbg !2810
  br i1 %7, label %if.then._ZSt13copy_backwardIP6recordS1_ET0_T_S3_S2_.exit_crit_edge, label %if.then.i.i.i.i, !dbg !2812

if.then._ZSt13copy_backwardIP6recordS1_ET0_T_S3_S2_.exit_crit_edge: ; preds = %if.then
  %.pre119 = getelementptr inbounds %struct.record, %struct.record* %__position.coerce, i64 0, i32 0, i64 0, !dbg !2813
  br label %_ZSt13copy_backwardIP6recordS1_ET0_T_S3_S2_.exit, !dbg !2812

if.then.i.i.i.i:                                  ; preds = %if.then
  %idx.neg.i.i.i.i = sdiv i64 %sub.ptr.sub.i.i.i.i, -60, !dbg !2814
  %8 = getelementptr inbounds %struct.record, %struct.record* %5, i64 %idx.neg.i.i.i.i, i32 0, i64 0, !dbg !2815
  %9 = getelementptr inbounds %struct.record, %struct.record* %__position.coerce, i64 0, i32 0, i64 0, !dbg !2815
  tail call void @llvm.memmove.p0i8.p0i8.i64(i8* %8, i8* %9, i64 %sub.ptr.sub.i.i.i.i, i32 4, i1 false) #11, !dbg !2815
  br label %_ZSt13copy_backwardIP6recordS1_ET0_T_S3_S2_.exit, !dbg !2815

_ZSt13copy_backwardIP6recordS1_ET0_T_S3_S2_.exit: ; preds = %if.then._ZSt13copy_backwardIP6recordS1_ET0_T_S3_S2_.exit_crit_edge, %if.then.i.i.i.i
  %.pre-phi = phi i8* [ %.pre119, %if.then._ZSt13copy_backwardIP6recordS1_ET0_T_S3_S2_.exit_crit_edge ], [ %9, %if.then.i.i.i.i ], !dbg !2813
  tail call void @llvm.dbg.value(metadata %"class.__gnu_cxx::__normal_iterator.5"* undef, i64 0, metadata !2733, metadata !1329), !dbg !2758
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %.pre-phi, i8* nonnull %__x_copy.0.__x_copy.0..sroa_idx, i64 60, i32 4, i1 false), !dbg !2813, !tbaa.struct !1787
  call void @llvm.lifetime.end(i64 60, i8* nonnull %__x_copy.0.__x_copy.0..sroa_idx), !dbg !2816
  br label %if.end70, !dbg !2817

if.else:                                          ; preds = %entry
  %10 = ptrtoint %struct.record* %1 to i64, !dbg !2748
  tail call void @llvm.dbg.value(metadata %"class.std::vector"* %this, i64 0, metadata !2818, metadata !1359), !dbg !2825
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !2821, metadata !1359), !dbg !2827
  tail call void @llvm.dbg.value(metadata %"class.std::vector"* %this, i64 0, metadata !2828, metadata !1359), !dbg !2831
  %11 = bitcast %struct.record** %_M_finish to i64*, !dbg !2835
  %12 = bitcast %"class.std::vector"* %this to i64*, !dbg !2836
  %13 = load i64, i64* %12, align 8, !dbg !2836, !tbaa !1361
  %sub.ptr.sub.i21.i = sub i64 %10, %13, !dbg !2837
  %sub.ptr.div.i22.i = sdiv exact i64 %sub.ptr.sub.i21.i, 60, !dbg !2837
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !2821, metadata !1359), !dbg !2827
  tail call void @llvm.dbg.value(metadata %"class.std::vector"* %this, i64 0, metadata !2828, metadata !1359), !dbg !2838
  tail call void @llvm.dbg.value(metadata %"class.std::vector"* %this, i64 0, metadata !2828, metadata !1359), !dbg !2840
  %14 = icmp eq i64 %sub.ptr.sub.i21.i, 0, !dbg !2843
  %.sroa.speculated.i = select i1 %14, i64 1, i64 %sub.ptr.div.i22.i, !dbg !2846
  %add.i = add nsw i64 %.sroa.speculated.i, %sub.ptr.div.i22.i, !dbg !2847
  tail call void @llvm.dbg.value(metadata i64 %add.i, i64 0, metadata !2823, metadata !1359), !dbg !2848
  tail call void @llvm.dbg.value(metadata %"class.std::vector"* %this, i64 0, metadata !2828, metadata !1359), !dbg !2849
  %cmp7.i = icmp ult i64 %add.i, %sub.ptr.div.i22.i, !dbg !2851
  %cmp9.i = icmp ugt i64 %add.i, 307445734561825860, !dbg !2852
  %or.cond.i = or i1 %cmp7.i, %cmp9.i, !dbg !2853
  %cond.i113 = select i1 %or.cond.i, i64 307445734561825860, i64 %add.i, !dbg !2853
  tail call void @llvm.dbg.value(metadata i64 %cond.i113, i64 0, metadata !2738, metadata !1359), !dbg !2854
  tail call void @llvm.dbg.value(metadata %"class.std::vector"* %this, i64 0, metadata !2855, metadata !1359), !dbg !2858
  tail call void @llvm.dbg.value(metadata %"class.__gnu_cxx::__normal_iterator.5"* undef, i64 0, metadata !2860, metadata !1359), !dbg !2865
  %15 = getelementptr inbounds %"class.std::vector", %"class.std::vector"* %this, i64 0, i32 0, i32 0, i32 0, !dbg !2867
  tail call void @llvm.dbg.value(metadata %"class.__gnu_cxx::__normal_iterator.5"* undef, i64 0, metadata !2733, metadata !1329), !dbg !2758
  tail call void @llvm.dbg.value(metadata %"class.__gnu_cxx::__normal_iterator.5"* undef, i64 0, metadata !2868, metadata !1359), !dbg !2875
  tail call void @llvm.dbg.value(metadata %"class.__gnu_cxx::__normal_iterator.5"* undef, i64 0, metadata !2874, metadata !1359), !dbg !2878
  %sub.ptr.sub.i = sub i64 %0, %13, !dbg !2879
  %sub.ptr.div.i = sdiv exact i64 %sub.ptr.sub.i, 60, !dbg !2879
  tail call void @llvm.dbg.value(metadata i64 %sub.ptr.div.i, i64 0, metadata !2740, metadata !1359), !dbg !2880
  tail call void @llvm.dbg.value(metadata i64 %cond.i113, i64 0, metadata !2881, metadata !1359), !dbg !2885
  %cmp.i = icmp eq i64 %cond.i113, 0, !dbg !2887
  %16 = inttoptr i64 %13 to %struct.record*, !dbg !2888
  br i1 %cmp.i, label %invoke.cont, label %cond.true.i, !dbg !2888

cond.true.i:                                      ; preds = %if.else
  tail call void @llvm.dbg.value(metadata i64 %cond.i113, i64 0, metadata !2889, metadata !1359), !dbg !2894
  tail call void @llvm.dbg.value(metadata i8* null, i64 0, metadata !2893, metadata !1359), !dbg !2897
  %cmp.i.i = icmp ugt i64 %cond.i113, 307445734561825860, !dbg !2898
  br i1 %cmp.i.i, label %if.then.i.i, label %_ZN9__gnu_cxx13new_allocatorI6recordE8allocateEmPKv.exit.i, !dbg !2900

if.then.i.i:                                      ; preds = %cond.true.i
  tail call void @_ZSt17__throw_bad_allocv() #14, !dbg !2901
  unreachable, !dbg !2901

_ZN9__gnu_cxx13new_allocatorI6recordE8allocateEmPKv.exit.i: ; preds = %cond.true.i
  %mul.i.i = mul i64 %cond.i113, 60, !dbg !2902
  %call2.i.i = tail call i8* @_Znwm(i64 %mul.i.i), !dbg !2903
  %17 = bitcast i8* %call2.i.i to %struct.record*, !dbg !2904
  %.pre = load %struct.record*, %struct.record** %15, align 8, !tbaa !1745
  br label %invoke.cont, !dbg !2905

invoke.cont:                                      ; preds = %_ZN9__gnu_cxx13new_allocatorI6recordE8allocateEmPKv.exit.i, %if.else
  %18 = phi %struct.record* [ %.pre, %_ZN9__gnu_cxx13new_allocatorI6recordE8allocateEmPKv.exit.i ], [ %16, %if.else ]
  %cond.i = phi %struct.record* [ %17, %_ZN9__gnu_cxx13new_allocatorI6recordE8allocateEmPKv.exit.i ], [ null, %if.else ], !dbg !2906
  tail call void @llvm.dbg.value(metadata %struct.record* %cond.i, i64 0, metadata !2741, metadata !1359), !dbg !2908
  tail call void @llvm.dbg.value(metadata %struct.record* %cond.i, i64 0, metadata !2742, metadata !1359), !dbg !2909
  tail call void @llvm.dbg.value(metadata %struct.record* %__x, i64 0, metadata !2279, metadata !1359), !dbg !2910
  tail call void @llvm.dbg.value(metadata %struct.record* %__x, i64 0, metadata !2288, metadata !1359) #11, !dbg !2913
  %19 = getelementptr inbounds %struct.record, %struct.record* %cond.i, i64 %sub.ptr.div.i, i32 0, i64 0, !dbg !2915
  %20 = getelementptr inbounds %struct.record, %struct.record* %__x, i64 0, i32 0, i64 0, !dbg !2916
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %19, i8* nonnull %20, i64 60, i32 4, i1 false) #11, !dbg !2916, !tbaa.struct !1787
  tail call void @llvm.dbg.value(metadata %struct.record* null, i64 0, metadata !2742, metadata !1359), !dbg !2909
  tail call void @llvm.dbg.value(metadata %"class.__gnu_cxx::__normal_iterator.5"* undef, i64 0, metadata !2733, metadata !1329), !dbg !2758
  tail call void @llvm.dbg.value(metadata %struct.record* %18, i64 0, metadata !2917, metadata !1359), !dbg !2929
  tail call void @llvm.dbg.value(metadata %struct.record* %__position.coerce, i64 0, metadata !2926, metadata !1359), !dbg !2931
  tail call void @llvm.dbg.value(metadata %struct.record* %cond.i, i64 0, metadata !2927, metadata !1359), !dbg !2932
  tail call void @llvm.dbg.value(metadata %struct.record* %18, i64 0, metadata !2933, metadata !1359), !dbg !2940
  tail call void @llvm.dbg.value(metadata %struct.record* %__position.coerce, i64 0, metadata !2937, metadata !1359), !dbg !2942
  tail call void @llvm.dbg.value(metadata %struct.record* %cond.i, i64 0, metadata !2938, metadata !1359), !dbg !2943
  tail call void @llvm.dbg.value(metadata %struct.record* %18, i64 0, metadata !2944, metadata !1359), !dbg !2950
  tail call void @llvm.dbg.value(metadata %struct.record* %__position.coerce, i64 0, metadata !2948, metadata !1359), !dbg !2952
  tail call void @llvm.dbg.value(metadata %struct.record* %cond.i, i64 0, metadata !2949, metadata !1359), !dbg !2953
  tail call void @llvm.dbg.value(metadata %struct.record* %18, i64 0, metadata !2954, metadata !1359), !dbg !2960
  tail call void @llvm.dbg.value(metadata %struct.record* %__position.coerce, i64 0, metadata !2958, metadata !1359), !dbg !2962
  tail call void @llvm.dbg.value(metadata %struct.record* %cond.i, i64 0, metadata !2959, metadata !1359), !dbg !2963
  tail call void @llvm.dbg.value(metadata %struct.record* %18, i64 0, metadata !2964, metadata !1359), !dbg !2972
  tail call void @llvm.dbg.value(metadata %struct.record* %__position.coerce, i64 0, metadata !2970, metadata !1359), !dbg !2974
  tail call void @llvm.dbg.value(metadata %struct.record* %cond.i, i64 0, metadata !2971, metadata !1359), !dbg !2975
  tail call void @llvm.dbg.value(metadata %struct.record* %18, i64 0, metadata !2976, metadata !1359), !dbg !2982
  tail call void @llvm.dbg.value(metadata %struct.record* %__position.coerce, i64 0, metadata !2980, metadata !1359), !dbg !2984
  tail call void @llvm.dbg.value(metadata %struct.record* %cond.i, i64 0, metadata !2981, metadata !1359), !dbg !2985
  tail call void @llvm.dbg.value(metadata %struct.record* %18, i64 0, metadata !2986, metadata !1359), !dbg !2992
  tail call void @llvm.dbg.value(metadata %struct.record* %__position.coerce, i64 0, metadata !2989, metadata !1359), !dbg !2995
  tail call void @llvm.dbg.value(metadata %struct.record* %cond.i, i64 0, metadata !2990, metadata !1359), !dbg !2996
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !2991, metadata !1359), !dbg !2997
  tail call void @llvm.dbg.value(metadata %struct.record* %18, i64 0, metadata !2998, metadata !1359) #11, !dbg !3005
  tail call void @llvm.dbg.value(metadata %struct.record* %__position.coerce, i64 0, metadata !3002, metadata !1359) #11, !dbg !3007
  tail call void @llvm.dbg.value(metadata %struct.record* %cond.i, i64 0, metadata !3003, metadata !1359) #11, !dbg !3008
  %sub.ptr.rhs.cast.i.i.i.i.i.i.i.i103 = ptrtoint %struct.record* %18 to i64, !dbg !3009
  %sub.ptr.sub.i.i.i.i.i.i.i.i104 = sub i64 %0, %sub.ptr.rhs.cast.i.i.i.i.i.i.i.i103, !dbg !3009
  %sub.ptr.div.i.i.i.i.i.i.i.i105 = sdiv exact i64 %sub.ptr.sub.i.i.i.i.i.i.i.i104, 60, !dbg !3009
  tail call void @llvm.dbg.value(metadata i64 %sub.ptr.div.i.i.i.i.i.i.i.i105, i64 0, metadata !3004, metadata !1359) #11, !dbg !3010
  %21 = icmp eq i64 %sub.ptr.sub.i.i.i.i.i.i.i.i104, 0, !dbg !3011
  br i1 %21, label %invoke.cont30, label %if.then.i.i.i.i.i.i.i.i106, !dbg !3013

if.then.i.i.i.i.i.i.i.i106:                       ; preds = %invoke.cont
  %22 = getelementptr inbounds %struct.record, %struct.record* %cond.i, i64 0, i32 0, i64 0, !dbg !3014
  %23 = getelementptr inbounds %struct.record, %struct.record* %18, i64 0, i32 0, i64 0, !dbg !3014
  tail call void @llvm.memmove.p0i8.p0i8.i64(i8* %22, i8* %23, i64 %sub.ptr.sub.i.i.i.i.i.i.i.i104, i32 4, i1 false) #11, !dbg !3014
  br label %invoke.cont30, !dbg !3014

invoke.cont30:                                    ; preds = %if.then.i.i.i.i.i.i.i.i106, %invoke.cont
  %add.ptr.i.i.i.i.i.i.i.i107 = getelementptr inbounds %struct.record, %struct.record* %cond.i, i64 %sub.ptr.div.i.i.i.i.i.i.i.i105, !dbg !3015
  tail call void @llvm.dbg.value(metadata %struct.record* %add.ptr.i.i.i.i.i.i.i.i107, i64 0, metadata !2742, metadata !1359), !dbg !2909
  %incdec.ptr32 = getelementptr inbounds %struct.record, %struct.record* %add.ptr.i.i.i.i.i.i.i.i107, i64 1, !dbg !3016
  tail call void @llvm.dbg.value(metadata %struct.record* %incdec.ptr32, i64 0, metadata !2742, metadata !1359), !dbg !2909
  tail call void @llvm.dbg.value(metadata %"class.__gnu_cxx::__normal_iterator.5"* undef, i64 0, metadata !2733, metadata !1329), !dbg !2758
  %24 = load i64, i64* %11, align 8, !dbg !3017, !tbaa !2267
  tail call void @llvm.dbg.value(metadata %struct.record* %__position.coerce, i64 0, metadata !2917, metadata !1359), !dbg !3019
  tail call void @llvm.dbg.value(metadata %struct.record* %incdec.ptr32, i64 0, metadata !2927, metadata !1359), !dbg !3021
  tail call void @llvm.dbg.value(metadata %struct.record* %__position.coerce, i64 0, metadata !2933, metadata !1359), !dbg !3022
  tail call void @llvm.dbg.value(metadata %struct.record* %incdec.ptr32, i64 0, metadata !2938, metadata !1359), !dbg !3024
  tail call void @llvm.dbg.value(metadata %struct.record* %__position.coerce, i64 0, metadata !2944, metadata !1359), !dbg !3025
  tail call void @llvm.dbg.value(metadata %struct.record* %incdec.ptr32, i64 0, metadata !2949, metadata !1359), !dbg !3027
  tail call void @llvm.dbg.value(metadata %struct.record* %__position.coerce, i64 0, metadata !2954, metadata !1359), !dbg !3028
  tail call void @llvm.dbg.value(metadata %struct.record* %incdec.ptr32, i64 0, metadata !2959, metadata !1359), !dbg !3030
  tail call void @llvm.dbg.value(metadata %struct.record* %__position.coerce, i64 0, metadata !2964, metadata !1359), !dbg !3031
  tail call void @llvm.dbg.value(metadata %struct.record* %incdec.ptr32, i64 0, metadata !2971, metadata !1359), !dbg !3033
  tail call void @llvm.dbg.value(metadata %struct.record* %__position.coerce, i64 0, metadata !2976, metadata !1359), !dbg !3034
  tail call void @llvm.dbg.value(metadata %struct.record* %incdec.ptr32, i64 0, metadata !2981, metadata !1359), !dbg !3036
  tail call void @llvm.dbg.value(metadata %struct.record* %__position.coerce, i64 0, metadata !2986, metadata !1359), !dbg !3037
  tail call void @llvm.dbg.value(metadata %struct.record* %incdec.ptr32, i64 0, metadata !2990, metadata !1359), !dbg !3039
  tail call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !2991, metadata !1359), !dbg !3040
  tail call void @llvm.dbg.value(metadata %struct.record* %__position.coerce, i64 0, metadata !2998, metadata !1359) #11, !dbg !3041
  tail call void @llvm.dbg.value(metadata %struct.record* %incdec.ptr32, i64 0, metadata !3003, metadata !1359) #11, !dbg !3043
  %sub.ptr.sub.i.i.i.i.i.i.i.i = sub i64 %24, %0, !dbg !3044
  %sub.ptr.div.i.i.i.i.i.i.i.i = sdiv exact i64 %sub.ptr.sub.i.i.i.i.i.i.i.i, 60, !dbg !3044
  tail call void @llvm.dbg.value(metadata i64 %sub.ptr.div.i.i.i.i.i.i.i.i, i64 0, metadata !3004, metadata !1359) #11, !dbg !3045
  %25 = icmp eq i64 %sub.ptr.sub.i.i.i.i.i.i.i.i, 0, !dbg !3046
  br i1 %25, label %invoke.cont39, label %if.then.i.i.i.i.i.i.i.i, !dbg !3047

if.then.i.i.i.i.i.i.i.i:                          ; preds = %invoke.cont30
  %26 = getelementptr inbounds %struct.record, %struct.record* %incdec.ptr32, i64 0, i32 0, i64 0, !dbg !3048
  %27 = getelementptr inbounds %struct.record, %struct.record* %__position.coerce, i64 0, i32 0, i64 0, !dbg !3048
  tail call void @llvm.memmove.p0i8.p0i8.i64(i8* %26, i8* %27, i64 %sub.ptr.sub.i.i.i.i.i.i.i.i, i32 4, i1 false) #11, !dbg !3048
  br label %invoke.cont39, !dbg !3048

invoke.cont39:                                    ; preds = %if.then.i.i.i.i.i.i.i.i, %invoke.cont30
  %add.ptr.i.i.i.i.i.i.i.i = getelementptr inbounds %struct.record, %struct.record* %incdec.ptr32, i64 %sub.ptr.div.i.i.i.i.i.i.i.i, !dbg !3049
  tail call void @llvm.dbg.value(metadata %struct.record* %add.ptr.i.i.i.i.i.i.i.i, i64 0, metadata !2742, metadata !1359), !dbg !2909
  tail call void @llvm.dbg.value(metadata %struct.record* %18, i64 0, metadata !1896, metadata !1359), !dbg !3050
  %tobool.i97 = icmp eq %struct.record* %18, null, !dbg !3052
  br i1 %tobool.i97, label %_ZNSt12_Vector_baseI6recordSaIS0_EE13_M_deallocateEPS0_m.exit99, label %if.then.i98, !dbg !3053

if.then.i98:                                      ; preds = %invoke.cont39
  tail call void @llvm.dbg.value(metadata %struct.record* %18, i64 0, metadata !1906, metadata !1359) #11, !dbg !3054
  %28 = getelementptr inbounds %struct.record, %struct.record* %18, i64 0, i32 0, i64 0, !dbg !3056
  tail call void @_ZdlPv(i8* %28) #11, !dbg !3057
  br label %_ZNSt12_Vector_baseI6recordSaIS0_EE13_M_deallocateEPS0_m.exit99, !dbg !3058

_ZNSt12_Vector_baseI6recordSaIS0_EE13_M_deallocateEPS0_m.exit99: ; preds = %invoke.cont39, %if.then.i98
  store %struct.record* %cond.i, %struct.record** %15, align 8, !dbg !3059, !tbaa !1745
  store %struct.record* %add.ptr.i.i.i.i.i.i.i.i, %struct.record** %_M_finish, align 8, !dbg !3060, !tbaa !2267
  %add.ptr67 = getelementptr inbounds %struct.record, %struct.record* %cond.i, i64 %cond.i113, !dbg !3061
  store %struct.record* %add.ptr67, %struct.record** %_M_end_of_storage, align 8, !dbg !3062, !tbaa !2269
  br label %if.end70

if.end70:                                         ; preds = %_ZNSt12_Vector_baseI6recordSaIS0_EE13_M_deallocateEPS0_m.exit99, %_ZSt13copy_backwardIP6recordS1_ET0_T_S3_S2_.exit
  ret void, !dbg !3063
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #2

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #11

declare i32 @putchar(i32)

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #11

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nobuiltin nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { nobuiltin "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { nounwind }
attributes #12 = { cold }
attributes #13 = { noreturn nounwind }
attributes #14 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!1312, !1313}
!llvm.ident = !{!1314}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !1, producer: "clang version 5.0.0 (trunk 294196)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !38, imports: !761)
!1 = !DIFile(filename: "nn_cuda.cu", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/nnllvm")
!2 = !{!3, !11, !26}
!3 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaMemcpyKind", file: !4, line: 796, size: 32, elements: !5, identifier: "_ZTS14cudaMemcpyKind")
!4 = !DIFile(filename: "/usr/local/cuda/include/driver_types.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/nnllvm")
!5 = !{!6, !7, !8, !9, !10}
!6 = !DIEnumerator(name: "cudaMemcpyHostToHost", value: 0)
!7 = !DIEnumerator(name: "cudaMemcpyHostToDevice", value: 1)
!8 = !DIEnumerator(name: "cudaMemcpyDeviceToHost", value: 2)
!9 = !DIEnumerator(name: "cudaMemcpyDeviceToDevice", value: 3)
!10 = !DIEnumerator(name: "cudaMemcpyDefault", value: 4)
!11 = !DICompositeType(tag: DW_TAG_enumeration_type, scope: !13, file: !12, line: 113, size: 32, elements: !24, identifier: "_ZTSNSt10__are_sameI7latLongS0_EUt_E")
!12 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/bits/cpp_type_traits.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/nnllvm")
!13 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__are_same<latLong, latLong>", scope: !14, file: !12, line: 111, size: 8, elements: !16, templateParams: !17, identifier: "_ZTSSt10__are_sameI7latLongS0_E")
!14 = !DINamespace(name: "std", scope: null, file: !15, line: 195)
!15 = !DIFile(filename: "/home/dshen/llvm/build/bin/../lib/clang/5.0.0/include/__clang_cuda_math_forward_declares.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/nnllvm")
!16 = !{}
!17 = !{!18, !18}
!18 = !DITemplateTypeParameter(type: !19)
!19 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "latLong", file: !1, line: 35, size: 64, elements: !20, identifier: "_ZTS7latLong")
!20 = !{!21, !23}
!21 = !DIDerivedType(tag: DW_TAG_member, name: "lat", scope: !19, file: !1, line: 37, baseType: !22, size: 32)
!22 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "lng", scope: !19, file: !1, line: 38, baseType: !22, size: 32, offset: 32)
!24 = !{!25}
!25 = !DIEnumerator(name: "__value", value: 1)
!26 = !DICompositeType(tag: DW_TAG_enumeration_type, scope: !27, file: !12, line: 113, size: 32, elements: !24, identifier: "_ZTSNSt10__are_sameI6recordS0_EUt_E")
!27 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__are_same<record, record>", scope: !14, file: !12, line: 111, size: 8, elements: !16, templateParams: !28, identifier: "_ZTSSt10__are_sameI6recordS0_E")
!28 = !{!29, !29}
!29 = !DITemplateTypeParameter(type: !30)
!30 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "record", file: !1, line: 41, size: 480, elements: !31, identifier: "_ZTS6record")
!31 = !{!32, !37}
!32 = !DIDerivedType(tag: DW_TAG_member, name: "recString", scope: !30, file: !1, line: 43, baseType: !33, size: 424)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 424, elements: !35)
!34 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!35 = !{!36}
!36 = !DISubrange(count: 53)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "distance", scope: !30, file: !1, line: 44, baseType: !22, size: 32, offset: 448)
!38 = !{!39, !40, !41, !43, !45, !46, !210, !42, !363, !246, !103, !364, !365, !87, !566, !567}
!39 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !42, size: 64)
!42 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64)
!45 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Tp_alloc_type", scope: !49, file: !48, line: 75, baseType: !204)
!48 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/bits/stl_vector.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/nnllvm")
!49 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Vector_base<record, std::allocator<record> >", scope: !14, file: !48, line: 72, size: 192, elements: !50, templateParams: !203, identifier: "_ZTSSt12_Vector_baseI6recordSaIS0_EE")
!50 = !{!51, !167, !172, !177, !181, !184, !189, !192, !195, !196, !199, !202}
!51 = !DIDerivedType(tag: DW_TAG_member, name: "_M_impl", scope: !49, file: !48, line: 164, baseType: !52, size: 192)
!52 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Vector_impl", scope: !49, file: !48, line: 79, size: 192, elements: !53, identifier: "_ZTSNSt12_Vector_baseI6recordSaIS0_EE12_Vector_implE")
!53 = !{!54, !55, !152, !153, !154, !158, !163}
!54 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !52, baseType: !47)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "_M_start", scope: !52, file: !48, line: 82, baseType: !56, size: 64)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !49, file: !48, line: 77, baseType: !57)
!57 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !59, file: !58, line: 199, baseType: !151)
!58 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/ext/alloc_traits.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/nnllvm")
!59 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__alloc_traits<std::allocator<record> >", scope: !60, file: !58, line: 121, size: 8, elements: !61, templateParams: !149, identifier: "_ZTSN9__gnu_cxx14__alloc_traitsISaI6recordEEE")
!60 = !DINamespace(name: "__gnu_cxx", scope: null, file: !12, line: 68)
!61 = !{!62, !134, !137, !140, !143, !146}
!62 = !DISubprogram(name: "allocate", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE8allocateERS2_m", scope: !59, file: !58, line: 208, type: !63, isLocal: false, isDefinition: false, scopeLine: 208, flags: DIFlagPrototyped, isOptimized: true)
!63 = !DISubroutineType(types: !64)
!64 = !{!57, !65, !132}
!65 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !66, size: 64)
!66 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "allocator<record>", scope: !14, file: !67, line: 92, size: 8, elements: !68, templateParams: !120, identifier: "_ZTSSaI6recordE")
!67 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/bits/allocator.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/nnllvm")
!68 = !{!69, !122, !126, !131}
!69 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !66, baseType: !70, flags: DIFlagPublic)
!70 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "new_allocator<record>", scope: !60, file: !71, line: 58, size: 8, elements: !72, templateParams: !120, identifier: "_ZTSN9__gnu_cxx13new_allocatorI6recordEE")
!71 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/ext/new_allocator.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/nnllvm")
!72 = !{!73, !77, !82, !83, !91, !99, !108, !111, !114, !117}
!73 = !DISubprogram(name: "new_allocator", scope: !70, file: !71, line: 79, type: !74, isLocal: false, isDefinition: false, scopeLine: 79, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!74 = !DISubroutineType(types: !75)
!75 = !{null, !76}
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!77 = !DISubprogram(name: "new_allocator", scope: !70, file: !71, line: 81, type: !78, isLocal: false, isDefinition: false, scopeLine: 81, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!78 = !DISubroutineType(types: !79)
!79 = !{null, !76, !80}
!80 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !81, size: 64)
!81 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !70)
!82 = !DISubprogram(name: "~new_allocator", scope: !70, file: !71, line: 86, type: !74, isLocal: false, isDefinition: false, scopeLine: 86, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!83 = !DISubprogram(name: "address", linkageName: "_ZNK9__gnu_cxx13new_allocatorI6recordE7addressERS1_", scope: !70, file: !71, line: 89, type: !84, isLocal: false, isDefinition: false, scopeLine: 89, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!84 = !DISubroutineType(types: !85)
!85 = !{!86, !88, !89}
!86 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !70, file: !71, line: 63, baseType: !87)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!89 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !70, file: !71, line: 65, baseType: !90)
!90 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !30, size: 64)
!91 = !DISubprogram(name: "address", linkageName: "_ZNK9__gnu_cxx13new_allocatorI6recordE7addressERKS1_", scope: !70, file: !71, line: 93, type: !92, isLocal: false, isDefinition: false, scopeLine: 93, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!92 = !DISubroutineType(types: !93)
!93 = !{!94, !88, !97}
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !70, file: !71, line: 64, baseType: !95)
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !30)
!97 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !70, file: !71, line: 66, baseType: !98)
!98 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !96, size: 64)
!99 = !DISubprogram(name: "allocate", linkageName: "_ZN9__gnu_cxx13new_allocatorI6recordE8allocateEmPKv", scope: !70, file: !71, line: 99, type: !100, isLocal: false, isDefinition: false, scopeLine: 99, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!100 = !DISubroutineType(types: !101)
!101 = !{!86, !76, !102, !106}
!102 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", file: !71, line: 61, baseType: !103)
!103 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", scope: !14, file: !104, line: 186, baseType: !105)
!104 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/x86_64-linux-gnu/c++/4.8/bits/c++config.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/nnllvm")
!105 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!106 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !107, size: 64)
!107 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!108 = !DISubprogram(name: "deallocate", linkageName: "_ZN9__gnu_cxx13new_allocatorI6recordE10deallocateEPS1_m", scope: !70, file: !71, line: 109, type: !109, isLocal: false, isDefinition: false, scopeLine: 109, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!109 = !DISubroutineType(types: !110)
!110 = !{null, !76, !86, !102}
!111 = !DISubprogram(name: "max_size", linkageName: "_ZNK9__gnu_cxx13new_allocatorI6recordE8max_sizeEv", scope: !70, file: !71, line: 113, type: !112, isLocal: false, isDefinition: false, scopeLine: 113, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!112 = !DISubroutineType(types: !113)
!113 = !{!102, !88}
!114 = !DISubprogram(name: "construct", linkageName: "_ZN9__gnu_cxx13new_allocatorI6recordE9constructEPS1_RKS1_", scope: !70, file: !71, line: 129, type: !115, isLocal: false, isDefinition: false, scopeLine: 129, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!115 = !DISubroutineType(types: !116)
!116 = !{null, !76, !86, !98}
!117 = !DISubprogram(name: "destroy", linkageName: "_ZN9__gnu_cxx13new_allocatorI6recordE7destroyEPS1_", scope: !70, file: !71, line: 133, type: !118, isLocal: false, isDefinition: false, scopeLine: 133, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!118 = !DISubroutineType(types: !119)
!119 = !{null, !76, !86}
!120 = !{!121}
!121 = !DITemplateTypeParameter(name: "_Tp", type: !30)
!122 = !DISubprogram(name: "allocator", scope: !66, file: !67, line: 113, type: !123, isLocal: false, isDefinition: false, scopeLine: 113, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!123 = !DISubroutineType(types: !124)
!124 = !{null, !125}
!125 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!126 = !DISubprogram(name: "allocator", scope: !66, file: !67, line: 115, type: !127, isLocal: false, isDefinition: false, scopeLine: 115, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!127 = !DISubroutineType(types: !128)
!128 = !{null, !125, !129}
!129 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !130, size: 64)
!130 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !66)
!131 = !DISubprogram(name: "~allocator", scope: !66, file: !67, line: 121, type: !123, isLocal: false, isDefinition: false, scopeLine: 121, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!132 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !59, file: !58, line: 204, baseType: !133)
!133 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !66, file: !67, line: 95, baseType: !103)
!134 = !DISubprogram(name: "deallocate", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE10deallocateERS2_PS1_m", scope: !59, file: !58, line: 211, type: !135, isLocal: false, isDefinition: false, scopeLine: 211, flags: DIFlagPrototyped, isOptimized: true)
!135 = !DISubroutineType(types: !136)
!136 = !{null, !65, !57, !132}
!137 = !DISubprogram(name: "destroy", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE7destroyERS2_PS1_", scope: !59, file: !58, line: 218, type: !138, isLocal: false, isDefinition: false, scopeLine: 218, flags: DIFlagPrototyped, isOptimized: true)
!138 = !DISubroutineType(types: !139)
!139 = !{null, !65, !57}
!140 = !DISubprogram(name: "max_size", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE8max_sizeERKS2_", scope: !59, file: !58, line: 221, type: !141, isLocal: false, isDefinition: false, scopeLine: 221, flags: DIFlagPrototyped, isOptimized: true)
!141 = !DISubroutineType(types: !142)
!142 = !{!132, !129}
!143 = !DISubprogram(name: "_S_select_on_copy", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE17_S_select_on_copyERKS2_", scope: !59, file: !58, line: 224, type: !144, isLocal: false, isDefinition: false, scopeLine: 224, flags: DIFlagPrototyped, isOptimized: true)
!144 = !DISubroutineType(types: !145)
!145 = !{!129, !129}
!146 = !DISubprogram(name: "_S_on_swap", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE10_S_on_swapERS2_S4_", scope: !59, file: !58, line: 226, type: !147, isLocal: false, isDefinition: false, scopeLine: 226, flags: DIFlagPrototyped, isOptimized: true)
!147 = !DISubroutineType(types: !148)
!148 = !{null, !65, !65}
!149 = !{!150}
!150 = !DITemplateTypeParameter(name: "_Alloc", type: !66)
!151 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !66, file: !67, line: 97, baseType: !87)
!152 = !DIDerivedType(tag: DW_TAG_member, name: "_M_finish", scope: !52, file: !48, line: 83, baseType: !56, size: 64, offset: 64)
!153 = !DIDerivedType(tag: DW_TAG_member, name: "_M_end_of_storage", scope: !52, file: !48, line: 84, baseType: !56, size: 64, offset: 128)
!154 = !DISubprogram(name: "_Vector_impl", scope: !52, file: !48, line: 86, type: !155, isLocal: false, isDefinition: false, scopeLine: 86, flags: DIFlagPrototyped, isOptimized: true)
!155 = !DISubroutineType(types: !156)
!156 = !{null, !157}
!157 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!158 = !DISubprogram(name: "_Vector_impl", scope: !52, file: !48, line: 90, type: !159, isLocal: false, isDefinition: false, scopeLine: 90, flags: DIFlagPrototyped, isOptimized: true)
!159 = !DISubroutineType(types: !160)
!160 = !{null, !157, !161}
!161 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !162, size: 64)
!162 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !47)
!163 = !DISubprogram(name: "_M_swap_data", linkageName: "_ZNSt12_Vector_baseI6recordSaIS0_EE12_Vector_impl12_M_swap_dataERS3_", scope: !52, file: !48, line: 101, type: !164, isLocal: false, isDefinition: false, scopeLine: 101, flags: DIFlagPrototyped, isOptimized: true)
!164 = !DISubroutineType(types: !165)
!165 = !{null, !157, !166}
!166 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !52, size: 64)
!167 = !DISubprogram(name: "_M_get_Tp_allocator", linkageName: "_ZNSt12_Vector_baseI6recordSaIS0_EE19_M_get_Tp_allocatorEv", scope: !49, file: !48, line: 113, type: !168, isLocal: false, isDefinition: false, scopeLine: 113, flags: DIFlagPrototyped, isOptimized: true)
!168 = !DISubroutineType(types: !169)
!169 = !{!170, !171}
!170 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !47, size: 64)
!171 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!172 = !DISubprogram(name: "_M_get_Tp_allocator", linkageName: "_ZNKSt12_Vector_baseI6recordSaIS0_EE19_M_get_Tp_allocatorEv", scope: !49, file: !48, line: 117, type: !173, isLocal: false, isDefinition: false, scopeLine: 117, flags: DIFlagPrototyped, isOptimized: true)
!173 = !DISubroutineType(types: !174)
!174 = !{!161, !175}
!175 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !176, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!176 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !49)
!177 = !DISubprogram(name: "get_allocator", linkageName: "_ZNKSt12_Vector_baseI6recordSaIS0_EE13get_allocatorEv", scope: !49, file: !48, line: 121, type: !178, isLocal: false, isDefinition: false, scopeLine: 121, flags: DIFlagPrototyped, isOptimized: true)
!178 = !DISubroutineType(types: !179)
!179 = !{!180, !175}
!180 = !DIDerivedType(tag: DW_TAG_typedef, name: "allocator_type", scope: !49, file: !48, line: 110, baseType: !66)
!181 = !DISubprogram(name: "_Vector_base", scope: !49, file: !48, line: 124, type: !182, isLocal: false, isDefinition: false, scopeLine: 124, flags: DIFlagPrototyped, isOptimized: true)
!182 = !DISubroutineType(types: !183)
!183 = !{null, !171}
!184 = !DISubprogram(name: "_Vector_base", scope: !49, file: !48, line: 127, type: !185, isLocal: false, isDefinition: false, scopeLine: 127, flags: DIFlagPrototyped, isOptimized: true)
!185 = !DISubroutineType(types: !186)
!186 = !{null, !171, !187}
!187 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !188, size: 64)
!188 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !180)
!189 = !DISubprogram(name: "_Vector_base", scope: !49, file: !48, line: 130, type: !190, isLocal: false, isDefinition: false, scopeLine: 130, flags: DIFlagPrototyped, isOptimized: true)
!190 = !DISubroutineType(types: !191)
!191 = !{null, !171, !103}
!192 = !DISubprogram(name: "_Vector_base", scope: !49, file: !48, line: 134, type: !193, isLocal: false, isDefinition: false, scopeLine: 134, flags: DIFlagPrototyped, isOptimized: true)
!193 = !DISubroutineType(types: !194)
!194 = !{null, !171, !103, !187}
!195 = !DISubprogram(name: "~_Vector_base", scope: !49, file: !48, line: 159, type: !182, isLocal: false, isDefinition: false, scopeLine: 159, flags: DIFlagPrototyped, isOptimized: true)
!196 = !DISubprogram(name: "_M_allocate", linkageName: "_ZNSt12_Vector_baseI6recordSaIS0_EE11_M_allocateEm", scope: !49, file: !48, line: 167, type: !197, isLocal: false, isDefinition: false, scopeLine: 167, flags: DIFlagPrototyped, isOptimized: true)
!197 = !DISubroutineType(types: !198)
!198 = !{!56, !171, !103}
!199 = !DISubprogram(name: "_M_deallocate", linkageName: "_ZNSt12_Vector_baseI6recordSaIS0_EE13_M_deallocateEPS0_m", scope: !49, file: !48, line: 171, type: !200, isLocal: false, isDefinition: false, scopeLine: 171, flags: DIFlagPrototyped, isOptimized: true)
!200 = !DISubroutineType(types: !201)
!201 = !{null, !171, !56, !103}
!202 = !DISubprogram(name: "_M_create_storage", linkageName: "_ZNSt12_Vector_baseI6recordSaIS0_EE17_M_create_storageEm", scope: !49, file: !48, line: 179, type: !190, isLocal: false, isDefinition: false, scopeLine: 179, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: true)
!203 = !{!121, !150}
!204 = !DIDerivedType(tag: DW_TAG_typedef, name: "other", scope: !205, file: !58, line: 235, baseType: !206)
!205 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "rebind<record>", scope: !59, file: !58, line: 234, size: 8, elements: !16, templateParams: !120, identifier: "_ZTSN9__gnu_cxx14__alloc_traitsISaI6recordEE6rebindIS1_EE")
!206 = !DIDerivedType(tag: DW_TAG_typedef, name: "other", scope: !207, file: !67, line: 105, baseType: !66)
!207 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "rebind<record>", scope: !66, file: !67, line: 104, size: 8, elements: !16, templateParams: !208, identifier: "_ZTSNSaI6recordE6rebindIS_EE")
!208 = !{!209}
!209 = !DITemplateTypeParameter(name: "_Tp1", type: !30)
!210 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !211, size: 64)
!211 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Tp_alloc_type", scope: !212, file: !48, line: 75, baseType: !357)
!212 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Vector_base<latLong, std::allocator<latLong> >", scope: !14, file: !48, line: 72, size: 192, elements: !213, templateParams: !356, identifier: "_ZTSSt12_Vector_baseI7latLongSaIS0_EE")
!213 = !{!214, !320, !325, !330, !334, !337, !342, !345, !348, !349, !352, !355}
!214 = !DIDerivedType(tag: DW_TAG_member, name: "_M_impl", scope: !212, file: !48, line: 164, baseType: !215, size: 192)
!215 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Vector_impl", scope: !212, file: !48, line: 79, size: 192, elements: !216, identifier: "_ZTSNSt12_Vector_baseI7latLongSaIS0_EE12_Vector_implE")
!216 = !{!217, !218, !305, !306, !307, !311, !316}
!217 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !215, baseType: !211)
!218 = !DIDerivedType(tag: DW_TAG_member, name: "_M_start", scope: !215, file: !48, line: 82, baseType: !219, size: 64)
!219 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !212, file: !48, line: 77, baseType: !220)
!220 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !221, file: !58, line: 199, baseType: !304)
!221 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__alloc_traits<std::allocator<latLong> >", scope: !60, file: !58, line: 121, size: 8, elements: !222, templateParams: !302, identifier: "_ZTSN9__gnu_cxx14__alloc_traitsISaI7latLongEEE")
!222 = !{!223, !287, !290, !293, !296, !299}
!223 = !DISubprogram(name: "allocate", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE8allocateERS2_m", scope: !221, file: !58, line: 208, type: !224, isLocal: false, isDefinition: false, scopeLine: 208, flags: DIFlagPrototyped, isOptimized: true)
!224 = !DISubroutineType(types: !225)
!225 = !{!220, !226, !285}
!226 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !227, size: 64)
!227 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "allocator<latLong>", scope: !14, file: !67, line: 92, size: 8, elements: !228, templateParams: !273, identifier: "_ZTSSaI7latLongE")
!228 = !{!229, !275, !279, !284}
!229 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !227, baseType: !230, flags: DIFlagPublic)
!230 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "new_allocator<latLong>", scope: !60, file: !71, line: 58, size: 8, elements: !231, templateParams: !273, identifier: "_ZTSN9__gnu_cxx13new_allocatorI7latLongEE")
!231 = !{!232, !236, !241, !242, !250, !258, !261, !264, !267, !270}
!232 = !DISubprogram(name: "new_allocator", scope: !230, file: !71, line: 79, type: !233, isLocal: false, isDefinition: false, scopeLine: 79, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!233 = !DISubroutineType(types: !234)
!234 = !{null, !235}
!235 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !230, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!236 = !DISubprogram(name: "new_allocator", scope: !230, file: !71, line: 81, type: !237, isLocal: false, isDefinition: false, scopeLine: 81, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!237 = !DISubroutineType(types: !238)
!238 = !{null, !235, !239}
!239 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !240, size: 64)
!240 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !230)
!241 = !DISubprogram(name: "~new_allocator", scope: !230, file: !71, line: 86, type: !233, isLocal: false, isDefinition: false, scopeLine: 86, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!242 = !DISubprogram(name: "address", linkageName: "_ZNK9__gnu_cxx13new_allocatorI7latLongE7addressERS1_", scope: !230, file: !71, line: 89, type: !243, isLocal: false, isDefinition: false, scopeLine: 89, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!243 = !DISubroutineType(types: !244)
!244 = !{!245, !247, !248}
!245 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !230, file: !71, line: 63, baseType: !246)
!246 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!247 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !240, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!248 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !230, file: !71, line: 65, baseType: !249)
!249 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !19, size: 64)
!250 = !DISubprogram(name: "address", linkageName: "_ZNK9__gnu_cxx13new_allocatorI7latLongE7addressERKS1_", scope: !230, file: !71, line: 93, type: !251, isLocal: false, isDefinition: false, scopeLine: 93, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!251 = !DISubroutineType(types: !252)
!252 = !{!253, !247, !256}
!253 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !230, file: !71, line: 64, baseType: !254)
!254 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !255, size: 64)
!255 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !19)
!256 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !230, file: !71, line: 66, baseType: !257)
!257 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !255, size: 64)
!258 = !DISubprogram(name: "allocate", linkageName: "_ZN9__gnu_cxx13new_allocatorI7latLongE8allocateEmPKv", scope: !230, file: !71, line: 99, type: !259, isLocal: false, isDefinition: false, scopeLine: 99, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!259 = !DISubroutineType(types: !260)
!260 = !{!245, !235, !102, !106}
!261 = !DISubprogram(name: "deallocate", linkageName: "_ZN9__gnu_cxx13new_allocatorI7latLongE10deallocateEPS1_m", scope: !230, file: !71, line: 109, type: !262, isLocal: false, isDefinition: false, scopeLine: 109, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!262 = !DISubroutineType(types: !263)
!263 = !{null, !235, !245, !102}
!264 = !DISubprogram(name: "max_size", linkageName: "_ZNK9__gnu_cxx13new_allocatorI7latLongE8max_sizeEv", scope: !230, file: !71, line: 113, type: !265, isLocal: false, isDefinition: false, scopeLine: 113, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!265 = !DISubroutineType(types: !266)
!266 = !{!102, !247}
!267 = !DISubprogram(name: "construct", linkageName: "_ZN9__gnu_cxx13new_allocatorI7latLongE9constructEPS1_RKS1_", scope: !230, file: !71, line: 129, type: !268, isLocal: false, isDefinition: false, scopeLine: 129, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!268 = !DISubroutineType(types: !269)
!269 = !{null, !235, !245, !257}
!270 = !DISubprogram(name: "destroy", linkageName: "_ZN9__gnu_cxx13new_allocatorI7latLongE7destroyEPS1_", scope: !230, file: !71, line: 133, type: !271, isLocal: false, isDefinition: false, scopeLine: 133, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!271 = !DISubroutineType(types: !272)
!272 = !{null, !235, !245}
!273 = !{!274}
!274 = !DITemplateTypeParameter(name: "_Tp", type: !19)
!275 = !DISubprogram(name: "allocator", scope: !227, file: !67, line: 113, type: !276, isLocal: false, isDefinition: false, scopeLine: 113, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!276 = !DISubroutineType(types: !277)
!277 = !{null, !278}
!278 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !227, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!279 = !DISubprogram(name: "allocator", scope: !227, file: !67, line: 115, type: !280, isLocal: false, isDefinition: false, scopeLine: 115, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!280 = !DISubroutineType(types: !281)
!281 = !{null, !278, !282}
!282 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !283, size: 64)
!283 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !227)
!284 = !DISubprogram(name: "~allocator", scope: !227, file: !67, line: 121, type: !276, isLocal: false, isDefinition: false, scopeLine: 121, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!285 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !221, file: !58, line: 204, baseType: !286)
!286 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !227, file: !67, line: 95, baseType: !103)
!287 = !DISubprogram(name: "deallocate", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE10deallocateERS2_PS1_m", scope: !221, file: !58, line: 211, type: !288, isLocal: false, isDefinition: false, scopeLine: 211, flags: DIFlagPrototyped, isOptimized: true)
!288 = !DISubroutineType(types: !289)
!289 = !{null, !226, !220, !285}
!290 = !DISubprogram(name: "destroy", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE7destroyERS2_PS1_", scope: !221, file: !58, line: 218, type: !291, isLocal: false, isDefinition: false, scopeLine: 218, flags: DIFlagPrototyped, isOptimized: true)
!291 = !DISubroutineType(types: !292)
!292 = !{null, !226, !220}
!293 = !DISubprogram(name: "max_size", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE8max_sizeERKS2_", scope: !221, file: !58, line: 221, type: !294, isLocal: false, isDefinition: false, scopeLine: 221, flags: DIFlagPrototyped, isOptimized: true)
!294 = !DISubroutineType(types: !295)
!295 = !{!285, !282}
!296 = !DISubprogram(name: "_S_select_on_copy", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE17_S_select_on_copyERKS2_", scope: !221, file: !58, line: 224, type: !297, isLocal: false, isDefinition: false, scopeLine: 224, flags: DIFlagPrototyped, isOptimized: true)
!297 = !DISubroutineType(types: !298)
!298 = !{!282, !282}
!299 = !DISubprogram(name: "_S_on_swap", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE10_S_on_swapERS2_S4_", scope: !221, file: !58, line: 226, type: !300, isLocal: false, isDefinition: false, scopeLine: 226, flags: DIFlagPrototyped, isOptimized: true)
!300 = !DISubroutineType(types: !301)
!301 = !{null, !226, !226}
!302 = !{!303}
!303 = !DITemplateTypeParameter(name: "_Alloc", type: !227)
!304 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !227, file: !67, line: 97, baseType: !246)
!305 = !DIDerivedType(tag: DW_TAG_member, name: "_M_finish", scope: !215, file: !48, line: 83, baseType: !219, size: 64, offset: 64)
!306 = !DIDerivedType(tag: DW_TAG_member, name: "_M_end_of_storage", scope: !215, file: !48, line: 84, baseType: !219, size: 64, offset: 128)
!307 = !DISubprogram(name: "_Vector_impl", scope: !215, file: !48, line: 86, type: !308, isLocal: false, isDefinition: false, scopeLine: 86, flags: DIFlagPrototyped, isOptimized: true)
!308 = !DISubroutineType(types: !309)
!309 = !{null, !310}
!310 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !215, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!311 = !DISubprogram(name: "_Vector_impl", scope: !215, file: !48, line: 90, type: !312, isLocal: false, isDefinition: false, scopeLine: 90, flags: DIFlagPrototyped, isOptimized: true)
!312 = !DISubroutineType(types: !313)
!313 = !{null, !310, !314}
!314 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !315, size: 64)
!315 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !211)
!316 = !DISubprogram(name: "_M_swap_data", linkageName: "_ZNSt12_Vector_baseI7latLongSaIS0_EE12_Vector_impl12_M_swap_dataERS3_", scope: !215, file: !48, line: 101, type: !317, isLocal: false, isDefinition: false, scopeLine: 101, flags: DIFlagPrototyped, isOptimized: true)
!317 = !DISubroutineType(types: !318)
!318 = !{null, !310, !319}
!319 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !215, size: 64)
!320 = !DISubprogram(name: "_M_get_Tp_allocator", linkageName: "_ZNSt12_Vector_baseI7latLongSaIS0_EE19_M_get_Tp_allocatorEv", scope: !212, file: !48, line: 113, type: !321, isLocal: false, isDefinition: false, scopeLine: 113, flags: DIFlagPrototyped, isOptimized: true)
!321 = !DISubroutineType(types: !322)
!322 = !{!323, !324}
!323 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !211, size: 64)
!324 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !212, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!325 = !DISubprogram(name: "_M_get_Tp_allocator", linkageName: "_ZNKSt12_Vector_baseI7latLongSaIS0_EE19_M_get_Tp_allocatorEv", scope: !212, file: !48, line: 117, type: !326, isLocal: false, isDefinition: false, scopeLine: 117, flags: DIFlagPrototyped, isOptimized: true)
!326 = !DISubroutineType(types: !327)
!327 = !{!314, !328}
!328 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !329, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!329 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !212)
!330 = !DISubprogram(name: "get_allocator", linkageName: "_ZNKSt12_Vector_baseI7latLongSaIS0_EE13get_allocatorEv", scope: !212, file: !48, line: 121, type: !331, isLocal: false, isDefinition: false, scopeLine: 121, flags: DIFlagPrototyped, isOptimized: true)
!331 = !DISubroutineType(types: !332)
!332 = !{!333, !328}
!333 = !DIDerivedType(tag: DW_TAG_typedef, name: "allocator_type", scope: !212, file: !48, line: 110, baseType: !227)
!334 = !DISubprogram(name: "_Vector_base", scope: !212, file: !48, line: 124, type: !335, isLocal: false, isDefinition: false, scopeLine: 124, flags: DIFlagPrototyped, isOptimized: true)
!335 = !DISubroutineType(types: !336)
!336 = !{null, !324}
!337 = !DISubprogram(name: "_Vector_base", scope: !212, file: !48, line: 127, type: !338, isLocal: false, isDefinition: false, scopeLine: 127, flags: DIFlagPrototyped, isOptimized: true)
!338 = !DISubroutineType(types: !339)
!339 = !{null, !324, !340}
!340 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !341, size: 64)
!341 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !333)
!342 = !DISubprogram(name: "_Vector_base", scope: !212, file: !48, line: 130, type: !343, isLocal: false, isDefinition: false, scopeLine: 130, flags: DIFlagPrototyped, isOptimized: true)
!343 = !DISubroutineType(types: !344)
!344 = !{null, !324, !103}
!345 = !DISubprogram(name: "_Vector_base", scope: !212, file: !48, line: 134, type: !346, isLocal: false, isDefinition: false, scopeLine: 134, flags: DIFlagPrototyped, isOptimized: true)
!346 = !DISubroutineType(types: !347)
!347 = !{null, !324, !103, !340}
!348 = !DISubprogram(name: "~_Vector_base", scope: !212, file: !48, line: 159, type: !335, isLocal: false, isDefinition: false, scopeLine: 159, flags: DIFlagPrototyped, isOptimized: true)
!349 = !DISubprogram(name: "_M_allocate", linkageName: "_ZNSt12_Vector_baseI7latLongSaIS0_EE11_M_allocateEm", scope: !212, file: !48, line: 167, type: !350, isLocal: false, isDefinition: false, scopeLine: 167, flags: DIFlagPrototyped, isOptimized: true)
!350 = !DISubroutineType(types: !351)
!351 = !{!219, !324, !103}
!352 = !DISubprogram(name: "_M_deallocate", linkageName: "_ZNSt12_Vector_baseI7latLongSaIS0_EE13_M_deallocateEPS0_m", scope: !212, file: !48, line: 171, type: !353, isLocal: false, isDefinition: false, scopeLine: 171, flags: DIFlagPrototyped, isOptimized: true)
!353 = !DISubroutineType(types: !354)
!354 = !{null, !324, !219, !103}
!355 = !DISubprogram(name: "_M_create_storage", linkageName: "_ZNSt12_Vector_baseI7latLongSaIS0_EE17_M_create_storageEm", scope: !212, file: !48, line: 179, type: !343, isLocal: false, isDefinition: false, scopeLine: 179, flags: DIFlagPrivate | DIFlagPrototyped, isOptimized: true)
!356 = !{!274, !303}
!357 = !DIDerivedType(tag: DW_TAG_typedef, name: "other", scope: !358, file: !58, line: 235, baseType: !359)
!358 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "rebind<latLong>", scope: !221, file: !58, line: 234, size: 8, elements: !16, templateParams: !273, identifier: "_ZTSN9__gnu_cxx14__alloc_traitsISaI7latLongEE6rebindIS1_EE")
!359 = !DIDerivedType(tag: DW_TAG_typedef, name: "other", scope: !360, file: !67, line: 105, baseType: !227)
!360 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "rebind<latLong>", scope: !227, file: !67, line: 104, size: 8, elements: !16, templateParams: !361, identifier: "_ZTSNSaI7latLongE6rebindIS_EE")
!361 = !{!362}
!362 = !DITemplateTypeParameter(name: "_Tp1", type: !19)
!363 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", file: !48, line: 232, baseType: !103)
!364 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !315, size: 64)
!365 = !DIDerivedType(tag: DW_TAG_typedef, name: "iterator", scope: !366, file: !48, line: 227, baseType: !507)
!366 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "vector<latLong, std::allocator<latLong> >", scope: !14, file: !48, line: 210, size: 192, elements: !367, templateParams: !356, identifier: "_ZTSSt6vectorI7latLongSaIS0_EE")
!367 = !{!368, !369, !373, !379, !385, !390, !391, !395, !398, !401, !408, !409, !410, !415, !420, !421, !422, !425, !426, !429, !430, !434, !437, !443, !449, !452, !453, !454, !457, !460, !461, !462, !466, !472, !475, !476, !479, !482, !485, !488, !491, !492, !493, !494, !495, !498, !504}
!368 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !366, baseType: !212, flags: DIFlagProtected)
!369 = !DISubprogram(name: "vector", scope: !366, file: !48, line: 248, type: !370, isLocal: false, isDefinition: false, scopeLine: 248, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!370 = !DISubroutineType(types: !371)
!371 = !{null, !372}
!372 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !366, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!373 = !DISubprogram(name: "vector", scope: !366, file: !48, line: 256, type: !374, isLocal: false, isDefinition: false, scopeLine: 256, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, isOptimized: true)
!374 = !DISubroutineType(types: !375)
!375 = !{null, !372, !376}
!376 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !377, size: 64)
!377 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !378)
!378 = !DIDerivedType(tag: DW_TAG_typedef, name: "allocator_type", scope: !366, file: !48, line: 234, baseType: !227)
!379 = !DISubprogram(name: "vector", scope: !366, file: !48, line: 295, type: !380, isLocal: false, isDefinition: false, scopeLine: 295, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, isOptimized: true)
!380 = !DISubroutineType(types: !381)
!381 = !{null, !372, !363, !382, !376}
!382 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !383, size: 64)
!383 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !384)
!384 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !366, file: !48, line: 222, baseType: !19)
!385 = !DISubprogram(name: "vector", scope: !366, file: !48, line: 310, type: !386, isLocal: false, isDefinition: false, scopeLine: 310, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!386 = !DISubroutineType(types: !387)
!387 = !{null, !372, !388}
!388 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !389, size: 64)
!389 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !366)
!390 = !DISubprogram(name: "~vector", scope: !366, file: !48, line: 414, type: !370, isLocal: false, isDefinition: false, scopeLine: 414, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!391 = !DISubprogram(name: "operator=", linkageName: "_ZNSt6vectorI7latLongSaIS0_EEaSERKS2_", scope: !366, file: !48, line: 427, type: !392, isLocal: false, isDefinition: false, scopeLine: 427, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!392 = !DISubroutineType(types: !393)
!393 = !{!394, !372, !388}
!394 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !366, size: 64)
!395 = !DISubprogram(name: "assign", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE6assignEmRKS0_", scope: !366, file: !48, line: 479, type: !396, isLocal: false, isDefinition: false, scopeLine: 479, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!396 = !DISubroutineType(types: !397)
!397 = !{null, !372, !363, !382}
!398 = !DISubprogram(name: "begin", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE5beginEv", scope: !366, file: !48, line: 538, type: !399, isLocal: false, isDefinition: false, scopeLine: 538, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!399 = !DISubroutineType(types: !400)
!400 = !{!365, !372}
!401 = !DISubprogram(name: "begin", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE5beginEv", scope: !366, file: !48, line: 547, type: !402, isLocal: false, isDefinition: false, scopeLine: 547, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!402 = !DISubroutineType(types: !403)
!403 = !{!404, !407}
!404 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_iterator", scope: !366, file: !48, line: 229, baseType: !405)
!405 = !DICompositeType(tag: DW_TAG_class_type, name: "__normal_iterator<const latLong *, std::vector<latLong, std::allocator<latLong> > >", scope: !60, file: !406, line: 708, flags: DIFlagFwdDecl, identifier: "_ZTSN9__gnu_cxx17__normal_iteratorIPK7latLongSt6vectorIS1_SaIS1_EEEE")
!406 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/bits/stl_iterator.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/nnllvm")
!407 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !389, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!408 = !DISubprogram(name: "end", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE3endEv", scope: !366, file: !48, line: 556, type: !399, isLocal: false, isDefinition: false, scopeLine: 556, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!409 = !DISubprogram(name: "end", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE3endEv", scope: !366, file: !48, line: 565, type: !402, isLocal: false, isDefinition: false, scopeLine: 565, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!410 = !DISubprogram(name: "rbegin", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE6rbeginEv", scope: !366, file: !48, line: 574, type: !411, isLocal: false, isDefinition: false, scopeLine: 574, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!411 = !DISubroutineType(types: !412)
!412 = !{!413, !372}
!413 = !DIDerivedType(tag: DW_TAG_typedef, name: "reverse_iterator", scope: !366, file: !48, line: 231, baseType: !414)
!414 = !DICompositeType(tag: DW_TAG_class_type, name: "reverse_iterator<__gnu_cxx::__normal_iterator<latLong *, std::vector<latLong, std::allocator<latLong> > > >", scope: !14, file: !406, line: 96, flags: DIFlagFwdDecl, identifier: "_ZTSSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS2_SaIS2_EEEEE")
!415 = !DISubprogram(name: "rbegin", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE6rbeginEv", scope: !366, file: !48, line: 583, type: !416, isLocal: false, isDefinition: false, scopeLine: 583, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!416 = !DISubroutineType(types: !417)
!417 = !{!418, !407}
!418 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reverse_iterator", scope: !366, file: !48, line: 230, baseType: !419)
!419 = !DICompositeType(tag: DW_TAG_class_type, name: "reverse_iterator<__gnu_cxx::__normal_iterator<const latLong *, std::vector<latLong, std::allocator<latLong> > > >", scope: !14, file: !406, line: 96, flags: DIFlagFwdDecl, identifier: "_ZTSSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPK7latLongSt6vectorIS2_SaIS2_EEEEE")
!420 = !DISubprogram(name: "rend", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE4rendEv", scope: !366, file: !48, line: 592, type: !411, isLocal: false, isDefinition: false, scopeLine: 592, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!421 = !DISubprogram(name: "rend", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE4rendEv", scope: !366, file: !48, line: 601, type: !416, isLocal: false, isDefinition: false, scopeLine: 601, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!422 = !DISubprogram(name: "size", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE4sizeEv", scope: !366, file: !48, line: 645, type: !423, isLocal: false, isDefinition: false, scopeLine: 645, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!423 = !DISubroutineType(types: !424)
!424 = !{!363, !407}
!425 = !DISubprogram(name: "max_size", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE8max_sizeEv", scope: !366, file: !48, line: 650, type: !423, isLocal: false, isDefinition: false, scopeLine: 650, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!426 = !DISubprogram(name: "resize", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE6resizeEmS0_", scope: !366, file: !48, line: 704, type: !427, isLocal: false, isDefinition: false, scopeLine: 704, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!427 = !DISubroutineType(types: !428)
!428 = !{null, !372, !363, !384}
!429 = !DISubprogram(name: "capacity", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE8capacityEv", scope: !366, file: !48, line: 725, type: !423, isLocal: false, isDefinition: false, scopeLine: 725, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!430 = !DISubprogram(name: "empty", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE5emptyEv", scope: !366, file: !48, line: 734, type: !431, isLocal: false, isDefinition: false, scopeLine: 734, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!431 = !DISubroutineType(types: !432)
!432 = !{!433, !407}
!433 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!434 = !DISubprogram(name: "reserve", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE7reserveEm", scope: !366, file: !48, line: 755, type: !435, isLocal: false, isDefinition: false, scopeLine: 755, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!435 = !DISubroutineType(types: !436)
!436 = !{null, !372, !363}
!437 = !DISubprogram(name: "operator[]", linkageName: "_ZNSt6vectorI7latLongSaIS0_EEixEm", scope: !366, file: !48, line: 770, type: !438, isLocal: false, isDefinition: false, scopeLine: 770, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!438 = !DISubroutineType(types: !439)
!439 = !{!440, !372, !363}
!440 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !366, file: !48, line: 225, baseType: !441)
!441 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !221, file: !58, line: 202, baseType: !442)
!442 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !227, file: !67, line: 99, baseType: !249)
!443 = !DISubprogram(name: "operator[]", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EEixEm", scope: !366, file: !48, line: 785, type: !444, isLocal: false, isDefinition: false, scopeLine: 785, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!444 = !DISubroutineType(types: !445)
!445 = !{!446, !407, !363}
!446 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !366, file: !48, line: 226, baseType: !447)
!447 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !221, file: !58, line: 203, baseType: !448)
!448 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !227, file: !67, line: 100, baseType: !257)
!449 = !DISubprogram(name: "_M_range_check", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE14_M_range_checkEm", scope: !366, file: !48, line: 791, type: !450, isLocal: false, isDefinition: false, scopeLine: 791, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: true)
!450 = !DISubroutineType(types: !451)
!451 = !{null, !407, !363}
!452 = !DISubprogram(name: "at", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE2atEm", scope: !366, file: !48, line: 810, type: !438, isLocal: false, isDefinition: false, scopeLine: 810, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!453 = !DISubprogram(name: "at", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE2atEm", scope: !366, file: !48, line: 828, type: !444, isLocal: false, isDefinition: false, scopeLine: 828, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!454 = !DISubprogram(name: "front", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE5frontEv", scope: !366, file: !48, line: 839, type: !455, isLocal: false, isDefinition: false, scopeLine: 839, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!455 = !DISubroutineType(types: !456)
!456 = !{!440, !372}
!457 = !DISubprogram(name: "front", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE5frontEv", scope: !366, file: !48, line: 847, type: !458, isLocal: false, isDefinition: false, scopeLine: 847, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!458 = !DISubroutineType(types: !459)
!459 = !{!446, !407}
!460 = !DISubprogram(name: "back", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE4backEv", scope: !366, file: !48, line: 855, type: !455, isLocal: false, isDefinition: false, scopeLine: 855, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!461 = !DISubprogram(name: "back", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE4backEv", scope: !366, file: !48, line: 863, type: !458, isLocal: false, isDefinition: false, scopeLine: 863, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!462 = !DISubprogram(name: "data", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE4dataEv", scope: !366, file: !48, line: 878, type: !463, isLocal: false, isDefinition: false, scopeLine: 878, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!463 = !DISubroutineType(types: !464)
!464 = !{!465, !372}
!465 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !366, file: !48, line: 223, baseType: !219)
!466 = !DISubprogram(name: "data", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE4dataEv", scope: !366, file: !48, line: 886, type: !467, isLocal: false, isDefinition: false, scopeLine: 886, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!467 = !DISubroutineType(types: !468)
!468 = !{!469, !407}
!469 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !366, file: !48, line: 224, baseType: !470)
!470 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !221, file: !58, line: 200, baseType: !471)
!471 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !227, file: !67, line: 98, baseType: !254)
!472 = !DISubprogram(name: "push_back", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE9push_backERKS0_", scope: !366, file: !48, line: 901, type: !473, isLocal: false, isDefinition: false, scopeLine: 901, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!473 = !DISubroutineType(types: !474)
!474 = !{null, !372, !382}
!475 = !DISubprogram(name: "pop_back", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE8pop_backEv", scope: !366, file: !48, line: 937, type: !370, isLocal: false, isDefinition: false, scopeLine: 937, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!476 = !DISubprogram(name: "insert", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE6insertEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_", scope: !366, file: !48, line: 973, type: !477, isLocal: false, isDefinition: false, scopeLine: 973, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!477 = !DISubroutineType(types: !478)
!478 = !{!365, !372, !365, !382}
!479 = !DISubprogram(name: "insert", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE6insertEN9__gnu_cxx17__normal_iteratorIPS0_S2_EEmRKS0_", scope: !366, file: !48, line: 1023, type: !480, isLocal: false, isDefinition: false, scopeLine: 1023, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!480 = !DISubroutineType(types: !481)
!481 = !{null, !372, !365, !363, !382}
!482 = !DISubprogram(name: "erase", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE5eraseEN9__gnu_cxx17__normal_iteratorIPS0_S2_EE", scope: !366, file: !48, line: 1075, type: !483, isLocal: false, isDefinition: false, scopeLine: 1075, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!483 = !DISubroutineType(types: !484)
!484 = !{!365, !372, !365}
!485 = !DISubprogram(name: "erase", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE5eraseEN9__gnu_cxx17__normal_iteratorIPS0_S2_EES6_", scope: !366, file: !48, line: 1096, type: !486, isLocal: false, isDefinition: false, scopeLine: 1096, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!486 = !DISubroutineType(types: !487)
!487 = !{!365, !372, !365, !365}
!488 = !DISubprogram(name: "swap", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE4swapERS2_", scope: !366, file: !48, line: 1108, type: !489, isLocal: false, isDefinition: false, scopeLine: 1108, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!489 = !DISubroutineType(types: !490)
!490 = !{null, !372, !394}
!491 = !DISubprogram(name: "clear", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE5clearEv", scope: !366, file: !48, line: 1125, type: !370, isLocal: false, isDefinition: false, scopeLine: 1125, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!492 = !DISubprogram(name: "_M_fill_initialize", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE18_M_fill_initializeEmRKS0_", scope: !366, file: !48, line: 1212, type: !396, isLocal: false, isDefinition: false, scopeLine: 1212, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: true)
!493 = !DISubprogram(name: "_M_fill_assign", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE14_M_fill_assignEmRKS0_", scope: !366, file: !48, line: 1268, type: !396, isLocal: false, isDefinition: false, scopeLine: 1268, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: true)
!494 = !DISubprogram(name: "_M_fill_insert", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPS0_S2_EEmRKS0_", scope: !366, file: !48, line: 1309, type: !480, isLocal: false, isDefinition: false, scopeLine: 1309, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: true)
!495 = !DISubprogram(name: "_M_insert_aux", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_", scope: !366, file: !48, line: 1323, type: !496, isLocal: false, isDefinition: false, scopeLine: 1323, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: true)
!496 = !DISubroutineType(types: !497)
!497 = !{null, !372, !365, !382}
!498 = !DISubprogram(name: "_M_check_len", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE12_M_check_lenEmPKc", scope: !366, file: !48, line: 1336, type: !499, isLocal: false, isDefinition: false, scopeLine: 1336, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: true)
!499 = !DISubroutineType(types: !500)
!500 = !{!501, !407, !363, !502}
!501 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !366, file: !48, line: 232, baseType: !103)
!502 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !503, size: 64)
!503 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !34)
!504 = !DISubprogram(name: "_M_erase_at_end", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE15_M_erase_at_endEPS0_", scope: !366, file: !48, line: 1350, type: !505, isLocal: false, isDefinition: false, scopeLine: 1350, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: true)
!505 = !DISubroutineType(types: !506)
!506 = !{null, !372, !465}
!507 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "__normal_iterator<latLong *, std::vector<latLong, std::allocator<latLong> > >", scope: !60, file: !406, line: 708, size: 64, elements: !508, templateParams: !564, identifier: "_ZTSN9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEE")
!508 = !{!509, !510, !514, !519, !530, !535, !539, !542, !543, !544, !553, !556, !559, !560, !561}
!509 = !DIDerivedType(tag: DW_TAG_member, name: "_M_current", scope: !507, file: !406, line: 711, baseType: !246, size: 64, flags: DIFlagProtected)
!510 = !DISubprogram(name: "__normal_iterator", scope: !507, file: !406, line: 723, type: !511, isLocal: false, isDefinition: false, scopeLine: 723, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!511 = !DISubroutineType(types: !512)
!512 = !{null, !513}
!513 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !507, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!514 = !DISubprogram(name: "__normal_iterator", scope: !507, file: !406, line: 726, type: !515, isLocal: false, isDefinition: false, scopeLine: 726, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, isOptimized: true)
!515 = !DISubroutineType(types: !516)
!516 = !{null, !513, !517}
!517 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !518, size: 64)
!518 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !246)
!519 = !DISubprogram(name: "operator*", linkageName: "_ZNK9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEdeEv", scope: !507, file: !406, line: 738, type: !520, isLocal: false, isDefinition: false, scopeLine: 738, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!520 = !DISubroutineType(types: !521)
!521 = !{!522, !528}
!522 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !507, file: !406, line: 720, baseType: !523)
!523 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !525, file: !524, line: 181, baseType: !249)
!524 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/bits/stl_iterator_base_types.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/nnllvm")
!525 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iterator_traits<latLong *>", scope: !14, file: !524, line: 175, size: 8, elements: !16, templateParams: !526, identifier: "_ZTSSt15iterator_traitsIP7latLongE")
!526 = !{!527}
!527 = !DITemplateTypeParameter(name: "_Iterator", type: !246)
!528 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !529, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!529 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !507)
!530 = !DISubprogram(name: "operator->", linkageName: "_ZNK9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEptEv", scope: !507, file: !406, line: 742, type: !531, isLocal: false, isDefinition: false, scopeLine: 742, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!531 = !DISubroutineType(types: !532)
!532 = !{!533, !528}
!533 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !507, file: !406, line: 721, baseType: !534)
!534 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !525, file: !524, line: 180, baseType: !246)
!535 = !DISubprogram(name: "operator++", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEppEv", scope: !507, file: !406, line: 746, type: !536, isLocal: false, isDefinition: false, scopeLine: 746, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!536 = !DISubroutineType(types: !537)
!537 = !{!538, !513}
!538 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !507, size: 64)
!539 = !DISubprogram(name: "operator++", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEppEi", scope: !507, file: !406, line: 753, type: !540, isLocal: false, isDefinition: false, scopeLine: 753, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!540 = !DISubroutineType(types: !541)
!541 = !{!507, !513, !45}
!542 = !DISubprogram(name: "operator--", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEmmEv", scope: !507, file: !406, line: 758, type: !536, isLocal: false, isDefinition: false, scopeLine: 758, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!543 = !DISubprogram(name: "operator--", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEmmEi", scope: !507, file: !406, line: 765, type: !540, isLocal: false, isDefinition: false, scopeLine: 765, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!544 = !DISubprogram(name: "operator[]", linkageName: "_ZNK9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEixERKl", scope: !507, file: !406, line: 770, type: !545, isLocal: false, isDefinition: false, scopeLine: 770, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!545 = !DISubroutineType(types: !546)
!546 = !{!522, !528, !547}
!547 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !548, size: 64)
!548 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !549)
!549 = !DIDerivedType(tag: DW_TAG_typedef, name: "difference_type", scope: !507, file: !406, line: 719, baseType: !550)
!550 = !DIDerivedType(tag: DW_TAG_typedef, name: "difference_type", scope: !525, file: !524, line: 179, baseType: !551)
!551 = !DIDerivedType(tag: DW_TAG_typedef, name: "ptrdiff_t", scope: !14, file: !104, line: 187, baseType: !552)
!552 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!553 = !DISubprogram(name: "operator+=", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEpLERKl", scope: !507, file: !406, line: 774, type: !554, isLocal: false, isDefinition: false, scopeLine: 774, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!554 = !DISubroutineType(types: !555)
!555 = !{!538, !513, !547}
!556 = !DISubprogram(name: "operator+", linkageName: "_ZNK9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEplERKl", scope: !507, file: !406, line: 778, type: !557, isLocal: false, isDefinition: false, scopeLine: 778, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!557 = !DISubroutineType(types: !558)
!558 = !{!507, !528, !547}
!559 = !DISubprogram(name: "operator-=", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEmIERKl", scope: !507, file: !406, line: 782, type: !554, isLocal: false, isDefinition: false, scopeLine: 782, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!560 = !DISubprogram(name: "operator-", linkageName: "_ZNK9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEmiERKl", scope: !507, file: !406, line: 786, type: !557, isLocal: false, isDefinition: false, scopeLine: 786, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!561 = !DISubprogram(name: "base", linkageName: "_ZNK9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEE4baseEv", scope: !507, file: !406, line: 790, type: !562, isLocal: false, isDefinition: false, scopeLine: 790, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!562 = !DISubroutineType(types: !563)
!563 = !{!517, !528}
!564 = !{!527, !565}
!565 = !DITemplateTypeParameter(name: "_Container", type: !366)
!566 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !162, size: 64)
!567 = !DIDerivedType(tag: DW_TAG_typedef, name: "iterator", scope: !568, file: !48, line: 227, baseType: !705)
!568 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "vector<record, std::allocator<record> >", scope: !14, file: !48, line: 210, size: 192, elements: !569, templateParams: !203, identifier: "_ZTSSt6vectorI6recordSaIS0_EE")
!569 = !{!570, !571, !575, !581, !587, !592, !593, !597, !600, !603, !609, !610, !611, !616, !621, !622, !623, !626, !627, !630, !631, !634, !637, !643, !649, !652, !653, !654, !657, !660, !661, !662, !666, !672, !675, !676, !679, !682, !685, !688, !691, !692, !693, !694, !695, !698, !702}
!570 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !568, baseType: !49, flags: DIFlagProtected)
!571 = !DISubprogram(name: "vector", scope: !568, file: !48, line: 248, type: !572, isLocal: false, isDefinition: false, scopeLine: 248, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!572 = !DISubroutineType(types: !573)
!573 = !{null, !574}
!574 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !568, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!575 = !DISubprogram(name: "vector", scope: !568, file: !48, line: 256, type: !576, isLocal: false, isDefinition: false, scopeLine: 256, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, isOptimized: true)
!576 = !DISubroutineType(types: !577)
!577 = !{null, !574, !578}
!578 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !579, size: 64)
!579 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !580)
!580 = !DIDerivedType(tag: DW_TAG_typedef, name: "allocator_type", scope: !568, file: !48, line: 234, baseType: !66)
!581 = !DISubprogram(name: "vector", scope: !568, file: !48, line: 295, type: !582, isLocal: false, isDefinition: false, scopeLine: 295, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, isOptimized: true)
!582 = !DISubroutineType(types: !583)
!583 = !{null, !574, !363, !584, !578}
!584 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !585, size: 64)
!585 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !586)
!586 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !568, file: !48, line: 222, baseType: !30)
!587 = !DISubprogram(name: "vector", scope: !568, file: !48, line: 310, type: !588, isLocal: false, isDefinition: false, scopeLine: 310, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!588 = !DISubroutineType(types: !589)
!589 = !{null, !574, !590}
!590 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !591, size: 64)
!591 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !568)
!592 = !DISubprogram(name: "~vector", scope: !568, file: !48, line: 414, type: !572, isLocal: false, isDefinition: false, scopeLine: 414, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!593 = !DISubprogram(name: "operator=", linkageName: "_ZNSt6vectorI6recordSaIS0_EEaSERKS2_", scope: !568, file: !48, line: 427, type: !594, isLocal: false, isDefinition: false, scopeLine: 427, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!594 = !DISubroutineType(types: !595)
!595 = !{!596, !574, !590}
!596 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !568, size: 64)
!597 = !DISubprogram(name: "assign", linkageName: "_ZNSt6vectorI6recordSaIS0_EE6assignEmRKS0_", scope: !568, file: !48, line: 479, type: !598, isLocal: false, isDefinition: false, scopeLine: 479, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!598 = !DISubroutineType(types: !599)
!599 = !{null, !574, !363, !584}
!600 = !DISubprogram(name: "begin", linkageName: "_ZNSt6vectorI6recordSaIS0_EE5beginEv", scope: !568, file: !48, line: 538, type: !601, isLocal: false, isDefinition: false, scopeLine: 538, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!601 = !DISubroutineType(types: !602)
!602 = !{!567, !574}
!603 = !DISubprogram(name: "begin", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE5beginEv", scope: !568, file: !48, line: 547, type: !604, isLocal: false, isDefinition: false, scopeLine: 547, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!604 = !DISubroutineType(types: !605)
!605 = !{!606, !608}
!606 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_iterator", scope: !568, file: !48, line: 229, baseType: !607)
!607 = !DICompositeType(tag: DW_TAG_class_type, name: "__normal_iterator<const record *, std::vector<record, std::allocator<record> > >", scope: !60, file: !406, line: 708, flags: DIFlagFwdDecl, identifier: "_ZTSN9__gnu_cxx17__normal_iteratorIPK6recordSt6vectorIS1_SaIS1_EEEE")
!608 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !591, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!609 = !DISubprogram(name: "end", linkageName: "_ZNSt6vectorI6recordSaIS0_EE3endEv", scope: !568, file: !48, line: 556, type: !601, isLocal: false, isDefinition: false, scopeLine: 556, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!610 = !DISubprogram(name: "end", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE3endEv", scope: !568, file: !48, line: 565, type: !604, isLocal: false, isDefinition: false, scopeLine: 565, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!611 = !DISubprogram(name: "rbegin", linkageName: "_ZNSt6vectorI6recordSaIS0_EE6rbeginEv", scope: !568, file: !48, line: 574, type: !612, isLocal: false, isDefinition: false, scopeLine: 574, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!612 = !DISubroutineType(types: !613)
!613 = !{!614, !574}
!614 = !DIDerivedType(tag: DW_TAG_typedef, name: "reverse_iterator", scope: !568, file: !48, line: 231, baseType: !615)
!615 = !DICompositeType(tag: DW_TAG_class_type, name: "reverse_iterator<__gnu_cxx::__normal_iterator<record *, std::vector<record, std::allocator<record> > > >", scope: !14, file: !406, line: 96, flags: DIFlagFwdDecl, identifier: "_ZTSSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS2_SaIS2_EEEEE")
!616 = !DISubprogram(name: "rbegin", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE6rbeginEv", scope: !568, file: !48, line: 583, type: !617, isLocal: false, isDefinition: false, scopeLine: 583, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!617 = !DISubroutineType(types: !618)
!618 = !{!619, !608}
!619 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reverse_iterator", scope: !568, file: !48, line: 230, baseType: !620)
!620 = !DICompositeType(tag: DW_TAG_class_type, name: "reverse_iterator<__gnu_cxx::__normal_iterator<const record *, std::vector<record, std::allocator<record> > > >", scope: !14, file: !406, line: 96, flags: DIFlagFwdDecl, identifier: "_ZTSSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPK6recordSt6vectorIS2_SaIS2_EEEEE")
!621 = !DISubprogram(name: "rend", linkageName: "_ZNSt6vectorI6recordSaIS0_EE4rendEv", scope: !568, file: !48, line: 592, type: !612, isLocal: false, isDefinition: false, scopeLine: 592, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!622 = !DISubprogram(name: "rend", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE4rendEv", scope: !568, file: !48, line: 601, type: !617, isLocal: false, isDefinition: false, scopeLine: 601, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!623 = !DISubprogram(name: "size", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE4sizeEv", scope: !568, file: !48, line: 645, type: !624, isLocal: false, isDefinition: false, scopeLine: 645, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!624 = !DISubroutineType(types: !625)
!625 = !{!363, !608}
!626 = !DISubprogram(name: "max_size", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE8max_sizeEv", scope: !568, file: !48, line: 650, type: !624, isLocal: false, isDefinition: false, scopeLine: 650, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!627 = !DISubprogram(name: "resize", linkageName: "_ZNSt6vectorI6recordSaIS0_EE6resizeEmS0_", scope: !568, file: !48, line: 704, type: !628, isLocal: false, isDefinition: false, scopeLine: 704, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!628 = !DISubroutineType(types: !629)
!629 = !{null, !574, !363, !586}
!630 = !DISubprogram(name: "capacity", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE8capacityEv", scope: !568, file: !48, line: 725, type: !624, isLocal: false, isDefinition: false, scopeLine: 725, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!631 = !DISubprogram(name: "empty", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE5emptyEv", scope: !568, file: !48, line: 734, type: !632, isLocal: false, isDefinition: false, scopeLine: 734, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!632 = !DISubroutineType(types: !633)
!633 = !{!433, !608}
!634 = !DISubprogram(name: "reserve", linkageName: "_ZNSt6vectorI6recordSaIS0_EE7reserveEm", scope: !568, file: !48, line: 755, type: !635, isLocal: false, isDefinition: false, scopeLine: 755, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!635 = !DISubroutineType(types: !636)
!636 = !{null, !574, !363}
!637 = !DISubprogram(name: "operator[]", linkageName: "_ZNSt6vectorI6recordSaIS0_EEixEm", scope: !568, file: !48, line: 770, type: !638, isLocal: false, isDefinition: false, scopeLine: 770, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!638 = !DISubroutineType(types: !639)
!639 = !{!640, !574, !363}
!640 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !568, file: !48, line: 225, baseType: !641)
!641 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !59, file: !58, line: 202, baseType: !642)
!642 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !66, file: !67, line: 99, baseType: !90)
!643 = !DISubprogram(name: "operator[]", linkageName: "_ZNKSt6vectorI6recordSaIS0_EEixEm", scope: !568, file: !48, line: 785, type: !644, isLocal: false, isDefinition: false, scopeLine: 785, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!644 = !DISubroutineType(types: !645)
!645 = !{!646, !608, !363}
!646 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !568, file: !48, line: 226, baseType: !647)
!647 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !59, file: !58, line: 203, baseType: !648)
!648 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !66, file: !67, line: 100, baseType: !98)
!649 = !DISubprogram(name: "_M_range_check", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE14_M_range_checkEm", scope: !568, file: !48, line: 791, type: !650, isLocal: false, isDefinition: false, scopeLine: 791, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: true)
!650 = !DISubroutineType(types: !651)
!651 = !{null, !608, !363}
!652 = !DISubprogram(name: "at", linkageName: "_ZNSt6vectorI6recordSaIS0_EE2atEm", scope: !568, file: !48, line: 810, type: !638, isLocal: false, isDefinition: false, scopeLine: 810, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!653 = !DISubprogram(name: "at", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE2atEm", scope: !568, file: !48, line: 828, type: !644, isLocal: false, isDefinition: false, scopeLine: 828, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!654 = !DISubprogram(name: "front", linkageName: "_ZNSt6vectorI6recordSaIS0_EE5frontEv", scope: !568, file: !48, line: 839, type: !655, isLocal: false, isDefinition: false, scopeLine: 839, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!655 = !DISubroutineType(types: !656)
!656 = !{!640, !574}
!657 = !DISubprogram(name: "front", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE5frontEv", scope: !568, file: !48, line: 847, type: !658, isLocal: false, isDefinition: false, scopeLine: 847, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!658 = !DISubroutineType(types: !659)
!659 = !{!646, !608}
!660 = !DISubprogram(name: "back", linkageName: "_ZNSt6vectorI6recordSaIS0_EE4backEv", scope: !568, file: !48, line: 855, type: !655, isLocal: false, isDefinition: false, scopeLine: 855, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!661 = !DISubprogram(name: "back", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE4backEv", scope: !568, file: !48, line: 863, type: !658, isLocal: false, isDefinition: false, scopeLine: 863, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!662 = !DISubprogram(name: "data", linkageName: "_ZNSt6vectorI6recordSaIS0_EE4dataEv", scope: !568, file: !48, line: 878, type: !663, isLocal: false, isDefinition: false, scopeLine: 878, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!663 = !DISubroutineType(types: !664)
!664 = !{!665, !574}
!665 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !568, file: !48, line: 223, baseType: !56)
!666 = !DISubprogram(name: "data", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE4dataEv", scope: !568, file: !48, line: 886, type: !667, isLocal: false, isDefinition: false, scopeLine: 886, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!667 = !DISubroutineType(types: !668)
!668 = !{!669, !608}
!669 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !568, file: !48, line: 224, baseType: !670)
!670 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !59, file: !58, line: 200, baseType: !671)
!671 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !66, file: !67, line: 98, baseType: !95)
!672 = !DISubprogram(name: "push_back", linkageName: "_ZNSt6vectorI6recordSaIS0_EE9push_backERKS0_", scope: !568, file: !48, line: 901, type: !673, isLocal: false, isDefinition: false, scopeLine: 901, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!673 = !DISubroutineType(types: !674)
!674 = !{null, !574, !584}
!675 = !DISubprogram(name: "pop_back", linkageName: "_ZNSt6vectorI6recordSaIS0_EE8pop_backEv", scope: !568, file: !48, line: 937, type: !572, isLocal: false, isDefinition: false, scopeLine: 937, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!676 = !DISubprogram(name: "insert", linkageName: "_ZNSt6vectorI6recordSaIS0_EE6insertEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_", scope: !568, file: !48, line: 973, type: !677, isLocal: false, isDefinition: false, scopeLine: 973, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!677 = !DISubroutineType(types: !678)
!678 = !{!567, !574, !567, !584}
!679 = !DISubprogram(name: "insert", linkageName: "_ZNSt6vectorI6recordSaIS0_EE6insertEN9__gnu_cxx17__normal_iteratorIPS0_S2_EEmRKS0_", scope: !568, file: !48, line: 1023, type: !680, isLocal: false, isDefinition: false, scopeLine: 1023, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!680 = !DISubroutineType(types: !681)
!681 = !{null, !574, !567, !363, !584}
!682 = !DISubprogram(name: "erase", linkageName: "_ZNSt6vectorI6recordSaIS0_EE5eraseEN9__gnu_cxx17__normal_iteratorIPS0_S2_EE", scope: !568, file: !48, line: 1075, type: !683, isLocal: false, isDefinition: false, scopeLine: 1075, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!683 = !DISubroutineType(types: !684)
!684 = !{!567, !574, !567}
!685 = !DISubprogram(name: "erase", linkageName: "_ZNSt6vectorI6recordSaIS0_EE5eraseEN9__gnu_cxx17__normal_iteratorIPS0_S2_EES6_", scope: !568, file: !48, line: 1096, type: !686, isLocal: false, isDefinition: false, scopeLine: 1096, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!686 = !DISubroutineType(types: !687)
!687 = !{!567, !574, !567, !567}
!688 = !DISubprogram(name: "swap", linkageName: "_ZNSt6vectorI6recordSaIS0_EE4swapERS2_", scope: !568, file: !48, line: 1108, type: !689, isLocal: false, isDefinition: false, scopeLine: 1108, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!689 = !DISubroutineType(types: !690)
!690 = !{null, !574, !596}
!691 = !DISubprogram(name: "clear", linkageName: "_ZNSt6vectorI6recordSaIS0_EE5clearEv", scope: !568, file: !48, line: 1125, type: !572, isLocal: false, isDefinition: false, scopeLine: 1125, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!692 = !DISubprogram(name: "_M_fill_initialize", linkageName: "_ZNSt6vectorI6recordSaIS0_EE18_M_fill_initializeEmRKS0_", scope: !568, file: !48, line: 1212, type: !598, isLocal: false, isDefinition: false, scopeLine: 1212, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: true)
!693 = !DISubprogram(name: "_M_fill_assign", linkageName: "_ZNSt6vectorI6recordSaIS0_EE14_M_fill_assignEmRKS0_", scope: !568, file: !48, line: 1268, type: !598, isLocal: false, isDefinition: false, scopeLine: 1268, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: true)
!694 = !DISubprogram(name: "_M_fill_insert", linkageName: "_ZNSt6vectorI6recordSaIS0_EE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPS0_S2_EEmRKS0_", scope: !568, file: !48, line: 1309, type: !680, isLocal: false, isDefinition: false, scopeLine: 1309, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: true)
!695 = !DISubprogram(name: "_M_insert_aux", linkageName: "_ZNSt6vectorI6recordSaIS0_EE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_", scope: !568, file: !48, line: 1323, type: !696, isLocal: false, isDefinition: false, scopeLine: 1323, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: true)
!696 = !DISubroutineType(types: !697)
!697 = !{null, !574, !567, !584}
!698 = !DISubprogram(name: "_M_check_len", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE12_M_check_lenEmPKc", scope: !568, file: !48, line: 1336, type: !699, isLocal: false, isDefinition: false, scopeLine: 1336, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: true)
!699 = !DISubroutineType(types: !700)
!700 = !{!701, !608, !363, !502}
!701 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !568, file: !48, line: 232, baseType: !103)
!702 = !DISubprogram(name: "_M_erase_at_end", linkageName: "_ZNSt6vectorI6recordSaIS0_EE15_M_erase_at_endEPS0_", scope: !568, file: !48, line: 1350, type: !703, isLocal: false, isDefinition: false, scopeLine: 1350, flags: DIFlagProtected | DIFlagPrototyped, isOptimized: true)
!703 = !DISubroutineType(types: !704)
!704 = !{null, !574, !665}
!705 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "__normal_iterator<record *, std::vector<record, std::allocator<record> > >", scope: !60, file: !406, line: 708, size: 64, elements: !706, templateParams: !759, identifier: "_ZTSN9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEE")
!706 = !{!707, !708, !712, !717, !727, !732, !736, !739, !740, !741, !748, !751, !754, !755, !756}
!707 = !DIDerivedType(tag: DW_TAG_member, name: "_M_current", scope: !705, file: !406, line: 711, baseType: !87, size: 64, flags: DIFlagProtected)
!708 = !DISubprogram(name: "__normal_iterator", scope: !705, file: !406, line: 723, type: !709, isLocal: false, isDefinition: false, scopeLine: 723, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!709 = !DISubroutineType(types: !710)
!710 = !{null, !711}
!711 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !705, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!712 = !DISubprogram(name: "__normal_iterator", scope: !705, file: !406, line: 726, type: !713, isLocal: false, isDefinition: false, scopeLine: 726, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, isOptimized: true)
!713 = !DISubroutineType(types: !714)
!714 = !{null, !711, !715}
!715 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !716, size: 64)
!716 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !87)
!717 = !DISubprogram(name: "operator*", linkageName: "_ZNK9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEdeEv", scope: !705, file: !406, line: 738, type: !718, isLocal: false, isDefinition: false, scopeLine: 738, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!718 = !DISubroutineType(types: !719)
!719 = !{!720, !725}
!720 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !705, file: !406, line: 720, baseType: !721)
!721 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !722, file: !524, line: 181, baseType: !90)
!722 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iterator_traits<record *>", scope: !14, file: !524, line: 175, size: 8, elements: !16, templateParams: !723, identifier: "_ZTSSt15iterator_traitsIP6recordE")
!723 = !{!724}
!724 = !DITemplateTypeParameter(name: "_Iterator", type: !87)
!725 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !726, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!726 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !705)
!727 = !DISubprogram(name: "operator->", linkageName: "_ZNK9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEptEv", scope: !705, file: !406, line: 742, type: !728, isLocal: false, isDefinition: false, scopeLine: 742, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!728 = !DISubroutineType(types: !729)
!729 = !{!730, !725}
!730 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !705, file: !406, line: 721, baseType: !731)
!731 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !722, file: !524, line: 180, baseType: !87)
!732 = !DISubprogram(name: "operator++", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEppEv", scope: !705, file: !406, line: 746, type: !733, isLocal: false, isDefinition: false, scopeLine: 746, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!733 = !DISubroutineType(types: !734)
!734 = !{!735, !711}
!735 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !705, size: 64)
!736 = !DISubprogram(name: "operator++", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEppEi", scope: !705, file: !406, line: 753, type: !737, isLocal: false, isDefinition: false, scopeLine: 753, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!737 = !DISubroutineType(types: !738)
!738 = !{!705, !711, !45}
!739 = !DISubprogram(name: "operator--", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEmmEv", scope: !705, file: !406, line: 758, type: !733, isLocal: false, isDefinition: false, scopeLine: 758, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!740 = !DISubprogram(name: "operator--", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEmmEi", scope: !705, file: !406, line: 765, type: !737, isLocal: false, isDefinition: false, scopeLine: 765, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!741 = !DISubprogram(name: "operator[]", linkageName: "_ZNK9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEixERKl", scope: !705, file: !406, line: 770, type: !742, isLocal: false, isDefinition: false, scopeLine: 770, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!742 = !DISubroutineType(types: !743)
!743 = !{!720, !725, !744}
!744 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !745, size: 64)
!745 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !746)
!746 = !DIDerivedType(tag: DW_TAG_typedef, name: "difference_type", scope: !705, file: !406, line: 719, baseType: !747)
!747 = !DIDerivedType(tag: DW_TAG_typedef, name: "difference_type", scope: !722, file: !524, line: 179, baseType: !551)
!748 = !DISubprogram(name: "operator+=", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEpLERKl", scope: !705, file: !406, line: 774, type: !749, isLocal: false, isDefinition: false, scopeLine: 774, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!749 = !DISubroutineType(types: !750)
!750 = !{!735, !711, !744}
!751 = !DISubprogram(name: "operator+", linkageName: "_ZNK9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEplERKl", scope: !705, file: !406, line: 778, type: !752, isLocal: false, isDefinition: false, scopeLine: 778, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!752 = !DISubroutineType(types: !753)
!753 = !{!705, !725, !744}
!754 = !DISubprogram(name: "operator-=", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEmIERKl", scope: !705, file: !406, line: 782, type: !749, isLocal: false, isDefinition: false, scopeLine: 782, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!755 = !DISubprogram(name: "operator-", linkageName: "_ZNK9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEmiERKl", scope: !705, file: !406, line: 786, type: !752, isLocal: false, isDefinition: false, scopeLine: 786, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!756 = !DISubprogram(name: "base", linkageName: "_ZNK9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEE4baseEv", scope: !705, file: !406, line: 790, type: !757, isLocal: false, isDefinition: false, scopeLine: 790, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: true)
!757 = !DISubroutineType(types: !758)
!758 = !{!715, !725}
!759 = !{!724, !760}
!760 = !DITemplateTypeParameter(name: "_Container", type: !568)
!761 = !{!762, !767, !771, !773, !775, !777, !779, !783, !785, !787, !789, !791, !793, !795, !797, !799, !801, !803, !805, !807, !809, !811, !815, !817, !819, !821, !825, !830, !832, !834, !838, !842, !844, !846, !848, !850, !852, !854, !856, !858, !862, !866, !868, !870, !874, !876, !878, !880, !882, !884, !888, !890, !892, !896, !900, !904, !906, !908, !912, !914, !916, !920, !922, !924, !928, !930, !932, !934, !936, !938, !940, !942, !944, !946, !951, !953, !955, !959, !961, !963, !965, !967, !969, !971, !973, !977, !981, !983, !985, !990, !992, !994, !996, !998, !1000, !1002, !1006, !1012, !1016, !1020, !1025, !1030, !1036, !1040, !1051, !1055, !1059, !1063, !1067, !1071, !1073, !1077, !1081, !1085, !1093, !1097, !1101, !1105, !1109, !1114, !1119, !1123, !1127, !1129, !1137, !1141, !1147, !1149, !1151, !1155, !1159, !1163, !1168, !1172, !1177, !1178, !1179, !1180, !1183, !1184, !1185, !1186, !1187, !1188, !1189, !1192, !1194, !1196, !1198, !1200, !1202, !1204, !1206, !1209, !1211, !1213, !1215, !1217, !1219, !1221, !1223, !1225, !1227, !1229, !1231, !1233, !1235, !1237, !1239, !1241, !1243, !1245, !1247, !1249, !1251, !1253, !1255, !1257, !1259, !1261, !1263, !1265, !1267, !1269, !1271, !1273, !1277, !1278, !1280, !1282, !1284, !1286, !1288, !1290, !1292, !1294, !1296, !1298, !1300, !1302, !1304, !1306, !1310, !1311}
!762 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !763, line: 201)
!763 = !DISubprogram(name: "abs", linkageName: "_ZL3absx", scope: !15, file: !15, line: 44, type: !764, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!764 = !DISubroutineType(types: !765)
!765 = !{!766, !766}
!766 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!767 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !768, line: 202)
!768 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !15, file: !15, line: 46, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!769 = !DISubroutineType(types: !770)
!770 = !{!22, !22}
!771 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !772, line: 203)
!772 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !15, file: !15, line: 48, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!773 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !774, line: 204)
!774 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !15, file: !15, line: 50, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!775 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !776, line: 205)
!776 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !15, file: !15, line: 52, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!777 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !778, line: 206)
!778 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !15, file: !15, line: 56, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!779 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !780, line: 207)
!780 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !15, file: !15, line: 54, type: !781, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!781 = !DISubroutineType(types: !782)
!782 = !{!22, !22, !22}
!783 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !784, line: 208)
!784 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !15, file: !15, line: 58, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!785 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !786, line: 209)
!786 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !15, file: !15, line: 60, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!787 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !788, line: 210)
!788 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !15, file: !15, line: 62, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!789 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !790, line: 211)
!790 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !15, file: !15, line: 64, type: !781, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!791 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !792, line: 212)
!792 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !15, file: !15, line: 66, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!793 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !794, line: 213)
!794 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !15, file: !15, line: 68, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!795 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !796, line: 214)
!796 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !15, file: !15, line: 72, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!797 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !798, line: 215)
!798 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !15, file: !15, line: 70, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!799 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !800, line: 216)
!800 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !15, file: !15, line: 76, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!801 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !802, line: 217)
!802 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !15, file: !15, line: 74, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!803 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !804, line: 218)
!804 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !15, file: !15, line: 78, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!805 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !806, line: 219)
!806 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !15, file: !15, line: 80, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!807 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !808, line: 220)
!808 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !15, file: !15, line: 82, type: !781, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!809 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !810, line: 221)
!810 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !15, file: !15, line: 84, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!811 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !812, line: 222)
!812 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !15, file: !15, line: 86, type: !813, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!813 = !DISubroutineType(types: !814)
!814 = !{!22, !22, !22, !22}
!815 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !816, line: 223)
!816 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !15, file: !15, line: 88, type: !781, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!817 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !818, line: 224)
!818 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !15, file: !15, line: 90, type: !781, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!819 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !820, line: 225)
!820 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !15, file: !15, line: 92, type: !781, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!821 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !822, line: 226)
!822 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !15, file: !15, line: 94, type: !823, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!823 = !DISubroutineType(types: !824)
!824 = !{!45, !22}
!825 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !826, line: 227)
!826 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !15, file: !15, line: 96, type: !827, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!827 = !DISubroutineType(types: !828)
!828 = !{!22, !22, !829}
!829 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64)
!830 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !831, line: 228)
!831 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !15, file: !15, line: 98, type: !781, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!832 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !833, line: 229)
!833 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !15, file: !15, line: 100, type: !823, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!834 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !835, line: 230)
!835 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !15, file: !15, line: 102, type: !836, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!836 = !DISubroutineType(types: !837)
!837 = !{!433, !22}
!838 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !839, line: 231)
!839 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !15, file: !15, line: 106, type: !840, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!840 = !DISubroutineType(types: !841)
!841 = !{!433, !22, !22}
!842 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !843, line: 232)
!843 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !15, file: !15, line: 105, type: !840, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!844 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !845, line: 233)
!845 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !15, file: !15, line: 108, type: !836, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!846 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !847, line: 234)
!847 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !15, file: !15, line: 112, type: !840, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!848 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !849, line: 235)
!849 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !15, file: !15, line: 111, type: !840, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!850 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !851, line: 236)
!851 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !15, file: !15, line: 114, type: !840, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!852 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !853, line: 237)
!853 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !15, file: !15, line: 116, type: !836, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!854 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !855, line: 238)
!855 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !15, file: !15, line: 118, type: !836, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!856 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !857, line: 239)
!857 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !15, file: !15, line: 120, type: !840, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!858 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !859, line: 240)
!859 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !15, file: !15, line: 121, type: !860, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!860 = !DISubroutineType(types: !861)
!861 = !{!552, !552}
!862 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !863, line: 241)
!863 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !15, file: !15, line: 123, type: !864, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!864 = !DISubroutineType(types: !865)
!865 = !{!22, !22, !45}
!866 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !867, line: 242)
!867 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !15, file: !15, line: 125, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!868 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !869, line: 243)
!869 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !15, file: !15, line: 126, type: !764, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!870 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !871, line: 244)
!871 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !15, file: !15, line: 128, type: !872, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!872 = !DISubroutineType(types: !873)
!873 = !{!766, !22}
!874 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !875, line: 245)
!875 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !15, file: !15, line: 138, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!876 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !877, line: 246)
!877 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !15, file: !15, line: 130, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!878 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !879, line: 247)
!879 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !15, file: !15, line: 132, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!880 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !881, line: 248)
!881 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !15, file: !15, line: 134, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!882 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !883, line: 249)
!883 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !15, file: !15, line: 136, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!884 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !885, line: 250)
!885 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !15, file: !15, line: 140, type: !886, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!886 = !DISubroutineType(types: !887)
!887 = !{!552, !22}
!888 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !889, line: 251)
!889 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !15, file: !15, line: 142, type: !886, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!890 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !891, line: 252)
!891 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !15, file: !15, line: 143, type: !872, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!892 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !893, line: 253)
!893 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !15, file: !15, line: 145, type: !894, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!894 = !DISubroutineType(types: !895)
!895 = !{!22, !22, !40}
!896 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !897, line: 254)
!897 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !15, file: !15, line: 146, type: !898, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!898 = !DISubroutineType(types: !899)
!899 = !{!39, !502}
!900 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !901, line: 255)
!901 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !15, file: !15, line: 147, type: !902, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!902 = !DISubroutineType(types: !903)
!903 = !{!22, !502}
!904 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !905, line: 256)
!905 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !15, file: !15, line: 149, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!906 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !907, line: 257)
!907 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !15, file: !15, line: 151, type: !781, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!908 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !909, line: 258)
!909 = !DISubprogram(name: "nexttoward", linkageName: "_ZL10nexttowardfd", scope: !15, file: !15, line: 153, type: !910, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!910 = !DISubroutineType(types: !911)
!911 = !{!22, !22, !39}
!912 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !913, line: 259)
!913 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !15, file: !15, line: 158, type: !864, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!914 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !915, line: 260)
!915 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !15, file: !15, line: 160, type: !781, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!916 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !917, line: 261)
!917 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !15, file: !15, line: 162, type: !918, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!918 = !DISubroutineType(types: !919)
!919 = !{!22, !22, !22, !829}
!920 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !921, line: 262)
!921 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !15, file: !15, line: 164, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!922 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !923, line: 263)
!923 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !15, file: !15, line: 166, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!924 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !925, line: 264)
!925 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !15, file: !15, line: 168, type: !926, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!926 = !DISubroutineType(types: !927)
!927 = !{!22, !22, !552}
!928 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !929, line: 265)
!929 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !15, file: !15, line: 170, type: !864, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!930 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !931, line: 266)
!931 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !15, file: !15, line: 172, type: !836, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!932 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !933, line: 267)
!933 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !15, file: !15, line: 174, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!934 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !935, line: 268)
!935 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !15, file: !15, line: 176, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!936 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !937, line: 269)
!937 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !15, file: !15, line: 178, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!938 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !939, line: 270)
!939 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !15, file: !15, line: 180, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!940 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !941, line: 271)
!941 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !15, file: !15, line: 182, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!942 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !943, line: 272)
!943 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !15, file: !15, line: 184, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!944 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !945, line: 273)
!945 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !15, file: !15, line: 186, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!946 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !947, line: 102)
!947 = !DISubprogram(name: "acos", scope: !948, file: !948, line: 54, type: !949, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!948 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/nnllvm")
!949 = !DISubroutineType(types: !950)
!950 = !{!39, !39}
!951 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !952, line: 121)
!952 = !DISubprogram(name: "asin", scope: !948, file: !948, line: 56, type: !949, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!953 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !954, line: 140)
!954 = !DISubprogram(name: "atan", scope: !948, file: !948, line: 58, type: !949, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!955 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !956, line: 159)
!956 = !DISubprogram(name: "atan2", scope: !948, file: !948, line: 60, type: !957, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!957 = !DISubroutineType(types: !958)
!958 = !{!39, !39, !39}
!959 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !960, line: 180)
!960 = !DISubprogram(name: "ceil", scope: !948, file: !948, line: 178, type: !949, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!961 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !962, line: 199)
!962 = !DISubprogram(name: "cos", scope: !948, file: !948, line: 63, type: !949, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!963 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !964, line: 218)
!964 = !DISubprogram(name: "cosh", scope: !948, file: !948, line: 72, type: !949, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!965 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !966, line: 237)
!966 = !DISubprogram(name: "exp", scope: !948, file: !948, line: 100, type: !949, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!967 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !968, line: 256)
!968 = !DISubprogram(name: "fabs", scope: !948, file: !948, line: 181, type: !949, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!969 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !970, line: 275)
!970 = !DISubprogram(name: "floor", scope: !948, file: !948, line: 184, type: !949, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!971 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !972, line: 294)
!972 = !DISubprogram(name: "fmod", scope: !948, file: !948, line: 187, type: !957, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!973 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !974, line: 315)
!974 = !DISubprogram(name: "frexp", scope: !948, file: !948, line: 103, type: !975, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!975 = !DISubroutineType(types: !976)
!976 = !{!39, !39, !829}
!977 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !978, line: 334)
!978 = !DISubprogram(name: "ldexp", scope: !948, file: !948, line: 106, type: !979, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!979 = !DISubroutineType(types: !980)
!980 = !{!39, !39, !45}
!981 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !982, line: 353)
!982 = !DISubprogram(name: "log", scope: !948, file: !948, line: 109, type: !949, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!983 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !984, line: 372)
!984 = !DISubprogram(name: "log10", scope: !948, file: !948, line: 112, type: !949, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!985 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !986, line: 391)
!986 = !DISubprogram(name: "modf", scope: !948, file: !948, line: 115, type: !987, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!987 = !DISubroutineType(types: !988)
!988 = !{!39, !39, !989}
!989 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 64)
!990 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !991, line: 403)
!991 = !DISubprogram(name: "pow", scope: !948, file: !948, line: 153, type: !957, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!992 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !993, line: 440)
!993 = !DISubprogram(name: "sin", scope: !948, file: !948, line: 65, type: !949, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!994 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !995, line: 459)
!995 = !DISubprogram(name: "sinh", scope: !948, file: !948, line: 74, type: !949, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!996 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !997, line: 478)
!997 = !DISubprogram(name: "sqrt", scope: !948, file: !948, line: 156, type: !949, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!998 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !999, line: 497)
!999 = !DISubprogram(name: "tan", scope: !948, file: !948, line: 67, type: !949, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1000 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1001, line: 516)
!1001 = !DISubprogram(name: "tanh", scope: !948, file: !948, line: 76, type: !949, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1002 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1003, line: 118)
!1003 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !1004, line: 101, baseType: !1005)
!1004 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/nnllvm")
!1005 = !DICompositeType(tag: DW_TAG_structure_type, file: !1004, line: 97, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!1006 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1007, line: 119)
!1007 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !1004, line: 109, baseType: !1008)
!1008 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1004, line: 105, size: 128, elements: !1009, identifier: "_ZTS6ldiv_t")
!1009 = !{!1010, !1011}
!1010 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !1008, file: !1004, line: 107, baseType: !552, size: 64)
!1011 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !1008, file: !1004, line: 108, baseType: !552, size: 64, offset: 64)
!1012 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1013, line: 121)
!1013 = !DISubprogram(name: "abort", scope: !1004, file: !1004, line: 515, type: !1014, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: true)
!1014 = !DISubroutineType(types: !1015)
!1015 = !{null}
!1016 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1017, line: 122)
!1017 = !DISubprogram(name: "abs", scope: !1004, file: !1004, line: 775, type: !1018, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1018 = !DISubroutineType(types: !1019)
!1019 = !{!45, !45}
!1020 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1021, line: 123)
!1021 = !DISubprogram(name: "atexit", scope: !1004, file: !1004, line: 519, type: !1022, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1022 = !DISubroutineType(types: !1023)
!1023 = !{!45, !1024}
!1024 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1014, size: 64)
!1025 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1026, line: 129)
!1026 = distinct !DISubprogram(name: "atof", scope: !1027, file: !1027, line: 26, type: !898, isLocal: false, isDefinition: true, scopeLine: 27, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !1028)
!1027 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/nnllvm")
!1028 = !{!1029}
!1029 = !DILocalVariable(name: "__nptr", arg: 1, scope: !1026, file: !1027, line: 26, type: !502)
!1030 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1031, line: 130)
!1031 = distinct !DISubprogram(name: "atoi", scope: !1004, file: !1004, line: 278, type: !1032, isLocal: false, isDefinition: true, scopeLine: 279, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !1034)
!1032 = !DISubroutineType(types: !1033)
!1033 = !{!45, !502}
!1034 = !{!1035}
!1035 = !DILocalVariable(name: "__nptr", arg: 1, scope: !1031, file: !1004, line: 278, type: !502)
!1036 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1037, line: 131)
!1037 = !DISubprogram(name: "atol", scope: !1004, file: !1004, line: 283, type: !1038, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1038 = !DISubroutineType(types: !1039)
!1039 = !{!552, !502}
!1040 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1041, line: 132)
!1041 = !DISubprogram(name: "bsearch", scope: !1042, file: !1042, line: 20, type: !1043, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1042 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdlib-bsearch.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/nnllvm")
!1043 = !DISubroutineType(types: !1044)
!1044 = !{!42, !106, !106, !1045, !1045, !1047}
!1045 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1046, line: 62, baseType: !105)
!1046 = !DIFile(filename: "/home/dshen/llvm/build/bin/../lib/clang/5.0.0/include/stddef.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/nnllvm")
!1047 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !1004, line: 742, baseType: !1048)
!1048 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1049, size: 64)
!1049 = !DISubroutineType(types: !1050)
!1050 = !{!45, !106, !106}
!1051 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1052, line: 133)
!1052 = !DISubprogram(name: "calloc", scope: !1004, file: !1004, line: 468, type: !1053, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1053 = !DISubroutineType(types: !1054)
!1054 = !{!42, !1045, !1045}
!1055 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1056, line: 134)
!1056 = !DISubprogram(name: "div", scope: !1004, file: !1004, line: 789, type: !1057, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1057 = !DISubroutineType(types: !1058)
!1058 = !{!1003, !45, !45}
!1059 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1060, line: 135)
!1060 = !DISubprogram(name: "exit", scope: !1004, file: !1004, line: 543, type: !1061, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: true)
!1061 = !DISubroutineType(types: !1062)
!1062 = !{null, !45}
!1063 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1064, line: 136)
!1064 = !DISubprogram(name: "free", scope: !1004, file: !1004, line: 483, type: !1065, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1065 = !DISubroutineType(types: !1066)
!1066 = !{null, !42}
!1067 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1068, line: 137)
!1068 = !DISubprogram(name: "getenv", scope: !1004, file: !1004, line: 564, type: !1069, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1069 = !DISubroutineType(types: !1070)
!1070 = !{!44, !502}
!1071 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1072, line: 138)
!1072 = !DISubprogram(name: "labs", scope: !1004, file: !1004, line: 776, type: !860, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1073 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1074, line: 139)
!1074 = !DISubprogram(name: "ldiv", scope: !1004, file: !1004, line: 791, type: !1075, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1075 = !DISubroutineType(types: !1076)
!1076 = !{!1007, !552, !552}
!1077 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1078, line: 140)
!1078 = !DISubprogram(name: "malloc", scope: !1004, file: !1004, line: 466, type: !1079, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1079 = !DISubroutineType(types: !1080)
!1080 = !{!42, !1045}
!1081 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1082, line: 142)
!1082 = !DISubprogram(name: "mblen", scope: !1004, file: !1004, line: 863, type: !1083, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1083 = !DISubroutineType(types: !1084)
!1084 = !{!45, !502, !1045}
!1085 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1086, line: 143)
!1086 = !DISubprogram(name: "mbstowcs", scope: !1004, file: !1004, line: 874, type: !1087, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1087 = !DISubroutineType(types: !1088)
!1088 = !{!1045, !1089, !1092, !1045}
!1089 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1090)
!1090 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1091, size: 64)
!1091 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!1092 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !502)
!1093 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1094, line: 144)
!1094 = !DISubprogram(name: "mbtowc", scope: !1004, file: !1004, line: 866, type: !1095, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1095 = !DISubroutineType(types: !1096)
!1096 = !{!45, !1089, !1092, !1045}
!1097 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1098, line: 146)
!1098 = !DISubprogram(name: "qsort", scope: !1004, file: !1004, line: 765, type: !1099, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1099 = !DISubroutineType(types: !1100)
!1100 = !{null, !42, !1045, !1045, !1047}
!1101 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1102, line: 152)
!1102 = !DISubprogram(name: "rand", scope: !1004, file: !1004, line: 374, type: !1103, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1103 = !DISubroutineType(types: !1104)
!1104 = !{!45}
!1105 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1106, line: 153)
!1106 = !DISubprogram(name: "realloc", scope: !1004, file: !1004, line: 480, type: !1107, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1107 = !DISubroutineType(types: !1108)
!1108 = !{!42, !42, !1045}
!1109 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1110, line: 154)
!1110 = !DISubprogram(name: "srand", scope: !1004, file: !1004, line: 376, type: !1111, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1111 = !DISubroutineType(types: !1112)
!1112 = !{null, !1113}
!1113 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!1114 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1115, line: 155)
!1115 = !DISubprogram(name: "strtod", scope: !1004, file: !1004, line: 164, type: !1116, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1116 = !DISubroutineType(types: !1117)
!1117 = !{!39, !1092, !1118}
!1118 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !43)
!1119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1120, line: 156)
!1120 = !DISubprogram(name: "strtol", scope: !1004, file: !1004, line: 183, type: !1121, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1121 = !DISubroutineType(types: !1122)
!1122 = !{!552, !1092, !1118, !45}
!1123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1124, line: 157)
!1124 = !DISubprogram(name: "strtoul", scope: !1004, file: !1004, line: 187, type: !1125, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1125 = !DISubroutineType(types: !1126)
!1126 = !{!105, !1092, !1118, !45}
!1127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1128, line: 158)
!1128 = !DISubprogram(name: "system", scope: !1004, file: !1004, line: 717, type: !1032, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1129 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1130, line: 160)
!1130 = !DISubprogram(name: "wcstombs", scope: !1004, file: !1004, line: 877, type: !1131, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1131 = !DISubroutineType(types: !1132)
!1132 = !{!1045, !1133, !1134, !1045}
!1133 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !44)
!1134 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1135)
!1135 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1136, size: 64)
!1136 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1091)
!1137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1138, line: 161)
!1138 = !DISubprogram(name: "wctomb", scope: !1004, file: !1004, line: 870, type: !1139, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1139 = !DISubroutineType(types: !1140)
!1140 = !{!45, !44, !1091}
!1141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !60, entity: !1142, line: 201)
!1142 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !1004, line: 121, baseType: !1143)
!1143 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1004, line: 117, size: 128, elements: !1144, identifier: "_ZTS7lldiv_t")
!1144 = !{!1145, !1146}
!1145 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !1143, file: !1004, line: 119, baseType: !766, size: 64)
!1146 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !1143, file: !1004, line: 120, baseType: !766, size: 64, offset: 64)
!1147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !60, entity: !1148, line: 207)
!1148 = !DISubprogram(name: "_Exit", scope: !1004, file: !1004, line: 557, type: !1061, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: true)
!1149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !60, entity: !1150, line: 211)
!1150 = !DISubprogram(name: "llabs", scope: !1004, file: !1004, line: 780, type: !764, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !60, entity: !1152, line: 217)
!1152 = !DISubprogram(name: "lldiv", scope: !1004, file: !1004, line: 797, type: !1153, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1153 = !DISubroutineType(types: !1154)
!1154 = !{!1142, !766, !766}
!1155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !60, entity: !1156, line: 228)
!1156 = !DISubprogram(name: "atoll", scope: !1004, file: !1004, line: 292, type: !1157, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1157 = !DISubroutineType(types: !1158)
!1158 = !{!766, !502}
!1159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !60, entity: !1160, line: 229)
!1160 = !DISubprogram(name: "strtoll", scope: !1004, file: !1004, line: 209, type: !1161, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1161 = !DISubroutineType(types: !1162)
!1162 = !{!766, !1092, !1118, !45}
!1163 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !60, entity: !1164, line: 230)
!1164 = !DISubprogram(name: "strtoull", scope: !1004, file: !1004, line: 214, type: !1165, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1165 = !DISubroutineType(types: !1166)
!1166 = !{!1167, !1092, !1118, !45}
!1167 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!1168 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !60, entity: !1169, line: 232)
!1169 = !DISubprogram(name: "strtof", scope: !1004, file: !1004, line: 172, type: !1170, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1170 = !DISubroutineType(types: !1171)
!1171 = !{!22, !1092, !1118}
!1172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !60, entity: !1173, line: 233)
!1173 = !DISubprogram(name: "strtold", scope: !1004, file: !1004, line: 175, type: !1174, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1174 = !DISubroutineType(types: !1175)
!1175 = !{!1176, !1092, !1118}
!1176 = !DIBasicType(name: "long double", size: 128, encoding: DW_ATE_float)
!1177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1142, line: 241)
!1178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1148, line: 243)
!1179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1150, line: 245)
!1180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1181, line: 246)
!1181 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !60, file: !1182, line: 214, type: !1153, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1182 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/cstdlib", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/nnllvm")
!1183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1152, line: 247)
!1184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1156, line: 249)
!1185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1169, line: 250)
!1186 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1160, line: 251)
!1187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1164, line: 252)
!1188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1173, line: 253)
!1189 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1190, line: 418)
!1190 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !1191, file: !1191, line: 1126, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1191 = !DIFile(filename: "/usr/local/cuda/include/math_functions.hpp", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/nnllvm")
!1192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1193, line: 419)
!1193 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !1191, file: !1191, line: 1154, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1195, line: 420)
!1195 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !1191, file: !1191, line: 1121, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1197, line: 421)
!1197 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !1191, file: !1191, line: 1159, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1199, line: 422)
!1199 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !1191, file: !1191, line: 1111, type: !781, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1201, line: 423)
!1201 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !1191, file: !1191, line: 1116, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1203, line: 424)
!1203 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !1191, file: !1191, line: 1164, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1205, line: 425)
!1205 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !1191, file: !1191, line: 1199, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1206 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1207, line: 426)
!1207 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !1208, file: !1208, line: 647, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1208 = !DIFile(filename: "/usr/local/cuda/include/device_functions.hpp", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/nnllvm")
!1209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1210, line: 427)
!1210 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !1191, file: !1191, line: 973, type: !781, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1211 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1212, line: 428)
!1212 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !1191, file: !1191, line: 1027, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1214, line: 429)
!1214 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !1191, file: !1191, line: 1096, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1216, line: 430)
!1216 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !1191, file: !1191, line: 1259, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1217 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1218, line: 431)
!1218 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !1191, file: !1191, line: 1249, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1219 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1220, line: 432)
!1220 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !1208, file: !1208, line: 637, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1221 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1222, line: 433)
!1222 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !1191, file: !1191, line: 1078, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1223 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1224, line: 434)
!1224 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !1191, file: !1191, line: 1169, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1225 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1226, line: 435)
!1226 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !1208, file: !1208, line: 582, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1228, line: 436)
!1228 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !1191, file: !1191, line: 1385, type: !781, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1229 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1230, line: 437)
!1230 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !1208, file: !1208, line: 572, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1231 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1232, line: 438)
!1232 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !1191, file: !1191, line: 1337, type: !813, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1233 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1234, line: 439)
!1234 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !1208, file: !1208, line: 602, type: !781, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1235 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1236, line: 440)
!1236 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !1208, file: !1208, line: 597, type: !781, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1237 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1238, line: 441)
!1238 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !1191, file: !1191, line: 1322, type: !781, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1239 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1240, line: 442)
!1240 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !1191, file: !1191, line: 1312, type: !827, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1241 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1242, line: 443)
!1242 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !1191, file: !1191, line: 1174, type: !781, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1243 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1244, line: 444)
!1244 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !1191, file: !1191, line: 1390, type: !823, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1245 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1246, line: 445)
!1246 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !1191, file: !1191, line: 1289, type: !864, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1248, line: 446)
!1248 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !1191, file: !1191, line: 1284, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1249 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1250, line: 447)
!1250 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !1191, file: !1191, line: 933, type: !872, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1251 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1252, line: 448)
!1252 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !1191, file: !1191, line: 1371, type: !872, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1253 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1254, line: 449)
!1254 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !1191, file: !1191, line: 1140, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1255 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1256, line: 450)
!1256 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !1191, file: !1191, line: 1149, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1257 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1258, line: 451)
!1258 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !1191, file: !1191, line: 1069, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1259 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1260, line: 452)
!1260 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !1191, file: !1191, line: 1395, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1262, line: 453)
!1262 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !1191, file: !1191, line: 1131, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1263 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1264, line: 454)
!1264 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !1191, file: !1191, line: 924, type: !886, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1266, line: 455)
!1266 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !1191, file: !1191, line: 1376, type: !886, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1267 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1268, line: 456)
!1268 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !1191, file: !1191, line: 1317, type: !894, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1269 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1270, line: 457)
!1270 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !1191, file: !1191, line: 938, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1271 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1272, line: 458)
!1272 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !1191, file: !1191, line: 1002, type: !781, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1273 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1274, line: 459)
!1274 = !DISubprogram(name: "nexttowardf", scope: !948, file: !948, line: 284, type: !1275, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1275 = !DISubroutineType(types: !1276)
!1276 = !{!22, !22, !1176}
!1277 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1274, line: 460)
!1278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1279, line: 461)
!1279 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !1191, file: !1191, line: 1352, type: !781, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1281, line: 462)
!1281 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !1191, file: !1191, line: 1327, type: !781, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1283, line: 463)
!1283 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !1191, file: !1191, line: 1332, type: !918, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1285, line: 464)
!1285 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !1191, file: !1191, line: 919, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1286 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1287, line: 465)
!1287 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !1191, file: !1191, line: 1366, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1289, line: 466)
!1289 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !1191, file: !1191, line: 1299, type: !926, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1290 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1291, line: 467)
!1291 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !1191, file: !1191, line: 1294, type: !864, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1292 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1293, line: 468)
!1293 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !1191, file: !1191, line: 1018, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1294 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1295, line: 469)
!1295 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !1191, file: !1191, line: 1101, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1296 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1297, line: 470)
!1297 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !1208, file: !1208, line: 887, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1298 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1299, line: 471)
!1299 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !1191, file: !1191, line: 1060, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1300 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1301, line: 472)
!1301 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !1191, file: !1191, line: 1106, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1302 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1303, line: 473)
!1303 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !1191, file: !1191, line: 1361, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1304 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !14, entity: !1305, line: 474)
!1305 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !1208, file: !1208, line: 642, type: !769, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!1306 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !1307, entity: !1309, line: 56)
!1307 = !DINamespace(name: "__gnu_debug", scope: null, file: !1308, line: 54)
!1308 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/debug/debug.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/nnllvm")
!1309 = !DINamespace(name: "__debug", scope: !14, file: !1308, line: 48)
!1310 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !60, entity: !103, line: 44)
!1311 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !60, entity: !551, line: 45)
!1312 = !{i32 2, !"Dwarf Version", i32 4}
!1313 = !{i32 2, !"Debug Info Version", i32 3}
!1314 = !{!"clang version 5.0.0 (trunk 294196)"}
!1315 = distinct !DISubprogram(name: "get_time", linkageName: "_Z8get_timev", scope: !1, file: !1, line: 25, type: !1316, isLocal: false, isDefinition: true, scopeLine: 25, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !1318)
!1316 = !DISubroutineType(types: !1317)
!1317 = !{!39}
!1318 = !{!1319}
!1319 = !DILocalVariable(name: "time", scope: !1315, file: !1, line: 26, type: !1320)
!1320 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timeval", file: !1321, line: 30, size: 128, elements: !1322, identifier: "_ZTS7timeval")
!1321 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/time.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/nnllvm")
!1322 = !{!1323, !1326}
!1323 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !1320, file: !1321, line: 32, baseType: !1324, size: 64)
!1324 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !1325, line: 139, baseType: !552)
!1325 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/nnllvm")
!1326 = !DIDerivedType(tag: DW_TAG_member, name: "tv_usec", scope: !1320, file: !1321, line: 33, baseType: !1327, size: 64, offset: 64)
!1327 = !DIDerivedType(tag: DW_TAG_typedef, name: "__suseconds_t", file: !1325, line: 141, baseType: !552)
!1328 = !DILocation(line: 26, column: 5, scope: !1315)
!1329 = !DIExpression(DW_OP_deref)
!1330 = !DILocation(line: 26, column: 20, scope: !1315)
!1331 = !DILocation(line: 27, column: 9, scope: !1332)
!1332 = distinct !DILexicalBlock(scope: !1315, file: !1, line: 27, column: 9)
!1333 = !DILocation(line: 27, column: 9, scope: !1315)
!1334 = !DILocation(line: 31, column: 25, scope: !1315)
!1335 = !{!1336, !1337, i64 0}
!1336 = !{!"_ZTS7timeval", !1337, i64 0, !1337, i64 8}
!1337 = !{!"long", !1338, i64 0}
!1338 = !{!"omnipotent char", !1339, i64 0}
!1339 = !{!"Simple C++ TBAA"}
!1340 = !DILocation(line: 31, column: 20, scope: !1315)
!1341 = !DILocation(line: 31, column: 47, scope: !1315)
!1342 = !{!1336, !1337, i64 8}
!1343 = !DILocation(line: 31, column: 42, scope: !1315)
!1344 = !DILocation(line: 31, column: 55, scope: !1315)
!1345 = !DILocation(line: 31, column: 32, scope: !1315)
!1346 = !DILocation(line: 31, column: 5, scope: !1315)
!1347 = !DILocation(line: 32, column: 1, scope: !1315)
!1348 = distinct !DISubprogram(name: "euclid", linkageName: "_Z6euclidP7latLongPfiff", scope: !1, file: !1, line: 58, type: !1349, isLocal: false, isDefinition: true, scopeLine: 59, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !1353)
!1349 = !DISubroutineType(types: !1350)
!1350 = !{null, !1351, !40, !45, !22, !22}
!1351 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1352, size: 64)
!1352 = !DIDerivedType(tag: DW_TAG_typedef, name: "LatLong", file: !1, line: 39, baseType: !19)
!1353 = !{!1354, !1355, !1356, !1357, !1358}
!1354 = !DILocalVariable(name: "d_locations", arg: 1, scope: !1348, file: !1, line: 58, type: !1351)
!1355 = !DILocalVariable(name: "d_distances", arg: 2, scope: !1348, file: !1, line: 58, type: !40)
!1356 = !DILocalVariable(name: "numRecords", arg: 3, scope: !1348, file: !1, line: 58, type: !45)
!1357 = !DILocalVariable(name: "lat", arg: 4, scope: !1348, file: !1, line: 58, type: !22)
!1358 = !DILocalVariable(name: "lng", arg: 5, scope: !1348, file: !1, line: 58, type: !22)
!1359 = !DIExpression()
!1360 = !DILocation(line: 58, column: 33, scope: !1348)
!1361 = !{!1362, !1362, i64 0}
!1362 = !{!"any pointer", !1338, i64 0}
!1363 = !DILocation(line: 58, column: 53, scope: !1348)
!1364 = !DILocation(line: 58, column: 70, scope: !1348)
!1365 = !{!1366, !1366, i64 0}
!1366 = !{!"int", !1338, i64 0}
!1367 = !DILocation(line: 58, column: 87, scope: !1348)
!1368 = !{!1369, !1369, i64 0}
!1369 = !{!"float", !1338, i64 0}
!1370 = !DILocation(line: 58, column: 98, scope: !1348)
!1371 = !DILocation(line: 59, column: 1, scope: !1348)
!1372 = !DILocation(line: 59, column: 1, scope: !1373)
!1373 = !DILexicalBlockFile(scope: !1348, file: !1, discriminator: 1)
!1374 = !DILocation(line: 59, column: 1, scope: !1375)
!1375 = !DILexicalBlockFile(scope: !1348, file: !1, discriminator: 2)
!1376 = !DILocation(line: 59, column: 1, scope: !1377)
!1377 = !DILexicalBlockFile(scope: !1348, file: !1, discriminator: 3)
!1378 = !DILocation(line: 59, column: 1, scope: !1379)
!1379 = !DILexicalBlockFile(scope: !1348, file: !1, discriminator: 4)
!1380 = !DILocation(line: 59, column: 1, scope: !1381)
!1381 = !DILexicalBlockFile(scope: !1348, file: !1, discriminator: 5)
!1382 = !DILocation(line: 67, column: 1, scope: !1348)
!1383 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 73, type: !1384, isLocal: false, isDefinition: true, scopeLine: 74, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !1386)
!1384 = !DISubroutineType(types: !1385)
!1385 = !{!45, !45, !43}
!1386 = !{!1387, !1388, !1389, !1390, !1391, !1392, !1393, !1394, !1395, !1396, !1397, !1398, !1402, !1403, !1404, !1405, !1406, !1407, !1481, !1482, !1483, !1484, !1485, !1486, !1487, !1488, !1489, !1490, !1514, !1515}
!1387 = !DILocalVariable(name: "argc", arg: 1, scope: !1383, file: !1, line: 73, type: !45)
!1388 = !DILocalVariable(name: "argv", arg: 2, scope: !1383, file: !1, line: 73, type: !43)
!1389 = !DILocalVariable(name: "i", scope: !1383, file: !1, line: 75, type: !45)
!1390 = !DILocalVariable(name: "lat", scope: !1383, file: !1, line: 76, type: !22)
!1391 = !DILocalVariable(name: "lng", scope: !1383, file: !1, line: 76, type: !22)
!1392 = !DILocalVariable(name: "quiet", scope: !1383, file: !1, line: 77, type: !45)
!1393 = !DILocalVariable(name: "timing", scope: !1383, file: !1, line: 77, type: !45)
!1394 = !DILocalVariable(name: "platform", scope: !1383, file: !1, line: 77, type: !45)
!1395 = !DILocalVariable(name: "device", scope: !1383, file: !1, line: 77, type: !45)
!1396 = !DILocalVariable(name: "records", scope: !1383, file: !1, line: 79, type: !568)
!1397 = !DILocalVariable(name: "locations", scope: !1383, file: !1, line: 80, type: !366)
!1398 = !DILocalVariable(name: "filename", scope: !1383, file: !1, line: 81, type: !1399)
!1399 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 800, elements: !1400)
!1400 = !{!1401}
!1401 = !DISubrange(count: 100)
!1402 = !DILocalVariable(name: "resultsCount", scope: !1383, file: !1, line: 82, type: !45)
!1403 = !DILocalVariable(name: "numRecords", scope: !1383, file: !1, line: 91, type: !45)
!1404 = !DILocalVariable(name: "distances", scope: !1383, file: !1, line: 99, type: !40)
!1405 = !DILocalVariable(name: "d_locations", scope: !1383, file: !1, line: 101, type: !1351)
!1406 = !DILocalVariable(name: "d_distances", scope: !1383, file: !1, line: 102, type: !40)
!1407 = !DILocalVariable(name: "deviceProp", scope: !1383, file: !1, line: 106, type: !1408)
!1408 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "cudaDeviceProp", file: !4, line: 1257, size: 5056, elements: !1409, identifier: "_ZTS14cudaDeviceProp")
!1409 = !{!1410, !1414, !1415, !1416, !1417, !1418, !1419, !1420, !1424, !1425, !1426, !1427, !1428, !1429, !1430, !1431, !1432, !1433, !1434, !1435, !1436, !1437, !1438, !1439, !1440, !1444, !1445, !1446, !1447, !1448, !1449, !1450, !1451, !1452, !1453, !1454, !1455, !1456, !1457, !1458, !1459, !1460, !1461, !1462, !1463, !1464, !1465, !1466, !1467, !1468, !1469, !1470, !1471, !1472, !1473, !1474, !1475, !1476, !1477, !1478, !1479, !1480}
!1410 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !1408, file: !4, line: 1259, baseType: !1411, size: 2048)
!1411 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 2048, elements: !1412)
!1412 = !{!1413}
!1413 = !DISubrange(count: 256)
!1414 = !DIDerivedType(tag: DW_TAG_member, name: "totalGlobalMem", scope: !1408, file: !4, line: 1260, baseType: !1045, size: 64, offset: 2048)
!1415 = !DIDerivedType(tag: DW_TAG_member, name: "sharedMemPerBlock", scope: !1408, file: !4, line: 1261, baseType: !1045, size: 64, offset: 2112)
!1416 = !DIDerivedType(tag: DW_TAG_member, name: "regsPerBlock", scope: !1408, file: !4, line: 1262, baseType: !45, size: 32, offset: 2176)
!1417 = !DIDerivedType(tag: DW_TAG_member, name: "warpSize", scope: !1408, file: !4, line: 1263, baseType: !45, size: 32, offset: 2208)
!1418 = !DIDerivedType(tag: DW_TAG_member, name: "memPitch", scope: !1408, file: !4, line: 1264, baseType: !1045, size: 64, offset: 2240)
!1419 = !DIDerivedType(tag: DW_TAG_member, name: "maxThreadsPerBlock", scope: !1408, file: !4, line: 1265, baseType: !45, size: 32, offset: 2304)
!1420 = !DIDerivedType(tag: DW_TAG_member, name: "maxThreadsDim", scope: !1408, file: !4, line: 1266, baseType: !1421, size: 96, offset: 2336)
!1421 = !DICompositeType(tag: DW_TAG_array_type, baseType: !45, size: 96, elements: !1422)
!1422 = !{!1423}
!1423 = !DISubrange(count: 3)
!1424 = !DIDerivedType(tag: DW_TAG_member, name: "maxGridSize", scope: !1408, file: !4, line: 1267, baseType: !1421, size: 96, offset: 2432)
!1425 = !DIDerivedType(tag: DW_TAG_member, name: "clockRate", scope: !1408, file: !4, line: 1268, baseType: !45, size: 32, offset: 2528)
!1426 = !DIDerivedType(tag: DW_TAG_member, name: "totalConstMem", scope: !1408, file: !4, line: 1269, baseType: !1045, size: 64, offset: 2560)
!1427 = !DIDerivedType(tag: DW_TAG_member, name: "major", scope: !1408, file: !4, line: 1270, baseType: !45, size: 32, offset: 2624)
!1428 = !DIDerivedType(tag: DW_TAG_member, name: "minor", scope: !1408, file: !4, line: 1271, baseType: !45, size: 32, offset: 2656)
!1429 = !DIDerivedType(tag: DW_TAG_member, name: "textureAlignment", scope: !1408, file: !4, line: 1272, baseType: !1045, size: 64, offset: 2688)
!1430 = !DIDerivedType(tag: DW_TAG_member, name: "texturePitchAlignment", scope: !1408, file: !4, line: 1273, baseType: !1045, size: 64, offset: 2752)
!1431 = !DIDerivedType(tag: DW_TAG_member, name: "deviceOverlap", scope: !1408, file: !4, line: 1274, baseType: !45, size: 32, offset: 2816)
!1432 = !DIDerivedType(tag: DW_TAG_member, name: "multiProcessorCount", scope: !1408, file: !4, line: 1275, baseType: !45, size: 32, offset: 2848)
!1433 = !DIDerivedType(tag: DW_TAG_member, name: "kernelExecTimeoutEnabled", scope: !1408, file: !4, line: 1276, baseType: !45, size: 32, offset: 2880)
!1434 = !DIDerivedType(tag: DW_TAG_member, name: "integrated", scope: !1408, file: !4, line: 1277, baseType: !45, size: 32, offset: 2912)
!1435 = !DIDerivedType(tag: DW_TAG_member, name: "canMapHostMemory", scope: !1408, file: !4, line: 1278, baseType: !45, size: 32, offset: 2944)
!1436 = !DIDerivedType(tag: DW_TAG_member, name: "computeMode", scope: !1408, file: !4, line: 1279, baseType: !45, size: 32, offset: 2976)
!1437 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture1D", scope: !1408, file: !4, line: 1280, baseType: !45, size: 32, offset: 3008)
!1438 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture1DMipmap", scope: !1408, file: !4, line: 1281, baseType: !45, size: 32, offset: 3040)
!1439 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture1DLinear", scope: !1408, file: !4, line: 1282, baseType: !45, size: 32, offset: 3072)
!1440 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2D", scope: !1408, file: !4, line: 1283, baseType: !1441, size: 64, offset: 3104)
!1441 = !DICompositeType(tag: DW_TAG_array_type, baseType: !45, size: 64, elements: !1442)
!1442 = !{!1443}
!1443 = !DISubrange(count: 2)
!1444 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2DMipmap", scope: !1408, file: !4, line: 1284, baseType: !1441, size: 64, offset: 3168)
!1445 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2DLinear", scope: !1408, file: !4, line: 1285, baseType: !1421, size: 96, offset: 3232)
!1446 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2DGather", scope: !1408, file: !4, line: 1286, baseType: !1441, size: 64, offset: 3328)
!1447 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture3D", scope: !1408, file: !4, line: 1287, baseType: !1421, size: 96, offset: 3392)
!1448 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture3DAlt", scope: !1408, file: !4, line: 1288, baseType: !1421, size: 96, offset: 3488)
!1449 = !DIDerivedType(tag: DW_TAG_member, name: "maxTextureCubemap", scope: !1408, file: !4, line: 1289, baseType: !45, size: 32, offset: 3584)
!1450 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture1DLayered", scope: !1408, file: !4, line: 1290, baseType: !1441, size: 64, offset: 3616)
!1451 = !DIDerivedType(tag: DW_TAG_member, name: "maxTexture2DLayered", scope: !1408, file: !4, line: 1291, baseType: !1421, size: 96, offset: 3680)
!1452 = !DIDerivedType(tag: DW_TAG_member, name: "maxTextureCubemapLayered", scope: !1408, file: !4, line: 1292, baseType: !1441, size: 64, offset: 3776)
!1453 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface1D", scope: !1408, file: !4, line: 1293, baseType: !45, size: 32, offset: 3840)
!1454 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface2D", scope: !1408, file: !4, line: 1294, baseType: !1441, size: 64, offset: 3872)
!1455 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface3D", scope: !1408, file: !4, line: 1295, baseType: !1421, size: 96, offset: 3936)
!1456 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface1DLayered", scope: !1408, file: !4, line: 1296, baseType: !1441, size: 64, offset: 4032)
!1457 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurface2DLayered", scope: !1408, file: !4, line: 1297, baseType: !1421, size: 96, offset: 4096)
!1458 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurfaceCubemap", scope: !1408, file: !4, line: 1298, baseType: !45, size: 32, offset: 4192)
!1459 = !DIDerivedType(tag: DW_TAG_member, name: "maxSurfaceCubemapLayered", scope: !1408, file: !4, line: 1299, baseType: !1441, size: 64, offset: 4224)
!1460 = !DIDerivedType(tag: DW_TAG_member, name: "surfaceAlignment", scope: !1408, file: !4, line: 1300, baseType: !1045, size: 64, offset: 4288)
!1461 = !DIDerivedType(tag: DW_TAG_member, name: "concurrentKernels", scope: !1408, file: !4, line: 1301, baseType: !45, size: 32, offset: 4352)
!1462 = !DIDerivedType(tag: DW_TAG_member, name: "ECCEnabled", scope: !1408, file: !4, line: 1302, baseType: !45, size: 32, offset: 4384)
!1463 = !DIDerivedType(tag: DW_TAG_member, name: "pciBusID", scope: !1408, file: !4, line: 1303, baseType: !45, size: 32, offset: 4416)
!1464 = !DIDerivedType(tag: DW_TAG_member, name: "pciDeviceID", scope: !1408, file: !4, line: 1304, baseType: !45, size: 32, offset: 4448)
!1465 = !DIDerivedType(tag: DW_TAG_member, name: "pciDomainID", scope: !1408, file: !4, line: 1305, baseType: !45, size: 32, offset: 4480)
!1466 = !DIDerivedType(tag: DW_TAG_member, name: "tccDriver", scope: !1408, file: !4, line: 1306, baseType: !45, size: 32, offset: 4512)
!1467 = !DIDerivedType(tag: DW_TAG_member, name: "asyncEngineCount", scope: !1408, file: !4, line: 1307, baseType: !45, size: 32, offset: 4544)
!1468 = !DIDerivedType(tag: DW_TAG_member, name: "unifiedAddressing", scope: !1408, file: !4, line: 1308, baseType: !45, size: 32, offset: 4576)
!1469 = !DIDerivedType(tag: DW_TAG_member, name: "memoryClockRate", scope: !1408, file: !4, line: 1309, baseType: !45, size: 32, offset: 4608)
!1470 = !DIDerivedType(tag: DW_TAG_member, name: "memoryBusWidth", scope: !1408, file: !4, line: 1310, baseType: !45, size: 32, offset: 4640)
!1471 = !DIDerivedType(tag: DW_TAG_member, name: "l2CacheSize", scope: !1408, file: !4, line: 1311, baseType: !45, size: 32, offset: 4672)
!1472 = !DIDerivedType(tag: DW_TAG_member, name: "maxThreadsPerMultiProcessor", scope: !1408, file: !4, line: 1312, baseType: !45, size: 32, offset: 4704)
!1473 = !DIDerivedType(tag: DW_TAG_member, name: "streamPrioritiesSupported", scope: !1408, file: !4, line: 1313, baseType: !45, size: 32, offset: 4736)
!1474 = !DIDerivedType(tag: DW_TAG_member, name: "globalL1CacheSupported", scope: !1408, file: !4, line: 1314, baseType: !45, size: 32, offset: 4768)
!1475 = !DIDerivedType(tag: DW_TAG_member, name: "localL1CacheSupported", scope: !1408, file: !4, line: 1315, baseType: !45, size: 32, offset: 4800)
!1476 = !DIDerivedType(tag: DW_TAG_member, name: "sharedMemPerMultiprocessor", scope: !1408, file: !4, line: 1316, baseType: !1045, size: 64, offset: 4864)
!1477 = !DIDerivedType(tag: DW_TAG_member, name: "regsPerMultiprocessor", scope: !1408, file: !4, line: 1317, baseType: !45, size: 32, offset: 4928)
!1478 = !DIDerivedType(tag: DW_TAG_member, name: "managedMemory", scope: !1408, file: !4, line: 1318, baseType: !45, size: 32, offset: 4960)
!1479 = !DIDerivedType(tag: DW_TAG_member, name: "isMultiGpuBoard", scope: !1408, file: !4, line: 1319, baseType: !45, size: 32, offset: 4992)
!1480 = !DIDerivedType(tag: DW_TAG_member, name: "multiGpuBoardGroupID", scope: !1408, file: !4, line: 1320, baseType: !45, size: 32, offset: 5024)
!1481 = !DILocalVariable(name: "maxGridX", scope: !1383, file: !1, line: 109, type: !105)
!1482 = !DILocalVariable(name: "threadsPerBlock", scope: !1383, file: !1, line: 110, type: !105)
!1483 = !DILocalVariable(name: "totalDeviceMemory", scope: !1383, file: !1, line: 111, type: !1045)
!1484 = !DILocalVariable(name: "freeDeviceMemory", scope: !1383, file: !1, line: 112, type: !1045)
!1485 = !DILocalVariable(name: "usableDeviceMemory", scope: !1383, file: !1, line: 115, type: !105)
!1486 = !DILocalVariable(name: "maxThreads", scope: !1383, file: !1, line: 116, type: !105)
!1487 = !DILocalVariable(name: "blocks", scope: !1383, file: !1, line: 122, type: !105)
!1488 = !DILocalVariable(name: "gridY", scope: !1383, file: !1, line: 123, type: !105)
!1489 = !DILocalVariable(name: "gridX", scope: !1383, file: !1, line: 124, type: !105)
!1490 = !DILocalVariable(name: "gridDim", scope: !1383, file: !1, line: 126, type: !1491)
!1491 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !1492, line: 427, baseType: !1493)
!1492 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/nnllvm")
!1493 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !1492, line: 417, size: 96, elements: !1494, identifier: "_ZTS4dim3")
!1494 = !{!1495, !1496, !1497, !1498, !1502, !1511}
!1495 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1493, file: !1492, line: 419, baseType: !1113, size: 32)
!1496 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1493, file: !1492, line: 419, baseType: !1113, size: 32, offset: 32)
!1497 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1493, file: !1492, line: 419, baseType: !1113, size: 32, offset: 64)
!1498 = !DISubprogram(name: "dim3", scope: !1493, file: !1492, line: 421, type: !1499, isLocal: false, isDefinition: false, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: true)
!1499 = !DISubroutineType(types: !1500)
!1500 = !{null, !1501, !1113, !1113, !1113}
!1501 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1493, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1502 = !DISubprogram(name: "dim3", scope: !1493, file: !1492, line: 422, type: !1503, isLocal: false, isDefinition: false, scopeLine: 422, flags: DIFlagPrototyped, isOptimized: true)
!1503 = !DISubroutineType(types: !1504)
!1504 = !{null, !1501, !1505}
!1505 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !1492, line: 383, baseType: !1506)
!1506 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !1492, line: 190, size: 96, elements: !1507, identifier: "_ZTS5uint3")
!1507 = !{!1508, !1509, !1510}
!1508 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1506, file: !1492, line: 192, baseType: !1113, size: 32)
!1509 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1506, file: !1492, line: 192, baseType: !1113, size: 32, offset: 32)
!1510 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !1506, file: !1492, line: 192, baseType: !1113, size: 32, offset: 64)
!1511 = !DISubprogram(name: "operator uint3", linkageName: "_ZN4dim3cv5uint3Ev", scope: !1493, file: !1492, line: 423, type: !1512, isLocal: false, isDefinition: false, scopeLine: 423, flags: DIFlagPrototyped, isOptimized: true)
!1512 = !DISubroutineType(types: !1513)
!1513 = !{!1505, !1501}
!1514 = !DILocalVariable(name: "t0", scope: !1383, file: !1, line: 159, type: !39)
!1515 = !DILocalVariable(name: "t1", scope: !1383, file: !1, line: 163, type: !39)
!1516 = !DILocation(line: 73, column: 14, scope: !1383)
!1517 = !DILocation(line: 73, column: 26, scope: !1383)
!1518 = !DILocation(line: 75, column: 9, scope: !1383)
!1519 = !DILocation(line: 76, column: 2, scope: !1383)
!1520 = !DILocation(line: 77, column: 2, scope: !1383)
!1521 = !DILocation(line: 77, column: 6, scope: !1383)
!1522 = !DILocation(line: 77, column: 14, scope: !1383)
!1523 = !DILocation(line: 77, column: 23, scope: !1383)
!1524 = !DILocation(line: 77, column: 34, scope: !1383)
!1525 = !DILocation(line: 79, column: 5, scope: !1383)
!1526 = !DILocation(line: 79, column: 25, scope: !1383)
!1527 = !DILocalVariable(name: "this", arg: 1, scope: !1528, type: !1530, flags: DIFlagArtificial | DIFlagObjectPointer)
!1528 = distinct !DISubprogram(name: "vector", linkageName: "_ZNSt6vectorI6recordSaIS0_EEC2Ev", scope: !568, file: !48, line: 248, type: !572, isLocal: false, isDefinition: true, scopeLine: 249, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !571, variables: !1529)
!1529 = !{!1527}
!1530 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !568, size: 64)
!1531 = !DILocation(line: 0, scope: !1528, inlinedAt: !1532)
!1532 = distinct !DILocation(line: 79, column: 25, scope: !1383)
!1533 = !DILocation(line: 87, column: 35, scope: !1534, inlinedAt: !1538)
!1534 = distinct !DISubprogram(name: "_Vector_impl", linkageName: "_ZNSt12_Vector_baseI6recordSaIS0_EE12_Vector_implC2Ev", scope: !52, file: !48, line: 86, type: !155, isLocal: false, isDefinition: true, scopeLine: 88, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !154, variables: !1535)
!1535 = !{!1536}
!1536 = !DILocalVariable(name: "this", arg: 1, scope: !1534, type: !1537, flags: DIFlagArtificial | DIFlagObjectPointer)
!1537 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!1538 = distinct !DILocation(line: 125, column: 9, scope: !1539, inlinedAt: !1543)
!1539 = distinct !DISubprogram(name: "_Vector_base", linkageName: "_ZNSt12_Vector_baseI6recordSaIS0_EEC2Ev", scope: !49, file: !48, line: 124, type: !182, isLocal: false, isDefinition: true, scopeLine: 125, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !181, variables: !1540)
!1540 = !{!1541}
!1541 = !DILocalVariable(name: "this", arg: 1, scope: !1539, type: !1542, flags: DIFlagArtificial | DIFlagObjectPointer)
!1542 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!1543 = distinct !DILocation(line: 249, column: 9, scope: !1528, inlinedAt: !1532)
!1544 = !DILocation(line: 80, column: 2, scope: !1383)
!1545 = !DILocalVariable(name: "this", arg: 1, scope: !1546, type: !1548, flags: DIFlagArtificial | DIFlagObjectPointer)
!1546 = distinct !DISubprogram(name: "vector", linkageName: "_ZNSt6vectorI7latLongSaIS0_EEC2Ev", scope: !366, file: !48, line: 248, type: !370, isLocal: false, isDefinition: true, scopeLine: 249, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !369, variables: !1547)
!1547 = !{!1545}
!1548 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !366, size: 64)
!1549 = !DILocation(line: 0, scope: !1546, inlinedAt: !1550)
!1550 = distinct !DILocation(line: 80, column: 23, scope: !1383)
!1551 = !DILocation(line: 87, column: 35, scope: !1552, inlinedAt: !1556)
!1552 = distinct !DISubprogram(name: "_Vector_impl", linkageName: "_ZNSt12_Vector_baseI7latLongSaIS0_EE12_Vector_implC2Ev", scope: !215, file: !48, line: 86, type: !308, isLocal: false, isDefinition: true, scopeLine: 88, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !307, variables: !1553)
!1553 = !{!1554}
!1554 = !DILocalVariable(name: "this", arg: 1, scope: !1552, type: !1555, flags: DIFlagArtificial | DIFlagObjectPointer)
!1555 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !215, size: 64)
!1556 = distinct !DILocation(line: 125, column: 9, scope: !1557, inlinedAt: !1561)
!1557 = distinct !DISubprogram(name: "_Vector_base", linkageName: "_ZNSt12_Vector_baseI7latLongSaIS0_EEC2Ev", scope: !212, file: !48, line: 124, type: !335, isLocal: false, isDefinition: true, scopeLine: 125, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !334, variables: !1558)
!1558 = !{!1559}
!1559 = !DILocalVariable(name: "this", arg: 1, scope: !1557, type: !1560, flags: DIFlagArtificial | DIFlagObjectPointer)
!1560 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !212, size: 64)
!1561 = distinct !DILocation(line: 249, column: 9, scope: !1546, inlinedAt: !1550)
!1562 = !DILocation(line: 81, column: 2, scope: !1383)
!1563 = !DILocation(line: 81, column: 7, scope: !1383)
!1564 = !DILocation(line: 82, column: 2, scope: !1383)
!1565 = !DILocation(line: 82, column: 6, scope: !1383)
!1566 = !DILocation(line: 76, column: 8, scope: !1383)
!1567 = !DILocation(line: 76, column: 13, scope: !1383)
!1568 = !DILocation(line: 85, column: 9, scope: !1569)
!1569 = distinct !DILexicalBlock(scope: !1383, file: !1, line: 85, column: 9)
!1570 = !DILocation(line: 85, column: 9, scope: !1571)
!1571 = !DILexicalBlockFile(scope: !1569, file: !1, discriminator: 1)
!1572 = !DILocation(line: 85, column: 9, scope: !1573)
!1573 = !DILexicalBlockFile(scope: !1383, file: !1, discriminator: 1)
!1574 = !DILocation(line: 87, column: 7, scope: !1575)
!1575 = distinct !DILexicalBlock(scope: !1569, file: !1, line: 86, column: 60)
!1576 = !DILocation(line: 182, column: 1, scope: !1571)
!1577 = !DILocation(line: 91, column: 22, scope: !1383)
!1578 = !DILocation(line: 91, column: 9, scope: !1383)
!1579 = !DILocation(line: 92, column: 9, scope: !1580)
!1580 = distinct !DILexicalBlock(scope: !1383, file: !1, line: 92, column: 9)
!1581 = !DILocation(line: 92, column: 22, scope: !1580)
!1582 = !DILocation(line: 92, column: 9, scope: !1383)
!1583 = !DILocation(line: 92, column: 49, scope: !1584)
!1584 = !DILexicalBlockFile(scope: !1580, file: !1, discriminator: 1)
!1585 = !DILocation(line: 92, column: 36, scope: !1584)
!1586 = !DILocation(line: 101, column: 2, scope: !1383)
!1587 = !DILocation(line: 102, column: 2, scope: !1383)
!1588 = !DILocation(line: 106, column: 2, scope: !1383)
!1589 = !DILocation(line: 107, column: 2, scope: !1383)
!1590 = !DILocation(line: 108, column: 2, scope: !1383)
!1591 = !DILocation(line: 109, column: 27, scope: !1383)
!1592 = !DILocation(line: 109, column: 16, scope: !1383)
!1593 = !DILocation(line: 110, column: 34, scope: !1383)
!1594 = !{!1595, !1366, i64 288}
!1595 = !{!"_ZTS14cudaDeviceProp", !1338, i64 0, !1337, i64 256, !1337, i64 264, !1366, i64 272, !1366, i64 276, !1337, i64 280, !1366, i64 288, !1338, i64 292, !1338, i64 304, !1366, i64 316, !1337, i64 320, !1366, i64 328, !1366, i64 332, !1337, i64 336, !1337, i64 344, !1366, i64 352, !1366, i64 356, !1366, i64 360, !1366, i64 364, !1366, i64 368, !1366, i64 372, !1366, i64 376, !1366, i64 380, !1366, i64 384, !1338, i64 388, !1338, i64 396, !1338, i64 404, !1338, i64 416, !1338, i64 424, !1338, i64 436, !1366, i64 448, !1338, i64 452, !1338, i64 460, !1338, i64 472, !1366, i64 480, !1338, i64 484, !1338, i64 492, !1338, i64 504, !1338, i64 512, !1366, i64 524, !1338, i64 528, !1337, i64 536, !1366, i64 544, !1366, i64 548, !1366, i64 552, !1366, i64 556, !1366, i64 560, !1366, i64 564, !1366, i64 568, !1366, i64 572, !1366, i64 576, !1366, i64 580, !1366, i64 584, !1366, i64 588, !1366, i64 592, !1366, i64 596, !1366, i64 600, !1337, i64 608, !1366, i64 616, !1366, i64 620, !1366, i64 624, !1366, i64 628}
!1596 = !DILocation(line: 110, column: 34, scope: !1597)
!1597 = !DILexicalBlockFile(scope: !1383, file: !1, discriminator: 3)
!1598 = !DILocation(line: 110, column: 16, scope: !1383)
!1599 = !DILocation(line: 111, column: 2, scope: !1383)
!1600 = !DILocation(line: 112, column: 2, scope: !1383)
!1601 = !DILocation(line: 113, column: 2, scope: !1383)
!1602 = !DILocation(line: 114, column: 2, scope: !1383)
!1603 = !DILocation(line: 115, column: 37, scope: !1383)
!1604 = !{!1337, !1337, i64 0}
!1605 = !DILocation(line: 112, column: 9, scope: !1383)
!1606 = !DILocation(line: 115, column: 54, scope: !1383)
!1607 = !DILocation(line: 116, column: 48, scope: !1383)
!1608 = !DILocation(line: 116, column: 16, scope: !1383)
!1609 = !DILocation(line: 117, column: 7, scope: !1610)
!1610 = distinct !DILexicalBlock(scope: !1383, file: !1, line: 117, column: 7)
!1611 = !DILocation(line: 117, column: 18, scope: !1610)
!1612 = !DILocation(line: 117, column: 7, scope: !1383)
!1613 = !DILocation(line: 119, column: 12, scope: !1614)
!1614 = distinct !DILexicalBlock(scope: !1610, file: !1, line: 118, column: 2)
!1615 = !DILocation(line: 119, column: 3, scope: !1614)
!1616 = !DILocation(line: 120, column: 3, scope: !1614)
!1617 = !DILocation(line: 182, column: 1, scope: !1618)
!1618 = !DILexicalBlockFile(scope: !1383, file: !1, discriminator: 2)
!1619 = !DILocation(line: 182, column: 1, scope: !1597)
!1620 = !DILocation(line: 122, column: 25, scope: !1383)
!1621 = !DILocation(line: 122, column: 16, scope: !1383)
!1622 = !DILocation(line: 123, column: 24, scope: !1383)
!1623 = !DILocation(line: 123, column: 16, scope: !1383)
!1624 = !DILocation(line: 124, column: 24, scope: !1383)
!1625 = !DILocation(line: 124, column: 16, scope: !1383)
!1626 = !DILocation(line: 126, column: 7, scope: !1383)
!1627 = !DILocalVariable(name: "this", arg: 1, scope: !1628, type: !1633, flags: DIFlagArtificial | DIFlagObjectPointer)
!1628 = distinct !DISubprogram(name: "dim3", linkageName: "_ZN4dim3C2Ejjj", scope: !1493, file: !1492, line: 421, type: !1499, isLocal: false, isDefinition: true, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !1498, variables: !1629)
!1629 = !{!1627, !1630, !1631, !1632}
!1630 = !DILocalVariable(name: "vx", arg: 2, scope: !1628, file: !1492, line: 421, type: !1113)
!1631 = !DILocalVariable(name: "vy", arg: 3, scope: !1628, file: !1492, line: 421, type: !1113)
!1632 = !DILocalVariable(name: "vz", arg: 4, scope: !1628, file: !1492, line: 421, type: !1113)
!1633 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1493, size: 64)
!1634 = !DILocation(line: 0, scope: !1628, inlinedAt: !1635)
!1635 = distinct !DILocation(line: 126, column: 7, scope: !1383)
!1636 = !DILocation(line: 421, column: 85, scope: !1628, inlinedAt: !1635)
!1637 = !DILocation(line: 145, column: 44, scope: !1383)
!1638 = !DILocation(line: 145, column: 23, scope: !1383)
!1639 = !DILocation(line: 145, column: 14, scope: !1383)
!1640 = !DILocation(line: 99, column: 9, scope: !1383)
!1641 = !DILocation(line: 146, column: 13, scope: !1383)
!1642 = !DILocation(line: 146, column: 52, scope: !1383)
!1643 = !DILocation(line: 146, column: 2, scope: !1383)
!1644 = !DILocation(line: 147, column: 13, scope: !1383)
!1645 = !DILocation(line: 147, column: 2, scope: !1383)
!1646 = !DILocation(line: 152, column: 17, scope: !1383)
!1647 = !DILocation(line: 80, column: 23, scope: !1383)
!1648 = !DILocalVariable(name: "this", arg: 1, scope: !1649, type: !1548, flags: DIFlagArtificial | DIFlagObjectPointer)
!1649 = distinct !DISubprogram(name: "operator[]", linkageName: "_ZNSt6vectorI7latLongSaIS0_EEixEm", scope: !366, file: !48, line: 770, type: !438, isLocal: false, isDefinition: true, scopeLine: 771, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !437, variables: !1650)
!1650 = !{!1648, !1651}
!1651 = !DILocalVariable(name: "__n", arg: 2, scope: !1649, file: !48, line: 770, type: !363)
!1652 = !DILocation(line: 0, scope: !1649, inlinedAt: !1653)
!1653 = distinct !DILocation(line: 152, column: 31, scope: !1383)
!1654 = !DILocation(line: 770, column: 28, scope: !1649, inlinedAt: !1653)
!1655 = !DILocation(line: 771, column: 32, scope: !1649, inlinedAt: !1653)
!1656 = !{!1657, !1362, i64 0}
!1657 = !{!"_ZTSSt12_Vector_baseI7latLongSaIS0_EE", !1658, i64 0}
!1658 = !{!"_ZTSNSt12_Vector_baseI7latLongSaIS0_EE12_Vector_implE", !1362, i64 0, !1362, i64 8, !1362, i64 16}
!1659 = !DILocation(line: 152, column: 5, scope: !1573)
!1660 = !DILocation(line: 158, column: 5, scope: !1383)
!1661 = !DILocation(line: 26, column: 5, scope: !1315, inlinedAt: !1662)
!1662 = distinct !DILocation(line: 159, column: 14, scope: !1383)
!1663 = !DILocation(line: 26, column: 20, scope: !1315, inlinedAt: !1662)
!1664 = !DILocation(line: 27, column: 9, scope: !1332, inlinedAt: !1662)
!1665 = !DILocation(line: 27, column: 9, scope: !1315, inlinedAt: !1662)
!1666 = !DILocation(line: 31, column: 25, scope: !1315, inlinedAt: !1662)
!1667 = !DILocation(line: 31, column: 20, scope: !1315, inlinedAt: !1662)
!1668 = !DILocation(line: 31, column: 47, scope: !1315, inlinedAt: !1662)
!1669 = !DILocation(line: 31, column: 42, scope: !1315, inlinedAt: !1662)
!1670 = !DILocation(line: 31, column: 55, scope: !1315, inlinedAt: !1662)
!1671 = !DILocation(line: 31, column: 32, scope: !1315, inlinedAt: !1662)
!1672 = !DILocation(line: 31, column: 5, scope: !1315, inlinedAt: !1662)
!1673 = !DILocation(line: 32, column: 1, scope: !1315, inlinedAt: !1662)
!1674 = !DILocation(line: 159, column: 9, scope: !1383)
!1675 = !DILocation(line: 161, column: 15, scope: !1383)
!1676 = !DILocation(line: 0, scope: !1628, inlinedAt: !1677)
!1677 = distinct !DILocation(line: 161, column: 24, scope: !1383)
!1678 = !DILocation(line: 421, column: 43, scope: !1628, inlinedAt: !1677)
!1679 = !DILocation(line: 421, column: 64, scope: !1628, inlinedAt: !1677)
!1680 = !DILocation(line: 421, column: 85, scope: !1628, inlinedAt: !1677)
!1681 = !DILocation(line: 421, column: 95, scope: !1628, inlinedAt: !1677)
!1682 = !DILocation(line: 421, column: 102, scope: !1628, inlinedAt: !1677)
!1683 = !DILocation(line: 161, column: 11, scope: !1573)
!1684 = !DILocation(line: 161, column: 11, scope: !1618)
!1685 = !DILocation(line: 161, column: 5, scope: !1618)
!1686 = !DILocation(line: 161, column: 44, scope: !1597)
!1687 = !DILocation(line: 101, column: 11, scope: !1383)
!1688 = !DILocation(line: 161, column: 56, scope: !1597)
!1689 = !DILocation(line: 102, column: 9, scope: !1383)
!1690 = !DILocation(line: 161, column: 79, scope: !1597)
!1691 = !DILocation(line: 161, column: 83, scope: !1597)
!1692 = !DILocation(line: 161, column: 5, scope: !1597)
!1693 = !DILocation(line: 182, column: 1, scope: !1694)
!1694 = !DILexicalBlockFile(scope: !1383, file: !1, discriminator: 6)
!1695 = !DILocation(line: 182, column: 1, scope: !1696)
!1696 = !DILexicalBlockFile(scope: !1383, file: !1, discriminator: 7)
!1697 = !DILocation(line: 162, column: 5, scope: !1383)
!1698 = !DILocation(line: 26, column: 5, scope: !1315, inlinedAt: !1699)
!1699 = distinct !DILocation(line: 163, column: 14, scope: !1383)
!1700 = !DILocation(line: 26, column: 20, scope: !1315, inlinedAt: !1699)
!1701 = !DILocation(line: 27, column: 9, scope: !1332, inlinedAt: !1699)
!1702 = !DILocation(line: 27, column: 9, scope: !1315, inlinedAt: !1699)
!1703 = !DILocation(line: 31, column: 25, scope: !1315, inlinedAt: !1699)
!1704 = !DILocation(line: 31, column: 20, scope: !1315, inlinedAt: !1699)
!1705 = !DILocation(line: 31, column: 47, scope: !1315, inlinedAt: !1699)
!1706 = !DILocation(line: 31, column: 42, scope: !1315, inlinedAt: !1699)
!1707 = !DILocation(line: 31, column: 55, scope: !1315, inlinedAt: !1699)
!1708 = !DILocation(line: 31, column: 32, scope: !1315, inlinedAt: !1699)
!1709 = !DILocation(line: 31, column: 5, scope: !1315, inlinedAt: !1699)
!1710 = !DILocation(line: 32, column: 1, scope: !1315, inlinedAt: !1699)
!1711 = !DILocation(line: 163, column: 9, scope: !1383)
!1712 = !DILocation(line: 164, column: 10, scope: !1383)
!1713 = !DILocation(line: 164, column: 28, scope: !1383)
!1714 = !DILocation(line: 164, column: 2, scope: !1383)
!1715 = !DILocation(line: 167, column: 28, scope: !1383)
!1716 = !DILocation(line: 167, column: 5, scope: !1383)
!1717 = !DILocalVariable(name: "records", arg: 1, scope: !1718, file: !1, line: 238, type: !596)
!1718 = distinct !DISubprogram(name: "findLowest", linkageName: "_Z10findLowestRSt6vectorI6recordSaIS0_EEPfii", scope: !1, file: !1, line: 238, type: !1719, isLocal: false, isDefinition: true, scopeLine: 238, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !1721)
!1719 = !DISubroutineType(types: !1720)
!1720 = !{null, !596, !40, !45, !45}
!1721 = !{!1717, !1722, !1723, !1724, !1725, !1726, !1727, !1728, !1729, !1732}
!1722 = !DILocalVariable(name: "distances", arg: 2, scope: !1718, file: !1, line: 238, type: !40)
!1723 = !DILocalVariable(name: "numRecords", arg: 3, scope: !1718, file: !1, line: 238, type: !45)
!1724 = !DILocalVariable(name: "topN", arg: 4, scope: !1718, file: !1, line: 238, type: !45)
!1725 = !DILocalVariable(name: "i", scope: !1718, file: !1, line: 239, type: !45)
!1726 = !DILocalVariable(name: "j", scope: !1718, file: !1, line: 239, type: !45)
!1727 = !DILocalVariable(name: "val", scope: !1718, file: !1, line: 240, type: !22)
!1728 = !DILocalVariable(name: "minLoc", scope: !1718, file: !1, line: 241, type: !45)
!1729 = !DILocalVariable(name: "tempRec", scope: !1718, file: !1, line: 242, type: !1730)
!1730 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1731, size: 64)
!1731 = !DIDerivedType(tag: DW_TAG_typedef, name: "Record", file: !1, line: 45, baseType: !30)
!1732 = !DILocalVariable(name: "tempDist", scope: !1718, file: !1, line: 243, type: !22)
!1733 = !DILocation(line: 238, column: 38, scope: !1718, inlinedAt: !1734)
!1734 = distinct !DILocation(line: 170, column: 5, scope: !1383)
!1735 = !DILocation(line: 238, column: 53, scope: !1718, inlinedAt: !1734)
!1736 = !DILocation(line: 238, column: 67, scope: !1718, inlinedAt: !1734)
!1737 = !DILocation(line: 238, column: 82, scope: !1718, inlinedAt: !1734)
!1738 = !DILocation(line: 239, column: 7, scope: !1718, inlinedAt: !1734)
!1739 = !DILocation(line: 245, column: 12, scope: !1740, inlinedAt: !1734)
!1740 = !DILexicalBlockFile(scope: !1741, file: !1, discriminator: 1)
!1741 = distinct !DILexicalBlock(scope: !1742, file: !1, line: 245, column: 3)
!1742 = distinct !DILexicalBlock(scope: !1718, file: !1, line: 245, column: 3)
!1743 = !DILocation(line: 245, column: 3, scope: !1744, inlinedAt: !1734)
!1744 = !DILexicalBlockFile(scope: !1742, file: !1, discriminator: 1)
!1745 = !{!1746, !1362, i64 0}
!1746 = !{!"_ZTSSt12_Vector_baseI6recordSaIS0_EE", !1747, i64 0}
!1747 = !{!"_ZTSNSt12_Vector_baseI6recordSaIS0_EE12_Vector_implE", !1362, i64 0, !1362, i64 8, !1362, i64 16}
!1748 = !DILocation(line: 239, column: 9, scope: !1718, inlinedAt: !1734)
!1749 = !DILocation(line: 241, column: 7, scope: !1718, inlinedAt: !1734)
!1750 = !DILocation(line: 247, column: 14, scope: !1751, inlinedAt: !1734)
!1751 = !DILexicalBlockFile(scope: !1752, file: !1, discriminator: 1)
!1752 = distinct !DILexicalBlock(scope: !1753, file: !1, line: 247, column: 5)
!1753 = distinct !DILexicalBlock(scope: !1754, file: !1, line: 247, column: 5)
!1754 = distinct !DILexicalBlock(scope: !1741, file: !1, line: 245, column: 23)
!1755 = !DILocation(line: 247, column: 5, scope: !1756, inlinedAt: !1734)
!1756 = !DILexicalBlockFile(scope: !1753, file: !1, discriminator: 1)
!1757 = !DILocation(line: 248, column: 13, scope: !1758, inlinedAt: !1734)
!1758 = distinct !DILexicalBlock(scope: !1752, file: !1, line: 247, column: 31)
!1759 = !DILocation(line: 240, column: 9, scope: !1718, inlinedAt: !1734)
!1760 = !DILocation(line: 249, column: 17, scope: !1761, inlinedAt: !1734)
!1761 = distinct !DILexicalBlock(scope: !1758, file: !1, line: 249, column: 11)
!1762 = !DILocation(line: 249, column: 15, scope: !1761, inlinedAt: !1734)
!1763 = !DILocation(line: 249, column: 11, scope: !1758, inlinedAt: !1734)
!1764 = !DILocation(line: 247, column: 27, scope: !1765, inlinedAt: !1734)
!1765 = !DILexicalBlockFile(scope: !1752, file: !1, discriminator: 2)
!1766 = distinct !{!1766, !1767}
!1767 = !{!"llvm.loop.unroll.disable"}
!1768 = distinct !{!1768, !1769, !1770}
!1769 = !DILocation(line: 247, column: 5, scope: !1753)
!1770 = !DILocation(line: 250, column: 5, scope: !1753)
!1771 = !DILocation(line: 0, scope: !1772, inlinedAt: !1776)
!1772 = distinct !DISubprogram(name: "operator[]", linkageName: "_ZNSt6vectorI6recordSaIS0_EEixEm", scope: !568, file: !48, line: 770, type: !638, isLocal: false, isDefinition: true, scopeLine: 771, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !637, variables: !1773)
!1773 = !{!1774, !1775}
!1774 = !DILocalVariable(name: "this", arg: 1, scope: !1772, type: !1530, flags: DIFlagArtificial | DIFlagObjectPointer)
!1775 = !DILocalVariable(name: "__n", arg: 2, scope: !1772, file: !48, line: 770, type: !363)
!1776 = distinct !DILocation(line: 252, column: 16, scope: !1754, inlinedAt: !1734)
!1777 = !DILocation(line: 770, column: 28, scope: !1772, inlinedAt: !1776)
!1778 = !DILocation(line: 253, column: 26, scope: !1754, inlinedAt: !1734)
!1779 = !DILocation(line: 0, scope: !1772, inlinedAt: !1780)
!1780 = distinct !DILocation(line: 253, column: 18, scope: !1754, inlinedAt: !1734)
!1781 = !DILocation(line: 770, column: 28, scope: !1772, inlinedAt: !1780)
!1782 = !DILocation(line: 0, scope: !1772, inlinedAt: !1783)
!1783 = distinct !DILocation(line: 253, column: 5, scope: !1784, inlinedAt: !1734)
!1784 = !DILexicalBlockFile(scope: !1754, file: !1, discriminator: 1)
!1785 = !DILocation(line: 770, column: 28, scope: !1772, inlinedAt: !1783)
!1786 = !DILocation(line: 253, column: 16, scope: !1754, inlinedAt: !1734)
!1787 = !{i64 0, i64 53, !1788, i64 56, i64 4, !1368}
!1788 = !{!1338, !1338, i64 0}
!1789 = !DILocation(line: 0, scope: !1772, inlinedAt: !1790)
!1790 = distinct !DILocation(line: 254, column: 5, scope: !1754, inlinedAt: !1734)
!1791 = !DILocation(line: 770, column: 28, scope: !1772, inlinedAt: !1790)
!1792 = !DILocation(line: 256, column: 16, scope: !1754, inlinedAt: !1734)
!1793 = !DILocation(line: 257, column: 20, scope: !1754, inlinedAt: !1734)
!1794 = !DILocation(line: 257, column: 18, scope: !1754, inlinedAt: !1734)
!1795 = !DILocation(line: 258, column: 23, scope: !1754, inlinedAt: !1734)
!1796 = !DILocation(line: 261, column: 27, scope: !1754, inlinedAt: !1734)
!1797 = !DILocation(line: 0, scope: !1772, inlinedAt: !1798)
!1798 = distinct !DILocation(line: 261, column: 5, scope: !1754, inlinedAt: !1734)
!1799 = !DILocation(line: 770, column: 28, scope: !1772, inlinedAt: !1798)
!1800 = !DILocation(line: 261, column: 16, scope: !1754, inlinedAt: !1734)
!1801 = !DILocation(line: 261, column: 25, scope: !1754, inlinedAt: !1734)
!1802 = !{!1803, !1369, i64 56}
!1803 = !{!"_ZTS6record", !1338, i64 0, !1369, i64 56}
!1804 = !DILocation(line: 245, column: 19, scope: !1805, inlinedAt: !1734)
!1805 = !DILexicalBlockFile(scope: !1741, file: !1, discriminator: 2)
!1806 = distinct !{!1806, !1807, !1808}
!1807 = !DILocation(line: 245, column: 3, scope: !1742)
!1808 = !DILocation(line: 262, column: 3, scope: !1742)
!1809 = !DILocation(line: 173, column: 10, scope: !1810)
!1810 = distinct !DILexicalBlock(scope: !1383, file: !1, line: 173, column: 9)
!1811 = !DILocation(line: 173, column: 9, scope: !1383)
!1812 = !DILocation(line: 174, column: 5, scope: !1813)
!1813 = !DILexicalBlockFile(scope: !1814, file: !1, discriminator: 1)
!1814 = distinct !DILexicalBlock(scope: !1810, file: !1, line: 174, column: 5)
!1815 = !DILocation(line: 0, scope: !1772, inlinedAt: !1816)
!1816 = distinct !DILocation(line: 175, column: 37, scope: !1817)
!1817 = distinct !DILexicalBlock(scope: !1818, file: !1, line: 174, column: 33)
!1818 = distinct !DILexicalBlock(scope: !1814, file: !1, line: 174, column: 5)
!1819 = !DILocation(line: 770, column: 28, scope: !1772, inlinedAt: !1816)
!1820 = !DILocation(line: 771, column: 32, scope: !1772, inlinedAt: !1816)
!1821 = !DILocation(line: 175, column: 37, scope: !1822)
!1822 = !DILexicalBlockFile(scope: !1817, file: !1, discriminator: 1)
!1823 = !DILocation(line: 0, scope: !1772, inlinedAt: !1824)
!1824 = distinct !DILocation(line: 175, column: 58, scope: !1822)
!1825 = !DILocation(line: 770, column: 28, scope: !1772, inlinedAt: !1824)
!1826 = !DILocation(line: 175, column: 69, scope: !1827)
!1827 = !DILexicalBlockFile(scope: !1817, file: !1, discriminator: 2)
!1828 = !DILocation(line: 175, column: 58, scope: !1827)
!1829 = !DILocation(line: 175, column: 7, scope: !1827)
!1830 = !DILocation(line: 174, column: 29, scope: !1831)
!1831 = !DILexicalBlockFile(scope: !1818, file: !1, discriminator: 2)
!1832 = !DILocation(line: 174, column: 14, scope: !1833)
!1833 = !DILexicalBlockFile(scope: !1818, file: !1, discriminator: 1)
!1834 = distinct !{!1834, !1835, !1836}
!1835 = !DILocation(line: 174, column: 5, scope: !1814)
!1836 = !DILocation(line: 176, column: 5, scope: !1814)
!1837 = !DILocation(line: 182, column: 1, scope: !1838)
!1838 = !DILexicalBlockFile(scope: !1383, file: !1, discriminator: 8)
!1839 = !DILocation(line: 177, column: 5, scope: !1383)
!1840 = !DILocation(line: 179, column: 11, scope: !1383)
!1841 = !DILocation(line: 179, column: 2, scope: !1383)
!1842 = !DILocation(line: 180, column: 11, scope: !1383)
!1843 = !DILocation(line: 180, column: 2, scope: !1383)
!1844 = !DILocation(line: 182, column: 1, scope: !1383)
!1845 = !DILocation(line: 182, column: 1, scope: !1846)
!1846 = !DILexicalBlockFile(scope: !1383, file: !1, discriminator: 9)
!1847 = !DILocalVariable(name: "this", arg: 1, scope: !1848, type: !1548, flags: DIFlagArtificial | DIFlagObjectPointer)
!1848 = distinct !DISubprogram(name: "~vector", linkageName: "_ZNSt6vectorI7latLongSaIS0_EED2Ev", scope: !366, file: !48, line: 414, type: !370, isLocal: false, isDefinition: true, scopeLine: 415, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !390, variables: !1849)
!1849 = !{!1847}
!1850 = !DILocation(line: 0, scope: !1848, inlinedAt: !1851)
!1851 = distinct !DILocation(line: 182, column: 1, scope: !1852)
!1852 = !DILexicalBlockFile(scope: !1383, file: !1, discriminator: 10)
!1853 = !DILocation(line: 160, column: 37, scope: !1854, inlinedAt: !1858)
!1854 = distinct !DILexicalBlock(scope: !1855, file: !48, line: 160, column: 7)
!1855 = distinct !DISubprogram(name: "~_Vector_base", linkageName: "_ZNSt12_Vector_baseI7latLongSaIS0_EED2Ev", scope: !212, file: !48, line: 159, type: !335, isLocal: false, isDefinition: true, scopeLine: 160, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !348, variables: !1856)
!1856 = !{!1857}
!1857 = !DILocalVariable(name: "this", arg: 1, scope: !1855, type: !1560, flags: DIFlagArtificial | DIFlagObjectPointer)
!1858 = distinct !DILocation(line: 416, column: 33, scope: !1859, inlinedAt: !1851)
!1859 = !DILexicalBlockFile(scope: !1860, file: !48, discriminator: 1)
!1860 = distinct !DILexicalBlock(scope: !1848, file: !48, line: 415, column: 7)
!1861 = !DILocalVariable(name: "__p", arg: 2, scope: !1862, file: !48, line: 171, type: !219)
!1862 = distinct !DISubprogram(name: "_M_deallocate", linkageName: "_ZNSt12_Vector_baseI7latLongSaIS0_EE13_M_deallocateEPS0_m", scope: !212, file: !48, line: 171, type: !353, isLocal: false, isDefinition: true, scopeLine: 172, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !352, variables: !1863)
!1863 = !{!1864, !1861, !1865}
!1864 = !DILocalVariable(name: "this", arg: 1, scope: !1862, type: !1560, flags: DIFlagArtificial | DIFlagObjectPointer)
!1865 = !DILocalVariable(name: "__n", arg: 3, scope: !1862, file: !48, line: 171, type: !103)
!1866 = !DILocation(line: 171, column: 29, scope: !1862, inlinedAt: !1867)
!1867 = distinct !DILocation(line: 160, column: 9, scope: !1854, inlinedAt: !1858)
!1868 = !DILocation(line: 173, column: 6, scope: !1869, inlinedAt: !1867)
!1869 = distinct !DILexicalBlock(scope: !1862, file: !48, line: 173, column: 6)
!1870 = !DILocation(line: 173, column: 6, scope: !1862, inlinedAt: !1867)
!1871 = !DILocalVariable(name: "__p", arg: 2, scope: !1872, file: !71, line: 109, type: !245)
!1872 = distinct !DISubprogram(name: "deallocate", linkageName: "_ZN9__gnu_cxx13new_allocatorI7latLongE10deallocateEPS1_m", scope: !230, file: !71, line: 109, type: !262, isLocal: false, isDefinition: true, scopeLine: 110, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !261, variables: !1873)
!1873 = !{!1874, !1871, !1876}
!1874 = !DILocalVariable(name: "this", arg: 1, scope: !1872, type: !1875, flags: DIFlagArtificial | DIFlagObjectPointer)
!1875 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !230, size: 64)
!1876 = !DILocalVariable(arg: 3, scope: !1872, file: !71, line: 109, type: !102)
!1877 = !DILocation(line: 109, column: 26, scope: !1872, inlinedAt: !1878)
!1878 = distinct !DILocation(line: 174, column: 12, scope: !1869, inlinedAt: !1867)
!1879 = !DILocation(line: 110, column: 27, scope: !1872, inlinedAt: !1878)
!1880 = !DILocation(line: 110, column: 9, scope: !1872, inlinedAt: !1878)
!1881 = !DILocation(line: 174, column: 4, scope: !1869, inlinedAt: !1867)
!1882 = !DILocalVariable(name: "this", arg: 1, scope: !1883, type: !1530, flags: DIFlagArtificial | DIFlagObjectPointer)
!1883 = distinct !DISubprogram(name: "~vector", linkageName: "_ZNSt6vectorI6recordSaIS0_EED2Ev", scope: !568, file: !48, line: 414, type: !572, isLocal: false, isDefinition: true, scopeLine: 415, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !592, variables: !1884)
!1884 = !{!1882}
!1885 = !DILocation(line: 0, scope: !1883, inlinedAt: !1886)
!1886 = distinct !DILocation(line: 182, column: 1, scope: !1887)
!1887 = !DILexicalBlockFile(scope: !1383, file: !1, discriminator: 11)
!1888 = !DILocation(line: 160, column: 37, scope: !1889, inlinedAt: !1893)
!1889 = distinct !DILexicalBlock(scope: !1890, file: !48, line: 160, column: 7)
!1890 = distinct !DISubprogram(name: "~_Vector_base", linkageName: "_ZNSt12_Vector_baseI6recordSaIS0_EED2Ev", scope: !49, file: !48, line: 159, type: !182, isLocal: false, isDefinition: true, scopeLine: 160, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !195, variables: !1891)
!1891 = !{!1892}
!1892 = !DILocalVariable(name: "this", arg: 1, scope: !1890, type: !1542, flags: DIFlagArtificial | DIFlagObjectPointer)
!1893 = distinct !DILocation(line: 416, column: 33, scope: !1894, inlinedAt: !1886)
!1894 = !DILexicalBlockFile(scope: !1895, file: !48, discriminator: 1)
!1895 = distinct !DILexicalBlock(scope: !1883, file: !48, line: 415, column: 7)
!1896 = !DILocalVariable(name: "__p", arg: 2, scope: !1897, file: !48, line: 171, type: !56)
!1897 = distinct !DISubprogram(name: "_M_deallocate", linkageName: "_ZNSt12_Vector_baseI6recordSaIS0_EE13_M_deallocateEPS0_m", scope: !49, file: !48, line: 171, type: !200, isLocal: false, isDefinition: true, scopeLine: 172, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !199, variables: !1898)
!1898 = !{!1899, !1896, !1900}
!1899 = !DILocalVariable(name: "this", arg: 1, scope: !1897, type: !1542, flags: DIFlagArtificial | DIFlagObjectPointer)
!1900 = !DILocalVariable(name: "__n", arg: 3, scope: !1897, file: !48, line: 171, type: !103)
!1901 = !DILocation(line: 171, column: 29, scope: !1897, inlinedAt: !1902)
!1902 = distinct !DILocation(line: 160, column: 9, scope: !1889, inlinedAt: !1893)
!1903 = !DILocation(line: 173, column: 6, scope: !1904, inlinedAt: !1902)
!1904 = distinct !DILexicalBlock(scope: !1897, file: !48, line: 173, column: 6)
!1905 = !DILocation(line: 173, column: 6, scope: !1897, inlinedAt: !1902)
!1906 = !DILocalVariable(name: "__p", arg: 2, scope: !1907, file: !71, line: 109, type: !86)
!1907 = distinct !DISubprogram(name: "deallocate", linkageName: "_ZN9__gnu_cxx13new_allocatorI6recordE10deallocateEPS1_m", scope: !70, file: !71, line: 109, type: !109, isLocal: false, isDefinition: true, scopeLine: 110, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !108, variables: !1908)
!1908 = !{!1909, !1906, !1911}
!1909 = !DILocalVariable(name: "this", arg: 1, scope: !1907, type: !1910, flags: DIFlagArtificial | DIFlagObjectPointer)
!1910 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!1911 = !DILocalVariable(arg: 3, scope: !1907, file: !71, line: 109, type: !102)
!1912 = !DILocation(line: 109, column: 26, scope: !1907, inlinedAt: !1913)
!1913 = distinct !DILocation(line: 174, column: 12, scope: !1904, inlinedAt: !1902)
!1914 = !DILocation(line: 110, column: 27, scope: !1907, inlinedAt: !1913)
!1915 = !DILocation(line: 110, column: 9, scope: !1907, inlinedAt: !1913)
!1916 = !DILocation(line: 174, column: 4, scope: !1904, inlinedAt: !1902)
!1917 = !DILocation(line: 182, column: 1, scope: !1918)
!1918 = !DILexicalBlockFile(scope: !1383, file: !1, discriminator: 12)
!1919 = !DILocation(line: 182, column: 1, scope: !1920)
!1920 = !DILexicalBlockFile(scope: !1383, file: !1, discriminator: 17)
!1921 = !DILocation(line: 182, column: 1, scope: !1922)
!1922 = !DILexicalBlockFile(scope: !1383, file: !1, discriminator: 18)
!1923 = !DILocation(line: 0, scope: !1848, inlinedAt: !1924)
!1924 = distinct !DILocation(line: 182, column: 1, scope: !1925)
!1925 = !DILexicalBlockFile(scope: !1383, file: !1, discriminator: 19)
!1926 = !DILocation(line: 160, column: 37, scope: !1854, inlinedAt: !1927)
!1927 = distinct !DILocation(line: 416, column: 33, scope: !1859, inlinedAt: !1924)
!1928 = !DILocation(line: 171, column: 29, scope: !1862, inlinedAt: !1929)
!1929 = distinct !DILocation(line: 160, column: 9, scope: !1854, inlinedAt: !1927)
!1930 = !DILocation(line: 173, column: 6, scope: !1869, inlinedAt: !1929)
!1931 = !DILocation(line: 173, column: 6, scope: !1862, inlinedAt: !1929)
!1932 = !DILocation(line: 109, column: 26, scope: !1872, inlinedAt: !1933)
!1933 = distinct !DILocation(line: 174, column: 12, scope: !1869, inlinedAt: !1929)
!1934 = !DILocation(line: 110, column: 27, scope: !1872, inlinedAt: !1933)
!1935 = !DILocation(line: 110, column: 9, scope: !1872, inlinedAt: !1933)
!1936 = !DILocation(line: 174, column: 4, scope: !1869, inlinedAt: !1929)
!1937 = !DILocation(line: 0, scope: !1883, inlinedAt: !1938)
!1938 = distinct !DILocation(line: 182, column: 1, scope: !1939)
!1939 = !DILexicalBlockFile(scope: !1383, file: !1, discriminator: 23)
!1940 = !DILocation(line: 160, column: 37, scope: !1889, inlinedAt: !1941)
!1941 = distinct !DILocation(line: 416, column: 33, scope: !1894, inlinedAt: !1938)
!1942 = !DILocation(line: 171, column: 29, scope: !1897, inlinedAt: !1943)
!1943 = distinct !DILocation(line: 160, column: 9, scope: !1889, inlinedAt: !1941)
!1944 = !DILocation(line: 173, column: 6, scope: !1904, inlinedAt: !1943)
!1945 = !DILocation(line: 173, column: 6, scope: !1897, inlinedAt: !1943)
!1946 = !DILocation(line: 109, column: 26, scope: !1907, inlinedAt: !1947)
!1947 = distinct !DILocation(line: 174, column: 12, scope: !1904, inlinedAt: !1943)
!1948 = !DILocation(line: 110, column: 27, scope: !1907, inlinedAt: !1947)
!1949 = !DILocation(line: 110, column: 9, scope: !1907, inlinedAt: !1947)
!1950 = !DILocation(line: 174, column: 4, scope: !1904, inlinedAt: !1943)
!1951 = !DILocation(line: 182, column: 1, scope: !1952)
!1952 = !DILexicalBlockFile(scope: !1383, file: !1, discriminator: 25)
!1953 = distinct !DISubprogram(name: "parseCommandline", linkageName: "_Z16parseCommandlineiPPcS_PiPfS2_S1_S1_S1_S1_", scope: !1, file: !1, line: 265, type: !1954, isLocal: false, isDefinition: true, scopeLine: 266, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !1956)
!1954 = !DISubroutineType(types: !1955)
!1955 = !{!45, !45, !43, !44, !829, !40, !40, !829, !829, !829, !829}
!1956 = !{!1957, !1958, !1959, !1960, !1961, !1962, !1963, !1964, !1965, !1966, !1967, !1968}
!1957 = !DILocalVariable(name: "argc", arg: 1, scope: !1953, file: !1, line: 265, type: !45)
!1958 = !DILocalVariable(name: "argv", arg: 2, scope: !1953, file: !1, line: 265, type: !43)
!1959 = !DILocalVariable(name: "filename", arg: 3, scope: !1953, file: !1, line: 265, type: !44)
!1960 = !DILocalVariable(name: "r", arg: 4, scope: !1953, file: !1, line: 265, type: !829)
!1961 = !DILocalVariable(name: "lat", arg: 5, scope: !1953, file: !1, line: 265, type: !40)
!1962 = !DILocalVariable(name: "lng", arg: 6, scope: !1953, file: !1, line: 265, type: !40)
!1963 = !DILocalVariable(name: "q", arg: 7, scope: !1953, file: !1, line: 266, type: !829)
!1964 = !DILocalVariable(name: "t", arg: 8, scope: !1953, file: !1, line: 266, type: !829)
!1965 = !DILocalVariable(name: "p", arg: 9, scope: !1953, file: !1, line: 266, type: !829)
!1966 = !DILocalVariable(name: "d", arg: 10, scope: !1953, file: !1, line: 266, type: !829)
!1967 = !DILocalVariable(name: "i", scope: !1953, file: !1, line: 267, type: !45)
!1968 = !DILocalVariable(name: "flag", scope: !1953, file: !1, line: 270, type: !34)
!1969 = !DILocation(line: 265, column: 26, scope: !1953)
!1970 = !DILocation(line: 265, column: 38, scope: !1953)
!1971 = !DILocation(line: 265, column: 52, scope: !1953)
!1972 = !DILocation(line: 265, column: 66, scope: !1953)
!1973 = !DILocation(line: 265, column: 75, scope: !1953)
!1974 = !DILocation(line: 265, column: 86, scope: !1953)
!1975 = !DILocation(line: 266, column: 27, scope: !1953)
!1976 = !DILocation(line: 266, column: 35, scope: !1953)
!1977 = !DILocation(line: 266, column: 43, scope: !1953)
!1978 = !DILocation(line: 266, column: 51, scope: !1953)
!1979 = !DILocation(line: 268, column: 14, scope: !1980)
!1980 = distinct !DILexicalBlock(scope: !1953, file: !1, line: 268, column: 9)
!1981 = !DILocation(line: 268, column: 9, scope: !1953)
!1982 = !DILocation(line: 269, column: 22, scope: !1953)
!1983 = !DILocation(line: 269, column: 5, scope: !1953)
!1984 = !DILocation(line: 267, column: 9, scope: !1953)
!1985 = !DILocation(line: 273, column: 11, scope: !1986)
!1986 = distinct !DILexicalBlock(scope: !1987, file: !1, line: 273, column: 11)
!1987 = distinct !DILexicalBlock(scope: !1988, file: !1, line: 272, column: 25)
!1988 = distinct !DILexicalBlock(scope: !1989, file: !1, line: 272, column: 5)
!1989 = distinct !DILexicalBlock(scope: !1953, file: !1, line: 272, column: 5)
!1990 = !DILocation(line: 273, column: 21, scope: !1986)
!1991 = !DILocation(line: 273, column: 11, scope: !1987)
!1992 = !DILocation(line: 274, column: 16, scope: !1993)
!1993 = distinct !DILexicalBlock(scope: !1986, file: !1, line: 273, column: 28)
!1994 = !DILocation(line: 270, column: 10, scope: !1953)
!1995 = !DILocation(line: 275, column: 19, scope: !1993)
!1996 = !DILocation(line: 275, column: 11, scope: !1993)
!1997 = !DILocation(line: 277, column: 16, scope: !1998)
!1998 = distinct !DILexicalBlock(scope: !1993, file: !1, line: 275, column: 25)
!1999 = !DILocation(line: 278, column: 25, scope: !1998)
!2000 = !DILocation(line: 278, column: 1, scope: !1031, inlinedAt: !2001)
!2001 = distinct !DILocation(line: 278, column: 20, scope: !1998)
!2002 = !DILocation(line: 280, column: 16, scope: !1031, inlinedAt: !2001)
!2003 = !DILocation(line: 278, column: 18, scope: !1998)
!2004 = !DILocation(line: 279, column: 15, scope: !1998)
!2005 = !DILocation(line: 281, column: 19, scope: !2006)
!2006 = distinct !DILexicalBlock(scope: !1998, file: !1, line: 281, column: 19)
!2007 = !DILocation(line: 281, column: 29, scope: !2006)
!2008 = !DILocation(line: 26, column: 1, scope: !1026, inlinedAt: !2009)
!2009 = distinct !DILocation(line: 282, column: 24, scope: !2010)
!2010 = distinct !DILexicalBlock(scope: !2006, file: !1, line: 281, column: 36)
!2011 = !DILocation(line: 28, column: 10, scope: !1026, inlinedAt: !2009)
!2012 = !DILocation(line: 281, column: 19, scope: !1998)
!2013 = !DILocation(line: 288, column: 15, scope: !1998)
!2014 = !DILocation(line: 292, column: 18, scope: !1998)
!2015 = !DILocation(line: 293, column: 15, scope: !1998)
!2016 = !DILocation(line: 295, column: 18, scope: !1998)
!2017 = !DILocation(line: 296, column: 15, scope: !1998)
!2018 = !DILocation(line: 298, column: 16, scope: !1998)
!2019 = !DILocation(line: 299, column: 25, scope: !1998)
!2020 = !DILocation(line: 278, column: 1, scope: !1031, inlinedAt: !2021)
!2021 = distinct !DILocation(line: 299, column: 20, scope: !1998)
!2022 = !DILocation(line: 280, column: 16, scope: !1031, inlinedAt: !2021)
!2023 = !DILocation(line: 299, column: 18, scope: !1998)
!2024 = !DILocation(line: 300, column: 15, scope: !1998)
!2025 = !DILocation(line: 302, column: 16, scope: !1998)
!2026 = !DILocation(line: 303, column: 25, scope: !1998)
!2027 = !DILocation(line: 278, column: 1, scope: !1031, inlinedAt: !2028)
!2028 = distinct !DILocation(line: 303, column: 20, scope: !1998)
!2029 = !DILocation(line: 280, column: 16, scope: !1031, inlinedAt: !2028)
!2030 = !DILocation(line: 303, column: 18, scope: !1998)
!2031 = !DILocation(line: 304, column: 15, scope: !1998)
!2032 = !DILocation(line: 272, column: 21, scope: !2033)
!2033 = !DILexicalBlockFile(scope: !1988, file: !1, discriminator: 2)
!2034 = !DILocation(line: 272, column: 14, scope: !2035)
!2035 = !DILexicalBlockFile(scope: !1988, file: !1, discriminator: 1)
!2036 = !DILocation(line: 272, column: 5, scope: !2037)
!2037 = !DILexicalBlockFile(scope: !1989, file: !1, discriminator: 1)
!2038 = distinct !{!2038, !2039, !2040}
!2039 = !DILocation(line: 272, column: 5, scope: !1989)
!2040 = !DILocation(line: 307, column: 5, scope: !1989)
!2041 = !DILocation(line: 308, column: 10, scope: !2042)
!2042 = distinct !DILexicalBlock(scope: !1953, file: !1, line: 308, column: 9)
!2043 = !DILocation(line: 308, column: 13, scope: !2042)
!2044 = !DILocation(line: 308, column: 21, scope: !2045)
!2045 = !DILexicalBlockFile(scope: !2042, file: !1, discriminator: 1)
!2046 = !DILocation(line: 308, column: 23, scope: !2045)
!2047 = !DILocation(line: 308, column: 18, scope: !2042)
!2048 = !DILocation(line: 308, column: 33, scope: !2049)
!2049 = !DILexicalBlockFile(scope: !2042, file: !1, discriminator: 2)
!2050 = !DILocation(line: 308, column: 42, scope: !2051)
!2051 = !DILexicalBlockFile(scope: !2042, file: !1, discriminator: 3)
!2052 = !DILocation(line: 308, column: 37, scope: !2049)
!2053 = !DILocation(line: 311, column: 1, scope: !1953)
!2054 = distinct !DISubprogram(name: "printUsage", linkageName: "_Z10printUsagev", scope: !1, file: !1, line: 313, type: !1014, isLocal: false, isDefinition: true, scopeLine: 313, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !16)
!2055 = !DILocation(line: 314, column: 3, scope: !2054)
!2056 = !DILocation(line: 315, column: 3, scope: !2054)
!2057 = !DILocation(line: 316, column: 3, scope: !2054)
!2058 = !DILocation(line: 317, column: 3, scope: !2054)
!2059 = !DILocation(line: 318, column: 3, scope: !2054)
!2060 = !DILocation(line: 319, column: 3, scope: !2054)
!2061 = !DILocation(line: 320, column: 3, scope: !2054)
!2062 = !DILocation(line: 321, column: 3, scope: !2054)
!2063 = !DILocation(line: 322, column: 3, scope: !2054)
!2064 = !DILocation(line: 323, column: 3, scope: !2054)
!2065 = !DILocation(line: 324, column: 3, scope: !2054)
!2066 = !DILocation(line: 325, column: 3, scope: !2054)
!2067 = !DILocation(line: 326, column: 3, scope: !2054)
!2068 = !DILocation(line: 327, column: 3, scope: !2054)
!2069 = !DILocation(line: 328, column: 3, scope: !2054)
!2070 = !DILocation(line: 329, column: 3, scope: !2054)
!2071 = !DILocation(line: 330, column: 3, scope: !2054)
!2072 = !DILocation(line: 331, column: 3, scope: !2054)
!2073 = !DILocation(line: 332, column: 3, scope: !2054)
!2074 = !DILocation(line: 333, column: 3, scope: !2054)
!2075 = !DILocation(line: 334, column: 3, scope: !2054)
!2076 = !DILocation(line: 335, column: 3, scope: !2054)
!2077 = !DILocation(line: 336, column: 3, scope: !2054)
!2078 = !DILocation(line: 337, column: 1, scope: !2054)
!2079 = distinct !DISubprogram(name: "loadData", linkageName: "_Z8loadDataPcRSt6vectorI6recordSaIS1_EERS0_I7latLongSaIS5_EE", scope: !1, file: !1, line: 184, type: !2080, isLocal: false, isDefinition: true, scopeLine: 184, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !2082)
!2080 = !DISubroutineType(types: !2081)
!2081 = !{!45, !44, !596, !394}
!2082 = !{!2083, !2084, !2085, !2086, !2137, !2138, !2139, !2143, !2144, !2147, !2148}
!2083 = !DILocalVariable(name: "filename", arg: 1, scope: !2079, file: !1, line: 184, type: !44)
!2084 = !DILocalVariable(name: "records", arg: 2, scope: !2079, file: !1, line: 184, type: !596)
!2085 = !DILocalVariable(name: "locations", arg: 3, scope: !2079, file: !1, line: 184, type: !394)
!2086 = !DILocalVariable(name: "flist", scope: !2079, file: !1, line: 185, type: !2087)
!2087 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2088, size: 64)
!2088 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !2089, line: 48, baseType: !2090)
!2089 = !DIFile(filename: "/usr/include/stdio.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/nnllvm")
!2090 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !2091, line: 245, size: 1728, elements: !2092, identifier: "_ZTS8_IO_FILE")
!2091 = !DIFile(filename: "/usr/include/libio.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/nnllvm")
!2092 = !{!2093, !2094, !2095, !2096, !2097, !2098, !2099, !2100, !2101, !2102, !2103, !2104, !2105, !2108, !2110, !2111, !2112, !2114, !2116, !2118, !2122, !2125, !2127, !2128, !2129, !2130, !2131, !2132, !2133}
!2093 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !2090, file: !2091, line: 246, baseType: !45, size: 32)
!2094 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !2090, file: !2091, line: 251, baseType: !44, size: 64, offset: 64)
!2095 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !2090, file: !2091, line: 252, baseType: !44, size: 64, offset: 128)
!2096 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !2090, file: !2091, line: 253, baseType: !44, size: 64, offset: 192)
!2097 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !2090, file: !2091, line: 254, baseType: !44, size: 64, offset: 256)
!2098 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !2090, file: !2091, line: 255, baseType: !44, size: 64, offset: 320)
!2099 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !2090, file: !2091, line: 256, baseType: !44, size: 64, offset: 384)
!2100 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !2090, file: !2091, line: 257, baseType: !44, size: 64, offset: 448)
!2101 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !2090, file: !2091, line: 258, baseType: !44, size: 64, offset: 512)
!2102 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !2090, file: !2091, line: 260, baseType: !44, size: 64, offset: 576)
!2103 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !2090, file: !2091, line: 261, baseType: !44, size: 64, offset: 640)
!2104 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !2090, file: !2091, line: 262, baseType: !44, size: 64, offset: 704)
!2105 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !2090, file: !2091, line: 264, baseType: !2106, size: 64, offset: 768)
!2106 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2107, size: 64)
!2107 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !2091, line: 160, flags: DIFlagFwdDecl, identifier: "_ZTS10_IO_marker")
!2108 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !2090, file: !2091, line: 266, baseType: !2109, size: 64, offset: 832)
!2109 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2090, size: 64)
!2110 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !2090, file: !2091, line: 268, baseType: !45, size: 32, offset: 896)
!2111 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !2090, file: !2091, line: 272, baseType: !45, size: 32, offset: 928)
!2112 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !2090, file: !2091, line: 274, baseType: !2113, size: 64, offset: 960)
!2113 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !1325, line: 131, baseType: !552)
!2114 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !2090, file: !2091, line: 278, baseType: !2115, size: 16, offset: 1024)
!2115 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!2116 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !2090, file: !2091, line: 279, baseType: !2117, size: 8, offset: 1040)
!2117 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!2118 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !2090, file: !2091, line: 280, baseType: !2119, size: 8, offset: 1048)
!2119 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 8, elements: !2120)
!2120 = !{!2121}
!2121 = !DISubrange(count: 1)
!2122 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !2090, file: !2091, line: 284, baseType: !2123, size: 64, offset: 1088)
!2123 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2124, size: 64)
!2124 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !2091, line: 154, baseType: null)
!2125 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !2090, file: !2091, line: 293, baseType: !2126, size: 64, offset: 1152)
!2126 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !1325, line: 132, baseType: !552)
!2127 = !DIDerivedType(tag: DW_TAG_member, name: "__pad1", scope: !2090, file: !2091, line: 302, baseType: !42, size: 64, offset: 1216)
!2128 = !DIDerivedType(tag: DW_TAG_member, name: "__pad2", scope: !2090, file: !2091, line: 303, baseType: !42, size: 64, offset: 1280)
!2129 = !DIDerivedType(tag: DW_TAG_member, name: "__pad3", scope: !2090, file: !2091, line: 304, baseType: !42, size: 64, offset: 1344)
!2130 = !DIDerivedType(tag: DW_TAG_member, name: "__pad4", scope: !2090, file: !2091, line: 305, baseType: !42, size: 64, offset: 1408)
!2131 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !2090, file: !2091, line: 306, baseType: !1045, size: 64, offset: 1472)
!2132 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !2090, file: !2091, line: 308, baseType: !45, size: 32, offset: 1536)
!2133 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !2090, file: !2091, line: 310, baseType: !2134, size: 160, offset: 1568)
!2134 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 160, elements: !2135)
!2135 = !{!2136}
!2136 = !DISubrange(count: 20)
!2137 = !DILocalVariable(name: "fp", scope: !2079, file: !1, line: 185, type: !2087)
!2138 = !DILocalVariable(name: "i", scope: !2079, file: !1, line: 186, type: !45)
!2139 = !DILocalVariable(name: "dbname", scope: !2079, file: !1, line: 187, type: !2140)
!2140 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 512, elements: !2141)
!2141 = !{!2142}
!2142 = !DISubrange(count: 64)
!2143 = !DILocalVariable(name: "recNum", scope: !2079, file: !1, line: 188, type: !45)
!2144 = !DILocalVariable(name: "record", scope: !2145, file: !1, line: 210, type: !1731)
!2145 = distinct !DILexicalBlock(scope: !2146, file: !1, line: 209, column: 25)
!2146 = distinct !DILexicalBlock(scope: !2079, file: !1, line: 193, column: 22)
!2147 = !DILocalVariable(name: "latLong", scope: !2145, file: !1, line: 211, type: !1352)
!2148 = !DILocalVariable(name: "substr", scope: !2145, file: !1, line: 217, type: !2149)
!2149 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 48, elements: !2150)
!2150 = !{!2151}
!2151 = !DISubrange(count: 6)
!2152 = !DILocation(line: 184, column: 20, scope: !2079)
!2153 = !DILocation(line: 184, column: 50, scope: !2079)
!2154 = !DILocation(line: 184, column: 80, scope: !2079)
!2155 = !DILocation(line: 186, column: 9, scope: !2079)
!2156 = !DILocation(line: 187, column: 2, scope: !2079)
!2157 = !DILocation(line: 187, column: 7, scope: !2079)
!2158 = !DILocation(line: 188, column: 6, scope: !2079)
!2159 = !DILocation(line: 192, column: 13, scope: !2079)
!2160 = !DILocation(line: 185, column: 13, scope: !2079)
!2161 = !DILocation(line: 193, column: 9, scope: !2162)
!2162 = !DILexicalBlockFile(scope: !2079, file: !1, discriminator: 1)
!2163 = !DILocation(line: 193, column: 8, scope: !2162)
!2164 = !DILocation(line: 193, column: 2, scope: !2162)
!2165 = !DILocation(line: 199, column: 6, scope: !2166)
!2166 = distinct !DILexicalBlock(scope: !2146, file: !1, line: 199, column: 6)
!2167 = !DILocation(line: 199, column: 36, scope: !2166)
!2168 = !DILocation(line: 199, column: 6, scope: !2146)
!2169 = !DILocation(line: 200, column: 21, scope: !2170)
!2170 = distinct !DILexicalBlock(scope: !2166, file: !1, line: 199, column: 42)
!2171 = !DILocation(line: 200, column: 13, scope: !2170)
!2172 = !DILocation(line: 201, column: 13, scope: !2170)
!2173 = !DILocation(line: 203, column: 14, scope: !2146)
!2174 = !DILocation(line: 185, column: 20, scope: !2079)
!2175 = !DILocation(line: 204, column: 13, scope: !2176)
!2176 = distinct !DILexicalBlock(scope: !2146, file: !1, line: 204, column: 12)
!2177 = !DILocation(line: 204, column: 12, scope: !2146)
!2178 = !DILocation(line: 209, column: 16, scope: !2179)
!2179 = !DILexicalBlockFile(scope: !2146, file: !1, discriminator: 1)
!2180 = !DILocation(line: 209, column: 15, scope: !2179)
!2181 = !DILocation(line: 209, column: 9, scope: !2179)
!2182 = !DILocation(line: 210, column: 13, scope: !2145)
!2183 = !DILocation(line: 205, column: 13, scope: !2184)
!2184 = distinct !DILexicalBlock(scope: !2176, file: !1, line: 204, column: 17)
!2185 = !DILocation(line: 206, column: 13, scope: !2184)
!2186 = !DILocation(line: 211, column: 13, scope: !2145)
!2187 = !DILocation(line: 212, column: 13, scope: !2145)
!2188 = !DILocation(line: 213, column: 13, scope: !2145)
!2189 = !DILocation(line: 214, column: 17, scope: !2190)
!2190 = distinct !DILexicalBlock(scope: !2145, file: !1, line: 214, column: 17)
!2191 = !DILocation(line: 214, column: 17, scope: !2145)
!2192 = !DILocation(line: 217, column: 13, scope: !2145)
!2193 = !DILocation(line: 217, column: 18, scope: !2145)
!2194 = !DILocation(line: 219, column: 40, scope: !2195)
!2195 = !DILexicalBlockFile(scope: !2196, file: !1, discriminator: 2)
!2196 = distinct !DILexicalBlock(scope: !2197, file: !1, line: 219, column: 13)
!2197 = distinct !DILexicalBlock(scope: !2145, file: !1, line: 219, column: 13)
!2198 = !DILocation(line: 220, column: 23, scope: !2145)
!2199 = !DILocation(line: 26, column: 1, scope: !1026, inlinedAt: !2200)
!2200 = distinct !DILocation(line: 221, column: 27, scope: !2145)
!2201 = !DILocation(line: 28, column: 10, scope: !1026, inlinedAt: !2200)
!2202 = !DILocation(line: 221, column: 27, scope: !2145)
!2203 = !DILocation(line: 221, column: 25, scope: !2145)
!2204 = !{!2205, !1369, i64 0}
!2205 = !{!"_ZTS7latLong", !1369, i64 0, !1369, i64 4}
!2206 = !DILocation(line: 223, column: 40, scope: !2207)
!2207 = !DILexicalBlockFile(scope: !2208, file: !1, discriminator: 2)
!2208 = distinct !DILexicalBlock(scope: !2209, file: !1, line: 223, column: 13)
!2209 = distinct !DILexicalBlock(scope: !2145, file: !1, line: 223, column: 13)
!2210 = !DILocation(line: 224, column: 23, scope: !2145)
!2211 = !DILocation(line: 26, column: 1, scope: !1026, inlinedAt: !2212)
!2212 = distinct !DILocation(line: 225, column: 27, scope: !2145)
!2213 = !DILocation(line: 28, column: 10, scope: !1026, inlinedAt: !2212)
!2214 = !DILocation(line: 225, column: 27, scope: !2145)
!2215 = !DILocation(line: 225, column: 25, scope: !2145)
!2216 = !{!2205, !1369, i64 4}
!2217 = !DILocation(line: 211, column: 21, scope: !2145)
!2218 = !DILocalVariable(name: "this", arg: 1, scope: !2219, type: !1548, flags: DIFlagArtificial | DIFlagObjectPointer)
!2219 = distinct !DISubprogram(name: "push_back", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE9push_backERKS0_", scope: !366, file: !48, line: 901, type: !473, isLocal: false, isDefinition: true, scopeLine: 902, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !472, variables: !2220)
!2220 = !{!2218, !2221}
!2221 = !DILocalVariable(name: "__x", arg: 2, scope: !2219, file: !48, line: 901, type: !382)
!2222 = !DILocation(line: 0, scope: !2219, inlinedAt: !2223)
!2223 = distinct !DILocation(line: 227, column: 23, scope: !2145)
!2224 = !DILocation(line: 901, column: 35, scope: !2219, inlinedAt: !2223)
!2225 = !DILocation(line: 903, column: 20, scope: !2226, inlinedAt: !2223)
!2226 = distinct !DILexicalBlock(scope: !2219, file: !48, line: 903, column: 6)
!2227 = !{!1657, !1362, i64 8}
!2228 = !DILocation(line: 903, column: 47, scope: !2226, inlinedAt: !2223)
!2229 = !{!1657, !1362, i64 16}
!2230 = !DILocation(line: 903, column: 30, scope: !2226, inlinedAt: !2223)
!2231 = !DILocation(line: 903, column: 6, scope: !2219, inlinedAt: !2223)
!2232 = !DILocalVariable(name: "__p", arg: 2, scope: !2233, file: !58, line: 215, type: !220)
!2233 = distinct !DISubprogram(name: "construct<latLong>", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE9constructIS1_EEvRS2_PS1_RKT_", scope: !221, file: !58, line: 215, type: !2234, isLocal: false, isDefinition: true, scopeLine: 216, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !273, declaration: !2236, variables: !2237)
!2234 = !DISubroutineType(types: !2235)
!2235 = !{null, !226, !220, !257}
!2236 = !DISubprogram(name: "construct<latLong>", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI7latLongEE9constructIS1_EEvRS2_PS1_RKT_", scope: !221, file: !58, line: 215, type: !2234, isLocal: false, isDefinition: false, scopeLine: 215, flags: DIFlagPrototyped, isOptimized: true, templateParams: !273)
!2237 = !{!2238, !2232, !2239}
!2238 = !DILocalVariable(name: "__a", arg: 1, scope: !2233, file: !58, line: 215, type: !226)
!2239 = !DILocalVariable(name: "__arg", arg: 3, scope: !2233, file: !58, line: 215, type: !257)
!2240 = !DILocation(line: 215, column: 50, scope: !2233, inlinedAt: !2241)
!2241 = distinct !DILocation(line: 905, column: 6, scope: !2242, inlinedAt: !2223)
!2242 = distinct !DILexicalBlock(scope: !2226, file: !48, line: 904, column: 4)
!2243 = !DILocation(line: 215, column: 66, scope: !2233, inlinedAt: !2241)
!2244 = !DILocalVariable(name: "__p", arg: 2, scope: !2245, file: !71, line: 129, type: !245)
!2245 = distinct !DISubprogram(name: "construct", linkageName: "_ZN9__gnu_cxx13new_allocatorI7latLongE9constructEPS1_RKS1_", scope: !230, file: !71, line: 129, type: !268, isLocal: false, isDefinition: true, scopeLine: 130, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !267, variables: !2246)
!2246 = !{!2247, !2244, !2248}
!2247 = !DILocalVariable(name: "this", arg: 1, scope: !2245, type: !1875, flags: DIFlagArtificial | DIFlagObjectPointer)
!2248 = !DILocalVariable(name: "__val", arg: 3, scope: !2245, file: !71, line: 129, type: !257)
!2249 = !DILocation(line: 129, column: 25, scope: !2245, inlinedAt: !2250)
!2250 = distinct !DILocation(line: 216, column: 13, scope: !2233, inlinedAt: !2241)
!2251 = !DILocation(line: 129, column: 41, scope: !2245, inlinedAt: !2250)
!2252 = !DILocation(line: 130, column: 28, scope: !2245, inlinedAt: !2250)
!2253 = !DILocation(line: 907, column: 6, scope: !2242, inlinedAt: !2223)
!2254 = !DILocation(line: 908, column: 4, scope: !2242, inlinedAt: !2223)
!2255 = !DILocation(line: 913, column: 4, scope: !2256, inlinedAt: !2223)
!2256 = !DILexicalBlockFile(scope: !2226, file: !48, discriminator: 1)
!2257 = !DILocation(line: 210, column: 20, scope: !2145)
!2258 = !DILocalVariable(name: "this", arg: 1, scope: !2259, type: !1530, flags: DIFlagArtificial | DIFlagObjectPointer)
!2259 = distinct !DISubprogram(name: "push_back", linkageName: "_ZNSt6vectorI6recordSaIS0_EE9push_backERKS0_", scope: !568, file: !48, line: 901, type: !673, isLocal: false, isDefinition: true, scopeLine: 902, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !672, variables: !2260)
!2260 = !{!2258, !2261}
!2261 = !DILocalVariable(name: "__x", arg: 2, scope: !2259, file: !48, line: 901, type: !584)
!2262 = !DILocation(line: 0, scope: !2259, inlinedAt: !2263)
!2263 = distinct !DILocation(line: 228, column: 21, scope: !2145)
!2264 = !DILocation(line: 901, column: 35, scope: !2259, inlinedAt: !2263)
!2265 = !DILocation(line: 903, column: 20, scope: !2266, inlinedAt: !2263)
!2266 = distinct !DILexicalBlock(scope: !2259, file: !48, line: 903, column: 6)
!2267 = !{!1746, !1362, i64 8}
!2268 = !DILocation(line: 903, column: 47, scope: !2266, inlinedAt: !2263)
!2269 = !{!1746, !1362, i64 16}
!2270 = !DILocation(line: 903, column: 30, scope: !2266, inlinedAt: !2263)
!2271 = !DILocation(line: 903, column: 6, scope: !2259, inlinedAt: !2263)
!2272 = !DILocalVariable(name: "__p", arg: 2, scope: !2273, file: !58, line: 215, type: !57)
!2273 = distinct !DISubprogram(name: "construct<record>", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE9constructIS1_EEvRS2_PS1_RKT_", scope: !59, file: !58, line: 215, type: !2274, isLocal: false, isDefinition: true, scopeLine: 216, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !120, declaration: !2276, variables: !2277)
!2274 = !DISubroutineType(types: !2275)
!2275 = !{null, !65, !57, !98}
!2276 = !DISubprogram(name: "construct<record>", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaI6recordEE9constructIS1_EEvRS2_PS1_RKT_", scope: !59, file: !58, line: 215, type: !2274, isLocal: false, isDefinition: false, scopeLine: 215, flags: DIFlagPrototyped, isOptimized: true, templateParams: !120)
!2277 = !{!2278, !2272, !2279}
!2278 = !DILocalVariable(name: "__a", arg: 1, scope: !2273, file: !58, line: 215, type: !65)
!2279 = !DILocalVariable(name: "__arg", arg: 3, scope: !2273, file: !58, line: 215, type: !98)
!2280 = !DILocation(line: 215, column: 50, scope: !2273, inlinedAt: !2281)
!2281 = distinct !DILocation(line: 905, column: 6, scope: !2282, inlinedAt: !2263)
!2282 = distinct !DILexicalBlock(scope: !2266, file: !48, line: 904, column: 4)
!2283 = !DILocation(line: 215, column: 66, scope: !2273, inlinedAt: !2281)
!2284 = !DILocalVariable(name: "__p", arg: 2, scope: !2285, file: !71, line: 129, type: !86)
!2285 = distinct !DISubprogram(name: "construct", linkageName: "_ZN9__gnu_cxx13new_allocatorI6recordE9constructEPS1_RKS1_", scope: !70, file: !71, line: 129, type: !115, isLocal: false, isDefinition: true, scopeLine: 130, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !114, variables: !2286)
!2286 = !{!2287, !2284, !2288}
!2287 = !DILocalVariable(name: "this", arg: 1, scope: !2285, type: !1910, flags: DIFlagArtificial | DIFlagObjectPointer)
!2288 = !DILocalVariable(name: "__val", arg: 3, scope: !2285, file: !71, line: 129, type: !98)
!2289 = !DILocation(line: 129, column: 25, scope: !2285, inlinedAt: !2290)
!2290 = distinct !DILocation(line: 216, column: 13, scope: !2273, inlinedAt: !2281)
!2291 = !DILocation(line: 129, column: 41, scope: !2285, inlinedAt: !2290)
!2292 = !DILocation(line: 130, column: 23, scope: !2285, inlinedAt: !2290)
!2293 = !DILocation(line: 130, column: 28, scope: !2285, inlinedAt: !2290)
!2294 = !DILocation(line: 907, column: 6, scope: !2282, inlinedAt: !2263)
!2295 = !DILocation(line: 908, column: 4, scope: !2282, inlinedAt: !2263)
!2296 = !DILocation(line: 913, column: 4, scope: !2297, inlinedAt: !2263)
!2297 = !DILexicalBlockFile(scope: !2266, file: !48, discriminator: 1)
!2298 = !DILocation(line: 229, column: 19, scope: !2145)
!2299 = !DILocation(line: 230, column: 9, scope: !2146)
!2300 = !DILocation(line: 231, column: 9, scope: !2146)
!2301 = distinct !{!2301, !2302, !2303}
!2302 = !DILocation(line: 193, column: 2, scope: !2079)
!2303 = !DILocation(line: 232, column: 5, scope: !2079)
!2304 = !DILocation(line: 233, column: 5, scope: !2079)
!2305 = !DILocation(line: 236, column: 1, scope: !2079)
!2306 = !DILocation(line: 235, column: 5, scope: !2079)
!2307 = !DILocation(line: 238, column: 38, scope: !1718)
!2308 = !DILocation(line: 238, column: 53, scope: !1718)
!2309 = !DILocation(line: 238, column: 67, scope: !1718)
!2310 = !DILocation(line: 238, column: 82, scope: !1718)
!2311 = !DILocation(line: 239, column: 7, scope: !1718)
!2312 = !DILocation(line: 245, column: 12, scope: !1740)
!2313 = !DILocation(line: 245, column: 3, scope: !1744)
!2314 = !DILocation(line: 239, column: 9, scope: !1718)
!2315 = !DILocation(line: 241, column: 7, scope: !1718)
!2316 = !DILocation(line: 247, column: 14, scope: !1751)
!2317 = !DILocation(line: 247, column: 5, scope: !1756)
!2318 = !DILocation(line: 248, column: 13, scope: !1758)
!2319 = !DILocation(line: 240, column: 9, scope: !1718)
!2320 = !DILocation(line: 249, column: 17, scope: !1761)
!2321 = !DILocation(line: 249, column: 15, scope: !1761)
!2322 = !DILocation(line: 249, column: 11, scope: !1758)
!2323 = !DILocation(line: 247, column: 27, scope: !1765)
!2324 = distinct !{!2324, !1767}
!2325 = !DILocation(line: 0, scope: !1772, inlinedAt: !2326)
!2326 = distinct !DILocation(line: 252, column: 16, scope: !1754)
!2327 = !DILocation(line: 770, column: 28, scope: !1772, inlinedAt: !2326)
!2328 = !DILocation(line: 771, column: 32, scope: !1772, inlinedAt: !2326)
!2329 = !DILocation(line: 253, column: 26, scope: !1754)
!2330 = !DILocation(line: 0, scope: !1772, inlinedAt: !2331)
!2331 = distinct !DILocation(line: 253, column: 18, scope: !1754)
!2332 = !DILocation(line: 770, column: 28, scope: !1772, inlinedAt: !2331)
!2333 = !DILocation(line: 0, scope: !1772, inlinedAt: !2334)
!2334 = distinct !DILocation(line: 253, column: 5, scope: !1784)
!2335 = !DILocation(line: 770, column: 28, scope: !1772, inlinedAt: !2334)
!2336 = !DILocation(line: 253, column: 16, scope: !1754)
!2337 = !DILocation(line: 0, scope: !1772, inlinedAt: !2338)
!2338 = distinct !DILocation(line: 254, column: 5, scope: !1754)
!2339 = !DILocation(line: 770, column: 28, scope: !1772, inlinedAt: !2338)
!2340 = !DILocation(line: 771, column: 32, scope: !1772, inlinedAt: !2338)
!2341 = !DILocation(line: 254, column: 21, scope: !1754)
!2342 = !DILocation(line: 256, column: 16, scope: !1754)
!2343 = !DILocation(line: 257, column: 20, scope: !1754)
!2344 = !DILocation(line: 257, column: 18, scope: !1754)
!2345 = !DILocation(line: 258, column: 23, scope: !1754)
!2346 = !DILocation(line: 261, column: 27, scope: !1754)
!2347 = !DILocation(line: 0, scope: !1772, inlinedAt: !2348)
!2348 = distinct !DILocation(line: 261, column: 5, scope: !1754)
!2349 = !DILocation(line: 770, column: 28, scope: !1772, inlinedAt: !2348)
!2350 = !DILocation(line: 771, column: 32, scope: !1772, inlinedAt: !2348)
!2351 = !DILocation(line: 261, column: 16, scope: !1754)
!2352 = !DILocation(line: 261, column: 25, scope: !1754)
!2353 = !DILocation(line: 245, column: 19, scope: !1805)
!2354 = !DILocation(line: 263, column: 1, scope: !1718)
!2355 = distinct !DISubprogram(name: "_M_insert_aux", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_", scope: !366, file: !2356, line: 319, type: !496, isLocal: false, isDefinition: true, scopeLine: 321, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !495, variables: !2357)
!2356 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/bits/vector.tcc", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/nnllvm")
!2357 = !{!2358, !2359, !2360, !2361, !2364, !2367, !2368, !2369}
!2358 = !DILocalVariable(name: "this", arg: 1, scope: !2355, type: !1548, flags: DIFlagArtificial | DIFlagObjectPointer)
!2359 = !DILocalVariable(name: "__position", arg: 2, scope: !2355, file: !48, line: 1323, type: !365)
!2360 = !DILocalVariable(name: "__x", arg: 3, scope: !2355, file: !48, line: 1323, type: !382)
!2361 = !DILocalVariable(name: "__x_copy", scope: !2362, file: !2356, line: 329, type: !19)
!2362 = distinct !DILexicalBlock(scope: !2363, file: !2356, line: 323, column: 2)
!2363 = distinct !DILexicalBlock(scope: !2355, file: !2356, line: 322, column: 11)
!2364 = !DILocalVariable(name: "__len", scope: !2365, file: !2356, line: 342, type: !2366)
!2365 = distinct !DILexicalBlock(scope: !2363, file: !2356, line: 341, column: 2)
!2366 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !363)
!2367 = !DILocalVariable(name: "__elems_before", scope: !2365, file: !2356, line: 344, type: !2366)
!2368 = !DILocalVariable(name: "__new_start", scope: !2365, file: !2356, line: 345, type: !465)
!2369 = !DILocalVariable(name: "__new_finish", scope: !2365, file: !2356, line: 346, type: !465)
!2370 = !DILocation(line: 0, scope: !2355)
!2371 = !DILocation(line: 1323, column: 60, scope: !2355)
!2372 = !DILocation(line: 322, column: 25, scope: !2363)
!2373 = !DILocation(line: 322, column: 52, scope: !2363)
!2374 = !DILocation(line: 322, column: 35, scope: !2363)
!2375 = !DILocation(line: 322, column: 11, scope: !2355)
!2376 = !DILocation(line: 325, column: 15, scope: !2362)
!2377 = !DILocation(line: 215, column: 50, scope: !2233, inlinedAt: !2378)
!2378 = distinct !DILocation(line: 324, column: 4, scope: !2362)
!2379 = !DILocation(line: 215, column: 66, scope: !2233, inlinedAt: !2378)
!2380 = !DILocation(line: 129, column: 25, scope: !2245, inlinedAt: !2381)
!2381 = distinct !DILocation(line: 216, column: 13, scope: !2233, inlinedAt: !2378)
!2382 = !DILocation(line: 129, column: 41, scope: !2245, inlinedAt: !2381)
!2383 = !DILocation(line: 130, column: 28, scope: !2245, inlinedAt: !2381)
!2384 = !DILocation(line: 327, column: 4, scope: !2362)
!2385 = !DILocation(line: 329, column: 19, scope: !2362)
!2386 = !DILocation(line: 1323, column: 30, scope: !2355)
!2387 = !DILocation(line: 331, column: 4, scope: !2362)
!2388 = !DILocalVariable(name: "__first", arg: 1, scope: !2389, file: !2390, line: 619, type: !246)
!2389 = distinct !DISubprogram(name: "copy_backward<latLong *, latLong *>", linkageName: "_ZSt13copy_backwardIP7latLongS1_ET0_T_S3_S2_", scope: !14, file: !2390, line: 619, type: !2391, isLocal: false, isDefinition: true, scopeLine: 620, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !2393, variables: !2396)
!2390 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/bits/stl_algobase.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/nnllvm")
!2391 = !DISubroutineType(types: !2392)
!2392 = !{!246, !246, !246, !246}
!2393 = !{!2394, !2395}
!2394 = !DITemplateTypeParameter(name: "_BI1", type: !246)
!2395 = !DITemplateTypeParameter(name: "_BI2", type: !246)
!2396 = !{!2388, !2397, !2398}
!2397 = !DILocalVariable(name: "__last", arg: 2, scope: !2389, file: !2390, line: 619, type: !246)
!2398 = !DILocalVariable(name: "__result", arg: 3, scope: !2389, file: !2390, line: 619, type: !246)
!2399 = !DILocation(line: 619, column: 24, scope: !2389, inlinedAt: !2400)
!2400 = distinct !DILocation(line: 331, column: 4, scope: !2401)
!2401 = !DILexicalBlockFile(scope: !2362, file: !2356, discriminator: 1)
!2402 = !DILocation(line: 619, column: 38, scope: !2389, inlinedAt: !2400)
!2403 = !DILocation(line: 619, column: 51, scope: !2389, inlinedAt: !2400)
!2404 = !DILocalVariable(name: "__first", arg: 1, scope: !2405, file: !2390, line: 592, type: !246)
!2405 = distinct !DISubprogram(name: "__copy_move_backward_a2<false, latLong *, latLong *>", linkageName: "_ZSt23__copy_move_backward_a2ILb0EP7latLongS1_ET1_T0_S3_S2_", scope: !14, file: !2390, line: 592, type: !2391, isLocal: false, isDefinition: true, scopeLine: 593, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !2406, variables: !2408)
!2406 = !{!2407, !2394, !2395}
!2407 = !DITemplateValueParameter(name: "_IsMove", type: !433, value: i8 0)
!2408 = !{!2404, !2409, !2410}
!2409 = !DILocalVariable(name: "__last", arg: 2, scope: !2405, file: !2390, line: 592, type: !246)
!2410 = !DILocalVariable(name: "__result", arg: 3, scope: !2405, file: !2390, line: 592, type: !246)
!2411 = !DILocation(line: 592, column: 34, scope: !2405, inlinedAt: !2412)
!2412 = distinct !DILocation(line: 629, column: 15, scope: !2389, inlinedAt: !2400)
!2413 = !DILocation(line: 592, column: 48, scope: !2405, inlinedAt: !2412)
!2414 = !DILocation(line: 592, column: 61, scope: !2405, inlinedAt: !2412)
!2415 = !DILocalVariable(name: "__first", arg: 1, scope: !2416, file: !2390, line: 574, type: !246)
!2416 = distinct !DISubprogram(name: "__copy_move_backward_a<false, latLong *, latLong *>", linkageName: "_ZSt22__copy_move_backward_aILb0EP7latLongS1_ET1_T0_S3_S2_", scope: !14, file: !2390, line: 574, type: !2391, isLocal: false, isDefinition: true, scopeLine: 575, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !2406, variables: !2417)
!2417 = !{!2415, !2418, !2419, !2420}
!2418 = !DILocalVariable(name: "__last", arg: 2, scope: !2416, file: !2390, line: 574, type: !246)
!2419 = !DILocalVariable(name: "__result", arg: 3, scope: !2416, file: !2390, line: 574, type: !246)
!2420 = !DILocalVariable(name: "__simple", scope: !2416, file: !2390, line: 579, type: !2421)
!2421 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !433)
!2422 = !DILocation(line: 574, column: 33, scope: !2416, inlinedAt: !2423)
!2423 = distinct !DILocation(line: 594, column: 19, scope: !2405, inlinedAt: !2412)
!2424 = !DILocation(line: 574, column: 47, scope: !2416, inlinedAt: !2423)
!2425 = !DILocation(line: 574, column: 60, scope: !2416, inlinedAt: !2423)
!2426 = !DILocation(line: 579, column: 18, scope: !2416, inlinedAt: !2423)
!2427 = !DILocalVariable(name: "__first", arg: 1, scope: !2428, file: !2390, line: 563, type: !254)
!2428 = distinct !DISubprogram(name: "__copy_move_b<latLong>", linkageName: "_ZNSt20__copy_move_backwardILb0ELb1ESt26random_access_iterator_tagE13__copy_move_bI7latLongEEPT_PKS4_S7_S5_", scope: !2429, file: !2390, line: 563, type: !2444, isLocal: false, isDefinition: true, scopeLine: 564, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !273, declaration: !2446, variables: !2447)
!2429 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__copy_move_backward<false, true, std::random_access_iterator_tag>", scope: !14, file: !2390, line: 559, size: 8, elements: !16, templateParams: !2430, identifier: "_ZTSSt20__copy_move_backwardILb0ELb1ESt26random_access_iterator_tagE")
!2430 = !{!2431, !2432, !2433}
!2431 = !DITemplateValueParameter(type: !433, value: i8 0)
!2432 = !DITemplateValueParameter(type: !433, value: i8 1)
!2433 = !DITemplateTypeParameter(type: !2434)
!2434 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "random_access_iterator_tag", scope: !14, file: !524, line: 103, size: 8, elements: !2435, identifier: "_ZTSSt26random_access_iterator_tag")
!2435 = !{!2436}
!2436 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !2434, baseType: !2437)
!2437 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bidirectional_iterator_tag", scope: !14, file: !524, line: 99, size: 8, elements: !2438, identifier: "_ZTSSt26bidirectional_iterator_tag")
!2438 = !{!2439}
!2439 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !2437, baseType: !2440)
!2440 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "forward_iterator_tag", scope: !14, file: !524, line: 95, size: 8, elements: !2441, identifier: "_ZTSSt20forward_iterator_tag")
!2441 = !{!2442}
!2442 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !2440, baseType: !2443)
!2443 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "input_iterator_tag", scope: !14, file: !524, line: 89, size: 8, elements: !16, identifier: "_ZTSSt18input_iterator_tag")
!2444 = !DISubroutineType(types: !2445)
!2445 = !{!246, !254, !254, !246}
!2446 = !DISubprogram(name: "__copy_move_b<latLong>", linkageName: "_ZNSt20__copy_move_backwardILb0ELb1ESt26random_access_iterator_tagE13__copy_move_bI7latLongEEPT_PKS4_S7_S5_", scope: !2429, file: !2390, line: 563, type: !2444, isLocal: false, isDefinition: false, scopeLine: 563, flags: DIFlagPrototyped, isOptimized: true, templateParams: !273)
!2447 = !{!2427, !2448, !2449, !2450}
!2448 = !DILocalVariable(name: "__last", arg: 2, scope: !2428, file: !2390, line: 563, type: !254)
!2449 = !DILocalVariable(name: "__result", arg: 3, scope: !2428, file: !2390, line: 563, type: !246)
!2450 = !DILocalVariable(name: "_Num", scope: !2428, file: !2390, line: 565, type: !2451)
!2451 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !551)
!2452 = !DILocation(line: 563, column: 34, scope: !2428, inlinedAt: !2453)
!2453 = distinct !DILocation(line: 584, column: 14, scope: !2416, inlinedAt: !2423)
!2454 = !DILocation(line: 563, column: 54, scope: !2428, inlinedAt: !2453)
!2455 = !DILocation(line: 563, column: 67, scope: !2428, inlinedAt: !2453)
!2456 = !DILocation(line: 565, column: 34, scope: !2428, inlinedAt: !2453)
!2457 = !DILocation(line: 565, column: 20, scope: !2428, inlinedAt: !2453)
!2458 = !DILocation(line: 566, column: 8, scope: !2459, inlinedAt: !2453)
!2459 = distinct !DILexicalBlock(scope: !2428, file: !2390, line: 566, column: 8)
!2460 = !DILocation(line: 566, column: 8, scope: !2428, inlinedAt: !2453)
!2461 = !DILocation(line: 567, column: 33, scope: !2459, inlinedAt: !2453)
!2462 = !DILocation(line: 567, column: 6, scope: !2459, inlinedAt: !2453)
!2463 = !DILocation(line: 335, column: 16, scope: !2362)
!2464 = !DILocation(line: 339, column: 2, scope: !2362)
!2465 = !DILocalVariable(name: "this", arg: 1, scope: !2466, type: !2471, flags: DIFlagArtificial | DIFlagObjectPointer)
!2466 = distinct !DISubprogram(name: "_M_check_len", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE12_M_check_lenEmPKc", scope: !366, file: !48, line: 1336, type: !499, isLocal: false, isDefinition: true, scopeLine: 1337, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !498, variables: !2467)
!2467 = !{!2465, !2468, !2469, !2470}
!2468 = !DILocalVariable(name: "__n", arg: 2, scope: !2466, file: !48, line: 1336, type: !363)
!2469 = !DILocalVariable(name: "__s", arg: 3, scope: !2466, file: !48, line: 1336, type: !502)
!2470 = !DILocalVariable(name: "__len", scope: !2466, file: !48, line: 1341, type: !2366)
!2471 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !389, size: 64)
!2472 = !DILocation(line: 0, scope: !2466, inlinedAt: !2473)
!2473 = distinct !DILocation(line: 343, column: 6, scope: !2365)
!2474 = !DILocation(line: 1336, column: 30, scope: !2466, inlinedAt: !2473)
!2475 = !DILocalVariable(name: "this", arg: 1, scope: !2476, type: !2471, flags: DIFlagArtificial | DIFlagObjectPointer)
!2476 = distinct !DISubprogram(name: "size", linkageName: "_ZNKSt6vectorI7latLongSaIS0_EE4sizeEv", scope: !366, file: !48, line: 645, type: !423, isLocal: false, isDefinition: true, scopeLine: 646, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !422, variables: !2477)
!2477 = !{!2475}
!2478 = !DILocation(line: 0, scope: !2476, inlinedAt: !2479)
!2479 = distinct !DILocation(line: 1338, column: 19, scope: !2480, inlinedAt: !2473)
!2480 = !DILexicalBlockFile(scope: !2481, file: !48, discriminator: 1)
!2481 = distinct !DILexicalBlock(scope: !2466, file: !48, line: 1338, column: 6)
!2482 = !DILocation(line: 646, column: 40, scope: !2476, inlinedAt: !2479)
!2483 = !DILocation(line: 646, column: 66, scope: !2476, inlinedAt: !2479)
!2484 = !DILocation(line: 646, column: 50, scope: !2476, inlinedAt: !2479)
!2485 = !DILocation(line: 0, scope: !2476, inlinedAt: !2486)
!2486 = distinct !DILocation(line: 1341, column: 26, scope: !2466, inlinedAt: !2473)
!2487 = !DILocation(line: 0, scope: !2476, inlinedAt: !2488)
!2488 = distinct !DILocation(line: 1341, column: 44, scope: !2489, inlinedAt: !2473)
!2489 = !DILexicalBlockFile(scope: !2466, file: !48, discriminator: 1)
!2490 = !DILocation(line: 221, column: 15, scope: !2491, inlinedAt: !2502)
!2491 = distinct !DILexicalBlock(scope: !2492, file: !2390, line: 221, column: 11)
!2492 = distinct !DISubprogram(name: "max<unsigned long>", linkageName: "_ZSt3maxImERKT_S2_S2_", scope: !14, file: !2390, line: 216, type: !2493, isLocal: false, isDefinition: true, scopeLine: 217, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !2497, variables: !2499)
!2493 = !DISubroutineType(types: !2494)
!2494 = !{!2495, !2495, !2495}
!2495 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2496, size: 64)
!2496 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !105)
!2497 = !{!2498}
!2498 = !DITemplateTypeParameter(name: "_Tp", type: !105)
!2499 = !{!2500, !2501}
!2500 = !DILocalVariable(name: "__a", arg: 1, scope: !2492, file: !2390, line: 216, type: !2495)
!2501 = !DILocalVariable(name: "__b", arg: 2, scope: !2492, file: !2390, line: 216, type: !2495)
!2502 = distinct !DILocation(line: 1341, column: 35, scope: !2503, inlinedAt: !2473)
!2503 = !DILexicalBlockFile(scope: !2466, file: !48, discriminator: 2)
!2504 = !DILocation(line: 1341, column: 35, scope: !2466, inlinedAt: !2473)
!2505 = !DILocation(line: 1341, column: 33, scope: !2466, inlinedAt: !2473)
!2506 = !DILocation(line: 1341, column: 18, scope: !2466, inlinedAt: !2473)
!2507 = !DILocation(line: 0, scope: !2476, inlinedAt: !2508)
!2508 = distinct !DILocation(line: 1342, column: 18, scope: !2466, inlinedAt: !2473)
!2509 = !DILocation(line: 1342, column: 16, scope: !2466, inlinedAt: !2473)
!2510 = !DILocation(line: 1342, column: 34, scope: !2489, inlinedAt: !2473)
!2511 = !DILocation(line: 1342, column: 25, scope: !2466, inlinedAt: !2473)
!2512 = !DILocation(line: 342, column: 20, scope: !2365)
!2513 = !DILocalVariable(name: "this", arg: 1, scope: !2514, type: !1548, flags: DIFlagArtificial | DIFlagObjectPointer)
!2514 = distinct !DISubprogram(name: "begin", linkageName: "_ZNSt6vectorI7latLongSaIS0_EE5beginEv", scope: !366, file: !48, line: 538, type: !399, isLocal: false, isDefinition: true, scopeLine: 539, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !398, variables: !2515)
!2515 = !{!2513}
!2516 = !DILocation(line: 0, scope: !2514, inlinedAt: !2517)
!2517 = distinct !DILocation(line: 344, column: 50, scope: !2365)
!2518 = !DILocalVariable(name: "this", arg: 1, scope: !2519, type: !2522, flags: DIFlagArtificial | DIFlagObjectPointer)
!2519 = distinct !DISubprogram(name: "__normal_iterator", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIP7latLongSt6vectorIS1_SaIS1_EEEC2ERKS2_", scope: !507, file: !406, line: 726, type: !515, isLocal: false, isDefinition: true, scopeLine: 726, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !514, variables: !2520)
!2520 = !{!2518, !2521}
!2521 = !DILocalVariable(name: "__i", arg: 2, scope: !2519, file: !406, line: 726, type: !517)
!2522 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !507, size: 64)
!2523 = !DILocation(line: 0, scope: !2519, inlinedAt: !2524)
!2524 = distinct !DILocation(line: 539, column: 16, scope: !2514, inlinedAt: !2517)
!2525 = !DILocation(line: 726, column: 60, scope: !2519, inlinedAt: !2524)
!2526 = !DILocalVariable(name: "__lhs", arg: 1, scope: !2527, file: !406, line: 896, type: !2530)
!2527 = distinct !DISubprogram(name: "operator-<latLong *, std::vector<latLong, std::allocator<latLong> > >", linkageName: "_ZN9__gnu_cxxmiIP7latLongSt6vectorIS1_SaIS1_EEEENS_17__normal_iteratorIT_T0_E15difference_typeERKS9_SC_", scope: !60, file: !406, line: 896, type: !2528, isLocal: false, isDefinition: true, scopeLine: 898, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !564, variables: !2531)
!2528 = !DISubroutineType(types: !2529)
!2529 = !{!549, !2530, !2530}
!2530 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !529, size: 64)
!2531 = !{!2526, !2532}
!2532 = !DILocalVariable(name: "__rhs", arg: 2, scope: !2527, file: !406, line: 897, type: !2530)
!2533 = !DILocation(line: 896, column: 63, scope: !2527, inlinedAt: !2534)
!2534 = distinct !DILocation(line: 344, column: 48, scope: !2535)
!2535 = !DILexicalBlockFile(scope: !2365, file: !2356, discriminator: 1)
!2536 = !DILocation(line: 897, column: 56, scope: !2527, inlinedAt: !2534)
!2537 = !DILocation(line: 898, column: 27, scope: !2527, inlinedAt: !2534)
!2538 = !DILocation(line: 344, column: 20, scope: !2365)
!2539 = !DILocalVariable(name: "__n", arg: 2, scope: !2540, file: !48, line: 167, type: !103)
!2540 = distinct !DISubprogram(name: "_M_allocate", linkageName: "_ZNSt12_Vector_baseI7latLongSaIS0_EE11_M_allocateEm", scope: !212, file: !48, line: 167, type: !350, isLocal: false, isDefinition: true, scopeLine: 168, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !349, variables: !2541)
!2541 = !{!2542, !2539}
!2542 = !DILocalVariable(name: "this", arg: 1, scope: !2540, type: !1560, flags: DIFlagArtificial | DIFlagObjectPointer)
!2543 = !DILocation(line: 167, column: 26, scope: !2540, inlinedAt: !2544)
!2544 = distinct !DILocation(line: 345, column: 30, scope: !2365)
!2545 = !DILocation(line: 168, column: 20, scope: !2540, inlinedAt: !2544)
!2546 = !DILocation(line: 168, column: 16, scope: !2540, inlinedAt: !2544)
!2547 = !DILocalVariable(name: "__n", arg: 2, scope: !2548, file: !71, line: 99, type: !102)
!2548 = distinct !DISubprogram(name: "allocate", linkageName: "_ZN9__gnu_cxx13new_allocatorI7latLongE8allocateEmPKv", scope: !230, file: !71, line: 99, type: !259, isLocal: false, isDefinition: true, scopeLine: 100, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !258, variables: !2549)
!2549 = !{!2550, !2547, !2551}
!2550 = !DILocalVariable(name: "this", arg: 1, scope: !2548, type: !1875, flags: DIFlagArtificial | DIFlagObjectPointer)
!2551 = !DILocalVariable(arg: 3, scope: !2548, file: !71, line: 99, type: !106)
!2552 = !DILocation(line: 99, column: 26, scope: !2548, inlinedAt: !2553)
!2553 = distinct !DILocation(line: 168, column: 35, scope: !2554, inlinedAt: !2544)
!2554 = !DILexicalBlockFile(scope: !2540, file: !48, discriminator: 1)
!2555 = !DILocation(line: 99, column: 43, scope: !2548, inlinedAt: !2553)
!2556 = !DILocation(line: 101, column: 10, scope: !2557, inlinedAt: !2553)
!2557 = distinct !DILexicalBlock(scope: !2548, file: !71, line: 101, column: 6)
!2558 = !DILocation(line: 101, column: 6, scope: !2548, inlinedAt: !2553)
!2559 = !DILocation(line: 102, column: 4, scope: !2557, inlinedAt: !2553)
!2560 = !DILocation(line: 104, column: 46, scope: !2548, inlinedAt: !2553)
!2561 = !DILocation(line: 104, column: 27, scope: !2548, inlinedAt: !2553)
!2562 = !DILocation(line: 104, column: 9, scope: !2548, inlinedAt: !2553)
!2563 = !DILocation(line: 168, column: 16, scope: !2554, inlinedAt: !2544)
!2564 = !DILocation(line: 168, column: 16, scope: !2565, inlinedAt: !2544)
!2565 = !DILexicalBlockFile(scope: !2540, file: !48, discriminator: 3)
!2566 = !DILocation(line: 345, column: 12, scope: !2365)
!2567 = !DILocation(line: 346, column: 12, scope: !2365)
!2568 = !DILocation(line: 354, column: 38, scope: !2569)
!2569 = distinct !DILexicalBlock(scope: !2365, file: !2356, line: 348, column: 6)
!2570 = !DILocation(line: 215, column: 50, scope: !2233, inlinedAt: !2571)
!2571 = distinct !DILocation(line: 353, column: 8, scope: !2569)
!2572 = !DILocation(line: 215, column: 66, scope: !2233, inlinedAt: !2571)
!2573 = !DILocation(line: 129, column: 25, scope: !2245, inlinedAt: !2574)
!2574 = distinct !DILocation(line: 216, column: 13, scope: !2233, inlinedAt: !2571)
!2575 = !DILocation(line: 129, column: 41, scope: !2245, inlinedAt: !2574)
!2576 = !DILocation(line: 130, column: 28, scope: !2245, inlinedAt: !2574)
!2577 = !DILocalVariable(name: "__first", arg: 1, scope: !2578, file: !2579, line: 274, type: !246)
!2578 = distinct !DISubprogram(name: "__uninitialized_move_if_noexcept_a<latLong *, latLong *, std::allocator<latLong> >", linkageName: "_ZSt34__uninitialized_move_if_noexcept_aIP7latLongS1_SaIS0_EET0_T_S4_S3_RT1_", scope: !14, file: !2579, line: 274, type: !2580, isLocal: false, isDefinition: true, scopeLine: 278, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !2582, variables: !2586)
!2579 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/bits/stl_uninitialized.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/nnllvm")
!2580 = !DISubroutineType(types: !2581)
!2581 = !{!246, !246, !246, !246, !226}
!2582 = !{!2583, !2584, !2585}
!2583 = !DITemplateTypeParameter(name: "_InputIterator", type: !246)
!2584 = !DITemplateTypeParameter(name: "_ForwardIterator", type: !246)
!2585 = !DITemplateTypeParameter(name: "_Allocator", type: !227)
!2586 = !{!2577, !2587, !2588, !2589}
!2587 = !DILocalVariable(name: "__last", arg: 2, scope: !2578, file: !2579, line: 275, type: !246)
!2588 = !DILocalVariable(name: "__result", arg: 3, scope: !2578, file: !2579, line: 276, type: !246)
!2589 = !DILocalVariable(name: "__alloc", arg: 4, scope: !2578, file: !2579, line: 277, type: !226)
!2590 = !DILocation(line: 274, column: 55, scope: !2578, inlinedAt: !2591)
!2591 = distinct !DILocation(line: 363, column: 5, scope: !2569)
!2592 = !DILocation(line: 275, column: 27, scope: !2578, inlinedAt: !2591)
!2593 = !DILocation(line: 276, column: 29, scope: !2578, inlinedAt: !2591)
!2594 = !DILocalVariable(name: "__first", arg: 1, scope: !2595, file: !2579, line: 256, type: !246)
!2595 = distinct !DISubprogram(name: "__uninitialized_copy_a<latLong *, latLong *, latLong>", linkageName: "_ZSt22__uninitialized_copy_aIP7latLongS1_S0_ET0_T_S3_S2_RSaIT1_E", scope: !14, file: !2579, line: 256, type: !2580, isLocal: false, isDefinition: true, scopeLine: 258, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !2596, variables: !2597)
!2596 = !{!2583, !2584, !274}
!2597 = !{!2594, !2598, !2599, !2600}
!2598 = !DILocalVariable(name: "__last", arg: 2, scope: !2595, file: !2579, line: 256, type: !246)
!2599 = !DILocalVariable(name: "__result", arg: 3, scope: !2595, file: !2579, line: 257, type: !246)
!2600 = !DILocalVariable(arg: 4, scope: !2595, file: !2579, line: 257, type: !226)
!2601 = !DILocation(line: 256, column: 43, scope: !2595, inlinedAt: !2602)
!2602 = distinct !DILocation(line: 279, column: 14, scope: !2578, inlinedAt: !2591)
!2603 = !DILocation(line: 256, column: 67, scope: !2595, inlinedAt: !2602)
!2604 = !DILocation(line: 257, column: 24, scope: !2595, inlinedAt: !2602)
!2605 = !DILocalVariable(name: "__first", arg: 1, scope: !2606, file: !2579, line: 107, type: !246)
!2606 = distinct !DISubprogram(name: "uninitialized_copy<latLong *, latLong *>", linkageName: "_ZSt18uninitialized_copyIP7latLongS1_ET0_T_S3_S2_", scope: !14, file: !2579, line: 107, type: !2391, isLocal: false, isDefinition: true, scopeLine: 109, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !2607, variables: !2608)
!2607 = !{!2583, !2584}
!2608 = !{!2605, !2609, !2610}
!2609 = !DILocalVariable(name: "__last", arg: 2, scope: !2606, file: !2579, line: 107, type: !246)
!2610 = !DILocalVariable(name: "__result", arg: 3, scope: !2606, file: !2579, line: 108, type: !246)
!2611 = !DILocation(line: 107, column: 39, scope: !2606, inlinedAt: !2612)
!2612 = distinct !DILocation(line: 258, column: 14, scope: !2595, inlinedAt: !2602)
!2613 = !DILocation(line: 107, column: 63, scope: !2606, inlinedAt: !2612)
!2614 = !DILocation(line: 108, column: 27, scope: !2606, inlinedAt: !2612)
!2615 = !DILocalVariable(name: "__first", arg: 1, scope: !2616, file: !2579, line: 91, type: !246)
!2616 = distinct !DISubprogram(name: "__uninit_copy<latLong *, latLong *>", linkageName: "_ZNSt20__uninitialized_copyILb1EE13__uninit_copyIP7latLongS3_EET0_T_S5_S4_", scope: !2617, file: !2579, line: 91, type: !2391, isLocal: false, isDefinition: true, scopeLine: 93, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !2607, declaration: !2620, variables: !2621)
!2617 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__uninitialized_copy<true>", scope: !14, file: !2579, line: 87, size: 8, elements: !16, templateParams: !2618, identifier: "_ZTSSt20__uninitialized_copyILb1EE")
!2618 = !{!2619}
!2619 = !DITemplateValueParameter(name: "_TrivialValueTypes", type: !433, value: i8 1)
!2620 = !DISubprogram(name: "__uninit_copy<latLong *, latLong *>", linkageName: "_ZNSt20__uninitialized_copyILb1EE13__uninit_copyIP7latLongS3_EET0_T_S5_S4_", scope: !2617, file: !2579, line: 91, type: !2391, isLocal: false, isDefinition: false, scopeLine: 91, flags: DIFlagPrototyped, isOptimized: true, templateParams: !2607)
!2621 = !{!2615, !2622, !2623}
!2622 = !DILocalVariable(name: "__last", arg: 2, scope: !2616, file: !2579, line: 91, type: !246)
!2623 = !DILocalVariable(name: "__result", arg: 3, scope: !2616, file: !2579, line: 92, type: !246)
!2624 = !DILocation(line: 91, column: 38, scope: !2616, inlinedAt: !2625)
!2625 = distinct !DILocation(line: 115, column: 14, scope: !2606, inlinedAt: !2612)
!2626 = !DILocation(line: 91, column: 62, scope: !2616, inlinedAt: !2625)
!2627 = !DILocation(line: 92, column: 26, scope: !2616, inlinedAt: !2625)
!2628 = !DILocalVariable(name: "__first", arg: 1, scope: !2629, file: !2390, line: 450, type: !246)
!2629 = distinct !DISubprogram(name: "copy<latLong *, latLong *>", linkageName: "_ZSt4copyIP7latLongS1_ET0_T_S3_S2_", scope: !14, file: !2390, line: 450, type: !2391, isLocal: false, isDefinition: true, scopeLine: 451, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !2630, variables: !2633)
!2630 = !{!2631, !2632}
!2631 = !DITemplateTypeParameter(name: "_II", type: !246)
!2632 = !DITemplateTypeParameter(name: "_OI", type: !246)
!2633 = !{!2628, !2634, !2635}
!2634 = !DILocalVariable(name: "__last", arg: 2, scope: !2629, file: !2390, line: 450, type: !246)
!2635 = !DILocalVariable(name: "__result", arg: 3, scope: !2629, file: !2390, line: 450, type: !246)
!2636 = !DILocation(line: 450, column: 14, scope: !2629, inlinedAt: !2637)
!2637 = distinct !DILocation(line: 93, column: 18, scope: !2616, inlinedAt: !2625)
!2638 = !DILocation(line: 450, column: 27, scope: !2629, inlinedAt: !2637)
!2639 = !DILocation(line: 450, column: 39, scope: !2629, inlinedAt: !2637)
!2640 = !DILocalVariable(name: "__first", arg: 1, scope: !2641, file: !2390, line: 424, type: !246)
!2641 = distinct !DISubprogram(name: "__copy_move_a2<false, latLong *, latLong *>", linkageName: "_ZSt14__copy_move_a2ILb0EP7latLongS1_ET1_T0_S3_S2_", scope: !14, file: !2390, line: 424, type: !2391, isLocal: false, isDefinition: true, scopeLine: 425, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !2642, variables: !2643)
!2642 = !{!2407, !2631, !2632}
!2643 = !{!2640, !2644, !2645}
!2644 = !DILocalVariable(name: "__last", arg: 2, scope: !2641, file: !2390, line: 424, type: !246)
!2645 = !DILocalVariable(name: "__result", arg: 3, scope: !2641, file: !2390, line: 424, type: !246)
!2646 = !DILocation(line: 424, column: 24, scope: !2641, inlinedAt: !2647)
!2647 = distinct !DILocation(line: 458, column: 15, scope: !2629, inlinedAt: !2637)
!2648 = !DILocation(line: 424, column: 37, scope: !2641, inlinedAt: !2647)
!2649 = !DILocation(line: 424, column: 49, scope: !2641, inlinedAt: !2647)
!2650 = !DILocalVariable(name: "__first", arg: 1, scope: !2651, file: !2390, line: 379, type: !246)
!2651 = distinct !DISubprogram(name: "__copy_move_a<false, latLong *, latLong *>", linkageName: "_ZSt13__copy_move_aILb0EP7latLongS1_ET1_T0_S3_S2_", scope: !14, file: !2390, line: 379, type: !2391, isLocal: false, isDefinition: true, scopeLine: 380, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !2642, variables: !2652)
!2652 = !{!2650, !2653, !2654, !2655}
!2653 = !DILocalVariable(name: "__last", arg: 2, scope: !2651, file: !2390, line: 379, type: !246)
!2654 = !DILocalVariable(name: "__result", arg: 3, scope: !2651, file: !2390, line: 379, type: !246)
!2655 = !DILocalVariable(name: "__simple", scope: !2651, file: !2390, line: 384, type: !2421)
!2656 = !DILocation(line: 379, column: 23, scope: !2651, inlinedAt: !2657)
!2657 = distinct !DILocation(line: 426, column: 18, scope: !2658, inlinedAt: !2647)
!2658 = !DILexicalBlockFile(scope: !2641, file: !2390, discriminator: 1)
!2659 = !DILocation(line: 379, column: 36, scope: !2651, inlinedAt: !2657)
!2660 = !DILocation(line: 379, column: 48, scope: !2651, inlinedAt: !2657)
!2661 = !DILocation(line: 384, column: 18, scope: !2651, inlinedAt: !2657)
!2662 = !DILocalVariable(name: "__first", arg: 1, scope: !2663, file: !2390, line: 368, type: !254)
!2663 = distinct !DISubprogram(name: "__copy_m<latLong>", linkageName: "_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mI7latLongEEPT_PKS4_S7_S5_", scope: !2664, file: !2390, line: 368, type: !2444, isLocal: false, isDefinition: true, scopeLine: 369, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !273, declaration: !2665, variables: !2666)
!2664 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__copy_move<false, true, std::random_access_iterator_tag>", scope: !14, file: !2390, line: 364, size: 8, elements: !16, templateParams: !2430, identifier: "_ZTSSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE")
!2665 = !DISubprogram(name: "__copy_m<latLong>", linkageName: "_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mI7latLongEEPT_PKS4_S7_S5_", scope: !2664, file: !2390, line: 368, type: !2444, isLocal: false, isDefinition: false, scopeLine: 368, flags: DIFlagPrototyped, isOptimized: true, templateParams: !273)
!2666 = !{!2662, !2667, !2668, !2669}
!2667 = !DILocalVariable(name: "__last", arg: 2, scope: !2663, file: !2390, line: 368, type: !254)
!2668 = !DILocalVariable(name: "__result", arg: 3, scope: !2663, file: !2390, line: 368, type: !246)
!2669 = !DILocalVariable(name: "_Num", scope: !2663, file: !2390, line: 370, type: !2451)
!2670 = !DILocation(line: 368, column: 29, scope: !2663, inlinedAt: !2671)
!2671 = distinct !DILocation(line: 389, column: 14, scope: !2651, inlinedAt: !2657)
!2672 = !DILocation(line: 368, column: 49, scope: !2663, inlinedAt: !2671)
!2673 = !DILocation(line: 368, column: 62, scope: !2663, inlinedAt: !2671)
!2674 = !DILocation(line: 370, column: 34, scope: !2663, inlinedAt: !2671)
!2675 = !DILocation(line: 370, column: 20, scope: !2663, inlinedAt: !2671)
!2676 = !DILocation(line: 371, column: 8, scope: !2677, inlinedAt: !2671)
!2677 = distinct !DILexicalBlock(scope: !2663, file: !2390, line: 371, column: 8)
!2678 = !DILocation(line: 371, column: 8, scope: !2663, inlinedAt: !2671)
!2679 = !DILocation(line: 372, column: 6, scope: !2677, inlinedAt: !2671)
!2680 = !DILocation(line: 373, column: 20, scope: !2663, inlinedAt: !2671)
!2681 = !DILocation(line: 367, column: 8, scope: !2569)
!2682 = !DILocation(line: 371, column: 37, scope: !2683)
!2683 = !DILexicalBlockFile(scope: !2569, file: !2356, discriminator: 1)
!2684 = !DILocation(line: 274, column: 55, scope: !2578, inlinedAt: !2685)
!2685 = distinct !DILocation(line: 370, column: 5, scope: !2569)
!2686 = !DILocation(line: 276, column: 29, scope: !2578, inlinedAt: !2685)
!2687 = !DILocation(line: 256, column: 43, scope: !2595, inlinedAt: !2688)
!2688 = distinct !DILocation(line: 279, column: 14, scope: !2578, inlinedAt: !2685)
!2689 = !DILocation(line: 257, column: 24, scope: !2595, inlinedAt: !2688)
!2690 = !DILocation(line: 107, column: 39, scope: !2606, inlinedAt: !2691)
!2691 = distinct !DILocation(line: 258, column: 14, scope: !2595, inlinedAt: !2688)
!2692 = !DILocation(line: 108, column: 27, scope: !2606, inlinedAt: !2691)
!2693 = !DILocation(line: 91, column: 38, scope: !2616, inlinedAt: !2694)
!2694 = distinct !DILocation(line: 115, column: 14, scope: !2606, inlinedAt: !2691)
!2695 = !DILocation(line: 92, column: 26, scope: !2616, inlinedAt: !2694)
!2696 = !DILocation(line: 450, column: 14, scope: !2629, inlinedAt: !2697)
!2697 = distinct !DILocation(line: 93, column: 18, scope: !2616, inlinedAt: !2694)
!2698 = !DILocation(line: 450, column: 39, scope: !2629, inlinedAt: !2697)
!2699 = !DILocation(line: 424, column: 24, scope: !2641, inlinedAt: !2700)
!2700 = distinct !DILocation(line: 458, column: 15, scope: !2629, inlinedAt: !2697)
!2701 = !DILocation(line: 424, column: 49, scope: !2641, inlinedAt: !2700)
!2702 = !DILocation(line: 379, column: 23, scope: !2651, inlinedAt: !2703)
!2703 = distinct !DILocation(line: 426, column: 18, scope: !2658, inlinedAt: !2700)
!2704 = !DILocation(line: 379, column: 48, scope: !2651, inlinedAt: !2703)
!2705 = !DILocation(line: 384, column: 18, scope: !2651, inlinedAt: !2703)
!2706 = !DILocation(line: 368, column: 29, scope: !2663, inlinedAt: !2707)
!2707 = distinct !DILocation(line: 389, column: 14, scope: !2651, inlinedAt: !2703)
!2708 = !DILocation(line: 368, column: 62, scope: !2663, inlinedAt: !2707)
!2709 = !DILocation(line: 370, column: 34, scope: !2663, inlinedAt: !2707)
!2710 = !DILocation(line: 370, column: 20, scope: !2663, inlinedAt: !2707)
!2711 = !DILocation(line: 371, column: 8, scope: !2677, inlinedAt: !2707)
!2712 = !DILocation(line: 371, column: 8, scope: !2663, inlinedAt: !2707)
!2713 = !DILocation(line: 372, column: 6, scope: !2677, inlinedAt: !2707)
!2714 = !DILocation(line: 373, column: 20, scope: !2663, inlinedAt: !2707)
!2715 = !DILocation(line: 171, column: 29, scope: !1862, inlinedAt: !2716)
!2716 = distinct !DILocation(line: 386, column: 4, scope: !2365)
!2717 = !DILocation(line: 173, column: 6, scope: !1869, inlinedAt: !2716)
!2718 = !DILocation(line: 173, column: 6, scope: !1862, inlinedAt: !2716)
!2719 = !DILocation(line: 109, column: 26, scope: !1872, inlinedAt: !2720)
!2720 = distinct !DILocation(line: 174, column: 12, scope: !1869, inlinedAt: !2716)
!2721 = !DILocation(line: 110, column: 27, scope: !1872, inlinedAt: !2720)
!2722 = !DILocation(line: 110, column: 9, scope: !1872, inlinedAt: !2720)
!2723 = !DILocation(line: 174, column: 4, scope: !1869, inlinedAt: !2716)
!2724 = !DILocation(line: 389, column: 27, scope: !2365)
!2725 = !DILocation(line: 390, column: 28, scope: !2365)
!2726 = !DILocation(line: 391, column: 50, scope: !2365)
!2727 = !DILocation(line: 391, column: 36, scope: !2365)
!2728 = !DILocation(line: 393, column: 5, scope: !2729)
!2729 = !DILexicalBlockFile(scope: !2355, file: !2356, discriminator: 2)
!2730 = distinct !DISubprogram(name: "_M_insert_aux", linkageName: "_ZNSt6vectorI6recordSaIS0_EE13_M_insert_auxEN9__gnu_cxx17__normal_iteratorIPS0_S2_EERKS0_", scope: !568, file: !2356, line: 319, type: !696, isLocal: false, isDefinition: true, scopeLine: 321, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !695, variables: !2731)
!2731 = !{!2732, !2733, !2734, !2735, !2738, !2740, !2741, !2742}
!2732 = !DILocalVariable(name: "this", arg: 1, scope: !2730, type: !1530, flags: DIFlagArtificial | DIFlagObjectPointer)
!2733 = !DILocalVariable(name: "__position", arg: 2, scope: !2730, file: !48, line: 1323, type: !567)
!2734 = !DILocalVariable(name: "__x", arg: 3, scope: !2730, file: !48, line: 1323, type: !584)
!2735 = !DILocalVariable(name: "__x_copy", scope: !2736, file: !2356, line: 329, type: !30)
!2736 = distinct !DILexicalBlock(scope: !2737, file: !2356, line: 323, column: 2)
!2737 = distinct !DILexicalBlock(scope: !2730, file: !2356, line: 322, column: 11)
!2738 = !DILocalVariable(name: "__len", scope: !2739, file: !2356, line: 342, type: !2366)
!2739 = distinct !DILexicalBlock(scope: !2737, file: !2356, line: 341, column: 2)
!2740 = !DILocalVariable(name: "__elems_before", scope: !2739, file: !2356, line: 344, type: !2366)
!2741 = !DILocalVariable(name: "__new_start", scope: !2739, file: !2356, line: 345, type: !665)
!2742 = !DILocalVariable(name: "__new_finish", scope: !2739, file: !2356, line: 346, type: !665)
!2743 = !DILocation(line: 0, scope: !2730)
!2744 = !DILocation(line: 1323, column: 60, scope: !2730)
!2745 = !DILocation(line: 322, column: 25, scope: !2737)
!2746 = !DILocation(line: 322, column: 52, scope: !2737)
!2747 = !DILocation(line: 322, column: 35, scope: !2737)
!2748 = !DILocation(line: 322, column: 11, scope: !2730)
!2749 = !DILocation(line: 215, column: 50, scope: !2273, inlinedAt: !2750)
!2750 = distinct !DILocation(line: 324, column: 4, scope: !2736)
!2751 = !DILocation(line: 129, column: 25, scope: !2285, inlinedAt: !2752)
!2752 = distinct !DILocation(line: 216, column: 13, scope: !2273, inlinedAt: !2750)
!2753 = !DILocation(line: 130, column: 23, scope: !2285, inlinedAt: !2752)
!2754 = !DILocation(line: 130, column: 28, scope: !2285, inlinedAt: !2752)
!2755 = !DILocation(line: 327, column: 4, scope: !2736)
!2756 = !DILocation(line: 329, column: 4, scope: !2736)
!2757 = !DILocation(line: 329, column: 19, scope: !2736)
!2758 = !DILocation(line: 1323, column: 30, scope: !2730)
!2759 = !DILocation(line: 331, column: 4, scope: !2736)
!2760 = !DILocalVariable(name: "__first", arg: 1, scope: !2761, file: !2390, line: 619, type: !87)
!2761 = distinct !DISubprogram(name: "copy_backward<record *, record *>", linkageName: "_ZSt13copy_backwardIP6recordS1_ET0_T_S3_S2_", scope: !14, file: !2390, line: 619, type: !2762, isLocal: false, isDefinition: true, scopeLine: 620, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !2764, variables: !2767)
!2762 = !DISubroutineType(types: !2763)
!2763 = !{!87, !87, !87, !87}
!2764 = !{!2765, !2766}
!2765 = !DITemplateTypeParameter(name: "_BI1", type: !87)
!2766 = !DITemplateTypeParameter(name: "_BI2", type: !87)
!2767 = !{!2760, !2768, !2769}
!2768 = !DILocalVariable(name: "__last", arg: 2, scope: !2761, file: !2390, line: 619, type: !87)
!2769 = !DILocalVariable(name: "__result", arg: 3, scope: !2761, file: !2390, line: 619, type: !87)
!2770 = !DILocation(line: 619, column: 24, scope: !2761, inlinedAt: !2771)
!2771 = distinct !DILocation(line: 331, column: 4, scope: !2772)
!2772 = !DILexicalBlockFile(scope: !2736, file: !2356, discriminator: 1)
!2773 = !DILocation(line: 619, column: 38, scope: !2761, inlinedAt: !2771)
!2774 = !DILocation(line: 619, column: 51, scope: !2761, inlinedAt: !2771)
!2775 = !DILocalVariable(name: "__first", arg: 1, scope: !2776, file: !2390, line: 592, type: !87)
!2776 = distinct !DISubprogram(name: "__copy_move_backward_a2<false, record *, record *>", linkageName: "_ZSt23__copy_move_backward_a2ILb0EP6recordS1_ET1_T0_S3_S2_", scope: !14, file: !2390, line: 592, type: !2762, isLocal: false, isDefinition: true, scopeLine: 593, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !2777, variables: !2778)
!2777 = !{!2407, !2765, !2766}
!2778 = !{!2775, !2779, !2780}
!2779 = !DILocalVariable(name: "__last", arg: 2, scope: !2776, file: !2390, line: 592, type: !87)
!2780 = !DILocalVariable(name: "__result", arg: 3, scope: !2776, file: !2390, line: 592, type: !87)
!2781 = !DILocation(line: 592, column: 34, scope: !2776, inlinedAt: !2782)
!2782 = distinct !DILocation(line: 629, column: 15, scope: !2761, inlinedAt: !2771)
!2783 = !DILocation(line: 592, column: 48, scope: !2776, inlinedAt: !2782)
!2784 = !DILocation(line: 592, column: 61, scope: !2776, inlinedAt: !2782)
!2785 = !DILocalVariable(name: "__first", arg: 1, scope: !2786, file: !2390, line: 574, type: !87)
!2786 = distinct !DISubprogram(name: "__copy_move_backward_a<false, record *, record *>", linkageName: "_ZSt22__copy_move_backward_aILb0EP6recordS1_ET1_T0_S3_S2_", scope: !14, file: !2390, line: 574, type: !2762, isLocal: false, isDefinition: true, scopeLine: 575, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !2777, variables: !2787)
!2787 = !{!2785, !2788, !2789, !2790}
!2788 = !DILocalVariable(name: "__last", arg: 2, scope: !2786, file: !2390, line: 574, type: !87)
!2789 = !DILocalVariable(name: "__result", arg: 3, scope: !2786, file: !2390, line: 574, type: !87)
!2790 = !DILocalVariable(name: "__simple", scope: !2786, file: !2390, line: 579, type: !2421)
!2791 = !DILocation(line: 574, column: 33, scope: !2786, inlinedAt: !2792)
!2792 = distinct !DILocation(line: 594, column: 19, scope: !2776, inlinedAt: !2782)
!2793 = !DILocation(line: 574, column: 47, scope: !2786, inlinedAt: !2792)
!2794 = !DILocation(line: 574, column: 60, scope: !2786, inlinedAt: !2792)
!2795 = !DILocation(line: 579, column: 18, scope: !2786, inlinedAt: !2792)
!2796 = !DILocalVariable(name: "__first", arg: 1, scope: !2797, file: !2390, line: 563, type: !95)
!2797 = distinct !DISubprogram(name: "__copy_move_b<record>", linkageName: "_ZNSt20__copy_move_backwardILb0ELb1ESt26random_access_iterator_tagE13__copy_move_bI6recordEEPT_PKS4_S7_S5_", scope: !2429, file: !2390, line: 563, type: !2798, isLocal: false, isDefinition: true, scopeLine: 564, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !120, declaration: !2800, variables: !2801)
!2798 = !DISubroutineType(types: !2799)
!2799 = !{!87, !95, !95, !87}
!2800 = !DISubprogram(name: "__copy_move_b<record>", linkageName: "_ZNSt20__copy_move_backwardILb0ELb1ESt26random_access_iterator_tagE13__copy_move_bI6recordEEPT_PKS4_S7_S5_", scope: !2429, file: !2390, line: 563, type: !2798, isLocal: false, isDefinition: false, scopeLine: 563, flags: DIFlagPrototyped, isOptimized: true, templateParams: !120)
!2801 = !{!2796, !2802, !2803, !2804}
!2802 = !DILocalVariable(name: "__last", arg: 2, scope: !2797, file: !2390, line: 563, type: !95)
!2803 = !DILocalVariable(name: "__result", arg: 3, scope: !2797, file: !2390, line: 563, type: !87)
!2804 = !DILocalVariable(name: "_Num", scope: !2797, file: !2390, line: 565, type: !2451)
!2805 = !DILocation(line: 563, column: 34, scope: !2797, inlinedAt: !2806)
!2806 = distinct !DILocation(line: 584, column: 14, scope: !2786, inlinedAt: !2792)
!2807 = !DILocation(line: 563, column: 54, scope: !2797, inlinedAt: !2806)
!2808 = !DILocation(line: 563, column: 67, scope: !2797, inlinedAt: !2806)
!2809 = !DILocation(line: 565, column: 34, scope: !2797, inlinedAt: !2806)
!2810 = !DILocation(line: 566, column: 8, scope: !2811, inlinedAt: !2806)
!2811 = distinct !DILexicalBlock(scope: !2797, file: !2390, line: 566, column: 8)
!2812 = !DILocation(line: 566, column: 8, scope: !2797, inlinedAt: !2806)
!2813 = !DILocation(line: 335, column: 16, scope: !2736)
!2814 = !DILocation(line: 567, column: 33, scope: !2811, inlinedAt: !2806)
!2815 = !DILocation(line: 567, column: 6, scope: !2811, inlinedAt: !2806)
!2816 = !DILocation(line: 339, column: 2, scope: !2737)
!2817 = !DILocation(line: 339, column: 2, scope: !2736)
!2818 = !DILocalVariable(name: "this", arg: 1, scope: !2819, type: !2824, flags: DIFlagArtificial | DIFlagObjectPointer)
!2819 = distinct !DISubprogram(name: "_M_check_len", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE12_M_check_lenEmPKc", scope: !568, file: !48, line: 1336, type: !699, isLocal: false, isDefinition: true, scopeLine: 1337, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !698, variables: !2820)
!2820 = !{!2818, !2821, !2822, !2823}
!2821 = !DILocalVariable(name: "__n", arg: 2, scope: !2819, file: !48, line: 1336, type: !363)
!2822 = !DILocalVariable(name: "__s", arg: 3, scope: !2819, file: !48, line: 1336, type: !502)
!2823 = !DILocalVariable(name: "__len", scope: !2819, file: !48, line: 1341, type: !2366)
!2824 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !591, size: 64)
!2825 = !DILocation(line: 0, scope: !2819, inlinedAt: !2826)
!2826 = distinct !DILocation(line: 343, column: 6, scope: !2739)
!2827 = !DILocation(line: 1336, column: 30, scope: !2819, inlinedAt: !2826)
!2828 = !DILocalVariable(name: "this", arg: 1, scope: !2829, type: !2824, flags: DIFlagArtificial | DIFlagObjectPointer)
!2829 = distinct !DISubprogram(name: "size", linkageName: "_ZNKSt6vectorI6recordSaIS0_EE4sizeEv", scope: !568, file: !48, line: 645, type: !624, isLocal: false, isDefinition: true, scopeLine: 646, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !623, variables: !2830)
!2830 = !{!2828}
!2831 = !DILocation(line: 0, scope: !2829, inlinedAt: !2832)
!2832 = distinct !DILocation(line: 1338, column: 19, scope: !2833, inlinedAt: !2826)
!2833 = !DILexicalBlockFile(scope: !2834, file: !48, discriminator: 1)
!2834 = distinct !DILexicalBlock(scope: !2819, file: !48, line: 1338, column: 6)
!2835 = !DILocation(line: 646, column: 40, scope: !2829, inlinedAt: !2832)
!2836 = !DILocation(line: 646, column: 66, scope: !2829, inlinedAt: !2832)
!2837 = !DILocation(line: 646, column: 50, scope: !2829, inlinedAt: !2832)
!2838 = !DILocation(line: 0, scope: !2829, inlinedAt: !2839)
!2839 = distinct !DILocation(line: 1341, column: 26, scope: !2819, inlinedAt: !2826)
!2840 = !DILocation(line: 0, scope: !2829, inlinedAt: !2841)
!2841 = distinct !DILocation(line: 1341, column: 44, scope: !2842, inlinedAt: !2826)
!2842 = !DILexicalBlockFile(scope: !2819, file: !48, discriminator: 1)
!2843 = !DILocation(line: 221, column: 15, scope: !2491, inlinedAt: !2844)
!2844 = distinct !DILocation(line: 1341, column: 35, scope: !2845, inlinedAt: !2826)
!2845 = !DILexicalBlockFile(scope: !2819, file: !48, discriminator: 2)
!2846 = !DILocation(line: 1341, column: 35, scope: !2819, inlinedAt: !2826)
!2847 = !DILocation(line: 1341, column: 33, scope: !2819, inlinedAt: !2826)
!2848 = !DILocation(line: 1341, column: 18, scope: !2819, inlinedAt: !2826)
!2849 = !DILocation(line: 0, scope: !2829, inlinedAt: !2850)
!2850 = distinct !DILocation(line: 1342, column: 18, scope: !2819, inlinedAt: !2826)
!2851 = !DILocation(line: 1342, column: 16, scope: !2819, inlinedAt: !2826)
!2852 = !DILocation(line: 1342, column: 34, scope: !2842, inlinedAt: !2826)
!2853 = !DILocation(line: 1342, column: 25, scope: !2819, inlinedAt: !2826)
!2854 = !DILocation(line: 342, column: 20, scope: !2739)
!2855 = !DILocalVariable(name: "this", arg: 1, scope: !2856, type: !1530, flags: DIFlagArtificial | DIFlagObjectPointer)
!2856 = distinct !DISubprogram(name: "begin", linkageName: "_ZNSt6vectorI6recordSaIS0_EE5beginEv", scope: !568, file: !48, line: 538, type: !601, isLocal: false, isDefinition: true, scopeLine: 539, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !600, variables: !2857)
!2857 = !{!2855}
!2858 = !DILocation(line: 0, scope: !2856, inlinedAt: !2859)
!2859 = distinct !DILocation(line: 344, column: 50, scope: !2739)
!2860 = !DILocalVariable(name: "this", arg: 1, scope: !2861, type: !2864, flags: DIFlagArtificial | DIFlagObjectPointer)
!2861 = distinct !DISubprogram(name: "__normal_iterator", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIP6recordSt6vectorIS1_SaIS1_EEEC2ERKS2_", scope: !705, file: !406, line: 726, type: !713, isLocal: false, isDefinition: true, scopeLine: 726, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !712, variables: !2862)
!2862 = !{!2860, !2863}
!2863 = !DILocalVariable(name: "__i", arg: 2, scope: !2861, file: !406, line: 726, type: !715)
!2864 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !705, size: 64)
!2865 = !DILocation(line: 0, scope: !2861, inlinedAt: !2866)
!2866 = distinct !DILocation(line: 539, column: 16, scope: !2856, inlinedAt: !2859)
!2867 = !DILocation(line: 726, column: 60, scope: !2861, inlinedAt: !2866)
!2868 = !DILocalVariable(name: "__lhs", arg: 1, scope: !2869, file: !406, line: 896, type: !2872)
!2869 = distinct !DISubprogram(name: "operator-<record *, std::vector<record, std::allocator<record> > >", linkageName: "_ZN9__gnu_cxxmiIP6recordSt6vectorIS1_SaIS1_EEEENS_17__normal_iteratorIT_T0_E15difference_typeERKS9_SC_", scope: !60, file: !406, line: 896, type: !2870, isLocal: false, isDefinition: true, scopeLine: 898, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !759, variables: !2873)
!2870 = !DISubroutineType(types: !2871)
!2871 = !{!746, !2872, !2872}
!2872 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !726, size: 64)
!2873 = !{!2868, !2874}
!2874 = !DILocalVariable(name: "__rhs", arg: 2, scope: !2869, file: !406, line: 897, type: !2872)
!2875 = !DILocation(line: 896, column: 63, scope: !2869, inlinedAt: !2876)
!2876 = distinct !DILocation(line: 344, column: 48, scope: !2877)
!2877 = !DILexicalBlockFile(scope: !2739, file: !2356, discriminator: 1)
!2878 = !DILocation(line: 897, column: 56, scope: !2869, inlinedAt: !2876)
!2879 = !DILocation(line: 898, column: 27, scope: !2869, inlinedAt: !2876)
!2880 = !DILocation(line: 344, column: 20, scope: !2739)
!2881 = !DILocalVariable(name: "__n", arg: 2, scope: !2882, file: !48, line: 167, type: !103)
!2882 = distinct !DISubprogram(name: "_M_allocate", linkageName: "_ZNSt12_Vector_baseI6recordSaIS0_EE11_M_allocateEm", scope: !49, file: !48, line: 167, type: !197, isLocal: false, isDefinition: true, scopeLine: 168, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !196, variables: !2883)
!2883 = !{!2884, !2881}
!2884 = !DILocalVariable(name: "this", arg: 1, scope: !2882, type: !1542, flags: DIFlagArtificial | DIFlagObjectPointer)
!2885 = !DILocation(line: 167, column: 26, scope: !2882, inlinedAt: !2886)
!2886 = distinct !DILocation(line: 345, column: 30, scope: !2739)
!2887 = !DILocation(line: 168, column: 20, scope: !2882, inlinedAt: !2886)
!2888 = !DILocation(line: 168, column: 16, scope: !2882, inlinedAt: !2886)
!2889 = !DILocalVariable(name: "__n", arg: 2, scope: !2890, file: !71, line: 99, type: !102)
!2890 = distinct !DISubprogram(name: "allocate", linkageName: "_ZN9__gnu_cxx13new_allocatorI6recordE8allocateEmPKv", scope: !70, file: !71, line: 99, type: !100, isLocal: false, isDefinition: true, scopeLine: 100, flags: DIFlagPrototyped, isOptimized: true, unit: !0, declaration: !99, variables: !2891)
!2891 = !{!2892, !2889, !2893}
!2892 = !DILocalVariable(name: "this", arg: 1, scope: !2890, type: !1910, flags: DIFlagArtificial | DIFlagObjectPointer)
!2893 = !DILocalVariable(arg: 3, scope: !2890, file: !71, line: 99, type: !106)
!2894 = !DILocation(line: 99, column: 26, scope: !2890, inlinedAt: !2895)
!2895 = distinct !DILocation(line: 168, column: 35, scope: !2896, inlinedAt: !2886)
!2896 = !DILexicalBlockFile(scope: !2882, file: !48, discriminator: 1)
!2897 = !DILocation(line: 99, column: 43, scope: !2890, inlinedAt: !2895)
!2898 = !DILocation(line: 101, column: 10, scope: !2899, inlinedAt: !2895)
!2899 = distinct !DILexicalBlock(scope: !2890, file: !71, line: 101, column: 6)
!2900 = !DILocation(line: 101, column: 6, scope: !2890, inlinedAt: !2895)
!2901 = !DILocation(line: 102, column: 4, scope: !2899, inlinedAt: !2895)
!2902 = !DILocation(line: 104, column: 46, scope: !2890, inlinedAt: !2895)
!2903 = !DILocation(line: 104, column: 27, scope: !2890, inlinedAt: !2895)
!2904 = !DILocation(line: 104, column: 9, scope: !2890, inlinedAt: !2895)
!2905 = !DILocation(line: 168, column: 16, scope: !2896, inlinedAt: !2886)
!2906 = !DILocation(line: 168, column: 16, scope: !2907, inlinedAt: !2886)
!2907 = !DILexicalBlockFile(scope: !2882, file: !48, discriminator: 3)
!2908 = !DILocation(line: 345, column: 12, scope: !2739)
!2909 = !DILocation(line: 346, column: 12, scope: !2739)
!2910 = !DILocation(line: 215, column: 66, scope: !2273, inlinedAt: !2911)
!2911 = distinct !DILocation(line: 353, column: 8, scope: !2912)
!2912 = distinct !DILexicalBlock(scope: !2739, file: !2356, line: 348, column: 6)
!2913 = !DILocation(line: 129, column: 41, scope: !2285, inlinedAt: !2914)
!2914 = distinct !DILocation(line: 216, column: 13, scope: !2273, inlinedAt: !2911)
!2915 = !DILocation(line: 130, column: 23, scope: !2285, inlinedAt: !2914)
!2916 = !DILocation(line: 130, column: 28, scope: !2285, inlinedAt: !2914)
!2917 = !DILocalVariable(name: "__first", arg: 1, scope: !2918, file: !2579, line: 274, type: !87)
!2918 = distinct !DISubprogram(name: "__uninitialized_move_if_noexcept_a<record *, record *, std::allocator<record> >", linkageName: "_ZSt34__uninitialized_move_if_noexcept_aIP6recordS1_SaIS0_EET0_T_S4_S3_RT1_", scope: !14, file: !2579, line: 274, type: !2919, isLocal: false, isDefinition: true, scopeLine: 278, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !2921, variables: !2925)
!2919 = !DISubroutineType(types: !2920)
!2920 = !{!87, !87, !87, !87, !65}
!2921 = !{!2922, !2923, !2924}
!2922 = !DITemplateTypeParameter(name: "_InputIterator", type: !87)
!2923 = !DITemplateTypeParameter(name: "_ForwardIterator", type: !87)
!2924 = !DITemplateTypeParameter(name: "_Allocator", type: !66)
!2925 = !{!2917, !2926, !2927, !2928}
!2926 = !DILocalVariable(name: "__last", arg: 2, scope: !2918, file: !2579, line: 275, type: !87)
!2927 = !DILocalVariable(name: "__result", arg: 3, scope: !2918, file: !2579, line: 276, type: !87)
!2928 = !DILocalVariable(name: "__alloc", arg: 4, scope: !2918, file: !2579, line: 277, type: !65)
!2929 = !DILocation(line: 274, column: 55, scope: !2918, inlinedAt: !2930)
!2930 = distinct !DILocation(line: 363, column: 5, scope: !2912)
!2931 = !DILocation(line: 275, column: 27, scope: !2918, inlinedAt: !2930)
!2932 = !DILocation(line: 276, column: 29, scope: !2918, inlinedAt: !2930)
!2933 = !DILocalVariable(name: "__first", arg: 1, scope: !2934, file: !2579, line: 256, type: !87)
!2934 = distinct !DISubprogram(name: "__uninitialized_copy_a<record *, record *, record>", linkageName: "_ZSt22__uninitialized_copy_aIP6recordS1_S0_ET0_T_S3_S2_RSaIT1_E", scope: !14, file: !2579, line: 256, type: !2919, isLocal: false, isDefinition: true, scopeLine: 258, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !2935, variables: !2936)
!2935 = !{!2922, !2923, !121}
!2936 = !{!2933, !2937, !2938, !2939}
!2937 = !DILocalVariable(name: "__last", arg: 2, scope: !2934, file: !2579, line: 256, type: !87)
!2938 = !DILocalVariable(name: "__result", arg: 3, scope: !2934, file: !2579, line: 257, type: !87)
!2939 = !DILocalVariable(arg: 4, scope: !2934, file: !2579, line: 257, type: !65)
!2940 = !DILocation(line: 256, column: 43, scope: !2934, inlinedAt: !2941)
!2941 = distinct !DILocation(line: 279, column: 14, scope: !2918, inlinedAt: !2930)
!2942 = !DILocation(line: 256, column: 67, scope: !2934, inlinedAt: !2941)
!2943 = !DILocation(line: 257, column: 24, scope: !2934, inlinedAt: !2941)
!2944 = !DILocalVariable(name: "__first", arg: 1, scope: !2945, file: !2579, line: 107, type: !87)
!2945 = distinct !DISubprogram(name: "uninitialized_copy<record *, record *>", linkageName: "_ZSt18uninitialized_copyIP6recordS1_ET0_T_S3_S2_", scope: !14, file: !2579, line: 107, type: !2762, isLocal: false, isDefinition: true, scopeLine: 109, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !2946, variables: !2947)
!2946 = !{!2922, !2923}
!2947 = !{!2944, !2948, !2949}
!2948 = !DILocalVariable(name: "__last", arg: 2, scope: !2945, file: !2579, line: 107, type: !87)
!2949 = !DILocalVariable(name: "__result", arg: 3, scope: !2945, file: !2579, line: 108, type: !87)
!2950 = !DILocation(line: 107, column: 39, scope: !2945, inlinedAt: !2951)
!2951 = distinct !DILocation(line: 258, column: 14, scope: !2934, inlinedAt: !2941)
!2952 = !DILocation(line: 107, column: 63, scope: !2945, inlinedAt: !2951)
!2953 = !DILocation(line: 108, column: 27, scope: !2945, inlinedAt: !2951)
!2954 = !DILocalVariable(name: "__first", arg: 1, scope: !2955, file: !2579, line: 91, type: !87)
!2955 = distinct !DISubprogram(name: "__uninit_copy<record *, record *>", linkageName: "_ZNSt20__uninitialized_copyILb1EE13__uninit_copyIP6recordS3_EET0_T_S5_S4_", scope: !2617, file: !2579, line: 91, type: !2762, isLocal: false, isDefinition: true, scopeLine: 93, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !2946, declaration: !2956, variables: !2957)
!2956 = !DISubprogram(name: "__uninit_copy<record *, record *>", linkageName: "_ZNSt20__uninitialized_copyILb1EE13__uninit_copyIP6recordS3_EET0_T_S5_S4_", scope: !2617, file: !2579, line: 91, type: !2762, isLocal: false, isDefinition: false, scopeLine: 91, flags: DIFlagPrototyped, isOptimized: true, templateParams: !2946)
!2957 = !{!2954, !2958, !2959}
!2958 = !DILocalVariable(name: "__last", arg: 2, scope: !2955, file: !2579, line: 91, type: !87)
!2959 = !DILocalVariable(name: "__result", arg: 3, scope: !2955, file: !2579, line: 92, type: !87)
!2960 = !DILocation(line: 91, column: 38, scope: !2955, inlinedAt: !2961)
!2961 = distinct !DILocation(line: 115, column: 14, scope: !2945, inlinedAt: !2951)
!2962 = !DILocation(line: 91, column: 62, scope: !2955, inlinedAt: !2961)
!2963 = !DILocation(line: 92, column: 26, scope: !2955, inlinedAt: !2961)
!2964 = !DILocalVariable(name: "__first", arg: 1, scope: !2965, file: !2390, line: 450, type: !87)
!2965 = distinct !DISubprogram(name: "copy<record *, record *>", linkageName: "_ZSt4copyIP6recordS1_ET0_T_S3_S2_", scope: !14, file: !2390, line: 450, type: !2762, isLocal: false, isDefinition: true, scopeLine: 451, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !2966, variables: !2969)
!2966 = !{!2967, !2968}
!2967 = !DITemplateTypeParameter(name: "_II", type: !87)
!2968 = !DITemplateTypeParameter(name: "_OI", type: !87)
!2969 = !{!2964, !2970, !2971}
!2970 = !DILocalVariable(name: "__last", arg: 2, scope: !2965, file: !2390, line: 450, type: !87)
!2971 = !DILocalVariable(name: "__result", arg: 3, scope: !2965, file: !2390, line: 450, type: !87)
!2972 = !DILocation(line: 450, column: 14, scope: !2965, inlinedAt: !2973)
!2973 = distinct !DILocation(line: 93, column: 18, scope: !2955, inlinedAt: !2961)
!2974 = !DILocation(line: 450, column: 27, scope: !2965, inlinedAt: !2973)
!2975 = !DILocation(line: 450, column: 39, scope: !2965, inlinedAt: !2973)
!2976 = !DILocalVariable(name: "__first", arg: 1, scope: !2977, file: !2390, line: 424, type: !87)
!2977 = distinct !DISubprogram(name: "__copy_move_a2<false, record *, record *>", linkageName: "_ZSt14__copy_move_a2ILb0EP6recordS1_ET1_T0_S3_S2_", scope: !14, file: !2390, line: 424, type: !2762, isLocal: false, isDefinition: true, scopeLine: 425, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !2978, variables: !2979)
!2978 = !{!2407, !2967, !2968}
!2979 = !{!2976, !2980, !2981}
!2980 = !DILocalVariable(name: "__last", arg: 2, scope: !2977, file: !2390, line: 424, type: !87)
!2981 = !DILocalVariable(name: "__result", arg: 3, scope: !2977, file: !2390, line: 424, type: !87)
!2982 = !DILocation(line: 424, column: 24, scope: !2977, inlinedAt: !2983)
!2983 = distinct !DILocation(line: 458, column: 15, scope: !2965, inlinedAt: !2973)
!2984 = !DILocation(line: 424, column: 37, scope: !2977, inlinedAt: !2983)
!2985 = !DILocation(line: 424, column: 49, scope: !2977, inlinedAt: !2983)
!2986 = !DILocalVariable(name: "__first", arg: 1, scope: !2987, file: !2390, line: 379, type: !87)
!2987 = distinct !DISubprogram(name: "__copy_move_a<false, record *, record *>", linkageName: "_ZSt13__copy_move_aILb0EP6recordS1_ET1_T0_S3_S2_", scope: !14, file: !2390, line: 379, type: !2762, isLocal: false, isDefinition: true, scopeLine: 380, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !2978, variables: !2988)
!2988 = !{!2986, !2989, !2990, !2991}
!2989 = !DILocalVariable(name: "__last", arg: 2, scope: !2987, file: !2390, line: 379, type: !87)
!2990 = !DILocalVariable(name: "__result", arg: 3, scope: !2987, file: !2390, line: 379, type: !87)
!2991 = !DILocalVariable(name: "__simple", scope: !2987, file: !2390, line: 384, type: !2421)
!2992 = !DILocation(line: 379, column: 23, scope: !2987, inlinedAt: !2993)
!2993 = distinct !DILocation(line: 426, column: 18, scope: !2994, inlinedAt: !2983)
!2994 = !DILexicalBlockFile(scope: !2977, file: !2390, discriminator: 1)
!2995 = !DILocation(line: 379, column: 36, scope: !2987, inlinedAt: !2993)
!2996 = !DILocation(line: 379, column: 48, scope: !2987, inlinedAt: !2993)
!2997 = !DILocation(line: 384, column: 18, scope: !2987, inlinedAt: !2993)
!2998 = !DILocalVariable(name: "__first", arg: 1, scope: !2999, file: !2390, line: 368, type: !95)
!2999 = distinct !DISubprogram(name: "__copy_m<record>", linkageName: "_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mI6recordEEPT_PKS4_S7_S5_", scope: !2664, file: !2390, line: 368, type: !2798, isLocal: false, isDefinition: true, scopeLine: 369, flags: DIFlagPrototyped, isOptimized: true, unit: !0, templateParams: !120, declaration: !3000, variables: !3001)
!3000 = !DISubprogram(name: "__copy_m<record>", linkageName: "_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mI6recordEEPT_PKS4_S7_S5_", scope: !2664, file: !2390, line: 368, type: !2798, isLocal: false, isDefinition: false, scopeLine: 368, flags: DIFlagPrototyped, isOptimized: true, templateParams: !120)
!3001 = !{!2998, !3002, !3003, !3004}
!3002 = !DILocalVariable(name: "__last", arg: 2, scope: !2999, file: !2390, line: 368, type: !95)
!3003 = !DILocalVariable(name: "__result", arg: 3, scope: !2999, file: !2390, line: 368, type: !87)
!3004 = !DILocalVariable(name: "_Num", scope: !2999, file: !2390, line: 370, type: !2451)
!3005 = !DILocation(line: 368, column: 29, scope: !2999, inlinedAt: !3006)
!3006 = distinct !DILocation(line: 389, column: 14, scope: !2987, inlinedAt: !2993)
!3007 = !DILocation(line: 368, column: 49, scope: !2999, inlinedAt: !3006)
!3008 = !DILocation(line: 368, column: 62, scope: !2999, inlinedAt: !3006)
!3009 = !DILocation(line: 370, column: 34, scope: !2999, inlinedAt: !3006)
!3010 = !DILocation(line: 370, column: 20, scope: !2999, inlinedAt: !3006)
!3011 = !DILocation(line: 371, column: 8, scope: !3012, inlinedAt: !3006)
!3012 = distinct !DILexicalBlock(scope: !2999, file: !2390, line: 371, column: 8)
!3013 = !DILocation(line: 371, column: 8, scope: !2999, inlinedAt: !3006)
!3014 = !DILocation(line: 372, column: 6, scope: !3012, inlinedAt: !3006)
!3015 = !DILocation(line: 373, column: 20, scope: !2999, inlinedAt: !3006)
!3016 = !DILocation(line: 367, column: 8, scope: !2912)
!3017 = !DILocation(line: 371, column: 37, scope: !3018)
!3018 = !DILexicalBlockFile(scope: !2912, file: !2356, discriminator: 1)
!3019 = !DILocation(line: 274, column: 55, scope: !2918, inlinedAt: !3020)
!3020 = distinct !DILocation(line: 370, column: 5, scope: !2912)
!3021 = !DILocation(line: 276, column: 29, scope: !2918, inlinedAt: !3020)
!3022 = !DILocation(line: 256, column: 43, scope: !2934, inlinedAt: !3023)
!3023 = distinct !DILocation(line: 279, column: 14, scope: !2918, inlinedAt: !3020)
!3024 = !DILocation(line: 257, column: 24, scope: !2934, inlinedAt: !3023)
!3025 = !DILocation(line: 107, column: 39, scope: !2945, inlinedAt: !3026)
!3026 = distinct !DILocation(line: 258, column: 14, scope: !2934, inlinedAt: !3023)
!3027 = !DILocation(line: 108, column: 27, scope: !2945, inlinedAt: !3026)
!3028 = !DILocation(line: 91, column: 38, scope: !2955, inlinedAt: !3029)
!3029 = distinct !DILocation(line: 115, column: 14, scope: !2945, inlinedAt: !3026)
!3030 = !DILocation(line: 92, column: 26, scope: !2955, inlinedAt: !3029)
!3031 = !DILocation(line: 450, column: 14, scope: !2965, inlinedAt: !3032)
!3032 = distinct !DILocation(line: 93, column: 18, scope: !2955, inlinedAt: !3029)
!3033 = !DILocation(line: 450, column: 39, scope: !2965, inlinedAt: !3032)
!3034 = !DILocation(line: 424, column: 24, scope: !2977, inlinedAt: !3035)
!3035 = distinct !DILocation(line: 458, column: 15, scope: !2965, inlinedAt: !3032)
!3036 = !DILocation(line: 424, column: 49, scope: !2977, inlinedAt: !3035)
!3037 = !DILocation(line: 379, column: 23, scope: !2987, inlinedAt: !3038)
!3038 = distinct !DILocation(line: 426, column: 18, scope: !2994, inlinedAt: !3035)
!3039 = !DILocation(line: 379, column: 48, scope: !2987, inlinedAt: !3038)
!3040 = !DILocation(line: 384, column: 18, scope: !2987, inlinedAt: !3038)
!3041 = !DILocation(line: 368, column: 29, scope: !2999, inlinedAt: !3042)
!3042 = distinct !DILocation(line: 389, column: 14, scope: !2987, inlinedAt: !3038)
!3043 = !DILocation(line: 368, column: 62, scope: !2999, inlinedAt: !3042)
!3044 = !DILocation(line: 370, column: 34, scope: !2999, inlinedAt: !3042)
!3045 = !DILocation(line: 370, column: 20, scope: !2999, inlinedAt: !3042)
!3046 = !DILocation(line: 371, column: 8, scope: !3012, inlinedAt: !3042)
!3047 = !DILocation(line: 371, column: 8, scope: !2999, inlinedAt: !3042)
!3048 = !DILocation(line: 372, column: 6, scope: !3012, inlinedAt: !3042)
!3049 = !DILocation(line: 373, column: 20, scope: !2999, inlinedAt: !3042)
!3050 = !DILocation(line: 171, column: 29, scope: !1897, inlinedAt: !3051)
!3051 = distinct !DILocation(line: 386, column: 4, scope: !2739)
!3052 = !DILocation(line: 173, column: 6, scope: !1904, inlinedAt: !3051)
!3053 = !DILocation(line: 173, column: 6, scope: !1897, inlinedAt: !3051)
!3054 = !DILocation(line: 109, column: 26, scope: !1907, inlinedAt: !3055)
!3055 = distinct !DILocation(line: 174, column: 12, scope: !1904, inlinedAt: !3051)
!3056 = !DILocation(line: 110, column: 27, scope: !1907, inlinedAt: !3055)
!3057 = !DILocation(line: 110, column: 9, scope: !1907, inlinedAt: !3055)
!3058 = !DILocation(line: 174, column: 4, scope: !1904, inlinedAt: !3051)
!3059 = !DILocation(line: 389, column: 27, scope: !2739)
!3060 = !DILocation(line: 390, column: 28, scope: !2739)
!3061 = !DILocation(line: 391, column: 50, scope: !2739)
!3062 = !DILocation(line: 391, column: 36, scope: !2739)
!3063 = !DILocation(line: 393, column: 5, scope: !3064)
!3064 = !DILexicalBlockFile(scope: !2730, file: !2356, discriminator: 2)
