; ModuleID = '/home/bollu/work/CuckooHashingHLS/hls/hashing/solution1/.autopilot/db/a.o.3.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@traffic_generate_and = internal unnamed_addr constant [29 x i8] c"traffic_generate_and_execute\00" ; [#uses=1 type=[29 x i8]*]
@llvm_global_ctors_1 = appending global [1 x void ()*] [void ()* @_GLOBAL__I_a] ; [#uses=0 type=[1 x void ()*]*]
@llvm_global_ctors_0 = appending global [1 x i32] [i32 65535] ; [#uses=0 type=[1 x i32]*]
@p_str5 = private unnamed_addr constant [10 x i8] c"ap_memory\00", align 1 ; [#uses=1 type=[10 x i8]*]
@p_str4 = private unnamed_addr constant [12 x i8] c"RAM_1P_BRAM\00", align 1 ; [#uses=2 type=[12 x i8]*]
@p_str3 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1 ; [#uses=26 type=[1 x i8]*]
@p_str13 = private unnamed_addr constant [5 x i8] c"bram\00", align 1 ; [#uses=1 type=[5 x i8]*]

; [#uses=0]
define void @traffic_generate_and_execute([200 x i64]* %rrps) nounwind uwtable {
  call void (...)* @_ssdm_op_SpecBitsMap([200 x i64]* %rrps) nounwind, !map !64
  call void (...)* @_ssdm_op_SpecTopModule([29 x i8]* @traffic_generate_and) nounwind
  %key_to_metadata_key = alloca [384 x i32], align 4 ; [#uses=2 type=[384 x i32]*]
  %key_to_metadata_occu = alloca [384 x i1], align 1 ; [#uses=3 type=[384 x i1]*]
  call void @llvm.dbg.value(metadata !{[200 x i64]* %rrps}, i64 0, metadata !70), !dbg !83 ; [debug line = 259:44] [debug variable = rrps]
  call void (...)* @_ssdm_op_SpecInterface([200 x i64]* %rrps, [5 x i8]* @p_str13, i32 0, i32 0, [1 x i8]* @p_str3, i32 0, i32 0, [1 x i8]* @p_str3, [1 x i8]* @p_str3, [1 x i8]* @p_str3, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str3, [1 x i8]* @p_str3) nounwind
  call void @llvm.dbg.declare(metadata !{[384 x i1]* %key_to_metadata_occu}, metadata !84), !dbg !107 ; [debug line = 263:12] [debug variable = key_to_metadata.occupied]
  br label %arrayctor.loop

arrayctor.loop:                                   ; preds = %arrayctor.loop1, %0
  %tmp = phi i2 [ 0, %0 ], [ %tmp_1, %arrayctor.loop1 ] ; [#uses=3 type=i2]
  %tmp_1 = add i2 %tmp, 1, !dbg !108              ; [#uses=1 type=i2] [debug line = 263:61]
  %empty = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3) nounwind ; [#uses=0 type=i32]
  br label %arrayctor.loop3

arrayctor.loop3:                                  ; preds = %arrayctor.loop3, %arrayctor.loop
  %tmp_3 = phi i7 [ 0, %arrayctor.loop ], [ %tmp_4, %arrayctor.loop3 ] ; [#uses=3 type=i7]
  %tmp_4 = add i7 %tmp_3, 1, !dbg !108            ; [#uses=1 type=i7] [debug line = 263:61]
  %tmp_2 = call i9 @_ssdm_op_BitConcatenate.i9.i2.i7(i2 %tmp, i7 %tmp_3) ; [#uses=1 type=i9]
  %tmp_5 = zext i9 %tmp_2 to i64, !dbg !109       ; [#uses=1 type=i64] [debug line = 43:42@263:61]
  %key_to_metadata_occu_1 = getelementptr [384 x i1]* %key_to_metadata_occu, i64 0, i64 %tmp_5, !dbg !109 ; [#uses=1 type=i1*] [debug line = 43:42@263:61]
  store i1 false, i1* %key_to_metadata_occu_1, align 4, !dbg !109 ; [debug line = 43:42@263:61]
  %tmp_6 = icmp eq i7 %tmp_3, -1, !dbg !108       ; [#uses=1 type=i1] [debug line = 263:61]
  %empty_3 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 128, i64 128, i64 128) nounwind ; [#uses=0 type=i32]
  br i1 %tmp_6, label %arrayctor.loop1, label %arrayctor.loop3, !dbg !108 ; [debug line = 263:61]

; <label>:1                                       ; preds = %arrayctor.loop1
  call void (...)* @_ssdm_op_SpecMemCore([384 x i32]* %key_to_metadata_key, [384 x i1]* %key_to_metadata_occu, [1 x i8]* @p_str3, [12 x i8]* @p_str4, [1 x i8]* @p_str3, i32 -1, [1 x i8]* @p_str3, [1 x i8]* @p_str3, [1 x i8]* @p_str3, [1 x i8]* @p_str3, [1 x i8]* @p_str3) nounwind
  br label %2, !dbg !111                          ; [debug line = 273:15]

; <label>:2                                       ; preds = %.preheader.preheader, %1
  %writeix = phi i8 [ 0, %1 ], [ %writeix_1, %.preheader.preheader ] ; [#uses=3 type=i8]
  %i = phi i7 [ 0, %1 ], [ %i_1, %.preheader.preheader ] ; [#uses=2 type=i7]
  %exitcond1 = icmp eq i7 %i, -28, !dbg !111      ; [#uses=1 type=i1] [debug line = 273:15]
  %empty_4 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 100, i64 100, i64 100) nounwind ; [#uses=0 type=i32]
  %i_1 = add i7 %i, 1, !dbg !113                  ; [#uses=1 type=i7] [debug line = 273:40]
  br i1 %exitcond1, label %3, label %.preheader.preheader, !dbg !111 ; [debug line = 273:15]

arrayctor.loop1:                                  ; preds = %arrayctor.loop3
  %tmp_7 = icmp eq i2 %tmp, -2, !dbg !108         ; [#uses=1 type=i1] [debug line = 263:61]
  br i1 %tmp_7, label %1, label %arrayctor.loop, !dbg !108 ; [debug line = 263:61]

.preheader.preheader:                             ; preds = %2
  %call_ret1 = call fastcc i1 @execute([384 x i32]* %key_to_metadata_key, [384 x i1]* %key_to_metadata_occu) nounwind, !dbg !114 ; [#uses=1 type=i1] [debug line = 280:18]
  %tmp_9 = or i8 %writeix, 1, !dbg !116           ; [#uses=1 type=i8] [debug line = 283:21]
  %tmp_s = zext i8 %writeix to i64, !dbg !116     ; [#uses=1 type=i64] [debug line = 283:21]
  %rrps_addr = getelementptr [200 x i64]* %rrps, i64 0, i64 %tmp_s, !dbg !116 ; [#uses=1 type=i64*] [debug line = 283:21]
  store i64 17179869185, i64* %rrps_addr, align 8, !dbg !116 ; [debug line = 283:21]
  %tmp_i = call i43 @_ssdm_op_BitConcatenate.i43.i40.i1.i2(i40 4294967296, i1 %call_ret1, i2 0) ; [#uses=1 type=i43]
  %packed = zext i43 %tmp_i to i64, !dbg !117     ; [#uses=1 type=i64] [debug line = 106:2@284:21]
  call void @llvm.dbg.value(metadata !{i64 %packed}, i64 0, metadata !138) nounwind, !dbg !117 ; [debug line = 106:2@284:21] [debug variable = packed]
  %writeix_1 = add i8 %writeix, 2, !dbg !137      ; [#uses=1 type=i8] [debug line = 284:21]
  call void @llvm.dbg.value(metadata !{i8 %writeix_1}, i64 0, metadata !139), !dbg !137 ; [debug line = 284:21] [debug variable = writeix]
  %tmp_8 = zext i8 %tmp_9 to i64, !dbg !137       ; [#uses=1 type=i64] [debug line = 284:21]
  %rrps_addr_1 = getelementptr [200 x i64]* %rrps, i64 0, i64 %tmp_8, !dbg !137 ; [#uses=1 type=i64*] [debug line = 284:21]
  store i64 %packed, i64* %rrps_addr_1, align 8, !dbg !137 ; [debug line = 284:21]
  call void @llvm.dbg.value(metadata !{i7 %i_1}, i64 0, metadata !141), !dbg !113 ; [debug line = 273:40] [debug variable = i]
  br label %2, !dbg !113                          ; [debug line = 273:40]

; <label>:3                                       ; preds = %2
  ret void, !dbg !142                             ; [debug line = 286:1]
}

; [#uses=7]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=1]
declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

; [#uses=1]
define internal fastcc i1 @execute([384 x i32]* %key_to_metadata_key, [384 x i1]* %key_to_metadata_occu) {
  %key_to_metadata_key_s = getelementptr [384 x i32]* %key_to_metadata_key, i64 0, i64 134, !dbg !143 ; [#uses=1 type=i32*] [debug line = 208:3]
  %key_to_metadata_occu_2 = getelementptr [384 x i1]* %key_to_metadata_occu, i64 0, i64 134, !dbg !143 ; [#uses=2 type=i1*] [debug line = 208:3]
  call void @llvm.dbg.value(metadata !{[384 x i32]* %key_to_metadata_key}, i64 0, metadata !179), !dbg !184 ; [debug line = 136:13] [debug variable = key_to_metadata.key]
  call void @llvm.dbg.value(metadata !{[384 x i1]* %key_to_metadata_occu}, i64 0, metadata !185), !dbg !184 ; [debug line = 136:13] [debug variable = key_to_metadata.occupied]
  call void (...)* @_ssdm_op_SpecMemCore([384 x i32]* %key_to_metadata_key, [384 x i1]* %key_to_metadata_occu, [1 x i8]* @p_str3, [12 x i8]* @p_str4, [1 x i8]* @p_str3, i32 -1, [1 x i8]* @p_str3, [1 x i8]* @p_str3, [1 x i8]* @p_str3, [1 x i8]* @p_str3, [1 x i8]* @p_str3)
  call void (...)* @_ssdm_op_SpecInterface([384 x i32]* %key_to_metadata_key, [384 x i1]* %key_to_metadata_occu, [10 x i8]* @p_str5, i32 0, i32 0, [1 x i8]* @p_str3, i32 0, i32 0, [1 x i8]* @p_str3, [1 x i8]* @p_str3, [1 x i8]* @p_str3, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str3, [1 x i8]* @p_str3)
  %key_to_metadata_occu_3 = load i1* %key_to_metadata_occu_2, align 1, !dbg !143 ; [#uses=1 type=i1] [debug line = 208:3]
  br i1 %key_to_metadata_occu_3, label %1, label %._crit_edge1, !dbg !143 ; [debug line = 208:3]

; <label>:1                                       ; preds = %0
  %key_to_metadata_key_1 = load i32* %key_to_metadata_key_s, align 4, !dbg !143 ; [#uses=1 type=i32] [debug line = 208:3]
  %tmp_9 = icmp eq i32 %key_to_metadata_key_1, 4, !dbg !143 ; [#uses=1 type=i1] [debug line = 208:3]
  br i1 %tmp_9, label %2, label %._crit_edge1, !dbg !143 ; [debug line = 208:3]

._crit_edge1:                                     ; preds = %1, %0
  br label %._crit_edge, !dbg !186                ; [debug line = 211:4]

; <label>:2                                       ; preds = %1
  store i1 false, i1* %key_to_metadata_occu_2, align 1, !dbg !188 ; [debug line = 218:3]
  br label %._crit_edge, !dbg !189                ; [debug line = 220:3]

._crit_edge:                                      ; preds = %2, %._crit_edge1
  %agg_result_delete_el = phi i1 [ false, %2 ], [ true, %._crit_edge1 ] ; [#uses=1 type=i1]
  call void @llvm.dbg.value(metadata !{i1 %agg_result_delete_el}, i64 0, metadata !190) ; [debug variable = agg.result.delete_element_not_found]
  ret i1 %agg_result_delete_el
}

; [#uses=1]
define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

; [#uses=2]
define weak void @_ssdm_op_SpecMemCore(...) {
entry:
  ret void
}

; [#uses=3]
define weak i32 @_ssdm_op_SpecLoopTripCount(...) {
entry:
  ret i32 0
}

; [#uses=2]
define weak void @_ssdm_op_SpecInterface(...) nounwind {
entry:
  ret void
}

; [#uses=1]
define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

; [#uses=1]
define weak i9 @_ssdm_op_BitConcatenate.i9.i2.i7(i2, i7) nounwind readnone {
entry:
  %empty = zext i2 %0 to i9                       ; [#uses=1 type=i9]
  %empty_5 = zext i7 %1 to i9                     ; [#uses=1 type=i9]
  %empty_6 = shl i9 %empty, 7                     ; [#uses=1 type=i9]
  %empty_7 = or i9 %empty_6, %empty_5             ; [#uses=1 type=i9]
  ret i9 %empty_7
}

; [#uses=1]
define weak i43 @_ssdm_op_BitConcatenate.i43.i40.i1.i2(i40, i1, i2) nounwind readnone {
entry:
  %empty = zext i1 %1 to i3                       ; [#uses=1 type=i3]
  %empty_8 = zext i2 %2 to i3                     ; [#uses=1 type=i3]
  %empty_9 = shl i3 %empty, 2                     ; [#uses=1 type=i3]
  %empty_10 = or i3 %empty_9, %empty_8            ; [#uses=1 type=i3]
  %empty_11 = zext i40 %0 to i43                  ; [#uses=1 type=i43]
  %empty_12 = zext i3 %empty_10 to i43            ; [#uses=1 type=i43]
  %empty_13 = shl i43 %empty_11, 3                ; [#uses=1 type=i43]
  %empty_14 = or i43 %empty_13, %empty_12         ; [#uses=1 type=i43]
  ret i43 %empty_14
}

; [#uses=1]
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
!70 = metadata !{i32 786689, metadata !71, metadata !"rrps", null, i32 259, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!71 = metadata !{i32 786478, i32 0, metadata !72, metadata !"traffic_generate_and_execute", metadata !"traffic_generate_and_execute", metadata !"_Z28traffic_generate_and_executePm", metadata !72, i32 259, metadata !73, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !78, i32 259} ; [ DW_TAG_subprogram ]
!72 = metadata !{i32 786473, metadata !"hashing/execute.cpp", metadata !"/home/bollu/work/CuckooHashingHLS/hls", null} ; [ DW_TAG_file_type ]
!73 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !74, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!74 = metadata !{null, metadata !75}
!75 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !76} ; [ DW_TAG_pointer_type ]
!76 = metadata !{i32 786454, null, metadata !"uint64_t", metadata !72, i32 55, i64 0, i64 0, i64 0, i32 0, metadata !77} ; [ DW_TAG_typedef ]
!77 = metadata !{i32 786468, null, metadata !"long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!78 = metadata !{metadata !79}
!79 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!80 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 0, i64 0, i32 0, i32 0, metadata !76, metadata !81, i32 0, i32 0} ; [ DW_TAG_array_type ]
!81 = metadata !{metadata !82}
!82 = metadata !{i32 786465, i64 0, i64 199}      ; [ DW_TAG_subrange_type ]
!83 = metadata !{i32 259, i32 44, metadata !71, null}
!84 = metadata !{i32 790529, metadata !85, metadata !"key_to_metadata.occupied", null, i32 263, metadata !104, i32 0, i32 0} ; [ DW_TAG_auto_variable_field ]
!85 = metadata !{i32 786688, metadata !86, metadata !"key_to_metadata", metadata !72, i32 263, metadata !87, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!86 = metadata !{i32 786443, metadata !71, i32 259, i32 87, metadata !72, i32 21} ; [ DW_TAG_lexical_block ]
!87 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 24576, i64 32, i32 0, i32 0, metadata !88, metadata !101, i32 0, i32 0} ; [ DW_TAG_array_type ]
!88 = metadata !{i32 786434, null, metadata !"KMetadata", metadata !89, i32 18, i64 64, i64 32, i32 0, i32 0, null, metadata !90, i32 0, null, null} ; [ DW_TAG_class_type ]
!89 = metadata !{i32 786473, metadata !"hashing/execute.h", metadata !"/home/bollu/work/CuckooHashingHLS/hls", null} ; [ DW_TAG_file_type ]
!90 = metadata !{metadata !91, metadata !95, metadata !97}
!91 = metadata !{i32 786445, metadata !88, metadata !"key", metadata !89, i32 19, i64 32, i64 32, i64 0, i32 0, metadata !92} ; [ DW_TAG_member ]
!92 = metadata !{i32 786454, null, metadata !"Key", metadata !89, i32 13, i64 0, i64 0, i64 0, i32 0, metadata !93} ; [ DW_TAG_typedef ]
!93 = metadata !{i32 786454, null, metadata !"uint32_t", metadata !89, i32 51, i64 0, i64 0, i64 0, i32 0, metadata !94} ; [ DW_TAG_typedef ]
!94 = metadata !{i32 786468, null, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!95 = metadata !{i32 786445, metadata !88, metadata !"occupied", metadata !89, i32 21, i64 8, i64 8, i64 32, i32 0, metadata !96} ; [ DW_TAG_member ]
!96 = metadata !{i32 786468, null, metadata !"bool", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 2} ; [ DW_TAG_base_type ]
!97 = metadata !{i32 786478, i32 0, metadata !88, metadata !"KMetadata", metadata !"KMetadata", metadata !"", metadata !89, i32 24, metadata !98, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !78, i32 24} ; [ DW_TAG_subprogram ]
!98 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !99, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!99 = metadata !{null, metadata !100}
!100 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !88} ; [ DW_TAG_pointer_type ]
!101 = metadata !{metadata !102, metadata !103}
!102 = metadata !{i32 786465, i64 0, i64 2}       ; [ DW_TAG_subrange_type ]
!103 = metadata !{i32 786465, i64 0, i64 127}     ; [ DW_TAG_subrange_type ]
!104 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 3072, i64 32, i32 0, i32 0, metadata !105, metadata !101, i32 0, i32 0} ; [ DW_TAG_array_type ]
!105 = metadata !{i32 786438, null, metadata !"KMetadata", metadata !89, i32 18, i64 8, i64 32, i32 0, i32 0, null, metadata !106, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!106 = metadata !{metadata !95}
!107 = metadata !{i32 263, i32 12, metadata !86, null}
!108 = metadata !{i32 263, i32 61, metadata !86, null}
!109 = metadata !{i32 43, i32 42, metadata !110, metadata !108}
!110 = metadata !{i32 786478, i32 0, null, metadata !"KMetadata", metadata !"KMetadata", metadata !"_ZN9KMetadataC2Ev", metadata !72, i32 43, metadata !98, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !97, metadata !78, i32 43} ; [ DW_TAG_subprogram ]
!111 = metadata !{i32 273, i32 15, metadata !112, null}
!112 = metadata !{i32 786443, metadata !86, i32 273, i32 2, metadata !72, i32 22} ; [ DW_TAG_lexical_block ]
!113 = metadata !{i32 273, i32 40, metadata !112, null}
!114 = metadata !{i32 280, i32 18, metadata !115, null}
!115 = metadata !{i32 786443, metadata !112, i32 273, i32 45, metadata !72, i32 23} ; [ DW_TAG_lexical_block ]
!116 = metadata !{i32 283, i32 21, metadata !115, null}
!117 = metadata !{i32 106, i32 2, metadata !118, metadata !137}
!118 = metadata !{i32 786443, metadata !119, i32 100, i32 36, metadata !72, i32 11} ; [ DW_TAG_lexical_block ]
!119 = metadata !{i32 786478, i32 0, metadata !72, metadata !"response_pack", metadata !"response_pack", metadata !"_Z13response_pack8Response", metadata !72, i32 100, metadata !120, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !78, i32 100} ; [ DW_TAG_subprogram ]
!120 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !121, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!121 = metadata !{metadata !76, metadata !122}
!122 = metadata !{i32 786434, null, metadata !"Response", metadata !89, i32 85, i64 96, i64 32, i32 0, i32 0, null, metadata !123, i32 0, null, null} ; [ DW_TAG_class_type ]
!123 = metadata !{metadata !124, metadata !128, metadata !130, metadata !131, metadata !132, metadata !133}
!124 = metadata !{i32 786445, metadata !122, metadata !"tag", metadata !89, i32 87, i64 8, i64 8, i64 0, i32 0, metadata !125} ; [ DW_TAG_member ]
!125 = metadata !{i32 786454, null, metadata !"OpType", metadata !89, i32 54, i64 0, i64 0, i64 0, i32 0, metadata !126} ; [ DW_TAG_typedef ]
!126 = metadata !{i32 786454, null, metadata !"uint8_t", metadata !89, i32 48, i64 0, i64 0, i64 0, i32 0, metadata !127} ; [ DW_TAG_typedef ]
!127 = metadata !{i32 786468, null, metadata !"unsigned char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!128 = metadata !{i32 786445, metadata !122, metadata !"search_value", metadata !89, i32 89, i64 32, i64 32, i64 32, i32 0, metadata !129} ; [ DW_TAG_member ]
!129 = metadata !{i32 786454, null, metadata !"Value", metadata !89, i32 16, i64 0, i64 0, i64 0, i32 0, metadata !93} ; [ DW_TAG_typedef ]
!130 = metadata !{i32 786445, metadata !122, metadata !"delete_element_not_found", metadata !89, i32 91, i64 8, i64 8, i64 64, i32 0, metadata !96} ; [ DW_TAG_member ]
!131 = metadata !{i32 786445, metadata !122, metadata !"search_element_not_found", metadata !89, i32 93, i64 8, i64 8, i64 72, i32 0, metadata !96} ; [ DW_TAG_member ]
!132 = metadata !{i32 786445, metadata !122, metadata !"insert_collided", metadata !89, i32 95, i64 8, i64 8, i64 80, i32 0, metadata !96} ; [ DW_TAG_member ]
!133 = metadata !{i32 786478, i32 0, metadata !122, metadata !"Response", metadata !"Response", metadata !"", metadata !89, i32 96, metadata !134, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !78, i32 96} ; [ DW_TAG_subprogram ]
!134 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !135, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!135 = metadata !{null, metadata !136}
!136 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !122} ; [ DW_TAG_pointer_type ]
!137 = metadata !{i32 284, i32 21, metadata !115, null}
!138 = metadata !{i32 786688, metadata !118, metadata !"packed", metadata !72, i32 101, metadata !76, i32 0, metadata !137} ; [ DW_TAG_auto_variable ]
!139 = metadata !{i32 786688, metadata !86, metadata !"writeix", metadata !72, i32 270, metadata !140, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!140 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!141 = metadata !{i32 786688, metadata !112, metadata !"i", metadata !72, i32 273, metadata !140, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!142 = metadata !{i32 286, i32 1, metadata !86, null}
!143 = metadata !{i32 208, i32 3, metadata !144, null}
!144 = metadata !{i32 786443, metadata !145, i32 176, i32 19, metadata !72, i32 14} ; [ DW_TAG_lexical_block ]
!145 = metadata !{i32 786443, metadata !146, i32 138, i32 52, metadata !72, i32 13} ; [ DW_TAG_lexical_block ]
!146 = metadata !{i32 786478, i32 0, metadata !72, metadata !"execute", metadata !"execute", metadata !"_Z7execute7RequestPA128_9KMetadataPA128_2KV", metadata !72, i32 134, metadata !147, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !78, i32 138} ; [ DW_TAG_subprogram ]
!147 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !148, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!148 = metadata !{metadata !122, metadata !149, metadata !170, metadata !173}
!149 = metadata !{i32 786434, null, metadata !"Request", metadata !89, i32 62, i64 96, i64 32, i32 0, i32 0, null, metadata !150, i32 0, null, null} ; [ DW_TAG_class_type ]
!150 = metadata !{metadata !151, metadata !152, metadata !153, metadata !154, metadata !157, metadata !160, metadata !161, metadata !165}
!151 = metadata !{i32 786445, metadata !149, metadata !"tag", metadata !89, i32 64, i64 8, i64 8, i64 0, i32 0, metadata !125} ; [ DW_TAG_member ]
!152 = metadata !{i32 786445, metadata !149, metadata !"key", metadata !89, i32 66, i64 32, i64 32, i64 32, i32 0, metadata !92} ; [ DW_TAG_member ]
!153 = metadata !{i32 786445, metadata !149, metadata !"insert_value", metadata !89, i32 70, i64 32, i64 32, i64 64, i32 0, metadata !129} ; [ DW_TAG_member ]
!154 = metadata !{i32 786478, i32 0, metadata !149, metadata !"mSearch", metadata !"mSearch", metadata !"_ZN7Request7mSearchEj", metadata !89, i32 74, metadata !155, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !78, i32 74} ; [ DW_TAG_subprogram ]
!155 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !156, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!156 = metadata !{metadata !149, metadata !92}
!157 = metadata !{i32 786478, i32 0, metadata !149, metadata !"mkInsert", metadata !"mkInsert", metadata !"_ZN7Request8mkInsertEjj", metadata !89, i32 75, metadata !158, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !78, i32 75} ; [ DW_TAG_subprogram ]
!158 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !159, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!159 = metadata !{metadata !149, metadata !92, metadata !129}
!160 = metadata !{i32 786478, i32 0, metadata !149, metadata !"mkDelete", metadata !"mkDelete", metadata !"_ZN7Request8mkDeleteEj", metadata !89, i32 76, metadata !155, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !78, i32 76} ; [ DW_TAG_subprogram ]
!161 = metadata !{i32 786478, i32 0, metadata !149, metadata !"Request", metadata !"Request", metadata !"", metadata !89, i32 62, metadata !162, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !78, i32 62} ; [ DW_TAG_subprogram ]
!162 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !163, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!163 = metadata !{null, metadata !164}
!164 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !149} ; [ DW_TAG_pointer_type ]
!165 = metadata !{i32 786478, i32 0, metadata !149, metadata !"Request", metadata !"Request", metadata !"", metadata !89, i32 62, metadata !166, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !78, i32 62} ; [ DW_TAG_subprogram ]
!166 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !167, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!167 = metadata !{null, metadata !164, metadata !168}
!168 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !169} ; [ DW_TAG_reference_type ]
!169 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !149} ; [ DW_TAG_const_type ]
!170 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !171} ; [ DW_TAG_pointer_type ]
!171 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 8192, i64 32, i32 0, i32 0, metadata !88, metadata !172, i32 0, i32 0} ; [ DW_TAG_array_type ]
!172 = metadata !{metadata !103}
!173 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !174} ; [ DW_TAG_pointer_type ]
!174 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 8192, i64 32, i32 0, i32 0, metadata !175, metadata !172, i32 0, i32 0} ; [ DW_TAG_array_type ]
!175 = metadata !{i32 786434, null, metadata !"KV", metadata !89, i32 27, i64 64, i64 32, i32 0, i32 0, null, metadata !176, i32 0, null, null} ; [ DW_TAG_class_type ]
!176 = metadata !{metadata !177, metadata !178}
!177 = metadata !{i32 786445, metadata !175, metadata !"key", metadata !89, i32 28, i64 32, i64 32, i64 0, i32 0, metadata !92} ; [ DW_TAG_member ]
!178 = metadata !{i32 786445, metadata !175, metadata !"value", metadata !89, i32 29, i64 32, i64 32, i64 32, i32 0, metadata !129} ; [ DW_TAG_member ]
!179 = metadata !{i32 790531, metadata !180, metadata !"key_to_metadata.key", null, i32 136, metadata !181, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!180 = metadata !{i32 786689, metadata !146, metadata !"key_to_metadata", metadata !72, i32 33554568, metadata !170, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!181 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 12288, i64 32, i32 0, i32 0, metadata !182, metadata !101, i32 0, i32 0} ; [ DW_TAG_array_type ]
!182 = metadata !{i32 786438, null, metadata !"KMetadata", metadata !89, i32 18, i64 32, i64 32, i32 0, i32 0, null, metadata !183, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!183 = metadata !{metadata !91}
!184 = metadata !{i32 136, i32 13, metadata !146, null}
!185 = metadata !{i32 790531, metadata !180, metadata !"key_to_metadata.occupied", null, i32 136, metadata !104, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!186 = metadata !{i32 211, i32 4, metadata !187, null}
!187 = metadata !{i32 786443, metadata !144, i32 209, i32 52, metadata !72, i32 17} ; [ DW_TAG_lexical_block ]
!188 = metadata !{i32 218, i32 3, metadata !144, null}
!189 = metadata !{i32 220, i32 3, metadata !144, null}
!190 = metadata !{i32 790535, metadata !191, metadata !"agg.result.delete_element_not_found", null, i32 134, metadata !193, i32 0, i32 0} ; [ DW_TAG_arg_variable_field_wo ]
!191 = metadata !{i32 786690, metadata !146, metadata !"agg.result", metadata !72, i32 134, metadata !192, i32 0, i32 0} ; [ DW_TAG_return_variable ]
!192 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !122} ; [ DW_TAG_pointer_type ]
!193 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !194} ; [ DW_TAG_pointer_type ]
!194 = metadata !{i32 786438, null, metadata !"Response", metadata !89, i32 85, i64 8, i64 32, i32 0, i32 0, null, metadata !195, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!195 = metadata !{metadata !130}
