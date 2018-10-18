; ModuleID = '/home/bollu/work/CuckooHashingHLS/hls/cuckoo-hashing-hls/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@axpy.str = internal unnamed_addr constant [5 x i8] c"axpy\00" ; [#uses=1 type=[5 x i8]*]

; [#uses=7]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=0]
define void @axpy([3 x i32]* %in, i32 %a, i32 %b, [3 x i32]* %out) nounwind uwtable {
  call void (...)* @_ssdm_op_SpecBitsMap([3 x i32]* %in) nounwind, !map !20
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %a) nounwind, !map !26
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %b) nounwind, !map !32
  call void (...)* @_ssdm_op_SpecBitsMap([3 x i32]* %out) nounwind, !map !36
  call void (...)* @_ssdm_op_SpecTopModule([5 x i8]* @axpy.str) nounwind
  call void @llvm.dbg.value(metadata !{[3 x i32]* %in}, i64 0, metadata !40), !dbg !44 ; [debug line = 1:15] [debug variable = in]
  call void @llvm.dbg.value(metadata !{i32 %a}, i64 0, metadata !45), !dbg !46 ; [debug line = 1:26] [debug variable = a]
  call void @llvm.dbg.value(metadata !{i32 %b}, i64 0, metadata !47), !dbg !48 ; [debug line = 1:33] [debug variable = b]
  call void @llvm.dbg.value(metadata !{[3 x i32]* %out}, i64 0, metadata !49), !dbg !50 ; [debug line = 1:40] [debug variable = out]
  br label %1, !dbg !51                           ; [debug line = 3:15]

