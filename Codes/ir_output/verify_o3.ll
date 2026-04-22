; ModuleID = 'Codes\test_cases\ai_test_security_checks.c'
source_filename = "Codes\\test_cases\\ai_test_security_checks.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.44.35224"

@assert_failed = dso_local local_unnamed_addr global i32 0, align 4

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local noundef i32 @safe_divide(i32 noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = icmp eq i32 %1, 0
  br i1 %3, label %4, label %5

4:                                                ; preds = %2
  store i32 1, ptr @assert_failed, align 4
  br label %7

5:                                                ; preds = %2
  %6 = sdiv i32 %0, %1
  br label %7

7:                                                ; preds = %5, %4
  %8 = phi i32 [ 0, %4 ], [ %6, %5 ]
  ret i32 %8
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local range(i32 0, 256) i32 @calculate_safe_index(i32 noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = add nsw i32 %1, %0
  %4 = icmp ugt i32 %3, 255
  br i1 %4, label %5, label %6

5:                                                ; preds = %2
  store i32 1, ptr @assert_failed, align 4
  br label %6

6:                                                ; preds = %2, %5
  %7 = phi i32 [ 0, %5 ], [ %3, %2 ]
  ret i32 %7
}

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local i32 @do_work(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) local_unnamed_addr #1 {
  %5 = icmp eq i32 %1, 0
  br i1 %5, label %6, label %7

6:                                                ; preds = %4
  store i32 1, ptr @assert_failed, align 4
  br label %9

7:                                                ; preds = %4
  %8 = sdiv i32 %0, %1
  br label %9

9:                                                ; preds = %6, %7
  %10 = phi i32 [ 0, %6 ], [ %8, %7 ]
  %11 = add nsw i32 %3, %2
  %12 = icmp ugt i32 %11, 255
  br i1 %12, label %13, label %14

13:                                               ; preds = %9
  store i32 1, ptr @assert_failed, align 4
  br label %14

14:                                               ; preds = %9, %13
  %15 = phi i32 [ 0, %13 ], [ %11, %9 ]
  %16 = add nsw i32 %15, %10
  ret i32 %16
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: write, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local range(i32 -1, 2) i32 @main() local_unnamed_addr #2 {
  %1 = tail call i32 @do_work(i32 noundef 100, i32 noundef 5, i32 noundef 50, i32 noundef 10)
  %2 = load i32, ptr @assert_failed, align 4
  %3 = icmp eq i32 %2, 0
  %4 = icmp slt i32 %1, 1
  %5 = sext i1 %4 to i32
  %6 = select i1 %3, i32 %5, i32 1
  ret i32 %6
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree noinline norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: write, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.2 (https://github.com/llvm/llvm-project 1ab49a973e210e97d61e5db6557180dcb92c3e98)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "Codes\\test_cases\\ai_test_security_checks.c", directory: "F:\\My Files\\NIT Warangal\\Semester IV\\CLG Work or Project\\Compiler Design")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 2}
!4 = !{i32 8, !"PIC Level", i32 2}
!5 = !{i32 7, !"uwtable", i32 2}
!6 = !{i32 1, !"MaxTLSAlign", i32 65536}
!7 = !{!"clang version 22.1.2 (https://github.com/llvm/llvm-project 1ab49a973e210e97d61e5db6557180dcb92c3e98)"}
