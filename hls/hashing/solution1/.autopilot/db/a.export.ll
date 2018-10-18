; ModuleID = '/home/aakash/Desktop/CDS/CuckooHashingHLS/hls/hashing/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@jenkins_one_at_a_tim = internal unnamed_addr constant [22 x i8] c"jenkins_one_at_a_time\00"

declare i32 @llvm.part.select.i32(i32, i32, i32) nounwind readnone

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define i32 @jenkins_one_at_a_time(i32 %length_r, [1000 x i8]* %key) nounwind uwtable readonly {
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %length_r) nounwind, !map !7
  call void (...)* @_ssdm_op_SpecBitsMap([1000 x i8]* %key) nounwind, !map !13
  call void (...)* @_ssdm_op_SpecBitsMap(i32 0) nounwind, !map !19
  call void (...)* @_ssdm_op_SpecTopModule([22 x i8]* @jenkins_one_at_a_tim) nounwind
  %length_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %length_r) nounwind
  br label %1

; <label>:1                                       ; preds = %2, %0
  %i = phi i32 [ 0, %0 ], [ %i_1, %2 ]
  %hash = phi i32 [ 0, %0 ], [ %hash_6, %2 ]
  %tmp = icmp eq i32 %i, %length_read
  %i_1 = add nsw i32 %i, 1
  br i1 %tmp, label %3, label %2

; <label>:2                                       ; preds = %1
  %tmp_8 = sext i32 %i to i64
  %key_addr = getelementptr [1000 x i8]* %key, i64 0, i64 %tmp_8
  %key_load = load i8* %key_addr, align 1
  %tmp_9 = sext i8 %key_load to i32
  %hash_4 = add i32 %tmp_9, %hash
  %tmp_5 = shl i32 %hash_4, 10
  %hash_5 = add i32 %hash_4, %tmp_5
  %tmp_2 = call i26 @_ssdm_op_PartSelect.i26.i32.i32.i32(i32 %hash_5, i32 6, i32 31)
  %tmp_s = zext i26 %tmp_2 to i32
  %hash_6 = xor i32 %tmp_s, %hash_5
  br label %1

; <label>:3                                       ; preds = %1
  %tmp_1 = shl i32 %hash, 3
  %hash_1 = add i32 %hash, %tmp_1
  %tmp_3 = call i21 @_ssdm_op_PartSelect.i21.i32.i32.i32(i32 %hash_1, i32 11, i32 31)
  %tmp_6 = zext i21 %tmp_3 to i32
  %hash_2 = xor i32 %tmp_6, %hash_1
  %tmp_4 = shl i32 %hash_2, 15
  %hash_3 = add i32 %hash_2, %tmp_4
  ret i32 %hash_3
}

define weak void @_ssdm_op_SpecTopModule(...) {
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

declare i29 @_ssdm_op_PartSelect.i29.i32.i32.i32(i32, i32, i32) nounwind readnone

define weak i26 @_ssdm_op_PartSelect.i26.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2)
  %empty_4 = trunc i32 %empty to i26
  ret i26 %empty_4
}

declare i22 @_ssdm_op_PartSelect.i22.i32.i32.i32(i32, i32, i32) nounwind readnone

define weak i21 @_ssdm_op_PartSelect.i21.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2)
  %empty_5 = trunc i32 %empty to i21
  ret i21 %empty_5
}

declare i17 @_ssdm_op_PartSelect.i17.i32.i32.i32(i32, i32, i32) nounwind readnone

declare i32 @_ssdm_op_BitConcatenate.i32.i29.i3(i29, i3) nounwind readnone

declare i32 @_ssdm_op_BitConcatenate.i32.i22.i10(i22, i10) nounwind readnone

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
