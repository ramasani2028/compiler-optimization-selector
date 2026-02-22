; ModuleID = 'f:\My Files\NIT Warangal\Semester IV\CLG Work or Project\Compiler Design\Codes\test_cases\17_float_arithmetic.c'
source_filename = "f:\\My Files\\NIT Warangal\\Semester IV\\CLG Work or Project\\Compiler Design\\Codes\\test_cases\\17_float_arithmetic.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.33.0"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  store i32 0, ptr %1, align 4
  store float 5.500000e+00, ptr %2, align 4
  store float 0x40019999A0000000, ptr %3, align 4
  %5 = load float, ptr %2, align 4
  %6 = load float, ptr %3, align 4
  %7 = fmul float %5, %6
  store float %7, ptr %4, align 4
  %8 = load float, ptr %4, align 4
  %9 = fptosi float %8 to i32
  ret i32 %9
}

attributes #0 = { noinline nounwind optnone uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 2}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 2}
!3 = !{i32 1, !"MaxTLSAlign", i32 65536}
!4 = !{!"clang version 18.1.8"}
