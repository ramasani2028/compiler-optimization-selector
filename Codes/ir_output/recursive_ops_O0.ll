; ModuleID = 'test_cases\recursive_ops.c'
source_filename = "test_cases\\recursive_ops.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.33.0"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @fibonacci(i32 noundef %0) #0 {
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  %5 = icmp sle i32 %4, 1
  br i1 %5, label %6, label %9

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4
  %8 = sext i32 %7 to i64
  store i64 %8, ptr %2, align 8
  br label %17

9:                                                ; preds = %1
  %10 = load i32, ptr %3, align 4
  %11 = sub nsw i32 %10, 1
  %12 = call i64 @fibonacci(i32 noundef %11)
  %13 = load i32, ptr %3, align 4
  %14 = sub nsw i32 %13, 2
  %15 = call i64 @fibonacci(i32 noundef %14)
  %16 = add nsw i64 %12, %15
  store i64 %16, ptr %2, align 8
  br label %17

17:                                               ; preds = %9, %6
  %18 = load i64, ptr %2, align 8
  ret i64 %18
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @ackermann(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %1, ptr %4, align 4
  store i32 %0, ptr %5, align 4
  %6 = load i32, ptr %5, align 4
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %12

8:                                                ; preds = %2
  %9 = load i32, ptr %4, align 4
  %10 = add nsw i32 %9, 1
  %11 = sext i32 %10 to i64
  store i64 %11, ptr %3, align 8
  br label %31

12:                                               ; preds = %2
  %13 = load i32, ptr %5, align 4
  %14 = icmp sgt i32 %13, 0
  br i1 %14, label %15, label %22

15:                                               ; preds = %12
  %16 = load i32, ptr %4, align 4
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %22

18:                                               ; preds = %15
  %19 = load i32, ptr %5, align 4
  %20 = sub nsw i32 %19, 1
  %21 = call i64 @ackermann(i32 noundef %20, i32 noundef 1)
  store i64 %21, ptr %3, align 8
  br label %31

22:                                               ; preds = %15, %12
  %23 = load i32, ptr %4, align 4
  %24 = sub nsw i32 %23, 1
  %25 = load i32, ptr %5, align 4
  %26 = call i64 @ackermann(i32 noundef %25, i32 noundef %24)
  %27 = trunc i64 %26 to i32
  %28 = load i32, ptr %5, align 4
  %29 = sub nsw i32 %28, 1
  %30 = call i64 @ackermann(i32 noundef %29, i32 noundef %27)
  store i64 %30, ptr %3, align 8
  br label %31

31:                                               ; preds = %22, %18, %8
  %32 = load i64, ptr %3, align 8
  ret i64 %32
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  store i32 0, ptr %1, align 4
  %4 = call i64 @fibonacci(i32 noundef 30)
  store i64 %4, ptr %2, align 8
  %5 = call i64 @ackermann(i32 noundef 3, i32 noundef 4)
  store i64 %5, ptr %3, align 8
  %6 = load i64, ptr %2, align 8
  %7 = load i64, ptr %3, align 8
  %8 = add nsw i64 %6, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 256
  ret i32 %10
}

attributes #0 = { noinline nounwind optnone uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 2}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 2}
!3 = !{i32 1, !"MaxTLSAlign", i32 65536}
!4 = !{!"clang version 18.1.8"}
