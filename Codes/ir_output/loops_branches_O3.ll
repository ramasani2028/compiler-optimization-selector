; ModuleID = 'loops_branches.c'
source_filename = "loops_branches.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.33.0"

; Function Attrs: nofree norecurse nosync nounwind memory(none) uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
  %1 = alloca [10000 x i32], align 16
  %2 = alloca [100 x [100 x i32]], align 16
  call void @llvm.lifetime.start.p0(i64 40000, ptr nonnull %1) #3
  br label %3

3:                                                ; preds = %3, %0
  %4 = phi i64 [ 0, %0 ], [ %13, %3 ]
  %5 = phi <4 x i32> [ <i32 0, i32 1, i32 2, i32 3>, %0 ], [ %14, %3 ]
  %6 = mul <4 x i32> %5, <i32 17, i32 17, i32 17, i32 17>
  %7 = mul <4 x i32> %5, <i32 17, i32 17, i32 17, i32 17>
  %8 = add <4 x i32> %7, <i32 68, i32 68, i32 68, i32 68>
  %9 = and <4 x i32> %6, <i32 255, i32 255, i32 255, i32 255>
  %10 = and <4 x i32> %8, <i32 255, i32 255, i32 255, i32 255>
  %11 = getelementptr inbounds [10000 x i32], ptr %1, i64 0, i64 %4
  %12 = getelementptr inbounds i32, ptr %11, i64 4
  store <4 x i32> %9, ptr %11, align 16, !tbaa !5
  store <4 x i32> %10, ptr %12, align 16, !tbaa !5
  %13 = add nuw i64 %4, 8
  %14 = add <4 x i32> %5, <i32 8, i32 8, i32 8, i32 8>
  %15 = icmp eq i64 %13, 10000
  br i1 %15, label %16, label %3, !llvm.loop !9

16:                                               ; preds = %3, %16
  %17 = phi i64 [ %52, %16 ], [ 0, %3 ]
  %18 = phi <4 x i32> [ %50, %16 ], [ zeroinitializer, %3 ]
  %19 = phi <4 x i32> [ %51, %16 ], [ zeroinitializer, %3 ]
  %20 = phi <4 x i32> [ %47, %16 ], [ zeroinitializer, %3 ]
  %21 = phi <4 x i32> [ %49, %16 ], [ zeroinitializer, %3 ]
  %22 = getelementptr inbounds [10000 x i32], ptr %1, i64 0, i64 %17
  %23 = getelementptr inbounds i32, ptr %22, i64 4
  %24 = load <4 x i32>, ptr %22, align 16, !tbaa !5
  %25 = load <4 x i32>, ptr %23, align 16, !tbaa !5
  %26 = trunc <4 x i32> %24 to <4 x i1>
  %27 = trunc <4 x i32> %25 to <4 x i1>
  %28 = srem <4 x i32> %24, <i32 3, i32 3, i32 3, i32 3>
  %29 = srem <4 x i32> %25, <i32 3, i32 3, i32 3, i32 3>
  %30 = icmp eq <4 x i32> %28, zeroinitializer
  %31 = icmp eq <4 x i32> %29, zeroinitializer
  %32 = xor <4 x i1> %30, <i1 true, i1 true, i1 true, i1 true>
  %33 = xor <4 x i1> %31, <i1 true, i1 true, i1 true, i1 true>
  %34 = select <4 x i1> %26, <4 x i1> %32, <4 x i1> zeroinitializer
  %35 = select <4 x i1> %27, <4 x i1> %33, <4 x i1> zeroinitializer
  %36 = sdiv <4 x i32> %24, <i32 2, i32 2, i32 2, i32 2>
  %37 = sdiv <4 x i32> %25, <i32 2, i32 2, i32 2, i32 2>
  %38 = and <4 x i1> %30, %26
  %39 = and <4 x i1> %31, %27
  %40 = shl nsw <4 x i32> %24, <i32 1, i32 1, i32 1, i32 1>
  %41 = shl nsw <4 x i32> %25, <i32 1, i32 1, i32 1, i32 1>
  %42 = sub <4 x i32> zeroinitializer, %24
  %43 = select <4 x i1> %38, <4 x i32> %42, <4 x i32> %40
  %44 = sub <4 x i32> zeroinitializer, %25
  %45 = select <4 x i1> %39, <4 x i32> %44, <4 x i32> %41
  %46 = select <4 x i1> %34, <4 x i32> %36, <4 x i32> %43
  %47 = add <4 x i32> %46, %20
  %48 = select <4 x i1> %35, <4 x i32> %37, <4 x i32> %45
  %49 = add <4 x i32> %48, %21
  %50 = tail call <4 x i32> @llvm.smax.v4i32(<4 x i32> %24, <4 x i32> %18)
  %51 = tail call <4 x i32> @llvm.smax.v4i32(<4 x i32> %25, <4 x i32> %19)
  %52 = add nuw i64 %17, 8
  %53 = icmp eq i64 %52, 10000
  br i1 %53, label %54, label %16, !llvm.loop !13

54:                                               ; preds = %16
  call void @llvm.lifetime.start.p0(i64 40000, ptr nonnull %2) #3
  br label %55

