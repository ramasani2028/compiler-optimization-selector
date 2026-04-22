; ModuleID = 'test_cases\26_bubble_sort.c'
source_filename = "test_cases\\26_bubble_sort.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.33.0"

@__const.main.arr = private unnamed_addr constant [7 x i32] [i32 64, i32 34, i32 25, i32 12, i32 22, i32 11, i32 90], align 16

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define dso_local void @bubbleSort(ptr nocapture noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = add i32 %1, -1
  %4 = icmp sgt i32 %1, 1
  br i1 %4, label %5, label %27

5:                                                ; preds = %2, %23
  %6 = phi i32 [ %25, %23 ], [ %3, %2 ]
  %7 = phi i32 [ %24, %23 ], [ 0, %2 ]
  %8 = sub nsw i32 %7, %1
  %9 = icmp slt i32 %8, -1
  br i1 %9, label %10, label %23

10:                                               ; preds = %5
  %11 = zext i32 %6 to i64
  br label %12

12:                                               ; preds = %10, %21
  %13 = phi i64 [ 0, %10 ], [ %16, %21 ]
  %14 = getelementptr inbounds i32, ptr %0, i64 %13
  %15 = load i32, ptr %14, align 4, !tbaa !5
  %16 = add nuw nsw i64 %13, 1
  %17 = getelementptr inbounds i32, ptr %0, i64 %16
  %18 = load i32, ptr %17, align 4, !tbaa !5
  %19 = icmp sgt i32 %15, %18
  br i1 %19, label %20, label %21

20:                                               ; preds = %12
  store i32 %18, ptr %14, align 4, !tbaa !5
  store i32 %15, ptr %17, align 4, !tbaa !5
  br label %21

21:                                               ; preds = %12, %20
  %22 = icmp eq i64 %16, %11
  br i1 %22, label %23, label %12, !llvm.loop !9

23:                                               ; preds = %21, %5
  %24 = add nuw nsw i32 %7, 1
  %25 = add i32 %6, -1
  %26 = icmp eq i32 %24, %3
  br i1 %26, label %27, label %5, !llvm.loop !12

27:                                               ; preds = %23, %2
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nofree norecurse nosync nounwind memory(none) uwtable
define dso_local i32 @main() local_unnamed_addr #2 {
  %1 = alloca [7 x i32], align 16
  call void @llvm.lifetime.start.p0(i64 28, ptr nonnull %1) #4
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(28) %1, ptr noundef nonnull align 16 dereferenceable(28) @__const.main.arr, i64 28, i1 false)
  br label %2

2:                                                ; preds = %16, %0
  %3 = phi i64 [ %18, %16 ], [ 6, %0 ]
  %4 = phi i32 [ %17, %16 ], [ 0, %0 ]
  br label %5

5:                                                ; preds = %14, %2
  %6 = phi i64 [ 0, %2 ], [ %9, %14 ]
  %7 = getelementptr inbounds i32, ptr %1, i64 %6
  %8 = load i32, ptr %7, align 4, !tbaa !5
  %9 = add nuw nsw i64 %6, 1
  %10 = getelementptr inbounds i32, ptr %1, i64 %9
  %11 = load i32, ptr %10, align 4, !tbaa !5
  %12 = icmp sgt i32 %8, %11
  br i1 %12, label %13, label %14

13:                                               ; preds = %5
  store i32 %11, ptr %7, align 4, !tbaa !5
  store i32 %8, ptr %10, align 4, !tbaa !5
  br label %14

14:                                               ; preds = %13, %5
  %15 = icmp eq i64 %9, %3
  br i1 %15, label %16, label %5, !llvm.loop !9

16:                                               ; preds = %14
  %17 = add nuw nsw i32 %4, 1
  %18 = add nsw i64 %3, -1
  %19 = icmp eq i32 %17, 6
  br i1 %19, label %20, label %2, !llvm.loop !12

20:                                               ; preds = %16
  %21 = load i32, ptr %1, align 16, !tbaa !5
  call void @llvm.lifetime.end.p0(i64 28, ptr nonnull %1) #4
  ret i32 %21
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nofree norecurse nosync nounwind memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { nounwind }

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
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !10, !11}
