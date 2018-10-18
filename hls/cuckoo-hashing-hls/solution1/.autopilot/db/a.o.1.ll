; ModuleID = '/home/bollu/work/CuckooHashingHLS/hls/cuckoo-hashing-hls/solution1/.autopilot/db/a.g.1.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@axpy.str = internal unnamed_addr constant [5 x i8] c"axpy\00" ; [#uses=1 type=[5 x i8]*]

; [#uses=7]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=0]
define void @axpy(i32* %in, i32 %a, i32 %b, i32* %out) nounwind uwtable {
  call void (...)* @_ssdm_op_SpecTopModule([5 x i8]* @axpy.str) nounwind
  call void @llvm.dbg.value(metadata !{i32* %in}, i64 0, metadata !20), !dbg !21 ; [debug line = 1:15] [debug variable = in]
  call void @llvm.dbg.value(metadata !{i32 %a}, i64 0, metadata !22), !dbg !23 ; [debug line = 1:26] [debug variable = a]
  call void @llvm.dbg.value(metadata !{i32 %b}, i64 0, metadata !24), !dbg !25 ; [debug line = 1:33] [debug variable = b]
  call void @llvm.dbg.value(metadata !{i32* %out}, i64 0, metadata !26), !dbg !27 ; [debug line = 1:40] [debug variable = out]
  call void (...)* @_ssdm_SpecArrayDimSize(i32* %in, i32 3) nounwind, !dbg !28 ; [debug line = 1:49]
  call void (...)* @_ssdm_SpecArrayDimSize(i32* %out, i32 3) nounwind, !dbg !30 ; [debug line = 1:78]
  br label %1, !dbg !31                           ; [debug line = 3:15]

; <label>:1                                       ; preds = %2, %0
  %i = phi i32 [ 0, %0 ], [ %i.1, %2 ]            ; [#uses=3 type=i32]
  %exitcond = icmp eq i32 %i, 3, !dbg !31         ; [#uses=1 type=i1] [debug line = 3:15]
  br i1 %exitcond, label %3, label %2, !dbg !31   ; [debug line = 3:15]

; <label>:2                                       ; preds = %1
  %tmp = sext i32 %i to i64, !dbg !33             ; [#uses=2 type=i64] [debug line = 4:3]
  %in.addr = getelementptr inbounds i32* %in, i64 %tmp, !dbg !33 ; [#uses=1 type=i32*] [debug line = 4:3]
  %x = load i32* %in.addr, align 4, !dbg !33      ; [#uses=2 type=i32] [debug line = 4:3]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %x) nounwind
  call void @llvm.dbg.value(metadata !{i32 %x}, i64 0, metadata !35), !dbg !33 ; [debug line = 4:3] [debug variable = x]
  %tmp.1 = mul nsw i32 %x, %a, !dbg !36           ; [#uses=1 type=i32] [debug line = 5:3]
  %y = add nsw i32 %tmp.1, %b, !dbg !36           ; [#uses=1 type=i32] [debug line = 5:3]
  call void @llvm.dbg.value(metadata !{i32 %y}, i64 0, metadata !37), !dbg !36 ; [debug line = 5:3] [debug variable = y]
  %out.addr = getelementptr inbounds i32* %out, i64 %tmp, !dbg !38 ; [#uses=1 type=i32*] [debug line = 6:3]
  store i32 %y, i32* %out.addr, align 4, !dbg !38 ; [debug line = 6:3]
  %i.1 = add nsw i32 %i, 1, !dbg !39              ; [#uses=1 type=i32] [debug line = 3:24]
  call void @llvm.dbg.value(metadata !{i32 %i.1}, i64 0, metadata !40), !dbg !39 ; [debug line = 3:24] [debug variable = i]
  br label %1, !dbg !39                           ; [debug line = 3:24]

; <label>:3                                       ; preds = %1
  ret void, !dbg !41                              ; [debug line = 8:1]
}

; [#uses=1]
declare void @_ssdm_op_SpecTopModule(...)

; [#uses=1]
declare void @_ssdm_SpecKeepArrayLoad(...)

; [#uses=2]
declare void @_ssdm_SpecArrayDimSize(...) nounwind

!llvm.dbg.cu = !{!0}
!opencl.kernels = !{!13}
!hls.encrypted.func = !{}

!0 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/bollu/work/CuckooHashingHLS/hls/cuckoo-hashing-hls/solution1/.autopilot/db/conv.pragma.2.cpp", metadata !"/home/bollu/work/CuckooHashingHLS/hls", metadata !"clang version 3.1 ", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !1} ; [ DW_TAG_compile_unit ]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"axpy", metadata !"axpy", metadata !"_Z4axpyPiiiS_", metadata !6, i32 1, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32*, i32, i32, i32*)* @axpy, null, null, metadata !11, i32 1} ; [ DW_TAG_subprogram ]
!6 = metadata !{i32 786473, metadata !"cuckoo-hashing-hls/solution1/src/conv.cpp", metadata !"/home/bollu/work/CuckooHashingHLS/hls", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!8 = metadata !{null, metadata !9, metadata !10, metadata !10, metadata !9}
!9 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ]
!10 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!11 = metadata !{metadata !12}
!12 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!13 = metadata !{void (i32*, i32, i32, i32*)* @axpy, metadata !14, metadata !15, metadata !16, metadata !17, metadata !18, metadata !19}
!14 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 0, i32 0, i32 1}
!15 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!16 = metadata !{metadata !"kernel_arg_type", metadata !"int*", metadata !"int", metadata !"int", metadata !"int*"}
!17 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !""}
!18 = metadata !{metadata !"kernel_arg_name", metadata !"in", metadata !"a", metadata !"b", metadata !"out"}
!19 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!20 = metadata !{i32 786689, metadata !5, metadata !"in", metadata !6, i32 16777217, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!21 = metadata !{i32 1, i32 15, metadata !5, null}
!22 = metadata !{i32 786689, metadata !5, metadata !"a", metadata !6, i32 33554433, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!23 = metadata !{i32 1, i32 26, metadata !5, null}
!24 = metadata !{i32 786689, metadata !5, metadata !"b", metadata !6, i32 50331649, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!25 = metadata !{i32 1, i32 33, metadata !5, null}
!26 = metadata !{i32 786689, metadata !5, metadata !"out", metadata !6, i32 67108865, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!27 = metadata !{i32 1, i32 40, metadata !5, null}
!28 = metadata !{i32 1, i32 49, metadata !29, null}
!29 = metadata !{i32 786443, metadata !5, i32 1, i32 48, metadata !6, i32 0} ; [ DW_TAG_lexical_block ]
!30 = metadata !{i32 1, i32 78, metadata !29, null}
!31 = metadata !{i32 3, i32 15, metadata !32, null}
!32 = metadata !{i32 786443, metadata !29, i32 3, i32 2, metadata !6, i32 1} ; [ DW_TAG_lexical_block ]
!33 = metadata !{i32 4, i32 3, metadata !34, null}
!34 = metadata !{i32 786443, metadata !32, i32 3, i32 29, metadata !6, i32 2} ; [ DW_TAG_lexical_block ]
!35 = metadata !{i32 786688, metadata !29, metadata !"x", metadata !6, i32 2, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!36 = metadata !{i32 5, i32 3, metadata !34, null}
!37 = metadata !{i32 786688, metadata !29, metadata !"y", metadata !6, i32 2, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!38 = metadata !{i32 6, i32 3, metadata !34, null}
!39 = metadata !{i32 3, i32 24, metadata !32, null}
!40 = metadata !{i32 786688, metadata !32, metadata !"i", metadata !6, i32 3, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!41 = metadata !{i32 8, i32 1, metadata !29, null}
