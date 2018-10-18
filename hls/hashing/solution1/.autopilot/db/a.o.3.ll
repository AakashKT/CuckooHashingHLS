; ModuleID = '/home/aakash/Desktop/CDS/CuckooHashingHLS/hls/hashing/solution1/.autopilot/db/a.o.3.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@jenkins_one_at_a_tim = internal unnamed_addr constant [22 x i8] c"jenkins_one_at_a_time\00" ; [#uses=1 type=[22 x i8]*]

; [#uses=2]
declare i32 @llvm.part.select.i32(i32, i32, i32) nounwind readnone

; [#uses=10]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=0]
define i32 @jenkins_one_at_a_time(i32 %length, [1000 x i8]* %key) nounwind uwtable readonly {
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %length) nounwind, !map !7
  call void (...)* @_ssdm_op_SpecBitsMap([1000 x i8]* %key) nounwind, !map !13
  call void (...)* @_ssdm_op_SpecBitsMap(i32 0) nounwind, !map !19
  call void (...)* @_ssdm_op_SpecTopModule([22 x i8]* @jenkins_one_at_a_tim) nounwind
  %length_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %length) nounwind ; [#uses=1 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %length_read}, i64 0, metadata !25), !dbg !38 ; [debug line = 6:36] [debug variable = length]
  call void @llvm.dbg.value(metadata !{i32 %length}, i64 0, metadata !25), !dbg !38 ; [debug line = 6:36] [debug variable = length]
  call void @llvm.dbg.value(metadata !{[1000 x i8]* %key}, i64 0, metadata !39), !dbg !43 ; [debug line = 6:55] [debug variable = key]
  br label %1, !dbg !44                           ; [debug line = 11:2]

; <label>:1                                       ; preds = %2, %0
  %i = phi i32 [ 0, %0 ], [ %i_1, %2 ]            ; [#uses=3 type=i32]
  %hash = phi i32 [ 0, %0 ], [ %hash_6, %2 ]      ; [#uses=3 type=i32]
  %tmp = icmp eq i32 %i, %length_read, !dbg !44   ; [#uses=1 type=i1] [debug line = 11:2]
  %i_1 = add nsw i32 %i, 1, !dbg !46              ; [#uses=1 type=i32] [debug line = 13:3]
  br i1 %tmp, label %3, label %2, !dbg !44        ; [debug line = 11:2]

; <label>:2                                       ; preds = %1
  call void @llvm.dbg.value(metadata !{i32 %i_1}, i64 0, metadata !48), !dbg !46 ; [debug line = 13:3] [debug variable = i]
  %tmp_8 = sext i32 %i to i64, !dbg !46           ; [#uses=1 type=i64] [debug line = 13:3]
  %key_addr = getelementptr [1000 x i8]* %key, i64 0, i64 %tmp_8, !dbg !46 ; [#uses=1 type=i8*] [debug line = 13:3]
  %key_load = load i8* %key_addr, align 1, !dbg !46 ; [#uses=1 type=i8] [debug line = 13:3]
  %tmp_9 = sext i8 %key_load to i32, !dbg !46     ; [#uses=1 type=i32] [debug line = 13:3]
  %hash_4 = add i32 %tmp_9, %hash, !dbg !46       ; [#uses=2 type=i32] [debug line = 13:3]
  call void @llvm.dbg.value(metadata !{i32 %hash_4}, i64 0, metadata !49), !dbg !46 ; [debug line = 13:3] [debug variable = hash]
  %tmp_5 = shl i32 %hash_4, 10, !dbg !50          ; [#uses=1 type=i32] [debug line = 14:3]
  %hash_5 = add i32 %hash_4, %tmp_5, !dbg !50     ; [#uses=2 type=i32] [debug line = 14:3]
  call void @llvm.dbg.value(metadata !{i32 %hash_5}, i64 0, metadata !49), !dbg !50 ; [debug line = 14:3] [debug variable = hash]
  %tmp_2 = call i26 @_ssdm_op_PartSelect.i26.i32.i32.i32(i32 %hash_5, i32 6, i32 31), !dbg !51 ; [#uses=1 type=i26] [debug line = 15:3]
  %tmp_s = zext i26 %tmp_2 to i32, !dbg !51       ; [#uses=1 type=i32] [debug line = 15:3]
  %hash_6 = xor i32 %tmp_s, %hash_5, !dbg !51     ; [#uses=1 type=i32] [debug line = 15:3]
  call void @llvm.dbg.value(metadata !{i32 %hash_6}, i64 0, metadata !49), !dbg !51 ; [debug line = 15:3] [debug variable = hash]
  br label %1, !dbg !52                           ; [debug line = 16:2]

; <label>:3                                       ; preds = %1
  %tmp_1 = shl i32 %hash, 3, !dbg !53             ; [#uses=1 type=i32] [debug line = 18:2]
  %hash_1 = add i32 %hash, %tmp_1, !dbg !53       ; [#uses=2 type=i32] [debug line = 18:2]
  call void @llvm.dbg.value(metadata !{i32 %hash_1}, i64 0, metadata !49), !dbg !53 ; [debug line = 18:2] [debug variable = hash]
  %tmp_3 = call i21 @_ssdm_op_PartSelect.i21.i32.i32.i32(i32 %hash_1, i32 11, i32 31), !dbg !54 ; [#uses=1 type=i21] [debug line = 19:2]
  %tmp_6 = zext i21 %tmp_3 to i32, !dbg !54       ; [#uses=1 type=i32] [debug line = 19:2]
  %hash_2 = xor i32 %tmp_6, %hash_1, !dbg !54     ; [#uses=2 type=i32] [debug line = 19:2]
  call void @llvm.dbg.value(metadata !{i32 %hash_2}, i64 0, metadata !49), !dbg !54 ; [debug line = 19:2] [debug variable = hash]
  %tmp_4 = shl i32 %hash_2, 15, !dbg !55          ; [#uses=1 type=i32] [debug line = 20:2]
  %hash_3 = add i32 %hash_2, %tmp_4, !dbg !55     ; [#uses=1 type=i32] [debug line = 20:2]
  call void @llvm.dbg.value(metadata !{i32 %hash_3}, i64 0, metadata !49), !dbg !55 ; [debug line = 20:2] [debug variable = hash]
  ret i32 %hash_3, !dbg !56                       ; [debug line = 22:2]
}

; [#uses=1]
define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

; [#uses=3]
define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

; [#uses=1]
define weak i32 @_ssdm_op_Read.ap_auto.i32(i32) {
entry:
  ret i32 %0
}

; [#uses=0]
declare i29 @_ssdm_op_PartSelect.i29.i32.i32.i32(i32, i32, i32) nounwind readnone

; [#uses=1]
define weak i26 @_ssdm_op_PartSelect.i26.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2) ; [#uses=1 type=i32]
  %empty_4 = trunc i32 %empty to i26              ; [#uses=1 type=i26]
  ret i26 %empty_4
}

; [#uses=0]
declare i22 @_ssdm_op_PartSelect.i22.i32.i32.i32(i32, i32, i32) nounwind readnone

; [#uses=1]
define weak i21 @_ssdm_op_PartSelect.i21.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2) ; [#uses=1 type=i32]
  %empty_5 = trunc i32 %empty to i21              ; [#uses=1 type=i21]
  ret i21 %empty_5
}

; [#uses=0]
declare i17 @_ssdm_op_PartSelect.i17.i32.i32.i32(i32, i32, i32) nounwind readnone

; [#uses=0]
declare i32 @_ssdm_op_BitConcatenate.i32.i29.i3(i29, i3) nounwind readnone

; [#uses=0]
declare i32 @_ssdm_op_BitConcatenate.i32.i22.i10(i22, i10) nounwind readnone

; [#uses=0]
declare i32 @_ssdm_op_BitConcatenate.i32.i17.i15(i17, i15) nounwind readnone

!opencl.kernels = !{!0}
!hls.encrypted.func = !{}
!llvm.map.gv = !{}

!0 = metadata !{null, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5, metadata !6}
!1 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 1}
!2 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none"}
!3 = metadata !{metadata !"kernel_arg_type", metadata !"int", metadata !"char*"}
!4 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"const"}
!5 = metadata !{metadata !"kernel_arg_name", metadata !"length", metadata !"key"}
!6 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!7 = metadata !{metadata !8}
!8 = metadata !{i32 0, i32 31, metadata !9}
!9 = metadata !{metadata !10}
!10 = metadata !{metadata !"length", metadata !11, metadata !"int", i32 0, i32 31}
!11 = metadata !{metadata !12}
!12 = metadata !{i32 0, i32 0, i32 0}
!13 = metadata !{metadata !14}
!14 = metadata !{i32 0, i32 7, metadata !15}
!15 = metadata !{metadata !16}
!16 = metadata !{metadata !"key", metadata !17, metadata !"char", i32 0, i32 7}
!17 = metadata !{metadata !18}
!18 = metadata !{i32 0, i32 999, i32 1}
!19 = metadata !{metadata !20}
!20 = metadata !{i32 0, i32 31, metadata !21}
!21 = metadata !{metadata !22}
!22 = metadata !{metadata !"return", metadata !23, metadata !"uint32_t", i32 0, i32 31}
!23 = metadata !{metadata !24}
!24 = metadata !{i32 0, i32 1, i32 0}
!25 = metadata !{i32 786689, metadata !26, metadata !"length", metadata !27, i32 16777222, metadata !32, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!26 = metadata !{i32 786478, i32 0, metadata !27, metadata !"jenkins_one_at_a_time", metadata !"jenkins_one_at_a_time", metadata !"", metadata !27, i32 6, metadata !28, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !36, i32 7} ; [ DW_TAG_subprogram ]
!27 = metadata !{i32 786473, metadata !"hashing/jenkins_hash.c", metadata !"/home/aakash/Desktop/CDS/CuckooHashingHLS/hls", null} ; [ DW_TAG_file_type ]
!28 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !29, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!29 = metadata !{metadata !30, metadata !32, metadata !33}
!30 = metadata !{i32 786454, null, metadata !"uint32_t", metadata !27, i32 51, i64 0, i64 0, i64 0, i32 0, metadata !31} ; [ DW_TAG_typedef ]
!31 = metadata !{i32 786468, null, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!32 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!33 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !34} ; [ DW_TAG_pointer_type ]
!34 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !35} ; [ DW_TAG_const_type ]
!35 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!36 = metadata !{metadata !37}
!37 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!38 = metadata !{i32 6, i32 36, metadata !26, null}
!39 = metadata !{i32 786689, metadata !26, metadata !"key", null, i32 6, metadata !40, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!40 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 0, i64 0, i32 0, i32 0, metadata !34, metadata !41, i32 0, i32 0} ; [ DW_TAG_array_type ]
!41 = metadata !{metadata !42}
!42 = metadata !{i32 786465, i64 0, i64 999}      ; [ DW_TAG_subrange_type ]
!43 = metadata !{i32 6, i32 55, metadata !26, null}
!44 = metadata !{i32 11, i32 2, metadata !45, null}
!45 = metadata !{i32 786443, metadata !26, i32 7, i32 1, metadata !27, i32 0} ; [ DW_TAG_lexical_block ]
!46 = metadata !{i32 13, i32 3, metadata !47, null}
!47 = metadata !{i32 786443, metadata !45, i32 12, i32 2, metadata !27, i32 1} ; [ DW_TAG_lexical_block ]
!48 = metadata !{i32 786688, metadata !45, metadata !"i", metadata !27, i32 8, metadata !32, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!49 = metadata !{i32 786688, metadata !45, metadata !"hash", metadata !27, i32 9, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!50 = metadata !{i32 14, i32 3, metadata !47, null}
!51 = metadata !{i32 15, i32 3, metadata !47, null}
!52 = metadata !{i32 16, i32 2, metadata !47, null}
!53 = metadata !{i32 18, i32 2, metadata !45, null}
!54 = metadata !{i32 19, i32 2, metadata !45, null}
!55 = metadata !{i32 20, i32 2, metadata !45, null}
!56 = metadata !{i32 22, i32 2, metadata !45, null}
