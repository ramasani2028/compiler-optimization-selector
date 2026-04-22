; ModuleID = 'test_cases\49_array_reversal.c'
source_filename = "test_cases\\49_array_reversal.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.33.0"

@__const.main.arr = private unnamed_addr constant [5 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5], align 16

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [5 x i32], align 16
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %2, ptr align 16 @__const.main.arr, i64 20, i1 false)
  store i32 0, ptr %4, align 4
  br label %5

5:                                                ; preds = %26, %0
  %6 = load i32, ptr %4, align 4
  %7 = icmp slt i32 %6, 2
  br i1 %7, label %8, label %29

8:                                                ; preds = %5
  %9 = load i32, ptr %4, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [5 x i32], ptr %2, i64 0, i64 %10
  %12 = load i32, ptr %11, align 4
  store i32 %12, ptr %3, align 4
  %13 = load i32, ptr %4, align 4
  %14 = sub nsw i32 4, %13
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [5 x i32], ptr %2, i64 0, i64 %15
  %17 = load i32, ptr %16, align 4
  %18 = load i32, ptr %4, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [5 x i32], ptr %2, i64 0, i64 %19
  store i32 %17, ptr %20, align 4
  %21 = load i32, ptr %3, align 4
  %22 = load i32, ptr %4, align 4
  %23 = sub nsw i32 4, %22
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [5 x i32], ptr %2, i64 0, i64 %24
  store i32 %21, ptr %25, align 4
  br label %26

26:                                               ; preds = %8
  %27 = load i32, ptr %4, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, ptr %4, align 4
  br label %5, !llvm.loop !5

29:                                               ; preds = %5
  %30 = getelementptr inbounds [5 x i32], ptr %2, i64 0, i64 0
  %31 = load i32, ptr %30, align 16
  ret i32 %31
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

attributes #0 = { noinline nounwind optnone uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 2}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 2}
!3 = !{i32 1, !"MaxTLSAlign", i32 65536}
!4 = !{!"clang version 18.1.8"}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.mustprogress"}
