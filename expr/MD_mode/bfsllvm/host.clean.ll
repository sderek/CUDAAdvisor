; ModuleID = 'bfs.cu'
source_filename = "bfs.cu"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.Node = type { i32, i32 }
%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }
%struct.dim3 = type { i32, i32, i32 }
%struct.CUstream_st = type opaque

@no_of_nodes = global i32 0, align 4, !dbg !0
@edge_list_size = global i32 0, align 4, !dbg !33
@fp = local_unnamed_addr global %struct._IO_FILE* null, align 8, !dbg !35
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [24 x i8] c"Usage: %s <input_file>\0A\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.5 = private unnamed_addr constant [6 x i8] c"%d %d\00", align 1
@.str.8 = private unnamed_addr constant [49 x i8] c"num_of_blocks = %d\0A num_of_threads_per_block=%d\0A\00", align 1
@.str.10 = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1
@.str.11 = private unnamed_addr constant [26 x i8] c"Kernel Executed %d times\0A\00", align 1
@.str.12 = private unnamed_addr constant [11 x i8] c"result.txt\00", align 1
@.str.13 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.14 = private unnamed_addr constant [13 x i8] c"%d) cost:%d\0A\00", align 1
@str = private unnamed_addr constant [13 x i8] c"Reading File\00"
@str.16 = private unnamed_addr constant [25 x i8] c"Error Reading graph file\00"
@str.17 = private unnamed_addr constant [10 x i8] c"Read File\00"
@str.18 = private unnamed_addr constant [32 x i8] c"Copied Everything to GPU memory\00"
@str.19 = private unnamed_addr constant [26 x i8] c"Start traversing the tree\00"
@str.20 = private unnamed_addr constant [28 x i8] c"Result stored in result.txt\00"

; Function Attrs: uwtable
define void @_Z6KernelP4NodePiPbS2_S2_S1_i(%struct.Node* %g_graph_nodes, i32* %g_graph_edges, i8* %g_graph_mask, i8* %g_updating_graph_mask, i8* %g_graph_visited, i32* %g_cost, i32 %no_of_nodes) #0 !dbg !646 {
entry:
  %g_graph_nodes.addr = alloca %struct.Node*, align 8
  %g_graph_edges.addr = alloca i32*, align 8
  %g_graph_mask.addr = alloca i8*, align 8
  %g_updating_graph_mask.addr = alloca i8*, align 8
  %g_graph_visited.addr = alloca i8*, align 8
  %g_cost.addr = alloca i32*, align 8
  %no_of_nodes.addr = alloca i32, align 4
  tail call void @llvm.dbg.value(metadata %struct.Node* %g_graph_nodes, i64 0, metadata !651, metadata !658), !dbg !659
  store %struct.Node* %g_graph_nodes, %struct.Node** %g_graph_nodes.addr, align 8, !tbaa !660
  tail call void @llvm.dbg.value(metadata i32* %g_graph_edges, i64 0, metadata !652, metadata !658), !dbg !664
  store i32* %g_graph_edges, i32** %g_graph_edges.addr, align 8, !tbaa !660
  tail call void @llvm.dbg.value(metadata i8* %g_graph_mask, i64 0, metadata !653, metadata !658), !dbg !665
  store i8* %g_graph_mask, i8** %g_graph_mask.addr, align 8, !tbaa !660
  tail call void @llvm.dbg.value(metadata i8* %g_updating_graph_mask, i64 0, metadata !654, metadata !658), !dbg !666
  store i8* %g_updating_graph_mask, i8** %g_updating_graph_mask.addr, align 8, !tbaa !660
  tail call void @llvm.dbg.value(metadata i8* %g_graph_visited, i64 0, metadata !655, metadata !658), !dbg !667
  store i8* %g_graph_visited, i8** %g_graph_visited.addr, align 8, !tbaa !660
  tail call void @llvm.dbg.value(metadata i32* %g_cost, i64 0, metadata !656, metadata !658), !dbg !668
  store i32* %g_cost, i32** %g_cost.addr, align 8, !tbaa !660
  tail call void @llvm.dbg.value(metadata i32 %no_of_nodes, i64 0, metadata !657, metadata !658), !dbg !669
  store i32 %no_of_nodes, i32* %no_of_nodes.addr, align 4, !tbaa !670
  %0 = bitcast %struct.Node** %g_graph_nodes.addr to i8*, !dbg !672
  %1 = call i32 @cudaSetupArgument(i8* nonnull %0, i64 8, i64 0), !dbg !672
  %2 = icmp eq i32 %1, 0, !dbg !672
  br i1 %2, label %setup.next, label %setup.end, !dbg !672

setup.next:                                       ; preds = %entry
  %3 = bitcast i32** %g_graph_edges.addr to i8*, !dbg !673
  %4 = call i32 @cudaSetupArgument(i8* nonnull %3, i64 8, i64 8), !dbg !673
  %5 = icmp eq i32 %4, 0, !dbg !673
  br i1 %5, label %setup.next1, label %setup.end, !dbg !673

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast i8** %g_graph_mask.addr to i8*, !dbg !675
  %7 = call i32 @cudaSetupArgument(i8* nonnull %6, i64 8, i64 16), !dbg !675
  %8 = icmp eq i32 %7, 0, !dbg !675
  br i1 %8, label %setup.next2, label %setup.end, !dbg !675

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast i8** %g_updating_graph_mask.addr to i8*, !dbg !677
  %10 = call i32 @cudaSetupArgument(i8* nonnull %9, i64 8, i64 24), !dbg !677
  %11 = icmp eq i32 %10, 0, !dbg !677
  br i1 %11, label %setup.next3, label %setup.end, !dbg !677

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast i8** %g_graph_visited.addr to i8*, !dbg !679
  %13 = call i32 @cudaSetupArgument(i8* nonnull %12, i64 8, i64 32), !dbg !679
  %14 = icmp eq i32 %13, 0, !dbg !679
  br i1 %14, label %setup.next4, label %setup.end, !dbg !679

setup.next4:                                      ; preds = %setup.next3
  %15 = bitcast i32** %g_cost.addr to i8*, !dbg !681
  %16 = call i32 @cudaSetupArgument(i8* nonnull %15, i64 8, i64 40), !dbg !681
  %17 = icmp eq i32 %16, 0, !dbg !681
  br i1 %17, label %setup.next5, label %setup.end, !dbg !681

setup.next5:                                      ; preds = %setup.next4
  %18 = bitcast i32* %no_of_nodes.addr to i8*, !dbg !683
  %19 = call i32 @cudaSetupArgument(i8* nonnull %18, i64 4, i64 48), !dbg !683
  %20 = icmp eq i32 %19, 0, !dbg !683
  br i1 %20, label %setup.next6, label %setup.end, !dbg !683

setup.next6:                                      ; preds = %setup.next5
  %21 = call i32 @cudaLaunch(i8* bitcast (void (%struct.Node*, i32*, i8*, i8*, i8*, i32*, i32)* @_Z6KernelP4NodePiPbS2_S2_S1_i to i8*)), !dbg !685
  br label %setup.end, !dbg !685

setup.end:                                        ; preds = %setup.next6, %setup.next5, %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !687
}

declare i32 @cudaSetupArgument(i8*, i64, i64) local_unnamed_addr

declare i32 @cudaLaunch(i8*) local_unnamed_addr

; Function Attrs: uwtable
define void @_Z7Kernel2PbS_S_S_i(i8* %g_graph_mask, i8* %g_updating_graph_mask, i8* %g_graph_visited, i8* %g_over, i32 %no_of_nodes) #0 !dbg !688 {
entry:
  %g_graph_mask.addr = alloca i8*, align 8
  %g_updating_graph_mask.addr = alloca i8*, align 8
  %g_graph_visited.addr = alloca i8*, align 8
  %g_over.addr = alloca i8*, align 8
  %no_of_nodes.addr = alloca i32, align 4
  tail call void @llvm.dbg.value(metadata i8* %g_graph_mask, i64 0, metadata !693, metadata !658), !dbg !698
  store i8* %g_graph_mask, i8** %g_graph_mask.addr, align 8, !tbaa !660
  tail call void @llvm.dbg.value(metadata i8* %g_updating_graph_mask, i64 0, metadata !694, metadata !658), !dbg !699
  store i8* %g_updating_graph_mask, i8** %g_updating_graph_mask.addr, align 8, !tbaa !660
  tail call void @llvm.dbg.value(metadata i8* %g_graph_visited, i64 0, metadata !695, metadata !658), !dbg !700
  store i8* %g_graph_visited, i8** %g_graph_visited.addr, align 8, !tbaa !660
  tail call void @llvm.dbg.value(metadata i8* %g_over, i64 0, metadata !696, metadata !658), !dbg !701
  store i8* %g_over, i8** %g_over.addr, align 8, !tbaa !660
  tail call void @llvm.dbg.value(metadata i32 %no_of_nodes, i64 0, metadata !697, metadata !658), !dbg !702
  store i32 %no_of_nodes, i32* %no_of_nodes.addr, align 4, !tbaa !670
  %0 = bitcast i8** %g_graph_mask.addr to i8*, !dbg !703
  %1 = call i32 @cudaSetupArgument(i8* nonnull %0, i64 8, i64 0), !dbg !703
  %2 = icmp eq i32 %1, 0, !dbg !703
  br i1 %2, label %setup.next, label %setup.end, !dbg !703

setup.next:                                       ; preds = %entry
  %3 = bitcast i8** %g_updating_graph_mask.addr to i8*, !dbg !704
  %4 = call i32 @cudaSetupArgument(i8* nonnull %3, i64 8, i64 8), !dbg !704
  %5 = icmp eq i32 %4, 0, !dbg !704
  br i1 %5, label %setup.next1, label %setup.end, !dbg !704

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast i8** %g_graph_visited.addr to i8*, !dbg !706
  %7 = call i32 @cudaSetupArgument(i8* nonnull %6, i64 8, i64 16), !dbg !706
  %8 = icmp eq i32 %7, 0, !dbg !706
  br i1 %8, label %setup.next2, label %setup.end, !dbg !706

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast i8** %g_over.addr to i8*, !dbg !708
  %10 = call i32 @cudaSetupArgument(i8* nonnull %9, i64 8, i64 24), !dbg !708
  %11 = icmp eq i32 %10, 0, !dbg !708
  br i1 %11, label %setup.next3, label %setup.end, !dbg !708

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast i32* %no_of_nodes.addr to i8*, !dbg !710
  %13 = call i32 @cudaSetupArgument(i8* nonnull %12, i64 4, i64 32), !dbg !710
  %14 = icmp eq i32 %13, 0, !dbg !710
  br i1 %14, label %setup.next4, label %setup.end, !dbg !710

setup.next4:                                      ; preds = %setup.next3
  %15 = call i32 @cudaLaunch(i8* bitcast (void (i8*, i8*, i8*, i8*, i32)* @_Z7Kernel2PbS_S_S_i to i8*)), !dbg !712
  br label %setup.end, !dbg !712

setup.end:                                        ; preds = %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !714
}

; Function Attrs: nounwind uwtable
define double @_Z8get_timev() local_unnamed_addr #1 !dbg !715 {
entry:
  %time = alloca %struct.timeval, align 8
  %0 = bitcast %struct.timeval* %time to i8*, !dbg !727
  call void @llvm.lifetime.start(i64 16, i8* nonnull %0) #8, !dbg !727
  tail call void @llvm.dbg.value(metadata %struct.timeval* %time, i64 0, metadata !719, metadata !728), !dbg !729
  %call = call i32 @gettimeofday(%struct.timeval* nonnull %time, %struct.timezone* null) #8, !dbg !730
  %tobool = icmp eq i32 %call, 0, !dbg !730
  br i1 %tobool, label %if.end, label %cleanup, !dbg !732

if.end:                                           ; preds = %entry
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %time, i64 0, i32 0, !dbg !733
  %1 = load i64, i64* %tv_sec, align 8, !dbg !733, !tbaa !734
  %conv = sitofp i64 %1 to double, !dbg !737
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %time, i64 0, i32 1, !dbg !738
  %2 = load i64, i64* %tv_usec, align 8, !dbg !738, !tbaa !739
  %conv1 = sitofp i64 %2 to double, !dbg !740
  %mul = fmul double %conv1, 1.000000e-06, !dbg !741
  %add = fadd double %mul, %conv, !dbg !742
  br label %cleanup, !dbg !743

cleanup:                                          ; preds = %entry, %if.end
  %retval.0 = phi double [ %add, %if.end ], [ 0.000000e+00, %entry ]
  call void @llvm.lifetime.end(i64 16, i8* nonnull %0) #8, !dbg !744
  ret double %retval.0, !dbg !744
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #2

; Function Attrs: nounwind
declare i32 @gettimeofday(%struct.timeval* nocapture, %struct.timezone* nocapture) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #2

; Function Attrs: norecurse uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #4 !dbg !745 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !749, metadata !658), !dbg !751
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !750, metadata !658), !dbg !752
  store i32 0, i32* @no_of_nodes, align 4, !dbg !753, !tbaa !670
  store i32 0, i32* @edge_list_size, align 4, !dbg !754, !tbaa !670
  tail call void @_Z8BFSGraphiPPc(i32 %argc, i8** %argv), !dbg !755
  ret i32 0, !dbg !756
}

; Function Attrs: uwtable
define void @_Z8BFSGraphiPPc(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 !dbg !757 {
entry:
  %time.i248 = alloca %struct.timeval, align 8
  %time.i236 = alloca %struct.timeval, align 8
  %time.i = alloca %struct.timeval, align 8
  %source = alloca i32, align 4
  %start = alloca i32, align 4
  %edgeno = alloca i32, align 4
  %id = alloca i32, align 4
  %cost = alloca i32, align 4
  %d_graph_nodes = alloca %struct.Node*, align 8
  %d_graph_edges = alloca i32*, align 8
  %d_graph_mask = alloca i8*, align 8
  %d_updating_graph_mask = alloca i8*, align 8
  %d_graph_visited = alloca i8*, align 8
  %d_cost = alloca i32*, align 8
  %d_over = alloca i8*, align 8
  %stop = alloca i8, align 1
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !761, metadata !658), !dbg !826
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !762, metadata !658), !dbg !827
  %cmp = icmp eq i32 %argc, 2, !dbg !828
  br i1 %cmp, label %if.end, label %if.then, !dbg !830

if.then:                                          ; preds = %entry
  tail call void @_Z5UsageiPPc(i32 undef, i8** %argv), !dbg !831
  tail call void @exit(i32 0) #9, !dbg !833
  unreachable, !dbg !833

if.end:                                           ; preds = %entry
  %arrayidx = getelementptr inbounds i8*, i8** %argv, i64 1, !dbg !834
  %0 = load i8*, i8** %arrayidx, align 8, !dbg !834, !tbaa !660
  tail call void @llvm.dbg.value(metadata i8* %0, i64 0, metadata !763, metadata !658), !dbg !835
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @str, i64 0, i64 0)), !dbg !836
  %call1 = tail call %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i64 0, i64 0)), !dbg !837
  store %struct._IO_FILE* %call1, %struct._IO_FILE** @fp, align 8, !dbg !838, !tbaa !660
  %tobool = icmp eq %struct._IO_FILE* %call1, null, !dbg !839
  br i1 %tobool, label %if.then2, label %if.end4, !dbg !841

if.then2:                                         ; preds = %if.end
  %puts228 = tail call i32 @puts(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @str.16, i64 0, i64 0)), !dbg !842
  br label %cleanup, !dbg !844

if.end4:                                          ; preds = %if.end
  %1 = bitcast i32* %source to i8*, !dbg !845
  call void @llvm.lifetime.start(i64 4, i8* nonnull %1) #8, !dbg !845
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !764, metadata !658), !dbg !846
  store i32 0, i32* %source, align 4, !dbg !846, !tbaa !670
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* nonnull %call1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0), i32* nonnull @no_of_nodes), !dbg !847
  tail call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !765, metadata !658), !dbg !848
  %2 = load i32, i32* @no_of_nodes, align 4, !dbg !849, !tbaa !670
  tail call void @llvm.dbg.value(metadata i32 %2, i64 0, metadata !766, metadata !658), !dbg !850
  %cmp6 = icmp sgt i32 %2, 512, !dbg !851
  br i1 %cmp6, label %if.then7, label %if.end10, !dbg !853

