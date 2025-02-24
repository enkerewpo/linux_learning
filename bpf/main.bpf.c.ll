; ModuleID = 'main.bpf.c'
source_filename = "main.bpf.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

@hello.____fmt = internal constant [15 x i8] c"Hello, World!\0A\00", align 1, !dbg !0
@LICENSE = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !10
@llvm.compiler.used = appending global [2 x ptr] [ptr @LICENSE, ptr @hello], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local noundef i32 @hello(ptr nocapture readnone %0) #0 section "tp/syscalls/sys_enter_execve" !dbg !2 {
  tail call void @llvm.dbg.value(metadata ptr poison, metadata !29, metadata !DIExpression()), !dbg !39
  %2 = tail call i64 (ptr, i32, ...) inttoptr (i64 6 to ptr)(ptr noundef nonnull @hello.____fmt, i32 noundef 15) #2, !dbg !40
  ret i32 0, !dbg !42
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nounwind }

!llvm.dbg.cu = !{!8}
!llvm.module.flags = !{!33, !34, !35, !36, !37}
!llvm.ident = !{!38}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "____fmt", scope: !2, file: !3, line: 6, type: !30, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "hello", scope: !3, file: !3, line: 5, type: !4, scopeLine: 5, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !8, retainedNodes: !28)
!3 = !DIFile(filename: "main.bpf.c", directory: "/home/wheatfox/Code/linux_learning/bpf", checksumkind: CSK_MD5, checksum: "b2c7114eec81182322f2fa7c5e0987de")
!4 = !DISubroutineType(types: !5)
!5 = !{!6, !7}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 18.1.3 (1ubuntu1)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, globals: !9, splitDebugInlining: false, nameTableKind: None)
!9 = !{!0, !10, !16}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "LICENSE", scope: !8, file: !3, line: 10, type: !12, isLocal: false, isDefinition: true)
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 32, elements: !14)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !{!15}
!15 = !DISubrange(count: 4)
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression(DW_OP_constu, 6, DW_OP_stack_value))
!17 = distinct !DIGlobalVariable(name: "bpf_trace_printk", scope: !8, file: !18, line: 177, type: !19, isLocal: true, isDefinition: true)
!18 = !DIFile(filename: "/usr/include/bpf/bpf_helper_defs.h", directory: "", checksumkind: CSK_MD5, checksum: "09cfcd7169c24bec448f30582e8c6db9")
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DISubroutineType(types: !21)
!21 = !{!22, !23, !25, null}
!22 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !13)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !26, line: 142, baseType: !27)
!26 = !DIFile(filename: "./vmlinux.h", directory: "/home/wheatfox/Code/linux_learning/bpf", checksumkind: CSK_MD5, checksum: "f246ff1db1b7ee67bed96814296c5bba")
!27 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!28 = !{!29}
!29 = !DILocalVariable(name: "ctx", arg: 1, scope: !2, file: !3, line: 5, type: !7)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 120, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 15)
!33 = !{i32 7, !"Dwarf Version", i32 5}
!34 = !{i32 2, !"Debug Info Version", i32 3}
!35 = !{i32 1, !"wchar_size", i32 4}
!36 = !{i32 7, !"frame-pointer", i32 2}
!37 = !{i32 7, !"debug-info-assignment-tracking", i1 true}
!38 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!39 = !DILocation(line: 0, scope: !2)
!40 = !DILocation(line: 6, column: 3, scope: !41)
!41 = distinct !DILexicalBlock(scope: !2, file: !3, line: 6, column: 3)
!42 = !DILocation(line: 7, column: 3, scope: !2)
