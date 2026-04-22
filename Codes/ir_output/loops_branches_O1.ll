; ModuleID = 'test_cases\loops_branches.c'
source_filename = "test_cases\\loops_branches.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.33.0"

; Function Attrs: nofree norecurse nosync nounwind memory(none) uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
  %1 = alloca [10000 x i32], align 16
  %2 = alloca [100 x [100 x i32]], align 16
  call void @llvm.lifetime.start.p0(i64 40000, ptr nonnull %1) #3
  br label %3

3:                                                ; preds = %0, %3
  %4 = phi i64 [ 0, %0 ], [ %9, %3 ]
  %5 = trunc i64 %4 to i32
  %6 = mul i32 %5, 17
  %7 = and i32 %6, 255
  %8 = getelementptr inbounds [10000 x i32], ptr %1, i64 0, i64 %4
  store i32 %7, ptr %8, align 4, !tbaa !5
  %9 = add nuw nsw i64 %4, 1
  %10 = icmp eq i64 %9, 10000
  br i1 %10, label %12, label %3, !llvm.loop !9

11:                                               ; preds = %34
  call void @llvm.lifetime.start.p0(i64 40000, ptr nonnull %2) #3
  br label %39

12:                                               ; preds = %3, %34
  %13 = phi i64 [ %37, %34 ], [ 0, %3 ]
  %14 = phi i32 [ %36, %34 ], [ 0, %3 ]
  %15 = phi i64 [ %35, %34 ], [ 0, %3 ]
  %16 = getelementptr inbounds [10000 x i32], ptr %1, i64 0, i64 %13
  %17 = load i32, ptr %16, align 4, !tbaa !5
  %18 = and i32 %17, 1
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %24

20:                                               ; preds = %12
  %21 = shl nsw i32 %17, 1
  %22 = zext i32 %21 to i64
  %23 = add i64 %15, %22
  br label %34

24:                                               ; preds = %12
  %25 = srem i32 %17, 3
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %30

27:                                               ; preds = %24
  %28 = zext i32 %17 to i64
  %29 = sub i64 %15, %28
  br label %34

30:                                               ; preds = %24
  %31 = sdiv i32 %17, 2
  %32 = zext i32 %31 to i64
  %33 = add i64 %15, %32
  br label %34

34:                                               ; preds = %27, %30, %20
  %35 = phi i64 [ %23, %20 ], [ %29, %27 ], [ %33, %30 ]
  %36 = tail call i32 @llvm.smax.i32(i32 %17, i32 %14)
  %37 = add nuw nsw i64 %13, 1
  %38 = icmp eq i64 %37, 10000
  br i1 %38, label %11, label %12, !llvm.loop !12

39:                                               ; preds = %11, %41
  %40 = phi i64 [ 0, %11 ], [ %42, %41 ]
  br label %44

41:                                               ; preds = %44
  %42 = add nuw nsw i64 %40, 1
  %43 = icmp eq i64 %42, 100
  br i1 %43, label %52, label %39, !llvm.loop !13

44:                                               ; preds = %39, %44
  %45 = phi i64 [ 0, %39 ], [ %50, %44 ]
  %46 = add nuw nsw i64 %45, %40
  %47 = trunc i64 %46 to i32
  %48 = urem i32 %47, 10
  %49 = getelementptr inbounds [100 x [100 x i32]], ptr %2, i64 0, i64 %40, i64 %45
  store i32 %48, ptr %49, align 4, !tbaa !5
  %50 = add nuw nsw i64 %45, 1
  %51 = icmp eq i64 %50, 100
  br i1 %51, label %41, label %44, !llvm.loop !14

52:                                               ; preds = %41, %61
  %53 = phi i64 [ %62, %61 ], [ 0, %41 ]
  %54 = phi i64 [ %73, %61 ], [ 0, %41 ]
  br label %64

55:                                               ; preds = %61
  %56 = zext nneg i32 %36 to i64
  %57 = add i64 %35, %56
  %58 = add i64 %57, %73
  %59 = trunc i64 %58 to i32
  %60 = srem i32 %59, 256
  call void @llvm.lifetime.end.p0(i64 40000, ptr nonnull %2) #3
  call void @llvm.lifetime.end.p0(i64 40000, ptr nonnull %1) #3
  ret i32 %60

61:                                               ; preds = %64
  %62 = add nuw nsw i64 %53, 1
  %63 = icmp eq i64 %62, 100
  br i1 %63, label %55, label %52, !llvm.loop !15

64:                                               ; preds = %52, %64
  %65 = phi i64 [ 0, %52 ], [ %74, %64 ]
  %66 = phi i64 [ %54, %52 ], [ %73, %64 ]
  %67 = icmp eq i64 %53, %65
  %68 = getelementptr inbounds [100 x [100 x i32]], ptr %2, i64 0, i64 %53, i64 %65
  %69 = load i32, ptr %68, align 4, !tbaa !5
  %70 = mul nsw i32 %69, 5
  %71 = select i1 %67, i32 %70, i32 %69
  %72 = zext i32 %71 to i64
  %73 = add i64 %66, %72
  %74 = add nuw nsw i64 %65, 1
  %75 = icmp eq i64 %74, 100
  br i1 %75, label %61, label %64, !llvm.loop !16
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #2

attributes #0 = { nofree norecurse nosync nounwind memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
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
!12 = distinct !{!12, !10, !11}
!13 = distinct !{!13, !10, !11}
!14 = distinct !{!14, !10, !11}
!15 = distinct !{!15, !10, !11}
!16 = distinct !{!16, !10, !11}
