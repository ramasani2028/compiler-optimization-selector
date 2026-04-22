; ModuleID = 'test_cases\49_array_reversal.c'
source_filename = "test_cases\\49_array_reversal.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.33.0"

@__const.main.arr = private unnamed_addr constant [5 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5], align 16

; Function Attrs: nofree norecurse nosync nounwind memory(none) uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
  %1 = alloca [5 x i32], align 16
  call void @llvm.lifetime.start.p0(i64 20, ptr nonnull %1) #3
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(20) %1, ptr noundef nonnull align 16 dereferenceable(20) @__const.main.arr, i64 20, i1 false)
  br label %4

2:                                                ; preds = %4
  %3 = load i32, ptr %1, align 16, !tbaa !5
  call void @llvm.lifetime.end.p0(i64 20, ptr nonnull %1) #3
  ret i32 %3

4:                                                ; preds = %0, %4
  %5 = phi i64 [ 0, %0 ], [ %11, %4 ]
  %6 = getelementptr inbounds [5 x i32], ptr %1, i64 0, i64 %5
  %7 = load i32, ptr %6, align 4, !tbaa !5
  %8 = sub nuw nsw i64 4, %5
  %9 = getelementptr inbounds [5 x i32], ptr %1, i64 0, i64 %8
  %10 = load i32, ptr %9, align 4, !tbaa !5
  store i32 %10, ptr %6, align 4, !tbaa !5
  store i32 %7, ptr %9, align 4, !tbaa !5
  %11 = add nuw nsw i64 %5, 1
  %12 = icmp eq i64 %5, 0
  br i1 %12, label %4, label %2, !llvm.loop !9
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

attributes #0 = { nofree norecurse nosync nounwind memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nounwind }

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
