; ModuleID = 'test_cases\memory_ops.c'
source_filename = "test_cases\\memory_ops.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.33.0"

%struct.Node = type { i32, double, ptr }

@static_array = dso_local global [50000 x i32] zeroinitializer, align 16
@static_nodes = dso_local local_unnamed_addr global [1000 x %struct.Node] zeroinitializer, align 16

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define dso_local void @process_array(ptr nocapture noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = icmp sgt i32 %1, 0
  br i1 %3, label %4, label %25

4:                                                ; preds = %2
  %5 = zext nneg i32 %1 to i64
  %6 = icmp ult i32 %1, 8
  br i1 %6, label %23, label %7

7:                                                ; preds = %4
  %8 = and i64 %5, 2147483640
  br label %9

9:                                                ; preds = %9, %7
  %10 = phi i64 [ 0, %7 ], [ %19, %9 ]
  %11 = getelementptr inbounds i32, ptr %0, i64 %10
  %12 = getelementptr inbounds i32, ptr %11, i64 4
  %13 = load <4 x i32>, ptr %11, align 4, !tbaa !5
  %14 = load <4 x i32>, ptr %12, align 4, !tbaa !5
  %15 = mul nsw <4 x i32> %13, <i32 3, i32 3, i32 3, i32 3>
  %16 = mul nsw <4 x i32> %14, <i32 3, i32 3, i32 3, i32 3>
  %17 = add nsw <4 x i32> %15, <i32 1, i32 1, i32 1, i32 1>
  %18 = add nsw <4 x i32> %16, <i32 1, i32 1, i32 1, i32 1>
  store <4 x i32> %17, ptr %11, align 4, !tbaa !5
  store <4 x i32> %18, ptr %12, align 4, !tbaa !5
  %19 = add nuw i64 %10, 8
  %20 = icmp eq i64 %19, %8
  br i1 %20, label %21, label %9, !llvm.loop !9

21:                                               ; preds = %9
  %22 = icmp eq i64 %8, %5
  br i1 %22, label %25, label %23

23:                                               ; preds = %4, %21
  %24 = phi i64 [ 0, %4 ], [ %8, %21 ]
  br label %26

25:                                               ; preds = %26, %21, %2
  ret void

26:                                               ; preds = %23, %26
  %27 = phi i64 [ %32, %26 ], [ %24, %23 ]
  %28 = getelementptr inbounds i32, ptr %0, i64 %27
  %29 = load i32, ptr %28, align 4, !tbaa !5
  %30 = mul nsw i32 %29, 3
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %28, align 4, !tbaa !5
  %32 = add nuw nsw i64 %27, 1
  %33 = icmp eq i64 %32, %5
  br i1 %33, label %25, label %26, !llvm.loop !13
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define dso_local void @process_nodes(ptr nocapture noundef %0, i32 noundef %1) local_unnamed_addr #1 {
  %3 = icmp sgt i32 %1, 0
  br i1 %3, label %4, label %6

4:                                                ; preds = %2
  %5 = zext nneg i32 %1 to i64
  br label %7

6:                                                ; preds = %18, %2
  ret void

7:                                                ; preds = %4, %18
  %8 = phi i64 [ 0, %4 ], [ %19, %18 ]
  %9 = getelementptr inbounds %struct.Node, ptr %0, i64 %8, i32 1
  %10 = load double, ptr %9, align 8, !tbaa !14
  %11 = fmul double %10, 1.500000e+00
  store double %11, ptr %9, align 8, !tbaa !14
  %12 = getelementptr inbounds %struct.Node, ptr %0, i64 %8, i32 2
  %13 = load ptr, ptr %12, align 8, !tbaa !18
  %14 = icmp eq ptr %13, null
  br i1 %14, label %18, label %15

15:                                               ; preds = %7
  %16 = load i32, ptr %13, align 4, !tbaa !5
  %17 = add nsw i32 %16, 10
  store i32 %17, ptr %13, align 4, !tbaa !5
  br label %18

18:                                               ; preds = %7, %15
  %19 = add nuw nsw i64 %8, 1
  %20 = icmp eq i64 %19, %5
  br i1 %20, label %6, label %7, !llvm.loop !19
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define dso_local i32 @main() local_unnamed_addr #1 {
  br label %1

1:                                                ; preds = %1, %0
  %2 = phi i64 [ 0, %0 ], [ %12, %1 ]
  %3 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %0 ], [ %13, %1 ]
  %4 = add <4 x i32> %3, <i32 4, i32 4, i32 4, i32 4>
  %5 = getelementptr inbounds [50000 x i32], ptr @static_array, i64 0, i64 %2
  %6 = getelementptr inbounds i32, ptr %5, i64 4
  store <4 x i32> %3, ptr %5, align 16, !tbaa !5
  store <4 x i32> %4, ptr %6, align 16, !tbaa !5
  %7 = or disjoint i64 %2, 8
  %8 = add <4 x i32> %3, <i32 8, i32 8, i32 8, i32 8>
  %9 = add <4 x i32> %3, <i32 12, i32 12, i32 12, i32 12>
  %10 = getelementptr inbounds [50000 x i32], ptr @static_array, i64 0, i64 %7
  %11 = getelementptr inbounds i32, ptr %10, i64 4
  store <4 x i32> %8, ptr %10, align 16, !tbaa !5
  store <4 x i32> %9, ptr %11, align 16, !tbaa !5
  %12 = add nuw nsw i64 %2, 16
  %13 = add <4 x i32> %3, <i32 16, i32 16, i32 16, i32 16>
  %14 = icmp eq i64 %12, 50000
  br i1 %14, label %34, label %1, !llvm.loop !20

