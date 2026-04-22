; ModuleID = 'test_cases\security_checks.c'
source_filename = "test_cases\\security_checks.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.33.0"

@assert_failed = dso_local global i32 0, align 4
@__const.main.source_string = private unnamed_addr constant [60 x i8] c"This is a test string to check safe copying and assertions.\00", align 16

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @safe_copy(ptr noundef %0, ptr noundef %1, i64 noundef %2) #0 {
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  store i64 %2, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %0, ptr %6, align 8
  %8 = load ptr, ptr %6, align 8
  %9 = icmp eq ptr %8, null
  br i1 %9, label %13, label %10

10:                                               ; preds = %3
  %11 = load ptr, ptr %5, align 8
  %12 = icmp eq ptr %11, null
  br i1 %12, label %13, label %14

13:                                               ; preds = %10, %3
  store i32 1, ptr @assert_failed, align 4
  br label %42

14:                                               ; preds = %10
  store i64 0, ptr %7, align 8
  br label %15

15:                                               ; preds = %39, %14
  %16 = load i64, ptr %7, align 8
  %17 = load i64, ptr %4, align 8
  %18 = icmp ult i64 %16, %17
  br i1 %18, label %19, label %42

19:                                               ; preds = %15
  %20 = load i64, ptr %7, align 8
  %21 = icmp uge i64 %20, 256
  br i1 %21, label %22, label %23

22:                                               ; preds = %19
  store i32 1, ptr @assert_failed, align 4
  br label %42

23:                                               ; preds = %19
  %24 = load ptr, ptr %5, align 8
  %25 = load i64, ptr %7, align 8
  %26 = getelementptr inbounds i8, ptr %24, i64 %25
  %27 = load i8, ptr %26, align 1
  %28 = load ptr, ptr %6, align 8
  %29 = load i64, ptr %7, align 8
  %30 = getelementptr inbounds i8, ptr %28, i64 %29
  store i8 %27, ptr %30, align 1
  %31 = load ptr, ptr %5, align 8
  %32 = load i64, ptr %7, align 8
  %33 = getelementptr inbounds i8, ptr %31, i64 %32
  %34 = load i8, ptr %33, align 1
  %35 = sext i8 %34 to i32
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %37, label %38

37:                                               ; preds = %23
  br label %42

38:                                               ; preds = %23
  br label %39

39:                                               ; preds = %38
  %40 = load i64, ptr %7, align 8
  %41 = add i64 %40, 1
  store i64 %41, ptr %7, align 8
  br label %15, !llvm.loop !5

42:                                               ; preds = %13, %37, %22, %15
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @calculate_safe_index(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %1, ptr %4, align 4
  store i32 %0, ptr %5, align 4
  %7 = load i32, ptr %5, align 4
  %8 = load i32, ptr %4, align 4
  %9 = add nsw i32 %7, %8
  store i32 %9, ptr %6, align 4
  %10 = load i32, ptr %6, align 4
  %11 = icmp slt i32 %10, 0
  br i1 %11, label %15, label %12

12:                                               ; preds = %2
  %13 = load i32, ptr %6, align 4
  %14 = icmp sge i32 %13, 256
  br i1 %14, label %15, label %16

15:                                               ; preds = %12, %2
  store i32 1, ptr @assert_failed, align 4
  store i32 0, ptr %3, align 4
  br label %18

16:                                               ; preds = %12
  %17 = load i32, ptr %6, align 4
  store i32 %17, ptr %3, align 4
  br label %18

18:                                               ; preds = %16, %15
  %19 = load i32, ptr %3, align 4
  ret i32 %19
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [256 x i8], align 16
  %3 = alloca [60 x i8], align 16
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %3, ptr align 16 @__const.main.source_string, i64 60, i1 false)
  %7 = getelementptr inbounds [60 x i8], ptr %3, i64 0, i64 0
  %8 = getelementptr inbounds [256 x i8], ptr %2, i64 0, i64 0
  call void @safe_copy(ptr noundef %8, ptr noundef %7, i64 noundef 60)
  %9 = call i32 @calculate_safe_index(i32 noundef 100, i32 noundef 50)
  store i32 %9, ptr %4, align 4
  %10 = call i32 @calculate_safe_index(i32 noundef 200, i32 noundef 100)
  store i32 %10, ptr %5, align 4
  store i32 5, ptr %6, align 4
  %11 = load i32, ptr %6, align 4
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %14, label %13

13:                                               ; preds = %0
  store i32 1, ptr @assert_failed, align 4
  br label %14

14:                                               ; preds = %13, %0
  %15 = load i32, ptr @assert_failed, align 4
  ret i32 %15
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
