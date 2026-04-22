; ModuleID = 'test_cases\27_binary_search.c'
source_filename = "test_cases\\27_binary_search.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.33.0"

@__const.main.arr = private unnamed_addr constant [5 x i32] [i32 2, i32 3, i32 4, i32 10, i32 40], align 16

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: read) uwtable
define dso_local i32 @binarySearch(ptr nocapture noundef readonly %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) local_unnamed_addr #0 {
  %5 = icmp sgt i32 %1, %2
  br i1 %5, label %23, label %6

6:                                                ; preds = %4, %16
  %7 = phi i32 [ %21, %16 ], [ %2, %4 ]
  %8 = phi i32 [ %20, %16 ], [ %1, %4 ]
  %9 = sub nsw i32 %7, %8
  %10 = sdiv i32 %9, 2
  %11 = add nsw i32 %10, %8
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds i32, ptr %0, i64 %12
  %14 = load i32, ptr %13, align 4, !tbaa !5
  %15 = icmp eq i32 %14, %3
  br i1 %15, label %23, label %16

16:                                               ; preds = %6
  %17 = icmp slt i32 %14, %3
  %18 = add nsw i32 %11, 1
  %19 = add nsw i32 %11, -1
  %20 = select i1 %17, i32 %18, i32 %8
  %21 = select i1 %17, i32 %7, i32 %19
  %22 = icmp sgt i32 %20, %21
  br i1 %22, label %23, label %6

23:                                               ; preds = %16, %6, %4
  %24 = phi i32 [ -1, %4 ], [ %11, %6 ], [ -1, %16 ]
  ret i32 %24
}

; Function Attrs: nofree norecurse nosync nounwind memory(none) uwtable
define dso_local i32 @main() local_unnamed_addr #1 {
  br label %1

1:                                                ; preds = %11, %0
  %2 = phi i32 [ %16, %11 ], [ 4, %0 ]
  %3 = phi i32 [ %15, %11 ], [ 0, %0 ]
  %4 = sub nsw i32 %2, %3
  %5 = sdiv i32 %4, 2
  %6 = add nsw i32 %5, %3
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds i32, ptr @__const.main.arr, i64 %7
  %9 = load i32, ptr %8, align 4, !tbaa !5
  %10 = icmp eq i32 %9, 10
  br i1 %10, label %18, label %11

11:                                               ; preds = %1
  %12 = icmp slt i32 %9, 10
  %13 = add nsw i32 %6, 1
  %14 = add nsw i32 %6, -1
  %15 = select i1 %12, i32 %13, i32 %3
  %16 = select i1 %12, i32 %2, i32 %14
  %17 = icmp sgt i32 %15, %16
  br i1 %17, label %18, label %1

18:                                               ; preds = %1, %11
  %19 = phi i32 [ %6, %1 ], [ -1, %11 ]
  ret i32 %19
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
