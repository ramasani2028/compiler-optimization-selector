; ModuleID = 'test_cases\31_palindrome_check.c'
source_filename = "test_cases\\31_palindrome_check.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.33.0"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 1001, ptr %2, align 4
  store i32 0, ptr %3, align 4
  %6 = load i32, ptr %2, align 4
  store i32 %6, ptr %5, align 4
  br label %7

7:                                                ; preds = %10, %0
  %8 = load i32, ptr %2, align 4
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %19

10:                                               ; preds = %7
  %11 = load i32, ptr %2, align 4
  %12 = srem i32 %11, 10
  store i32 %12, ptr %4, align 4
  %13 = load i32, ptr %3, align 4
  %14 = mul nsw i32 %13, 10
  %15 = load i32, ptr %4, align 4
  %16 = add nsw i32 %14, %15
  store i32 %16, ptr %3, align 4
  %17 = load i32, ptr %2, align 4
  %18 = sdiv i32 %17, 10
  store i32 %18, ptr %2, align 4
  br label %7, !llvm.loop !5

19:                                               ; preds = %7
  %20 = load i32, ptr %5, align 4
  %21 = load i32, ptr %3, align 4
  %22 = icmp eq i32 %20, %21
  br i1 %22, label %23, label %24

23:                                               ; preds = %19
  store i32 1, ptr %1, align 4
  br label %25

24:                                               ; preds = %19
  store i32 0, ptr %1, align 4
  br label %25

25:                                               ; preds = %24, %23
  %26 = load i32, ptr %1, align 4
  ret i32 %26
}

attributes #0 = { noinline nounwind optnone uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 2}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 2}
!3 = !{i32 1, !"MaxTLSAlign", i32 65536}
!4 = !{!"clang version 18.1.8"}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.mustprogress"}
