; ModuleID = '/home/aakash/Desktop/CDS/CuckooHashingHLS/hls/hashing/solution1/.autopilot/db/a.g.1.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@execute.str = internal unnamed_addr constant [8 x i8] c"execute\00" ; [#uses=1 type=[8 x i8]*]
@.str24 = private unnamed_addr constant [10 x i8] c"ap_memory\00", align 1 ; [#uses=1 type=[10 x i8]*]
@.str2 = private unnamed_addr constant [5 x i8] c"bram\00", align 1 ; [#uses=1 type=[5 x i8]*]
@.str13 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1 ; [#uses=1 type=[1 x i8]*]

; [#uses=9]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=0]
define i32 @execute(i32 %op_type, i32 %hash, i32 %val_addr, i32* %key_val_dram, i32* %val_addr_bram) nounwind uwtable {
  call void (...)* @_ssdm_op_SpecBitsMap(i32 0) nounwind, !map !78
  call void (...)* @_ssdm_op_SpecTopModule([8 x i8]* @execute.str) nounwind
  call void @llvm.dbg.value(metadata !{i32 %op_type}, i64 0, metadata !84), !dbg !85 ; [debug line = 3:19] [debug variable = op_type]
  call void @llvm.dbg.value(metadata !{i32 %hash}, i64 0, metadata !86), !dbg !87 ; [debug line = 3:33] [debug variable = hash]
  call void @llvm.dbg.value(metadata !{i32 %val_addr}, i64 0, metadata !88), !dbg !89 ; [debug line = 3:50] [debug variable = val_addr]
  call void @llvm.dbg.value(metadata !{i32* %key_val_dram}, i64 0, metadata !90), !dbg !91 ; [debug line = 4:6] [debug variable = key_val_dram]
  call void @llvm.dbg.value(metadata !{i32* %val_addr_bram}, i64 0, metadata !92), !dbg !93 ; [debug line = 5:14] [debug variable = val_addr_bram]
  call void (...)* @_ssdm_SpecArrayDimSize(i32* %val_addr_bram, i32 10) nounwind, !dbg !94 ; [debug line = 6:2]
  call void (...)* @_ssdm_SpecArrayDimSize(i32* %key_val_dram, i32 80) nounwind, !dbg !96 ; [debug line = 6:56]
  call void (...)* @_ssdm_op_SpecInterface(i32* %val_addr_bram, i8* getelementptr inbounds ([5 x i8]* @.str2, i64 0, i64 0), i32 0, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str13, i64 0, i64 0), i32 0, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str13, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8]* @.str13, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8]* @.str13, i64 0, i64 0), i32 0, i32 0, i32 0, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str13, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8]* @.str13, i64 0, i64 0)) nounwind, !dbg !97 ; [debug line = 7:1]
  call void (...)* @_ssdm_op_SpecInterface(i32* %key_val_dram, i8* getelementptr inbounds ([10 x i8]* @.str24, i64 0, i64 0), i32 0, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str13, i64 0, i64 0), i32 0, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str13, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8]* @.str13, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8]* @.str13, i64 0, i64 0), i32 0, i32 0, i32 0, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str13, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8]* @.str13, i64 0, i64 0)) nounwind, !dbg !98 ; [debug line = 8:1]
  %tmp = icmp eq i32 %op_type, 1, !dbg !99        ; [#uses=1 type=i1] [debug line = 9:2]
  br i1 %tmp, label %._crit_edge, label %1, !dbg !99 ; [debug line = 9:2]

; <label>:1                                       ; preds = %0
  %tmp.1 = icmp eq i32 %op_type, 2, !dbg !100     ; [#uses=1 type=i1] [debug line = 13:7]
  br i1 %tmp.1, label %2, label %4, !dbg !100     ; [debug line = 13:7]

; <label>:2                                       ; preds = %1
  %tmp.2 = zext i32 %val_addr to i64, !dbg !101   ; [#uses=1 type=i64] [debug line = 15:44]
  %key_val_dram.addr = getelementptr inbounds i32* %key_val_dram, i64 %tmp.2, !dbg !101 ; [#uses=2 type=i32*] [debug line = 15:44]
  %stored_hash = load i32* %key_val_dram.addr, align 4, !dbg !101 ; [#uses=2 type=i32] [debug line = 15:44]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %stored_hash) nounwind
  call void @llvm.dbg.value(metadata !{i32 %stored_hash}, i64 0, metadata !103), !dbg !101 ; [debug line = 15:44] [debug variable = stored_hash]
  %tmp.3 = add i32 %val_addr, 40, !dbg !104       ; [#uses=1 type=i32] [debug line = 16:57]
  %tmp.4 = zext i32 %tmp.3 to i64, !dbg !104      ; [#uses=1 type=i64] [debug line = 16:57]
  %key_val_dram.addr.1 = getelementptr inbounds i32* %key_val_dram, i64 %tmp.4, !dbg !104 ; [#uses=1 type=i32*] [debug line = 16:57]
  %stored_val = load i32* %key_val_dram.addr.1, align 4, !dbg !104 ; [#uses=2 type=i32] [debug line = 16:57]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %stored_val) nounwind
  call void @llvm.dbg.value(metadata !{i32 %stored_val}, i64 0, metadata !105), !dbg !104 ; [debug line = 16:57] [debug variable = stored_val]
  %tmp.5 = icmp eq i32 %stored_hash, %hash, !dbg !106 ; [#uses=1 type=i1] [debug line = 18:3]
  br i1 %tmp.5, label %3, label %._crit_edge1, !dbg !106 ; [debug line = 18:3]

; <label>:3                                       ; preds = %2
  %tmp.10 = zext i32 %hash to i64, !dbg !107      ; [#uses=1 type=i64] [debug line = 19:4]
  %val_addr_bram.addr = getelementptr inbounds i32* %val_addr_bram, i64 %tmp.10, !dbg !107 ; [#uses=1 type=i32*] [debug line = 19:4]
  store i32 -1, i32* %val_addr_bram.addr, align 4, !dbg !107 ; [debug line = 19:4]
  store i32 -1, i32* %key_val_dram.addr, align 4, !dbg !109 ; [debug line = 20:4]
  br label %._crit_edge1, !dbg !110               ; [debug line = 21:3]

._crit_edge1:                                     ; preds = %3, %2
  br label %._crit_edge, !dbg !111                ; [debug line = 23:3]

; <label>:4                                       ; preds = %1
  %tmp.6 = zext i32 %val_addr to i64, !dbg !112   ; [#uses=1 type=i64] [debug line = 28:44]
  %key_val_dram.addr.2 = getelementptr inbounds i32* %key_val_dram, i64 %tmp.6, !dbg !112 ; [#uses=1 type=i32*] [debug line = 28:44]
  %stored_hash.1 = load i32* %key_val_dram.addr.2, align 4, !dbg !112 ; [#uses=2 type=i32] [debug line = 28:44]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %stored_hash.1) nounwind
  call void @llvm.dbg.value(metadata !{i32 %stored_hash.1}, i64 0, metadata !114), !dbg !112 ; [debug line = 28:44] [debug variable = stored_hash]
  %tmp.7 = add i32 %val_addr, 40, !dbg !115       ; [#uses=1 type=i32] [debug line = 29:57]
  %tmp.8 = zext i32 %tmp.7 to i64, !dbg !115      ; [#uses=1 type=i64] [debug line = 29:57]
  %key_val_dram.addr.3 = getelementptr inbounds i32* %key_val_dram, i64 %tmp.8, !dbg !115 ; [#uses=1 type=i32*] [debug line = 29:57]
  %stored_val.1 = load i32* %key_val_dram.addr.3, align 4, !dbg !115 ; [#uses=2 type=i32] [debug line = 29:57]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %stored_val.1) nounwind
  call void @llvm.dbg.value(metadata !{i32 %stored_val.1}, i64 0, metadata !116), !dbg !115 ; [debug line = 29:57] [debug variable = stored_val]
  %tmp.9 = icmp eq i32 %stored_hash.1, %hash, !dbg !117 ; [#uses=1 type=i1] [debug line = 31:3]
  %stored_val2.0. = select i1 %tmp.9, i32 %stored_val.1, i32 -1, !dbg !117 ; [#uses=1 type=i32] [debug line = 31:3]
  ret i32 %stored_val2.0., !dbg !117              ; [debug line = 31:3]

._crit_edge:                                      ; preds = %._crit_edge1, %0
  %.0 = phi i32 [ %stored_val, %._crit_edge1 ], [ -1, %0 ] ; [#uses=1 type=i32]
  ret i32 %.0, !dbg !118                          ; [debug line = 38:1]
}

; [#uses=1]
declare void @_ssdm_op_SpecTopModule(...)

; [#uses=2]
declare void @_ssdm_op_SpecInterface(...) nounwind

; [#uses=1]
declare void @_ssdm_op_SpecBitsMap(...)

; [#uses=4]
declare void @_ssdm_SpecKeepArrayLoad(...)

; [#uses=2]
declare void @_ssdm_SpecArrayDimSize(...) nounwind

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
!78 = metadata !{metadata !79}
!79 = metadata !{i32 0, i32 31, metadata !80}
!80 = metadata !{metadata !81}
!81 = metadata !{metadata !"return", metadata !82, metadata !"VALUE", i32 0, i32 31}
!82 = metadata !{metadata !83}
!83 = metadata !{i32 0, i32 1, i32 0}
!84 = metadata !{i32 786689, metadata !48, metadata !"op_type", metadata !49, i32 16777219, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!85 = metadata !{i32 3, i32 19, metadata !48, null}
!86 = metadata !{i32 786689, metadata !48, metadata !"hash", metadata !49, i32 33554435, metadata !54, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!87 = metadata !{i32 3, i32 33, metadata !48, null}
!88 = metadata !{i32 786689, metadata !48, metadata !"val_addr", metadata !49, i32 50331651, metadata !55, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!89 = metadata !{i32 3, i32 50, metadata !48, null}
!90 = metadata !{i32 786689, metadata !48, metadata !"key_val_dram", metadata !49, i32 67108868, metadata !56, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!91 = metadata !{i32 4, i32 6, metadata !48, null}
!92 = metadata !{i32 786689, metadata !48, metadata !"val_addr_bram", metadata !49, i32 83886085, metadata !58, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!93 = metadata !{i32 5, i32 14, metadata !48, null}
!94 = metadata !{i32 6, i32 2, metadata !95, null}
!95 = metadata !{i32 786443, metadata !48, i32 6, i32 1, metadata !49, i32 0} ; [ DW_TAG_lexical_block ]
!96 = metadata !{i32 6, i32 56, metadata !95, null}
!97 = metadata !{i32 7, i32 1, metadata !95, null}
!98 = metadata !{i32 8, i32 1, metadata !95, null}
!99 = metadata !{i32 9, i32 2, metadata !95, null}
!100 = metadata !{i32 13, i32 7, metadata !95, null}
!101 = metadata !{i32 15, i32 44, metadata !102, null}
!102 = metadata !{i32 786443, metadata !95, i32 14, i32 2, metadata !49, i32 2} ; [ DW_TAG_lexical_block ]
!103 = metadata !{i32 786688, metadata !102, metadata !"stored_hash", metadata !49, i32 15, metadata !54, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!104 = metadata !{i32 16, i32 57, metadata !102, null}
!105 = metadata !{i32 786688, metadata !102, metadata !"stored_val", metadata !49, i32 16, metadata !52, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!106 = metadata !{i32 18, i32 3, metadata !102, null}
!107 = metadata !{i32 19, i32 4, metadata !108, null}
!108 = metadata !{i32 786443, metadata !102, i32 18, i32 27, metadata !49, i32 3} ; [ DW_TAG_lexical_block ]
!109 = metadata !{i32 20, i32 4, metadata !108, null}
!110 = metadata !{i32 21, i32 3, metadata !108, null}
!111 = metadata !{i32 23, i32 3, metadata !102, null}
!112 = metadata !{i32 28, i32 44, metadata !113, null}
!113 = metadata !{i32 786443, metadata !95, i32 27, i32 2, metadata !49, i32 4} ; [ DW_TAG_lexical_block ]
!114 = metadata !{i32 786688, metadata !113, metadata !"stored_hash", metadata !49, i32 28, metadata !54, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!115 = metadata !{i32 29, i32 57, metadata !113, null}
!116 = metadata !{i32 786688, metadata !113, metadata !"stored_val", metadata !49, i32 29, metadata !52, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!117 = metadata !{i32 31, i32 3, metadata !113, null}
!118 = metadata !{i32 38, i32 1, metadata !95, null}
