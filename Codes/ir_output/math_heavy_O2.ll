; ModuleID = 'test_cases\math_heavy.c'
source_filename = "test_cases\\math_heavy.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.33.0"

; Function Attrs: nofree norecurse nosync nounwind memory(none) uwtable
define dso_local double @compute_formula(double noundef %0, double noundef %1) local_unnamed_addr #0 {
  br label %4

3:                                                ; preds = %4
  ret double %22

4:                                                ; preds = %4, %2
  %5 = phi i32 [ 0, %2 ], [ %25, %4 ]
  %6 = phi double [ 0.000000e+00, %2 ], [ %22, %4 ]
  %7 = phi double [ %0, %2 ], [ %23, %4 ]
  %8 = phi double [ %1, %2 ], [ %24, %4 ]
  %9 = fmul double %7, %7
  %10 = fadd double %8, 1.500000e+00
  %11 = fdiv double %9, %10
  %12 = fneg double %8
  %13 = tail call double @llvm.fmuladd.f64(double %12, double 5.000000e-01, double %11)
  %14 = fadd double %6, %13
  %15 = fadd double %7, 1.000000e-02
  %16 = fadd double %8, -1.000000e-02
  %17 = fmul double %15, %15
  %18 = fadd double %16, 1.500000e+00
  %19 = fdiv double %17, %18
  %20 = fneg double %16
  %21 = tail call double @llvm.fmuladd.f64(double %20, double 5.000000e-01, double %19)
  %22 = fadd double %14, %21
  %23 = fadd double %15, 1.000000e-02
  %24 = fadd double %16, -1.000000e-02
  %25 = add nuw nsw i32 %5, 2
  %26 = icmp eq i32 %25, 50
  br i1 %26, label %3, label %4, !llvm.loop !5
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #1

; Function Attrs: nofree norecurse nosync nounwind memory(none) uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
  br label %4

1:                                                ; preds = %62
  %2 = fptosi double %63 to i32
  %3 = srem i32 %2, 256
  ret i32 %3

4:                                                ; preds = %0, %62
  %5 = phi i32 [ 0, %0 ], [ %65, %62 ]
  %6 = phi double [ 0.000000e+00, %0 ], [ %63, %62 ]
  %7 = phi <2 x double> [ <double 1.000000e+00, double 1.000000e+02>, %0 ], [ %64, %62 ]
  %8 = and i32 %5, 1
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %36

10:                                               ; preds = %4, %10
  %11 = phi i32 [ %32, %10 ], [ 0, %4 ]
  %12 = phi double [ %30, %10 ], [ 0.000000e+00, %4 ]
  %13 = phi <2 x double> [ %31, %10 ], [ %7, %4 ]
  %14 = fmul <2 x double> %13, %13
  %15 = extractelement <2 x double> %14, i64 0
  %16 = extractelement <2 x double> %13, i64 1
  %17 = fadd double %16, 1.500000e+00
  %18 = fdiv double %15, %17
  %19 = fneg double %16
  %20 = tail call double @llvm.fmuladd.f64(double %19, double 5.000000e-01, double %18)
  %21 = fadd double %12, %20
  %22 = fadd <2 x double> %13, <double 1.000000e-02, double -1.000000e-02>
  %23 = fmul <2 x double> %22, %22
  %24 = extractelement <2 x double> %23, i64 0
  %25 = extractelement <2 x double> %22, i64 1
  %26 = fadd double %25, 1.500000e+00
  %27 = fdiv double %24, %26
  %28 = fneg double %25
  %29 = tail call double @llvm.fmuladd.f64(double %28, double 5.000000e-01, double %27)
  %30 = fadd double %21, %29
  %31 = fadd <2 x double> %22, <double 1.000000e-02, double -1.000000e-02>
  %32 = add nuw nsw i32 %11, 2
  %33 = icmp eq i32 %32, 50
  br i1 %33, label %34, label %10, !llvm.loop !5

34:                                               ; preds = %10
  %35 = fadd double %6, %30
  br label %62

36:                                               ; preds = %4, %36
  %37 = phi i32 [ %58, %36 ], [ 0, %4 ]
  %38 = phi double [ %56, %36 ], [ 0.000000e+00, %4 ]
  %39 = phi <2 x double> [ %57, %36 ], [ %7, %4 ]
  %40 = fmul <2 x double> %39, %39
  %41 = extractelement <2 x double> %40, i64 1
  %42 = extractelement <2 x double> %39, i64 0
  %43 = fadd double %42, 1.500000e+00
  %44 = fdiv double %41, %43
  %45 = fneg double %42
  %46 = tail call double @llvm.fmuladd.f64(double %45, double 5.000000e-01, double %44)
  %47 = fadd double %38, %46
  %48 = fadd <2 x double> %39, <double -1.000000e-02, double 1.000000e-02>
  %49 = fmul <2 x double> %48, %48
  %50 = extractelement <2 x double> %49, i64 1
  %51 = extractelement <2 x double> %48, i64 0
  %52 = fadd double %51, 1.500000e+00
  %53 = fdiv double %50, %52
  %54 = fneg double %51
  %55 = tail call double @llvm.fmuladd.f64(double %54, double 5.000000e-01, double %53)
  %56 = fadd double %47, %55
  %57 = fadd <2 x double> %48, <double -1.000000e-02, double 1.000000e-02>
  %58 = add nuw nsw i32 %37, 2
  %59 = icmp eq i32 %58, 50
  br i1 %59, label %60, label %36, !llvm.loop !5

60:                                               ; preds = %36
  %61 = fsub double %6, %56
  br label %62

62:                                               ; preds = %60, %34
  %63 = phi double [ %35, %34 ], [ %61, %60 ]
  %64 = fadd <2 x double> %7, <double 5.000000e-01, double 5.000000e-01>
  %65 = add nuw nsw i32 %5, 1
  %66 = icmp eq i32 %65, 10000
  br i1 %66, label %1, label %4, !llvm.loop !7
}

attributes #0 = { nofree norecurse nosync nounwind memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }

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
