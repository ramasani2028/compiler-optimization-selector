; ModuleID = 'test_cases\46_switch_fallthrough.c'
source_filename = "test_cases\\46_switch_fallthrough.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.33.0"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 2, ptr %2, align 4
  store i32 0, ptr %3, align 4
  %4 = load i32, ptr %2, align 4
  switch i32 %4, label %14 [
    i32 1, label %5
    i32 2, label %8
    i32 3, label %11
  ]

5:                                                ; preds = %0
  %6 = load i32, ptr %3, align 4
  %7 = add nsw i32 %6, 1
  store i32 %7, ptr %3, align 4
  br label %8

8:                                                ; preds = %0, %5
  %9 = load i32, ptr %3, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, ptr %3, align 4
  br label %11

11:                                               ; preds = %0, %8
  %12 = load i32, ptr %3, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, ptr %3, align 4
  br label %17

14:                                               ; preds = %0
  %15 = load i32, ptr %3, align 4
  %16 = add nsw i32 %15, -1
  store i32 %16, ptr %3, align 4
  br label %17

17:                                               ; preds = %14, %11
  %18 = load i32, ptr %3, align 4
  ret i32 %18
}

attributes #0 = { noinline nounwind optnone uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 2}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 2}
!3 = !{i32 1, !"MaxTLSAlign", i32 65536}
!4 = !{!"clang version 18.1.8"}
