; ModuleID = 'F:/My Files/NIT Warangal/Semester IV/CLG Work or Project/Compiler Design/Codes/test_cases/19_global_vars.c'
source_filename = "F:/My Files/NIT Warangal/Semester IV/CLG Work or Project/Compiler Design/Codes/test_cases/19_global_vars.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.44.35224"

@g_x = dso_local global i32 100, align 4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %2 = load i32, ptr @g_x, align 4
  %3 = add nsw i32 %2, 5
  ret i32 %3
}

attributes #0 = { noinline nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.2 (https://github.com/llvm/llvm-project 1ab49a973e210e97d61e5db6557180dcb92c3e98)", isOptimized: false, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "F:/My Files/NIT Warangal/Semester IV/CLG Work or Project/Compiler Design/Codes/test_cases\\19_global_vars.c", directory: "F:\\My Files\\NIT Warangal\\Semester IV\\CLG Work or Project\\Compiler Design")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 2}
!4 = !{i32 8, !"PIC Level", i32 2}
!5 = !{i32 7, !"uwtable", i32 2}
!6 = !{i32 1, !"MaxTLSAlign", i32 65536}
!7 = !{!"clang version 22.1.2 (https://github.com/llvm/llvm-project 1ab49a973e210e97d61e5db6557180dcb92c3e98)"}