if.then7:                                         ; preds = %if.end4
  %conv = sitofp i32 %2 to double, !dbg !854
  %div = fmul double %conv, 1.953125e-03, !dbg !856
  %call8 = tail call double @llvm.ceil.f64(double %div), !dbg !857
  %conv9 = fptosi double %call8 to i32, !dbg !857
  tail call void @llvm.dbg.value(metadata i32 %conv9, i64 0, metadata !765, metadata !658), !dbg !848
  tail call void @llvm.dbg.value(metadata i32 512, i64 0, metadata !766, metadata !658), !dbg !850
  br label %if.end10, !dbg !858

if.end10:                                         ; preds = %if.then7, %if.end4
  %num_of_threads_per_block.0 = phi i32 [ 512, %if.then7 ], [ %2, %if.end4 ]
  %num_of_blocks.0 = phi i32 [ %conv9, %if.then7 ], [ 1, %if.end4 ]
  tail call void @llvm.dbg.value(metadata i32 %num_of_blocks.0, i64 0, metadata !765, metadata !658), !dbg !848
  tail call void @llvm.dbg.value(metadata i32 %num_of_threads_per_block.0, i64 0, metadata !766, metadata !658), !dbg !850
  %conv11 = sext i32 %2 to i64, !dbg !859
  %mul = shl nsw i64 %conv11, 3, !dbg !860
  %call12 = tail call noalias i8* @malloc(i64 %mul) #8, !dbg !861
  %3 = bitcast i8* %call12 to %struct.Node*, !dbg !862
  tail call void @llvm.dbg.value(metadata %struct.Node* %3, i64 0, metadata !767, metadata !658), !dbg !863
  %call15 = tail call noalias i8* @malloc(i64 %conv11) #8, !dbg !864
  tail call void @llvm.dbg.value(metadata i8* %call15, i64 0, metadata !768, metadata !658), !dbg !865
  %call18 = tail call noalias i8* @malloc(i64 %conv11) #8, !dbg !866
  tail call void @llvm.dbg.value(metadata i8* %call18, i64 0, metadata !769, metadata !658), !dbg !867
  %call21 = tail call noalias i8* @malloc(i64 %conv11) #8, !dbg !868
  tail call void @llvm.dbg.value(metadata i8* %call21, i64 0, metadata !770, metadata !658), !dbg !869
  %4 = bitcast i32* %start to i8*, !dbg !870
  call void @llvm.lifetime.start(i64 4, i8* nonnull %4) #8, !dbg !870
  %5 = bitcast i32* %edgeno to i8*, !dbg !870
  call void @llvm.lifetime.start(i64 4, i8* nonnull %5) #8, !dbg !870
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !773, metadata !658), !dbg !871
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !773, metadata !658), !dbg !871
  %cmp22291 = icmp eq i32 %2, 0, !dbg !872
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @fp, align 8, !dbg !875, !tbaa !660
  br i1 %cmp22291, label %for.cond.cleanup, label %for.body.preheader, !dbg !877

for.body.preheader:                               ; preds = %if.end10
  br label %for.body, !dbg !879

for.cond.cleanup.loopexit:                        ; preds = %for.body
  br label %for.cond.cleanup, !dbg !846

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %if.end10
  %.lcssa284 = phi %struct._IO_FILE* [ %6, %if.end10 ], [ %18, %for.cond.cleanup.loopexit ]
  call void @llvm.dbg.value(metadata i32* %source, i64 0, metadata !764, metadata !728), !dbg !846
  %call33 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %.lcssa284, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0), i32* nonnull %source), !dbg !880
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !764, metadata !658), !dbg !846
  store i32 0, i32* %source, align 4, !dbg !881, !tbaa !670
  store i8 1, i8* %call15, align 1, !dbg !882, !tbaa !883
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !764, metadata !658), !dbg !846
  store i8 1, i8* %call21, align 1, !dbg !885, !tbaa !883
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @fp, align 8, !dbg !886, !tbaa !660
  %call38 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0), i32* nonnull @edge_list_size), !dbg !887
  %8 = bitcast i32* %id to i8*, !dbg !888
  call void @llvm.lifetime.start(i64 4, i8* nonnull %8) #8, !dbg !888
  %9 = bitcast i32* %cost to i8*, !dbg !888
  call void @llvm.lifetime.start(i64 4, i8* nonnull %9) #8, !dbg !888
  %10 = load i32, i32* @edge_list_size, align 4, !dbg !889, !tbaa !670
  %conv39 = sext i32 %10 to i64, !dbg !889
  %mul40 = shl nsw i64 %conv39, 2, !dbg !890
  %call41 = call noalias i8* @malloc(i64 %mul40) #8, !dbg !891
  %11 = bitcast i8* %call41 to i32*, !dbg !892
  call void @llvm.dbg.value(metadata i32* %11, i64 0, metadata !777, metadata !658), !dbg !893
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !778, metadata !658), !dbg !894
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !778, metadata !658), !dbg !894
  %cmp44289 = icmp sgt i32 %10, 0, !dbg !895
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @fp, align 8, !dbg !898, !tbaa !660
  br i1 %cmp44289, label %for.body46.preheader, label %for.cond.cleanup45, !dbg !900

for.body46.preheader:                             ; preds = %for.cond.cleanup
  br label %for.body46, !dbg !902

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv300 = phi i64 [ %indvars.iv.next301, %for.body ], [ 0, %for.body.preheader ]
  %13 = phi %struct._IO_FILE* [ %18, %for.body ], [ %6, %for.body.preheader ]
  call void @llvm.dbg.value(metadata i32* %start, i64 0, metadata !771, metadata !728), !dbg !879
  call void @llvm.dbg.value(metadata i32* %edgeno, i64 0, metadata !772, metadata !728), !dbg !903
  %call23 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.5, i64 0, i64 0), i32* nonnull %start, i32* nonnull %edgeno), !dbg !904
  %14 = load i32, i32* %start, align 4, !dbg !905, !tbaa !670
  call void @llvm.dbg.value(metadata i32 %14, i64 0, metadata !771, metadata !658), !dbg !879
  %starting = getelementptr inbounds %struct.Node, %struct.Node* %3, i64 %indvars.iv300, i32 0, !dbg !906
  store i32 %14, i32* %starting, align 4, !dbg !907, !tbaa !908
  %15 = load i32, i32* %edgeno, align 4, !dbg !910, !tbaa !670
  call void @llvm.dbg.value(metadata i32 %15, i64 0, metadata !772, metadata !658), !dbg !903
  %no_of_edges = getelementptr inbounds %struct.Node, %struct.Node* %3, i64 %indvars.iv300, i32 1, !dbg !911
  store i32 %15, i32* %no_of_edges, align 4, !dbg !912, !tbaa !913
  %arrayidx28 = getelementptr inbounds i8, i8* %call15, i64 %indvars.iv300, !dbg !914
  store i8 0, i8* %arrayidx28, align 1, !dbg !915, !tbaa !883
  %arrayidx30 = getelementptr inbounds i8, i8* %call18, i64 %indvars.iv300, !dbg !916
  store i8 0, i8* %arrayidx30, align 1, !dbg !917, !tbaa !883
  %arrayidx32 = getelementptr inbounds i8, i8* %call21, i64 %indvars.iv300, !dbg !918
  store i8 0, i8* %arrayidx32, align 1, !dbg !919, !tbaa !883
  %indvars.iv.next301 = add i64 %indvars.iv300, 1, !dbg !920
  %16 = load i32, i32* @no_of_nodes, align 4, !dbg !922, !tbaa !670
  %17 = zext i32 %16 to i64, !dbg !872
  %cmp22 = icmp ult i64 %indvars.iv.next301, %17, !dbg !872
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @fp, align 8, !dbg !875, !tbaa !660
  br i1 %cmp22, label %for.body, label %for.cond.cleanup.loopexit, !dbg !877, !llvm.loop !923

for.cond.cleanup45.loopexit:                      ; preds = %for.body46
  br label %for.cond.cleanup45, !dbg !926

for.cond.cleanup45:                               ; preds = %for.cond.cleanup45.loopexit, %for.cond.cleanup
  %.lcssa = phi %struct._IO_FILE* [ %12, %for.cond.cleanup ], [ %24, %for.cond.cleanup45.loopexit ]
  %tobool54 = icmp eq %struct._IO_FILE* %.lcssa, null, !dbg !926
  br i1 %tobool54, label %if.end57, label %if.then55, !dbg !928

for.body46:                                       ; preds = %for.body46.preheader, %for.body46
  %indvars.iv298 = phi i64 [ %indvars.iv.next299, %for.body46 ], [ 0, %for.body46.preheader ]
  %19 = phi %struct._IO_FILE* [ %24, %for.body46 ], [ %12, %for.body46.preheader ]
  call void @llvm.dbg.value(metadata i32* %id, i64 0, metadata !775, metadata !728), !dbg !902
  %call47 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0), i32* nonnull %id), !dbg !929
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @fp, align 8, !dbg !930, !tbaa !660
  call void @llvm.dbg.value(metadata i32* %cost, i64 0, metadata !776, metadata !728), !dbg !931
  %call48 = call i32 (%struct._IO_FILE*, i8*, ...) @fscanf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0), i32* nonnull %cost), !dbg !932
  %21 = load i32, i32* %id, align 4, !dbg !933, !tbaa !670
  call void @llvm.dbg.value(metadata i32 %21, i64 0, metadata !775, metadata !658), !dbg !902
  %arrayidx50 = getelementptr inbounds i32, i32* %11, i64 %indvars.iv298, !dbg !934
  store i32 %21, i32* %arrayidx50, align 4, !dbg !935, !tbaa !670
  %indvars.iv.next299 = add nuw i64 %indvars.iv298, 1, !dbg !936
  %22 = load i32, i32* @edge_list_size, align 4, !dbg !938, !tbaa !670
  %23 = sext i32 %22 to i64, !dbg !895
  %cmp44 = icmp slt i64 %indvars.iv.next299, %23, !dbg !895
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @fp, align 8, !dbg !898, !tbaa !660
  br i1 %cmp44, label %for.body46, label %for.cond.cleanup45.loopexit, !dbg !900, !llvm.loop !939

if.then55:                                        ; preds = %for.cond.cleanup45
  %call56 = call i32 @fclose(%struct._IO_FILE* nonnull %.lcssa), !dbg !942
  br label %if.end57, !dbg !942

if.end57:                                         ; preds = %for.cond.cleanup45, %if.then55
  %puts229 = call i32 @puts(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @str.17, i64 0, i64 0)), !dbg !943
  %25 = bitcast %struct.Node** %d_graph_nodes to i8*, !dbg !944
  call void @llvm.lifetime.start(i64 8, i8* nonnull %25) #8, !dbg !944
  %26 = bitcast %struct.Node** %d_graph_nodes to i8**, !dbg !945
  %27 = load i32, i32* @no_of_nodes, align 4, !dbg !946, !tbaa !670
  %conv59 = sext i32 %27 to i64, !dbg !946
  %mul60 = shl nsw i64 %conv59, 3, !dbg !947
  %call61 = call i32 @cudaMalloc(i8** nonnull %26, i64 %mul60), !dbg !948
  %28 = load i8*, i8** %26, align 8, !dbg !949, !tbaa !660
  %29 = load i32, i32* @no_of_nodes, align 4, !dbg !950, !tbaa !670
  %conv62 = sext i32 %29 to i64, !dbg !950
  %mul63 = shl nsw i64 %conv62, 3, !dbg !951
  %call64 = call i32 @cudaMemcpy(i8* %28, i8* %call12, i64 %mul63, i32 1), !dbg !952
  %30 = bitcast i32** %d_graph_edges to i8*, !dbg !953
  call void @llvm.lifetime.start(i64 8, i8* nonnull %30) #8, !dbg !953
  %31 = bitcast i32** %d_graph_edges to i8**, !dbg !954
  %32 = load i32, i32* @edge_list_size, align 4, !dbg !955, !tbaa !670
  %conv65 = sext i32 %32 to i64, !dbg !955
  %mul66 = shl nsw i64 %conv65, 2, !dbg !956
  %call67 = call i32 @cudaMalloc(i8** nonnull %31, i64 %mul66), !dbg !957
  %33 = load i8*, i8** %31, align 8, !dbg !958, !tbaa !660
  %34 = load i32, i32* @edge_list_size, align 4, !dbg !959, !tbaa !670
  %conv68 = sext i32 %34 to i64, !dbg !959
  %mul69 = shl nsw i64 %conv68, 2, !dbg !960
  %call70 = call i32 @cudaMemcpy(i8* %33, i8* %call41, i64 %mul69, i32 1), !dbg !961
  %35 = bitcast i8** %d_graph_mask to i8*, !dbg !962
  call void @llvm.lifetime.start(i64 8, i8* nonnull %35) #8, !dbg !962
  %36 = load i32, i32* @no_of_nodes, align 4, !dbg !963, !tbaa !670
  %conv71 = sext i32 %36 to i64, !dbg !963
  call void @llvm.dbg.value(metadata i8** %d_graph_mask, i64 0, metadata !782, metadata !728), !dbg !964
  %call73 = call i32 @cudaMalloc(i8** nonnull %d_graph_mask, i64 %conv71), !dbg !965
  %37 = load i8*, i8** %d_graph_mask, align 8, !dbg !966, !tbaa !660
  call void @llvm.dbg.value(metadata i8* %37, i64 0, metadata !782, metadata !658), !dbg !964
  %38 = load i32, i32* @no_of_nodes, align 4, !dbg !967, !tbaa !670
  %conv74 = sext i32 %38 to i64, !dbg !967
  %call76 = call i32 @cudaMemcpy(i8* %37, i8* %call15, i64 %conv74, i32 1), !dbg !968
  %39 = bitcast i8** %d_updating_graph_mask to i8*, !dbg !969
  call void @llvm.lifetime.start(i64 8, i8* nonnull %39) #8, !dbg !969
  %40 = load i32, i32* @no_of_nodes, align 4, !dbg !970, !tbaa !670
  %conv77 = sext i32 %40 to i64, !dbg !970
  call void @llvm.dbg.value(metadata i8** %d_updating_graph_mask, i64 0, metadata !783, metadata !728), !dbg !971
  %call79 = call i32 @cudaMalloc(i8** nonnull %d_updating_graph_mask, i64 %conv77), !dbg !972
  %41 = load i8*, i8** %d_updating_graph_mask, align 8, !dbg !973, !tbaa !660
  call void @llvm.dbg.value(metadata i8* %41, i64 0, metadata !783, metadata !658), !dbg !971
  %42 = load i32, i32* @no_of_nodes, align 4, !dbg !974, !tbaa !670
  %conv80 = sext i32 %42 to i64, !dbg !974
  %call82 = call i32 @cudaMemcpy(i8* %41, i8* %call18, i64 %conv80, i32 1), !dbg !975
  %43 = bitcast i8** %d_graph_visited to i8*, !dbg !976
  call void @llvm.lifetime.start(i64 8, i8* nonnull %43) #8, !dbg !976
  %44 = load i32, i32* @no_of_nodes, align 4, !dbg !977, !tbaa !670
  %conv83 = sext i32 %44 to i64, !dbg !977
  call void @llvm.dbg.value(metadata i8** %d_graph_visited, i64 0, metadata !784, metadata !728), !dbg !978
  %call85 = call i32 @cudaMalloc(i8** nonnull %d_graph_visited, i64 %conv83), !dbg !979
  %45 = load i8*, i8** %d_graph_visited, align 8, !dbg !980, !tbaa !660
  call void @llvm.dbg.value(metadata i8* %45, i64 0, metadata !784, metadata !658), !dbg !978
  %46 = load i32, i32* @no_of_nodes, align 4, !dbg !981, !tbaa !670
  %conv86 = sext i32 %46 to i64, !dbg !981
  %call88 = call i32 @cudaMemcpy(i8* %45, i8* %call21, i64 %conv86, i32 1), !dbg !982
  %47 = load i32, i32* @no_of_nodes, align 4, !dbg !983, !tbaa !670
  %conv89 = sext i32 %47 to i64, !dbg !983
  %mul90 = shl nsw i64 %conv89, 2, !dbg !984
  %call91 = call noalias i8* @malloc(i64 %mul90) #8, !dbg !985
  %48 = bitcast i8* %call91 to i32*, !dbg !986
  call void @llvm.dbg.value(metadata i32* %48, i64 0, metadata !785, metadata !658), !dbg !987
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !786, metadata !658), !dbg !988
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !786, metadata !658), !dbg !988
  %cmp94287 = icmp sgt i32 %47, 0, !dbg !989
  br i1 %cmp94287, label %for.body96.lr.ph, label %for.cond.cleanup95, !dbg !992

