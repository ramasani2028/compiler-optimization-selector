; ModuleID = 'test_cases\34_dynamic_memory_sim.c'
source_filename = "test_cases\\34_dynamic_memory_sim.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.33.0"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [10 x i32], align 16
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %7 = getelementptr inbounds [10 x i32], ptr %2, i64 0, i64 0
  store ptr %7, ptr %3, align 8
  store i32 0, ptr %4, align 4
  br label %8

8:                                                ; preds = %19, %0
  %9 = load i32, ptr %4, align 4
  %10 = icmp slt i32 %9, 10
  br i1 %10, label %11, label %22

11:                                               ; preds = %8
  %12 = load i32, ptr %4, align 4
  %13 = load i32, ptr %4, align 4
  %14 = mul nsw i32 %12, %13
  %15 = load ptr, ptr %3, align 8
  %16 = load i32, ptr %4, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i32, ptr %15, i64 %17
  store i32 %14, ptr %18, align 4
  br label %19

19:                                               ; preds = %11
  %20 = load i32, ptr %4, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, ptr %4, align 4
  br label %8, !llvm.loop !5

22:                                               ; preds = %8
  store i32 0, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %23

23:                                               ; preds = %34, %22
  %24 = load i32, ptr %6, align 4
  %25 = icmp slt i32 %24, 10
  br i1 %25, label %26, label %37

26:                                               ; preds = %23
  %27 = load ptr, ptr %3, align 8
  %28 = load i32, ptr %6, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i32, ptr %27, i64 %29
  %31 = load i32, ptr %30, align 4
  %32 = load i32, ptr %5, align 4
  %33 = add nsw i32 %32, %31
  store i32 %33, ptr %5, align 4
  br label %34

34:                                               ; preds = %26
  %35 = load i32, ptr %6, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr %6, align 4
  br label %23, !llvm.loop !7

37:                                               ; preds = %23
  %38 = load i32, ptr %5, align 4
  ret i32 %38
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
!7 = distinct !{!7, !6}