55:                                               ; preds = %76, %54
  %56 = phi i64 [ 0, %54 ], [ %77, %76 ]
  %57 = insertelement <4 x i64> poison, i64 %56, i64 0
  %58 = shufflevector <4 x i64> %57, <4 x i64> poison, <4 x i32> zeroinitializer
  br label %59

59:                                               ; preds = %68, %55
  %60 = phi i64 [ 0, %55 ], [ %74, %68 ]
  %61 = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %55 ], [ %75, %68 ]
  %62 = add nuw nsw <4 x i64> %61, %58
  %63 = trunc <4 x i64> %62 to <4 x i32>
  %64 = urem <4 x i32> %63, <i32 10, i32 10, i32 10, i32 10>
  %65 = getelementptr inbounds [100 x [100 x i32]], ptr %2, i64 0, i64 %56, i64 %60
  store <4 x i32> %64, ptr %65, align 16, !tbaa !5
  %66 = or disjoint i64 %60, 4
  %67 = icmp eq i64 %66, 100
  br i1 %67, label %76, label %68, !llvm.loop !14

68:                                               ; preds = %59
  %69 = add <4 x i64> %61, <i64 4, i64 4, i64 4, i64 4>
  %70 = add nuw nsw <4 x i64> %69, %58
  %71 = trunc <4 x i64> %70 to <4 x i32>
  %72 = urem <4 x i32> %71, <i32 10, i32 10, i32 10, i32 10>
  %73 = getelementptr inbounds [100 x [100 x i32]], ptr %2, i64 0, i64 %56, i64 %66
  store <4 x i32> %72, ptr %73, align 16, !tbaa !5
  %74 = add nuw nsw i64 %60, 8
  %75 = add <4 x i64> %61, <i64 8, i64 8, i64 8, i64 8>
  br label %59

76:                                               ; preds = %59
  %77 = add nuw nsw i64 %56, 1
  %78 = icmp eq i64 %77, 100
  br i1 %78, label %79, label %55, !llvm.loop !15

79:                                               ; preds = %76, %91
  %80 = phi i64 [ %92, %91 ], [ 0, %76 ]
  %81 = phi i32 [ %117, %91 ], [ 0, %76 ]
  %82 = getelementptr inbounds [100 x [100 x i32]], ptr %2, i64 0, i64 %80, i64 %80
  br label %94

83:                                               ; preds = %91
  %84 = add <4 x i32> %49, %47
  %85 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %84)
  %86 = tail call <4 x i32> @llvm.smax.v4i32(<4 x i32> %50, <4 x i32> %51)
  %87 = tail call i32 @llvm.vector.reduce.smax.v4i32(<4 x i32> %86)
  %88 = add i32 %87, %85
  %89 = add i32 %88, %117
  %90 = srem i32 %89, 256
  call void @llvm.lifetime.end.p0(i64 40000, ptr nonnull %2) #3
  call void @llvm.lifetime.end.p0(i64 40000, ptr nonnull %1) #3
  ret i32 %90

91:                                               ; preds = %115
  %92 = add nuw nsw i64 %80, 1
  %93 = icmp eq i64 %92, 100
  br i1 %93, label %83, label %79, !llvm.loop !16

94:                                               ; preds = %115, %79
  %95 = phi i64 [ 0, %79 ], [ %118, %115 ]
  %96 = phi i32 [ %81, %79 ], [ %117, %115 ]
  %97 = icmp eq i64 %80, %95
  br i1 %97, label %98, label %101

98:                                               ; preds = %94
  %99 = load i32, ptr %82, align 4, !tbaa !5
  %100 = mul nsw i32 %99, 5
  br label %104

101:                                              ; preds = %94
  %102 = getelementptr inbounds [100 x [100 x i32]], ptr %2, i64 0, i64 %80, i64 %95
  %103 = load i32, ptr %102, align 8, !tbaa !5
  br label %104

104:                                              ; preds = %98, %101
  %105 = phi i32 [ %100, %98 ], [ %103, %101 ]
  %106 = add i32 %105, %96
  %107 = or disjoint i64 %95, 1
  %108 = icmp eq i64 %80, %107
  br i1 %108, label %112, label %109

109:                                              ; preds = %104
  %110 = getelementptr inbounds [100 x [100 x i32]], ptr %2, i64 0, i64 %80, i64 %107
  %111 = load i32, ptr %110, align 4, !tbaa !5
  br label %115

112:                                              ; preds = %104
  %113 = load i32, ptr %82, align 4, !tbaa !5
  %114 = mul nsw i32 %113, 5
  br label %115

115:                                              ; preds = %112, %109
  %116 = phi i32 [ %114, %112 ], [ %111, %109 ]
  %117 = add i32 %116, %106
  %118 = add nuw nsw i64 %95, 2
  %119 = icmp eq i64 %118, 100
  br i1 %119, label %91, label %94, !llvm.loop !17
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i32> @llvm.smax.v4i32(<4 x i32>, <4 x i32>) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.smax.v4i32(<4 x i32>) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.add.v4i32(<4 x i32>) #2

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
!9 = distinct !{!9, !10, !11, !12}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{!"llvm.loop.isvectorized", i32 1}
!12 = !{!"llvm.loop.unroll.runtime.disable"}
!13 = distinct !{!13, !10, !11, !12}
!14 = distinct !{!14, !10, !11, !12}
!15 = distinct !{!15, !10}
!16 = distinct !{!16, !10}
!17 = distinct !{!17, !10}
