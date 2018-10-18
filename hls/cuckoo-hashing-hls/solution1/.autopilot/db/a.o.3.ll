; ModuleID = '/home/bollu/work/CuckooHashingHLS/hls/cuckoo-hashing-hls/solution1/.autopilot/db/a.o.3.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@axpy_str = internal unnamed_addr constant [5 x i8] c"axpy\00" ; [#uses=1 type=[5 x i8]*]

; [#uses=9]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=0]
define void @axpy([3 x i32]* %in, i32 %a, i32 %b, [3 x i32]* %out) nounwind uwtable {
  call void (...)* @_ssdm_op_SpecBitsMap([3 x i32]* %in) nounwind, !map !7
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %a) nounwind, !map !13
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %b) nounwind, !map !19
  call void (...)* @_ssdm_op_SpecBitsMap([3 x i32]* %out) nounwind, !map !23
  call void (...)* @_ssdm_op_SpecTopModule([5 x i8]* @axpy_str) nounwind
  %b_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %b) nounwind ; [#uses=1 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %b_read}, i64 0, metadata !27), !dbg !36 ; [debug line = 1:33] [debug variable = b]
  %a_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %a) nounwind ; [#uses=1 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %a_read}, i64 0, metadata !37), !dbg !38 ; [debug line = 1:26] [debug variable = a]
  call void @llvm.dbg.value(metadata !{[3 x i32]* %in}, i64 0, metadata !39), !dbg !43 ; [debug line = 1:15] [debug variable = in]
  call void @llvm.dbg.value(metadata !{i32 %a}, i64 0, metadata !37), !dbg !38 ; [debug line = 1:26] [debug variable = a]
  call void @llvm.dbg.value(metadata !{i32 %b}, i64 0, metadata !27), !dbg !36 ; [debug line = 1:33] [debug variable = b]
  call void @llvm.dbg.value(metadata !{[3 x i32]* %out}, i64 0, metadata !44), !dbg !45 ; [debug line = 1:40] [debug variable = out]
  br label %1, !dbg !46                           ; [debug line = 3:15]

; <label>:1                                       ; preds = %2, %0
  %i = phi i2 [ 0, %0 ], [ %i_1, %2 ]             ; [#uses=3 type=i2]
  %exitcond = icmp eq i2 %i, -1, !dbg !46         ; [#uses=1 type=i1] [debug line = 3:15]
  %empty = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3) nounwind ; [#uses=0 type=i32]
  %i_1 = add i2 %i, 1, !dbg !49                   ; [#uses=1 type=i2] [debug line = 3:24]
  br i1 %exitcond, label %3, label %2, !dbg !46   ; [debug line = 3:15]

; <label>:2                                       ; preds = %1
  %tmp = zext i2 %i to i64, !dbg !50              ; [#uses=2 type=i64] [debug line = 4:3]
  %in_addr = getelementptr [3 x i32]* %in, i64 0, i64 %tmp, !dbg !50 ; [#uses=1 type=i32*] [debug line = 4:3]
  %x = load i32* %in_addr, align 4, !dbg !50      ; [#uses=1 type=i32] [debug line = 4:3]
  call void @llvm.dbg.value(metadata !{i32 %x}, i64 0, metadata !52), !dbg !50 ; [debug line = 4:3] [debug variable = x]
  %tmp_1 = mul nsw i32 %x, %a_read, !dbg !53      ; [#uses=1 type=i32] [debug line = 5:3]
  %y = add nsw i32 %tmp_1, %b_read, !dbg !53      ; [#uses=1 type=i32] [debug line = 5:3]
  call void @llvm.dbg.value(metadata !{i32 %y}, i64 0, metadata !54), !dbg !53 ; [debug line = 5:3] [debug variable = y]
  %out_addr = getelementptr [3 x i32]* %out, i64 0, i64 %tmp, !dbg !55 ; [#uses=1 type=i32*] [debug line = 6:3]
  store i32 %y, i32* %out_addr, align 4, !dbg !55 ; [debug line = 6:3]
  call void @llvm.dbg.value(metadata !{i2 %i_1}, i64 0, metadata !56), !dbg !49 ; [debug line = 3:24] [debug variable = i]
  br label %1, !dbg !49                           ; [debug line = 3:24]

; <label>:3                                       ; preds = %1
  ret void, !dbg !57                              ; [debug line = 8:1]
}

; [#uses=1]
define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

; [#uses=1]
define weak i32 @_ssdm_op_SpecLoopTripCount(...) {
entry:
  ret i32 0
}

; [#uses=4]
define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

; [#uses=2]
define weak i32 @_ssdm_op_Read.ap_auto.i32(i32) {
entry:
  ret i32 %0
}

!opencl.kernels = !{!0}
!hls.encrypted.func = !{}
!llvm.map.gv = !{}

!0 = metadata !{null, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5, metadata !6}
!1 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 0, i32 0, i32 1}
!2 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!3 = metadata !{metadata !"kernel_arg_type", metadata !"int*", metadata !"int", metadata !"int", metadata !"int*"}
!4 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !""}
!5 = metadata !{metadata !"kernel_arg_name", metadata !"in", metadata !"a", metadata !"b", metadata !"out"}
!6 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!7 = metadata !{metadata !8}
!8 = metadata !{i32 0, i32 31, metadata !9}
!9 = metadata !{metadata !10}
!10 = metadata !{metadata !"in", metadata !11, metadata !"int", i32 0, i32 31}
!11 = metadata !{metadata !12}
!12 = metadata !{i32 0, i32 2, i32 1}
!13 = metadata !{metadata !14}
!14 = metadata !{i32 0, i32 31, metadata !15}
!15 = metadata !{metadata !16}
!16 = metadata !{metadata !"a", metadata !17, metadata !"int", i32 0, i32 31}
!17 = metadata !{metadata !18}
!18 = metadata !{i32 0, i32 0, i32 0}
!19 = metadata !{metadata !20}
!20 = metadata !{i32 0, i32 31, metadata !21}
!21 = metadata !{metadata !22}
!22 = metadata !{metadata !"b", metadata !17, metadata !"int", i32 0, i32 31}
!23 = metadata !{metadata !24}
!24 = metadata !{i32 0, i32 31, metadata !25}
!25 = metadata !{metadata !26}
!26 = metadata !{metadata !"out", metadata !11, metadata !"int", i32 0, i32 31}
!27 = metadata !{i32 786689, metadata !28, metadata !"b", metadata !29, i32 50331649, metadata !33, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!28 = metadata !{i32 786478, i32 0, metadata !29, metadata !"axpy", metadata !"axpy", metadata !"_Z4axpyPiiiS_", metadata !29, i32 1, metadata !30, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !34, i32 1} ; [ DW_TAG_subprogram ]
!29 = metadata !{i32 786473, metadata !"cuckoo-hashing-hls/solution1/src/conv.cpp", metadata !"/home/bollu/work/CuckooHashingHLS/hls", null} ; [ DW_TAG_file_type ]
!30 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !31, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!31 = metadata !{null, metadata !32, metadata !33, metadata !33, metadata !32}
!32 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !33} ; [ DW_TAG_pointer_type ]
!33 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!34 = metadata !{metadata !35}
!35 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!36 = metadata !{i32 1, i32 33, metadata !28, null}
!37 = metadata !{i32 786689, metadata !28, metadata !"a", metadata !29, i32 33554433, metadata !33, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!38 = metadata !{i32 1, i32 26, metadata !28, null}
!39 = metadata !{i32 786689, metadata !28, metadata !"in", null, i32 1, metadata !40, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!40 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 96, i64 32, i32 0, i32 0, metadata !33, metadata !41, i32 0, i32 0} ; [ DW_TAG_array_type ]
!41 = metadata !{metadata !42}
!42 = metadata !{i32 786465, i64 0, i64 2}        ; [ DW_TAG_subrange_type ]
!43 = metadata !{i32 1, i32 15, metadata !28, null}
!44 = metadata !{i32 786689, metadata !28, metadata !"out", null, i32 1, metadata !40, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!45 = metadata !{i32 1, i32 40, metadata !28, null}
!46 = metadata !{i32 3, i32 15, metadata !47, null}
!47 = metadata !{i32 786443, metadata !48, i32 3, i32 2, metadata !29, i32 1} ; [ DW_TAG_lexical_block ]
!48 = metadata !{i32 786443, metadata !28, i32 1, i32 48, metadata !29, i32 0} ; [ DW_TAG_lexical_block ]
!49 = metadata !{i32 3, i32 24, metadata !47, null}
!50 = metadata !{i32 4, i32 3, metadata !51, null}
!51 = metadata !{i32 786443, metadata !47, i32 3, i32 29, metadata !29, i32 2} ; [ DW_TAG_lexical_block ]
!52 = metadata !{i32 786688, metadata !48, metadata !"x", metadata !29, i32 2, metadata !33, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!53 = metadata !{i32 5, i32 3, metadata !51, null}
!54 = metadata !{i32 786688, metadata !48, metadata !"y", metadata !29, i32 2, metadata !33, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!55 = metadata !{i32 6, i32 3, metadata !51, null}
!56 = metadata !{i32 786688, metadata !47, metadata !"i", metadata !29, i32 3, metadata !33, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!57 = metadata !{i32 8, i32 1, metadata !48, null}
