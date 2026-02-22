; ModuleID = 'security_checks.c'
source_filename = "security_checks.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.33.0"

@assert_failed = dso_local local_unnamed_addr global i32 0, align 4

; Function Attrs: nofree norecurse nosync nounwind memory(write, argmem: readwrite, inaccessiblemem: none) uwtable
define dso_local void @safe_copy(ptr noundef writeonly %0, ptr noundef readonly %1, i64 noundef %2) local_unnamed_addr #0 {
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
  %13 = getelementptr inbounds i8, ptr %1, i64 %10
  %14 = load i8, ptr %13, align 1, !tbaa !5
  %15 = getelementptr inbounds i8, ptr %0, i64 %10
  store i8 %14, ptr %15, align 1, !tbaa !5
  %16 = icmp eq i8 %14, 0
  %17 = or disjoint i64 %10, 1
  %18 = icmp eq i64 %17, %2
  %19 = select i1 %16, i1 true, i1 %18
  br i1 %19, label %29, label %20, !llvm.loop !8

20:                                               ; preds = %12
  %21 = getelementptr inbounds i8, ptr %1, i64 %17
  %22 = load i8, ptr %21, align 1, !tbaa !5
  %23 = getelementptr inbounds i8, ptr %0, i64 %17
  store i8 %22, ptr %23, align 1, !tbaa !5
  %24 = icmp eq i8 %22, 0
  %25 = add nuw nsw i64 %10, 2
  %26 = icmp eq i64 %25, %2
  %27 = select i1 %24, i1 true, i1 %26
  br i1 %27, label %29, label %9, !llvm.loop !8

28:                                               ; preds = %9, %3
  store i32 1, ptr @assert_failed, align 4, !tbaa !10
  br label %29

29:                                               ; preds = %12, %20, %28, %7
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none) uwtable
define dso_local i32 @calculate_safe_index(i32 noundef %0, i32 noundef %1) local_unnamed_addr #1 {
  %3 = add nsw i32 %1, %0
  %4 = icmp ugt i32 %3, 255
  br i1 %4, label %5, label %6

5:                                                ; preds = %2
  store i32 1, ptr @assert_failed, align 4, !tbaa !10
  br label %6

6:                                                ; preds = %2, %5
  %7 = phi i32 [ 0, %5 ], [ %3, %2 ]
  ret i32 %7
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none) uwtable
define dso_local noundef i32 @main() local_unnamed_addr #1 {
  store i32 1, ptr @assert_failed, align 4, !tbaa !10
  ret i32 1
}

attributes #0 = { nofree norecurse nosync nounwind memory(write, argmem: readwrite, inaccessiblemem: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 2}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 2}
!3 = !{i32 1, !"MaxTLSAlign", i32 65536}
!4 = !{!"clang version 18.1.8"}
!5 = !{!6, !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !6, i64 0}
