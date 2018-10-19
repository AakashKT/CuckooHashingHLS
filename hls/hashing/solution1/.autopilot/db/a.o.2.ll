; ModuleID = '/home/aakash/Desktop/CDS/CuckooHashingHLS/hls/hashing/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@execute.str = internal unnamed_addr constant [8 x i8] c"execute\00" ; [#uses=1 type=[8 x i8]*]
@.str24 = private unnamed_addr constant [10 x i8] c"ap_memory\00", align 1 ; [#uses=1 type=[10 x i8]*]
@.str2 = private unnamed_addr constant [5 x i8] c"bram\00", align 1 ; [#uses=1 type=[5 x i8]*]
@.str13 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1 ; [#uses=12 type=[1 x i8]*]

; [#uses=9]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=0]
define i32 @execute(i32 %op_type, i32 %hash, i32 %val_addr, [80 x i32]* %key_val_dram, [10 x i32]* %val_addr_bram) nounwind uwtable {
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %op_type) nounwind, !map !78
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %hash) nounwind, !map !84
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %val_addr) nounwind, !map !88
  call void (...)* @_ssdm_op_SpecBitsMap([80 x i32]* %key_val_dram) nounwind, !map !92
  call void (...)* @_ssdm_op_SpecBitsMap([10 x i32]* %val_addr_bram) nounwind, !map !98
  call void (...)* @_ssdm_op_SpecBitsMap(i32 0) nounwind, !map !104
  call void (...)* @_ssdm_op_SpecTopModule([8 x i8]* @execute.str) nounwind
  call void @llvm.dbg.value(metadata !{i32 %op_type}, i64 0, metadata !110), !dbg !111 ; [debug line = 3:19] [debug variable = op_type]
  call void @llvm.dbg.value(metadata !{i32 %hash}, i64 0, metadata !112), !dbg !113 ; [debug line = 3:33] [debug variable = hash]
  call void @llvm.dbg.value(metadata !{i32 %val_addr}, i64 0, metadata !114), !dbg !115 ; [debug line = 3:50] [debug variable = val_addr]
  call void @llvm.dbg.value(metadata !{[80 x i32]* %key_val_dram}, i64 0, metadata !116), !dbg !120 ; [debug line = 4:6] [debug variable = key_val_dram]
  call void @llvm.dbg.value(metadata !{[10 x i32]* %val_addr_bram}, i64 0, metadata !121), !dbg !125 ; [debug line = 5:14] [debug variable = val_addr_bram]
  call void (...)* @_ssdm_op_SpecInterface([10 x i32]* %val_addr_bram, [5 x i8]* @.str2, i32 0, i32 0, [1 x i8]* @.str13, i32 0, i32 0, [1 x i8]* @.str13, [1 x i8]* @.str13, [1 x i8]* @.str13, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @.str13, [1 x i8]* @.str13) nounwind
  call void (...)* @_ssdm_op_SpecInterface([80 x i32]* %key_val_dram, [10 x i8]* @.str24, i32 0, i32 0, [1 x i8]* @.str13, i32 0, i32 0, [1 x i8]* @.str13, [1 x i8]* @.str13, [1 x i8]* @.str13, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @.str13, [1 x i8]* @.str13) nounwind
  %tmp = icmp eq i32 %op_type, 1, !dbg !126       ; [#uses=1 type=i1] [debug line = 9:2]
  br i1 %tmp, label %UnifiedReturnBlock, label %1, !dbg !126 ; [debug line = 9:2]

; <label>:1                                       ; preds = %0
  %tmp.1 = icmp eq i32 %op_type, 2, !dbg !128     ; [#uses=1 type=i1] [debug line = 13:7]
  %tmp.2 = zext i32 %val_addr to i64, !dbg !129   ; [#uses=1 type=i64] [debug line = 15:44]
  %key_val_dram.addr = getelementptr [80 x i32]* %key_val_dram, i64 0, i64 %tmp.2, !dbg !129 ; [#uses=2 type=i32*] [debug line = 15:44]
  %stored_hash = load i32* %key_val_dram.addr, align 4, !dbg !129 ; [#uses=1 type=i32] [debug line = 15:44]
  %tmp.3 = add i32 %val_addr, 40, !dbg !131       ; [#uses=1 type=i32] [debug line = 16:57]
  %tmp.4 = zext i32 %tmp.3 to i64, !dbg !131      ; [#uses=1 type=i64] [debug line = 16:57]
  %key_val_dram.addr.1 = getelementptr [80 x i32]* %key_val_dram, i64 0, i64 %tmp.4, !dbg !131 ; [#uses=1 type=i32*] [debug line = 16:57]
  %stored_val = load i32* %key_val_dram.addr.1, align 4, !dbg !131 ; [#uses=2 type=i32] [debug line = 16:57]
  %tmp.5 = icmp eq i32 %stored_hash, %hash, !dbg !132 ; [#uses=2 type=i1] [debug line = 18:3]
  br i1 %tmp.1, label %2, label %4, !dbg !128     ; [debug line = 13:7]

; <label>:2                                       ; preds = %1
  call void @llvm.dbg.value(metadata !{i32 %stored_hash}, i64 0, metadata !133), !dbg !129 ; [debug line = 15:44] [debug variable = stored_hash]
  call void @llvm.dbg.value(metadata !{i32 %stored_val}, i64 0, metadata !134), !dbg !131 ; [debug line = 16:57] [debug variable = stored_val]
  br i1 %tmp.5, label %3, label %._crit_edge1, !dbg !132 ; [debug line = 18:3]

; <label>:3                                       ; preds = %2
  %tmp. = zext i32 %hash to i64, !dbg !135        ; [#uses=1 type=i64] [debug line = 19:4]
  %val_addr_bram.addr = getelementptr [10 x i32]* %val_addr_bram, i64 0, i64 %tmp., !dbg !135 ; [#uses=1 type=i32*] [debug line = 19:4]
  store i32 -1, i32* %val_addr_bram.addr, align 4, !dbg !135 ; [debug line = 19:4]
  store i32 -1, i32* %key_val_dram.addr, align 4, !dbg !137 ; [debug line = 20:4]
  br label %._crit_edge1, !dbg !138               ; [debug line = 21:3]

._crit_edge1:                                     ; preds = %3, %2
  br label %UnifiedReturnBlock, !dbg !139         ; [debug line = 23:3]

; <label>:4                                       ; preds = %1
  call void @llvm.dbg.value(metadata !{i32 %stored_hash}, i64 0, metadata !140), !dbg !142 ; [debug line = 28:44] [debug variable = stored_hash]
  call void @llvm.dbg.value(metadata !{i32 %stored_val}, i64 0, metadata !143), !dbg !144 ; [debug line = 29:57] [debug variable = stored_val]
  %stored_val2.0. = select i1 %tmp.5, i32 %stored_val, i32 -1, !dbg !145 ; [#uses=1 type=i32] [debug line = 31:3]
  br label %UnifiedReturnBlock, !dbg !146         ; [debug line = 38:1]

UnifiedReturnBlock:                               ; preds = %4, %._crit_edge1, %0
  %UnifiedRetVal = phi i32 [ %stored_val2.0., %4 ], [ %stored_val, %._crit_edge1 ], [ -1, %0 ] ; [#uses=1 type=i32]
  ret i32 %UnifiedRetVal, !dbg !146               ; [debug line = 38:1]
}

; [#uses=1]
declare void @_ssdm_op_SpecTopModule(...)

; [#uses=2]
declare void @_ssdm_op_SpecInterface(...) nounwind

; [#uses=6]
declare void @_ssdm_op_SpecBitsMap(...)

!llvm.dbg.cu = !{!0, !31, !45}
!opencl.kernels = !{!62, !69, !72}
!hls.encrypted.func = !{}
!llvm.map.gv = !{}

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
!48 = metadata !{i32 786478, i32 0, metadata !49, metadata !"execute", metadata !"execute", metadata !"", metadata !49, i32 3, metadata !50, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !14, i32 6} ; [ DW_TAG_subprogram ]
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
!72 = metadata !{null, metadata !73, metadata !74, metadata !75, metadata !76, metadata !77, metadata !68}
!73 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 0, i32 1, i32 1}
!74 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!75 = metadata !{metadata !"kernel_arg_type", metadata !"int", metadata !"HASH", metadata !"VALUE_ADDR", metadata !"KV*", metadata !"VALUE_ADDR*"}
!76 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !"", metadata !""}
!77 = metadata !{metadata !"kernel_arg_name", metadata !"op_type", metadata !"hash", metadata !"val_addr", metadata !"key_val_dram", metadata !"val_addr_bram"}
!78 = metadata !{metadata !79}
!79 = metadata !{i32 0, i32 31, metadata !80}
!80 = metadata !{metadata !81}
!81 = metadata !{metadata !"op_type", metadata !82, metadata !"int", i32 0, i32 31}
!82 = metadata !{metadata !83}
!83 = metadata !{i32 0, i32 0, i32 0}
!84 = metadata !{metadata !85}
!85 = metadata !{i32 0, i32 31, metadata !86}
!86 = metadata !{metadata !87}
!87 = metadata !{metadata !"hash", metadata !82, metadata !"unsigned int", i32 0, i32 31}
!88 = metadata !{metadata !89}
!89 = metadata !{i32 0, i32 31, metadata !90}
!90 = metadata !{metadata !91}
!91 = metadata !{metadata !"val_addr", metadata !82, metadata !"unsigned int", i32 0, i32 31}
!92 = metadata !{metadata !93}
!93 = metadata !{i32 0, i32 31, metadata !94}
!94 = metadata !{metadata !95}
!95 = metadata !{metadata !"key_val_dram", metadata !96, metadata !"unsigned int", i32 0, i32 31}
!96 = metadata !{metadata !97}
!97 = metadata !{i32 0, i32 79, i32 1}
!98 = metadata !{metadata !99}
!99 = metadata !{i32 0, i32 31, metadata !100}
!100 = metadata !{metadata !101}
!101 = metadata !{metadata !"val_addr_bram", metadata !102, metadata !"unsigned int", i32 0, i32 31}
!102 = metadata !{metadata !103}
!103 = metadata !{i32 0, i32 9, i32 1}
!104 = metadata !{metadata !105}
!105 = metadata !{i32 0, i32 31, metadata !106}
!106 = metadata !{metadata !107}
!107 = metadata !{metadata !"return", metadata !108, metadata !"VALUE", i32 0, i32 31}
!108 = metadata !{metadata !109}
!109 = metadata !{i32 0, i32 1, i32 0}
!110 = metadata !{i32 786689, metadata !48, metadata !"op_type", metadata !49, i32 16777219, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!111 = metadata !{i32 3, i32 19, metadata !48, null}
!112 = metadata !{i32 786689, metadata !48, metadata !"hash", metadata !49, i32 33554435, metadata !54, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!113 = metadata !{i32 3, i32 33, metadata !48, null}
!114 = metadata !{i32 786689, metadata !48, metadata !"val_addr", metadata !49, i32 50331651, metadata !55, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!115 = metadata !{i32 3, i32 50, metadata !48, null}
!116 = metadata !{i32 786689, metadata !48, metadata !"key_val_dram", null, i32 4, metadata !117, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!117 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 0, i64 0, i32 0, i32 0, metadata !57, metadata !118, i32 0, i32 0} ; [ DW_TAG_array_type ]
!118 = metadata !{metadata !119}
!119 = metadata !{i32 786465, i64 0, i64 79}      ; [ DW_TAG_subrange_type ]
!120 = metadata !{i32 4, i32 6, metadata !48, null}
!121 = metadata !{i32 786689, metadata !48, metadata !"val_addr_bram", null, i32 5, metadata !122, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!122 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 0, i64 0, i32 0, i32 0, metadata !55, metadata !123, i32 0, i32 0} ; [ DW_TAG_array_type ]
!123 = metadata !{metadata !124}
!124 = metadata !{i32 786465, i64 0, i64 9}       ; [ DW_TAG_subrange_type ]
!125 = metadata !{i32 5, i32 14, metadata !48, null}
!126 = metadata !{i32 9, i32 2, metadata !127, null}
!127 = metadata !{i32 786443, metadata !48, i32 6, i32 1, metadata !49, i32 0} ; [ DW_TAG_lexical_block ]
!128 = metadata !{i32 13, i32 7, metadata !127, null}
!129 = metadata !{i32 15, i32 44, metadata !130, null}
!130 = metadata !{i32 786443, metadata !127, i32 14, i32 2, metadata !49, i32 2} ; [ DW_TAG_lexical_block ]
!131 = metadata !{i32 16, i32 57, metadata !130, null}
!132 = metadata !{i32 18, i32 3, metadata !130, null}
!133 = metadata !{i32 786688, metadata !130, metadata !"stored_hash", metadata !49, i32 15, metadata !54, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!134 = metadata !{i32 786688, metadata !130, metadata !"stored_val", metadata !49, i32 16, metadata !52, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!135 = metadata !{i32 19, i32 4, metadata !136, null}
!136 = metadata !{i32 786443, metadata !130, i32 18, i32 27, metadata !49, i32 3} ; [ DW_TAG_lexical_block ]
!137 = metadata !{i32 20, i32 4, metadata !136, null}
!138 = metadata !{i32 21, i32 3, metadata !136, null}
!139 = metadata !{i32 23, i32 3, metadata !130, null}
!140 = metadata !{i32 786688, metadata !141, metadata !"stored_hash", metadata !49, i32 28, metadata !54, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!141 = metadata !{i32 786443, metadata !127, i32 27, i32 2, metadata !49, i32 4} ; [ DW_TAG_lexical_block ]
!142 = metadata !{i32 28, i32 44, metadata !141, null}
!143 = metadata !{i32 786688, metadata !141, metadata !"stored_val", metadata !49, i32 29, metadata !52, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!144 = metadata !{i32 29, i32 57, metadata !141, null}
!145 = metadata !{i32 31, i32 3, metadata !141, null}
!146 = metadata !{i32 38, i32 1, metadata !127, null}
