; ModuleID = '/home/bollu/work/CuckooHashingHLS/hls/hashing/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@traffic_generate_and = internal unnamed_addr constant [29 x i8] c"traffic_generate_and_execute\00"
@llvm_global_ctors_1 = appending global [1 x void ()*] [void ()* @_GLOBAL__I_a]
@llvm_global_ctors_0 = appending global [1 x i32] [i32 65535]
@p_str5 = private unnamed_addr constant [10 x i8] c"ap_memory\00", align 1
@p_str4 = private unnamed_addr constant [12 x i8] c"RAM_1P_BRAM\00", align 1
@p_str3 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@p_str13 = private unnamed_addr constant [5 x i8] c"bram\00", align 1

define void @traffic_generate_and_execute([200 x i64]* %rrps) nounwind uwtable {
  call void (...)* @_ssdm_op_SpecBitsMap([200 x i64]* %rrps) nounwind, !map !64
  call void (...)* @_ssdm_op_SpecTopModule([29 x i8]* @traffic_generate_and) nounwind
  %key_to_metadata_key = alloca [384 x i32], align 4
  %key_to_metadata_occu = alloca [384 x i1], align 1
  call void (...)* @_ssdm_op_SpecInterface([200 x i64]* %rrps, [5 x i8]* @p_str13, i32 0, i32 0, [1 x i8]* @p_str3, i32 0, i32 0, [1 x i8]* @p_str3, [1 x i8]* @p_str3, [1 x i8]* @p_str3, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str3, [1 x i8]* @p_str3) nounwind
  br label %arrayctor.loop

arrayctor.loop:                                   ; preds = %arrayctor.loop1, %0
  %tmp = phi i2 [ 0, %0 ], [ %tmp_1, %arrayctor.loop1 ]
  %tmp_1 = add i2 %tmp, 1
  %empty = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3) nounwind
  br label %arrayctor.loop3

arrayctor.loop3:                                  ; preds = %arrayctor.loop3, %arrayctor.loop
  %tmp_3 = phi i7 [ 0, %arrayctor.loop ], [ %tmp_4, %arrayctor.loop3 ]
  %tmp_4 = add i7 %tmp_3, 1
  %tmp_2 = call i9 @_ssdm_op_BitConcatenate.i9.i2.i7(i2 %tmp, i7 %tmp_3)
  %tmp_5 = zext i9 %tmp_2 to i64
  %key_to_metadata_occu_1 = getelementptr [384 x i1]* %key_to_metadata_occu, i64 0, i64 %tmp_5
  store i1 false, i1* %key_to_metadata_occu_1, align 4
  %tmp_6 = icmp eq i7 %tmp_3, -1
  %empty_3 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 128, i64 128, i64 128) nounwind
  br i1 %tmp_6, label %arrayctor.loop1, label %arrayctor.loop3

; <label>:1                                       ; preds = %arrayctor.loop1
  call void (...)* @_ssdm_op_SpecMemCore([384 x i32]* %key_to_metadata_key, [384 x i1]* %key_to_metadata_occu, [1 x i8]* @p_str3, [12 x i8]* @p_str4, [1 x i8]* @p_str3, i32 -1, [1 x i8]* @p_str3, [1 x i8]* @p_str3, [1 x i8]* @p_str3, [1 x i8]* @p_str3, [1 x i8]* @p_str3) nounwind
  br label %2

; <label>:2                                       ; preds = %.preheader.preheader, %1
  %writeix = phi i8 [ 0, %1 ], [ %writeix_1, %.preheader.preheader ]
  %i = phi i7 [ 0, %1 ], [ %i_1, %.preheader.preheader ]
  %exitcond1 = icmp eq i7 %i, -28
  %empty_4 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 100, i64 100, i64 100) nounwind
  %i_1 = add i7 %i, 1
  br i1 %exitcond1, label %3, label %.preheader.preheader

arrayctor.loop1:                                  ; preds = %arrayctor.loop3
  %tmp_7 = icmp eq i2 %tmp, -2
  br i1 %tmp_7, label %1, label %arrayctor.loop

.preheader.preheader:                             ; preds = %2
  %call_ret1 = call fastcc i1 @execute([384 x i32]* %key_to_metadata_key, [384 x i1]* %key_to_metadata_occu) nounwind
  %tmp_9 = or i8 %writeix, 1
  %tmp_s = zext i8 %writeix to i64
  %rrps_addr = getelementptr [200 x i64]* %rrps, i64 0, i64 %tmp_s
  store i64 17179869185, i64* %rrps_addr, align 8
  %tmp_i = call i43 @_ssdm_op_BitConcatenate.i43.i40.i1.i2(i40 4294967296, i1 %call_ret1, i2 0)
  %packed = zext i43 %tmp_i to i64
  %writeix_1 = add i8 %writeix, 2
  %tmp_8 = zext i8 %tmp_9 to i64
  %rrps_addr_1 = getelementptr [200 x i64]* %rrps, i64 0, i64 %tmp_8
  store i64 %packed, i64* %rrps_addr_1, align 8
  br label %2

