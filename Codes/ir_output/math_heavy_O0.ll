; ModuleID = 'math_heavy.c'
source_filename = "math_heavy.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.33.0"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @compute_formula(double noundef %0, double noundef %1) #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = alloca double, align 8
  %6 = alloca i32, align 4
  store double %1, ptr %3, align 8
  store double %0, ptr %4, align 8
  store double 0.000000e+00, ptr %5, align 8
  store i32 0, ptr %6, align 4
  br label %7

7:                                                ; preds = %26, %2
  %8 = load i32, ptr %6, align 4
  %9 = icmp slt i32 %8, 50
  br i1 %9, label %10, label %29

10:                                               ; preds = %7
  %11 = load double, ptr %4, align 8
  %12 = load double, ptr %4, align 8
  %13 = fmul double %11, %12
  %14 = load double, ptr %3, align 8
  %15 = fadd double %14, 1.500000e+00
  %16 = fdiv double %13, %15
  %17 = load double, ptr %3, align 8
  %18 = fneg double %17
  %19 = call double @llvm.fmuladd.f64(double %18, double 5.000000e-01, double %16)
  %20 = load double, ptr %5, align 8
  %21 = fadd double %20, %19
  store double %21, ptr %5, align 8
  %22 = load double, ptr %4, align 8
  %23 = fadd double %22, 1.000000e-02
  store double %23, ptr %4, align 8
  %24 = load double, ptr %3, align 8
  %25 = fsub double %24, 1.000000e-02
  store double %25, ptr %3, align 8
  br label %26

26:                                               ; preds = %10
  %27 = load i32, ptr %6, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, ptr %6, align 4
  br label %7, !llvm.loop !5

29:                                               ; preds = %7
  %30 = load double, ptr %5, align 8
  ret double %30
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca double, align 8
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store double 0.000000e+00, ptr %2, align 8
  store double 1.000000e+00, ptr %3, align 8
  store double 1.000000e+02, ptr %4, align 8
  store i32 0, ptr %5, align 4
  br label %6

6:                                                ; preds = %30, %0
  %7 = load i32, ptr %5, align 4
  %8 = icmp slt i32 %7, 10000
  br i1 %8, label %9, label %33

9:                                                ; preds = %6
  %10 = load i32, ptr %5, align 4
  %11 = srem i32 %10, 2
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %19

13:                                               ; preds = %9
  %14 = load double, ptr %4, align 8
  %15 = load double, ptr %3, align 8
  %16 = call double @compute_formula(double noundef %15, double noundef %14)
  %17 = load double, ptr %2, align 8
  %18 = fadd double %17, %16
  store double %18, ptr %2, align 8
  br label %25

19:                                               ; preds = %9
  %20 = load double, ptr %3, align 8
  %21 = load double, ptr %4, align 8
  %22 = call double @compute_formula(double noundef %21, double noundef %20)
  %23 = load double, ptr %2, align 8
  %24 = fsub double %23, %22
  store double %24, ptr %2, align 8
  br label %25

25:                                               ; preds = %19, %13
  %26 = load double, ptr %3, align 8
  %27 = fadd double %26, 5.000000e-01
  store double %27, ptr %3, align 8
  %28 = load double, ptr %4, align 8
  %29 = fadd double %28, 5.000000e-01
  store double %29, ptr %4, align 8
  br label %30

30:                                               ; preds = %25
  %31 = load i32, ptr %5, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, ptr %5, align 4
  br label %6, !llvm.loop !7

33:                                               ; preds = %6
  %34 = load double, ptr %2, align 8
  %35 = fptosi double %34 to i32
  %36 = srem i32 %35, 256
  ret i32 %36
}

attributes #0 = { noinline nounwind optnone uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

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
