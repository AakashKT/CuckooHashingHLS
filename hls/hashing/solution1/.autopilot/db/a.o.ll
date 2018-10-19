; ModuleID = '/home/aakash/Desktop/CDS/CuckooHashingHLS/hls/hashing/solution1/.autopilot/db/a.o.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str2 = private unnamed_addr constant [5 x i8] c"bram\00", align 1 ; [#uses=1 type=[5 x i8]*]
@.str13 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1 ; [#uses=1 type=[1 x i8]*]
@.str24 = private unnamed_addr constant [10 x i8] c"ap_memory\00", align 1 ; [#uses=1 type=[10 x i8]*]

; [#uses=9]
declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

; [#uses=2]
declare void @_ssdm_SpecArrayDimSize(...) nounwind

; [#uses=0]
define i32 @execute(i32 %op_type, i32 %hash, i32 %val_addr, i32* %key_val_dram, i32* %val_addr_bram) nounwind uwtable {
  %1 = alloca i32, align 4                        ; [#uses=5 type=i32*]
  %2 = alloca i32, align 4                        ; [#uses=3 type=i32*]
  %3 = alloca i32, align 4                        ; [#uses=4 type=i32*]
  %4 = alloca i32, align 4                        ; [#uses=6 type=i32*]
  %5 = alloca i32*, align 8                       ; [#uses=8 type=i32**]
  %6 = alloca i32*, align 8                       ; [#uses=4 type=i32**]
  %stored_hash = alloca i32, align 4              ; [#uses=2 type=i32*]
  %stored_val = alloca i32, align 4               ; [#uses=2 type=i32*]
  %stored_hash1 = alloca i32, align 4             ; [#uses=2 type=i32*]
  %stored_val2 = alloca i32, align 4              ; [#uses=2 type=i32*]
  store i32 %op_type, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !78), !dbg !79 ; [debug line = 3:19] [debug variable = op_type]
  store i32 %hash, i32* %3, align 4
  call void @llvm.dbg.declare(metadata !{i32* %3}, metadata !80), !dbg !81 ; [debug line = 3:33] [debug variable = hash]
  store i32 %val_addr, i32* %4, align 4
  call void @llvm.dbg.declare(metadata !{i32* %4}, metadata !82), !dbg !83 ; [debug line = 3:50] [debug variable = val_addr]
  store i32* %key_val_dram, i32** %5, align 8
  call void @llvm.dbg.declare(metadata !{i32** %5}, metadata !84), !dbg !85 ; [debug line = 4:6] [debug variable = key_val_dram]
  store i32* %val_addr_bram, i32** %6, align 8
  call void @llvm.dbg.declare(metadata !{i32** %6}, metadata !86), !dbg !87 ; [debug line = 5:14] [debug variable = val_addr_bram]
  %7 = load i32** %6, align 8, !dbg !88           ; [#uses=1 type=i32*] [debug line = 6:2]
  call void (...)* @_ssdm_SpecArrayDimSize(i32* %7, i32 10) nounwind, !dbg !88 ; [debug line = 6:2]
  %8 = load i32** %5, align 8, !dbg !90           ; [#uses=1 type=i32*] [debug line = 6:56]
  call void (...)* @_ssdm_SpecArrayDimSize(i32* %8, i32 80) nounwind, !dbg !90 ; [debug line = 6:56]
  %9 = load i32** %6, align 8, !dbg !91           ; [#uses=1 type=i32*] [debug line = 7:1]
  call void (...)* @_ssdm_op_SpecInterface(i32* %9, i8* getelementptr inbounds ([5 x i8]* @.str2, i32 0, i32 0), i32 0, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str13, i32 0, i32 0), i32 0, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str13, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str13, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str13, i32 0, i32 0), i32 0, i32 0, i32 0, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str13, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str13, i32 0, i32 0)) nounwind, !dbg !91 ; [debug line = 7:1]
  %10 = load i32** %5, align 8, !dbg !92          ; [#uses=1 type=i32*] [debug line = 8:1]
  call void (...)* @_ssdm_op_SpecInterface(i32* %10, i8* getelementptr inbounds ([10 x i8]* @.str24, i32 0, i32 0), i32 0, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str13, i32 0, i32 0), i32 0, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str13, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str13, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str13, i32 0, i32 0), i32 0, i32 0, i32 0, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str13, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str13, i32 0, i32 0)) nounwind, !dbg !92 ; [debug line = 8:1]
  %11 = load i32* %2, align 4, !dbg !93           ; [#uses=1 type=i32] [debug line = 9:2]
  %12 = icmp eq i32 %11, 1, !dbg !93              ; [#uses=1 type=i1] [debug line = 9:2]
  br i1 %12, label %13, label %14, !dbg !93       ; [debug line = 9:2]

; <label>:13                                      ; preds = %0
  br label %61, !dbg !94                          ; [debug line = 12:2]

; <label>:14                                      ; preds = %0
  %15 = load i32* %2, align 4, !dbg !96           ; [#uses=1 type=i32] [debug line = 13:7]
  %16 = icmp eq i32 %15, 2, !dbg !96              ; [#uses=1 type=i1] [debug line = 13:7]
  br i1 %16, label %17, label %43, !dbg !96       ; [debug line = 13:7]

; <label>:17                                      ; preds = %14
  call void @llvm.dbg.declare(metadata !{i32* %stored_hash}, metadata !97), !dbg !99 ; [debug line = 15:8] [debug variable = stored_hash]
  %18 = load i32* %4, align 4, !dbg !100          ; [#uses=1 type=i32] [debug line = 15:44]
  %19 = zext i32 %18 to i64, !dbg !100            ; [#uses=1 type=i64] [debug line = 15:44]
  %20 = load i32** %5, align 8, !dbg !100         ; [#uses=1 type=i32*] [debug line = 15:44]
  %21 = getelementptr inbounds i32* %20, i64 %19, !dbg !100 ; [#uses=1 type=i32*] [debug line = 15:44]
  %22 = load i32* %21, align 4, !dbg !100         ; [#uses=1 type=i32] [debug line = 15:44]
  store i32 %22, i32* %stored_hash, align 4, !dbg !100 ; [debug line = 15:44]
  call void @llvm.dbg.declare(metadata !{i32* %stored_val}, metadata !101), !dbg !102 ; [debug line = 16:9] [debug variable = stored_val]
  %23 = load i32* %4, align 4, !dbg !103          ; [#uses=1 type=i32] [debug line = 16:57]
  %24 = add i32 40, %23, !dbg !103                ; [#uses=1 type=i32] [debug line = 16:57]
  %25 = zext i32 %24 to i64, !dbg !103            ; [#uses=1 type=i64] [debug line = 16:57]
  %26 = load i32** %5, align 8, !dbg !103         ; [#uses=1 type=i32*] [debug line = 16:57]
  %27 = getelementptr inbounds i32* %26, i64 %25, !dbg !103 ; [#uses=1 type=i32*] [debug line = 16:57]
  %28 = load i32* %27, align 4, !dbg !103         ; [#uses=1 type=i32] [debug line = 16:57]
  store i32 %28, i32* %stored_val, align 4, !dbg !103 ; [debug line = 16:57]
  %29 = load i32* %3, align 4, !dbg !104          ; [#uses=1 type=i32] [debug line = 18:3]
  %30 = load i32* %stored_hash, align 4, !dbg !104 ; [#uses=1 type=i32] [debug line = 18:3]
  %31 = icmp eq i32 %29, %30, !dbg !104           ; [#uses=1 type=i1] [debug line = 18:3]
  br i1 %31, label %32, label %41, !dbg !104      ; [debug line = 18:3]

; <label>:32                                      ; preds = %17
  %33 = load i32* %3, align 4, !dbg !105          ; [#uses=1 type=i32] [debug line = 19:4]
  %34 = zext i32 %33 to i64, !dbg !105            ; [#uses=1 type=i64] [debug line = 19:4]
  %35 = load i32** %6, align 8, !dbg !105         ; [#uses=1 type=i32*] [debug line = 19:4]
  %36 = getelementptr inbounds i32* %35, i64 %34, !dbg !105 ; [#uses=1 type=i32*] [debug line = 19:4]
  store i32 -1, i32* %36, align 4, !dbg !105      ; [debug line = 19:4]
  %37 = load i32* %4, align 4, !dbg !107          ; [#uses=1 type=i32] [debug line = 20:4]
  %38 = zext i32 %37 to i64, !dbg !107            ; [#uses=1 type=i64] [debug line = 20:4]
  %39 = load i32** %5, align 8, !dbg !107         ; [#uses=1 type=i32*] [debug line = 20:4]
  %40 = getelementptr inbounds i32* %39, i64 %38, !dbg !107 ; [#uses=1 type=i32*] [debug line = 20:4]
  store i32 -1, i32* %40, align 4, !dbg !107      ; [debug line = 20:4]
  br label %41, !dbg !108                         ; [debug line = 21:3]

; <label>:41                                      ; preds = %32, %17
  %42 = load i32* %stored_val, align 4, !dbg !109 ; [#uses=1 type=i32] [debug line = 23:3]
  store i32 %42, i32* %1, !dbg !109               ; [debug line = 23:3]
  br label %62, !dbg !109                         ; [debug line = 23:3]

; <label>:43                                      ; preds = %14
  call void @llvm.dbg.declare(metadata !{i32* %stored_hash1}, metadata !110), !dbg !112 ; [debug line = 28:8] [debug variable = stored_hash]
  %44 = load i32* %4, align 4, !dbg !113          ; [#uses=1 type=i32] [debug line = 28:44]
  %45 = zext i32 %44 to i64, !dbg !113            ; [#uses=1 type=i64] [debug line = 28:44]
  %46 = load i32** %5, align 8, !dbg !113         ; [#uses=1 type=i32*] [debug line = 28:44]
  %47 = getelementptr inbounds i32* %46, i64 %45, !dbg !113 ; [#uses=1 type=i32*] [debug line = 28:44]
  %48 = load i32* %47, align 4, !dbg !113         ; [#uses=1 type=i32] [debug line = 28:44]
  store i32 %48, i32* %stored_hash1, align 4, !dbg !113 ; [debug line = 28:44]
  call void @llvm.dbg.declare(metadata !{i32* %stored_val2}, metadata !114), !dbg !115 ; [debug line = 29:9] [debug variable = stored_val]
  %49 = load i32* %4, align 4, !dbg !116          ; [#uses=1 type=i32] [debug line = 29:57]
  %50 = add i32 40, %49, !dbg !116                ; [#uses=1 type=i32] [debug line = 29:57]
  %51 = zext i32 %50 to i64, !dbg !116            ; [#uses=1 type=i64] [debug line = 29:57]
  %52 = load i32** %5, align 8, !dbg !116         ; [#uses=1 type=i32*] [debug line = 29:57]
  %53 = getelementptr inbounds i32* %52, i64 %51, !dbg !116 ; [#uses=1 type=i32*] [debug line = 29:57]
  %54 = load i32* %53, align 4, !dbg !116         ; [#uses=1 type=i32] [debug line = 29:57]
  store i32 %54, i32* %stored_val2, align 4, !dbg !116 ; [debug line = 29:57]
  %55 = load i32* %3, align 4, !dbg !117          ; [#uses=1 type=i32] [debug line = 31:3]
  %56 = load i32* %stored_hash1, align 4, !dbg !117 ; [#uses=1 type=i32] [debug line = 31:3]
  %57 = icmp eq i32 %55, %56, !dbg !117           ; [#uses=1 type=i1] [debug line = 31:3]
  br i1 %57, label %58, label %60, !dbg !117      ; [debug line = 31:3]

; <label>:58                                      ; preds = %43
  %59 = load i32* %stored_val2, align 4, !dbg !118 ; [#uses=1 type=i32] [debug line = 32:4]
  store i32 %59, i32* %1, !dbg !118               ; [debug line = 32:4]
  br label %62, !dbg !118                         ; [debug line = 32:4]

; <label>:60                                      ; preds = %43
  store i32 -1, i32* %1, !dbg !119                ; [debug line = 34:4]
  br label %62, !dbg !119                         ; [debug line = 34:4]

; <label>:61                                      ; preds = %13
  store i32 -1, i32* %1, !dbg !120                ; [debug line = 37:2]
  br label %62, !dbg !120                         ; [debug line = 37:2]

; <label>:62                                      ; preds = %61, %60, %58, %41
  %63 = load i32* %1, !dbg !121                   ; [#uses=1 type=i32] [debug line = 38:1]
  ret i32 %63, !dbg !121                          ; [debug line = 38:1]
}

; [#uses=2]
declare void @_ssdm_op_SpecInterface(...) nounwind

!llvm.dbg.cu = !{!0, !31, !45}
!opencl.kernels = !{!62, !69, !72}
!hls.encrypted.func = !{}

!0 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/aakash/Desktop/CDS/CuckooHashingHLS/hls/hashing/solution1/.autopilot/db/search.pragma.2.c", metadata !"/home/aakash/Desktop/CDS/CuckooHashingHLS/hls", metadata !"clang version 3.1 ", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !16} ; [ DW_TAG_compile_unit ]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"search", metadata !"search", metadata !"", metadata !6, i32 3, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !14, i32 4} ; [ DW_TAG_subprogram ]
!6 = metadata !{i32 786473, metadata !"hashing/search.c", metadata !"/home/aakash/Desktop/CDS/CuckooHashingHLS/hls", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!8 = metadata !{metadata !9, metadata !12, metadata !13}
!9 = metadata !{i32 786454, null, metadata !"VALUE_ADDR", metadata !6, i32 15, i64 0, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_typedef ]
!10 = metadata !{i32 786454, null, metadata !"uint32_t", metadata !6, i32 51, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_typedef ]
!11 = metadata !{i32 786468, null, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!12 = metadata !{i32 786454, null, metadata !"HASH", metadata !6, i32 13, i64 0, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_typedef ]
!13 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ]
!14 = metadata !{metadata !15}
!15 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!16 = metadata !{metadata !17}
!17 = metadata !{metadata !18, metadata !18, metadata !22, metadata !25, metadata !26, metadata !27, metadata !29}
!18 = metadata !{i32 786484, i32 0, metadata !19, metadata !"NUM_VALUE_ADDRS", metadata !"NUM_VALUE_ADDRS", metadata !"NUM_VALUE_ADDRS", metadata !19, i32 26, metadata !20, i32 1, i32 1, i32 10} ; [ DW_TAG_variable ]
!19 = metadata !{i32 786473, metadata !"hashing/def.h", metadata !"/home/aakash/Desktop/CDS/CuckooHashingHLS/hls", null} ; [ DW_TAG_file_type ]
!20 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !21} ; [ DW_TAG_const_type ]
!21 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!22 = metadata !{i32 786484, i32 0, null, metadata !"_IO_2_1_stdin_", metadata !"_IO_2_1_stdin_", metadata !"", metadata !23, i32 315, metadata !24, i32 0, i32 1, null} ; [ DW_TAG_variable ]
!23 = metadata !{i32 786473, metadata !"/usr/include/libio.h", metadata !"/home/aakash/Desktop/CDS/CuckooHashingHLS/hls", null} ; [ DW_TAG_file_type ]
!24 = metadata !{i32 786451, null, metadata !"_IO_FILE_plus", metadata !23, i32 313, i32 0, i32 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ]
!25 = metadata !{i32 786484, i32 0, null, metadata !"_IO_2_1_stdout_", metadata !"_IO_2_1_stdout_", metadata !"", metadata !23, i32 316, metadata !24, i32 0, i32 1, null} ; [ DW_TAG_variable ]
!26 = metadata !{i32 786484, i32 0, null, metadata !"_IO_2_1_stderr_", metadata !"_IO_2_1_stderr_", metadata !"", metadata !23, i32 317, metadata !24, i32 0, i32 1, null} ; [ DW_TAG_variable ]
!27 = metadata !{i32 786484, i32 0, null, metadata !"sys_nerr", metadata !"sys_nerr", metadata !"", metadata !28, i32 26, metadata !21, i32 0, i32 1, null} ; [ DW_TAG_variable ]
!28 = metadata !{i32 786473, metadata !"/usr/include/x86_64-linux-gnu/bits/sys_errlist.h", metadata !"/home/aakash/Desktop/CDS/CuckooHashingHLS/hls", null} ; [ DW_TAG_file_type ]
!29 = metadata !{i32 786484, i32 0, null, metadata !"signgam", metadata !"signgam", metadata !"", metadata !30, i32 168, metadata !21, i32 0, i32 1, null} ; [ DW_TAG_variable ]
!30 = metadata !{i32 786473, metadata !"/usr/include/math.h", metadata !"/home/aakash/Desktop/CDS/CuckooHashingHLS/hls", null} ; [ DW_TAG_file_type ]
!31 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/aakash/Desktop/CDS/CuckooHashingHLS/hls/hashing/solution1/.autopilot/db/jenkins_hash.pragma.2.c", metadata !"/home/aakash/Desktop/CDS/CuckooHashingHLS/hls", metadata !"clang version 3.1 ", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !32, metadata !43} ; [ DW_TAG_compile_unit ]
!32 = metadata !{metadata !33}
!33 = metadata !{metadata !34}
!34 = metadata !{i32 786478, i32 0, metadata !35, metadata !"jenkins_one_at_a_time", metadata !"jenkins_one_at_a_time", metadata !"", metadata !35, i32 3, metadata !36, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !14, i32 4} ; [ DW_TAG_subprogram ]
!35 = metadata !{i32 786473, metadata !"hashing/jenkins_hash.c", metadata !"/home/aakash/Desktop/CDS/CuckooHashingHLS/hls", null} ; [ DW_TAG_file_type ]
!36 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !37, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!37 = metadata !{metadata !38, metadata !21, metadata !40}
!38 = metadata !{i32 786454, null, metadata !"HASH", metadata !35, i32 13, i64 0, i64 0, i64 0, i32 0, metadata !39} ; [ DW_TAG_typedef ]
!39 = metadata !{i32 786454, null, metadata !"uint32_t", metadata !35, i32 51, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_typedef ]
!40 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !41} ; [ DW_TAG_pointer_type ]
!41 = metadata !{i32 786454, null, metadata !"KEY", metadata !35, i32 12, i64 0, i64 0, i64 0, i32 0, metadata !42} ; [ DW_TAG_typedef ]
!42 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!43 = metadata !{metadata !44}
!44 = metadata !{metadata !22, metadata !25, metadata !26, metadata !27, metadata !29}
!45 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/aakash/Desktop/CDS/CuckooHashingHLS/hls/hashing/solution1/.autopilot/db/execute.pragma.2.c", metadata !"/home/aakash/Desktop/CDS/CuckooHashingHLS/hls", metadata !"clang version 3.1 ", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !46, metadata !59} ; [ DW_TAG_compile_unit ]
!46 = metadata !{metadata !47}
!47 = metadata !{metadata !48}
!48 = metadata !{i32 786478, i32 0, metadata !49, metadata !"execute", metadata !"execute", metadata !"", metadata !49, i32 3, metadata !50, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i32, i32, i32*, i32*)* @execute, null, null, metadata !14, i32 6} ; [ DW_TAG_subprogram ]
!49 = metadata !{i32 786473, metadata !"hashing/execute.c", metadata !"/home/aakash/Desktop/CDS/CuckooHashingHLS/hls", null} ; [ DW_TAG_file_type ]
!50 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !51, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!51 = metadata !{metadata !52, metadata !21, metadata !54, metadata !55, metadata !56, metadata !58}
!52 = metadata !{i32 786454, null, metadata !"VALUE", metadata !49, i32 14, i64 0, i64 0, i64 0, i32 0, metadata !53} ; [ DW_TAG_typedef ]
!53 = metadata !{i32 786454, null, metadata !"uint32_t", metadata !49, i32 51, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_typedef ]
!54 = metadata !{i32 786454, null, metadata !"HASH", metadata !49, i32 13, i64 0, i64 0, i64 0, i32 0, metadata !53} ; [ DW_TAG_typedef ]
!55 = metadata !{i32 786454, null, metadata !"VALUE_ADDR", metadata !49, i32 15, i64 0, i64 0, i64 0, i32 0, metadata !53} ; [ DW_TAG_typedef ]
!56 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !57} ; [ DW_TAG_pointer_type ]
!57 = metadata !{i32 786454, null, metadata !"KV", metadata !49, i32 16, i64 0, i64 0, i64 0, i32 0, metadata !53} ; [ DW_TAG_typedef ]
!58 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !55} ; [ DW_TAG_pointer_type ]
!59 = metadata !{metadata !60}
!60 = metadata !{metadata !18, metadata !61, metadata !61, metadata !61, metadata !22, metadata !25, metadata !26, metadata !27, metadata !29}
!61 = metadata !{i32 786484, i32 0, metadata !19, metadata !"NUM_VALUES", metadata !"NUM_VALUES", metadata !"NUM_VALUES", metadata !19, i32 22, metadata !20, i32 1, i32 1, i32 40} ; [ DW_TAG_variable ]
!62 = metadata !{null, metadata !63, metadata !64, metadata !65, metadata !66, metadata !67, metadata !68}
!63 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 1}
!64 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none"}
!65 = metadata !{metadata !"kernel_arg_type", metadata !"HASH", metadata !"VALUE_ADDR*"}
!66 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !""}
!67 = metadata !{metadata !"kernel_arg_name", metadata !"h", metadata !"val_addr_bram"}
!68 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!69 = metadata !{null, metadata !63, metadata !64, metadata !70, metadata !66, metadata !71, metadata !68}
!70 = metadata !{metadata !"kernel_arg_type", metadata !"int", metadata !"KEY*"}
!71 = metadata !{metadata !"kernel_arg_name", metadata !"length", metadata !"key"}
!72 = metadata !{i32 (i32, i32, i32, i32*, i32*)* @execute, metadata !73, metadata !74, metadata !75, metadata !76, metadata !77, metadata !68}
!73 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 0, i32 1, i32 1}
!74 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!75 = metadata !{metadata !"kernel_arg_type", metadata !"int", metadata !"HASH", metadata !"VALUE_ADDR", metadata !"KV*", metadata !"VALUE_ADDR*"}
!76 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !"", metadata !""}
!77 = metadata !{metadata !"kernel_arg_name", metadata !"op_type", metadata !"hash", metadata !"val_addr", metadata !"key_val_dram", metadata !"val_addr_bram"}
!78 = metadata !{i32 786689, metadata !48, metadata !"op_type", metadata !49, i32 16777219, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!79 = metadata !{i32 3, i32 19, metadata !48, null}
!80 = metadata !{i32 786689, metadata !48, metadata !"hash", metadata !49, i32 33554435, metadata !54, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!81 = metadata !{i32 3, i32 33, metadata !48, null}
!82 = metadata !{i32 786689, metadata !48, metadata !"val_addr", metadata !49, i32 50331651, metadata !55, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!83 = metadata !{i32 3, i32 50, metadata !48, null}
!84 = metadata !{i32 786689, metadata !48, metadata !"key_val_dram", metadata !49, i32 67108868, metadata !56, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!85 = metadata !{i32 4, i32 6, metadata !48, null}
!86 = metadata !{i32 786689, metadata !48, metadata !"val_addr_bram", metadata !49, i32 83886085, metadata !58, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!87 = metadata !{i32 5, i32 14, metadata !48, null}
!88 = metadata !{i32 6, i32 2, metadata !89, null}
!89 = metadata !{i32 786443, metadata !48, i32 6, i32 1, metadata !49, i32 0} ; [ DW_TAG_lexical_block ]
!90 = metadata !{i32 6, i32 56, metadata !89, null}
!91 = metadata !{i32 7, i32 1, metadata !89, null}
!92 = metadata !{i32 8, i32 1, metadata !89, null}
!93 = metadata !{i32 9, i32 2, metadata !89, null}
!94 = metadata !{i32 12, i32 2, metadata !95, null}
!95 = metadata !{i32 786443, metadata !89, i32 10, i32 2, metadata !49, i32 1} ; [ DW_TAG_lexical_block ]
!96 = metadata !{i32 13, i32 7, metadata !89, null}
!97 = metadata !{i32 786688, metadata !98, metadata !"stored_hash", metadata !49, i32 15, metadata !54, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!98 = metadata !{i32 786443, metadata !89, i32 14, i32 2, metadata !49, i32 2} ; [ DW_TAG_lexical_block ]
!99 = metadata !{i32 15, i32 8, metadata !98, null}
!100 = metadata !{i32 15, i32 44, metadata !98, null}
!101 = metadata !{i32 786688, metadata !98, metadata !"stored_val", metadata !49, i32 16, metadata !52, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!102 = metadata !{i32 16, i32 9, metadata !98, null}
!103 = metadata !{i32 16, i32 57, metadata !98, null}
!104 = metadata !{i32 18, i32 3, metadata !98, null}
!105 = metadata !{i32 19, i32 4, metadata !106, null}
!106 = metadata !{i32 786443, metadata !98, i32 18, i32 27, metadata !49, i32 3} ; [ DW_TAG_lexical_block ]
!107 = metadata !{i32 20, i32 4, metadata !106, null}
!108 = metadata !{i32 21, i32 3, metadata !106, null}
!109 = metadata !{i32 23, i32 3, metadata !98, null}
!110 = metadata !{i32 786688, metadata !111, metadata !"stored_hash", metadata !49, i32 28, metadata !54, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!111 = metadata !{i32 786443, metadata !89, i32 27, i32 2, metadata !49, i32 4} ; [ DW_TAG_lexical_block ]
!112 = metadata !{i32 28, i32 8, metadata !111, null}
!113 = metadata !{i32 28, i32 44, metadata !111, null}
!114 = metadata !{i32 786688, metadata !111, metadata !"stored_val", metadata !49, i32 29, metadata !52, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!115 = metadata !{i32 29, i32 9, metadata !111, null}
!116 = metadata !{i32 29, i32 57, metadata !111, null}
!117 = metadata !{i32 31, i32 3, metadata !111, null}
!118 = metadata !{i32 32, i32 4, metadata !111, null}
!119 = metadata !{i32 34, i32 4, metadata !111, null}
!120 = metadata !{i32 37, i32 2, metadata !89, null}
!121 = metadata !{i32 38, i32 1, metadata !89, null}