15:                                               ; preds = %34, %15
  %16 = phi i64 [ %32, %15 ], [ 0, %34 ]
  %17 = phi <4 x i32> [ %30, %15 ], [ zeroinitializer, %34 ]
  %18 = phi <4 x i32> [ %31, %15 ], [ zeroinitializer, %34 ]
  %19 = getelementptr inbounds [50000 x i32], ptr @static_array, i64 0, i64 %16
  %20 = getelementptr inbounds i32, ptr %19, i64 4
  %21 = load <4 x i32>, ptr %19, align 16, !tbaa !5
  %22 = load <4 x i32>, ptr %20, align 16, !tbaa !5
  %23 = add <4 x i32> %21, %17
  %24 = add <4 x i32> %22, %18
  %25 = or disjoint i64 %16, 8
  %26 = getelementptr inbounds [50000 x i32], ptr @static_array, i64 0, i64 %25
  %27 = getelementptr inbounds i32, ptr %26, i64 4
  %28 = load <4 x i32>, ptr %26, align 16, !tbaa !5
  %29 = load <4 x i32>, ptr %27, align 16, !tbaa !5
  %30 = add <4 x i32> %28, %23
  %31 = add <4 x i32> %29, %24
  %32 = add nuw nsw i64 %16, 16
  %33 = icmp eq i64 %32, 50000
  br i1 %33, label %60, label %15, !llvm.loop !21

34:                                               ; preds = %1, %34
  %35 = phi i64 [ %44, %34 ], [ 0, %1 ]
  %36 = getelementptr inbounds i32, ptr @static_array, i64 %35
  %37 = getelementptr inbounds i32, ptr %36, i64 4
  %38 = load <4 x i32>, ptr %36, align 16, !tbaa !5
  %39 = load <4 x i32>, ptr %37, align 16, !tbaa !5
  %40 = mul nsw <4 x i32> %38, <i32 3, i32 3, i32 3, i32 3>
  %41 = mul nsw <4 x i32> %39, <i32 3, i32 3, i32 3, i32 3>
  %42 = add nsw <4 x i32> %40, <i32 1, i32 1, i32 1, i32 1>
  %43 = add nsw <4 x i32> %41, <i32 1, i32 1, i32 1, i32 1>
  store <4 x i32> %42, ptr %36, align 16, !tbaa !5
  store <4 x i32> %43, ptr %37, align 16, !tbaa !5
  %44 = add nuw i64 %35, 8
  %45 = icmp eq i64 %44, 50000
  br i1 %45, label %15, label %34, !llvm.loop !22

46:                                               ; preds = %60, %57
  %47 = phi i64 [ %58, %57 ], [ 0, %60 ]
  %48 = getelementptr inbounds %struct.Node, ptr @static_nodes, i64 %47, i32 1
  %49 = load double, ptr %48, align 8, !tbaa !14
  %50 = fmul double %49, 1.500000e+00
  store double %50, ptr %48, align 8, !tbaa !14
  %51 = getelementptr inbounds %struct.Node, ptr @static_nodes, i64 %47, i32 2
  %52 = load ptr, ptr %51, align 8, !tbaa !18
  %53 = icmp eq ptr %52, null
  br i1 %53, label %57, label %54

54:                                               ; preds = %46
  %55 = load i32, ptr %52, align 4, !tbaa !5
  %56 = add nsw i32 %55, 10
  store i32 %56, ptr %52, align 4, !tbaa !5
  br label %57

57:                                               ; preds = %54, %46
  %58 = add nuw nsw i64 %47, 1
  %59 = icmp eq i64 %58, 1000
  br i1 %59, label %86, label %46, !llvm.loop !19

