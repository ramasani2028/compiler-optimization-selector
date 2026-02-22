; ModuleID = 'f:\My Files\NIT Warangal\Semester IV\CLG Work or Project\Compiler Design\Codes\test_cases\01_hello_world.c'
source_filename = "f:\\My Files\\NIT Warangal\\Semester IV\\CLG Work or Project\\Compiler Design\\Codes\\test_cases\\01_hello_world.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.33.0"

$"??_C@_0BC@JMMBLACN@Hello?0?5Compiler?$CB?6?$AA@" = comdat any

@"??_C@_0BC@JMMBLACN@Hello?0?5Compiler?$CB?6?$AA@" = linkonce_odr dso_local unnamed_addr constant [18 x i8] c"Hello, Compiler!\0A\00", comdat, align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %2 = call i32 (ptr, ...) @printf(ptr noundef @"??_C@_0BC@JMMBLACN@Hello?0?5Compiler?$CB?6?$AA@")
  ret i32 0
}

declare dso_local i32 @printf(ptr noundef, ...) #1

attributes #0 = { noinline nounwind optnone uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 2}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 2}
!3 = !{i32 1, !"MaxTLSAlign", i32 65536}
!4 = !{!"clang version 18.1.8"}
