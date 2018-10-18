; ModuleID = '/home/aakash/Desktop/CDS/CuckooHashingHLS/hls/hashing/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@jenkins_one_at_a_time.str = internal unnamed_addr constant [22 x i8] c"jenkins_one_at_a_time\00" ; [#uses=1 type=[22 x i8]*]

; [#uses=9]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=0]
define i32 @jenkins_one_at_a_time(i32 %length, [1000 x i8]* %key) nounwind uwtable readonly {
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %length) nounwind, !map !35
  call void (...)* @_ssdm_op_SpecBitsMap([1000 x i8]* %key) nounwind, !map !41
  call void (...)* @_ssdm_op_SpecBitsMap(i32 0) nounwind, !map !47
  call void (...)* @_ssdm_op_SpecTopModule([22 x i8]* @jenkins_one_at_a_time.str) nounwind
  call void @llvm.dbg.value(metadata !{i32 %length}, i64 0, metadata !53), !dbg !54 ; [debug line = 6:36] [debug variable = length]
  call void @llvm.dbg.value(metadata !{[1000 x i8]* %key}, i64 0, metadata !55), !dbg !59 ; [debug line = 6:55] [debug variable = key]
  br label %1, !dbg !60                           ; [debug line = 11:2]

; <label>:1                                       ; preds = %2, %0
  %i = phi i32 [ 0, %0 ], [ %i.1, %2 ]            ; [#uses=3 type=i32]
  %hash = phi i32 [ 0, %0 ], [ %hash.6, %2 ]      ; [#uses=2 type=i32]
  %tmp = icmp eq i32 %i, %length, !dbg !60        ; [#uses=1 type=i1] [debug line = 11:2]
  br i1 %tmp, label %3, label %2, !dbg !60        ; [debug line = 11:2]

; <label>:2                                       ; preds = %1
  %i.1 = add nsw i32 %i, 1, !dbg !62              ; [#uses=1 type=i32] [debug line = 13:3]
  call void @llvm.dbg.value(metadata !{i32 %i.1}, i64 0, metadata !64), !dbg !62 ; [debug line = 13:3] [debug variable = i]
  %tmp.8 = sext i32 %i to i64, !dbg !62           ; [#uses=1 type=i64] [debug line = 13:3]
  %key.addr = getelementptr [1000 x i8]* %key, i64 0, i64 %tmp.8, !dbg !62 ; [#uses=1 type=i8*] [debug line = 13:3]
  %key.load = load i8* %key.addr, align 1, !dbg !62 ; [#uses=1 type=i8] [debug line = 13:3]
  %tmp.9 = sext i8 %key.load to i32, !dbg !62     ; [#uses=1 type=i32] [debug line = 13:3]
  %hash.4 = add i32 %tmp.9, %hash, !dbg !62       ; [#uses=2 type=i32] [debug line = 13:3]
  call void @llvm.dbg.value(metadata !{i32 %hash.4}, i64 0, metadata !65), !dbg !62 ; [debug line = 13:3] [debug variable = hash]
  %tmp. = shl i32 %hash.4, 10, !dbg !66           ; [#uses=1 type=i32] [debug line = 14:3]
  %hash.5 = add i32 %hash.4, %tmp., !dbg !66      ; [#uses=2 type=i32] [debug line = 14:3]
  call void @llvm.dbg.value(metadata !{i32 %hash.5}, i64 0, metadata !65), !dbg !66 ; [debug line = 14:3] [debug variable = hash]
  %tmp.2 = lshr i32 %hash.5, 6, !dbg !67          ; [#uses=1 type=i32] [debug line = 15:3]
  %hash.6 = xor i32 %tmp.2, %hash.5, !dbg !67     ; [#uses=1 type=i32] [debug line = 15:3]
  call void @llvm.dbg.value(metadata !{i32 %hash.6}, i64 0, metadata !65), !dbg !67 ; [debug line = 15:3] [debug variable = hash]
  br label %1, !dbg !68                           ; [debug line = 16:2]

; <label>:3                                       ; preds = %1
  %hash.lcssa = phi i32 [ %hash, %1 ]             ; [#uses=2 type=i32]
  %tmp.1 = shl i32 %hash.lcssa, 3, !dbg !69       ; [#uses=1 type=i32] [debug line = 18:2]
  %hash.1 = add i32 %hash.lcssa, %tmp.1, !dbg !69 ; [#uses=2 type=i32] [debug line = 18:2]
  call void @llvm.dbg.value(metadata !{i32 %hash.1}, i64 0, metadata !65), !dbg !69 ; [debug line = 18:2] [debug variable = hash]
  %tmp.3 = lshr i32 %hash.1, 11, !dbg !70         ; [#uses=1 type=i32] [debug line = 19:2]
  %hash.2 = xor i32 %tmp.3, %hash.1, !dbg !70     ; [#uses=2 type=i32] [debug line = 19:2]
  call void @llvm.dbg.value(metadata !{i32 %hash.2}, i64 0, metadata !65), !dbg !70 ; [debug line = 19:2] [debug variable = hash]
  %tmp.5 = shl i32 %hash.2, 15, !dbg !71          ; [#uses=1 type=i32] [debug line = 20:2]
  %hash.3 = add i32 %hash.2, %tmp.5, !dbg !71     ; [#uses=1 type=i32] [debug line = 20:2]
  call void @llvm.dbg.value(metadata !{i32 %hash.3}, i64 0, metadata !65), !dbg !71 ; [debug line = 20:2] [debug variable = hash]
  ret i32 %hash.3, !dbg !72                       ; [debug line = 22:2]
}

; [#uses=1]
declare void @_ssdm_op_SpecTopModule(...)

; [#uses=3]
declare void @_ssdm_op_SpecBitsMap(...)

!llvm.dbg.cu = !{!0}
!opencl.kernels = !{!28}
!hls.encrypted.func = !{}
!llvm.map.gv = !{}

!0 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/aakash/Desktop/CDS/CuckooHashingHLS/hls/hashing/solution1/.autopilot/db/jenkins_hash.pragma.2.c", metadata !"/home/aakash/Desktop/CDS/CuckooHashingHLS/hls", metadata !"clang version 3.1 ", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !17} ; [ DW_TAG_compile_unit ]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"jenkins_one_at_a_time", metadata !"jenkins_one_at_a_time", metadata !"", metadata !6, i32 6, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !15, i32 7} ; [ DW_TAG_subprogram ]
!6 = metadata !{i32 786473, metadata !"hashing/jenkins_hash.c", metadata !"/home/aakash/Desktop/CDS/CuckooHashingHLS/hls", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!8 = metadata !{metadata !9, metadata !11, metadata !12}
!9 = metadata !{i32 786454, null, metadata !"uint32_t", metadata !6, i32 51, i64 0, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_typedef ]
!10 = metadata !{i32 786468, null, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!11 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!12 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !13} ; [ DW_TAG_pointer_type ]
!13 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !14} ; [ DW_TAG_const_type ]
!14 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!15 = metadata !{metadata !16}
!16 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!17 = metadata !{metadata !18}
!18 = metadata !{metadata !19, metadata !22, metadata !23, metadata !24, metadata !26}
!19 = metadata !{i32 786484, i32 0, null, metadata !"_IO_2_1_stdin_", metadata !"_IO_2_1_stdin_", metadata !"", metadata !20, i32 315, metadata !21, i32 0, i32 1, null} ; [ DW_TAG_variable ]
!20 = metadata !{i32 786473, metadata !"/usr/include/libio.h", metadata !"/home/aakash/Desktop/CDS/CuckooHashingHLS/hls", null} ; [ DW_TAG_file_type ]
!21 = metadata !{i32 786451, null, metadata !"_IO_FILE_plus", metadata !20, i32 313, i32 0, i32 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ]
!22 = metadata !{i32 786484, i32 0, null, metadata !"_IO_2_1_stdout_", metadata !"_IO_2_1_stdout_", metadata !"", metadata !20, i32 316, metadata !21, i32 0, i32 1, null} ; [ DW_TAG_variable ]
!23 = metadata !{i32 786484, i32 0, null, metadata !"_IO_2_1_stderr_", metadata !"_IO_2_1_stderr_", metadata !"", metadata !20, i32 317, metadata !21, i32 0, i32 1, null} ; [ DW_TAG_variable ]
!24 = metadata !{i32 786484, i32 0, null, metadata !"sys_nerr", metadata !"sys_nerr", metadata !"", metadata !25, i32 26, metadata !11, i32 0, i32 1, null} ; [ DW_TAG_variable ]
!25 = metadata !{i32 786473, metadata !"/usr/include/x86_64-linux-gnu/bits/sys_errlist.h", metadata !"/home/aakash/Desktop/CDS/CuckooHashingHLS/hls", null} ; [ DW_TAG_file_type ]
!26 = metadata !{i32 786484, i32 0, null, metadata !"signgam", metadata !"signgam", metadata !"", metadata !27, i32 168, metadata !11, i32 0, i32 1, null} ; [ DW_TAG_variable ]
!27 = metadata !{i32 786473, metadata !"/usr/include/math.h", metadata !"/home/aakash/Desktop/CDS/CuckooHashingHLS/hls", null} ; [ DW_TAG_file_type ]
!28 = metadata !{null, metadata !29, metadata !30, metadata !31, metadata !32, metadata !33, metadata !34}
!29 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 1}
!30 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none"}
!31 = metadata !{metadata !"kernel_arg_type", metadata !"int", metadata !"char*"}
!32 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"const"}
!33 = metadata !{metadata !"kernel_arg_name", metadata !"length", metadata !"key"}
!34 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!35 = metadata !{metadata !36}
!36 = metadata !{i32 0, i32 31, metadata !37}
!37 = metadata !{metadata !38}
!38 = metadata !{metadata !"length", metadata !39, metadata !"int", i32 0, i32 31}
!39 = metadata !{metadata !40}
!40 = metadata !{i32 0, i32 0, i32 0}
!41 = metadata !{metadata !42}
!42 = metadata !{i32 0, i32 7, metadata !43}
!43 = metadata !{metadata !44}
!44 = metadata !{metadata !"key", metadata !45, metadata !"char", i32 0, i32 7}
!45 = metadata !{metadata !46}
!46 = metadata !{i32 0, i32 999, i32 1}
!47 = metadata !{metadata !48}
!48 = metadata !{i32 0, i32 31, metadata !49}
!49 = metadata !{metadata !50}
!50 = metadata !{metadata !"return", metadata !51, metadata !"uint32_t", i32 0, i32 31}
!51 = metadata !{metadata !52}
!52 = metadata !{i32 0, i32 1, i32 0}
!53 = metadata !{i32 786689, metadata !5, metadata !"length", metadata !6, i32 16777222, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!54 = metadata !{i32 6, i32 36, metadata !5, null}
!55 = metadata !{i32 786689, metadata !5, metadata !"key", null, i32 6, metadata !56, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!56 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 0, i64 0, i32 0, i32 0, metadata !13, metadata !57, i32 0, i32 0} ; [ DW_TAG_array_type ]
!57 = metadata !{metadata !58}
!58 = metadata !{i32 786465, i64 0, i64 999}      ; [ DW_TAG_subrange_type ]
!59 = metadata !{i32 6, i32 55, metadata !5, null}
!60 = metadata !{i32 11, i32 2, metadata !61, null}
!61 = metadata !{i32 786443, metadata !5, i32 7, i32 1, metadata !6, i32 0} ; [ DW_TAG_lexical_block ]
!62 = metadata !{i32 13, i32 3, metadata !63, null}
!63 = metadata !{i32 786443, metadata !61, i32 12, i32 2, metadata !6, i32 1} ; [ DW_TAG_lexical_block ]
!64 = metadata !{i32 786688, metadata !61, metadata !"i", metadata !6, i32 8, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!65 = metadata !{i32 786688, metadata !61, metadata !"hash", metadata !6, i32 9, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!66 = metadata !{i32 14, i32 3, metadata !63, null}
!67 = metadata !{i32 15, i32 3, metadata !63, null}
!68 = metadata !{i32 16, i32 2, metadata !63, null}
!69 = metadata !{i32 18, i32 2, metadata !61, null}
!70 = metadata !{i32 19, i32 2, metadata !61, null}
!71 = metadata !{i32 20, i32 2, metadata !61, null}
!72 = metadata !{i32 22, i32 2, metadata !61, null}