60:                                               ; preds = %15, %60
  %61 = phi i64 [ %77, %60 ], [ 0, %15 ]
  %62 = getelementptr inbounds [1000 x %struct.Node], ptr @static_nodes, i64 0, i64 %61
  %63 = trunc i64 %61 to i32
  store i32 %63, ptr %62, align 16, !tbaa !23
  %64 = sitofp i32 %63 to double
  %65 = fmul double %64, 1.000000e-01
  %66 = getelementptr inbounds [1000 x %struct.Node], ptr @static_nodes, i64 0, i64 %61, i32 1
  store double %65, ptr %66, align 8, !tbaa !14
  %67 = getelementptr inbounds [50000 x i32], ptr @static_array, i64 0, i64 %61
  %68 = getelementptr inbounds [1000 x %struct.Node], ptr @static_nodes, i64 0, i64 %61, i32 2
  store ptr %67, ptr %68, align 16, !tbaa !18
  %69 = or disjoint i64 %61, 1
  %70 = getelementptr inbounds [1000 x %struct.Node], ptr @static_nodes, i64 0, i64 %69
  %71 = trunc i64 %69 to i32
  store i32 %71, ptr %70, align 8, !tbaa !23
  %72 = sitofp i32 %71 to double
  %73 = fmul double %72, 1.000000e-01
  %74 = getelementptr inbounds [1000 x %struct.Node], ptr @static_nodes, i64 0, i64 %69, i32 1
  store double %73, ptr %74, align 16, !tbaa !14
  %75 = getelementptr inbounds [50000 x i32], ptr @static_array, i64 0, i64 %69
  %76 = getelementptr inbounds [1000 x %struct.Node], ptr @static_nodes, i64 0, i64 %69, i32 2
  store ptr %75, ptr %76, align 8, !tbaa !18
  %77 = add nuw nsw i64 %61, 2
  %78 = icmp eq i64 %77, 1000
  br i1 %78, label %46, label %60, !llvm.loop !24

79:                                               ; preds = %86
  %80 = add <4 x i32> %31, %30
  %81 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %80)
  %82 = srem i32 %81, 256
  %83 = fptosi double %107 to i32
  %84 = srem i32 %83, 256
  %85 = add nsw i32 %84, %82
  ret i32 %85

86:                                               ; preds = %57, %86
  %87 = phi i64 [ %108, %86 ], [ 0, %57 ]
  %88 = phi double [ %107, %86 ], [ 0.000000e+00, %57 ]
  %89 = getelementptr inbounds [1000 x %struct.Node], ptr @static_nodes, i64 0, i64 %87, i32 1
  %90 = load double, ptr %89, align 8, !tbaa !14
  %91 = fadd double %88, %90
  %92 = add nuw nsw i64 %87, 1
  %93 = getelementptr inbounds [1000 x %struct.Node], ptr @static_nodes, i64 0, i64 %92, i32 1
  %94 = load double, ptr %93, align 8, !tbaa !14
  %95 = fadd double %91, %94
  %96 = add nuw nsw i64 %87, 2
  %97 = getelementptr inbounds [1000 x %struct.Node], ptr @static_nodes, i64 0, i64 %96, i32 1
  %98 = load double, ptr %97, align 8, !tbaa !14
  %99 = fadd double %95, %98
  %100 = add nuw nsw i64 %87, 3
  %101 = getelementptr inbounds [1000 x %struct.Node], ptr @static_nodes, i64 0, i64 %100, i32 1
  %102 = load double, ptr %101, align 8, !tbaa !14
  %103 = fadd double %99, %102
  %104 = add nuw nsw i64 %87, 4
  %105 = getelementptr inbounds [1000 x %struct.Node], ptr @static_nodes, i64 0, i64 %104, i32 1
  %106 = load double, ptr %105, align 8, !tbaa !14
  %107 = fadd double %103, %106
  %108 = add nuw nsw i64 %87, 5
  %109 = icmp eq i64 %108, 1000
  br i1 %109, label %79, label %86, !llvm.loop !25
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.add.v4i32(<4 x i32>) #2

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 2}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 2}
!3 = !{i32 1, !"MaxTLSAlign", i32 65536}
!4 = !{!"clang version 18.1.8"}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = distinct !{!9, !10, !11, !12}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{!"llvm.loop.isvectorized", i32 1}
!12 = !{!"llvm.loop.unroll.runtime.disable"}
!13 = distinct !{!13, !10, !12, !11}
!14 = !{!15, !16, i64 8}
!15 = !{!"", !6, i64 0, !16, i64 8, !17, i64 16}
!16 = !{!"double", !7, i64 0}
!17 = !{!"any pointer", !7, i64 0}
!18 = !{!15, !17, i64 16}
!19 = distinct !{!19, !10}
!20 = distinct !{!20, !10, !11, !12}
!21 = distinct !{!21, !10, !11, !12}
!22 = distinct !{!22, !10, !11, !12}
!23 = !{!15, !6, i64 0}
!24 = distinct !{!24, !10}
!25 = distinct !{!25, !10}
