; ModuleID = 'Codes\test_cases\security_checks.c'
source_filename = "Codes\\test_cases\\security_checks.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.44.35224"

@assert_failed = dso_local local_unnamed_addr global i32 0, align 4

; Function Attrs: nofree norecurse nosync nounwind memory(write, argmem: readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local void @safe_copy(ptr noundef writeonly captures(address_is_null) %0, ptr noundef readonly captures(address_is_null) %1, i64 noundef %2) local_unnamed_addr #0 {
  %4 = icmp eq ptr %0, null
  %5 = icmp eq ptr %1, null
  %6 = or i1 %4, %5
  br i1 %6, label %28, label %7

7:                                                ; preds = %3
  %8 = icmp eq i64 %2, 0
  br i1 %8, label %29, label %9

9:                                                ; preds = %7, %20
  %10 = phi i64 [ %25, %20 ], [ 0, %7 ]
  %11 = icmp eq i64 %10, 256
  br i1 %11, label %28, label %12

12:                                               ; preds = %9
  %13 = getelementptr inbounds nuw i8, ptr %1, i64 %10
  %14 = load i8, ptr %13, align 1
  %15 = getelementptr inbounds nuw i8, ptr %0, i64 %10
  store i8 %14, ptr %15, align 1
  %16 = icmp eq i8 %14, 0
  %17 = or disjoint i64 %10, 1
  %18 = icmp eq i64 %17, %2
  %19 = select i1 %16, i1 true, i1 %18
  br i1 %19, label %29, label %20, !llvm.loop !8

20:                                               ; preds = %12
  %21 = getelementptr inbounds nuw i8, ptr %1, i64 %17
  %22 = load i8, ptr %21, align 1
  %23 = getelementptr inbounds nuw i8, ptr %0, i64 %17
  store i8 %22, ptr %23, align 1
  %24 = icmp eq i8 %22, 0
  %25 = add nuw nsw i64 %10, 2
  %26 = icmp eq i64 %25, %2
  %27 = select i1 %24, i1 true, i1 %26
  br i1 %27, label %29, label %9, !llvm.loop !8

28:                                               ; preds = %9, %3
  store i32 1, ptr @assert_failed, align 4
  br label %29

29:                                               ; preds = %12, %20, %28, %7
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local range(i32 0, 256) i32 @calculate_safe_index(i32 noundef %0, i32 noundef %1) local_unnamed_addr #1 {
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

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local noundef i32 @main() local_unnamed_addr #1 {
  store i32 1, ptr @assert_failed, align 4
  ret i32 1
}

attributes #0 = { nofree norecurse nosync nounwind memory(write, argmem: readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.2 (https://github.com/llvm/llvm-project 1ab49a973e210e97d61e5db6557180dcb92c3e98)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "Codes\\test_cases\\security_checks.c", directory: "F:\\My Files\\NIT Warangal\\Semester IV\\CLG Work or Project\\Compiler Design")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 2}
!4 = !{i32 8, !"PIC Level", i32 2}
!5 = !{i32 7, !"uwtable", i32 2}
!6 = !{i32 1, !"MaxTLSAlign", i32 65536}
!7 = !{!"clang version 22.1.2 (https://github.com/llvm/llvm-project 1ab49a973e210e97d61e5db6557180dcb92c3e98)"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
