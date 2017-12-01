; ModuleID = './kernel/kernel_gpu_cuda_wrapper.cu'
source_filename = "./kernel/kernel_gpu_cuda_wrapper.cu"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.dim_str = type { i32, i32, i32, i32, i64, i64, i64, i64, i64 }
%struct.box_str = type { i32, i32, i32, i32, i64, i32, [26 x %struct.nei_str] }
%struct.nei_str = type { i32, i32, i32, i32, i64 }
%struct.FOUR_VECTOR = type { double, double, double, double }
%struct.par_str = type { double }
%struct.dim3 = type { i32, i32, i32 }
%struct.CUstream_st = type opaque

@.str.1 = private unnamed_addr constant [54 x i8] c"%15.12f s, %15.12f % : GPU: SET DEVICE / DRIVER INIT\0A\00", align 1
@.str.2 = private unnamed_addr constant [37 x i8] c"%15.12f s, %15.12f % : GPU MEM: ALO\0A\00", align 1
@.str.3 = private unnamed_addr constant [41 x i8] c"%15.12f s, %15.12f % : GPU MEM: COPY IN\0A\00", align 1
@.str.4 = private unnamed_addr constant [36 x i8] c"%15.12f s, %15.12f % : GPU: KERNEL\0A\00", align 1
@.str.5 = private unnamed_addr constant [42 x i8] c"%15.12f s, %15.12f % : GPU MEM: COPY OUT\0A\00", align 1
@.str.6 = private unnamed_addr constant [37 x i8] c"%15.12f s, %15.12f % : GPU MEM: FRE\0A\00", align 1
@.str.8 = private unnamed_addr constant [9 x i8] c"%.12f s\0A\00", align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.9 = private unnamed_addr constant [24 x i8] c"%15.12f s, GPU: KERNEL\0A\00", align 1
@str = private unnamed_addr constant [51 x i8] c"Time spent in different stages of GPU_CUDA KERNEL:\00"
@str.10 = private unnamed_addr constant [12 x i8] c"Total time:\00"

; Function Attrs: uwtable
define void @_Z15kernel_gpu_cuda7par_str7dim_strP7box_strP11FOUR_VECTORPdS4_(double %d_par_gpu.coerce, %struct.dim_str* byval align 8 %d_dim_gpu, %struct.box_str* %d_box_gpu, %struct.FOUR_VECTOR* %d_rv_gpu, double* %d_qv_gpu, %struct.FOUR_VECTOR* %d_fv_gpu) #0 !dbg !583 {
entry:
  %d_par_gpu = alloca %struct.par_str, align 8
  %d_box_gpu.addr = alloca %struct.box_str*, align 8
  %d_rv_gpu.addr = alloca %struct.FOUR_VECTOR*, align 8
  %d_qv_gpu.addr = alloca double*, align 8
  %d_fv_gpu.addr = alloca %struct.FOUR_VECTOR*, align 8
  %coerce.dive = getelementptr inbounds %struct.par_str, %struct.par_str* %d_par_gpu, i64 0, i32 0
  store double %d_par_gpu.coerce, double* %coerce.dive, align 8
  tail call void @llvm.dbg.declare(metadata %struct.dim_str* %d_dim_gpu, metadata !636, metadata !641), !dbg !642
  tail call void @llvm.dbg.value(metadata %struct.box_str* %d_box_gpu, i64 0, metadata !637, metadata !641), !dbg !643
  store %struct.box_str* %d_box_gpu, %struct.box_str** %d_box_gpu.addr, align 8, !tbaa !644
  tail call void @llvm.dbg.value(metadata %struct.FOUR_VECTOR* %d_rv_gpu, i64 0, metadata !638, metadata !641), !dbg !648
  store %struct.FOUR_VECTOR* %d_rv_gpu, %struct.FOUR_VECTOR** %d_rv_gpu.addr, align 8, !tbaa !644
  tail call void @llvm.dbg.value(metadata double* %d_qv_gpu, i64 0, metadata !639, metadata !641), !dbg !649
  store double* %d_qv_gpu, double** %d_qv_gpu.addr, align 8, !tbaa !644
  tail call void @llvm.dbg.value(metadata %struct.FOUR_VECTOR* %d_fv_gpu, i64 0, metadata !640, metadata !641), !dbg !650
  store %struct.FOUR_VECTOR* %d_fv_gpu, %struct.FOUR_VECTOR** %d_fv_gpu.addr, align 8, !tbaa !644
  %0 = bitcast %struct.par_str* %d_par_gpu to i8*, !dbg !651
  %1 = call i32 @cudaSetupArgument(i8* nonnull %0, i64 8, i64 0), !dbg !651
  %2 = icmp eq i32 %1, 0, !dbg !651
  br i1 %2, label %setup.next, label %setup.end, !dbg !651

setup.next:                                       ; preds = %entry
  %3 = bitcast %struct.dim_str* %d_dim_gpu to i8*, !dbg !652
  %4 = call i32 @cudaSetupArgument(i8* nonnull %3, i64 56, i64 8), !dbg !652
  %5 = icmp eq i32 %4, 0, !dbg !652
  br i1 %5, label %setup.next1, label %setup.end, !dbg !652

setup.next1:                                      ; preds = %setup.next
  %6 = bitcast %struct.box_str** %d_box_gpu.addr to i8*, !dbg !654
  %7 = call i32 @cudaSetupArgument(i8* nonnull %6, i64 8, i64 64), !dbg !654
  %8 = icmp eq i32 %7, 0, !dbg !654
  br i1 %8, label %setup.next2, label %setup.end, !dbg !654

setup.next2:                                      ; preds = %setup.next1
  %9 = bitcast %struct.FOUR_VECTOR** %d_rv_gpu.addr to i8*, !dbg !656
  %10 = call i32 @cudaSetupArgument(i8* nonnull %9, i64 8, i64 72), !dbg !656
  %11 = icmp eq i32 %10, 0, !dbg !656
  br i1 %11, label %setup.next3, label %setup.end, !dbg !656

setup.next3:                                      ; preds = %setup.next2
  %12 = bitcast double** %d_qv_gpu.addr to i8*, !dbg !658
  %13 = call i32 @cudaSetupArgument(i8* nonnull %12, i64 8, i64 80), !dbg !658
  %14 = icmp eq i32 %13, 0, !dbg !658
  br i1 %14, label %setup.next4, label %setup.end, !dbg !658

setup.next4:                                      ; preds = %setup.next3
  %15 = bitcast %struct.FOUR_VECTOR** %d_fv_gpu.addr to i8*, !dbg !660
  %16 = call i32 @cudaSetupArgument(i8* nonnull %15, i64 8, i64 88), !dbg !660
  %17 = icmp eq i32 %16, 0, !dbg !660
  br i1 %17, label %setup.next5, label %setup.end, !dbg !660

setup.next5:                                      ; preds = %setup.next4
  %18 = call i32 @cudaLaunch(i8* bitcast (void (double, %struct.dim_str*, %struct.box_str*, %struct.FOUR_VECTOR*, double*, %struct.FOUR_VECTOR*)* @_Z15kernel_gpu_cuda7par_str7dim_strP7box_strP11FOUR_VECTORPdS4_ to i8*)), !dbg !662
  br label %setup.end, !dbg !662

setup.end:                                        ; preds = %setup.next5, %setup.next4, %setup.next3, %setup.next2, %setup.next1, %setup.next, %entry
  ret void, !dbg !664
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @cudaSetupArgument(i8*, i64, i64) local_unnamed_addr

declare i32 @cudaLaunch(i8*) local_unnamed_addr

