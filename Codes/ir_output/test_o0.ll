; ModuleID = 'Codes\test_cases\ai_test_security_checks.c'
source_filename = "Codes\\test_cases\\ai_test_security_checks.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.44.35224"

$sprintf = comdat any

$vsprintf = comdat any

$_snprintf = comdat any

$_vsnprintf = comdat any

$printf = comdat any

$_vsprintf_l = comdat any

$_vsnprintf_l = comdat any

$__local_stdio_printf_options = comdat any

$_vfprintf_l = comdat any

$"??_C@_0BE@FNAOONHN@Optimization?5Dummy?6?$AA@" = comdat any

$"??_C@_1FG@JDKCDDEF@?$AAC?$AAo?$AAd?$AAe?$AAs?$AA?2?$AAt?$AAe?$AAs?$AAt?$AA_?$AAc?$AAa?$AAs?$AAe?$AAs?$AA?2?$AAa?$AAi?$AA_?$AAt?$AAe?$AAs?$AAt?$AA_?$AAs?$AAe?$AAc?$AAu?$AAr?$AAi?$AAt@" = comdat any

$"??_C@_1JA@BGHELBJM@?$AA?$CB?$AA?$CC?$AAC?$AAR?$AAI?$AAT?$AAI?$AAC?$AAA?$AAL?$AA?5?$AAS?$AAE?$AAC?$AAU?$AAR?$AAI?$AAT?$AAY?$AA?5?$AAC?$AAH?$AAE?$AAC?$AAK?$AA?3?$AA?5?$AAI?$AAn?$AAt?$AAe?$AAg@" = comdat any

$"??_C@_0CI@IKEPAOFP@Bounds?5Violation?5Mitigation?5Trig@" = comdat any

