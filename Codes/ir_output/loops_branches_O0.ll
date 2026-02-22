; ModuleID = 'loops_branches.c'
source_filename = "loops_branches.c"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.33.0"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [10000 x i32], align 16
  %3 = alloca i64, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca [100 x [100 x i32]], align 16
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i64, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i64 0, ptr %3, align 8
  store i32 0, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %13

13:                                               ; preds = %23, %0
  %14 = load i32, ptr %5, align 4
  %15 = icmp slt i32 %14, 10000
  br i1 %15, label %16, label %26

16:                                               ; preds = %13
  %17 = load i32, ptr %5, align 4
  %18 = mul nsw i32 %17, 17
  %19 = srem i32 %18, 256
  %20 = load i32, ptr %5, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [10000 x i32], ptr %2, i64 0, i64 %21
  store i32 %19, ptr %22, align 4
  br label %23

23:                                               ; preds = %16
  %24 = load i32, ptr %5, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %5, align 4
  br label %13, !llvm.loop !5

26:                                               ; preds = %13
  store i32 0, ptr %6, align 4
  br label %27

27:                                               ; preds = %84, %26
  %28 = load i32, ptr %6, align 4
  %29 = icmp slt i32 %28, 10000
  br i1 %29, label %30, label %87

30:                                               ; preds = %27
  %31 = load i32, ptr %6, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [10000 x i32], ptr %2, i64 0, i64 %32
  %34 = load i32, ptr %33, align 4
  %35 = srem i32 %34, 2
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %37, label %46

37:                                               ; preds = %30
  %38 = load i32, ptr %6, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [10000 x i32], ptr %2, i64 0, i64 %39
  %41 = load i32, ptr %40, align 4
  %42 = mul nsw i32 %41, 2
  %43 = sext i32 %42 to i64
  %44 = load i64, ptr %3, align 8
  %45 = add nsw i64 %44, %43
  store i64 %45, ptr %3, align 8
  br label %71

46:                                               ; preds = %30
  %47 = load i32, ptr %6, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [10000 x i32], ptr %2, i64 0, i64 %48
  %50 = load i32, ptr %49, align 4
  %51 = srem i32 %50, 3
  %52 = icmp eq i32 %51, 0
  br i1 %52, label %53, label %61

53:                                               ; preds = %46
  %54 = load i32, ptr %6, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [10000 x i32], ptr %2, i64 0, i64 %55
  %57 = load i32, ptr %56, align 4
  %58 = sext i32 %57 to i64
  %59 = load i64, ptr %3, align 8
  %60 = sub nsw i64 %59, %58
  store i64 %60, ptr %3, align 8
  br label %70

61:                                               ; preds = %46
  %62 = load i32, ptr %6, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [10000 x i32], ptr %2, i64 0, i64 %63
  %65 = load i32, ptr %64, align 4
  %66 = sdiv i32 %65, 2
  %67 = sext i32 %66 to i64
  %68 = load i64, ptr %3, align 8
  %69 = add nsw i64 %68, %67
  store i64 %69, ptr %3, align 8
  br label %70

70:                                               ; preds = %61, %53
  br label %71

71:                                               ; preds = %70, %37
  %72 = load i32, ptr %6, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [10000 x i32], ptr %2, i64 0, i64 %73
  %75 = load i32, ptr %74, align 4
  %76 = load i32, ptr %4, align 4
  %77 = icmp sgt i32 %75, %76
  br i1 %77, label %78, label %83

78:                                               ; preds = %71
  %79 = load i32, ptr %6, align 4
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [10000 x i32], ptr %2, i64 0, i64 %80
  %82 = load i32, ptr %81, align 4
  store i32 %82, ptr %4, align 4
  br label %83

83:                                               ; preds = %78, %71
  br label %84

84:                                               ; preds = %83
  %85 = load i32, ptr %6, align 4
  %86 = add nsw i32 %85, 1
  store i32 %86, ptr %6, align 4
  br label %27, !llvm.loop !7

87:                                               ; preds = %27
  store i32 0, ptr %8, align 4
  br label %88

88:                                               ; preds = %110, %87
  %89 = load i32, ptr %8, align 4
  %90 = icmp slt i32 %89, 100
  br i1 %90, label %91, label %113