for.body96.lr.ph:                                 ; preds = %if.end57
  %49 = add nsw i32 %47, -1, !dbg !992
  %50 = zext i32 %49 to i64, !dbg !992
  %51 = shl nuw nsw i64 %50, 2, !dbg !992
  %52 = add nuw nsw i64 %51, 4, !dbg !992
  call void @llvm.memset.p0i8.i64(i8* %call91, i8 -1, i64 %52, i32 4, i1 false), !dbg !994
  br label %for.cond.cleanup95, !dbg !995

for.cond.cleanup95:                               ; preds = %for.body96.lr.ph, %if.end57
  %53 = load i32, i32* %source, align 4, !dbg !995, !tbaa !670
  call void @llvm.dbg.value(metadata i32 %53, i64 0, metadata !764, metadata !658), !dbg !846
  %idxprom102 = sext i32 %53 to i64, !dbg !996
  %arrayidx103 = getelementptr inbounds i32, i32* %48, i64 %idxprom102, !dbg !996
  store i32 0, i32* %arrayidx103, align 4, !dbg !997, !tbaa !670
  %54 = bitcast i32** %d_cost to i8*, !dbg !998
  call void @llvm.lifetime.start(i64 8, i8* nonnull %54) #8, !dbg !998
  %55 = bitcast i32** %d_cost to i8**, !dbg !999
  %call106 = call i32 @cudaMalloc(i8** nonnull %55, i64 %mul90), !dbg !1000
  %56 = load i8*, i8** %55, align 8, !dbg !1001, !tbaa !660
  %57 = load i32, i32* @no_of_nodes, align 4, !dbg !1002, !tbaa !670
  %conv107 = sext i32 %57 to i64, !dbg !1002
  %mul108 = shl nsw i64 %conv107, 2, !dbg !1003
  %call109 = call i32 @cudaMemcpy(i8* %56, i8* %call91, i64 %mul108, i32 1), !dbg !1004
  %58 = bitcast i8** %d_over to i8*, !dbg !1005
  call void @llvm.lifetime.start(i64 8, i8* nonnull %58) #8, !dbg !1005
  call void @llvm.dbg.value(metadata i8** %d_over, i64 0, metadata !789, metadata !728), !dbg !1006
  %call110 = call i32 @cudaMalloc(i8** nonnull %d_over, i64 1), !dbg !1007
  %puts230 = call i32 @puts(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @str.18, i64 0, i64 0)), !dbg !1008
  call void @llvm.dbg.value(metadata %struct.dim3* undef, i64 0, metadata !790, metadata !728), !dbg !1009
  call void @llvm.dbg.value(metadata %struct.dim3* undef, i64 0, metadata !814, metadata !728), !dbg !1010
  %call112 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.8, i64 0, i64 0), i32 %num_of_blocks.0, i32 %num_of_threads_per_block.0), !dbg !1011
  %call113 = call i32 @cudaDeviceSetCacheConfig(i32 1), !dbg !1012
  call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !815, metadata !658), !dbg !1013
  call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !816, metadata !658), !dbg !1014
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !817, metadata !658), !dbg !1015
  %puts231 = call i32 @puts(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @str.19, i64 0, i64 0)), !dbg !1016
  call void @llvm.dbg.value(metadata i8* %stop, i64 0, metadata !818, metadata !728), !dbg !1017
  call void @llvm.lifetime.start(i64 1, i8* nonnull %stop) #8, !dbg !1018
  %59 = bitcast %struct.timeval* %time.i236 to i8*
  %tv_sec.i239 = getelementptr inbounds %struct.timeval, %struct.timeval* %time.i236, i64 0, i32 0
  %tv_usec.i241 = getelementptr inbounds %struct.timeval, %struct.timeval* %time.i236, i64 0, i32 1
  %grid.sroa.0.sroa.0.0.insert.ext = zext i32 %num_of_blocks.0 to i64
  %grid.sroa.0.sroa.0.0.insert.insert = or i64 %grid.sroa.0.sroa.0.0.insert.ext, 4294967296
  %threads.sroa.0.sroa.0.0.insert.ext = zext i32 %num_of_threads_per_block.0 to i64
  %threads.sroa.0.sroa.0.0.insert.insert = or i64 %threads.sroa.0.sroa.0.0.insert.ext, 4294967296
  %60 = bitcast %struct.timeval* %time.i248 to i8*
  %tv_sec.i251 = getelementptr inbounds %struct.timeval, %struct.timeval* %time.i248, i64 0, i32 0
  %tv_usec.i253 = getelementptr inbounds %struct.timeval, %struct.timeval* %time.i248, i64 0, i32 1
  %61 = bitcast %struct.timeval* %time.i to i8*
  br label %do.body, !dbg !1019, !llvm.loop !1020

do.body:                                          ; preds = %kcall.end128, %for.cond.cleanup95
  %k.0 = phi i32 [ 0, %for.cond.cleanup95 ], [ %inc134, %kcall.end128 ]
  %k1time.0 = phi double [ 0.000000e+00, %for.cond.cleanup95 ], [ %add, %kcall.end128 ]
  call void @llvm.dbg.value(metadata double %k1time.0, i64 0, metadata !815, metadata !658), !dbg !1013
  call void @llvm.dbg.value(metadata double undef, i64 0, metadata !816, metadata !658), !dbg !1014
  call void @llvm.dbg.value(metadata i32 %k.0, i64 0, metadata !817, metadata !658), !dbg !1015
  call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !818, metadata !658), !dbg !1017
  store i8 0, i8* %stop, align 1, !dbg !1022, !tbaa !883
  %62 = load i8*, i8** %d_over, align 8, !dbg !1023, !tbaa !660
  call void @llvm.dbg.value(metadata i8* %62, i64 0, metadata !789, metadata !658), !dbg !1006
  call void @llvm.dbg.value(metadata i8* %stop, i64 0, metadata !818, metadata !728), !dbg !1017
  %call115 = call i32 @cudaMemcpy(i8* %62, i8* nonnull %stop, i64 1, i32 1), !dbg !1024
  %call116 = call i32 @cudaDeviceSynchronize(), !dbg !1025
  call void @llvm.lifetime.start(i64 16, i8* nonnull %59) #8, !dbg !1026
  call void @llvm.dbg.value(metadata %struct.timeval* %time.i236, i64 0, metadata !719, metadata !728) #8, !dbg !1028
  %call.i237 = call i32 @gettimeofday(%struct.timeval* nonnull %time.i236, %struct.timezone* null) #8, !dbg !1029
  %tobool.i238 = icmp eq i32 %call.i237, 0, !dbg !1029
  br i1 %tobool.i238, label %if.end.i245, label %_Z8get_timev.exit247, !dbg !1030

if.end.i245:                                      ; preds = %do.body
  %63 = load i64, i64* %tv_sec.i239, align 8, !dbg !1031, !tbaa !734
  %conv.i240 = sitofp i64 %63 to double, !dbg !1032
  %64 = load i64, i64* %tv_usec.i241, align 8, !dbg !1033, !tbaa !739
  %conv1.i242 = sitofp i64 %64 to double, !dbg !1034
  %mul.i243 = fmul double %conv1.i242, 1.000000e-06, !dbg !1035
  %add.i244 = fadd double %mul.i243, %conv.i240, !dbg !1036
  br label %_Z8get_timev.exit247, !dbg !1037

_Z8get_timev.exit247:                             ; preds = %do.body, %if.end.i245
  %retval.0.i246 = phi double [ %add.i244, %if.end.i245 ], [ 0.000000e+00, %do.body ]
  call void @llvm.lifetime.end(i64 16, i8* nonnull %59) #8, !dbg !1038
  call void @llvm.dbg.value(metadata double %retval.0.i246, i64 0, metadata !819, metadata !658), !dbg !1039
  %call119 = call i32 @cudaConfigureCall(i64 %grid.sroa.0.sroa.0.0.insert.insert, i32 1, i64 %threads.sroa.0.sroa.0.0.insert.insert, i32 1, i64 0, %struct.CUstream_st* null), !dbg !1040
  %tobool120 = icmp eq i32 %call119, 0, !dbg !1040
  br i1 %tobool120, label %kcall.configok, label %kcall.end, !dbg !1041

kcall.configok:                                   ; preds = %_Z8get_timev.exit247
  %65 = load %struct.Node*, %struct.Node** %d_graph_nodes, align 8, !dbg !1042, !tbaa !660
  call void @llvm.dbg.value(metadata %struct.Node* %65, i64 0, metadata !780, metadata !658), !dbg !1044
  %66 = load i32*, i32** %d_graph_edges, align 8, !dbg !1045, !tbaa !660
  call void @llvm.dbg.value(metadata i32* %66, i64 0, metadata !781, metadata !658), !dbg !1046
  %67 = load i8*, i8** %d_graph_mask, align 8, !dbg !1047, !tbaa !660
  call void @llvm.dbg.value(metadata i8* %67, i64 0, metadata !782, metadata !658), !dbg !964
  %68 = load i8*, i8** %d_updating_graph_mask, align 8, !dbg !1048, !tbaa !660
  call void @llvm.dbg.value(metadata i8* %68, i64 0, metadata !783, metadata !658), !dbg !971
  %69 = load i8*, i8** %d_graph_visited, align 8, !dbg !1049, !tbaa !660
  call void @llvm.dbg.value(metadata i8* %69, i64 0, metadata !784, metadata !658), !dbg !978
  %70 = load i32*, i32** %d_cost, align 8, !dbg !1050, !tbaa !660
  call void @llvm.dbg.value(metadata i32* %70, i64 0, metadata !788, metadata !658), !dbg !1051
  %71 = load i32, i32* @no_of_nodes, align 4, !dbg !1052, !tbaa !670
  call void @_Z6KernelP4NodePiPbS2_S2_S1_i(%struct.Node* %65, i32* %66, i8* %67, i8* %68, i8* %69, i32* %70, i32 %71), !dbg !1053
  br label %kcall.end, !dbg !1053

kcall.end:                                        ; preds = %_Z8get_timev.exit247, %kcall.configok
  %call121 = call i32 @cudaDeviceSynchronize(), !dbg !1054
  call void @llvm.lifetime.start(i64 16, i8* nonnull %60) #8, !dbg !1055
  call void @llvm.dbg.value(metadata %struct.timeval* %time.i248, i64 0, metadata !719, metadata !728) #8, !dbg !1057
  %call.i249 = call i32 @gettimeofday(%struct.timeval* nonnull %time.i248, %struct.timezone* null) #8, !dbg !1058
  %tobool.i250 = icmp eq i32 %call.i249, 0, !dbg !1058
  br i1 %tobool.i250, label %if.end.i257, label %_Z8get_timev.exit259, !dbg !1059

if.end.i257:                                      ; preds = %kcall.end
  %72 = load i64, i64* %tv_sec.i251, align 8, !dbg !1060, !tbaa !734
  %conv.i252 = sitofp i64 %72 to double, !dbg !1061
  %73 = load i64, i64* %tv_usec.i253, align 8, !dbg !1062, !tbaa !739
  %conv1.i254 = sitofp i64 %73 to double, !dbg !1063
  %mul.i255 = fmul double %conv1.i254, 1.000000e-06, !dbg !1064
  %add.i256 = fadd double %mul.i255, %conv.i252, !dbg !1065
  br label %_Z8get_timev.exit259, !dbg !1066

_Z8get_timev.exit259:                             ; preds = %kcall.end, %if.end.i257
  %retval.0.i258 = phi double [ %add.i256, %if.end.i257 ], [ 0.000000e+00, %kcall.end ]
  call void @llvm.lifetime.end(i64 16, i8* nonnull %60) #8, !dbg !1067
  call void @llvm.dbg.value(metadata double %retval.0.i258, i64 0, metadata !821, metadata !658), !dbg !1068
  %call125 = call i32 @cudaConfigureCall(i64 %grid.sroa.0.sroa.0.0.insert.insert, i32 1, i64 %threads.sroa.0.sroa.0.0.insert.insert, i32 1, i64 0, %struct.CUstream_st* null), !dbg !1069
  %tobool126 = icmp eq i32 %call125, 0, !dbg !1069
  br i1 %tobool126, label %kcall.configok127, label %kcall.end128, !dbg !1070

kcall.configok127:                                ; preds = %_Z8get_timev.exit259
  %74 = load i8*, i8** %d_graph_mask, align 8, !dbg !1071, !tbaa !660
  call void @llvm.dbg.value(metadata i8* %74, i64 0, metadata !782, metadata !658), !dbg !964
  %75 = load i8*, i8** %d_updating_graph_mask, align 8, !dbg !1072, !tbaa !660
  call void @llvm.dbg.value(metadata i8* %75, i64 0, metadata !783, metadata !658), !dbg !971
  %76 = load i8*, i8** %d_graph_visited, align 8, !dbg !1073, !tbaa !660
  call void @llvm.dbg.value(metadata i8* %76, i64 0, metadata !784, metadata !658), !dbg !978
  %77 = load i8*, i8** %d_over, align 8, !dbg !1074, !tbaa !660
  call void @llvm.dbg.value(metadata i8* %77, i64 0, metadata !789, metadata !658), !dbg !1006
  %78 = load i32, i32* @no_of_nodes, align 4, !dbg !1075, !tbaa !670
  call void @_Z7Kernel2PbS_S_S_i(i8* %74, i8* %75, i8* %76, i8* %77, i32 %78), !dbg !1076
  br label %kcall.end128, !dbg !1076

kcall.end128:                                     ; preds = %_Z8get_timev.exit259, %kcall.configok127
  %call129 = call i32 @cudaDeviceSynchronize(), !dbg !1077
  call void @llvm.lifetime.start(i64 16, i8* nonnull %61) #8, !dbg !1078
  call void @llvm.dbg.value(metadata %struct.timeval* %time.i, i64 0, metadata !719, metadata !728) #8, !dbg !1080
  %call.i = call i32 @gettimeofday(%struct.timeval* nonnull %time.i, %struct.timezone* null) #8, !dbg !1081
  call void @llvm.lifetime.end(i64 16, i8* nonnull %61) #8, !dbg !1082
  %sub = fsub double %retval.0.i258, %retval.0.i246, !dbg !1083
  %add = fadd double %k1time.0, %sub, !dbg !1084
  call void @llvm.dbg.value(metadata double %add, i64 0, metadata !815, metadata !658), !dbg !1013
  %79 = load i8*, i8** %d_over, align 8, !dbg !1085, !tbaa !660
  call void @llvm.dbg.value(metadata i8* %79, i64 0, metadata !789, metadata !658), !dbg !1006
  call void @llvm.dbg.value(metadata i8* %stop, i64 0, metadata !818, metadata !728), !dbg !1017
  %call133 = call i32 @cudaMemcpy(i8* nonnull %stop, i8* %79, i64 1, i32 2), !dbg !1086
  %inc134 = add nuw nsw i32 %k.0, 1, !dbg !1087
  call void @llvm.dbg.value(metadata i32 %inc134, i64 0, metadata !817, metadata !658), !dbg !1015
  %80 = load i8, i8* %stop, align 1, !dbg !1088, !tbaa !883, !range !1089
  call void @llvm.dbg.value(metadata i8 %80, i64 0, metadata !818, metadata !658), !dbg !1017
  %tobool135 = icmp eq i8 %80, 0, !dbg !1088
  br i1 %tobool135, label %do.end, label %do.body, !dbg !1090, !llvm.loop !1020