@"??_C@_0BE@FNAOONHN@Optimization?5Dummy?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [20 x i8] c"Optimization Dummy\0A\00", comdat, align 1
@"??_C@_1FG@JDKCDDEF@?$AAC?$AAo?$AAd?$AAe?$AAs?$AA?2?$AAt?$AAe?$AAs?$AAt?$AA_?$AAc?$AAa?$AAs?$AAe?$AAs?$AA?2?$AAa?$AAi?$AA_?$AAt?$AAe?$AAs?$AAt?$AA_?$AAs?$AAe?$AAc?$AAu?$AAr?$AAi?$AAt@" = linkonce_odr dso_local unnamed_addr constant [43 x i16] [i16 67, i16 111, i16 100, i16 101, i16 115, i16 92, i16 116, i16 101, i16 115, i16 116, i16 95, i16 99, i16 97, i16 115, i16 101, i16 115, i16 92, i16 97, i16 105, i16 95, i16 116, i16 101, i16 115, i16 116, i16 95, i16 115, i16 101, i16 99, i16 117, i16 114, i16 105, i16 116, i16 121, i16 95, i16 99, i16 104, i16 101, i16 99, i16 107, i16 115, i16 46, i16 99, i16 0], comdat, align 2
@"??_C@_1JA@BGHELBJM@?$AA?$CB?$AA?$CC?$AAC?$AAR?$AAI?$AAT?$AAI?$AAC?$AAA?$AAL?$AA?5?$AAS?$AAE?$AAC?$AAU?$AAR?$AAI?$AAT?$AAY?$AA?5?$AAC?$AAH?$AAE?$AAC?$AAK?$AA?3?$AA?5?$AAI?$AAn?$AAt?$AAe?$AAg@" = linkonce_odr dso_local unnamed_addr constant [72 x i16] [i16 33, i16 34, i16 67, i16 82, i16 73, i16 84, i16 73, i16 67, i16 65, i16 76, i16 32, i16 83, i16 69, i16 67, i16 85, i16 82, i16 73, i16 84, i16 89, i16 32, i16 67, i16 72, i16 69, i16 67, i16 75, i16 58, i16 32, i16 73, i16 110, i16 116, i16 101, i16 103, i16 101, i16 114, i16 32, i16 111, i16 118, i16 101, i16 114, i16 102, i16 108, i16 111, i16 119, i16 32, i16 100, i16 101, i16 116, i16 101, i16 99, i16 116, i16 101, i16 100, i16 32, i16 100, i16 117, i16 114, i16 105, i16 110, i16 103, i16 32, i16 115, i16 117, i16 109, i16 109, i16 97, i16 116, i16 105, i16 111, i16 110, i16 33, i16 34, i16 0], comdat, align 2
@"??_C@_0CI@IKEPAOFP@Bounds?5Violation?5Mitigation?5Trig@" = linkonce_odr dso_local unnamed_addr constant [40 x i8] c"Bounds Violation Mitigation Triggered!\0A\00", comdat, align 1
@__local_stdio_printf_options._OptionsStorage = internal global i64 0, align 8

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i32 @sprintf(ptr noundef %0, ptr noundef %1, ...) #0 comdat {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  store ptr %1, ptr %3, align 8
  store ptr %0, ptr %4, align 8
  call void @llvm.va_start.p0(ptr %6)
  %7 = load ptr, ptr %6, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = load ptr, ptr %4, align 8
  %10 = call i32 @_vsprintf_l(ptr noundef %9, ptr noundef %8, ptr noundef null, ptr noundef %7)
  store i32 %10, ptr %5, align 4
  call void @llvm.va_end.p0(ptr %6)
  %11 = load i32, ptr %5, align 4
  ret i32 %11
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i32 @vsprintf(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 comdat {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %2, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %0, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load ptr, ptr %6, align 8
  %10 = call i32 @_vsnprintf_l(ptr noundef %9, i64 noundef -1, ptr noundef %8, ptr noundef null, ptr noundef %7)
  ret i32 %10
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i32 @_snprintf(ptr noundef %0, i64 noundef %1, ptr noundef %2, ...) #0 comdat {
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  store ptr %2, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  store ptr %0, ptr %6, align 8
  call void @llvm.va_start.p0(ptr %8)
  %9 = load ptr, ptr %8, align 8
  %10 = load ptr, ptr %4, align 8
  %11 = load i64, ptr %5, align 8
  %12 = load ptr, ptr %6, align 8
  %13 = call i32 @_vsnprintf(ptr noundef %12, i64 noundef %11, ptr noundef %10, ptr noundef %9)
  store i32 %13, ptr %7, align 4
  call void @llvm.va_end.p0(ptr %8)
  %14 = load i32, ptr %7, align 4
  ret i32 %14
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i32 @_vsnprintf(ptr noundef %0, i64 noundef %1, ptr noundef %2, ptr noundef %3) #0 comdat {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  store ptr %3, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  store i64 %1, ptr %7, align 8
  store ptr %0, ptr %8, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = load ptr, ptr %6, align 8
  %11 = load i64, ptr %7, align 8
  %12 = load ptr, ptr %8, align 8
  %13 = call i32 @_vsnprintf_l(ptr noundef %12, i64 noundef %11, ptr noundef %10, ptr noundef null, ptr noundef %9)
  ret i32 %13
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @external_sink(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = icmp eq i32 %3, -1
  br i1 %4, label %5, label %7

5:                                                ; preds = %1
  %6 = call i32 (ptr, ...) @printf(ptr noundef @"??_C@_0BE@FNAOONHN@Optimization?5Dummy?6?$AA@")
  br label %7

7:                                                ; preds = %5, %1
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i32 @printf(ptr noundef %0, ...) #0 comdat {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  call void @llvm.va_start.p0(ptr %4)
  %5 = load ptr, ptr %4, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = call ptr @__acrt_iob_func(i32 noundef 1)
  %8 = call i32 @_vfprintf_l(ptr noundef %7, ptr noundef %6, ptr noundef null, ptr noundef %5)
  store i32 %8, ptr %3, align 4
  call void @llvm.va_end.p0(ptr %4)
  %9 = load i32, ptr %3, align 4
  ret i32 %9
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca [2048 x i32], align 16
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store ptr %1, ptr %4, align 8
  store i32 %0, ptr %5, align 4
  store i32 0, ptr %6, align 4
  store i32 0, ptr %8, align 4
  br label %10

10:                                               ; preds = %26, %2
  %11 = load i32, ptr %8, align 4
  %12 = icmp slt i32 %11, 2048
  br i1 %12, label %13, label %29

13:                                               ; preds = %10
  %14 = load i32, ptr %8, align 4
  %15 = mul nsw i32 %14, 13
  %16 = xor i32 %15, 43981
  %17 = load i32, ptr %8, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [2048 x i32], ptr %7, i64 0, i64 %18
  store i32 %16, ptr %19, align 4
  %20 = load i32, ptr %8, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [2048 x i32], ptr %7, i64 0, i64 %21
  %23 = load i32, ptr %22, align 4
  %24 = load i32, ptr %6, align 4
  %25 = add nsw i32 %24, %23
  store i32 %25, ptr %6, align 4
  br label %26

26:                                               ; preds = %13
  %27 = load i32, ptr %8, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, ptr %8, align 4
  br label %10, !llvm.loop !8

29:                                               ; preds = %10
  %30 = load i32, ptr %6, align 4
  %31 = icmp slt i32 %30, 0
  br i1 %31, label %32, label %33

32:                                               ; preds = %29
  call void @_wassert(ptr noundef @"??_C@_1JA@BGHELBJM@?$AA?$CB?$AA?$CC?$AAC?$AAR?$AAI?$AAT?$AAI?$AAC?$AAA?$AAL?$AA?5?$AAS?$AAE?$AAC?$AAU?$AAR?$AAI?$AAT?$AAY?$AA?5?$AAC?$AAH?$AAE?$AAC?$AAK?$AA?3?$AA?5?$AAI?$AAn?$AAt?$AAe?$AAg@", ptr noundef @"??_C@_1FG@JDKCDDEF@?$AAC?$AAo?$AAd?$AAe?$AAs?$AA?2?$AAt?$AAe?$AAs?$AAt?$AA_?$AAc?$AAa?$AAs?$AAe?$AAs?$AA?2?$AAa?$AAi?$AA_?$AAt?$AAe?$AAs?$AAt?$AA_?$AAs?$AAe?$AAc?$AAu?$AAr?$AAi?$AAt@", i32 noundef 37)
  br label %33

33:                                               ; preds = %32, %29
  %34 = load i32, ptr %5, align 4
  %35 = add nsw i32 %34, 2000
  store i32 %35, ptr %9, align 4
  %36 = load i32, ptr %9, align 4
  %37 = icmp sgt i32 %36, 5000
  br i1 %37, label %38, label %41

38:                                               ; preds = %33
  br label %39

39:                                               ; preds = %38
  %40 = call i32 (ptr, ...) @printf(ptr noundef @"??_C@_0CI@IKEPAOFP@Bounds?5Violation?5Mitigation?5Trig@")
  call void @abort() #4
  unreachable

41:                                               ; preds = %33
  %42 = load i32, ptr %6, align 4
  call void @external_sink(i32 noundef %42)
  ret i32 0
}

declare dso_local void @_wassert(ptr noundef, ptr noundef, i32 noundef) #1

; Function Attrs: noreturn nounwind
declare dso_local void @abort() #2

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.va_start.p0(ptr) #3

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i32 @_vsprintf_l(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 comdat {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %3, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  store ptr %1, ptr %7, align 8
  store ptr %0, ptr %8, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = load ptr, ptr %6, align 8
  %11 = load ptr, ptr %7, align 8
  %12 = load ptr, ptr %8, align 8
  %13 = call i32 @_vsnprintf_l(ptr noundef %12, i64 noundef -1, ptr noundef %11, ptr noundef %10, ptr noundef %9)
  ret i32 %13
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.va_end.p0(ptr) #3

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i32 @_vsnprintf_l(ptr noundef %0, i64 noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4) #0 comdat {
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i64, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  store ptr %4, ptr %6, align 8
  store ptr %3, ptr %7, align 8
  store ptr %2, ptr %8, align 8
  store i64 %1, ptr %9, align 8
  store ptr %0, ptr %10, align 8
  %12 = load ptr, ptr %6, align 8
  %13 = load ptr, ptr %7, align 8
  %14 = load ptr, ptr %8, align 8
  %15 = load i64, ptr %9, align 8
  %16 = load ptr, ptr %10, align 8
  %17 = call ptr @__local_stdio_printf_options()
  %18 = load i64, ptr %17, align 8
  %19 = or i64 %18, 1
  %20 = call i32 @__stdio_common_vsprintf(i64 noundef %19, ptr noundef %16, i64 noundef %15, ptr noundef %14, ptr noundef %13, ptr noundef %12)
  store i32 %20, ptr %11, align 4
  %21 = load i32, ptr %11, align 4
  %22 = icmp slt i32 %21, 0
  br i1 %22, label %23, label %24

23:                                               ; preds = %5
  br label %26

24:                                               ; preds = %5
  %25 = load i32, ptr %11, align 4
  br label %26

26:                                               ; preds = %24, %23
  %27 = phi i32 [ -1, %23 ], [ %25, %24 ]
  ret i32 %27
}

declare dso_local i32 @__stdio_common_vsprintf(i64 noundef, ptr noundef, i64 noundef, ptr noundef, ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local ptr @__local_stdio_printf_options() #0 comdat {
  ret ptr @__local_stdio_printf_options._OptionsStorage
}

; Function Attrs: noinline nounwind optnone uwtable
define linkonce_odr dso_local i32 @_vfprintf_l(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 comdat {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %3, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  store ptr %1, ptr %7, align 8
  store ptr %0, ptr %8, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = load ptr, ptr %6, align 8
  %11 = load ptr, ptr %7, align 8
  %12 = load ptr, ptr %8, align 8
  %13 = call ptr @__local_stdio_printf_options()
  %14 = load i64, ptr %13, align 8
  %15 = call i32 @__stdio_common_vfprintf(i64 noundef %14, ptr noundef %12, ptr noundef %11, ptr noundef %10, ptr noundef %9)
  ret i32 %15
}

declare dso_local ptr @__acrt_iob_func(i32 noundef) #1

declare dso_local i32 @__stdio_common_vfprintf(i64 noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef) #1

attributes #0 = { noinline nounwind optnone uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nosync nounwind willreturn }
attributes #4 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.2 (https://github.com/llvm/llvm-project 1ab49a973e210e97d61e5db6557180dcb92c3e98)", isOptimized: false, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "Codes\\test_cases\\ai_test_security_checks.c", directory: "F:\\My Files\\NIT Warangal\\Semester IV\\CLG Work or Project\\Compiler Design")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 2}
!4 = !{i32 8, !"PIC Level", i32 2}
!5 = !{i32 7, !"uwtable", i32 2}
!6 = !{i32 1, !"MaxTLSAlign", i32 65536}
!7 = !{!"clang version 22.1.2 (https://github.com/llvm/llvm-project 1ab49a973e210e97d61e5db6557180dcb92c3e98)"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
