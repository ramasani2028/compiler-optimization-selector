; ModuleID = 'test_cases\memory_ops.c'
source_filename = "test_cases\\memory_ops.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.33.0"

%struct.Node = type { i32, double, ptr }

@static_array = dso_local global [50000 x i32] zeroinitializer, align 16
@static_nodes = dso_local global [1000 x %struct.Node] zeroinitializer, align 16

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @process_array(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store i32 %1, ptr %3, align 4
  store ptr %0, ptr %4, align 8
  store i32 0, ptr %5, align 4
  br label %6

6:                                                ; preds = %22, %2
  %7 = load i32, ptr %5, align 4
  %8 = load i32, ptr %3, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %25

10:                                               ; preds = %6
  %11 = load ptr, ptr %4, align 8
  %12 = load i32, ptr %5, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds i32, ptr %11, i64 %13
  %15 = load i32, ptr %14, align 4
  %16 = mul nsw i32 %15, 3
  %17 = add nsw i32 %16, 1
  %18 = load ptr, ptr %4, align 8
  %19 = load i32, ptr %5, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i32, ptr %18, i64 %20
  store i32 %17, ptr %21, align 4
  br label %22

22:                                               ; preds = %10
  %23 = load i32, ptr %5, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr %5, align 4
  br label %6, !llvm.loop !5

25:                                               ; preds = %6
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @process_nodes(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store i32 %1, ptr %3, align 4
  store ptr %0, ptr %4, align 8
  store i32 0, ptr %5, align 4
  br label %6

6:                                                ; preds = %35, %2
  %7 = load i32, ptr %5, align 4
  %8 = load i32, ptr %3, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %38

10:                                               ; preds = %6
  %11 = load ptr, ptr %4, align 8
  %12 = load i32, ptr %5, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds %struct.Node, ptr %11, i64 %13
  %15 = getelementptr inbounds %struct.Node, ptr %14, i32 0, i32 1
  %16 = load double, ptr %15, align 8
  %17 = fmul double %16, 1.500000e+00
  store double %17, ptr %15, align 8
  %18 = load ptr, ptr %4, align 8
  %19 = load i32, ptr %5, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds %struct.Node, ptr %18, i64 %20
  %22 = getelementptr inbounds %struct.Node, ptr %21, i32 0, i32 2
  %23 = load ptr, ptr %22, align 8
  %24 = icmp ne ptr %23, null
  br i1 %24, label %25, label %34

25:                                               ; preds = %10
  %26 = load ptr, ptr %4, align 8
  %27 = load i32, ptr %5, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds %struct.Node, ptr %26, i64 %28
  %30 = getelementptr inbounds %struct.Node, ptr %29, i32 0, i32 2
  %31 = load ptr, ptr %30, align 8
  %32 = load i32, ptr %31, align 4
  %33 = add nsw i32 %32, 10
  store i32 %33, ptr %31, align 4
  br label %34

34:                                               ; preds = %25, %10
  br label %35

35:                                               ; preds = %34
  %36 = load i32, ptr %5, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, ptr %5, align 4
  br label %6, !llvm.loop !7

38:                                               ; preds = %6
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i64, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca double, align 8
  %7 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 0, ptr %2, align 4
  br label %8

8:                                                ; preds = %16, %0
  %9 = load i32, ptr %2, align 4
  %10 = icmp slt i32 %9, 50000
  br i1 %10, label %11, label %19

11:                                               ; preds = %8
  %12 = load i32, ptr %2, align 4
  %13 = load i32, ptr %2, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [50000 x i32], ptr @static_array, i64 0, i64 %14
  store i32 %12, ptr %15, align 4
  br label %16

16:                                               ; preds = %11
  %17 = load i32, ptr %2, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, ptr %2, align 4
  br label %8, !llvm.loop !8

19:                                               ; preds = %8
  call void @process_array(ptr noundef @static_array, i32 noundef 50000)
  store i64 0, ptr %3, align 8
  store i32 0, ptr %4, align 4
  br label %20

20:                                               ; preds = %31, %19
  %21 = load i32, ptr %4, align 4
  %22 = icmp slt i32 %21, 50000
  br i1 %22, label %23, label %34

23:                                               ; preds = %20
  %24 = load i32, ptr %4, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [50000 x i32], ptr @static_array, i64 0, i64 %25
  %27 = load i32, ptr %26, align 4
  %28 = sext i32 %27 to i64
  %29 = load i64, ptr %3, align 8
  %30 = add nsw i64 %29, %28
  store i64 %30, ptr %3, align 8
  br label %31

31:                                               ; preds = %23
  %32 = load i32, ptr %4, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, ptr %4, align 4
  br label %20, !llvm.loop !9

34:                                               ; preds = %20
  store i32 0, ptr %5, align 4
  br label %35

35:                                               ; preds = %58, %34
  %36 = load i32, ptr %5, align 4
  %37 = icmp slt i32 %36, 1000
  br i1 %37, label %38, label %61

38:                                               ; preds = %35
  %39 = load i32, ptr %5, align 4
  %40 = load i32, ptr %5, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [1000 x %struct.Node], ptr @static_nodes, i64 0, i64 %41
  %43 = getelementptr inbounds %struct.Node, ptr %42, i32 0, i32 0
  store i32 %39, ptr %43, align 8
  %44 = load i32, ptr %5, align 4
  %45 = sitofp i32 %44 to double
  %46 = fmul double %45, 1.000000e-01
  %47 = load i32, ptr %5, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [1000 x %struct.Node], ptr @static_nodes, i64 0, i64 %48
  %50 = getelementptr inbounds %struct.Node, ptr %49, i32 0, i32 1
  store double %46, ptr %50, align 8
  %51 = load i32, ptr %5, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [50000 x i32], ptr @static_array, i64 0, i64 %52
  %54 = load i32, ptr %5, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [1000 x %struct.Node], ptr @static_nodes, i64 0, i64 %55
  %57 = getelementptr inbounds %struct.Node, ptr %56, i32 0, i32 2
  store ptr %53, ptr %57, align 8
  br label %58

58:                                               ; preds = %38
  %59 = load i32, ptr %5, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, ptr %5, align 4
  br label %35, !llvm.loop !10

61:                                               ; preds = %35
  call void @process_nodes(ptr noundef @static_nodes, i32 noundef 1000)
  store double 0.000000e+00, ptr %6, align 8
  store i32 0, ptr %7, align 4
  br label %62

62:                                               ; preds = %73, %61
  %63 = load i32, ptr %7, align 4
  %64 = icmp slt i32 %63, 1000
  br i1 %64, label %65, label %76

65:                                               ; preds = %62
  %66 = load i32, ptr %7, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [1000 x %struct.Node], ptr @static_nodes, i64 0, i64 %67
  %69 = getelementptr inbounds %struct.Node, ptr %68, i32 0, i32 1
  %70 = load double, ptr %69, align 8
  %71 = load double, ptr %6, align 8
  %72 = fadd double %71, %70
  store double %72, ptr %6, align 8
  br label %73

73:                                               ; preds = %65
  %74 = load i32, ptr %7, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, ptr %7, align 4
  br label %62, !llvm.loop !11

76:                                               ; preds = %62
  %77 = load i64, ptr %3, align 8
  %78 = trunc i64 %77 to i32
  %79 = srem i32 %78, 256
  %80 = load double, ptr %6, align 8
  %81 = fptosi double %80 to i32
  %82 = srem i32 %81, 256
  %83 = add nsw i32 %79, %82
  ret i32 %83
}

attributes #0 = { noinline nounwind optnone uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 2}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 2}
!3 = !{i32 1, !"MaxTLSAlign", i32 65536}
!4 = !{!"clang version 18.1.8"}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.mustprogress"}
!7 = distinct !{!7, !6}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !6}
!10 = distinct !{!10, !6}
!11 = distinct !{!11, !6}
