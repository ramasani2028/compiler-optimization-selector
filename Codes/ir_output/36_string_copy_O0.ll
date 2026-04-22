; ModuleID = 'test_cases\36_string_copy.c'
source_filename = "test_cases\\36_string_copy.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.33.0"

@__const.main.source = private unnamed_addr constant [10 x i8] c"Copy This\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [20 x i8], align 16
  %3 = alloca [10 x i8], align 1
  %4 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %3, ptr align 1 @__const.main.source, i64 10, i1 false)
  store i32 0, ptr %4, align 4
  br label %5

5:                                                ; preds = %12, %0
  %6 = load i32, ptr %4, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [10 x i8], ptr %3, i64 0, i64 %7
  %9 = load i8, ptr %8, align 1
  %10 = sext i8 %9 to i32
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %22

12:                                               ; preds = %5
  %13 = load i32, ptr %4, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [10 x i8], ptr %3, i64 0, i64 %14
  %16 = load i8, ptr %15, align 1
  %17 = load i32, ptr %4, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [20 x i8], ptr %2, i64 0, i64 %18
  store i8 %16, ptr %19, align 1
  %20 = load i32, ptr %4, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, ptr %4, align 4
  br label %5, !llvm.loop !5

22:                                               ; preds = %5
  %23 = load i32, ptr %4, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [20 x i8], ptr %2, i64 0, i64 %24
  store i8 0, ptr %25, align 1
  %26 = getelementptr inbounds [20 x i8], ptr %2, i64 0, i64 0
  %27 = load i8, ptr %26, align 16
  %28 = sext i8 %27 to i32
  ret i32 %28
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
