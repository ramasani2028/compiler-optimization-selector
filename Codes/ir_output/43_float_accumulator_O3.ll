; ModuleID = 'test_cases\43_float_accumulator.c'
source_filename = "test_cases\\43_float_accumulator.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.33.0"

; Function Attrs: nofree norecurse nosync nounwind memory(none) uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
  br label %3

1:                                                ; preds = %3
  %2 = fptosi float %19 to i32
  ret i32 %2

3:                                                ; preds = %3, %0
  %4 = phi i32 [ 0, %0 ], [ %20, %3 ]
  %5 = phi float [ 0.000000e+00, %0 ], [ %19, %3 ]
  %6 = sitofp i32 %4 to float
  %7 = tail call float @llvm.fmuladd.f32(float %6, float 0x3FB99999A0000000, float %5)
  %8 = add nuw nsw i32 %4, 1
  %9 = sitofp i32 %8 to float
  %10 = tail call float @llvm.fmuladd.f32(float %9, float 0x3FB99999A0000000, float %7)
  %11 = add nuw nsw i32 %4, 2
  %12 = sitofp i32 %11 to float
  %13 = tail call float @llvm.fmuladd.f32(float %12, float 0x3FB99999A0000000, float %10)
  %14 = add nuw nsw i32 %4, 3
  %15 = sitofp i32 %14 to float
  %16 = tail call float @llvm.fmuladd.f32(float %15, float 0x3FB99999A0000000, float %13)
  %17 = add nuw nsw i32 %4, 4
  %18 = sitofp i32 %17 to float
  %19 = tail call float @llvm.fmuladd.f32(float %18, float 0x3FB99999A0000000, float %16)
  %20 = add nuw nsw i32 %4, 5
  %21 = icmp eq i32 %20, 100
  br i1 %21, label %1, label %3, !llvm.loop !5
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #1

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
