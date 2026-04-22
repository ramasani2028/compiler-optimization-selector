; ModuleID = 'test_cases\39_multi_dimensional_array.c'
source_filename = "test_cases\\39_multi_dimensional_array.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.33.0"

@__const.main.arr = private unnamed_addr constant [2 x [2 x [2 x i32]]] [[2 x [2 x i32]] [[2 x i32] [i32 1, i32 2], [2 x i32] [i32 3, i32 4]], [2 x [2 x i32]] [[2 x i32] [i32 5, i32 6], [2 x i32] [i32 7, i32 8]]], align 16

; Function Attrs: nofree norecurse nosync nounwind memory(none) uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
  br label %1

1:                                                ; preds = %0, %8
  %2 = phi i64 [ 0, %0 ], [ %9, %8 ]
  %3 = phi i32 [ 0, %0 ], [ %19, %8 ]
  br label %5

4:                                                ; preds = %8
  ret i32 %19

5:                                                ; preds = %1, %11
  %6 = phi i64 [ 0, %1 ], [ %12, %11 ]
  %7 = phi i32 [ %3, %1 ], [ %19, %11 ]
  br label %14

8:                                                ; preds = %11
  %9 = add nuw nsw i64 %2, 1
  %10 = icmp eq i64 %2, 0
  br i1 %10, label %1, label %4, !llvm.loop !5

11:                                               ; preds = %14
  %12 = add nuw nsw i64 %6, 1
  %13 = icmp eq i64 %6, 0
  br i1 %13, label %5, label %8, !llvm.loop !8

14:                                               ; preds = %5, %14
  %15 = phi i64 [ 0, %5 ], [ %20, %14 ]
  %16 = phi i32 [ %7, %5 ], [ %19, %14 ]
  %17 = getelementptr inbounds [2 x [2 x [2 x i32]]], ptr @__const.main.arr, i64 0, i64 %2, i64 %6, i64 %15
  %18 = load i32, ptr %17, align 4, !tbaa !9
  %19 = add nsw i32 %18, %16
  %20 = add nuw nsw i64 %15, 1
  %21 = icmp eq i64 %15, 0
  br i1 %21, label %14, label %11, !llvm.loop !13
}

attributes #0 = { nofree norecurse nosync nounwind memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 2}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 2}
!3 = !{i32 1, !"MaxTLSAlign", i32 65536}
!4 = !{!"clang version 18.1.8"}
!5 = distinct !{!5, !6, !7}
!6 = !{!"llvm.loop.mustprogress"}
!7 = !{!"llvm.loop.unroll.disable"}
!8 = distinct !{!8, !6, !7}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C/C++ TBAA"}
!13 = distinct !{!13, !6, !7}