; Function Attrs: uwtable
define void @kernel_gpu_cuda_wrapper(double %par_cpu.coerce, %struct.dim_str* byval nocapture readonly align 8 %dim_cpu, %struct.box_str* %box_cpu, %struct.FOUR_VECTOR* %rv_cpu, double* %qv_cpu, %struct.FOUR_VECTOR* %fv_cpu) local_unnamed_addr #0 !dbg !665 {
entry:
  %d_box_gpu = alloca %struct.box_str*, align 8
  %d_rv_gpu = alloca %struct.FOUR_VECTOR*, align 8
  %d_qv_gpu = alloca double*, align 8
  %d_fv_gpu = alloca %struct.FOUR_VECTOR*, align 8
  tail call void @llvm.dbg.value(metadata double %par_cpu.coerce, i64 0, metadata !667, metadata !641), !dbg !709
  tail call void @llvm.dbg.declare(metadata %struct.par_str* undef, metadata !667, metadata !641), !dbg !709
  tail call void @llvm.dbg.declare(metadata %struct.dim_str* %dim_cpu, metadata !668, metadata !641), !dbg !710
  tail call void @llvm.dbg.value(metadata %struct.box_str* %box_cpu, i64 0, metadata !669, metadata !641), !dbg !711
  tail call void @llvm.dbg.value(metadata %struct.FOUR_VECTOR* %rv_cpu, i64 0, metadata !670, metadata !641), !dbg !712
  tail call void @llvm.dbg.value(metadata double* %qv_cpu, i64 0, metadata !671, metadata !641), !dbg !713
  tail call void @llvm.dbg.value(metadata %struct.FOUR_VECTOR* %fv_cpu, i64 0, metadata !672, metadata !641), !dbg !714
  %call = tail call i64 @get_time(), !dbg !715
  tail call void @llvm.dbg.value(metadata i64 %call, i64 0, metadata !673, metadata !641), !dbg !716
  %call1 = tail call i32 @cudaDeviceSetLimit(i32 2, i64 838860800), !dbg !717
  %0 = bitcast %struct.box_str** %d_box_gpu to i8*, !dbg !718
  call void @llvm.lifetime.start(i64 8, i8* nonnull %0) #5, !dbg !718
  %1 = bitcast %struct.FOUR_VECTOR** %d_rv_gpu to i8*, !dbg !719
  call void @llvm.lifetime.start(i64 8, i8* nonnull %1) #5, !dbg !719
  %2 = bitcast double** %d_qv_gpu to i8*, !dbg !720
  call void @llvm.lifetime.start(i64 8, i8* nonnull %2) #5, !dbg !720
  %3 = bitcast %struct.FOUR_VECTOR** %d_fv_gpu to i8*, !dbg !721
  call void @llvm.lifetime.start(i64 8, i8* nonnull %3) #5, !dbg !721
  tail call void @llvm.dbg.value(metadata %struct.dim3* undef, i64 0, metadata !684, metadata !722), !dbg !723
  tail call void @llvm.dbg.value(metadata %struct.dim3* undef, i64 0, metadata !708, metadata !722), !dbg !724
  %number_boxes = getelementptr inbounds %struct.dim_str, %struct.dim_str* %dim_cpu, i64 0, i32 4, !dbg !725
  %4 = load i64, i64* %number_boxes, align 8, !dbg !725, !tbaa !726
  %call4 = tail call i64 @get_time(), !dbg !730
  tail call void @llvm.dbg.value(metadata i64 %call4, i64 0, metadata !674, metadata !641), !dbg !731
  %5 = bitcast %struct.box_str** %d_box_gpu to i8**, !dbg !732
  %box_mem = getelementptr inbounds %struct.dim_str, %struct.dim_str* %dim_cpu, i64 0, i32 5, !dbg !733
  %6 = load i64, i64* %box_mem, align 8, !dbg !733, !tbaa !734
  %call5 = call i32 @cudaMalloc(i8** nonnull %5, i64 %6), !dbg !735
  %7 = bitcast %struct.FOUR_VECTOR** %d_rv_gpu to i8**, !dbg !736
  %space_mem = getelementptr inbounds %struct.dim_str, %struct.dim_str* %dim_cpu, i64 0, i32 7, !dbg !737
  %8 = load i64, i64* %space_mem, align 8, !dbg !737, !tbaa !738
  %call6 = call i32 @cudaMalloc(i8** nonnull %7, i64 %8), !dbg !739
  %9 = bitcast double** %d_qv_gpu to i8**, !dbg !740
  %space_mem2 = getelementptr inbounds %struct.dim_str, %struct.dim_str* %dim_cpu, i64 0, i32 8, !dbg !741
  %10 = load i64, i64* %space_mem2, align 8, !dbg !741, !tbaa !742
  %call7 = call i32 @cudaMalloc(i8** nonnull %9, i64 %10), !dbg !743
  %11 = bitcast %struct.FOUR_VECTOR** %d_fv_gpu to i8**, !dbg !744
  %call9 = call i32 @cudaMalloc(i8** nonnull %11, i64 %8), !dbg !745
  %call10 = call i64 @get_time(), !dbg !746
  call void @llvm.dbg.value(metadata i64 %call10, i64 0, metadata !675, metadata !641), !dbg !747
  %12 = load i8*, i8** %5, align 8, !dbg !748, !tbaa !644
  %13 = bitcast %struct.box_str* %box_cpu to i8*, !dbg !749
  %call12 = call i32 @cudaMemcpy(i8* %12, i8* %13, i64 %6, i32 1), !dbg !750
  %14 = load i8*, i8** %7, align 8, !dbg !751, !tbaa !644
  %15 = bitcast %struct.FOUR_VECTOR* %rv_cpu to i8*, !dbg !752
  %call14 = call i32 @cudaMemcpy(i8* %14, i8* %15, i64 %8, i32 1), !dbg !753
  %16 = load i8*, i8** %9, align 8, !dbg !754, !tbaa !644
  %17 = bitcast double* %qv_cpu to i8*, !dbg !755
  %call16 = call i32 @cudaMemcpy(i8* %16, i8* %17, i64 %10, i32 1), !dbg !756
  %18 = load i8*, i8** %11, align 8, !dbg !757, !tbaa !644
  %19 = bitcast %struct.FOUR_VECTOR* %fv_cpu to i8*, !dbg !758
  %call18 = call i32 @cudaMemcpy(i8* %18, i8* %19, i64 %8, i32 1), !dbg !759
  %call19 = call i64 @get_time(), !dbg !760
  call void @llvm.dbg.value(metadata i64 %call19, i64 0, metadata !676, metadata !641), !dbg !761
  %blocks.sroa.0.sroa.0.0.insert.ext = and i64 %4, 4294967295, !dbg !762
  %blocks.sroa.0.sroa.0.0.insert.insert = or i64 %blocks.sroa.0.sroa.0.0.insert.ext, 4294967296, !dbg !762
  %call21 = call i32 @cudaConfigureCall(i64 %blocks.sroa.0.sroa.0.0.insert.insert, i32 1, i64 4294967424, i32 1, i64 0, %struct.CUstream_st* null), !dbg !763
  %tobool = icmp eq i32 %call21, 0, !dbg !763
  br i1 %tobool, label %kcall.configok, label %kcall.end, !dbg !764

kcall.configok:                                   ; preds = %entry
  %20 = load %struct.box_str*, %struct.box_str** %d_box_gpu, align 8, !dbg !765, !tbaa !644
  call void @llvm.dbg.value(metadata %struct.box_str* %20, i64 0, metadata !680, metadata !641), !dbg !766
  %21 = load %struct.FOUR_VECTOR*, %struct.FOUR_VECTOR** %d_rv_gpu, align 8, !dbg !767, !tbaa !644
  call void @llvm.dbg.value(metadata %struct.FOUR_VECTOR* %21, i64 0, metadata !681, metadata !641), !dbg !768
  %22 = load double*, double** %d_qv_gpu, align 8, !dbg !769, !tbaa !644
  call void @llvm.dbg.value(metadata double* %22, i64 0, metadata !682, metadata !641), !dbg !770
  %23 = load %struct.FOUR_VECTOR*, %struct.FOUR_VECTOR** %d_fv_gpu, align 8, !dbg !771, !tbaa !644
  call void @llvm.dbg.value(metadata %struct.FOUR_VECTOR* %23, i64 0, metadata !683, metadata !641), !dbg !772
  call void @_Z15kernel_gpu_cuda7par_str7dim_strP7box_strP11FOUR_VECTORPdS4_(double %par_cpu.coerce, %struct.dim_str* byval nonnull align 8 %dim_cpu, %struct.box_str* %20, %struct.FOUR_VECTOR* %21, double* %22, %struct.FOUR_VECTOR* %23), !dbg !773
  br label %kcall.end, !dbg !773

kcall.end:                                        ; preds = %entry, %kcall.configok
  %call25 = call i32 @cudaThreadSynchronize(), !dbg !775
  %call26 = call i64 @get_time(), !dbg !776
  call void @llvm.dbg.value(metadata i64 %call26, i64 0, metadata !677, metadata !641), !dbg !777
  %24 = load i8*, i8** %11, align 8, !dbg !778, !tbaa !644
  %call28 = call i32 @cudaMemcpy(i8* %19, i8* %24, i64 %8, i32 2), !dbg !779
  %call29 = call i64 @get_time(), !dbg !780
  call void @llvm.dbg.value(metadata i64 %call29, i64 0, metadata !678, metadata !641), !dbg !781
  %25 = load i8*, i8** %7, align 8, !dbg !782, !tbaa !644
  %call30 = call i32 @cudaFree(i8* %25), !dbg !783
  %26 = load i8*, i8** %9, align 8, !dbg !784, !tbaa !644
  %call31 = call i32 @cudaFree(i8* %26), !dbg !785
  %27 = load i8*, i8** %11, align 8, !dbg !786, !tbaa !644
  %call32 = call i32 @cudaFree(i8* %27), !dbg !787
  %28 = load i8*, i8** %5, align 8, !dbg !788, !tbaa !644
  %call33 = call i32 @cudaFree(i8* %28), !dbg !789
  %call34 = call i64 @get_time(), !dbg !790
  call void @llvm.dbg.value(metadata i64 %call34, i64 0, metadata !679, metadata !641), !dbg !791
  %puts = call i32 @puts(i8* getelementptr inbounds ([51 x i8], [51 x i8]* @str, i64 0, i64 0)), !dbg !792
  %sub = sub nsw i64 %call4, %call, !dbg !793
  %conv36 = sitofp i64 %sub to float, !dbg !794
  %div = fdiv float %conv36, 1.000000e+06, !dbg !795
  %conv37 = fpext float %div to double, !dbg !796
  %sub40 = sub nsw i64 %call34, %call, !dbg !797
  %conv41 = sitofp i64 %sub40 to float, !dbg !798
  %div42 = fdiv float %conv36, %conv41, !dbg !799
  %mul = fmul float %div42, 1.000000e+02, !dbg !800
  %conv43 = fpext float %mul to double, !dbg !801
  %call44 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.1, i64 0, i64 0), double %conv37, double %conv43), !dbg !802
  %sub45 = sub nsw i64 %call10, %call4, !dbg !803
  %conv46 = sitofp i64 %sub45 to float, !dbg !804
  %div47 = fdiv float %conv46, 1.000000e+06, !dbg !805
  %conv48 = fpext float %div47 to double, !dbg !806
  %div53 = fdiv float %conv46, %conv41, !dbg !807
  %mul54 = fmul float %div53, 1.000000e+02, !dbg !808
  %conv55 = fpext float %mul54 to double, !dbg !809
  %call56 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.2, i64 0, i64 0), double %conv48, double %conv55), !dbg !810
  %sub57 = sub nsw i64 %call19, %call10, !dbg !811
  %conv58 = sitofp i64 %sub57 to float, !dbg !812
  %div59 = fdiv float %conv58, 1.000000e+06, !dbg !813
  %conv60 = fpext float %div59 to double, !dbg !814
  %div65 = fdiv float %conv58, %conv41, !dbg !815
  %mul66 = fmul float %div65, 1.000000e+02, !dbg !816
  %conv67 = fpext float %mul66 to double, !dbg !817
  %call68 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.3, i64 0, i64 0), double %conv60, double %conv67), !dbg !818
  %sub69 = sub nsw i64 %call26, %call19, !dbg !819
  %conv70 = sitofp i64 %sub69 to float, !dbg !820
  %div71 = fdiv float %conv70, 1.000000e+06, !dbg !821
  %conv72 = fpext float %div71 to double, !dbg !822
  %div77 = fdiv float %conv70, %conv41, !dbg !823
  %mul78 = fmul float %div77, 1.000000e+02, !dbg !824
  %conv79 = fpext float %mul78 to double, !dbg !825
  %call80 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.4, i64 0, i64 0), double %conv72, double %conv79), !dbg !826
  %sub81 = sub nsw i64 %call29, %call26, !dbg !827
  %conv82 = sitofp i64 %sub81 to float, !dbg !828
  %div83 = fdiv float %conv82, 1.000000e+06, !dbg !829
  %conv84 = fpext float %div83 to double, !dbg !830
  %div89 = fdiv float %conv82, %conv41, !dbg !831
  %mul90 = fmul float %div89, 1.000000e+02, !dbg !832
  %conv91 = fpext float %mul90 to double, !dbg !833
  %call92 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.5, i64 0, i64 0), double %conv84, double %conv91), !dbg !834
  %sub93 = sub nsw i64 %call34, %call29, !dbg !835
  %conv94 = sitofp i64 %sub93 to float, !dbg !836
  %div95 = fdiv float %conv94, 1.000000e+06, !dbg !837
  %conv96 = fpext float %div95 to double, !dbg !838
  %div101 = fdiv float %conv94, %conv41, !dbg !839
  %mul102 = fmul float %div101, 1.000000e+02, !dbg !840
  %conv103 = fpext float %mul102 to double, !dbg !841
  %call104 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.6, i64 0, i64 0), double %conv96, double %conv103), !dbg !842
  %puts161 = call i32 @puts(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @str.10, i64 0, i64 0)), !dbg !843
  %div108 = fdiv float %conv41, 1.000000e+06, !dbg !844
  %conv109 = fpext float %div108 to double, !dbg !845
  %call110 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.8, i64 0, i64 0), double %conv109), !dbg !846
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !847, !tbaa !644
  %call115 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.9, i64 0, i64 0), double %conv72) #6, !dbg !848
  call void @llvm.lifetime.end(i64 8, i8* nonnull %3) #5, !dbg !849
  call void @llvm.lifetime.end(i64 8, i8* nonnull %2) #5, !dbg !849
  call void @llvm.lifetime.end(i64 8, i8* nonnull %1) #5, !dbg !849
  call void @llvm.lifetime.end(i64 8, i8* nonnull %0) #5, !dbg !849
  ret void, !dbg !849
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #2

