; ModuleID = 'test_cases\30_matrix_add.c'
source_filename = "test_cases\\30_matrix_add.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.33.0"

@__const.main.a = private unnamed_addr constant [2 x [2 x i32]] [[2 x i32] [i32 1, i32 2], [2 x i32] [i32 3, i32 4]], align 16
@__const.main.b = private unnamed_addr constant [2 x [2 x i32]] [[2 x i32] [i32 5, i32 6], [2 x i32] [i32 7, i32 8]], align 16

; Function Attrs: nofree norecurse nosync nounwind memory(none) uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
  %1 = alloca [2 x [2 x i32]], align 16
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %1) #2
  br label %2

2:                                                ; preds = %0, %7
  %3 = phi i64 [ 0, %0 ], [ %8, %7 ]
  br label %10

4:                                                ; preds = %7
  %5 = getelementptr inbounds [2 x [2 x i32]], ptr %1, i64 0, i64 1, i64 1
  %6 = load i32, ptr %5, align 4, !tbaa !5
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %1) #2
  ret i32 %6

7:                                                ; preds = %10
  %8 = add nuw nsw i64 %3, 1
  %9 = icmp eq i64 %3, 0
  br i1 %9, label %2, label %4, !llvm.loop !9

10:                                               ; preds = %2, %10
  %11 = phi i64 [ 0, %2 ], [ %18, %10 ]
  %12 = getelementptr inbounds [2 x [2 x i32]], ptr @__const.main.a, i64 0, i64 %3, i64 %11
  %13 = load i32, ptr %12, align 4, !tbaa !5
  %14 = getelementptr inbounds [2 x [2 x i32]], ptr @__const.main.b, i64 0, i64 %3, i64 %11
  %15 = load i32, ptr %14, align 4, !tbaa !5
  %16 = add nsw i32 %15, %13
  %17 = getelementptr inbounds [2 x [2 x i32]], ptr %1, i64 0, i64 %3, i64 %11
  store i32 %16, ptr %17, align 4, !tbaa !5
  %18 = add nuw nsw i64 %11, 1
  %19 = icmp eq i64 %11, 0
  br i1 %19, label %10, label %7, !llvm.loop !12
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

attributes #0 = { nofree norecurse nosync nounwind memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nounwind }

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
