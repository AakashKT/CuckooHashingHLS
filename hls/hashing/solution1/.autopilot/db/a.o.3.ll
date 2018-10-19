; ModuleID = '/home/aakash/Desktop/CDS/CuckooHashingHLS/hls/hashing/solution1/.autopilot/db/a.o.3.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@execute_str = internal unnamed_addr constant [8 x i8] c"execute\00" ; [#uses=1 type=[8 x i8]*]
@p_str24 = private unnamed_addr constant [10 x i8] c"ap_memory\00", align 1 ; [#uses=1 type=[10 x i8]*]
@p_str2 = private unnamed_addr constant [5 x i8] c"bram\00", align 1 ; [#uses=1 type=[5 x i8]*]
@p_str13 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1 ; [#uses=12 type=[1 x i8]*]

; [#uses=12]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=0]
define i32 @execute(i32 %op_type, i32 %hash, i32 %val_addr, [80 x i32]* %key_val_dram, [10 x i32]* %val_addr_bram) nounwind uwtable {
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %op_type) nounwind, !map !16
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %hash) nounwind, !map !22
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %val_addr) nounwind, !map !26
  call void (...)* @_ssdm_op_SpecBitsMap([80 x i32]* %key_val_dram) nounwind, !map !30
  call void (...)* @_ssdm_op_SpecBitsMap([10 x i32]* %val_addr_bram) nounwind, !map !36
  call void (...)* @_ssdm_op_SpecBitsMap(i32 0) nounwind, !map !42
  call void (...)* @_ssdm_op_SpecTopModule([8 x i8]* @execute_str) nounwind
  %val_addr_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %val_addr) nounwind ; [#uses=2 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %val_addr_read}, i64 0, metadata !48), !dbg !64 ; [debug line = 3:50] [debug variable = val_addr]
  %hash_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %hash) nounwind ; [#uses=2 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %hash_read}, i64 0, metadata !65), !dbg !66 ; [debug line = 3:33] [debug variable = hash]
  %op_type_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %op_type) nounwind ; [#uses=2 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %op_type_read}, i64 0, metadata !67), !dbg !68 ; [debug line = 3:19] [debug variable = op_type]
  call void @llvm.dbg.value(metadata !{i32 %op_type}, i64 0, metadata !67), !dbg !68 ; [debug line = 3:19] [debug variable = op_type]
  call void @llvm.dbg.value(metadata !{i32 %hash}, i64 0, metadata !65), !dbg !66 ; [debug line = 3:33] [debug variable = hash]
  call void @llvm.dbg.value(metadata !{i32 %val_addr}, i64 0, metadata !48), !dbg !64 ; [debug line = 3:50] [debug variable = val_addr]
  call void @llvm.dbg.value(metadata !{[80 x i32]* %key_val_dram}, i64 0, metadata !69), !dbg !73 ; [debug line = 4:6] [debug variable = key_val_dram]
  call void @llvm.dbg.value(metadata !{[10 x i32]* %val_addr_bram}, i64 0, metadata !74), !dbg !78 ; [debug line = 5:14] [debug variable = val_addr_bram]
  call void (...)* @_ssdm_op_SpecInterface([10 x i32]* %val_addr_bram, [5 x i8]* @p_str2, i32 0, i32 0, [1 x i8]* @p_str13, i32 0, i32 0, [1 x i8]* @p_str13, [1 x i8]* @p_str13, [1 x i8]* @p_str13, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str13, [1 x i8]* @p_str13) nounwind
  call void (...)* @_ssdm_op_SpecInterface([80 x i32]* %key_val_dram, [10 x i8]* @p_str24, i32 0, i32 0, [1 x i8]* @p_str13, i32 0, i32 0, [1 x i8]* @p_str13, [1 x i8]* @p_str13, [1 x i8]* @p_str13, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str13, [1 x i8]* @p_str13) nounwind
  %tmp = icmp eq i32 %op_type_read, 1, !dbg !79   ; [#uses=1 type=i1] [debug line = 9:2]
  br i1 %tmp, label %UnifiedReturnBlock, label %1, !dbg !79 ; [debug line = 9:2]

; <label>:1                                       ; preds = %0
  %tmp_1 = icmp eq i32 %op_type_read, 2, !dbg !81 ; [#uses=1 type=i1] [debug line = 13:7]
  %tmp_2 = zext i32 %val_addr_read to i64, !dbg !82 ; [#uses=1 type=i64] [debug line = 15:44]
  %key_val_dram_addr = getelementptr [80 x i32]* %key_val_dram, i64 0, i64 %tmp_2, !dbg !82 ; [#uses=2 type=i32*] [debug line = 15:44]
  %stored_hash = load i32* %key_val_dram_addr, align 4, !dbg !82 ; [#uses=1 type=i32] [debug line = 15:44]
  %tmp_3 = add i32 %val_addr_read, 40, !dbg !84   ; [#uses=1 type=i32] [debug line = 16:57]
  %tmp_4 = zext i32 %tmp_3 to i64, !dbg !84       ; [#uses=1 type=i64] [debug line = 16:57]
  %key_val_dram_addr_1 = getelementptr [80 x i32]* %key_val_dram, i64 0, i64 %tmp_4, !dbg !84 ; [#uses=1 type=i32*] [debug line = 16:57]
  %stored_val = load i32* %key_val_dram_addr_1, align 4, !dbg !84 ; [#uses=2 type=i32] [debug line = 16:57]
  %tmp_5 = icmp eq i32 %stored_hash, %hash_read, !dbg !85 ; [#uses=2 type=i1] [debug line = 18:3]
  br i1 %tmp_1, label %2, label %4, !dbg !81      ; [debug line = 13:7]

; <label>:2                                       ; preds = %1
  call void @llvm.dbg.value(metadata !{i32 %stored_hash}, i64 0, metadata !86), !dbg !82 ; [debug line = 15:44] [debug variable = stored_hash]
  call void @llvm.dbg.value(metadata !{i32 %stored_val}, i64 0, metadata !87), !dbg !84 ; [debug line = 16:57] [debug variable = stored_val]
  br i1 %tmp_5, label %3, label %._crit_edge1, !dbg !85 ; [debug line = 18:3]

; <label>:3                                       ; preds = %2
  %tmp_s = zext i32 %hash_read to i64, !dbg !88   ; [#uses=1 type=i64] [debug line = 19:4]
  %val_addr_bram_addr = getelementptr [10 x i32]* %val_addr_bram, i64 0, i64 %tmp_s, !dbg !88 ; [#uses=1 type=i32*] [debug line = 19:4]
  store i32 -1, i32* %val_addr_bram_addr, align 4, !dbg !88 ; [debug line = 19:4]
  store i32 -1, i32* %key_val_dram_addr, align 4, !dbg !90 ; [debug line = 20:4]
  br label %._crit_edge1, !dbg !91                ; [debug line = 21:3]

._crit_edge1:                                     ; preds = %3, %2
  br label %UnifiedReturnBlock, !dbg !92          ; [debug line = 23:3]

; <label>:4                                       ; preds = %1
  call void @llvm.dbg.value(metadata !{i32 %stored_hash}, i64 0, metadata !93), !dbg !95 ; [debug line = 28:44] [debug variable = stored_hash]
  call void @llvm.dbg.value(metadata !{i32 %stored_val}, i64 0, metadata !96), !dbg !97 ; [debug line = 29:57] [debug variable = stored_val]
  %stored_val2_0_s = select i1 %tmp_5, i32 %stored_val, i32 -1, !dbg !98 ; [#uses=1 type=i32] [debug line = 31:3]
  br label %UnifiedReturnBlock, !dbg !99          ; [debug line = 38:1]

UnifiedReturnBlock:                               ; preds = %4, %._crit_edge1, %0
  %UnifiedRetVal = phi i32 [ %stored_val2_0_s, %4 ], [ %stored_val, %._crit_edge1 ], [ -1, %0 ] ; [#uses=1 type=i32]
  ret i32 %UnifiedRetVal, !dbg !99                ; [debug line = 38:1]
}

; [#uses=1]
define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

; [#uses=2]
define weak void @_ssdm_op_SpecInterface(...) nounwind {
entry:
  ret void
}

; [#uses=6]
define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

; [#uses=3]
define weak i32 @_ssdm_op_Read.ap_auto.i32(i32) {
entry:
  ret i32 %0
}

!opencl.kernels = !{!0, !7, !10}
!hls.encrypted.func = !{}
!llvm.map.gv = !{}

!0 = metadata !{null, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5, metadata !6}
!1 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 1}
!2 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none"}
!3 = metadata !{metadata !"kernel_arg_type", metadata !"HASH", metadata !"VALUE_ADDR*"}
!4 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !""}
!5 = metadata !{metadata !"kernel_arg_name", metadata !"h", metadata !"val_addr_bram"}
!6 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!7 = metadata !{null, metadata !1, metadata !2, metadata !8, metadata !4, metadata !9, metadata !6}
!8 = metadata !{metadata !"kernel_arg_type", metadata !"int", metadata !"KEY*"}
!9 = metadata !{metadata !"kernel_arg_name", metadata !"length", metadata !"key"}
!10 = metadata !{null, metadata !11, metadata !12, metadata !13, metadata !14, metadata !15, metadata !6}
!11 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 0, i32 1, i32 1}
!12 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!13 = metadata !{metadata !"kernel_arg_type", metadata !"int", metadata !"HASH", metadata !"VALUE_ADDR", metadata !"KV*", metadata !"VALUE_ADDR*"}
!14 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !"", metadata !""}
!15 = metadata !{metadata !"kernel_arg_name", metadata !"op_type", metadata !"hash", metadata !"val_addr", metadata !"key_val_dram", metadata !"val_addr_bram"}
!16 = metadata !{metadata !17}
!17 = metadata !{i32 0, i32 31, metadata !18}
!18 = metadata !{metadata !19}
!19 = metadata !{metadata !"op_type", metadata !20, metadata !"int", i32 0, i32 31}
!20 = metadata !{metadata !21}
!21 = metadata !{i32 0, i32 0, i32 0}
!22 = metadata !{metadata !23}
!23 = metadata !{i32 0, i32 31, metadata !24}
!24 = metadata !{metadata !25}
!25 = metadata !{metadata !"hash", metadata !20, metadata !"unsigned int", i32 0, i32 31}
!26 = metadata !{metadata !27}
!27 = metadata !{i32 0, i32 31, metadata !28}
!28 = metadata !{metadata !29}
!29 = metadata !{metadata !"val_addr", metadata !20, metadata !"unsigned int", i32 0, i32 31}
!30 = metadata !{metadata !31}
!31 = metadata !{i32 0, i32 31, metadata !32}
!32 = metadata !{metadata !33}
!33 = metadata !{metadata !"key_val_dram", metadata !34, metadata !"unsigned int", i32 0, i32 31}
!34 = metadata !{metadata !35}
!35 = metadata !{i32 0, i32 79, i32 1}
!36 = metadata !{metadata !37}
!37 = metadata !{i32 0, i32 31, metadata !38}
!38 = metadata !{metadata !39}
!39 = metadata !{metadata !"val_addr_bram", metadata !40, metadata !"unsigned int", i32 0, i32 31}
!40 = metadata !{metadata !41}
!41 = metadata !{i32 0, i32 9, i32 1}
!42 = metadata !{metadata !43}
!43 = metadata !{i32 0, i32 31, metadata !44}
!44 = metadata !{metadata !45}
!45 = metadata !{metadata !"return", metadata !46, metadata !"VALUE", i32 0, i32 31}
!46 = metadata !{metadata !47}
!47 = metadata !{i32 0, i32 1, i32 0}
!48 = metadata !{i32 786689, metadata !49, metadata !"val_addr", metadata !50, i32 50331651, metadata !58, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!49 = metadata !{i32 786478, i32 0, metadata !50, metadata !"execute", metadata !"execute", metadata !"", metadata !50, i32 3, metadata !51, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !62, i32 6} ; [ DW_TAG_subprogram ]
!50 = metadata !{i32 786473, metadata !"hashing/execute.c", metadata !"/home/aakash/Desktop/CDS/CuckooHashingHLS/hls", null} ; [ DW_TAG_file_type ]
!51 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !52, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!52 = metadata !{metadata !53, metadata !56, metadata !57, metadata !58, metadata !59, metadata !61}
!53 = metadata !{i32 786454, null, metadata !"VALUE", metadata !50, i32 14, i64 0, i64 0, i64 0, i32 0, metadata !54} ; [ DW_TAG_typedef ]
!54 = metadata !{i32 786454, null, metadata !"uint32_t", metadata !50, i32 51, i64 0, i64 0, i64 0, i32 0, metadata !55} ; [ DW_TAG_typedef ]
!55 = metadata !{i32 786468, null, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!56 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!57 = metadata !{i32 786454, null, metadata !"HASH", metadata !50, i32 13, i64 0, i64 0, i64 0, i32 0, metadata !54} ; [ DW_TAG_typedef ]
!58 = metadata !{i32 786454, null, metadata !"VALUE_ADDR", metadata !50, i32 15, i64 0, i64 0, i64 0, i32 0, metadata !54} ; [ DW_TAG_typedef ]
!59 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !60} ; [ DW_TAG_pointer_type ]
!60 = metadata !{i32 786454, null, metadata !"KV", metadata !50, i32 16, i64 0, i64 0, i64 0, i32 0, metadata !54} ; [ DW_TAG_typedef ]
!61 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !58} ; [ DW_TAG_pointer_type ]
!62 = metadata !{metadata !63}
!63 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!64 = metadata !{i32 3, i32 50, metadata !49, null}
!65 = metadata !{i32 786689, metadata !49, metadata !"hash", metadata !50, i32 33554435, metadata !57, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!66 = metadata !{i32 3, i32 33, metadata !49, null}
!67 = metadata !{i32 786689, metadata !49, metadata !"op_type", metadata !50, i32 16777219, metadata !56, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!68 = metadata !{i32 3, i32 19, metadata !49, null}
!69 = metadata !{i32 786689, metadata !49, metadata !"key_val_dram", null, i32 4, metadata !70, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!70 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 0, i64 0, i32 0, i32 0, metadata !60, metadata !71, i32 0, i32 0} ; [ DW_TAG_array_type ]
!71 = metadata !{metadata !72}
!72 = metadata !{i32 786465, i64 0, i64 79}       ; [ DW_TAG_subrange_type ]
!73 = metadata !{i32 4, i32 6, metadata !49, null}
!74 = metadata !{i32 786689, metadata !49, metadata !"val_addr_bram", null, i32 5, metadata !75, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!75 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 0, i64 0, i32 0, i32 0, metadata !58, metadata !76, i32 0, i32 0} ; [ DW_TAG_array_type ]
!76 = metadata !{metadata !77}
!77 = metadata !{i32 786465, i64 0, i64 9}        ; [ DW_TAG_subrange_type ]
!78 = metadata !{i32 5, i32 14, metadata !49, null}
!79 = metadata !{i32 9, i32 2, metadata !80, null}
!80 = metadata !{i32 786443, metadata !49, i32 6, i32 1, metadata !50, i32 0} ; [ DW_TAG_lexical_block ]
!81 = metadata !{i32 13, i32 7, metadata !80, null}
!82 = metadata !{i32 15, i32 44, metadata !83, null}
!83 = metadata !{i32 786443, metadata !80, i32 14, i32 2, metadata !50, i32 2} ; [ DW_TAG_lexical_block ]
!84 = metadata !{i32 16, i32 57, metadata !83, null}
!85 = metadata !{i32 18, i32 3, metadata !83, null}
!86 = metadata !{i32 786688, metadata !83, metadata !"stored_hash", metadata !50, i32 15, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!87 = metadata !{i32 786688, metadata !83, metadata !"stored_val", metadata !50, i32 16, metadata !53, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!88 = metadata !{i32 19, i32 4, metadata !89, null}
!89 = metadata !{i32 786443, metadata !83, i32 18, i32 27, metadata !50, i32 3} ; [ DW_TAG_lexical_block ]
!90 = metadata !{i32 20, i32 4, metadata !89, null}
!91 = metadata !{i32 21, i32 3, metadata !89, null}
!92 = metadata !{i32 23, i32 3, metadata !83, null}
!93 = metadata !{i32 786688, metadata !94, metadata !"stored_hash", metadata !50, i32 28, metadata !57, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!94 = metadata !{i32 786443, metadata !80, i32 27, i32 2, metadata !50, i32 4} ; [ DW_TAG_lexical_block ]
!95 = metadata !{i32 28, i32 44, metadata !94, null}
!96 = metadata !{i32 786688, metadata !94, metadata !"stored_val", metadata !50, i32 29, metadata !53, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!97 = metadata !{i32 29, i32 57, metadata !94, null}
!98 = metadata !{i32 31, i32 3, metadata !94, null}
!99 = metadata !{i32 38, i32 1, metadata !80, null}
