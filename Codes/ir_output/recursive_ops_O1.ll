; ModuleID = 'test_cases\recursive_ops.c'
source_filename = "test_cases\\recursive_ops.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.33.0"

; Function Attrs: nofree nosync nounwind memory(none) uwtable
define dso_local i64 @fibonacci(i32 noundef %0) local_unnamed_addr #0 {
  br label %2

2:                                                ; preds = %9, %1
  %3 = phi i64 [ 0, %1 ], [ %13, %9 ]
  %4 = phi i32 [ %0, %1 ], [ %12, %9 ]
  %5 = icmp slt i32 %4, 2
  br i1 %5, label %6, label %9

6:                                                ; preds = %2
  %7 = sext i32 %4 to i64
  %8 = add nsw i64 %3, %7
  ret i64 %8

9:                                                ; preds = %2
  %10 = add nsw i32 %4, -1
  %11 = tail call i64 @fibonacci(i32 noundef %10)
  %12 = add nsw i32 %4, -2
  %13 = add nsw i64 %3, %11
  br label %2
}

; Function Attrs: nofree nosync nounwind memory(none) uwtable
define dso_local i64 @ackermann(i32 noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  br label %3

3:                                                ; preds = %16, %14, %2
  %4 = phi i32 [ %0, %2 ], [ %15, %14 ], [ %20, %16 ]
  %5 = phi i32 [ %1, %2 ], [ 1, %14 ], [ %19, %16 ]
  %6 = icmp eq i32 %4, 0
  br i1 %6, label %7, label %10

7:                                                ; preds = %3
  %8 = add nsw i32 %5, 1
  %9 = sext i32 %8 to i64
  ret i64 %9

10:                                               ; preds = %3
  %11 = icmp sgt i32 %4, 0
  %12 = icmp eq i32 %5, 0
  %13 = and i1 %11, %12
  br i1 %13, label %14, label %16

14:                                               ; preds = %10
  %15 = add nsw i32 %4, -1
  br label %3

16:                                               ; preds = %10
  %17 = add nsw i32 %5, -1
  %18 = tail call i64 @ackermann(i32 noundef %4, i32 noundef %17), !range !5
  %19 = trunc i64 %18 to i32
  %20 = add nsw i32 %4, -1
  br label %3
}

; Function Attrs: nofree nosync nounwind memory(none) uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
  %1 = tail call i64 @fibonacci(i32 noundef 30)
  %2 = tail call i64 @ackermann(i32 noundef 3, i32 noundef 4), !range !5
  %3 = add nsw i64 %2, %1
  %4 = trunc i64 %3 to i32
  %5 = srem i32 %4, 256
  ret i32 %5
}

attributes #0 = { nofree nosync nounwind memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 2}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 2}
!3 = !{i32 1, !"MaxTLSAlign", i32 65536}
!4 = !{!"clang version 18.1.8"}
!5 = !{i64 -2147483648, i64 2147483648}
