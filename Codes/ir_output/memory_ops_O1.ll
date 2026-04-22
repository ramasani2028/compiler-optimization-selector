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
  br i1 %3, label %4, label %6

4:                                                ; preds = %2
  %5 = zext nneg i32 %1 to i64
  br label %7

6:                                                ; preds = %7, %2
  ret void

7:                                                ; preds = %4, %7
  %8 = phi i64 [ 0, %4 ], [ %13, %7 ]
  %9 = getelementptr inbounds i32, ptr %0, i64 %8
  %10 = load i32, ptr %9, align 4, !tbaa !5
  %11 = mul nsw i32 %10, 3
  %12 = add nsw i32 %11, 1
  store i32 %12, ptr %9, align 4, !tbaa !5
  %13 = add nuw nsw i64 %8, 1
  %14 = icmp eq i64 %13, %5
  br i1 %14, label %6, label %7, !llvm.loop !9
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
  %10 = load double, ptr %9, align 8, !tbaa !12
  %11 = fmul double %10, 1.500000e+00
  store double %11, ptr %9, align 8, !tbaa !12
  %12 = getelementptr inbounds %struct.Node, ptr %0, i64 %8, i32 2
  %13 = load ptr, ptr %12, align 8, !tbaa !16
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
  br i1 %20, label %6, label %7, !llvm.loop !17
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define dso_local i32 @main() local_unnamed_addr #1 {
  br label %9

1:                                                ; preds = %9, %1
  %2 = phi i64 [ %7, %1 ], [ 0, %9 ]
  %3 = getelementptr inbounds i32, ptr @static_array, i64 %2
  %4 = load i32, ptr %3, align 4, !tbaa !5
  %5 = mul nsw i32 %4, 3
  %6 = add nsw i32 %5, 1
  store i32 %6, ptr %3, align 4, !tbaa !5
  %7 = add nuw nsw i64 %2, 1
  %8 = icmp eq i64 %7, 50000
  br i1 %8, label %15, label %1, !llvm.loop !9

9:                                                ; preds = %0, %9
  %10 = phi i64 [ 0, %0 ], [ %13, %9 ]
  %11 = getelementptr inbounds [50000 x i32], ptr @static_array, i64 0, i64 %10
  %12 = trunc i64 %10 to i32
  store i32 %12, ptr %11, align 4, !tbaa !5
  %13 = add nuw nsw i64 %10, 1
  %14 = icmp eq i64 %13, 50000
  br i1 %14, label %1, label %9, !llvm.loop !18

15:                                               ; preds = %1, %15
  %16 = phi i64 [ %22, %15 ], [ 0, %1 ]
  %17 = phi i64 [ %21, %15 ], [ 0, %1 ]
  %18 = getelementptr inbounds [50000 x i32], ptr @static_array, i64 0, i64 %16
  %19 = load i32, ptr %18, align 4, !tbaa !5
  %20 = zext i32 %19 to i64
  %21 = add i64 %17, %20
  %22 = add nuw nsw i64 %16, 1
  %23 = icmp eq i64 %22, 50000
  br i1 %23, label %38, label %15, !llvm.loop !19

24:                                               ; preds = %38, %35
  %25 = phi i64 [ %36, %35 ], [ 0, %38 ]
  %26 = getelementptr inbounds %struct.Node, ptr @static_nodes, i64 %25, i32 1
  %27 = load double, ptr %26, align 8, !tbaa !12
  %28 = fmul double %27, 1.500000e+00
  store double %28, ptr %26, align 8, !tbaa !12
  %29 = getelementptr inbounds %struct.Node, ptr @static_nodes, i64 %25, i32 2
  %30 = load ptr, ptr %29, align 8, !tbaa !16
  %31 = icmp eq ptr %30, null
  br i1 %31, label %35, label %32

32:                                               ; preds = %24
  %33 = load i32, ptr %30, align 4, !tbaa !5
  %34 = add nsw i32 %33, 10
  store i32 %34, ptr %30, align 4, !tbaa !5
  br label %35

35:                                               ; preds = %32, %24
  %36 = add nuw nsw i64 %25, 1
  %37 = icmp eq i64 %36, 1000
  br i1 %37, label %56, label %24, !llvm.loop !17

38:                                               ; preds = %15, %38
  %39 = phi i64 [ %48, %38 ], [ 0, %15 ]
  %40 = getelementptr inbounds [1000 x %struct.Node], ptr @static_nodes, i64 0, i64 %39
  %41 = trunc i64 %39 to i32
  store i32 %41, ptr %40, align 8, !tbaa !20
  %42 = trunc i64 %39 to i32
  %43 = sitofp i32 %42 to double
  %44 = fmul double %43, 1.000000e-01
  %45 = getelementptr inbounds [1000 x %struct.Node], ptr @static_nodes, i64 0, i64 %39, i32 1
  store double %44, ptr %45, align 8, !tbaa !12
  %46 = getelementptr inbounds [50000 x i32], ptr @static_array, i64 0, i64 %39
  %47 = getelementptr inbounds [1000 x %struct.Node], ptr @static_nodes, i64 0, i64 %39, i32 2
  store ptr %46, ptr %47, align 8, !tbaa !16
  %48 = add nuw nsw i64 %39, 1
  %49 = icmp eq i64 %48, 1000
  br i1 %49, label %24, label %38, !llvm.loop !21

50:                                               ; preds = %56
  %51 = trunc i64 %21 to i32
  %52 = srem i32 %51, 256
  %53 = fptosi double %61 to i32
  %54 = srem i32 %53, 256
  %55 = add nsw i32 %54, %52
  ret i32 %55

56:                                               ; preds = %35, %56
  %57 = phi i64 [ %62, %56 ], [ 0, %35 ]
  %58 = phi double [ %61, %56 ], [ 0.000000e+00, %35 ]
  %59 = getelementptr inbounds [1000 x %struct.Node], ptr @static_nodes, i64 0, i64 %57, i32 1
  %60 = load double, ptr %59, align 8, !tbaa !12
  %61 = fadd double %58, %60
  %62 = add nuw nsw i64 %57, 1
  %63 = icmp eq i64 %62, 1000
  br i1 %63, label %50, label %56, !llvm.loop !22
}

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

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
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = !{!13, !14, i64 8}
!13 = !{!"", !6, i64 0, !14, i64 8, !15, i64 16}
!14 = !{!"double", !7, i64 0}
!15 = !{!"any pointer", !7, i64 0}
!16 = !{!13, !15, i64 16}
!17 = distinct !{!17, !10, !11}
!18 = distinct !{!18, !10, !11}
!19 = distinct !{!19, !10, !11}
!20 = !{!13, !6, i64 0}
!21 = distinct !{!21, !10, !11}
!22 = distinct !{!22, !10, !11}
