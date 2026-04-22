; ModuleID = 'test_cases\math_heavy.c'
source_filename = "test_cases\\math_heavy.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.33.0"

; Function Attrs: nofree norecurse nosync nounwind memory(none) uwtable
define dso_local double @compute_formula(double noundef %0, double noundef %1) local_unnamed_addr #0 {
  br label %4

3:                                                ; preds = %4
  ret double %14

4:                                                ; preds = %2, %4
  %5 = phi i32 [ 0, %2 ], [ %17, %4 ]
  %6 = phi double [ 0.000000e+00, %2 ], [ %14, %4 ]
  %7 = phi double [ %0, %2 ], [ %15, %4 ]
  %8 = phi double [ %1, %2 ], [ %16, %4 ]
  %9 = fmul double %7, %7
  %10 = fadd double %8, 1.500000e+00
  %11 = fdiv double %9, %10
  %12 = fneg double %8
  %13 = tail call double @llvm.fmuladd.f64(double %12, double 5.000000e-01, double %11)
  %14 = fadd double %6, %13
  %15 = fadd double %7, 1.000000e-02
  %16 = fadd double %8, -1.000000e-02
  %17 = add nuw nsw i32 %5, 1
  %18 = icmp eq i32 %17, 50
  br i1 %18, label %3, label %4, !llvm.loop !5
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #1

; Function Attrs: nofree norecurse nosync nounwind memory(none) uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
  br label %4

1:                                                ; preds = %45
  %2 = fptosi double %46 to i32
  %3 = srem i32 %2, 256
  ret i32 %3

4:                                                ; preds = %0, %45
  %5 = phi i32 [ 0, %0 ], [ %49, %45 ]
  %6 = phi double [ 1.000000e+02, %0 ], [ %48, %45 ]
  %7 = phi double [ 1.000000e+00, %0 ], [ %47, %45 ]
  %8 = phi double [ 0.000000e+00, %0 ], [ %46, %45 ]
  %9 = and i32 %5, 1
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %28

11:                                               ; preds = %4, %11
  %12 = phi i32 [ %24, %11 ], [ 0, %4 ]
  %13 = phi double [ %21, %11 ], [ 0.000000e+00, %4 ]
  %14 = phi double [ %22, %11 ], [ %7, %4 ]
  %15 = phi double [ %23, %11 ], [ %6, %4 ]
  %16 = fmul double %14, %14
  %17 = fadd double %15, 1.500000e+00
  %18 = fdiv double %16, %17
  %19 = fneg double %15
  %20 = tail call double @llvm.fmuladd.f64(double %19, double 5.000000e-01, double %18)
  %21 = fadd double %13, %20
  %22 = fadd double %14, 1.000000e-02
  %23 = fadd double %15, -1.000000e-02
  %24 = add nuw nsw i32 %12, 1
  %25 = icmp eq i32 %24, 50
  br i1 %25, label %26, label %11, !llvm.loop !5

26:                                               ; preds = %11
  %27 = fadd double %8, %21
  br label %45

28:                                               ; preds = %4, %28
  %29 = phi i32 [ %41, %28 ], [ 0, %4 ]
  %30 = phi double [ %38, %28 ], [ 0.000000e+00, %4 ]
  %31 = phi double [ %39, %28 ], [ %6, %4 ]
  %32 = phi double [ %40, %28 ], [ %7, %4 ]
  %33 = fmul double %31, %31
  %34 = fadd double %32, 1.500000e+00
  %35 = fdiv double %33, %34
  %36 = fneg double %32
  %37 = tail call double @llvm.fmuladd.f64(double %36, double 5.000000e-01, double %35)
  %38 = fadd double %30, %37
  %39 = fadd double %31, 1.000000e-02
  %40 = fadd double %32, -1.000000e-02
  %41 = add nuw nsw i32 %29, 1
  %42 = icmp eq i32 %41, 50
  br i1 %42, label %43, label %28, !llvm.loop !5

43:                                               ; preds = %28
  %44 = fsub double %8, %38
  br label %45

45:                                               ; preds = %43, %26
  %46 = phi double [ %27, %26 ], [ %44, %43 ]
  %47 = fadd double %7, 5.000000e-01
  %48 = fadd double %6, 5.000000e-01
  %49 = add nuw nsw i32 %5, 1
  %50 = icmp eq i32 %49, 10000
  br i1 %50, label %1, label %4, !llvm.loop !8
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
!5 = distinct !{!5, !6, !7}
!6 = !{!"llvm.loop.mustprogress"}
!7 = !{!"llvm.loop.unroll.disable"}
!8 = distinct !{!8, !6, !7}