; <label>:3                                       ; preds = %2
  ret void
}

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

define internal fastcc i1 @execute([384 x i32]* %key_to_metadata_key, [384 x i1]* %key_to_metadata_occu) {
  %key_to_metadata_key_s = getelementptr [384 x i32]* %key_to_metadata_key, i64 0, i64 134
  %key_to_metadata_occu_2 = getelementptr [384 x i1]* %key_to_metadata_occu, i64 0, i64 134
  call void (...)* @_ssdm_op_SpecMemCore([384 x i32]* %key_to_metadata_key, [384 x i1]* %key_to_metadata_occu, [1 x i8]* @p_str3, [12 x i8]* @p_str4, [1 x i8]* @p_str3, i32 -1, [1 x i8]* @p_str3, [1 x i8]* @p_str3, [1 x i8]* @p_str3, [1 x i8]* @p_str3, [1 x i8]* @p_str3)
  call void (...)* @_ssdm_op_SpecInterface([384 x i32]* %key_to_metadata_key, [384 x i1]* %key_to_metadata_occu, [10 x i8]* @p_str5, i32 0, i32 0, [1 x i8]* @p_str3, i32 0, i32 0, [1 x i8]* @p_str3, [1 x i8]* @p_str3, [1 x i8]* @p_str3, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str3, [1 x i8]* @p_str3)
  %key_to_metadata_occu_3 = load i1* %key_to_metadata_occu_2, align 1
  br i1 %key_to_metadata_occu_3, label %1, label %._crit_edge1

; <label>:1                                       ; preds = %0
  %key_to_metadata_key_1 = load i32* %key_to_metadata_key_s, align 4
  %tmp_9 = icmp eq i32 %key_to_metadata_key_1, 4
  br i1 %tmp_9, label %2, label %._crit_edge1

._crit_edge1:                                     ; preds = %1, %0
  br label %._crit_edge

; <label>:2                                       ; preds = %1
  store i1 false, i1* %key_to_metadata_occu_2, align 1
  br label %._crit_edge

._crit_edge:                                      ; preds = %2, %._crit_edge1
  %agg_result_delete_el = phi i1 [ false, %2 ], [ true, %._crit_edge1 ]
  ret i1 %agg_result_delete_el
}

define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

define weak void @_ssdm_op_SpecMemCore(...) {
entry:
  ret void
}

define weak i32 @_ssdm_op_SpecLoopTripCount(...) {
entry:
  ret i32 0
}

