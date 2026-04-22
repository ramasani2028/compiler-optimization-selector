; ModuleID = 'test_cases\recursive_ops.c'
source_filename = "test_cases\\recursive_ops.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.33.0"

; Function Attrs: nofree nosync nounwind memory(none) uwtable
define dso_local i64 @fibonacci(i32 noundef %0) local_unnamed_addr #0 {
  %2 = icmp slt i32 %0, 2
  br i1 %2, label %3, label %8

3:                                                ; preds = %8, %1
  %4 = phi i64 [ 0, %1 ], [ %14, %8 ]
  %5 = phi i32 [ %0, %1 ], [ %13, %8 ]
  %6 = sext i32 %5 to i64
  %7 = add nsw i64 %4, %6
  ret i64 %7

8:                                                ; preds = %1, %8
  %9 = phi i32 [ %13, %8 ], [ %0, %1 ]
  %10 = phi i64 [ %14, %8 ], [ 0, %1 ]
  %11 = add nsw i32 %9, -1
  %12 = tail call i64 @fibonacci(i32 noundef %11)
  %13 = add nsw i32 %9, -2
  %14 = add nsw i64 %12, %10
  %15 = icmp ult i32 %9, 4
  br i1 %15, label %3, label %8
}

; Function Attrs: nofree nosync nounwind memory(none) uwtable
define dso_local i64 @ackermann(i32 noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = icmp eq i32 %0, 0
  br i1 %3, label %4, label %8

4:                                                ; preds = %14, %2
  %5 = phi i32 [ %1, %2 ], [ %15, %14 ]
  %6 = add nsw i32 %5, 1
  %7 = sext i32 %6 to i64
  ret i64 %7

8:                                                ; preds = %2, %14
  %9 = phi i32 [ %15, %14 ], [ %1, %2 ]
  %10 = phi i32 [ %16, %14 ], [ %0, %2 ]
  %11 = icmp sgt i32 %10, 0
  %12 = icmp eq i32 %9, 0
  %13 = and i1 %11, %12
  br i1 %13, label %14, label %18

14:                                               ; preds = %8, %18
  %15 = phi i32 [ %21, %18 ], [ 1, %8 ]
  %16 = add nsw i32 %10, -1
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %4, label %8

18:                                               ; preds = %8
  %19 = add nsw i32 %9, -1
  %20 = tail call i64 @ackermann(i32 noundef %10, i32 noundef %19), !range !5
  %21 = trunc i64 %20 to i32
  br label %14
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
