; ModuleID = 'test_cases\27_binary_search.c'
source_filename = "test_cases\\27_binary_search.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.33.0"

@__const.main.arr = private unnamed_addr constant [5 x i32] [i32 2, i32 3, i32 4, i32 10, i32 40], align 16

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: read) uwtable
define dso_local i32 @binarySearch(ptr nocapture noundef readonly %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) local_unnamed_addr #0 {
  br label %5

5:                                                ; preds = %24, %4
  %6 = phi i32 [ %1, %4 ], [ %25, %24 ]
  %7 = phi i32 [ %2, %4 ], [ %26, %24 ]
  %8 = phi i32 [ undef, %4 ], [ %27, %24 ]
  %9 = icmp sgt i32 %6, %7
  br i1 %9, label %28, label %10

10:                                               ; preds = %5
  %11 = sub nsw i32 %7, %6
  %12 = sdiv i32 %11, 2
  %13 = add nsw i32 %12, %6
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds i32, ptr %0, i64 %14
  %16 = load i32, ptr %15, align 4, !tbaa !5
  %17 = icmp eq i32 %16, %3
  br i1 %17, label %24, label %18

18:                                               ; preds = %10
  %19 = icmp slt i32 %16, %3
  %20 = add nsw i32 %13, 1
  %21 = add nsw i32 %13, -1
  %22 = select i1 %19, i32 %20, i32 %6
  %23 = select i1 %19, i32 %7, i32 %21
  br label %24

24:                                               ; preds = %10, %18
  %25 = phi i32 [ %22, %18 ], [ %6, %10 ]
  %26 = phi i32 [ %23, %18 ], [ %7, %10 ]
  %27 = phi i32 [ %8, %18 ], [ %13, %10 ]
  br i1 %17, label %28, label %5

28:                                               ; preds = %5, %24
  %29 = phi i32 [ %27, %24 ], [ -1, %5 ]
  ret i32 %29
}

; Function Attrs: nofree norecurse nosync nounwind memory(none) uwtable
define dso_local i32 @main() local_unnamed_addr #1 {
  br label %1

1:                                                ; preds = %20, %0
  %2 = phi i32 [ 0, %0 ], [ %21, %20 ]
  %3 = phi i32 [ 4, %0 ], [ %22, %20 ]
  %4 = phi i32 [ undef, %0 ], [ %23, %20 ]
  %5 = icmp sgt i32 %2, %3
  br i1 %5, label %24, label %6

6:                                                ; preds = %1
  %7 = sub nsw i32 %3, %2
  %8 = sdiv i32 %7, 2
  %9 = add nsw i32 %8, %2
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds i32, ptr @__const.main.arr, i64 %10
  %12 = load i32, ptr %11, align 4, !tbaa !5
  %13 = icmp eq i32 %12, 10
  br i1 %13, label %20, label %14

14:                                               ; preds = %6
  %15 = icmp slt i32 %12, 10
  %16 = add nsw i32 %9, 1
  %17 = add nsw i32 %9, -1
  %18 = select i1 %15, i32 %16, i32 %2
  %19 = select i1 %15, i32 %3, i32 %17
  br label %20

20:                                               ; preds = %14, %6
  %21 = phi i32 [ %18, %14 ], [ %2, %6 ]
  %22 = phi i32 [ %19, %14 ], [ %3, %6 ]
  %23 = phi i32 [ %4, %14 ], [ %9, %6 ]
  br i1 %13, label %24, label %1

24:                                               ; preds = %1, %20
  %25 = phi i32 [ %23, %20 ], [ -1, %1 ]
  ret i32 %25
}

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: read) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree norecurse nosync nounwind memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

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