define weak void @_ssdm_op_SpecInterface(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

define weak i9 @_ssdm_op_BitConcatenate.i9.i2.i7(i2, i7) nounwind readnone {
entry:
  %empty = zext i2 %0 to i9
  %empty_5 = zext i7 %1 to i9
  %empty_6 = shl i9 %empty, 7
  %empty_7 = or i9 %empty_6, %empty_5
  ret i9 %empty_7
}

define weak i43 @_ssdm_op_BitConcatenate.i43.i40.i1.i2(i40, i1, i2) nounwind readnone {
entry:
  %empty = zext i1 %1 to i3
  %empty_8 = zext i2 %2 to i3
  %empty_9 = shl i3 %empty, 2
  %empty_10 = or i3 %empty_9, %empty_8
  %empty_11 = zext i40 %0 to i43
  %empty_12 = zext i3 %empty_10 to i43
  %empty_13 = shl i43 %empty_11, 3
  %empty_14 = or i43 %empty_13, %empty_12
  ret i43 %empty_14
}

declare void @_GLOBAL__I_a() nounwind section ".text.startup"

!opencl.kernels = !{!0, !7, !11, !17, !20, !17, !23, !23, !29, !33, !36, !39, !36, !41, !23, !47, !50, !53, !23, !23, !23, !23}
!hls.encrypted.func = !{}
!llvm.map.gv = !{!57}

!0 = metadata !{null, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5, metadata !6}
!1 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 1}
!2 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none"}
!3 = metadata !{metadata !"kernel_arg_type", metadata !"int", metadata !"char*"}
!4 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !""}
!5 = metadata !{metadata !"kernel_arg_name", metadata !"length", metadata !"key"}
!6 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!7 = metadata !{null, metadata !8, metadata !2, metadata !9, metadata !4, metadata !10, metadata !6}
!8 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0}
!9 = metadata !{metadata !"kernel_arg_type", metadata !"int", metadata !"int"}
!10 = metadata !{metadata !"kernel_arg_name", metadata !"key", metadata !"salt"}
!11 = metadata !{null, metadata !12, metadata !13, metadata !14, metadata !15, metadata !16, metadata !6}
!12 = metadata !{metadata !"kernel_arg_addr_space", i32 0}
!13 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none"}
!14 = metadata !{metadata !"kernel_arg_type", metadata !"int"}
!15 = metadata !{metadata !"kernel_arg_type_qual", metadata !""}
!16 = metadata !{metadata !"kernel_arg_name", metadata !"key"}
!17 = metadata !{null, metadata !12, metadata !13, metadata !18, metadata !15, metadata !19, metadata !6}
!18 = metadata !{metadata !"kernel_arg_type", metadata !"Key"}
!19 = metadata !{metadata !"kernel_arg_name", metadata !"k"}
!20 = metadata !{null, metadata !8, metadata !2, metadata !21, metadata !4, metadata !22, metadata !6}
!21 = metadata !{metadata !"kernel_arg_type", metadata !"Key", metadata !"Value"}
!22 = metadata !{metadata !"kernel_arg_name", metadata !"k", metadata !"v"}
!23 = metadata !{null, metadata !24, metadata !25, metadata !26, metadata !27, metadata !28, metadata !6}
!24 = metadata !{metadata !"kernel_arg_addr_space"}
!25 = metadata !{metadata !"kernel_arg_access_qual"}
!26 = metadata !{metadata !"kernel_arg_type"}
!27 = metadata !{metadata !"kernel_arg_type_qual"}
!28 = metadata !{metadata !"kernel_arg_name"}
!29 = metadata !{null, metadata !30, metadata !13, metadata !31, metadata !15, metadata !32, metadata !6}
!30 = metadata !{metadata !"kernel_arg_addr_space", i32 1}
!31 = metadata !{metadata !"kernel_arg_type", metadata !"uint*"}
!32 = metadata !{metadata !"kernel_arg_name", metadata !"random"}
!33 = metadata !{null, metadata !12, metadata !13, metadata !34, metadata !15, metadata !35, metadata !6}
!34 = metadata !{metadata !"kernel_arg_type", metadata !"struct Request"}
!35 = metadata !{metadata !"kernel_arg_name", metadata !"r"}
!36 = metadata !{null, metadata !12, metadata !13, metadata !37, metadata !15, metadata !38, metadata !6}
!37 = metadata !{metadata !"kernel_arg_type", metadata !"uint64_t"}
!38 = metadata !{metadata !"kernel_arg_name", metadata !"packed"}
!39 = metadata !{null, metadata !12, metadata !13, metadata !40, metadata !15, metadata !35, metadata !6}
!40 = metadata !{metadata !"kernel_arg_type", metadata !"struct Response"}
!41 = metadata !{null, metadata !42, metadata !43, metadata !44, metadata !45, metadata !46, metadata !6}
!42 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 1, i32 1}
!43 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none"}
!44 = metadata !{metadata !"kernel_arg_type", metadata !"struct Request", metadata !"struct KMetadata [128]*", metadata !"struct KV [128]*"}
!45 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !""}
!46 = metadata !{metadata !"kernel_arg_name", metadata !"req", metadata !"key_to_metadata", metadata !"key_to_val"}
!47 = metadata !{null, metadata !12, metadata !13, metadata !48, metadata !15, metadata !49, metadata !6}
!48 = metadata !{metadata !"kernel_arg_type", metadata !"int32"}
!49 = metadata !{metadata !"kernel_arg_name", metadata !"lfsr"}
!50 = metadata !{null, metadata !30, metadata !13, metadata !51, metadata !15, metadata !52, metadata !6}
!51 = metadata !{metadata !"kernel_arg_type", metadata !"uint64_t*"}
!52 = metadata !{metadata !"kernel_arg_name", metadata !"rrps"}
!53 = metadata !{null, metadata !54, metadata !2, metadata !55, metadata !4, metadata !56, metadata !6}
!54 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 1}
!55 = metadata !{metadata !"kernel_arg_type", metadata !"struct KMetadata [128]*", metadata !"struct KV [128]*"}
!56 = metadata !{metadata !"kernel_arg_name", metadata !"key_to_metadata", metadata !"key_to_val"}
!57 = metadata !{metadata !58, [1 x i32]* @llvm_global_ctors_0}
!58 = metadata !{metadata !59}
!59 = metadata !{i32 0, i32 31, metadata !60}
!60 = metadata !{metadata !61}
!61 = metadata !{metadata !"llvm.global_ctors.0", metadata !62, metadata !"", i32 0, i32 31}
!62 = metadata !{metadata !63}
!63 = metadata !{i32 0, i32 0, i32 1}
!64 = metadata !{metadata !65}
!65 = metadata !{i32 0, i32 63, metadata !66}
!66 = metadata !{metadata !67}
!67 = metadata !{metadata !"rrps", metadata !68, metadata !"long unsigned int", i32 0, i32 63}
!68 = metadata !{metadata !69}
!69 = metadata !{i32 0, i32 199, i32 1}
