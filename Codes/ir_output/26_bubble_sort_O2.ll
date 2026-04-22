; ModuleID = 'test_cases\26_bubble_sort.c'
source_filename = "test_cases\\26_bubble_sort.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.33.0"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define dso_local void @bubbleSort(ptr nocapture noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = add i32 %1, -1
  %4 = icmp sgt i32 %1, 1
  br i1 %4, label %5, label %55

5:                                                ; preds = %2
  %6 = getelementptr i32, ptr %0, i64 1
  br label %7

7:                                                ; preds = %5, %51
  %8 = phi i32 [ %53, %51 ], [ %3, %5 ]
  %9 = phi i32 [ %52, %51 ], [ 0, %5 ]
  %10 = zext i32 %8 to i64
  %11 = sub nsw i32 %9, %1
  %12 = icmp slt i32 %11, -1
  br i1 %12, label %13, label %51

13:                                               ; preds = %7
  %14 = load i32, ptr %0, align 4, !tbaa !5
  %15 = and i64 %10, 1
  %16 = icmp eq i32 %8, 1
  br i1 %16, label %41, label %17

17:                                               ; preds = %13
  %18 = and i64 %10, 4294967294
  br label %19

19:                                               ; preds = %37, %17
  %20 = phi i32 [ %14, %17 ], [ %38, %37 ]
  %21 = phi i64 [ 0, %17 ], [ %31, %37 ]
  %22 = phi i64 [ 0, %17 ], [ %39, %37 ]
  %23 = or disjoint i64 %21, 1
  %24 = getelementptr inbounds i32, ptr %0, i64 %23
  %25 = load i32, ptr %24, align 4, !tbaa !5
  %26 = icmp sgt i32 %20, %25
  br i1 %26, label %27, label %29

27:                                               ; preds = %19
  %28 = getelementptr inbounds i32, ptr %0, i64 %21
  store i32 %25, ptr %28, align 4, !tbaa !5
  store i32 %20, ptr %24, align 4, !tbaa !5
  br label %29

29:                                               ; preds = %19, %27
  %30 = phi i32 [ %25, %19 ], [ %20, %27 ]
  %31 = add nuw nsw i64 %21, 2
  %32 = getelementptr inbounds i32, ptr %0, i64 %31
  %33 = load i32, ptr %32, align 4, !tbaa !5
  %34 = icmp sgt i32 %30, %33
  br i1 %34, label %35, label %37

35:                                               ; preds = %29
  %36 = getelementptr inbounds i32, ptr %0, i64 %23
  store i32 %33, ptr %36, align 4, !tbaa !5
  store i32 %30, ptr %32, align 4, !tbaa !5
  br label %37

37:                                               ; preds = %35, %29
  %38 = phi i32 [ %33, %29 ], [ %30, %35 ]
  %39 = add i64 %22, 2
  %40 = icmp eq i64 %39, %18
  br i1 %40, label %41, label %19, !llvm.loop !9

41:                                               ; preds = %37, %13
  %42 = phi i32 [ %14, %13 ], [ %38, %37 ]
  %43 = phi i64 [ 0, %13 ], [ %31, %37 ]
  %44 = icmp eq i64 %15, 0
  br i1 %44, label %51, label %45

45:                                               ; preds = %41
  %46 = getelementptr i32, ptr %6, i64 %43
  %47 = load i32, ptr %46, align 4, !tbaa !5
  %48 = icmp sgt i32 %42, %47
  br i1 %48, label %49, label %51

49:                                               ; preds = %45
  %50 = getelementptr inbounds i32, ptr %0, i64 %43
  store i32 %47, ptr %50, align 4, !tbaa !5
  store i32 %42, ptr %46, align 4, !tbaa !5
  br label %51

51:                                               ; preds = %41, %49, %45, %7
  %52 = add nuw nsw i32 %9, 1
  %53 = add i32 %8, -1
  %54 = icmp eq i32 %52, %3
  br i1 %54, label %55, label %7, !llvm.loop !11

55:                                               ; preds = %51, %2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local noundef i32 @main() local_unnamed_addr #1 {
  ret i32 11
}

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 2}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 2}
!3 = !{i32 1, !"MaxTLSAlign", i32 65536}
!4 = !{!"clang version 18.1.8"}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = distinct !{!11, !10}