; <label>:1                                       ; preds = %3, %0
  %i = phi i2 [ 0, %0 ], [ %i.1, %3 ]             ; [#uses=3 type=i2]
  %exitcond = icmp eq i2 %i, -1, !dbg !51         ; [#uses=1 type=i1] [debug line = 3:15]
  %2 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3) nounwind ; [#uses=0 type=i32]
  br i1 %exitcond, label %4, label %3, !dbg !51   ; [debug line = 3:15]

; <label>:3                                       ; preds = %1
  %tmp = zext i2 %i to i64, !dbg !54              ; [#uses=2 type=i64] [debug line = 4:3]
  %in.addr = getelementptr [3 x i32]* %in, i64 0, i64 %tmp, !dbg !54 ; [#uses=1 type=i32*] [debug line = 4:3]
  %x = load i32* %in.addr, align 4, !dbg !54      ; [#uses=1 type=i32] [debug line = 4:3]
  call void @llvm.dbg.value(metadata !{i32 %x}, i64 0, metadata !56), !dbg !54 ; [debug line = 4:3] [debug variable = x]
  %tmp.1 = mul nsw i32 %x, %a, !dbg !57           ; [#uses=1 type=i32] [debug line = 5:3]
  %y = add nsw i32 %tmp.1, %b, !dbg !57           ; [#uses=1 type=i32] [debug line = 5:3]
  call void @llvm.dbg.value(metadata !{i32 %y}, i64 0, metadata !58), !dbg !57 ; [debug line = 5:3] [debug variable = y]
  %out.addr = getelementptr [3 x i32]* %out, i64 0, i64 %tmp, !dbg !59 ; [#uses=1 type=i32*] [debug line = 6:3]
  store i32 %y, i32* %out.addr, align 4, !dbg !59 ; [debug line = 6:3]
  %i.1 = add i2 %i, 1, !dbg !60                   ; [#uses=1 type=i2] [debug line = 3:24]
  call void @llvm.dbg.value(metadata !{i2 %i.1}, i64 0, metadata !61), !dbg !60 ; [debug line = 3:24] [debug variable = i]
  br label %1, !dbg !60                           ; [debug line = 3:24]

; <label>:4                                       ; preds = %1
  ret void, !dbg !62                              ; [debug line = 8:1]
}

; [#uses=1]
declare void @_ssdm_op_SpecTopModule(...)

; [#uses=1]
declare i32 @_ssdm_op_SpecLoopTripCount(...)

; [#uses=4]
declare void @_ssdm_op_SpecBitsMap(...)

!llvm.dbg.cu = !{!0}
!opencl.kernels = !{!13}
!hls.encrypted.func = !{}
!llvm.map.gv = !{}

!0 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/bollu/work/CuckooHashingHLS/hls/cuckoo-hashing-hls/solution1/.autopilot/db/conv.pragma.2.cpp", metadata !"/home/bollu/work/CuckooHashingHLS/hls", metadata !"clang version 3.1 ", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !1} ; [ DW_TAG_compile_unit ]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"axpy", metadata !"axpy", metadata !"_Z4axpyPiiiS_", metadata !6, i32 1, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !11, i32 1} ; [ DW_TAG_subprogram ]
!6 = metadata !{i32 786473, metadata !"cuckoo-hashing-hls/solution1/src/conv.cpp", metadata !"/home/bollu/work/CuckooHashingHLS/hls", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!8 = metadata !{null, metadata !9, metadata !10, metadata !10, metadata !9}
!9 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ]
!10 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!11 = metadata !{metadata !12}
!12 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!13 = metadata !{null, metadata !14, metadata !15, metadata !16, metadata !17, metadata !18, metadata !19}
!14 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 0, i32 0, i32 1}
!15 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!16 = metadata !{metadata !"kernel_arg_type", metadata !"int*", metadata !"int", metadata !"int", metadata !"int*"}
!17 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !""}
!18 = metadata !{metadata !"kernel_arg_name", metadata !"in", metadata !"a", metadata !"b", metadata !"out"}
!19 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!20 = metadata !{metadata !21}
!21 = metadata !{i32 0, i32 31, metadata !22}
!22 = metadata !{metadata !23}
!23 = metadata !{metadata !"in", metadata !24, metadata !"int", i32 0, i32 31}
!24 = metadata !{metadata !25}
!25 = metadata !{i32 0, i32 2, i32 1}
!26 = metadata !{metadata !27}
!27 = metadata !{i32 0, i32 31, metadata !28}
!28 = metadata !{metadata !29}
!29 = metadata !{metadata !"a", metadata !30, metadata !"int", i32 0, i32 31}
!30 = metadata !{metadata !31}
!31 = metadata !{i32 0, i32 0, i32 0}
!32 = metadata !{metadata !33}
!33 = metadata !{i32 0, i32 31, metadata !34}
!34 = metadata !{metadata !35}
!35 = metadata !{metadata !"b", metadata !30, metadata !"int", i32 0, i32 31}
!36 = metadata !{metadata !37}
!37 = metadata !{i32 0, i32 31, metadata !38}
!38 = metadata !{metadata !39}
!39 = metadata !{metadata !"out", metadata !24, metadata !"int", i32 0, i32 31}
!40 = metadata !{i32 786689, metadata !5, metadata !"in", null, i32 1, metadata !41, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!41 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 96, i64 32, i32 0, i32 0, metadata !10, metadata !42, i32 0, i32 0} ; [ DW_TAG_array_type ]
!42 = metadata !{metadata !43}
!43 = metadata !{i32 786465, i64 0, i64 2}        ; [ DW_TAG_subrange_type ]
!44 = metadata !{i32 1, i32 15, metadata !5, null}
!45 = metadata !{i32 786689, metadata !5, metadata !"a", metadata !6, i32 33554433, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!46 = metadata !{i32 1, i32 26, metadata !5, null}
!47 = metadata !{i32 786689, metadata !5, metadata !"b", metadata !6, i32 50331649, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!48 = metadata !{i32 1, i32 33, metadata !5, null}
!49 = metadata !{i32 786689, metadata !5, metadata !"out", null, i32 1, metadata !41, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!50 = metadata !{i32 1, i32 40, metadata !5, null}
!51 = metadata !{i32 3, i32 15, metadata !52, null}
!52 = metadata !{i32 786443, metadata !53, i32 3, i32 2, metadata !6, i32 1} ; [ DW_TAG_lexical_block ]
!53 = metadata !{i32 786443, metadata !5, i32 1, i32 48, metadata !6, i32 0} ; [ DW_TAG_lexical_block ]
!54 = metadata !{i32 4, i32 3, metadata !55, null}
!55 = metadata !{i32 786443, metadata !52, i32 3, i32 29, metadata !6, i32 2} ; [ DW_TAG_lexical_block ]
!56 = metadata !{i32 786688, metadata !53, metadata !"x", metadata !6, i32 2, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!57 = metadata !{i32 5, i32 3, metadata !55, null}
!58 = metadata !{i32 786688, metadata !53, metadata !"y", metadata !6, i32 2, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!59 = metadata !{i32 6, i32 3, metadata !55, null}
!60 = metadata !{i32 3, i32 24, metadata !52, null}
!61 = metadata !{i32 786688, metadata !52, metadata !"i", metadata !6, i32 3, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!62 = metadata !{i32 8, i32 1, metadata !53, null}