do.end:                                           ; preds = %kcall.end128
  %81 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1091, !tbaa !660
  %call136 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %81, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.10, i64 0, i64 0), double %add) #10, !dbg !1092
  %call137 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.11, i64 0, i64 0), i32 %inc134), !dbg !1093
  %82 = load i8*, i8** %55, align 8, !dbg !1094, !tbaa !660
  %83 = load i32, i32* @no_of_nodes, align 4, !dbg !1095, !tbaa !670
  %conv138 = sext i32 %83 to i64, !dbg !1095
  %mul139 = shl nsw i64 %conv138, 2, !dbg !1096
  %call140 = call i32 @cudaMemcpy(i8* %call91, i8* %82, i64 %mul139, i32 2), !dbg !1097
  %call141 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.12, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.13, i64 0, i64 0)), !dbg !1098
  call void @llvm.dbg.value(metadata %struct._IO_FILE* %call141, i64 0, metadata !823, metadata !658), !dbg !1099
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !824, metadata !658), !dbg !1100
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !824, metadata !658), !dbg !1100
  %84 = load i32, i32* @no_of_nodes, align 4, !dbg !1101, !tbaa !670
  %cmp144285 = icmp sgt i32 %84, 0, !dbg !1104
  br i1 %cmp144285, label %for.body146.preheader, label %for.cond.cleanup145, !dbg !1105

for.body146.preheader:                            ; preds = %do.end
  br label %for.body146, !dbg !1107

for.cond.cleanup145.loopexit:                     ; preds = %for.body146
  br label %for.cond.cleanup145, !dbg !1108

for.cond.cleanup145:                              ; preds = %for.cond.cleanup145.loopexit, %do.end
  %call153 = call i32 @fclose(%struct._IO_FILE* %call141), !dbg !1108
  %puts232 = call i32 @puts(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @str.20, i64 0, i64 0)), !dbg !1109
  call void @free(i8* %call12) #8, !dbg !1110
  call void @free(i8* %call41) #8, !dbg !1111
  call void @free(i8* %call15) #8, !dbg !1112
  call void @free(i8* %call18) #8, !dbg !1113
  call void @free(i8* %call21) #8, !dbg !1114
  call void @free(i8* %call91) #8, !dbg !1115
  %85 = load i8*, i8** %26, align 8, !dbg !1116, !tbaa !660
  %call155 = call i32 @cudaFree(i8* %85), !dbg !1117
  %86 = load i8*, i8** %31, align 8, !dbg !1118, !tbaa !660
  %call156 = call i32 @cudaFree(i8* %86), !dbg !1119
  %87 = load i8*, i8** %d_graph_mask, align 8, !dbg !1120, !tbaa !660
  call void @llvm.dbg.value(metadata i8* %87, i64 0, metadata !782, metadata !658), !dbg !964
  %call157 = call i32 @cudaFree(i8* %87), !dbg !1121
  %88 = load i8*, i8** %d_updating_graph_mask, align 8, !dbg !1122, !tbaa !660
  call void @llvm.dbg.value(metadata i8* %88, i64 0, metadata !783, metadata !658), !dbg !971
  %call158 = call i32 @cudaFree(i8* %88), !dbg !1123
  %89 = load i8*, i8** %d_graph_visited, align 8, !dbg !1124, !tbaa !660
  call void @llvm.dbg.value(metadata i8* %89, i64 0, metadata !784, metadata !658), !dbg !978
  %call159 = call i32 @cudaFree(i8* %89), !dbg !1125
  %90 = load i8*, i8** %55, align 8, !dbg !1126, !tbaa !660
  %call160 = call i32 @cudaFree(i8* %90), !dbg !1127
  call void @llvm.dbg.value(metadata i8* %stop, i64 0, metadata !818, metadata !728), !dbg !1017
  call void @llvm.lifetime.end(i64 1, i8* nonnull %stop) #8, !dbg !1128
  call void @llvm.lifetime.end(i64 8, i8* nonnull %58) #8, !dbg !1128
  call void @llvm.lifetime.end(i64 8, i8* nonnull %54) #8, !dbg !1128
  call void @llvm.lifetime.end(i64 8, i8* nonnull %43) #8, !dbg !1128
  call void @llvm.lifetime.end(i64 8, i8* nonnull %39) #8, !dbg !1128
  call void @llvm.lifetime.end(i64 8, i8* nonnull %35) #8, !dbg !1128
  call void @llvm.lifetime.end(i64 8, i8* nonnull %30) #8, !dbg !1128
  call void @llvm.lifetime.end(i64 8, i8* nonnull %25) #8, !dbg !1128
  call void @llvm.lifetime.end(i64 4, i8* nonnull %9) #8, !dbg !1128
  call void @llvm.lifetime.end(i64 4, i8* nonnull %8) #8, !dbg !1128
  call void @llvm.lifetime.end(i64 4, i8* nonnull %5) #8, !dbg !1128
  call void @llvm.lifetime.end(i64 4, i8* nonnull %4) #8, !dbg !1128
  call void @llvm.lifetime.end(i64 4, i8* nonnull %1) #8, !dbg !1128
  br label %cleanup, !dbg !1128

for.body146:                                      ; preds = %for.body146.preheader, %for.body146
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body146 ], [ 0, %for.body146.preheader ]
  %arrayidx148 = getelementptr inbounds i32, i32* %48, i64 %indvars.iv, !dbg !1107
  %91 = load i32, i32* %arrayidx148, align 4, !dbg !1107, !tbaa !670
  %92 = trunc i64 %indvars.iv to i32, !dbg !1129
  %call149 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %call141, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.14, i64 0, i64 0), i32 %92, i32 %91), !dbg !1129
  %indvars.iv.next = add nuw i64 %indvars.iv, 1, !dbg !1130
  %93 = load i32, i32* @no_of_nodes, align 4, !dbg !1101, !tbaa !670
  %94 = sext i32 %93 to i64, !dbg !1104
  %cmp144 = icmp slt i64 %indvars.iv.next, %94, !dbg !1104
  br i1 %cmp144, label %for.body146, label %for.cond.cleanup145.loopexit, !dbg !1105, !llvm.loop !1132

cleanup:                                          ; preds = %for.cond.cleanup145, %if.then2
  ret void, !dbg !1135
}

; Function Attrs: nounwind uwtable
define void @_Z5UsageiPPc(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #1 !dbg !1137 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !1139, metadata !658), !dbg !1141
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !1140, metadata !658), !dbg !1142
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1143, !tbaa !660
  %1 = load i8*, i8** %argv, align 8, !dbg !1144, !tbaa !660
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str, i64 0, i64 0), i8* %1) #10, !dbg !1145
  ret void, !dbg !1146
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #5

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fscanf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fclose(%struct._IO_FILE* nocapture) local_unnamed_addr #3

declare i32 @cudaMalloc(i8**, i64) local_unnamed_addr #6

declare i32 @cudaMemcpy(i8*, i8*, i64, i32) local_unnamed_addr #6

declare i32 @cudaDeviceSetCacheConfig(i32) local_unnamed_addr #6

declare i32 @cudaDeviceSynchronize() local_unnamed_addr #6

declare i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) local_unnamed_addr #6

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

declare i32 @cudaFree(i8*) local_unnamed_addr #6

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #7

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #8

; Function Attrs: nounwind readnone
declare double @llvm.ceil.f64(double) #7

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #2

attributes #0 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { norecurse uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind readnone }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }
attributes #10 = { cold }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!643, !644}
!llvm.ident = !{!645}