declare i64 @get_time() local_unnamed_addr #3

declare i32 @cudaDeviceSetLimit(i32, i64) local_unnamed_addr #3

declare i32 @cudaMalloc(i8**, i64) local_unnamed_addr #3

declare i32 @cudaMemcpy(i8*, i8*, i64, i32) local_unnamed_addr #3

declare i32 @cudaConfigureCall(i64, i32, i64, i32, i64, %struct.CUstream_st*) local_unnamed_addr #3

declare i32 @cudaThreadSynchronize() local_unnamed_addr #3

declare i32 @cudaFree(i8*) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #5

attributes #0 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { argmemonly nounwind }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { cold }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!580, !581}
!llvm.ident = !{!582}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !1, producer: "clang version 5.0.0 (trunk 294196)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !18, imports: !22)
!1 = !DIFile(filename: "./kernel/kernel_gpu_cuda_wrapper.cu", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/lavaMDllvm")
!2 = !{!3, !11}
!3 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaLimit", file: !4, line: 1145, size: 32, elements: !5, identifier: "_ZTS9cudaLimit")
!4 = !DIFile(filename: "/usr/local/cuda/include/driver_types.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/lavaMDllvm")
!5 = !{!6, !7, !8, !9, !10}
!6 = !DIEnumerator(name: "cudaLimitStackSize", value: 0)
!7 = !DIEnumerator(name: "cudaLimitPrintfFifoSize", value: 1)
!8 = !DIEnumerator(name: "cudaLimitMallocHeapSize", value: 2)
!9 = !DIEnumerator(name: "cudaLimitDevRuntimeSyncDepth", value: 3)
!10 = !DIEnumerator(name: "cudaLimitDevRuntimePendingLaunchCount", value: 4)
!11 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cudaMemcpyKind", file: !4, line: 796, size: 32, elements: !12, identifier: "_ZTS14cudaMemcpyKind")
!12 = !{!13, !14, !15, !16, !17}
!13 = !DIEnumerator(name: "cudaMemcpyHostToHost", value: 0)
!14 = !DIEnumerator(name: "cudaMemcpyHostToDevice", value: 1)
!15 = !DIEnumerator(name: "cudaMemcpyDeviceToHost", value: 2)
!16 = !DIEnumerator(name: "cudaMemcpyDeviceToDevice", value: 3)
!17 = !DIEnumerator(name: "cudaMemcpyDefault", value: 4)
!18 = !{!19, !21}
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!21 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!22 = !{!23, !30, !34, !36, !38, !40, !42, !46, !48, !50, !52, !54, !56, !58, !60, !62, !64, !66, !68, !70, !72, !74, !78, !80, !82, !84, !89, !94, !96, !98, !103, !107, !109, !111, !113, !115, !117, !119, !121, !123, !128, !132, !134, !136, !140, !142, !144, !146, !148, !150, !154, !156, !158, !163, !171, !175, !177, !179, !183, !185, !187, !191, !193, !195, !199, !201, !203, !205, !207, !209, !211, !213, !215, !217, !222, !224, !226, !230, !232, !234, !236, !238, !240, !242, !244, !248, !252, !254, !256, !261, !263, !265, !267, !269, !271, !273, !277, !283, !287, !291, !296, !299, !303, !307, !321, !325, !329, !333, !337, !342, !344, !348, !352, !356, !364, !368, !372, !376, !380, !385, !391, !395, !399, !401, !409, !413, !421, !423, !425, !429, !433, !437, !442, !446, !451, !452, !453, !454, !457, !458, !459, !460, !461, !462, !463, !466, !468, !470, !472, !474, !476, !478, !480, !483, !485, !487, !489, !491, !493, !495, !497, !499, !501, !503, !505, !507, !509, !511, !513, !515, !517, !519, !521, !523, !525, !527, !529, !531, !533, !535, !537, !539, !541, !543, !545, !547, !551, !552, !554, !556, !558, !560, !562, !564, !566, !568, !570, !572, !574, !576, !578}
!23 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !26, line: 201)
!24 = !DINamespace(name: "std", scope: null, file: !25, line: 195)
!25 = !DIFile(filename: "/home/dshen/llvm/build/bin/../lib/clang/5.0.0/include/__clang_cuda_math_forward_declares.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/lavaMDllvm")
!26 = !DISubprogram(name: "abs", linkageName: "_ZL3absx", scope: !25, file: !25, line: 44, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!27 = !DISubroutineType(types: !28)
!28 = !{!29, !29}
!29 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!30 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !31, line: 202)
!31 = !DISubprogram(name: "acos", linkageName: "_ZL4acosf", scope: !25, file: !25, line: 46, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!32 = !DISubroutineType(types: !33)
!33 = !{!21, !21}
!34 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !35, line: 203)
!35 = !DISubprogram(name: "acosh", linkageName: "_ZL5acoshf", scope: !25, file: !25, line: 48, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!36 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !37, line: 204)
!37 = !DISubprogram(name: "asin", linkageName: "_ZL4asinf", scope: !25, file: !25, line: 50, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!38 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !39, line: 205)
!39 = !DISubprogram(name: "asinh", linkageName: "_ZL5asinhf", scope: !25, file: !25, line: 52, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!40 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !41, line: 206)
!41 = !DISubprogram(name: "atan", linkageName: "_ZL4atanf", scope: !25, file: !25, line: 56, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!42 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !43, line: 207)
!43 = !DISubprogram(name: "atan2", linkageName: "_ZL5atan2ff", scope: !25, file: !25, line: 54, type: !44, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!44 = !DISubroutineType(types: !45)
!45 = !{!21, !21, !21}
!46 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !47, line: 208)
!47 = !DISubprogram(name: "atanh", linkageName: "_ZL5atanhf", scope: !25, file: !25, line: 58, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!48 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !49, line: 209)
!49 = !DISubprogram(name: "cbrt", linkageName: "_ZL4cbrtf", scope: !25, file: !25, line: 60, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!50 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !51, line: 210)
!51 = !DISubprogram(name: "ceil", linkageName: "_ZL4ceilf", scope: !25, file: !25, line: 62, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!52 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !53, line: 211)
!53 = !DISubprogram(name: "copysign", linkageName: "_ZL8copysignff", scope: !25, file: !25, line: 64, type: !44, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!54 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !55, line: 212)
!55 = !DISubprogram(name: "cos", linkageName: "_ZL3cosf", scope: !25, file: !25, line: 66, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!56 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !57, line: 213)
!57 = !DISubprogram(name: "cosh", linkageName: "_ZL4coshf", scope: !25, file: !25, line: 68, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!58 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !59, line: 214)
!59 = !DISubprogram(name: "erf", linkageName: "_ZL3erff", scope: !25, file: !25, line: 72, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!60 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !61, line: 215)
!61 = !DISubprogram(name: "erfc", linkageName: "_ZL4erfcf", scope: !25, file: !25, line: 70, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!62 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !63, line: 216)
!63 = !DISubprogram(name: "exp", linkageName: "_ZL3expf", scope: !25, file: !25, line: 76, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!64 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !65, line: 217)
!65 = !DISubprogram(name: "exp2", linkageName: "_ZL4exp2f", scope: !25, file: !25, line: 74, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!66 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !67, line: 218)
!67 = !DISubprogram(name: "expm1", linkageName: "_ZL5expm1f", scope: !25, file: !25, line: 78, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!68 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !69, line: 219)
!69 = !DISubprogram(name: "fabs", linkageName: "_ZL4fabsf", scope: !25, file: !25, line: 80, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!70 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !71, line: 220)
!71 = !DISubprogram(name: "fdim", linkageName: "_ZL4fdimff", scope: !25, file: !25, line: 82, type: !44, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!72 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !73, line: 221)
!73 = !DISubprogram(name: "floor", linkageName: "_ZL5floorf", scope: !25, file: !25, line: 84, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!74 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !75, line: 222)
!75 = !DISubprogram(name: "fma", linkageName: "_ZL3fmafff", scope: !25, file: !25, line: 86, type: !76, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!76 = !DISubroutineType(types: !77)
!77 = !{!21, !21, !21, !21}
!78 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !79, line: 223)
!79 = !DISubprogram(name: "fmax", linkageName: "_ZL4fmaxff", scope: !25, file: !25, line: 88, type: !44, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!80 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !81, line: 224)
!81 = !DISubprogram(name: "fmin", linkageName: "_ZL4fminff", scope: !25, file: !25, line: 90, type: !44, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!82 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !83, line: 225)
!83 = !DISubprogram(name: "fmod", linkageName: "_ZL4fmodff", scope: !25, file: !25, line: 92, type: !44, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!84 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !85, line: 226)
!85 = !DISubprogram(name: "fpclassify", linkageName: "_ZL10fpclassifyf", scope: !25, file: !25, line: 94, type: !86, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!86 = !DISubroutineType(types: !87)
!87 = !{!88, !21}
!88 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!89 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !90, line: 227)
!90 = !DISubprogram(name: "frexp", linkageName: "_ZL5frexpfPi", scope: !25, file: !25, line: 96, type: !91, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!91 = !DISubroutineType(types: !92)
!92 = !{!21, !21, !93}
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!94 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !95, line: 228)
!95 = !DISubprogram(name: "hypot", linkageName: "_ZL5hypotff", scope: !25, file: !25, line: 98, type: !44, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!96 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !97, line: 229)
!97 = !DISubprogram(name: "ilogb", linkageName: "_ZL5ilogbf", scope: !25, file: !25, line: 100, type: !86, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!98 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !99, line: 230)
!99 = !DISubprogram(name: "isfinite", linkageName: "_ZL8isfinitef", scope: !25, file: !25, line: 102, type: !100, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!100 = !DISubroutineType(types: !101)
!101 = !{!102, !21}
!102 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!103 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !104, line: 231)
!104 = !DISubprogram(name: "isgreater", linkageName: "_ZL9isgreaterff", scope: !25, file: !25, line: 106, type: !105, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!105 = !DISubroutineType(types: !106)
!106 = !{!102, !21, !21}
!107 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !108, line: 232)
!108 = !DISubprogram(name: "isgreaterequal", linkageName: "_ZL14isgreaterequalff", scope: !25, file: !25, line: 105, type: !105, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!109 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !110, line: 233)
!110 = !DISubprogram(name: "isinf", linkageName: "_ZL5isinff", scope: !25, file: !25, line: 108, type: !100, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!111 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !112, line: 234)
!112 = !DISubprogram(name: "isless", linkageName: "_ZL6islessff", scope: !25, file: !25, line: 112, type: !105, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!113 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !114, line: 235)
!114 = !DISubprogram(name: "islessequal", linkageName: "_ZL11islessequalff", scope: !25, file: !25, line: 111, type: !105, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!115 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !116, line: 236)
!116 = !DISubprogram(name: "islessgreater", linkageName: "_ZL13islessgreaterff", scope: !25, file: !25, line: 114, type: !105, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!117 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !118, line: 237)
!118 = !DISubprogram(name: "isnan", linkageName: "_ZL5isnanf", scope: !25, file: !25, line: 116, type: !100, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !120, line: 238)
!120 = !DISubprogram(name: "isnormal", linkageName: "_ZL8isnormalf", scope: !25, file: !25, line: 118, type: !100, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !122, line: 239)
!122 = !DISubprogram(name: "isunordered", linkageName: "_ZL11isunorderedff", scope: !25, file: !25, line: 120, type: !105, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !124, line: 240)
!124 = !DISubprogram(name: "labs", linkageName: "_ZL4labsl", scope: !25, file: !25, line: 121, type: !125, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!125 = !DISubroutineType(types: !126)
!126 = !{!127, !127}
!127 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!128 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !129, line: 241)
!129 = !DISubprogram(name: "ldexp", linkageName: "_ZL5ldexpfi", scope: !25, file: !25, line: 123, type: !130, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!130 = !DISubroutineType(types: !131)
!131 = !{!21, !21, !88}
!132 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !133, line: 242)
!133 = !DISubprogram(name: "lgamma", linkageName: "_ZL6lgammaf", scope: !25, file: !25, line: 125, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!134 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !135, line: 243)
!135 = !DISubprogram(name: "llabs", linkageName: "_ZL5llabsx", scope: !25, file: !25, line: 126, type: !27, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!136 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !137, line: 244)
!137 = !DISubprogram(name: "llrint", linkageName: "_ZL6llrintf", scope: !25, file: !25, line: 128, type: !138, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!138 = !DISubroutineType(types: !139)
!139 = !{!29, !21}
!140 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !141, line: 245)
!141 = !DISubprogram(name: "log", linkageName: "_ZL3logf", scope: !25, file: !25, line: 138, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!142 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !143, line: 246)
!143 = !DISubprogram(name: "log10", linkageName: "_ZL5log10f", scope: !25, file: !25, line: 130, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!144 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !145, line: 247)
!145 = !DISubprogram(name: "log1p", linkageName: "_ZL5log1pf", scope: !25, file: !25, line: 132, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !147, line: 248)
!147 = !DISubprogram(name: "log2", linkageName: "_ZL4log2f", scope: !25, file: !25, line: 134, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!148 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !149, line: 249)
!149 = !DISubprogram(name: "logb", linkageName: "_ZL4logbf", scope: !25, file: !25, line: 136, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!150 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !151, line: 250)
!151 = !DISubprogram(name: "lrint", linkageName: "_ZL5lrintf", scope: !25, file: !25, line: 140, type: !152, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!152 = !DISubroutineType(types: !153)
!153 = !{!127, !21}
!154 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !155, line: 251)
!155 = !DISubprogram(name: "lround", linkageName: "_ZL6lroundf", scope: !25, file: !25, line: 142, type: !152, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !157, line: 252)
!157 = !DISubprogram(name: "llround", linkageName: "_ZL7llroundf", scope: !25, file: !25, line: 143, type: !138, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!158 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !159, line: 253)
!159 = !DISubprogram(name: "modf", linkageName: "_ZL4modffPf", scope: !25, file: !25, line: 145, type: !160, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!160 = !DISubroutineType(types: !161)
!161 = !{!21, !21, !162}
!162 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!163 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !164, line: 254)
!164 = !DISubprogram(name: "nan", linkageName: "_ZL3nanPKc", scope: !25, file: !25, line: 146, type: !165, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!165 = !DISubroutineType(types: !166)
!166 = !{!167, !168}
!167 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!168 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !169, size: 64)
!169 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !170)
!170 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!171 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !172, line: 255)
!172 = !DISubprogram(name: "nanf", linkageName: "_ZL4nanfPKc", scope: !25, file: !25, line: 147, type: !173, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!173 = !DISubroutineType(types: !174)
!174 = !{!21, !168}
!175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !176, line: 256)
!176 = !DISubprogram(name: "nearbyint", linkageName: "_ZL9nearbyintf", scope: !25, file: !25, line: 149, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !178, line: 257)
!178 = !DISubprogram(name: "nextafter", linkageName: "_ZL9nextafterff", scope: !25, file: !25, line: 151, type: !44, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !180, line: 258)
!180 = !DISubprogram(name: "nexttoward", linkageName: "_ZL10nexttowardfd", scope: !25, file: !25, line: 153, type: !181, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!181 = !DISubroutineType(types: !182)
!182 = !{!21, !21, !167}
!183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !184, line: 259)
!184 = !DISubprogram(name: "pow", linkageName: "_ZL3powfi", scope: !25, file: !25, line: 158, type: !130, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !186, line: 260)
!186 = !DISubprogram(name: "remainder", linkageName: "_ZL9remainderff", scope: !25, file: !25, line: 160, type: !44, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !188, line: 261)
!188 = !DISubprogram(name: "remquo", linkageName: "_ZL6remquoffPi", scope: !25, file: !25, line: 162, type: !189, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!189 = !DISubroutineType(types: !190)
!190 = !{!21, !21, !21, !93}
!191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !192, line: 262)
!192 = !DISubprogram(name: "rint", linkageName: "_ZL4rintf", scope: !25, file: !25, line: 164, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!193 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !194, line: 263)
!194 = !DISubprogram(name: "round", linkageName: "_ZL5roundf", scope: !25, file: !25, line: 166, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!195 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !196, line: 264)
!196 = !DISubprogram(name: "scalbln", linkageName: "_ZL7scalblnfl", scope: !25, file: !25, line: 168, type: !197, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!197 = !DISubroutineType(types: !198)
!198 = !{!21, !21, !127}
!199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !200, line: 265)
!200 = !DISubprogram(name: "scalbn", linkageName: "_ZL6scalbnfi", scope: !25, file: !25, line: 170, type: !130, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!201 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !202, line: 266)
!202 = !DISubprogram(name: "signbit", linkageName: "_ZL7signbitf", scope: !25, file: !25, line: 172, type: !100, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !204, line: 267)
!204 = !DISubprogram(name: "sin", linkageName: "_ZL3sinf", scope: !25, file: !25, line: 174, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!205 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !206, line: 268)
!206 = !DISubprogram(name: "sinh", linkageName: "_ZL4sinhf", scope: !25, file: !25, line: 176, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!207 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !208, line: 269)
!208 = !DISubprogram(name: "sqrt", linkageName: "_ZL4sqrtf", scope: !25, file: !25, line: 178, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !210, line: 270)
!210 = !DISubprogram(name: "tan", linkageName: "_ZL3tanf", scope: !25, file: !25, line: 180, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!211 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !212, line: 271)
!212 = !DISubprogram(name: "tanh", linkageName: "_ZL4tanhf", scope: !25, file: !25, line: 182, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !214, line: 272)
!214 = !DISubprogram(name: "tgamma", linkageName: "_ZL6tgammaf", scope: !25, file: !25, line: 184, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !216, line: 273)
!216 = !DISubprogram(name: "trunc", linkageName: "_ZL5truncf", scope: !25, file: !25, line: 186, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!217 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !218, line: 102)
!218 = !DISubprogram(name: "acos", scope: !219, file: !219, line: 54, type: !220, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!219 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/lavaMDllvm")
!220 = !DISubroutineType(types: !221)
!221 = !{!167, !167}
!222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !223, line: 121)
!223 = !DISubprogram(name: "asin", scope: !219, file: !219, line: 56, type: !220, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !225, line: 140)
!225 = !DISubprogram(name: "atan", scope: !219, file: !219, line: 58, type: !220, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !227, line: 159)
!227 = !DISubprogram(name: "atan2", scope: !219, file: !219, line: 60, type: !228, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!228 = !DISubroutineType(types: !229)
!229 = !{!167, !167, !167}
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !231, line: 180)
!231 = !DISubprogram(name: "ceil", scope: !219, file: !219, line: 178, type: !220, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !233, line: 199)
!233 = !DISubprogram(name: "cos", scope: !219, file: !219, line: 63, type: !220, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !235, line: 218)
!235 = !DISubprogram(name: "cosh", scope: !219, file: !219, line: 72, type: !220, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !237, line: 237)
!237 = !DISubprogram(name: "exp", scope: !219, file: !219, line: 100, type: !220, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !239, line: 256)
!239 = !DISubprogram(name: "fabs", scope: !219, file: !219, line: 181, type: !220, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !241, line: 275)
!241 = !DISubprogram(name: "floor", scope: !219, file: !219, line: 184, type: !220, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !243, line: 294)
!243 = !DISubprogram(name: "fmod", scope: !219, file: !219, line: 187, type: !228, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!244 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !245, line: 315)
!245 = !DISubprogram(name: "frexp", scope: !219, file: !219, line: 103, type: !246, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!246 = !DISubroutineType(types: !247)
!247 = !{!167, !167, !93}
!248 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !249, line: 334)
!249 = !DISubprogram(name: "ldexp", scope: !219, file: !219, line: 106, type: !250, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!250 = !DISubroutineType(types: !251)
!251 = !{!167, !167, !88}
!252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !253, line: 353)
!253 = !DISubprogram(name: "log", scope: !219, file: !219, line: 109, type: !220, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !255, line: 372)
!255 = !DISubprogram(name: "log10", scope: !219, file: !219, line: 112, type: !220, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !257, line: 391)
!257 = !DISubprogram(name: "modf", scope: !219, file: !219, line: 115, type: !258, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!258 = !DISubroutineType(types: !259)
!259 = !{!167, !167, !260}
!260 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !167, size: 64)
!261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !262, line: 403)
!262 = !DISubprogram(name: "pow", scope: !219, file: !219, line: 153, type: !228, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!263 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !264, line: 440)
!264 = !DISubprogram(name: "sin", scope: !219, file: !219, line: 65, type: !220, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !266, line: 459)
!266 = !DISubprogram(name: "sinh", scope: !219, file: !219, line: 74, type: !220, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!267 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !268, line: 478)
!268 = !DISubprogram(name: "sqrt", scope: !219, file: !219, line: 156, type: !220, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!269 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !270, line: 497)
!270 = !DISubprogram(name: "tan", scope: !219, file: !219, line: 67, type: !220, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!271 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !272, line: 516)
!272 = !DISubprogram(name: "tanh", scope: !219, file: !219, line: 76, type: !220, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!273 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !274, line: 118)
!274 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !275, line: 101, baseType: !276)
!275 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/lavaMDllvm")
!276 = !DICompositeType(tag: DW_TAG_structure_type, file: !275, line: 97, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!277 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !278, line: 119)
!278 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !275, line: 109, baseType: !279)
!279 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !275, line: 105, size: 128, elements: !280, identifier: "_ZTS6ldiv_t")
!280 = !{!281, !282}
!281 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !279, file: !275, line: 107, baseType: !127, size: 64)
!282 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !279, file: !275, line: 108, baseType: !127, size: 64, offset: 64)
!283 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !284, line: 121)
!284 = !DISubprogram(name: "abort", scope: !275, file: !275, line: 515, type: !285, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: true)
!285 = !DISubroutineType(types: !286)
!286 = !{null}
!287 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !288, line: 122)
!288 = !DISubprogram(name: "abs", scope: !275, file: !275, line: 775, type: !289, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!289 = !DISubroutineType(types: !290)
!290 = !{!88, !88}
!291 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !292, line: 123)
!292 = !DISubprogram(name: "atexit", scope: !275, file: !275, line: 519, type: !293, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!293 = !DISubroutineType(types: !294)
!294 = !{!88, !295}
!295 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !285, size: 64)
!296 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !297, line: 129)
!297 = !DISubprogram(name: "atof", scope: !298, file: !298, line: 26, type: !165, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!298 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/lavaMDllvm")
!299 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !300, line: 130)
!300 = !DISubprogram(name: "atoi", scope: !275, file: !275, line: 278, type: !301, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!301 = !DISubroutineType(types: !302)
!302 = !{!88, !168}
!303 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !304, line: 131)
!304 = !DISubprogram(name: "atol", scope: !275, file: !275, line: 283, type: !305, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!305 = !DISubroutineType(types: !306)
!306 = !{!127, !168}
!307 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !308, line: 132)
!308 = !DISubprogram(name: "bsearch", scope: !309, file: !309, line: 20, type: !310, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!309 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdlib-bsearch.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/lavaMDllvm")
!310 = !DISubroutineType(types: !311)
!311 = !{!20, !312, !312, !314, !314, !317}
!312 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !313, size: 64)
!313 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!314 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !315, line: 62, baseType: !316)
!315 = !DIFile(filename: "/home/dshen/llvm/build/bin/../lib/clang/5.0.0/include/stddef.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/lavaMDllvm")
!316 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!317 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !275, line: 742, baseType: !318)
!318 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !319, size: 64)
!319 = !DISubroutineType(types: !320)
!320 = !{!88, !312, !312}
!321 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !322, line: 133)
!322 = !DISubprogram(name: "calloc", scope: !275, file: !275, line: 468, type: !323, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!323 = !DISubroutineType(types: !324)
!324 = !{!20, !314, !314}
!325 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !326, line: 134)
!326 = !DISubprogram(name: "div", scope: !275, file: !275, line: 789, type: !327, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!327 = !DISubroutineType(types: !328)
!328 = !{!274, !88, !88}
!329 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !330, line: 135)
!330 = !DISubprogram(name: "exit", scope: !275, file: !275, line: 543, type: !331, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: true)
!331 = !DISubroutineType(types: !332)
!332 = !{null, !88}
!333 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !334, line: 136)
!334 = !DISubprogram(name: "free", scope: !275, file: !275, line: 483, type: !335, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!335 = !DISubroutineType(types: !336)
!336 = !{null, !20}
!337 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !338, line: 137)
!338 = !DISubprogram(name: "getenv", scope: !275, file: !275, line: 564, type: !339, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!339 = !DISubroutineType(types: !340)
!340 = !{!341, !168}
!341 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !170, size: 64)
!342 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !343, line: 138)
!343 = !DISubprogram(name: "labs", scope: !275, file: !275, line: 776, type: !125, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!344 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !345, line: 139)
!345 = !DISubprogram(name: "ldiv", scope: !275, file: !275, line: 791, type: !346, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!346 = !DISubroutineType(types: !347)
!347 = !{!278, !127, !127}
!348 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !349, line: 140)
!349 = !DISubprogram(name: "malloc", scope: !275, file: !275, line: 466, type: !350, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!350 = !DISubroutineType(types: !351)
!351 = !{!20, !314}
!352 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !353, line: 142)
!353 = !DISubprogram(name: "mblen", scope: !275, file: !275, line: 863, type: !354, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!354 = !DISubroutineType(types: !355)
!355 = !{!88, !168, !314}
!356 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !357, line: 143)
!357 = !DISubprogram(name: "mbstowcs", scope: !275, file: !275, line: 874, type: !358, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!358 = !DISubroutineType(types: !359)
!359 = !{!314, !360, !363, !314}
!360 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !361)
!361 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !362, size: 64)
!362 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!363 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !168)
!364 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !365, line: 144)
!365 = !DISubprogram(name: "mbtowc", scope: !275, file: !275, line: 866, type: !366, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!366 = !DISubroutineType(types: !367)
!367 = !{!88, !360, !363, !314}
!368 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !369, line: 146)
!369 = !DISubprogram(name: "qsort", scope: !275, file: !275, line: 765, type: !370, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!370 = !DISubroutineType(types: !371)
!371 = !{null, !20, !314, !314, !317}
!372 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !373, line: 152)
!373 = !DISubprogram(name: "rand", scope: !275, file: !275, line: 374, type: !374, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!374 = !DISubroutineType(types: !375)
!375 = !{!88}
!376 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !377, line: 153)
!377 = !DISubprogram(name: "realloc", scope: !275, file: !275, line: 480, type: !378, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!378 = !DISubroutineType(types: !379)
!379 = !{!20, !20, !314}
!380 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !381, line: 154)
!381 = !DISubprogram(name: "srand", scope: !275, file: !275, line: 376, type: !382, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!382 = !DISubroutineType(types: !383)
!383 = !{null, !384}
!384 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!385 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !386, line: 155)
!386 = !DISubprogram(name: "strtod", scope: !275, file: !275, line: 164, type: !387, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!387 = !DISubroutineType(types: !388)
!388 = !{!167, !363, !389}
!389 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !390)
!390 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !341, size: 64)
!391 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !392, line: 156)
!392 = !DISubprogram(name: "strtol", scope: !275, file: !275, line: 183, type: !393, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!393 = !DISubroutineType(types: !394)
!394 = !{!127, !363, !389, !88}
!395 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !396, line: 157)
!396 = !DISubprogram(name: "strtoul", scope: !275, file: !275, line: 187, type: !397, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!397 = !DISubroutineType(types: !398)
!398 = !{!316, !363, !389, !88}
!399 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !400, line: 158)
!400 = !DISubprogram(name: "system", scope: !275, file: !275, line: 717, type: !301, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!401 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !402, line: 160)
!402 = !DISubprogram(name: "wcstombs", scope: !275, file: !275, line: 877, type: !403, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!403 = !DISubroutineType(types: !404)
!404 = !{!314, !405, !406, !314}
!405 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !341)
!406 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !407)
!407 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !408, size: 64)
!408 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !362)
!409 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !410, line: 161)
!410 = !DISubprogram(name: "wctomb", scope: !275, file: !275, line: 870, type: !411, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!411 = !DISubroutineType(types: !412)
!412 = !{!88, !341, !362}
!413 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !414, entity: !416, line: 201)
!414 = !DINamespace(name: "__gnu_cxx", scope: null, file: !415, line: 68)
!415 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/bits/cpp_type_traits.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/lavaMDllvm")
!416 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !275, line: 121, baseType: !417)
!417 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !275, line: 117, size: 128, elements: !418, identifier: "_ZTS7lldiv_t")
!418 = !{!419, !420}
!419 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !417, file: !275, line: 119, baseType: !29, size: 64)
!420 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !417, file: !275, line: 120, baseType: !29, size: 64, offset: 64)
!421 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !414, entity: !422, line: 207)
!422 = !DISubprogram(name: "_Exit", scope: !275, file: !275, line: 557, type: !331, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: true)
!423 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !414, entity: !424, line: 211)
!424 = !DISubprogram(name: "llabs", scope: !275, file: !275, line: 780, type: !27, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!425 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !414, entity: !426, line: 217)
!426 = !DISubprogram(name: "lldiv", scope: !275, file: !275, line: 797, type: !427, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!427 = !DISubroutineType(types: !428)
!428 = !{!416, !29, !29}
!429 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !414, entity: !430, line: 228)
!430 = !DISubprogram(name: "atoll", scope: !275, file: !275, line: 292, type: !431, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!431 = !DISubroutineType(types: !432)
!432 = !{!29, !168}
!433 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !414, entity: !434, line: 229)
!434 = !DISubprogram(name: "strtoll", scope: !275, file: !275, line: 209, type: !435, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!435 = !DISubroutineType(types: !436)
!436 = !{!29, !363, !389, !88}
!437 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !414, entity: !438, line: 230)
!438 = !DISubprogram(name: "strtoull", scope: !275, file: !275, line: 214, type: !439, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!439 = !DISubroutineType(types: !440)
!440 = !{!441, !363, !389, !88}
!441 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!442 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !414, entity: !443, line: 232)
!443 = !DISubprogram(name: "strtof", scope: !275, file: !275, line: 172, type: !444, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!444 = !DISubroutineType(types: !445)
!445 = !{!21, !363, !389}
!446 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !414, entity: !447, line: 233)
!447 = !DISubprogram(name: "strtold", scope: !275, file: !275, line: 175, type: !448, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!448 = !DISubroutineType(types: !449)
!449 = !{!450, !363, !389}
!450 = !DIBasicType(name: "long double", size: 128, encoding: DW_ATE_float)
!451 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !416, line: 241)
!452 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !422, line: 243)
!453 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !424, line: 245)
!454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !455, line: 246)
!455 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !414, file: !456, line: 214, type: !427, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!456 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/cstdlib", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/lavaMDllvm")
!457 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !426, line: 247)
!458 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !430, line: 249)
!459 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !443, line: 250)
!460 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !434, line: 251)
!461 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !438, line: 252)
!462 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !447, line: 253)
!463 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !464, line: 418)
!464 = !DISubprogram(name: "acosf", linkageName: "_ZL5acosff", scope: !465, file: !465, line: 1126, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!465 = !DIFile(filename: "/usr/local/cuda/include/math_functions.hpp", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/lavaMDllvm")
!466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !467, line: 419)
!467 = !DISubprogram(name: "acoshf", linkageName: "_ZL6acoshff", scope: !465, file: !465, line: 1154, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!468 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !469, line: 420)
!469 = !DISubprogram(name: "asinf", linkageName: "_ZL5asinff", scope: !465, file: !465, line: 1121, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!470 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !471, line: 421)
!471 = !DISubprogram(name: "asinhf", linkageName: "_ZL6asinhff", scope: !465, file: !465, line: 1159, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!472 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !473, line: 422)
!473 = !DISubprogram(name: "atan2f", linkageName: "_ZL6atan2fff", scope: !465, file: !465, line: 1111, type: !44, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!474 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !475, line: 423)
!475 = !DISubprogram(name: "atanf", linkageName: "_ZL5atanff", scope: !465, file: !465, line: 1116, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!476 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !477, line: 424)
!477 = !DISubprogram(name: "atanhf", linkageName: "_ZL6atanhff", scope: !465, file: !465, line: 1164, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!478 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !479, line: 425)
!479 = !DISubprogram(name: "cbrtf", linkageName: "_ZL5cbrtff", scope: !465, file: !465, line: 1199, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !481, line: 426)
!481 = !DISubprogram(name: "ceilf", linkageName: "_ZL5ceilff", scope: !482, file: !482, line: 647, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!482 = !DIFile(filename: "/usr/local/cuda/include/device_functions.hpp", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/lavaMDllvm")
!483 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !484, line: 427)
!484 = !DISubprogram(name: "copysignf", linkageName: "_ZL9copysignfff", scope: !465, file: !465, line: 973, type: !44, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!485 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !486, line: 428)
!486 = !DISubprogram(name: "cosf", linkageName: "_ZL4cosff", scope: !465, file: !465, line: 1027, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!487 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !488, line: 429)
!488 = !DISubprogram(name: "coshf", linkageName: "_ZL5coshff", scope: !465, file: !465, line: 1096, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!489 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !490, line: 430)
!490 = !DISubprogram(name: "erfcf", linkageName: "_ZL5erfcff", scope: !465, file: !465, line: 1259, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!491 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !492, line: 431)
!492 = !DISubprogram(name: "erff", linkageName: "_ZL4erfff", scope: !465, file: !465, line: 1249, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!493 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !494, line: 432)
!494 = !DISubprogram(name: "exp2f", linkageName: "_ZL5exp2ff", scope: !482, file: !482, line: 637, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!495 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !496, line: 433)
!496 = !DISubprogram(name: "expf", linkageName: "_ZL4expff", scope: !465, file: !465, line: 1078, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!497 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !498, line: 434)
!498 = !DISubprogram(name: "expm1f", linkageName: "_ZL6expm1ff", scope: !465, file: !465, line: 1169, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!499 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !500, line: 435)
!500 = !DISubprogram(name: "fabsf", linkageName: "_ZL5fabsff", scope: !482, file: !482, line: 582, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!501 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !502, line: 436)
!502 = !DISubprogram(name: "fdimf", linkageName: "_ZL5fdimfff", scope: !465, file: !465, line: 1385, type: !44, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!503 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !504, line: 437)
!504 = !DISubprogram(name: "floorf", linkageName: "_ZL6floorff", scope: !482, file: !482, line: 572, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!505 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !506, line: 438)
!506 = !DISubprogram(name: "fmaf", linkageName: "_ZL4fmaffff", scope: !465, file: !465, line: 1337, type: !76, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!507 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !508, line: 439)
!508 = !DISubprogram(name: "fmaxf", linkageName: "_ZL5fmaxfff", scope: !482, file: !482, line: 602, type: !44, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!509 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !510, line: 440)
!510 = !DISubprogram(name: "fminf", linkageName: "_ZL5fminfff", scope: !482, file: !482, line: 597, type: !44, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!511 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !512, line: 441)
!512 = !DISubprogram(name: "fmodf", linkageName: "_ZL5fmodfff", scope: !465, file: !465, line: 1322, type: !44, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!513 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !514, line: 442)
!514 = !DISubprogram(name: "frexpf", linkageName: "_ZL6frexpffPi", scope: !465, file: !465, line: 1312, type: !91, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!515 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !516, line: 443)
!516 = !DISubprogram(name: "hypotf", linkageName: "_ZL6hypotfff", scope: !465, file: !465, line: 1174, type: !44, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!517 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !518, line: 444)
!518 = !DISubprogram(name: "ilogbf", linkageName: "_ZL6ilogbff", scope: !465, file: !465, line: 1390, type: !86, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!519 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !520, line: 445)
!520 = !DISubprogram(name: "ldexpf", linkageName: "_ZL6ldexpffi", scope: !465, file: !465, line: 1289, type: !130, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!521 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !522, line: 446)
!522 = !DISubprogram(name: "lgammaf", linkageName: "_ZL7lgammaff", scope: !465, file: !465, line: 1284, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!523 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !524, line: 447)
!524 = !DISubprogram(name: "llrintf", linkageName: "_ZL7llrintff", scope: !465, file: !465, line: 933, type: !138, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!525 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !526, line: 448)
!526 = !DISubprogram(name: "llroundf", linkageName: "_ZL8llroundff", scope: !465, file: !465, line: 1371, type: !138, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!527 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !528, line: 449)
!528 = !DISubprogram(name: "log10f", linkageName: "_ZL6log10ff", scope: !465, file: !465, line: 1140, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!529 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !530, line: 450)
!530 = !DISubprogram(name: "log1pf", linkageName: "_ZL6log1pff", scope: !465, file: !465, line: 1149, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!531 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !532, line: 451)
!532 = !DISubprogram(name: "log2f", linkageName: "_ZL5log2ff", scope: !465, file: !465, line: 1069, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!533 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !534, line: 452)
!534 = !DISubprogram(name: "logbf", linkageName: "_ZL5logbff", scope: !465, file: !465, line: 1395, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!535 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !536, line: 453)
!536 = !DISubprogram(name: "logf", linkageName: "_ZL4logff", scope: !465, file: !465, line: 1131, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!537 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !538, line: 454)
!538 = !DISubprogram(name: "lrintf", linkageName: "_ZL6lrintff", scope: !465, file: !465, line: 924, type: !152, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!539 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !540, line: 455)
!540 = !DISubprogram(name: "lroundf", linkageName: "_ZL7lroundff", scope: !465, file: !465, line: 1376, type: !152, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!541 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !542, line: 456)
!542 = !DISubprogram(name: "modff", linkageName: "_ZL5modfffPf", scope: !465, file: !465, line: 1317, type: !160, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!543 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !544, line: 457)
!544 = !DISubprogram(name: "nearbyintf", linkageName: "_ZL10nearbyintff", scope: !465, file: !465, line: 938, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!545 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !546, line: 458)
!546 = !DISubprogram(name: "nextafterf", linkageName: "_ZL10nextafterfff", scope: !465, file: !465, line: 1002, type: !44, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!547 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !548, line: 459)
!548 = !DISubprogram(name: "nexttowardf", scope: !219, file: !219, line: 284, type: !549, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!549 = !DISubroutineType(types: !550)
!550 = !{!21, !21, !450}
!551 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !548, line: 460)
!552 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !553, line: 461)
!553 = !DISubprogram(name: "powf", linkageName: "_ZL4powfff", scope: !465, file: !465, line: 1352, type: !44, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!554 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !555, line: 462)
!555 = !DISubprogram(name: "remainderf", linkageName: "_ZL10remainderfff", scope: !465, file: !465, line: 1327, type: !44, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!556 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !557, line: 463)
!557 = !DISubprogram(name: "remquof", linkageName: "_ZL7remquofffPi", scope: !465, file: !465, line: 1332, type: !189, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!558 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !559, line: 464)
!559 = !DISubprogram(name: "rintf", linkageName: "_ZL5rintff", scope: !465, file: !465, line: 919, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!560 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !561, line: 465)
!561 = !DISubprogram(name: "roundf", linkageName: "_ZL6roundff", scope: !465, file: !465, line: 1366, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!562 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !563, line: 466)
!563 = !DISubprogram(name: "scalblnf", linkageName: "_ZL8scalblnffl", scope: !465, file: !465, line: 1299, type: !197, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!564 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !565, line: 467)
!565 = !DISubprogram(name: "scalbnf", linkageName: "_ZL7scalbnffi", scope: !465, file: !465, line: 1294, type: !130, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!566 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !567, line: 468)
!567 = !DISubprogram(name: "sinf", linkageName: "_ZL4sinff", scope: !465, file: !465, line: 1018, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!568 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !569, line: 469)
!569 = !DISubprogram(name: "sinhf", linkageName: "_ZL5sinhff", scope: !465, file: !465, line: 1101, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!570 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !571, line: 470)
!571 = !DISubprogram(name: "sqrtf", linkageName: "_ZL5sqrtff", scope: !482, file: !482, line: 887, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!572 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !573, line: 471)
!573 = !DISubprogram(name: "tanf", linkageName: "_ZL4tanff", scope: !465, file: !465, line: 1060, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!574 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !575, line: 472)
!575 = !DISubprogram(name: "tanhf", linkageName: "_ZL5tanhff", scope: !465, file: !465, line: 1106, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!576 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !577, line: 473)
!577 = !DISubprogram(name: "tgammaf", linkageName: "_ZL7tgammaff", scope: !465, file: !465, line: 1361, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!578 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !24, entity: !579, line: 474)
!579 = !DISubprogram(name: "truncf", linkageName: "_ZL6truncff", scope: !482, file: !482, line: 642, type: !32, isLocal: true, isDefinition: false, flags: DIFlagPrototyped, isOptimized: true)
!580 = !{i32 2, !"Dwarf Version", i32 4}
!581 = !{i32 2, !"Debug Info Version", i32 3}
!582 = !{!"clang version 5.0.0 (trunk 294196)"}
!583 = distinct !DISubprogram(name: "kernel_gpu_cuda", linkageName: "_Z15kernel_gpu_cuda7par_str7dim_strP7box_strP11FOUR_VECTORPdS4_", scope: !584, file: !584, line: 5, type: !585, isLocal: false, isDefinition: true, scopeLine: 11, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !634)
!584 = !DIFile(filename: "./kernel/./kernel_gpu_cuda.cu", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/lavaMDllvm")
!585 = !DISubroutineType(types: !586)
!586 = !{null, !587, !592, !604, !626, !260, !626}
!587 = !DIDerivedType(tag: DW_TAG_typedef, name: "par_str", file: !588, line: 71, baseType: !589)
!588 = !DIFile(filename: "./kernel/./../main.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/lavaMDllvm")
!589 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "par_str", file: !588, line: 66, size: 64, elements: !590, identifier: "_ZTS7par_str")
!590 = !{!591}
!591 = !DIDerivedType(tag: DW_TAG_member, name: "alpha", scope: !589, file: !588, line: 69, baseType: !167, size: 64)
!592 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim_str", file: !588, line: 89, baseType: !593)
!593 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim_str", file: !588, line: 73, size: 448, elements: !594, identifier: "_ZTS7dim_str")
!594 = !{!595, !596, !597, !598, !599, !600, !601, !602, !603}
!595 = !DIDerivedType(tag: DW_TAG_member, name: "cur_arg", scope: !593, file: !588, line: 77, baseType: !88, size: 32)
!596 = !DIDerivedType(tag: DW_TAG_member, name: "arch_arg", scope: !593, file: !588, line: 78, baseType: !88, size: 32, offset: 32)
!597 = !DIDerivedType(tag: DW_TAG_member, name: "cores_arg", scope: !593, file: !588, line: 79, baseType: !88, size: 32, offset: 64)
!598 = !DIDerivedType(tag: DW_TAG_member, name: "boxes1d_arg", scope: !593, file: !588, line: 80, baseType: !88, size: 32, offset: 96)
!599 = !DIDerivedType(tag: DW_TAG_member, name: "number_boxes", scope: !593, file: !588, line: 83, baseType: !127, size: 64, offset: 128)
!600 = !DIDerivedType(tag: DW_TAG_member, name: "box_mem", scope: !593, file: !588, line: 84, baseType: !127, size: 64, offset: 192)
!601 = !DIDerivedType(tag: DW_TAG_member, name: "space_elem", scope: !593, file: !588, line: 85, baseType: !127, size: 64, offset: 256)
!602 = !DIDerivedType(tag: DW_TAG_member, name: "space_mem", scope: !593, file: !588, line: 86, baseType: !127, size: 64, offset: 320)
!603 = !DIDerivedType(tag: DW_TAG_member, name: "space_mem2", scope: !593, file: !588, line: 87, baseType: !127, size: 64, offset: 384)
!604 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !605, size: 64)
!605 = !DIDerivedType(tag: DW_TAG_typedef, name: "box_str", file: !588, line: 64, baseType: !606)
!606 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "box_str", file: !588, line: 52, size: 5248, elements: !607, identifier: "_ZTS7box_str")
!607 = !{!608, !609, !610, !611, !612, !613, !614}
!608 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !606, file: !588, line: 56, baseType: !88, size: 32)
!609 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !606, file: !588, line: 56, baseType: !88, size: 32, offset: 32)
!610 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !606, file: !588, line: 56, baseType: !88, size: 32, offset: 64)
!611 = !DIDerivedType(tag: DW_TAG_member, name: "number", scope: !606, file: !588, line: 57, baseType: !88, size: 32, offset: 96)
!612 = !DIDerivedType(tag: DW_TAG_member, name: "offset", scope: !606, file: !588, line: 58, baseType: !127, size: 64, offset: 128)
!613 = !DIDerivedType(tag: DW_TAG_member, name: "nn", scope: !606, file: !588, line: 61, baseType: !88, size: 32, offset: 192)
!614 = !DIDerivedType(tag: DW_TAG_member, name: "nei", scope: !606, file: !588, line: 62, baseType: !615, size: 4992, offset: 256)
!615 = !DICompositeType(tag: DW_TAG_array_type, baseType: !616, size: 4992, elements: !624)
!616 = !DIDerivedType(tag: DW_TAG_typedef, name: "nei_str", file: !588, line: 50, baseType: !617)
!617 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "nei_str", file: !588, line: 42, size: 192, elements: !618, identifier: "_ZTS7nei_str")
!618 = !{!619, !620, !621, !622, !623}
!619 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !617, file: !588, line: 46, baseType: !88, size: 32)
!620 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !617, file: !588, line: 46, baseType: !88, size: 32, offset: 32)
!621 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !617, file: !588, line: 46, baseType: !88, size: 32, offset: 64)
!622 = !DIDerivedType(tag: DW_TAG_member, name: "number", scope: !617, file: !588, line: 47, baseType: !88, size: 32, offset: 96)
!623 = !DIDerivedType(tag: DW_TAG_member, name: "offset", scope: !617, file: !588, line: 48, baseType: !127, size: 64, offset: 128)
!624 = !{!625}
!625 = !DISubrange(count: 26)
!626 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !627, size: 64)
!627 = !DIDerivedType(tag: DW_TAG_typedef, name: "FOUR_VECTOR", file: !588, line: 40, baseType: !628)
!628 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !588, line: 36, size: 256, elements: !629, identifier: "_ZTS11FOUR_VECTOR")
!629 = !{!630, !631, !632, !633}
!630 = !DIDerivedType(tag: DW_TAG_member, name: "v", scope: !628, file: !588, line: 38, baseType: !167, size: 64)
!631 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !628, file: !588, line: 38, baseType: !167, size: 64, offset: 64)
!632 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !628, file: !588, line: 38, baseType: !167, size: 64, offset: 128)
!633 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !628, file: !588, line: 38, baseType: !167, size: 64, offset: 192)
!634 = !{!635, !636, !637, !638, !639, !640}
!635 = !DILocalVariable(name: "d_par_gpu", arg: 1, scope: !583, file: !584, line: 5, type: !587)
!636 = !DILocalVariable(name: "d_dim_gpu", arg: 2, scope: !583, file: !584, line: 6, type: !592)
!637 = !DILocalVariable(name: "d_box_gpu", arg: 3, scope: !583, file: !584, line: 7, type: !604)
!638 = !DILocalVariable(name: "d_rv_gpu", arg: 4, scope: !583, file: !584, line: 8, type: !626)
!639 = !DILocalVariable(name: "d_qv_gpu", arg: 5, scope: !583, file: !584, line: 9, type: !260)
!640 = !DILocalVariable(name: "d_fv_gpu", arg: 6, scope: !583, file: !584, line: 10, type: !626)
!641 = !DIExpression()
!642 = !DILocation(line: 6, column: 17, scope: !583)
!643 = !DILocation(line: 7, column: 18, scope: !583)
!644 = !{!645, !645, i64 0}
!645 = !{!"any pointer", !646, i64 0}
!646 = !{!"omnipotent char", !647, i64 0}
!647 = !{!"Simple C++ TBAA"}
!648 = !DILocation(line: 8, column: 22, scope: !583)
!649 = !DILocation(line: 9, column: 13, scope: !583)
!650 = !DILocation(line: 10, column: 22, scope: !583)
!651 = !DILocation(line: 11, column: 1, scope: !583)
!652 = !DILocation(line: 11, column: 1, scope: !653)
!653 = !DILexicalBlockFile(scope: !583, file: !584, discriminator: 1)
!654 = !DILocation(line: 11, column: 1, scope: !655)
!655 = !DILexicalBlockFile(scope: !583, file: !584, discriminator: 2)
!656 = !DILocation(line: 11, column: 1, scope: !657)
!657 = !DILexicalBlockFile(scope: !583, file: !584, discriminator: 3)
!658 = !DILocation(line: 11, column: 1, scope: !659)
!659 = !DILexicalBlockFile(scope: !583, file: !584, discriminator: 4)
!660 = !DILocation(line: 11, column: 1, scope: !661)
!661 = !DILexicalBlockFile(scope: !583, file: !584, discriminator: 5)
!662 = !DILocation(line: 11, column: 1, scope: !663)
!663 = !DILexicalBlockFile(scope: !583, file: !584, discriminator: 6)
!664 = !DILocation(line: 214, column: 1, scope: !583)
!665 = distinct !DISubprogram(name: "kernel_gpu_cuda_wrapper", scope: !1, file: !1, line: 35, type: !585, isLocal: false, isDefinition: true, scopeLine: 41, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !666)
!666 = !{!667, !668, !669, !670, !671, !672, !673, !674, !675, !676, !677, !678, !679, !680, !681, !682, !683, !684, !708}
!667 = !DILocalVariable(name: "par_cpu", arg: 1, scope: !665, file: !1, line: 35, type: !587)
!668 = !DILocalVariable(name: "dim_cpu", arg: 2, scope: !665, file: !1, line: 36, type: !592)
!669 = !DILocalVariable(name: "box_cpu", arg: 3, scope: !665, file: !1, line: 37, type: !604)
!670 = !DILocalVariable(name: "rv_cpu", arg: 4, scope: !665, file: !1, line: 38, type: !626)
!671 = !DILocalVariable(name: "qv_cpu", arg: 5, scope: !665, file: !1, line: 39, type: !260)
!672 = !DILocalVariable(name: "fv_cpu", arg: 6, scope: !665, file: !1, line: 40, type: !626)
!673 = !DILocalVariable(name: "time0", scope: !665, file: !1, line: 48, type: !29)
!674 = !DILocalVariable(name: "time1", scope: !665, file: !1, line: 49, type: !29)
!675 = !DILocalVariable(name: "time2", scope: !665, file: !1, line: 50, type: !29)
!676 = !DILocalVariable(name: "time3", scope: !665, file: !1, line: 51, type: !29)
!677 = !DILocalVariable(name: "time4", scope: !665, file: !1, line: 52, type: !29)
!678 = !DILocalVariable(name: "time5", scope: !665, file: !1, line: 53, type: !29)
!679 = !DILocalVariable(name: "time6", scope: !665, file: !1, line: 54, type: !29)
!680 = !DILocalVariable(name: "d_box_gpu", scope: !665, file: !1, line: 73, type: !604)
!681 = !DILocalVariable(name: "d_rv_gpu", scope: !665, file: !1, line: 74, type: !626)
!682 = !DILocalVariable(name: "d_qv_gpu", scope: !665, file: !1, line: 75, type: !260)
!683 = !DILocalVariable(name: "d_fv_gpu", scope: !665, file: !1, line: 76, type: !626)
!684 = !DILocalVariable(name: "threads", scope: !665, file: !1, line: 78, type: !685)
!685 = !DIDerivedType(tag: DW_TAG_typedef, name: "dim3", file: !686, line: 427, baseType: !687)
!686 = !DIFile(filename: "/usr/local/cuda/include/vector_types.h", directory: "/home/dshen/llvm/llvm/lib/Transforms/Hello/expr/BD_mode/lavaMDllvm")
!687 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "dim3", file: !686, line: 417, size: 96, elements: !688, identifier: "_ZTS4dim3")
!688 = !{!689, !690, !691, !692, !696, !705}
!689 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !687, file: !686, line: 419, baseType: !384, size: 32)
!690 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !687, file: !686, line: 419, baseType: !384, size: 32, offset: 32)
!691 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !687, file: !686, line: 419, baseType: !384, size: 32, offset: 64)
!692 = !DISubprogram(name: "dim3", scope: !687, file: !686, line: 421, type: !693, isLocal: false, isDefinition: false, scopeLine: 421, flags: DIFlagPrototyped, isOptimized: true)
!693 = !DISubroutineType(types: !694)
!694 = !{null, !695, !384, !384, !384}
!695 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !687, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!696 = !DISubprogram(name: "dim3", scope: !687, file: !686, line: 422, type: !697, isLocal: false, isDefinition: false, scopeLine: 422, flags: DIFlagPrototyped, isOptimized: true)
!697 = !DISubroutineType(types: !698)
!698 = !{null, !695, !699}
!699 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint3", file: !686, line: 383, baseType: !700)
!700 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "uint3", file: !686, line: 190, size: 96, elements: !701, identifier: "_ZTS5uint3")
!701 = !{!702, !703, !704}
!702 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !700, file: !686, line: 192, baseType: !384, size: 32)
!703 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !700, file: !686, line: 192, baseType: !384, size: 32, offset: 32)
!704 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !700, file: !686, line: 192, baseType: !384, size: 32, offset: 64)
!705 = !DISubprogram(name: "operator uint3", linkageName: "_ZN4dim3cv5uint3Ev", scope: !687, file: !686, line: 423, type: !706, isLocal: false, isDefinition: false, scopeLine: 423, flags: DIFlagPrototyped, isOptimized: true)
!706 = !DISubroutineType(types: !707)
!707 = !{!699, !695}
!708 = !DILocalVariable(name: "blocks", scope: !665, file: !1, line: 79, type: !685)
!709 = !DILocation(line: 35, column: 33, scope: !665)
!710 = !DILocation(line: 36, column: 15, scope: !665)
!711 = !DILocation(line: 37, column: 16, scope: !665)
!712 = !DILocation(line: 38, column: 20, scope: !665)
!713 = !DILocation(line: 39, column: 11, scope: !665)
!714 = !DILocation(line: 40, column: 20, scope: !665)
!715 = !DILocation(line: 56, column: 10, scope: !665)
!716 = !DILocation(line: 48, column: 12, scope: !665)
!717 = !DILocation(line: 66, column: 2, scope: !665)
!718 = !DILocation(line: 73, column: 2, scope: !665)
!719 = !DILocation(line: 74, column: 2, scope: !665)
!720 = !DILocation(line: 75, column: 2, scope: !665)
!721 = !DILocation(line: 76, column: 2, scope: !665)
!722 = !DIExpression(DW_OP_deref)
!723 = !DILocation(line: 78, column: 7, scope: !665)
!724 = !DILocation(line: 79, column: 7, scope: !665)
!725 = !DILocation(line: 85, column: 21, scope: !665)
!726 = !{!727, !729, i64 16}
!727 = !{!"_ZTS7dim_str", !728, i64 0, !728, i64 4, !728, i64 8, !728, i64 12, !729, i64 16, !729, i64 24, !729, i64 32, !729, i64 40, !729, i64 48}
!728 = !{!"int", !646, i64 0}
!729 = !{!"long", !646, i64 0}
!730 = !DILocation(line: 90, column: 10, scope: !665)
!731 = !DILocation(line: 49, column: 12, scope: !665)
!732 = !DILocation(line: 104, column: 14, scope: !665)
!733 = !DILocation(line: 105, column: 13, scope: !665)
!734 = !{!727, !729, i64 24}
!735 = !DILocation(line: 104, column: 2, scope: !665)
!736 = !DILocation(line: 111, column: 14, scope: !665)
!737 = !DILocation(line: 112, column: 13, scope: !665)
!738 = !{!727, !729, i64 40}
!739 = !DILocation(line: 111, column: 2, scope: !665)
!740 = !DILocation(line: 118, column: 14, scope: !665)
!741 = !DILocation(line: 119, column: 13, scope: !665)
!742 = !{!727, !729, i64 48}
!743 = !DILocation(line: 118, column: 2, scope: !665)
!744 = !DILocation(line: 129, column: 14, scope: !665)
!745 = !DILocation(line: 129, column: 2, scope: !665)
!746 = !DILocation(line: 132, column: 10, scope: !665)
!747 = !DILocation(line: 50, column: 12, scope: !665)
!748 = !DILocation(line: 146, column: 14, scope: !665)
!749 = !DILocation(line: 147, column: 5, scope: !665)
!750 = !DILocation(line: 146, column: 2, scope: !665)
!751 = !DILocation(line: 155, column: 14, scope: !665)
!752 = !DILocation(line: 156, column: 5, scope: !665)
!753 = !DILocation(line: 155, column: 2, scope: !665)
!754 = !DILocation(line: 164, column: 14, scope: !665)
!755 = !DILocation(line: 165, column: 5, scope: !665)
!756 = !DILocation(line: 164, column: 2, scope: !665)
!757 = !DILocation(line: 177, column: 14, scope: !665)
!758 = !DILocation(line: 178, column: 5, scope: !665)
!759 = !DILocation(line: 177, column: 2, scope: !665)
!760 = !DILocation(line: 182, column: 10, scope: !665)
!761 = !DILocation(line: 51, column: 12, scope: !665)
!762 = !DILocation(line: 189, column: 20, scope: !665)
!763 = !DILocation(line: 189, column: 17, scope: !665)
!764 = !DILocation(line: 189, column: 2, scope: !665)
!765 = !DILocation(line: 191, column: 12, scope: !665)
!766 = !DILocation(line: 73, column: 11, scope: !665)
!767 = !DILocation(line: 192, column: 12, scope: !665)
!768 = !DILocation(line: 74, column: 15, scope: !665)
!769 = !DILocation(line: 193, column: 12, scope: !665)
!770 = !DILocation(line: 75, column: 6, scope: !665)
!771 = !DILocation(line: 194, column: 12, scope: !665)
!772 = !DILocation(line: 76, column: 15, scope: !665)
!773 = !DILocation(line: 189, column: 2, scope: !774)
!774 = !DILexicalBlockFile(scope: !665, file: !1, discriminator: 1)
!775 = !DILocation(line: 196, column: 2, scope: !665)
!776 = !DILocation(line: 198, column: 10, scope: !665)
!777 = !DILocation(line: 52, column: 12, scope: !665)
!778 = !DILocation(line: 205, column: 5, scope: !665)
!779 = !DILocation(line: 204, column: 2, scope: !665)
!780 = !DILocation(line: 209, column: 10, scope: !665)
!781 = !DILocation(line: 53, column: 12, scope: !665)
!782 = !DILocation(line: 215, column: 11, scope: !665)
!783 = !DILocation(line: 215, column: 2, scope: !665)
!784 = !DILocation(line: 216, column: 11, scope: !665)
!785 = !DILocation(line: 216, column: 2, scope: !665)
!786 = !DILocation(line: 217, column: 11, scope: !665)
!787 = !DILocation(line: 217, column: 2, scope: !665)
!788 = !DILocation(line: 218, column: 11, scope: !665)
!789 = !DILocation(line: 218, column: 2, scope: !665)
!790 = !DILocation(line: 220, column: 10, scope: !665)
!791 = !DILocation(line: 54, column: 12, scope: !665)
!792 = !DILocation(line: 226, column: 2, scope: !665)
!793 = !DILocation(line: 228, column: 81, scope: !665)
!794 = !DILocation(line: 228, column: 75, scope: !665)
!795 = !DILocation(line: 228, column: 89, scope: !665)
!796 = !DILocation(line: 228, column: 67, scope: !665)
!797 = !DILocation(line: 228, column: 138, scope: !665)
!798 = !DILocation(line: 228, column: 132, scope: !665)
!799 = !DILocation(line: 228, column: 122, scope: !665)
!800 = !DILocation(line: 228, column: 146, scope: !665)
!801 = !DILocation(line: 228, column: 100, scope: !665)
!802 = !DILocation(line: 228, column: 2, scope: !665)
!803 = !DILocation(line: 229, column: 69, scope: !665)
!804 = !DILocation(line: 229, column: 63, scope: !665)
!805 = !DILocation(line: 229, column: 77, scope: !665)
!806 = !DILocation(line: 229, column: 55, scope: !665)
!807 = !DILocation(line: 229, column: 110, scope: !665)
!808 = !DILocation(line: 229, column: 134, scope: !665)
!809 = !DILocation(line: 229, column: 88, scope: !665)
!810 = !DILocation(line: 229, column: 2, scope: !665)
!811 = !DILocation(line: 230, column: 72, scope: !665)
!812 = !DILocation(line: 230, column: 66, scope: !665)
!813 = !DILocation(line: 230, column: 80, scope: !665)
!814 = !DILocation(line: 230, column: 58, scope: !665)
!815 = !DILocation(line: 230, column: 113, scope: !665)
!816 = !DILocation(line: 230, column: 137, scope: !665)
!817 = !DILocation(line: 230, column: 91, scope: !665)
!818 = !DILocation(line: 230, column: 2, scope: !665)
!819 = !DILocation(line: 232, column: 68, scope: !665)
!820 = !DILocation(line: 232, column: 62, scope: !665)
!821 = !DILocation(line: 232, column: 76, scope: !665)
!822 = !DILocation(line: 232, column: 54, scope: !665)
!823 = !DILocation(line: 232, column: 109, scope: !665)
!824 = !DILocation(line: 232, column: 133, scope: !665)
!825 = !DILocation(line: 232, column: 87, scope: !665)
!826 = !DILocation(line: 232, column: 2, scope: !665)
!827 = !DILocation(line: 234, column: 72, scope: !665)
!828 = !DILocation(line: 234, column: 66, scope: !665)
!829 = !DILocation(line: 234, column: 80, scope: !665)
!830 = !DILocation(line: 234, column: 58, scope: !665)
!831 = !DILocation(line: 234, column: 113, scope: !665)
!832 = !DILocation(line: 234, column: 137, scope: !665)
!833 = !DILocation(line: 234, column: 91, scope: !665)
!834 = !DILocation(line: 234, column: 2, scope: !665)
!835 = !DILocation(line: 235, column: 69, scope: !665)
!836 = !DILocation(line: 235, column: 63, scope: !665)
!837 = !DILocation(line: 235, column: 77, scope: !665)
!838 = !DILocation(line: 235, column: 55, scope: !665)
!839 = !DILocation(line: 235, column: 110, scope: !665)
!840 = !DILocation(line: 235, column: 134, scope: !665)
!841 = !DILocation(line: 235, column: 88, scope: !665)
!842 = !DILocation(line: 235, column: 2, scope: !665)
!843 = !DILocation(line: 237, column: 2, scope: !665)
!844 = !DILocation(line: 238, column: 56, scope: !665)
!845 = !DILocation(line: 238, column: 34, scope: !665)
!846 = !DILocation(line: 238, column: 2, scope: !665)
!847 = !DILocation(line: 240, column: 10, scope: !665)
!848 = !DILocation(line: 240, column: 2, scope: !665)
!849 = !DILocation(line: 241, column: 1, scope: !665)
