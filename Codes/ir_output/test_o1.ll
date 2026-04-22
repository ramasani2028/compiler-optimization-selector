; ModuleID = 'Codes\test_cases\ai_test_security_checks.c'
source_filename = "Codes\\test_cases\\ai_test_security_checks.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.44.35224"

@str = private unnamed_addr constant [19 x i8] c"Optimization Dummy\00", align 1
@str.1 = private unnamed_addr constant [39 x i8] c"Bounds Violation Mitigation Triggered!\00", align 1

; Function Attrs: nofree nounwind uwtable
define dso_local void @external_sink(i32 noundef %0) local_unnamed_addr #0 {
  %2 = icmp eq i32 %0, -1
  br i1 %2, label %3, label %5

3:                                                ; preds = %1
  %4 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  br label %5

5:                                                ; preds = %3, %1
  ret void
}

; Function Attrs: nofree nounwind uwtable
define dso_local noundef i32 @main(i32 noundef %0, ptr noundef readnone captures(none) %1) local_unnamed_addr #0 {
  %3 = icmp sgt i32 %0, 3000
  br i1 %3, label %4, label %6

4:                                                ; preds = %2
  %5 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  tail call void @abort() #3
  unreachable

6:                                                ; preds = %2
  ret i32 0
}

; Function Attrs: cold nofree noreturn nounwind
declare dso_local void @abort() local_unnamed_addr #1

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr noundef readonly captures(none)) local_unnamed_addr #2

attributes #0 = { nofree nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { cold nofree noreturn nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nounwind }
attributes #3 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6}
!llvm.ident = !{!7}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 22.1.2 (https://github.com/llvm/llvm-project 1ab49a973e210e97d61e5db6557180dcb92c3e98)", isOptimized: true, runtimeVersion: 0, emissionKind: NoDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "Codes\\test_cases\\ai_test_security_checks.c", directory: "F:\\My Files\\NIT Warangal\\Semester IV\\CLG Work or Project\\Compiler Design")
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 2}
!4 = !{i32 8, !"PIC Level", i32 2}
!5 = !{i32 7, !"uwtable", i32 2}
!6 = !{i32 1, !"MaxTLSAlign", i32 65536}
!7 = !{!"clang version 22.1.2 (https://github.com/llvm/llvm-project 1ab49a973e210e97d61e5db6557180dcb92c3e98)"}