!0 = !DIGlobalVariableExpression(var: !1)
!1 = distinct !DIGlobalVariable(name: "no_of_nodes", scope: !2, file: !3, line: 29, type: !21, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !3, producer: "clang version 5.0.0 (trunk 294196)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !19, globals: !32, imports: !94)
!3 = !DIFile(filename: "bfs.cu", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/bfsllvm")
!4 = !{!5, !13}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaMemcpyKind", file: !6, line: 796, size: 32, elements: !7, identifier: "_ZTS14cudaMemcpyKind")
!6 = !DIFile(filename: "/usr/local/cuda/include/driver_types.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/bfsllvm")
!7 = !{!8, !9, !10, !11, !12}
!8 = !DIEnumerator(name: "cudaMemcpyHostToHost", value: 0)
!9 = !DIEnumerator(name: "cudaMemcpyHostToDevice", value: 1)
!10 = !DIEnumerator(name: "cudaMemcpyDeviceToHost", value: 2)
!11 = !DIEnumerator(name: "cudaMemcpyDeviceToDevice", value: 3)
!12 = !DIEnumerator(name: "cudaMemcpyDefault", value: 4)
!13 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaFuncCache", file: !6, line: 1112, size: 32, elements: !14, identifier: "_ZTS13cudaFuncCache")
!14 = !{!15, !16, !17, !18}
!15 = !DIEnumerator(name: "cudaFuncCachePreferNone", value: 0)
!16 = !DIEnumerator(name: "cudaFuncCachePreferShared", value: 1)
!17 = !DIEnumerator(name: "cudaFuncCachePreferL1", value: 2)
!18 = !DIEnumerator(name: "cudaFuncCachePreferEqual", value: 3)
!19 = !{!20, !21, !22, !27, !29, !30}
!20 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!21 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Node", file: !3, line: 34, size: 64, elements: !24, identifier: "_ZTS4Node")
!24 = !{!25, !26}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "starting", scope: !23, file: !3, line: 36, baseType: !21, size: 32)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "no_of_edges", scope: !23, file: !3, line: 37, baseType: !21, size: 32, offset: 32)
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!28 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!30 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !31, size: 64)
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!32 = !{!0, !33, !35}
!33 = !DIGlobalVariableExpression(var: !34)
!34 = distinct !DIGlobalVariable(name: "edge_list_size", scope: !2, file: !3, line: 30, type: !21, isLocal: false, isDefinition: true)
!35 = !DIGlobalVariableExpression(var: !36)
!36 = distinct !DIGlobalVariable(name: "fp", scope: !2, file: !3, line: 31, type: !37, isLocal: false, isDefinition: true)
!37 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !38, size: 64)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !39, line: 48, baseType: !40)
!39 = !DIFile(filename: "/usr/include/stdio.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/bfsllvm")
!40 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !41, line: 245, size: 1728, elements: !42, identifier: "_ZTS8_IO_FILE")
!41 = !DIFile(filename: "/usr/include/libio.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/bfsllvm")
!42 = !{!43, !44, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !60, !62, !63, !64, !68, !70, !72, !76, !79, !81, !82, !83, !84, !85, !89, !90}
!43 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !40, file: !41, line: 246, baseType: !21, size: 32)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !40, file: !41, line: 251, baseType: !45, size: 64, offset: 64)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !46, size: 64)
!46 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !40, file: !41, line: 252, baseType: !45, size: 64, offset: 128)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !40, file: !41, line: 253, baseType: !45, size: 64, offset: 192)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !40, file: !41, line: 254, baseType: !45, size: 64, offset: 256)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !40, file: !41, line: 255, baseType: !45, size: 64, offset: 320)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !40, file: !41, line: 256, baseType: !45, size: 64, offset: 384)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !40, file: !41, line: 257, baseType: !45, size: 64, offset: 448)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !40, file: !41, line: 258, baseType: !45, size: 64, offset: 512)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !40, file: !41, line: 260, baseType: !45, size: 64, offset: 576)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !40, file: !41, line: 261, baseType: !45, size: 64, offset: 640)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !40, file: !41, line: 262, baseType: !45, size: 64, offset: 704)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !40, file: !41, line: 264, baseType: !58, size: 64, offset: 768)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !41, line: 160, flags: DIFlagFwdDecl, identifier: "_ZTS10_IO_marker")
!60 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !40, file: !41, line: 266, baseType: !61, size: 64, offset: 832)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !40, file: !41, line: 268, baseType: !21, size: 32, offset: 896)
!63 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !40, file: !41, line: 272, baseType: !21, size: 32, offset: 928)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !40, file: !41, line: 274, baseType: !65, size: 64, offset: 960)
!65 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !66, line: 131, baseType: !67)
!66 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/bfsllvm")
!67 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !40, file: !41, line: 278, baseType: !69, size: 16, offset: 1024)
!69 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!70 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !40, file: !41, line: 279, baseType: !71, size: 8, offset: 1040)
!71 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!72 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !40, file: !41, line: 280, baseType: !73, size: 8, offset: 1048)
!73 = !DICompositeType(tag: DW_TAG_array_type, baseType: !46, size: 8, elements: !74)
!74 = !{!75}
!75 = !DISubrange(count: 1)
!76 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !40, file: !41, line: 284, baseType: !77, size: 64, offset: 1088)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !41, line: 154, baseType: null)
!79 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !40, file: !41, line: 293, baseType: !80, size: 64, offset: 1152)
!80 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !66, line: 132, baseType: !67)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "__pad1", scope: !40, file: !41, line: 302, baseType: !31, size: 64, offset: 1216)
!82 = !DIDerivedType(tag: DW_TAG_member, name: "__pad2", scope: !40, file: !41, line: 303, baseType: !31, size: 64, offset: 1280)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "__pad3", scope: !40, file: !41, line: 304, baseType: !31, size: 64, offset: 1344)
!84 = !DIDerivedType(tag: DW_TAG_member, name: "__pad4", scope: !40, file: !41, line: 305, baseType: !31, size: 64, offset: 1408)
!85 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !40, file: !41, line: 306, baseType: !86, size: 64, offset: 1472)
!86 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !87, line: 62, baseType: !88)
!87 = !DIFile(filename: "/home/dshen/llvm/build/bin/../lib/clang/5.0.0/include/stddef.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/bfsllvm")
!88 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !40, file: !41, line: 308, baseType: !21, size: 32, offset: 1536)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !40, file: !41, line: 310, baseType: !91, size: 160, offset: 1568)
!91 = !DICompositeType(tag: DW_TAG_array_type, baseType: !46, size: 160, elements: !92)
!92 = !{!93}
!93 = !DISubrange(count: 20)
!94 = !{!95, !102, !107, !109, !111, !113, !115, !119, !121, !123, !125, !127, !129, !131, !133, !135, !137, !139, !141, !143, !145, !147, !151, !153, !155, !157, !161, !165, !167, !169, !173, !177, !179, !181, !183, !185, !187, !189, !191, !193, !197, !201, !203, !205, !209, !211, !213, !215, !217, !219, !223, !225, !227, !232, !238, !242, !244, !246, !250, !252, !254, !258, !260, !262, !266, !268, !270, !272, !274, !276, !278, !280, !282, !284, !289, !291, !293, !297, !299, !301, !303, !305, !307, !309, !311, !315, !319, !321, !323, !328, !330, !332, !334, !336, !338, !340, !344, !350, !354, !358, !363, !366, !370, !374, !385, !389, !393, !397, !401, !405, !407, !411, !415, !419, !427, !431, !435, !439, !443, !448, !454, !458, !462, !464, !472, !476, !484, !486, !488, !492, !496, !500, !505, !509, !514, !515, !516, !517, !520, !521, !522, !523, !524, !525, !526, !529, !531, !533, !535, !537, !539, !541, !543, !546, !548, !550, !552, !554, !556, !558, !560, !562, !564, !566, !568, !570, !572, !574, !576, !578, !580, !582, !584, !586, !588, !590, !592, !594, !596, !598, !600, !602, !604, !606, !608, !610, !614, !615, !617, !619, !621, !623, !625, !627, !629, !631, !633, !635, !637, !639, !641}
!95 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !98, line: 201)
!96 = !DINamespace(name: "std", scope: null, file: !97, line: 195)
!97 = !DIFile(filename: "/home/dshen/llvm/build/bin/../lib/clang/5.0.0/include/__clang_cuda_math_forward_declares.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/bfsllvm")
!98 = !DISubprogram(name: "abs", linkageName: "_ZL3absx", scope: !97, file: !97, line: 44, type: !99, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!99 = !DISubroutineType(types: !100)
!100 = !{!101, !101}
!101 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!102 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !103, line: 202)
!103 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !97, file: !97, line: 46, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!104 = !DISubroutineType(types: !105)
!105 = !{!106, !106}
!106 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!107 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !108, line: 203)
!108 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !97, file: !97, line: 48, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!109 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !110, line: 204)
!110 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !97, file: !97, line: 50, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!111 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !112, line: 205)
!112 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !97, file: !97, line: 52, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!113 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !114, line: 206)
!114 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !97, file: !97, line: 56, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!115 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !116, line: 207)
!116 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !97, file: !97, line: 54, type: !117, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!117 = !DISubroutineType(types: !118)
!118 = !{!106, !106, !106}
!119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !120, line: 208)
!120 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !97, file: !97, line: 58, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !122, line: 209)
!122 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !97, file: !97, line: 60, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !124, line: 210)
!124 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !97, file: !97, line: 62, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!125 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !126, line: 211)
!126 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !97, file: !97, line: 64, type: !117, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !128, line: 212)
!128 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !97, file: !97, line: 66, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!129 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !130, line: 213)
!130 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !97, file: !97, line: 68, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!131 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !132, line: 214)
!132 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !97, file: !97, line: 72, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!133 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !134, line: 215)
!134 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !97, file: !97, line: 70, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !136, line: 216)
!136 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !97, file: !97, line: 76, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !138, line: 217)
!138 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !97, file: !97, line: 74, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !140, line: 218)
!140 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !97, file: !97, line: 78, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !142, line: 219)
!142 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !97, file: !97, line: 80, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !144, line: 220)
!144 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !97, file: !97, line: 82, type: !117, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !146, line: 221)
!146 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !97, file: !97, line: 84, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !148, line: 222)
!148 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !97, file: !97, line: 86, type: !149, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!149 = !DISubroutineType(types: !150)
!150 = !{!106, !106, !106, !106}
!151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !152, line: 223)
!152 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !97, file: !97, line: 88, type: !117, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!153 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !154, line: 224)
!154 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !97, file: !97, line: 90, type: !117, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !156, line: 225)
!156 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !97, file: !97, line: 92, type: !117, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!157 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !158, line: 226)
!158 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !97, file: !97, line: 94, type: !159, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!159 = !DISubroutineType(types: !160)
!160 = !{!21, !106}
!161 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !162, line: 227)
!162 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !97, file: !97, line: 96, type: !163, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!163 = !DISubroutineType(types: !164)
!164 = !{!106, !106, !29}
!165 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !166, line: 228)
!166 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !97, file: !97, line: 98, type: !117, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!167 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !168, line: 229)
!168 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !97, file: !97, line: 100, type: !159, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!169 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !170, line: 230)
!170 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !97, file: !97, line: 102, type: !171, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!171 = !DISubroutineType(types: !172)
!172 = !{!28, !106}
!173 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !174, line: 231)
!174 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !97, file: !97, line: 106, type: !175, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!175 = !DISubroutineType(types: !176)
!176 = !{!28, !106, !106}
!177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !178, line: 232)
!178 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !97, file: !97, line: 105, type: !175, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !180, line: 233)
!180 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !97, file: !97, line: 108, type: !171, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!181 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !182, line: 234)
!182 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !97, file: !97, line: 112, type: !175, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !184, line: 235)
!184 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !97, file: !97, line: 111, type: !175, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !186, line: 236)
!186 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !97, file: !97, line: 114, type: !175, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !188, line: 237)
!188 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !97, file: !97, line: 116, type: !171, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!189 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !190, line: 238)
!190 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !97, file: !97, line: 118, type: !171, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !192, line: 239)
!192 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !97, file: !97, line: 120, type: !175, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!193 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !194, line: 240)
!194 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !97, file: !97, line: 121, type: !195, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!195 = !DISubroutineType(types: !196)
!196 = !{!67, !67}
!197 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !198, line: 241)
!198 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !97, file: !97, line: 123, type: !199, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!199 = !DISubroutineType(types: !200)
!200 = !{!106, !106, !21}
!201 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !202, line: 242)
!202 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !97, file: !97, line: 125, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !204, line: 243)
!204 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !97, file: !97, line: 126, type: !99, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!205 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !206, line: 244)
!206 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !97, file: !97, line: 128, type: !207, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!207 = !DISubroutineType(types: !208)
!208 = !{!101, !106}
!209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !210, line: 245)
!210 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !97, file: !97, line: 138, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!211 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !212, line: 246)
!212 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !97, file: !97, line: 130, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !214, line: 247)
!214 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !97, file: !97, line: 132, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !216, line: 248)
!216 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !97, file: !97, line: 134, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!217 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !218, line: 249)
!218 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !97, file: !97, line: 136, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!219 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !220, line: 250)
!220 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !97, file: !97, line: 140, type: !221, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!221 = !DISubroutineType(types: !222)
!222 = !{!67, !106}
!223 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !224, line: 251)
!224 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !97, file: !97, line: 142, type: !221, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!225 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !226, line: 252)
!226 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !97, file: !97, line: 143, type: !207, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !228, line: 253)
!228 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !97, file: !97, line: 145, type: !229, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!229 = !DISubroutineType(types: !230)
!230 = !{!106, !106, !231}
!231 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !106, size: 64)
!232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !233, line: 254)
!233 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !97, file: !97, line: 146, type: !234, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!234 = !DISubroutineType(types: !235)
!235 = !{!20, !236}
!236 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !237, size: 64)
!237 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !46)
!238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !239, line: 255)
!239 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !97, file: !97, line: 147, type: !240, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!240 = !DISubroutineType(types: !241)
!241 = !{!106, !236}
!242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !243, line: 256)
!243 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !97, file: !97, line: 149, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!244 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !245, line: 257)
!245 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !97, file: !97, line: 151, type: !117, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !247, line: 258)
!247 = !DISubprogram(name: "nexttoward", linkageName: "_ZL10nexttowardfd", scope: !97, file: !97, line: 153, type: !248, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!248 = !DISubroutineType(types: !249)
!249 = !{!106, !106, !20}
!250 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !251, line: 259)
!251 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !97, file: !97, line: 158, type: !199, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !253, line: 260)
!253 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !97, file: !97, line: 160, type: !117, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !255, line: 261)
!255 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !97, file: !97, line: 162, type: !256, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!256 = !DISubroutineType(types: !257)
!257 = !{!106, !106, !106, !29}
!258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !259, line: 262)
!259 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !97, file: !97, line: 164, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !261, line: 263)
!261 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !97, file: !97, line: 166, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!262 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !263, line: 264)
!263 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !97, file: !97, line: 168, type: !264, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!264 = !DISubroutineType(types: !265)
!265 = !{!106, !106, !67}
!266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !267, line: 265)
!267 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !97, file: !97, line: 170, type: !199, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !269, line: 266)
!269 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !97, file: !97, line: 172, type: !171, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!270 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !271, line: 267)
!271 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !97, file: !97, line: 174, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!272 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !273, line: 268)
!273 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !97, file: !97, line: 176, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!274 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !275, line: 269)
!275 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !97, file: !97, line: 178, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!276 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !277, line: 270)
!277 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !97, file: !97, line: 180, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !279, line: 271)
!279 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !97, file: !97, line: 182, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !281, line: 272)
!281 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !97, file: !97, line: 184, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !283, line: 273)
!283 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !97, file: !97, line: 186, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !285, line: 102)
!285 = !DISubprogram(name: "acos", scope: !286, file: !286, line: 54, type: !287, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!286 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/bfsllvm")
!287 = !DISubroutineType(types: !288)
!288 = !{!20, !20}
!289 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !290, line: 121)
!290 = !DISubprogram(name: "asin", scope: !286, file: !286, line: 56, type: !287, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!291 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !292, line: 140)
!292 = !DISubprogram(name: "atan", scope: !286, file: !286, line: 58, type: !287, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!293 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !294, line: 159)
!294 = !DISubprogram(name: "atan2", scope: !286, file: !286, line: 60, type: !295, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!295 = !DISubroutineType(types: !296)
!296 = !{!20, !20, !20}
!297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !298, line: 180)
!298 = !DISubprogram(name: "ceil", scope: !286, file: !286, line: 178, type: !287, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!299 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !300, line: 199)
!300 = !DISubprogram(name: "cos", scope: !286, file: !286, line: 63, type: !287, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!301 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !302, line: 218)
!302 = !DISubprogram(name: "cosh", scope: !286, file: !286, line: 72, type: !287, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!303 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !304, line: 237)
!304 = !DISubprogram(name: "exp", scope: !286, file: !286, line: 100, type: !287, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!305 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !306, line: 256)
!306 = !DISubprogram(name: "fabs", scope: !286, file: !286, line: 181, type: !287, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!307 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !308, line: 275)
!308 = !DISubprogram(name: "floor", scope: !286, file: !286, line: 184, type: !287, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!309 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !310, line: 294)
!310 = !DISubprogram(name: "fmod", scope: !286, file: !286, line: 187, type: !295, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!311 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !312, line: 315)
!312 = !DISubprogram(name: "frexp", scope: !286, file: !286, line: 103, type: !313, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!313 = !DISubroutineType(types: !314)
!314 = !{!20, !20, !29}
!315 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !316, line: 334)
!316 = !DISubprogram(name: "ldexp", scope: !286, file: !286, line: 106, type: !317, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!317 = !DISubroutineType(types: !318)
!318 = !{!20, !20, !21}
!319 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !320, line: 353)
!320 = !DISubprogram(name: "log", scope: !286, file: !286, line: 109, type: !287, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!321 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !322, line: 372)
!322 = !DISubprogram(name: "log10", scope: !286, file: !286, line: 112, type: !287, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!323 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !324, line: 391)
!324 = !DISubprogram(name: "modf", scope: !286, file: !286, line: 115, type: !325, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!325 = !DISubroutineType(types: !326)
!326 = !{!20, !20, !327}
!327 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!328 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !329, line: 403)
!329 = !DISubprogram(name: "pow", scope: !286, file: !286, line: 153, type: !295, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!330 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !331, line: 440)
!331 = !DISubprogram(name: "sin", scope: !286, file: !286, line: 65, type: !287, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!332 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !333, line: 459)
!333 = !DISubprogram(name: "sinh", scope: !286, file: !286, line: 74, type: !287, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!334 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !335, line: 478)
!335 = !DISubprogram(name: "sqrt", scope: !286, file: !286, line: 156, type: !287, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!336 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !337, line: 497)
!337 = !DISubprogram(name: "tan", scope: !286, file: !286, line: 67, type: !287, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!338 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !339, line: 516)
!339 = !DISubprogram(name: "tanh", scope: !286, file: !286, line: 76, type: !287, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!340 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !341, line: 118)
!341 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !342, line: 101, baseType: !343)
!342 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/bfsllvm")
!343 = !DICompositeType(tag: DW_TAG_structure_type, file: !342, line: 97, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!344 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !345, line: 119)
!345 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !342, line: 109, baseType: !346)
!346 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !342, line: 105, size: 128, elements: !347, identifier: "_ZTS6ldiv_t")
!347 = !{!348, !349}
!348 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !346, file: !342, line: 107, baseType: !67, size: 64)
!349 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !346, file: !342, line: 108, baseType: !67, size: 64, offset: 64)
!350 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !351, line: 121)
!351 = !DISubprogram(name: "abort", scope: !342, file: !342, line: 515, type: !352, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: true)
!352 = !DISubroutineType(types: !353)
!353 = !{null}
!354 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !355, line: 122)
!355 = !DISubprogram(name: "abs", scope: !342, file: !342, line: 775, type: !356, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!356 = !DISubroutineType(types: !357)
!357 = !{!21, !21}
!358 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !359, line: 123)
!359 = !DISubprogram(name: "atexit", scope: !342, file: !342, line: 519, type: !360, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!360 = !DISubroutineType(types: !361)
!361 = !{!21, !362}
!362 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !352, size: 64)
!363 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !364, line: 129)
!364 = !DISubprogram(name: "atof", scope: !365, file: !365, line: 26, type: !234, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!365 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/bfsllvm")
!366 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !367, line: 130)
!367 = !DISubprogram(name: "atoi", scope: !342, file: !342, line: 278, type: !368, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!368 = !DISubroutineType(types: !369)
!369 = !{!21, !236}
!370 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !371, line: 131)
!371 = !DISubprogram(name: "atol", scope: !342, file: !342, line: 283, type: !372, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!372 = !DISubroutineType(types: !373)
!373 = !{!67, !236}
!374 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !375, line: 132)
!375 = !DISubprogram(name: "bsearch", scope: !376, file: !376, line: 20, type: !377, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!376 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdlib-bsearch.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/bfsllvm")
!377 = !DISubroutineType(types: !378)
!378 = !{!31, !379, !379, !86, !86, !381}
!379 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !380, size: 64)
!380 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!381 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !342, line: 742, baseType: !382)
!382 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !383, size: 64)
!383 = !DISubroutineType(types: !384)
!384 = !{!21, !379, !379}
!385 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !386, line: 133)
!386 = !DISubprogram(name: "calloc", scope: !342, file: !342, line: 468, type: !387, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!387 = !DISubroutineType(types: !388)
!388 = !{!31, !86, !86}
!389 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !390, line: 134)
!390 = !DISubprogram(name: "div", scope: !342, file: !342, line: 789, type: !391, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!391 = !DISubroutineType(types: !392)
!392 = !{!341, !21, !21}
!393 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !394, line: 135)
!394 = !DISubprogram(name: "exit", scope: !342, file: !342, line: 543, type: !395, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: true)
!395 = !DISubroutineType(types: !396)
!396 = !{null, !21}
!397 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !398, line: 136)
!398 = !DISubprogram(name: "free", scope: !342, file: !342, line: 483, type: !399, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!399 = !DISubroutineType(types: !400)
!400 = !{null, !31}
!401 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !402, line: 137)
!402 = !DISubprogram(name: "getenv", scope: !342, file: !342, line: 564, type: !403, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!403 = !DISubroutineType(types: !404)
!404 = !{!45, !236}
!405 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !406, line: 138)
!406 = !DISubprogram(name: "labs", scope: !342, file: !342, line: 776, type: !195, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!407 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !408, line: 139)
!408 = !DISubprogram(name: "ldiv", scope: !342, file: !342, line: 791, type: !409, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!409 = !DISubroutineType(types: !410)
!410 = !{!345, !67, !67}
!411 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !412, line: 140)
!412 = !DISubprogram(name: "malloc", scope: !342, file: !342, line: 466, type: !413, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!413 = !DISubroutineType(types: !414)
!414 = !{!31, !86}
!415 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !416, line: 142)
!416 = !DISubprogram(name: "mblen", scope: !342, file: !342, line: 863, type: !417, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!417 = !DISubroutineType(types: !418)
!418 = !{!21, !236, !86}
!419 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !420, line: 143)
!420 = !DISubprogram(name: "mbstowcs", scope: !342, file: !342, line: 874, type: !421, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!421 = !DISubroutineType(types: !422)
!422 = !{!86, !423, !426, !86}
!423 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !424)
!424 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !425, size: 64)
!425 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!426 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !236)
!427 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !428, line: 144)
!428 = !DISubprogram(name: "mbtowc", scope: !342, file: !342, line: 866, type: !429, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!429 = !DISubroutineType(types: !430)
!430 = !{!21, !423, !426, !86}
!431 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !432, line: 146)
!432 = !DISubprogram(name: "qsort", scope: !342, file: !342, line: 765, type: !433, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!433 = !DISubroutineType(types: !434)
!434 = !{null, !31, !86, !86, !381}
!435 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !436, line: 152)
!436 = !DISubprogram(name: "rand", scope: !342, file: !342, line: 374, type: !437, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!437 = !DISubroutineType(types: !438)
!438 = !{!21}
!439 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !440, line: 153)
!440 = !DISubprogram(name: "realloc", scope: !342, file: !342, line: 480, type: !441, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!441 = !DISubroutineType(types: !442)
!442 = !{!31, !31, !86}
!443 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !444, line: 154)
!444 = !DISubprogram(name: "srand", scope: !342, file: !342, line: 376, type: !445, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!445 = !DISubroutineType(types: !446)
!446 = !{null, !447}
!447 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!448 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !449, line: 155)
!449 = !DISubprogram(name: "strtod", scope: !342, file: !342, line: 164, type: !450, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!450 = !DISubroutineType(types: !451)
!451 = !{!20, !426, !452}
!452 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !453)
!453 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64)
!454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !455, line: 156)
!455 = !DISubprogram(name: "strtol", scope: !342, file: !342, line: 183, type: !456, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!456 = !DISubroutineType(types: !457)
!457 = !{!67, !426, !452, !21}
!458 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !459, line: 157)
!459 = !DISubprogram(name: "strtoul", scope: !342, file: !342, line: 187, type: !460, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!460 = !DISubroutineType(types: !461)
!461 = !{!88, !426, !452, !21}
!462 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !463, line: 158)
!463 = !DISubprogram(name: "system", scope: !342, file: !342, line: 717, type: !368, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!464 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !465, line: 160)
!465 = !DISubprogram(name: "wcstombs", scope: !342, file: !342, line: 877, type: !466, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!466 = !DISubroutineType(types: !467)
!467 = !{!86, !468, !469, !86}
!468 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !45)
!469 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !470)
!470 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !471, size: 64)
!471 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !425)
!472 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !473, line: 161)
!473 = !DISubprogram(name: "wctomb", scope: !342, file: !342, line: 870, type: !474, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!474 = !DISubroutineType(types: !475)
!475 = !{!21, !45, !425}
!476 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !477, entity: !479, line: 201)
!477 = !DINamespace(name: "__gnu_cxx", scope: null, file: !478, line: 68)
!478 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/bits/cpp_type_traits.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/bfsllvm")
!479 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !342, line: 121, baseType: !480)
!480 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !342, line: 117, size: 128, elements: !481, identifier: "_ZTS7lldiv_t")
!481 = !{!482, !483}
!482 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !480, file: !342, line: 119, baseType: !101, size: 64)
!483 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !480, file: !342, line: 120, baseType: !101, size: 64, offset: 64)
!484 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !477, entity: !485, line: 207)
!485 = !DISubprogram(name: "_Exit", scope: !342, file: !342, line: 557, type: !395, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: true)
!486 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !477, entity: !487, line: 211)
!487 = !DISubprogram(name: "llabs", scope: !342, file: !342, line: 780, type: !99, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!488 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !477, entity: !489, line: 217)
!489 = !DISubprogram(name: "lldiv", scope: !342, file: !342, line: 797, type: !490, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!490 = !DISubroutineType(types: !491)
!491 = !{!479, !101, !101}
!492 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !477, entity: !493, line: 228)
!493 = !DISubprogram(name: "atoll", scope: !342, file: !342, line: 292, type: !494, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!494 = !DISubroutineType(types: !495)
!495 = !{!101, !236}
!496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !477, entity: !497, line: 229)
!497 = !DISubprogram(name: "strtoll", scope: !342, file: !342, line: 209, type: !498, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!498 = !DISubroutineType(types: !499)
!499 = !{!101, !426, !452, !21}
!500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !477, entity: !501, line: 230)
!501 = !DISubprogram(name: "strtoull", scope: !342, file: !342, line: 214, type: !502, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!502 = !DISubroutineType(types: !503)
!503 = !{!504, !426, !452, !21}
!504 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!505 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !477, entity: !506, line: 232)
!506 = !DISubprogram(name: "strtof", scope: !342, file: !342, line: 172, type: !507, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!507 = !DISubroutineType(types: !508)
!508 = !{!106, !426, !452}
!509 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !477, entity: !510, line: 233)
!510 = !DISubprogram(name: "strtold", scope: !342, file: !342, line: 175, type: !511, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!511 = !DISubroutineType(types: !512)
!512 = !{!513, !426, !452}
!513 = !DIBasicType(name: "long double", size: 128, encoding: DW_ATE_float)
!514 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !479, line: 241)
!515 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !485, line: 243)
!516 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !487, line: 245)
!517 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !518, line: 246)
!518 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !477, file: !519, line: 214, type: !490, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!519 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/cstdlib", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/bfsllvm")
!520 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !489, line: 247)
!521 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !493, line: 249)
!522 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !506, line: 250)
!523 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !497, line: 251)
!524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !501, line: 252)
!525 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !510, line: 253)
!526 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !527, line: 418)
!527 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !528, file: !528, line: 1126, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!528 = !DIFile(filename: "/usr/local/cuda/include/math_functions.hpp", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/bfsllvm")
!529 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !530, line: 419)
!530 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !528, file: !528, line: 1154, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!531 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !532, line: 420)
!532 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !528, file: !528, line: 1121, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!533 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !534, line: 421)
!534 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !528, file: !528, line: 1159, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!535 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !536, line: 422)
!536 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !528, file: !528, line: 1111, type: !117, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!537 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !538, line: 423)
!538 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !528, file: !528, line: 1116, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!539 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !540, line: 424)
!540 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !528, file: !528, line: 1164, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!541 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !542, line: 425)
!542 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !528, file: !528, line: 1199, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!543 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !544, line: 426)
!544 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !545, file: !545, line: 647, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!545 = !DIFile(filename: "/usr/local/cuda/include/device_functions.hpp", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/bfsllvm")
!546 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !547, line: 427)
!547 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !528, file: !528, line: 973, type: !117, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!548 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !549, line: 428)
!549 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !528, file: !528, line: 1027, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!550 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !551, line: 429)
!551 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !528, file: !528, line: 1096, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!552 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !553, line: 430)
!553 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !528, file: !528, line: 1259, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!554 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !555, line: 431)
!555 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !528, file: !528, line: 1249, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!556 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !557, line: 432)
!557 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !545, file: !545, line: 637, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!558 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !559, line: 433)
!559 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !528, file: !528, line: 1078, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!560 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !561, line: 434)
!561 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !528, file: !528, line: 1169, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!562 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !563, line: 435)
!563 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !545, file: !545, line: 582, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!564 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !565, line: 436)
!565 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !528, file: !528, line: 1385, type: !117, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!566 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !567, line: 437)
!567 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !545, file: !545, line: 572, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!568 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !569, line: 438)
!569 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !528, file: !528, line: 1337, type: !149, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!570 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !571, line: 439)
!571 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !545, file: !545, line: 602, type: !117, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!572 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !573, line: 440)
!573 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !545, file: !545, line: 597, type: !117, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!574 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !575, line: 441)
!575 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !528, file: !528, line: 1322, type: !117, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!576 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !577, line: 442)
!577 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !528, file: !528, line: 1312, type: !163, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!578 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !579, line: 443)
!579 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !528, file: !528, line: 1174, type: !117, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!580 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !581, line: 444)
!581 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !528, file: !528, line: 1390, type: !159, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!582 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !583, line: 445)
!583 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !528, file: !528, line: 1289, type: !199, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!584 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !585, line: 446)
!585 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !528, file: !528, line: 1284, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!586 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !587, line: 447)
!587 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !528, file: !528, line: 933, type: !207, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!588 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !589, line: 448)
!589 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !528, file: !528, line: 1371, type: !207, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!590 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !591, line: 449)
!591 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !528, file: !528, line: 1140, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!592 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !593, line: 450)
!593 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !528, file: !528, line: 1149, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!594 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !595, line: 451)
!595 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !528, file: !528, line: 1069, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!596 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !597, line: 452)
!597 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !528, file: !528, line: 1395, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!598 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !599, line: 453)
!599 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !528, file: !528, line: 1131, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!600 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !601, line: 454)
!601 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !528, file: !528, line: 924, type: !221, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!602 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !603, line: 455)
!603 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !528, file: !528, line: 1376, type: !221, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!604 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !605, line: 456)
!605 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !528, file: !528, line: 1317, type: !229, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!606 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !607, line: 457)
!607 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !528, file: !528, line: 938, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!608 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !609, line: 458)
!609 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !528, file: !528, line: 1002, type: !117, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!610 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !611, line: 459)
!611 = !DISubprogram(name: "nexttowardf", scope: !286, file: !286, line: 284, type: !612, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!612 = !DISubroutineType(types: !613)
!613 = !{!106, !106, !513}
!614 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !611, line: 460)
!615 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !616, line: 461)
!616 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !528, file: !528, line: 1352, type: !117, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!617 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !618, line: 462)
!618 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !528, file: !528, line: 1327, type: !117, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!619 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !620, line: 463)
!620 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !528, file: !528, line: 1332, type: !256, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!621 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !622, line: 464)
!622 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !528, file: !528, line: 919, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!623 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !624, line: 465)
!624 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !528, file: !528, line: 1366, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!625 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !626, line: 466)
!626 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !528, file: !528, line: 1299, type: !264, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!627 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !628, line: 467)
!628 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !528, file: !528, line: 1294, type: !199, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!629 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !630, line: 468)
!630 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !528, file: !528, line: 1018, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!631 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !632, line: 469)
!632 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !528, file: !528, line: 1101, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!633 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !634, line: 470)
!634 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !545, file: !545, line: 887, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!635 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !636, line: 471)
!636 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !528, file: !528, line: 1060, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!637 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !638, line: 472)
!638 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !528, file: !528, line: 1106, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!639 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !640, line: 473)
!640 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !528, file: !528, line: 1361, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!641 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !96, entity: !642, line: 474)
!642 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !545, file: !545, line: 642, type: !104, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!643 = !{i32 2, !"Dwarf Version", i32 4}
!644 = !{i32 2, !"Debug Info Version", i32 3}
!645 = !{!"clang version 5.0.0 (trunk 294196)"}
!646 = distinct !DISubprogram(name: "Kernel", linkageName: "_Z6KernelP4NodePiPbS2_S2_S1_i", scope: !647, file: !647, line: 23, type: !648, isLocal: false, isDefinition: true, scopeLine: 24, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !650)
!647 = !DIFile(filename: "./kernel.cu", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/bfsllvm")
!648 = !DISubroutineType(types: !649)
!649 = !{null, !22, !29, !27, !27, !27, !29, !21}
!650 = !{!651, !652, !653, !654, !655, !656, !657}
!651 = !DILocalVariable(name: "g_graph_nodes", arg: 1, scope: !646, file: !647, line: 23, type: !22)
!652 = !DILocalVariable(name: "g_graph_edges", arg: 2, scope: !646, file: !647, line: 23, type: !29)
!653 = !DILocalVariable(name: "g_graph_mask", arg: 3, scope: !646, file: !647, line: 23, type: !27)
!654 = !DILocalVariable(name: "g_updating_graph_mask", arg: 4, scope: !646, file: !647, line: 23, type: !27)
!655 = !DILocalVariable(name: "g_graph_visited", arg: 5, scope: !646, file: !647, line: 23, type: !27)
!656 = !DILocalVariable(name: "g_cost", arg: 6, scope: !646, file: !647, line: 23, type: !29)
!657 = !DILocalVariable(name: "no_of_nodes", arg: 7, scope: !646, file: !647, line: 23, type: !21)
!658 = !DIExpression()
!659 = !DILocation(line: 23, column: 15, scope: !646)
!660 = !{!661, !661, i64 0}
!661 = !{!"any pointer", !662, i64 0}
!662 = !{!"omnipotent char", !663, i64 0}
!663 = !{!"Simple C++ TBAA"}
!664 = !DILocation(line: 23, column: 35, scope: !646)
!665 = !DILocation(line: 23, column: 56, scope: !646)
!666 = !DILocation(line: 23, column: 76, scope: !646)
!667 = !DILocation(line: 23, column: 105, scope: !646)
!668 = !DILocation(line: 23, column: 127, scope: !646)
!669 = !DILocation(line: 23, column: 139, scope: !646)
!670 = !{!671, !671, i64 0}
!671 = !{!"int", !662, i64 0}
!672 = !DILocation(line: 24, column: 1, scope: !646)
!673 = !DILocation(line: 24, column: 1, scope: !674)
!674 = !DILexicalBlockFile(scope: !646, file: !647, discriminator: 1)
!675 = !DILocation(line: 24, column: 1, scope: !676)
!676 = !DILexicalBlockFile(scope: !646, file: !647, discriminator: 2)
!677 = !DILocation(line: 24, column: 1, scope: !678)
!678 = !DILexicalBlockFile(scope: !646, file: !647, discriminator: 3)
!679 = !DILocation(line: 24, column: 1, scope: !680)
!680 = !DILexicalBlockFile(scope: !646, file: !647, discriminator: 4)
!681 = !DILocation(line: 24, column: 1, scope: !682)
!682 = !DILexicalBlockFile(scope: !646, file: !647, discriminator: 5)
!683 = !DILocation(line: 24, column: 1, scope: !684)
!684 = !DILexicalBlockFile(scope: !646, file: !647, discriminator: 6)
!685 = !DILocation(line: 24, column: 1, scope: !686)
!686 = !DILexicalBlockFile(scope: !646, file: !647, discriminator: 7)
!687 = !DILocation(line: 40, column: 1, scope: !646)
!688 = distinct !DISubprogram(name: "Kernel2", linkageName: "_Z7Kernel2PbS_S_S_i", scope: !689, file: !689, line: 22, type: !690, isLocal: false, isDefinition: true, scopeLine: 23, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !692)
!689 = !DIFile(filename: "./kernel2.cu", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/bfsllvm")
!690 = !DISubroutineType(types: !691)
!691 = !{null, !27, !27, !27, !27, !21}
!692 = !{!693, !694, !695, !696, !697}
!693 = !DILocalVariable(name: "g_graph_mask", arg: 1, scope: !688, file: !689, line: 22, type: !27)
!694 = !DILocalVariable(name: "g_updating_graph_mask", arg: 2, scope: !688, file: !689, line: 22, type: !27)
!695 = !DILocalVariable(name: "g_graph_visited", arg: 3, scope: !688, file: !689, line: 22, type: !27)
!696 = !DILocalVariable(name: "g_over", arg: 4, scope: !688, file: !689, line: 22, type: !27)
!697 = !DILocalVariable(name: "no_of_nodes", arg: 5, scope: !688, file: !689, line: 22, type: !21)
!698 = !DILocation(line: 22, column: 16, scope: !688)
!699 = !DILocation(line: 22, column: 36, scope: !688)
!700 = !DILocation(line: 22, column: 65, scope: !688)
!701 = !DILocation(line: 22, column: 88, scope: !688)
!702 = !DILocation(line: 22, column: 100, scope: !688)
!703 = !DILocation(line: 23, column: 1, scope: !688)
!704 = !DILocation(line: 23, column: 1, scope: !705)
!705 = !DILexicalBlockFile(scope: !688, file: !689, discriminator: 1)
!706 = !DILocation(line: 23, column: 1, scope: !707)
!707 = !DILexicalBlockFile(scope: !688, file: !689, discriminator: 2)
!708 = !DILocation(line: 23, column: 1, scope: !709)
!709 = !DILexicalBlockFile(scope: !688, file: !689, discriminator: 3)
!710 = !DILocation(line: 23, column: 1, scope: !711)
!711 = !DILexicalBlockFile(scope: !688, file: !689, discriminator: 4)
!712 = !DILocation(line: 23, column: 1, scope: !713)
!713 = !DILexicalBlockFile(scope: !688, file: !689, discriminator: 5)
!714 = !DILocation(line: 33, column: 1, scope: !688)
!715 = distinct !DISubprogram(name: "get_time", linkageName: "_Z8get_timev", scope: !3, file: !3, line: 43, type: !716, isLocal: false, isDefinition: true, scopeLine: 43, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !718)
!716 = !DISubroutineType(types: !717)
!717 = !{!20}
!718 = !{!719}
!719 = !DILocalVariable(name: "time", scope: !715, file: !3, line: 44, type: !720)
!720 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timeval", file: !721, line: 30, size: 128, elements: !722, identifier: "_ZTS7timeval")
!721 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/time.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/bfsllvm")
!722 = !{!723, !725}
!723 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !720, file: !721, line: 32, baseType: !724, size: 64)
!724 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !66, line: 139, baseType: !67)
!725 = !DIDerivedType(tag: DW_TAG_member, name: "tv_usec", scope: !720, file: !721, line: 33, baseType: !726, size: 64, offset: 64)
!726 = !DIDerivedType(tag: DW_TAG_typedef, name: "__suseconds_t", file: !66, line: 141, baseType: !67)
!727 = !DILocation(line: 44, column: 5, scope: !715)
!728 = !DIExpression(DW_OP_deref)
!729 = !DILocation(line: 44, column: 20, scope: !715)
!730 = !DILocation(line: 45, column: 9, scope: !731)
!731 = distinct !DILexicalBlock(scope: !715, file: !3, line: 45, column: 9)
!732 = !DILocation(line: 45, column: 9, scope: !715)
!733 = !DILocation(line: 49, column: 25, scope: !715)
!734 = !{!735, !736, i64 0}
!735 = !{!"_ZTS7timeval", !736, i64 0, !736, i64 8}
!736 = !{!"long", !662, i64 0}
!737 = !DILocation(line: 49, column: 20, scope: !715)
!738 = !DILocation(line: 49, column: 47, scope: !715)
!739 = !{!735, !736, i64 8}
!740 = !DILocation(line: 49, column: 42, scope: !715)
!741 = !DILocation(line: 49, column: 55, scope: !715)
!742 = !DILocation(line: 49, column: 32, scope: !715)
!743 = !DILocation(line: 49, column: 5, scope: !715)
!744 = !DILocation(line: 50, column: 1, scope: !715)
!745 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 57, type: !746, isLocal: false, isDefinition: true, scopeLine: 58, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !748)
!746 = !DISubroutineType(types: !747)
!747 = !{!21, !21, !453}
!748 = !{!749, !750}
!749 = !DILocalVariable(name: "argc", arg: 1, scope: !745, file: !3, line: 57, type: !21)
!750 = !DILocalVariable(name: "argv", arg: 2, scope: !745, file: !3, line: 57, type: !453)
!751 = !DILocation(line: 57, column: 15, scope: !745)
!752 = !DILocation(line: 57, column: 28, scope: !745)
!753 = !DILocation(line: 61, column: 13, scope: !745)
!754 = !DILocation(line: 62, column: 16, scope: !745)
!755 = !DILocation(line: 63, column: 2, scope: !745)
!756 = !DILocation(line: 65, column: 1, scope: !745)
!757 = distinct !DISubprogram(name: "BFSGraph", linkageName: "_Z8BFSGraphiPPc", scope: !3, file: !3, line: 75, type: !758, isLocal: false, isDefinition: true, scopeLine: 76, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !760)
!758 = !DISubroutineType(types: !759)
!759 = !{null, !21, !453}
!760 = !{!761, !762, !763, !764, !765, !766, !767, !768, !769, !770, !771, !772, !773, !775, !776, !777, !778, !780, !781, !782, !783, !784, !785, !786, !788, !789, !790, !814, !815, !816, !817, !818, !819, !821, !822, !823, !824}
!761 = !DILocalVariable(name: "argc", arg: 1, scope: !757, file: !3, line: 75, type: !21)
!762 = !DILocalVariable(name: "argv", arg: 2, scope: !757, file: !3, line: 75, type: !453)
!763 = !DILocalVariable(name: "input_f", scope: !757, file: !3, line: 78, type: !45)
!764 = !DILocalVariable(name: "source", scope: !757, file: !3, line: 94, type: !21)
!765 = !DILocalVariable(name: "num_of_blocks", scope: !757, file: !3, line: 98, type: !21)
!766 = !DILocalVariable(name: "num_of_threads_per_block", scope: !757, file: !3, line: 99, type: !21)
!767 = !DILocalVariable(name: "h_graph_nodes", scope: !757, file: !3, line: 110, type: !22)
!768 = !DILocalVariable(name: "h_graph_mask", scope: !757, file: !3, line: 111, type: !27)
!769 = !DILocalVariable(name: "h_updating_graph_mask", scope: !757, file: !3, line: 112, type: !27)
!770 = !DILocalVariable(name: "h_graph_visited", scope: !757, file: !3, line: 113, type: !27)
!771 = !DILocalVariable(name: "start", scope: !757, file: !3, line: 115, type: !21)
!772 = !DILocalVariable(name: "edgeno", scope: !757, file: !3, line: 115, type: !21)
!773 = !DILocalVariable(name: "i", scope: !774, file: !3, line: 117, type: !447)
!774 = distinct !DILexicalBlock(scope: !757, file: !3, line: 117, column: 2)
!775 = !DILocalVariable(name: "id", scope: !757, file: !3, line: 137, type: !21)
!776 = !DILocalVariable(name: "cost", scope: !757, file: !3, line: 137, type: !21)
!777 = !DILocalVariable(name: "h_graph_edges", scope: !757, file: !3, line: 138, type: !29)
!778 = !DILocalVariable(name: "i", scope: !779, file: !3, line: 139, type: !21)
!779 = distinct !DILexicalBlock(scope: !757, file: !3, line: 139, column: 2)
!780 = !DILocalVariable(name: "d_graph_nodes", scope: !757, file: !3, line: 152, type: !22)
!781 = !DILocalVariable(name: "d_graph_edges", scope: !757, file: !3, line: 157, type: !29)
!782 = !DILocalVariable(name: "d_graph_mask", scope: !757, file: !3, line: 162, type: !27)
!783 = !DILocalVariable(name: "d_updating_graph_mask", scope: !757, file: !3, line: 166, type: !27)
!784 = !DILocalVariable(name: "d_graph_visited", scope: !757, file: !3, line: 171, type: !27)
!785 = !DILocalVariable(name: "h_cost", scope: !757, file: !3, line: 176, type: !29)
!786 = !DILocalVariable(name: "i", scope: !787, file: !3, line: 177, type: !21)
!787 = distinct !DILexicalBlock(scope: !757, file: !3, line: 177, column: 2)
!788 = !DILocalVariable(name: "d_cost", scope: !757, file: !3, line: 182, type: !29)
!789 = !DILocalVariable(name: "d_over", scope: !757, file: !3, line: 187, type: !27)
!790 = !DILocalVariable(name: "grid", scope: !757, file: !3, line: 193, type: !791)
!791 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !792, line: 427, baseType: !793)
!792 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/bfsllvm")
!793 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !792, line: 417, size: 96, elements: !794, identifier: "_ZTS4dim3")
!794 = !{!795, !796, !797, !798, !802, !811}
!795 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !793, file: !792, line: 419, baseType: !447, size: 32)
!796 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !793, file: !792, line: 419, baseType: !447, size: 32, offset: 32)
!797 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !793, file: !792, line: 419, baseType: !447, size: 32, offset: 64)
!798 = !DISubprogram(name: "dim3", scope: !793, file: !792, line: 421, type: !799, isLocal: false, isDefinition: false, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: true)
!799 = !DISubroutineType(types: !800)
!800 = !{null, !801, !447, !447, !447}
!801 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !793, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!802 = !DISubprogram(name: "dim3", scope: !793, file: !792, line: 422, type: !803, isLocal: false, isDefinition: false, scopeLine: 422, flags: DIFlagPrototyped, isOptimized: true)
!803 = !DISubroutineType(types: !804)
!804 = !{null, !801, !805}
!805 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !792, line: 383, baseType: !806)
!806 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !792, line: 190, size: 96, elements: !807, identifier: "_ZTS5uint3")
!807 = !{!808, !809, !810}
!808 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !806, file: !792, line: 192, baseType: !447, size: 32)
!809 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !806, file: !792, line: 192, baseType: !447, size: 32, offset: 32)
!810 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !806, file: !792, line: 192, baseType: !447, size: 32, offset: 64)
!811 = !DISubprogram(name: "operator uint3", linkageName: "_ZN4dim3cv5uint3Ev", scope: !793, file: !792, line: 423, type: !812, isLocal: false, isDefinition: false, scopeLine: 423, flags: DIFlagPrototyped, isOptimized: true)
!812 = !DISubroutineType(types: !813)
!813 = !{!805, !801}
!814 = !DILocalVariable(name: "threads", scope: !757, file: !3, line: 194, type: !791)
!815 = !DILocalVariable(name: "k1time", scope: !757, file: !3, line: 201, type: !20)
!816 = !DILocalVariable(name: "k2time", scope: !757, file: !3, line: 202, type: !20)
!817 = !DILocalVariable(name: "k", scope: !757, file: !3, line: 204, type: !21)
!818 = !DILocalVariable(name: "stop", scope: !757, file: !3, line: 206, type: !28)
!819 = !DILocalVariable(name: "time0", scope: !820, file: !3, line: 215, type: !20)
!820 = distinct !DILexicalBlock(scope: !757, file: !3, line: 209, column: 2)
!821 = !DILocalVariable(name: "time1", scope: !820, file: !3, line: 221, type: !20)
!822 = !DILocalVariable(name: "time2", scope: !820, file: !3, line: 226, type: !20)
!823 = !DILocalVariable(name: "fpo", scope: !757, file: !3, line: 243, type: !37)
!824 = !DILocalVariable(name: "i", scope: !825, file: !3, line: 244, type: !21)
!825 = distinct !DILexicalBlock(scope: !757, file: !3, line: 244, column: 2)
!826 = !DILocation(line: 75, column: 20, scope: !757)
!827 = !DILocation(line: 75, column: 33, scope: !757)
!828 = !DILocation(line: 79, column: 9, scope: !829)
!829 = distinct !DILexicalBlock(scope: !757, file: !3, line: 79, column: 5)
!830 = !DILocation(line: 79, column: 5, scope: !757)
!831 = !DILocation(line: 80, column: 2, scope: !832)
!832 = distinct !DILexicalBlock(scope: !829, file: !3, line: 79, column: 13)
!833 = !DILocation(line: 81, column: 2, scope: !832)
!834 = !DILocation(line: 84, column: 12, scope: !757)
!835 = !DILocation(line: 78, column: 11, scope: !757)
!836 = !DILocation(line: 85, column: 2, scope: !757)
!837 = !DILocation(line: 87, column: 7, scope: !757)
!838 = !DILocation(line: 87, column: 5, scope: !757)
!839 = !DILocation(line: 88, column: 6, scope: !840)
!840 = distinct !DILexicalBlock(scope: !757, file: !3, line: 88, column: 5)
!841 = !DILocation(line: 88, column: 5, scope: !757)
!842 = !DILocation(line: 90, column: 3, scope: !843)
!843 = distinct !DILexicalBlock(scope: !840, file: !3, line: 89, column: 2)
!844 = !DILocation(line: 91, column: 3, scope: !843)
!845 = !DILocation(line: 94, column: 2, scope: !757)
!846 = !DILocation(line: 94, column: 6, scope: !757)
!847 = !DILocation(line: 96, column: 2, scope: !757)
!848 = !DILocation(line: 98, column: 6, scope: !757)
!849 = !DILocation(line: 99, column: 33, scope: !757)
!850 = !DILocation(line: 99, column: 6, scope: !757)
!851 = !DILocation(line: 103, column: 16, scope: !852)
!852 = distinct !DILexicalBlock(scope: !757, file: !3, line: 103, column: 5)
!853 = !DILocation(line: 103, column: 5, scope: !757)
!854 = !DILocation(line: 105, column: 29, scope: !855)
!855 = distinct !DILexicalBlock(scope: !852, file: !3, line: 104, column: 2)
!856 = !DILocation(line: 105, column: 40, scope: !855)
!857 = !DILocation(line: 105, column: 24, scope: !855)
!858 = !DILocation(line: 107, column: 2, scope: !855)
!859 = !DILocation(line: 110, column: 52, scope: !757)
!860 = !DILocation(line: 110, column: 51, scope: !757)
!861 = !DILocation(line: 110, column: 32, scope: !757)
!862 = !DILocation(line: 110, column: 24, scope: !757)
!863 = !DILocation(line: 110, column: 8, scope: !757)
!864 = !DILocation(line: 111, column: 31, scope: !757)
!865 = !DILocation(line: 111, column: 8, scope: !757)
!866 = !DILocation(line: 112, column: 40, scope: !757)
!867 = !DILocation(line: 112, column: 8, scope: !757)
!868 = !DILocation(line: 113, column: 34, scope: !757)
!869 = !DILocation(line: 113, column: 8, scope: !757)
!870 = !DILocation(line: 115, column: 2, scope: !757)
!871 = !DILocation(line: 117, column: 20, scope: !774)
!872 = !DILocation(line: 117, column: 29, scope: !873)
!873 = !DILexicalBlockFile(scope: !874, file: !3, discriminator: 1)
!874 = distinct !DILexicalBlock(scope: !774, file: !3, line: 117, column: 2)
!875 = !DILocation(line: 119, column: 10, scope: !876)
!876 = distinct !DILexicalBlock(scope: !874, file: !3, line: 118, column: 2)
!877 = !DILocation(line: 117, column: 2, scope: !878)
!878 = !DILexicalBlockFile(scope: !774, file: !3, discriminator: 1)
!879 = !DILocation(line: 115, column: 6, scope: !757)
!880 = !DILocation(line: 128, column: 2, scope: !757)
!881 = !DILocation(line: 129, column: 8, scope: !757)
!882 = !DILocation(line: 132, column: 22, scope: !757)
!883 = !{!884, !884, i64 0}
!884 = !{!"bool", !662, i64 0}
!885 = !DILocation(line: 133, column: 25, scope: !757)
!886 = !DILocation(line: 135, column: 9, scope: !757)
!887 = !DILocation(line: 135, column: 2, scope: !757)
!888 = !DILocation(line: 137, column: 2, scope: !757)
!889 = !DILocation(line: 138, column: 49, scope: !757)
!890 = !DILocation(line: 138, column: 48, scope: !757)
!891 = !DILocation(line: 138, column: 30, scope: !757)
!892 = !DILocation(line: 138, column: 23, scope: !757)
!893 = !DILocation(line: 138, column: 7, scope: !757)
!894 = !DILocation(line: 139, column: 10, scope: !779)
!895 = !DILocation(line: 139, column: 17, scope: !896)
!896 = !DILexicalBlockFile(scope: !897, file: !3, discriminator: 1)
!897 = distinct !DILexicalBlock(scope: !779, file: !3, line: 139, column: 2)
!898 = !DILocation(line: 141, column: 10, scope: !899)
!899 = distinct !DILexicalBlock(scope: !897, file: !3, line: 140, column: 2)
!900 = !DILocation(line: 139, column: 2, scope: !901)
!901 = !DILexicalBlockFile(scope: !779, file: !3, discriminator: 1)
!902 = !DILocation(line: 137, column: 6, scope: !757)
!903 = !DILocation(line: 115, column: 13, scope: !757)
!904 = !DILocation(line: 119, column: 3, scope: !876)
!905 = !DILocation(line: 120, column: 31, scope: !876)
!906 = !DILocation(line: 120, column: 20, scope: !876)
!907 = !DILocation(line: 120, column: 29, scope: !876)
!908 = !{!909, !671, i64 0}
!909 = !{!"_ZTS4Node", !671, i64 0, !671, i64 4}
!910 = !DILocation(line: 121, column: 34, scope: !876)
!911 = !DILocation(line: 121, column: 20, scope: !876)
!912 = !DILocation(line: 121, column: 32, scope: !876)
!913 = !{!909, !671, i64 4}
!914 = !DILocation(line: 122, column: 3, scope: !876)
!915 = !DILocation(line: 122, column: 18, scope: !876)
!916 = !DILocation(line: 123, column: 3, scope: !876)
!917 = !DILocation(line: 123, column: 27, scope: !876)
!918 = !DILocation(line: 124, column: 3, scope: !876)
!919 = !DILocation(line: 124, column: 21, scope: !876)
!920 = !DILocation(line: 117, column: 45, scope: !921)
!921 = !DILexicalBlockFile(scope: !874, file: !3, discriminator: 3)
!922 = !DILocation(line: 117, column: 31, scope: !873)
!923 = distinct !{!923, !924, !925}
!924 = !DILocation(line: 117, column: 2, scope: !774)
!925 = !DILocation(line: 125, column: 2, scope: !774)
!926 = !DILocation(line: 146, column: 5, scope: !927)
!927 = distinct !DILexicalBlock(scope: !757, file: !3, line: 146, column: 5)
!928 = !DILocation(line: 146, column: 5, scope: !757)
!929 = !DILocation(line: 141, column: 3, scope: !899)
!930 = !DILocation(line: 142, column: 10, scope: !899)
!931 = !DILocation(line: 137, column: 9, scope: !757)
!932 = !DILocation(line: 142, column: 3, scope: !899)
!933 = !DILocation(line: 143, column: 22, scope: !899)
!934 = !DILocation(line: 143, column: 3, scope: !899)
!935 = !DILocation(line: 143, column: 20, scope: !899)
!936 = !DILocation(line: 139, column: 37, scope: !937)
!937 = !DILexicalBlockFile(scope: !897, file: !3, discriminator: 3)
!938 = !DILocation(line: 139, column: 19, scope: !896)
!939 = distinct !{!939, !940, !941}
!940 = !DILocation(line: 139, column: 2, scope: !779)
!941 = !DILocation(line: 144, column: 2, scope: !779)
!942 = !DILocation(line: 147, column: 3, scope: !927)
!943 = !DILocation(line: 149, column: 2, scope: !757)
!944 = !DILocation(line: 152, column: 2, scope: !757)
!945 = !DILocation(line: 153, column: 14, scope: !757)
!946 = !DILocation(line: 153, column: 52, scope: !757)
!947 = !DILocation(line: 153, column: 51, scope: !757)
!948 = !DILocation(line: 153, column: 2, scope: !757)
!949 = !DILocation(line: 154, column: 14, scope: !757)
!950 = !DILocation(line: 154, column: 57, scope: !757)
!951 = !DILocation(line: 154, column: 56, scope: !757)
!952 = !DILocation(line: 154, column: 2, scope: !757)
!953 = !DILocation(line: 157, column: 2, scope: !757)
!954 = !DILocation(line: 158, column: 14, scope: !757)
!955 = !DILocation(line: 158, column: 51, scope: !757)
!956 = !DILocation(line: 158, column: 50, scope: !757)
!957 = !DILocation(line: 158, column: 2, scope: !757)
!958 = !DILocation(line: 159, column: 14, scope: !757)
!959 = !DILocation(line: 159, column: 56, scope: !757)
!960 = !DILocation(line: 159, column: 55, scope: !757)
!961 = !DILocation(line: 159, column: 2, scope: !757)
!962 = !DILocation(line: 162, column: 2, scope: !757)
!963 = !DILocation(line: 163, column: 51, scope: !757)
!964 = !DILocation(line: 162, column: 8, scope: !757)
!965 = !DILocation(line: 163, column: 2, scope: !757)
!966 = !DILocation(line: 164, column: 14, scope: !757)
!967 = !DILocation(line: 164, column: 55, scope: !757)
!968 = !DILocation(line: 164, column: 2, scope: !757)
!969 = !DILocation(line: 166, column: 2, scope: !757)
!970 = !DILocation(line: 167, column: 60, scope: !757)
!971 = !DILocation(line: 166, column: 8, scope: !757)
!972 = !DILocation(line: 167, column: 2, scope: !757)
!973 = !DILocation(line: 168, column: 14, scope: !757)
!974 = !DILocation(line: 168, column: 73, scope: !757)
!975 = !DILocation(line: 168, column: 2, scope: !757)
!976 = !DILocation(line: 171, column: 2, scope: !757)
!977 = !DILocation(line: 172, column: 54, scope: !757)
!978 = !DILocation(line: 171, column: 8, scope: !757)
!979 = !DILocation(line: 172, column: 2, scope: !757)
!980 = !DILocation(line: 173, column: 14, scope: !757)
!981 = !DILocation(line: 173, column: 61, scope: !757)
!982 = !DILocation(line: 173, column: 2, scope: !757)
!983 = !DILocation(line: 176, column: 43, scope: !757)
!984 = !DILocation(line: 176, column: 42, scope: !757)
!985 = !DILocation(line: 176, column: 23, scope: !757)
!986 = !DILocation(line: 176, column: 16, scope: !757)
!987 = !DILocation(line: 176, column: 7, scope: !757)
!988 = !DILocation(line: 177, column: 10, scope: !787)
!989 = !DILocation(line: 177, column: 15, scope: !990)
!990 = !DILexicalBlockFile(scope: !991, file: !3, discriminator: 1)
!991 = distinct !DILexicalBlock(scope: !787, file: !3, line: 177, column: 2)
!992 = !DILocation(line: 177, column: 2, scope: !993)
!993 = !DILexicalBlockFile(scope: !787, file: !3, discriminator: 1)
!994 = !DILocation(line: 178, column: 12, scope: !991)
!995 = !DILocation(line: 179, column: 9, scope: !757)
!996 = !DILocation(line: 179, column: 2, scope: !757)
!997 = !DILocation(line: 179, column: 16, scope: !757)
!998 = !DILocation(line: 182, column: 2, scope: !757)
!999 = !DILocation(line: 183, column: 14, scope: !757)
!1000 = !DILocation(line: 183, column: 2, scope: !757)
!1001 = !DILocation(line: 184, column: 14, scope: !757)
!1002 = !DILocation(line: 184, column: 42, scope: !757)
!1003 = !DILocation(line: 184, column: 41, scope: !757)
!1004 = !DILocation(line: 184, column: 2, scope: !757)
!1005 = !DILocation(line: 187, column: 2, scope: !757)
!1006 = !DILocation(line: 187, column: 8, scope: !757)
!1007 = !DILocation(line: 188, column: 2, scope: !757)
!1008 = !DILocation(line: 190, column: 2, scope: !757)
!1009 = !DILocation(line: 193, column: 8, scope: !757)
!1010 = !DILocation(line: 194, column: 8, scope: !757)
!1011 = !DILocation(line: 196, column: 2, scope: !757)
!1012 = !DILocation(line: 198, column: 2, scope: !757)
!1013 = !DILocation(line: 201, column: 9, scope: !757)
!1014 = !DILocation(line: 202, column: 9, scope: !757)
!1015 = !DILocation(line: 204, column: 6, scope: !757)
!1016 = !DILocation(line: 205, column: 2, scope: !757)
!1017 = !DILocation(line: 206, column: 7, scope: !757)
!1018 = !DILocation(line: 206, column: 2, scope: !757)
!1019 = !DILocation(line: 208, column: 2, scope: !757)
!1020 = distinct !{!1020, !1019, !1021}
!1021 = !DILocation(line: 233, column: 12, scope: !757)
!1022 = !DILocation(line: 211, column: 7, scope: !820)
!1023 = !DILocation(line: 212, column: 15, scope: !820)
!1024 = !DILocation(line: 212, column: 3, scope: !820)
!1025 = !DILocation(line: 214, column: 3, scope: !820)
!1026 = !DILocation(line: 44, column: 5, scope: !715, inlinedAt: !1027)
!1027 = distinct !DILocation(line: 215, column: 18, scope: !820)
!1028 = !DILocation(line: 44, column: 20, scope: !715, inlinedAt: !1027)
!1029 = !DILocation(line: 45, column: 9, scope: !731, inlinedAt: !1027)
!1030 = !DILocation(line: 45, column: 9, scope: !715, inlinedAt: !1027)
!1031 = !DILocation(line: 49, column: 25, scope: !715, inlinedAt: !1027)
!1032 = !DILocation(line: 49, column: 20, scope: !715, inlinedAt: !1027)
!1033 = !DILocation(line: 49, column: 47, scope: !715, inlinedAt: !1027)
!1034 = !DILocation(line: 49, column: 42, scope: !715, inlinedAt: !1027)
!1035 = !DILocation(line: 49, column: 55, scope: !715, inlinedAt: !1027)
!1036 = !DILocation(line: 49, column: 32, scope: !715, inlinedAt: !1027)
!1037 = !DILocation(line: 49, column: 5, scope: !715, inlinedAt: !1027)
!1038 = !DILocation(line: 50, column: 1, scope: !715, inlinedAt: !1027)
!1039 = !DILocation(line: 215, column: 10, scope: !820)
!1040 = !DILocation(line: 217, column: 9, scope: !820)
!1041 = !DILocation(line: 217, column: 3, scope: !820)
!1042 = !DILocation(line: 217, column: 35, scope: !1043)
!1043 = !DILexicalBlockFile(scope: !820, file: !3, discriminator: 1)
!1044 = !DILocation(line: 152, column: 8, scope: !757)
!1045 = !DILocation(line: 217, column: 50, scope: !1043)
!1046 = !DILocation(line: 157, column: 7, scope: !757)
!1047 = !DILocation(line: 217, column: 65, scope: !1043)
!1048 = !DILocation(line: 217, column: 79, scope: !1043)
!1049 = !DILocation(line: 217, column: 102, scope: !1043)
!1050 = !DILocation(line: 217, column: 119, scope: !1043)
!1051 = !DILocation(line: 182, column: 7, scope: !757)
!1052 = !DILocation(line: 217, column: 127, scope: !1043)
!1053 = !DILocation(line: 217, column: 3, scope: !1043)
!1054 = !DILocation(line: 220, column: 3, scope: !820)
!1055 = !DILocation(line: 44, column: 5, scope: !715, inlinedAt: !1056)
!1056 = distinct !DILocation(line: 221, column: 32, scope: !820)
!1057 = !DILocation(line: 44, column: 20, scope: !715, inlinedAt: !1056)
!1058 = !DILocation(line: 45, column: 9, scope: !731, inlinedAt: !1056)
!1059 = !DILocation(line: 45, column: 9, scope: !715, inlinedAt: !1056)
!1060 = !DILocation(line: 49, column: 25, scope: !715, inlinedAt: !1056)
!1061 = !DILocation(line: 49, column: 20, scope: !715, inlinedAt: !1056)
!1062 = !DILocation(line: 49, column: 47, scope: !715, inlinedAt: !1056)
!1063 = !DILocation(line: 49, column: 42, scope: !715, inlinedAt: !1056)
!1064 = !DILocation(line: 49, column: 55, scope: !715, inlinedAt: !1056)
!1065 = !DILocation(line: 49, column: 32, scope: !715, inlinedAt: !1056)
!1066 = !DILocation(line: 49, column: 5, scope: !715, inlinedAt: !1056)
!1067 = !DILocation(line: 50, column: 1, scope: !715, inlinedAt: !1056)
!1068 = !DILocation(line: 221, column: 24, scope: !820)
!1069 = !DILocation(line: 223, column: 10, scope: !820)
!1070 = !DILocation(line: 223, column: 3, scope: !820)
!1071 = !DILocation(line: 223, column: 36, scope: !1043)
!1072 = !DILocation(line: 223, column: 50, scope: !1043)
!1073 = !DILocation(line: 223, column: 73, scope: !1043)
!1074 = !DILocation(line: 223, column: 90, scope: !1043)
!1075 = !DILocation(line: 223, column: 98, scope: !1043)
!1076 = !DILocation(line: 223, column: 3, scope: !1043)
!1077 = !DILocation(line: 225, column: 3, scope: !820)
!1078 = !DILocation(line: 44, column: 5, scope: !715, inlinedAt: !1079)
!1079 = distinct !DILocation(line: 226, column: 32, scope: !820)
!1080 = !DILocation(line: 44, column: 20, scope: !715, inlinedAt: !1079)
!1081 = !DILocation(line: 45, column: 9, scope: !731, inlinedAt: !1079)
!1082 = !DILocation(line: 50, column: 1, scope: !715, inlinedAt: !1079)
!1083 = !DILocation(line: 228, column: 18, scope: !820)
!1084 = !DILocation(line: 228, column: 10, scope: !820)
!1085 = !DILocation(line: 230, column: 22, scope: !820)
!1086 = !DILocation(line: 230, column: 3, scope: !820)
!1087 = !DILocation(line: 231, column: 4, scope: !820)
!1088 = !DILocation(line: 233, column: 8, scope: !757)
!1089 = !{i8 0, i8 2}
!1090 = !DILocation(line: 232, column: 2, scope: !1043)
!1091 = !DILocation(line: 235, column: 10, scope: !757)
!1092 = !DILocation(line: 235, column: 2, scope: !757)
!1093 = !DILocation(line: 237, column: 2, scope: !757)
!1094 = !DILocation(line: 240, column: 22, scope: !757)
!1095 = !DILocation(line: 240, column: 42, scope: !757)
!1096 = !DILocation(line: 240, column: 41, scope: !757)
!1097 = !DILocation(line: 240, column: 2, scope: !757)
!1098 = !DILocation(line: 243, column: 14, scope: !757)
!1099 = !DILocation(line: 243, column: 8, scope: !757)
!1100 = !DILocation(line: 244, column: 10, scope: !825)
!1101 = !DILocation(line: 244, column: 16, scope: !1102)
!1102 = !DILexicalBlockFile(scope: !1103, file: !3, discriminator: 1)
!1103 = distinct !DILexicalBlock(scope: !825, file: !3, line: 244, column: 2)
!1104 = !DILocation(line: 244, column: 15, scope: !1102)
!1105 = !DILocation(line: 244, column: 2, scope: !1106)
!1106 = !DILexicalBlockFile(scope: !825, file: !3, discriminator: 1)
!1107 = !DILocation(line: 245, column: 33, scope: !1103)
!1108 = !DILocation(line: 246, column: 2, scope: !757)
!1109 = !DILocation(line: 247, column: 2, scope: !757)
!1110 = !DILocation(line: 251, column: 2, scope: !757)
!1111 = !DILocation(line: 252, column: 2, scope: !757)
!1112 = !DILocation(line: 253, column: 2, scope: !757)
!1113 = !DILocation(line: 254, column: 2, scope: !757)
!1114 = !DILocation(line: 255, column: 2, scope: !757)
!1115 = !DILocation(line: 256, column: 2, scope: !757)
!1116 = !DILocation(line: 257, column: 11, scope: !757)
!1117 = !DILocation(line: 257, column: 2, scope: !757)
!1118 = !DILocation(line: 258, column: 11, scope: !757)
!1119 = !DILocation(line: 258, column: 2, scope: !757)
!1120 = !DILocation(line: 259, column: 11, scope: !757)
!1121 = !DILocation(line: 259, column: 2, scope: !757)
!1122 = !DILocation(line: 260, column: 11, scope: !757)
!1123 = !DILocation(line: 260, column: 2, scope: !757)
!1124 = !DILocation(line: 261, column: 11, scope: !757)
!1125 = !DILocation(line: 261, column: 2, scope: !757)
!1126 = !DILocation(line: 262, column: 11, scope: !757)
!1127 = !DILocation(line: 262, column: 2, scope: !757)
!1128 = !DILocation(line: 263, column: 1, scope: !757)
!1129 = !DILocation(line: 245, column: 3, scope: !1103)
!1130 = !DILocation(line: 244, column: 29, scope: !1131)
!1131 = !DILexicalBlockFile(scope: !1103, file: !3, discriminator: 3)
!1132 = distinct !{!1132, !1133, !1134}
!1133 = !DILocation(line: 244, column: 2, scope: !825)
!1134 = !DILocation(line: 245, column: 42, scope: !825)
!1135 = !DILocation(line: 263, column: 1, scope: !1136)
!1136 = !DILexicalBlockFile(scope: !757, file: !3, discriminator: 2)
!1137 = distinct !DISubprogram(name: "Usage", linkageName: "_Z5UsageiPPc", scope: !3, file: !3, line: 67, type: !758, isLocal: false, isDefinition: true, scopeLine: 67, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !1138)
!1138 = !{!1139, !1140}
!1139 = !DILocalVariable(name: "argc", arg: 1, scope: !1137, file: !3, line: 67, type: !21)
!1140 = !DILocalVariable(name: "argv", arg: 2, scope: !1137, file: !3, line: 67, type: !453)
!1141 = !DILocation(line: 67, column: 16, scope: !1137)
!1142 = !DILocation(line: 67, column: 28, scope: !1137)
!1143 = !DILocation(line: 69, column: 9, scope: !1137)
!1144 = !DILocation(line: 69, column: 44, scope: !1137)
!1145 = !DILocation(line: 69, column: 1, scope: !1137)
!1146 = !DILocation(line: 71, column: 1, scope: !1137)
