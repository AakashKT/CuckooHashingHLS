; ModuleID = '/home/aakash/Desktop/CDS/CuckooHashingHLS/hls/hashing/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@execute_str = internal unnamed_addr constant [8 x i8] c"execute\00"
@p_str24 = private unnamed_addr constant [10 x i8] c"ap_memory\00", align 1
@p_str2 = private unnamed_addr constant [5 x i8] c"bram\00", align 1
@p_str13 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define i32 @execute(i32 %op_type, i32 %hash, i32 %val_addr, [80 x i32]* %key_val_dram, [10 x i32]* %val_addr_bram) nounwind uwtable {
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %op_type) nounwind, !map !16
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %hash) nounwind, !map !22
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %val_addr) nounwind, !map !26
  call void (...)* @_ssdm_op_SpecBitsMap([80 x i32]* %key_val_dram) nounwind, !map !30
  call void (...)* @_ssdm_op_SpecBitsMap([10 x i32]* %val_addr_bram) nounwind, !map !36
  call void (...)* @_ssdm_op_SpecBitsMap(i32 0) nounwind, !map !42
  call void (...)* @_ssdm_op_SpecTopModule([8 x i8]* @execute_str) nounwind
  %val_addr_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %val_addr) nounwind
  %hash_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %hash) nounwind
  %op_type_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %op_type) nounwind
  call void (...)* @_ssdm_op_SpecInterface([10 x i32]* %val_addr_bram, [5 x i8]* @p_str2, i32 0, i32 0, [1 x i8]* @p_str13, i32 0, i32 0, [1 x i8]* @p_str13, [1 x i8]* @p_str13, [1 x i8]* @p_str13, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str13, [1 x i8]* @p_str13) nounwind
  call void (...)* @_ssdm_op_SpecInterface([80 x i32]* %key_val_dram, [10 x i8]* @p_str24, i32 0, i32 0, [1 x i8]* @p_str13, i32 0, i32 0, [1 x i8]* @p_str13, [1 x i8]* @p_str13, [1 x i8]* @p_str13, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str13, [1 x i8]* @p_str13) nounwind
  %tmp = icmp eq i32 %op_type_read, 1
  br i1 %tmp, label %UnifiedReturnBlock, label %1

; <label>:1                                       ; preds = %0
  %tmp_1 = icmp eq i32 %op_type_read, 2
  %tmp_2 = zext i32 %val_addr_read to i64
  %key_val_dram_addr = getelementptr [80 x i32]* %key_val_dram, i64 0, i64 %tmp_2
  %stored_hash = load i32* %key_val_dram_addr, align 4
  %tmp_3 = add i32 %val_addr_read, 40
  %tmp_4 = zext i32 %tmp_3 to i64
  %key_val_dram_addr_1 = getelementptr [80 x i32]* %key_val_dram, i64 0, i64 %tmp_4
  %stored_val = load i32* %key_val_dram_addr_1, align 4
  %tmp_5 = icmp eq i32 %stored_hash, %hash_read
  br i1 %tmp_1, label %2, label %4

; <label>:2                                       ; preds = %1
  br i1 %tmp_5, label %3, label %._crit_edge1

; <label>:3                                       ; preds = %2
  %tmp_s = zext i32 %hash_read to i64
  %val_addr_bram_addr = getelementptr [10 x i32]* %val_addr_bram, i64 0, i64 %tmp_s
  store i32 -1, i32* %val_addr_bram_addr, align 4
  store i32 -1, i32* %key_val_dram_addr, align 4
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %3, %2
  br label %UnifiedReturnBlock

; <label>:4                                       ; preds = %1
  %stored_val2_0_s = select i1 %tmp_5, i32 %stored_val, i32 -1
  br label %UnifiedReturnBlock

UnifiedReturnBlock:                               ; preds = %4, %._crit_edge1, %0
  %UnifiedRetVal = phi i32 [ %stored_val2_0_s, %4 ], [ %stored_val, %._crit_edge1 ], [ -1, %0 ]
  ret i32 %UnifiedRetVal
}

define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

define weak void @_ssdm_op_SpecInterface(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

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
