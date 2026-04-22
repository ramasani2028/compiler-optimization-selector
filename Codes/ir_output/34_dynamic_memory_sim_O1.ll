; ModuleID = 'test_cases\34_dynamic_memory_sim.c'
source_filename = "test_cases\\34_dynamic_memory_sim.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.33.0"

; Function Attrs: nofree norecurse nosync nounwind memory(none) uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
  %1 = alloca [10 x i32], align 16
  call void @llvm.lifetime.start.p0(i64 40, ptr nonnull %1) #2
  br label %2

2:                                                ; preds = %0, %2
  %3 = phi i64 [ 0, %0 ], [ %7, %2 ]
  %4 = mul nuw nsw i64 %3, %3
  %5 = getelementptr inbounds i32, ptr %1, i64 %3
  %6 = trunc i64 %4 to i32
  store i32 %6, ptr %5, align 4, !tbaa !5
  %7 = add nuw nsw i64 %3, 1
  %8 = icmp eq i64 %7, 10
  br i1 %8, label %10, label %2, !llvm.loop !9

9:                                                ; preds = %10
  call void @llvm.lifetime.end.p0(i64 40, ptr nonnull %1) #2
  ret i32 %15

10:                                               ; preds = %2, %10
  %11 = phi i64 [ %16, %10 ], [ 0, %2 ]
  %12 = phi i32 [ %15, %10 ], [ 0, %2 ]
  %13 = getelementptr inbounds i32, ptr %1, i64 %11
  %14 = load i32, ptr %13, align 4, !tbaa !5
  %15 = add nsw i32 %14, %12
  %16 = add nuw nsw i64 %11, 1
  %17 = icmp eq i64 %16, 10
  br i1 %17, label %9, label %10, !llvm.loop !12
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
