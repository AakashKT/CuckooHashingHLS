; ModuleID = '/home/aakash/Desktop/CDS/CuckooHashingHLS/hls/hashing/solution1/.autopilot/db/a.g.1.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@jenkins_one_at_a_time.str = internal unnamed_addr constant [22 x i8] c"jenkins_one_at_a_time\00" ; [#uses=1 type=[22 x i8]*]

; [#uses=9]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=0]
define i32 @jenkins_one_at_a_time(i32 %length, i8* %key) nounwind uwtable {
  call void (...)* @_ssdm_op_SpecBitsMap(i32 0) nounwind, !map !35
  call void (...)* @_ssdm_op_SpecTopModule([22 x i8]* @jenkins_one_at_a_time.str) nounwind
  call void @llvm.dbg.value(metadata !{i32 %length}, i64 0, metadata !41), !dbg !42 ; [debug line = 6:36] [debug variable = length]
  call void @llvm.dbg.value(metadata !{i8* %key}, i64 0, metadata !43), !dbg !44 ; [debug line = 6:55] [debug variable = key]
  call void (...)* @_ssdm_SpecArrayDimSize(i8* %key, i32 1000) nounwind, !dbg !45 ; [debug line = 7:2]
  br label %1, !dbg !47                           ; [debug line = 11:2]

; <label>:1                                       ; preds = %2, %0
  %i = phi i32 [ 0, %0 ], [ %i.1, %2 ]            ; [#uses=3 type=i32]
  %hash = phi i32 [ 0, %0 ], [ %hash.6, %2 ]      ; [#uses=2 type=i32]
  %tmp = icmp eq i32 %i, %length, !dbg !47        ; [#uses=1 type=i1] [debug line = 11:2]
  br i1 %tmp, label %3, label %2, !dbg !47        ; [debug line = 11:2]

; <label>:2                                       ; preds = %1
  %i.1 = add nsw i32 %i, 1, !dbg !48              ; [#uses=1 type=i32] [debug line = 13:3]
  call void @llvm.dbg.value(metadata !{i32 %i.1}, i64 0, metadata !50), !dbg !48 ; [debug line = 13:3] [debug variable = i]
  %tmp.8 = sext i32 %i to i64, !dbg !48           ; [#uses=1 type=i64] [debug line = 13:3]
  %key.addr = getelementptr inbounds i8* %key, i64 %tmp.8, !dbg !48 ; [#uses=1 type=i8*] [debug line = 13:3]
  %key.load = load i8* %key.addr, align 1, !dbg !48 ; [#uses=2 type=i8] [debug line = 13:3]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i8 %key.load) nounwind
  %tmp.9 = sext i8 %key.load to i32, !dbg !48     ; [#uses=1 type=i32] [debug line = 13:3]
  %hash.4 = add i32 %tmp.9, %hash, !dbg !48       ; [#uses=2 type=i32] [debug line = 13:3]
  call void @llvm.dbg.value(metadata !{i32 %hash.4}, i64 0, metadata !51), !dbg !48 ; [debug line = 13:3] [debug variable = hash]
  %tmp.11 = shl i32 %hash.4, 10, !dbg !52         ; [#uses=1 type=i32] [debug line = 14:3]
  %hash.5 = add i32 %tmp.11, %hash.4, !dbg !52    ; [#uses=2 type=i32] [debug line = 14:3]
  call void @llvm.dbg.value(metadata !{i32 %hash.5}, i64 0, metadata !51), !dbg !52 ; [debug line = 14:3] [debug variable = hash]
  %tmp.13 = lshr i32 %hash.5, 6, !dbg !53         ; [#uses=1 type=i32] [debug line = 15:3]
  %hash.6 = xor i32 %tmp.13, %hash.5, !dbg !53    ; [#uses=1 type=i32] [debug line = 15:3]
  call void @llvm.dbg.value(metadata !{i32 %hash.6}, i64 0, metadata !51), !dbg !53 ; [debug line = 15:3] [debug variable = hash]
  br label %1, !dbg !54                           ; [debug line = 16:2]

; <label>:3                                       ; preds = %1
  %hash.0.lcssa = phi i32 [ %hash, %1 ]           ; [#uses=2 type=i32]
  %tmp.1 = shl i32 %hash.0.lcssa, 3, !dbg !55     ; [#uses=1 type=i32] [debug line = 18:2]
  %hash.1 = add i32 %tmp.1, %hash.0.lcssa, !dbg !55 ; [#uses=2 type=i32] [debug line = 18:2]
  call void @llvm.dbg.value(metadata !{i32 %hash.1}, i64 0, metadata !51), !dbg !55 ; [debug line = 18:2] [debug variable = hash]
  %tmp.3 = lshr i32 %hash.1, 11, !dbg !56         ; [#uses=1 type=i32] [debug line = 19:2]
  %hash.2 = xor i32 %tmp.3, %hash.1, !dbg !56     ; [#uses=2 type=i32] [debug line = 19:2]
  call void @llvm.dbg.value(metadata !{i32 %hash.2}, i64 0, metadata !51), !dbg !56 ; [debug line = 19:2] [debug variable = hash]
  %tmp.5 = mul i32 %hash.2, 32768, !dbg !57       ; [#uses=1 type=i32] [debug line = 20:2]
  %hash.3 = add i32 %tmp.5, %hash.2, !dbg !57     ; [#uses=1 type=i32] [debug line = 20:2]
  call void @llvm.dbg.value(metadata !{i32 %hash.3}, i64 0, metadata !51), !dbg !57 ; [debug line = 20:2] [debug variable = hash]
  ret i32 %hash.3, !dbg !58                       ; [debug line = 22:2]
}

; [#uses=1]
declare void @_ssdm_op_SpecTopModule(...)

; [#uses=1]
declare void @_ssdm_op_SpecBitsMap(...)

; [#uses=1]
declare void @_ssdm_SpecKeepArrayLoad(...)

; [#uses=1]
declare void @_ssdm_SpecArrayDimSize(...) nounwind

!llvm.dbg.cu = !{!0}
!opencl.kernels = !{!28}
!hls.encrypted.func = !{}

!0 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/aakash/Desktop/CDS/CuckooHashingHLS/hls/hashing/solution1/.autopilot/db/jenkins_hash.pragma.2.c", metadata !"/home/aakash/Desktop/CDS/CuckooHashingHLS/hls", metadata !"clang version 3.1 ", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !17} ; [ DW_TAG_compile_unit ]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"jenkins_one_at_a_time", metadata !"jenkins_one_at_a_time", metadata !"", metadata !6, i32 6, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8*)* @jenkins_one_at_a_time, null, null, metadata !15, i32 7} ; [ DW_TAG_subprogram ]
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
!28 = metadata !{i32 (i32, i8*)* @jenkins_one_at_a_time, metadata !29, metadata !30, metadata !31, metadata !32, metadata !33, metadata !34}
!29 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 1}
!30 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none"}
!31 = metadata !{metadata !"kernel_arg_type", metadata !"int", metadata !"char*"}
!32 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"const"}
!33 = metadata !{metadata !"kernel_arg_name", metadata !"length", metadata !"key"}
!34 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!35 = metadata !{metadata !36}
!36 = metadata !{i32 0, i32 31, metadata !37}
!37 = metadata !{metadata !38}
!38 = metadata !{metadata !"return", metadata !39, metadata !"uint32_t", i32 0, i32 31}
!39 = metadata !{metadata !40}
!40 = metadata !{i32 0, i32 1, i32 0}
!41 = metadata !{i32 786689, metadata !5, metadata !"length", metadata !6, i32 16777222, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!42 = metadata !{i32 6, i32 36, metadata !5, null}
!43 = metadata !{i32 786689, metadata !5, metadata !"key", metadata !6, i32 33554438, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!44 = metadata !{i32 6, i32 55, metadata !5, null}
!45 = metadata !{i32 7, i32 2, metadata !46, null}
!46 = metadata !{i32 786443, metadata !5, i32 7, i32 1, metadata !6, i32 0} ; [ DW_TAG_lexical_block ]
!47 = metadata !{i32 11, i32 2, metadata !46, null}
!48 = metadata !{i32 13, i32 3, metadata !49, null}
!49 = metadata !{i32 786443, metadata !46, i32 12, i32 2, metadata !6, i32 1} ; [ DW_TAG_lexical_block ]
!50 = metadata !{i32 786688, metadata !46, metadata !"i", metadata !6, i32 8, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!51 = metadata !{i32 786688, metadata !46, metadata !"hash", metadata !6, i32 9, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!52 = metadata !{i32 14, i32 3, metadata !49, null}
!53 = metadata !{i32 15, i32 3, metadata !49, null}
!54 = metadata !{i32 16, i32 2, metadata !49, null}
!55 = metadata !{i32 18, i32 2, metadata !46, null}
!56 = metadata !{i32 19, i32 2, metadata !46, null}
!57 = metadata !{i32 20, i32 2, metadata !46, null}
!58 = metadata !{i32 22, i32 2, metadata !46, null}