91:                                               ; preds = %88
  store i32 0, ptr %9, align 4
  br label %92

92:                                               ; preds = %106, %91
  %93 = load i32, ptr %9, align 4
  %94 = icmp slt i32 %93, 100
  br i1 %94, label %95, label %109

95:                                               ; preds = %92
  %96 = load i32, ptr %8, align 4
  %97 = load i32, ptr %9, align 4
  %98 = add nsw i32 %96, %97
  %99 = srem i32 %98, 10
  %100 = load i32, ptr %8, align 4
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds [100 x [100 x i32]], ptr %7, i64 0, i64 %101
  %103 = load i32, ptr %9, align 4
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds [100 x i32], ptr %102, i64 0, i64 %104
  store i32 %99, ptr %105, align 4
  br label %106

106:                                              ; preds = %95
  %107 = load i32, ptr %9, align 4
  %108 = add nsw i32 %107, 1
  store i32 %108, ptr %9, align 4
  br label %92, !llvm.loop !8

109:                                              ; preds = %92
  br label %110

110:                                              ; preds = %109
  %111 = load i32, ptr %8, align 4
  %112 = add nsw i32 %111, 1
  store i32 %112, ptr %8, align 4
  br label %88, !llvm.loop !9

113:                                              ; preds = %88
  store i64 0, ptr %10, align 8
  store i32 0, ptr %11, align 4
  br label %114

114:                                              ; preds = %153, %113
  %115 = load i32, ptr %11, align 4
  %116 = icmp slt i32 %115, 100
  br i1 %116, label %117, label %156

117:                                              ; preds = %114
  store i32 0, ptr %12, align 4
  br label %118

118:                                              ; preds = %149, %117
  %119 = load i32, ptr %12, align 4
  %120 = icmp slt i32 %119, 100
  br i1 %120, label %121, label %152

121:                                              ; preds = %118
  %122 = load i32, ptr %11, align 4
  %123 = load i32, ptr %12, align 4
  %124 = icmp eq i32 %122, %123
  br i1 %124, label %125, label %137

125:                                              ; preds = %121
  %126 = load i32, ptr %11, align 4
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds [100 x [100 x i32]], ptr %7, i64 0, i64 %127
  %129 = load i32, ptr %12, align 4
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds [100 x i32], ptr %128, i64 0, i64 %130
  %132 = load i32, ptr %131, align 4
  %133 = mul nsw i32 %132, 5
  %134 = sext i32 %133 to i64
  %135 = load i64, ptr %10, align 8
  %136 = add nsw i64 %135, %134
  store i64 %136, ptr %10, align 8
  br label %148

137:                                              ; preds = %121
  %138 = load i32, ptr %11, align 4
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds [100 x [100 x i32]], ptr %7, i64 0, i64 %139
  %141 = load i32, ptr %12, align 4
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds [100 x i32], ptr %140, i64 0, i64 %142
  %144 = load i32, ptr %143, align 4
  %145 = sext i32 %144 to i64
  %146 = load i64, ptr %10, align 8
  %147 = add nsw i64 %146, %145
  store i64 %147, ptr %10, align 8
  br label %148

148:                                              ; preds = %137, %125
  br label %149

149:                                              ; preds = %148
  %150 = load i32, ptr %12, align 4
  %151 = add nsw i32 %150, 1
  store i32 %151, ptr %12, align 4
  br label %118, !llvm.loop !10

152:                                              ; preds = %118
  br label %153

153:                                              ; preds = %152
  %154 = load i32, ptr %11, align 4
  %155 = add nsw i32 %154, 1
  store i32 %155, ptr %11, align 4
  br label %114, !llvm.loop !11

156:                                              ; preds = %114
  %157 = load i64, ptr %3, align 8
  %158 = load i32, ptr %4, align 4
  %159 = sext i32 %158 to i64
  %160 = add nsw i64 %157, %159
  %161 = load i64, ptr %10, align 8
  %162 = add nsw i64 %160, %161
  %163 = trunc i64 %162 to i32
  %164 = srem i32 %163, 256
  ret i32 %164
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
