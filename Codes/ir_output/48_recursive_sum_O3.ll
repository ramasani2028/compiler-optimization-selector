; ModuleID = 'test_cases\48_recursive_sum.c'
source_filename = "test_cases\\48_recursive_sum.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.33.0"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local i32 @sum(i32 noundef %0) local_unnamed_addr #0 {
  %2 = icmp eq i32 %0, 0
  br i1 %2, label %14, label %3

3:                                                ; preds = %1
  %4 = add i32 %0, -1
  %5 = mul i32 %4, %4
  %6 = zext i32 %4 to i33
  %7 = add i32 %0, -2
  %8 = zext i32 %7 to i33
  %9 = mul i33 %6, %8
  %10 = lshr i33 %9, 1
  %11 = trunc i33 %10 to i32
  %12 = add i32 %5, %0
  %13 = sub i32 %12, %11
  br label %14

14:                                               ; preds = %3, %1
  %15 = phi i32 [ 0, %1 ], [ %13, %3 ]
  ret i32 %15
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  ret i32 210
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 2}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 2}
!3 = !{i32 1, !"MaxTLSAlign", i32 65536}
!4 = !{!"clang version 18.1.8"}
