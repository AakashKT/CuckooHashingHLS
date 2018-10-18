; ModuleID = '/home/bollu/work/CuckooHashingHLS/hls/cuckoo-hashing-hls/solution1/.autopilot/db/a.o.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; [#uses=0]
define void @_Z4axpyPiiiS_(i32* %in, i32 %a, i32 %b, i32* %out) nounwind uwtable {
  %1 = alloca i32*, align 8                       ; [#uses=3 type=i32**]
  %2 = alloca i32, align 4                        ; [#uses=2 type=i32*]
  %3 = alloca i32, align 4                        ; [#uses=2 type=i32*]
  %4 = alloca i32*, align 8                       ; [#uses=3 type=i32**]
  %x = alloca i32, align 4                        ; [#uses=2 type=i32*]
  %y = alloca i32, align 4                        ; [#uses=2 type=i32*]
  %i = alloca i32, align 4                        ; [#uses=6 type=i32*]
  store i32* %in, i32** %1, align 8
  call void @llvm.dbg.declare(metadata !{i32** %1}, metadata !20), !dbg !21 ; [debug line = 1:15] [debug variable = in]
  store i32 %a, i32* %2, align 4
  call void @llvm.dbg.declare(metadata !{i32* %2}, metadata !22), !dbg !23 ; [debug line = 1:26] [debug variable = a]
  store i32 %b, i32* %3, align 4
  call void @llvm.dbg.declare(metadata !{i32* %3}, metadata !24), !dbg !25 ; [debug line = 1:33] [debug variable = b]
  store i32* %out, i32** %4, align 8
  call void @llvm.dbg.declare(metadata !{i32** %4}, metadata !26), !dbg !27 ; [debug line = 1:40] [debug variable = out]
  %5 = load i32** %1, align 8, !dbg !28           ; [#uses=1 type=i32*] [debug line = 1:49]
  call void (...)* @_ssdm_SpecArrayDimSize(i32* %5, i32 3) nounwind, !dbg !28 ; [debug line = 1:49]
  %6 = load i32** %4, align 8, !dbg !30           ; [#uses=1 type=i32*] [debug line = 1:78]
  call void (...)* @_ssdm_SpecArrayDimSize(i32* %6, i32 3) nounwind, !dbg !30 ; [debug line = 1:78]
  call void @llvm.dbg.declare(metadata !{i32* %x}, metadata !31), !dbg !32 ; [debug line = 2:6] [debug variable = x]
  call void @llvm.dbg.declare(metadata !{i32* %y}, metadata !33), !dbg !34 ; [debug line = 2:8] [debug variable = y]
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !35), !dbg !37 ; [debug line = 3:10] [debug variable = i]
  store i32 0, i32* %i, align 4, !dbg !38         ; [debug line = 3:15]
  br label %7, !dbg !38                           ; [debug line = 3:15]

; <label>:7                                       ; preds = %26, %0
  %8 = load i32* %i, align 4, !dbg !38            ; [#uses=1 type=i32] [debug line = 3:15]
  %9 = icmp slt i32 %8, 3, !dbg !38               ; [#uses=1 type=i1] [debug line = 3:15]
  br i1 %9, label %10, label %29, !dbg !38        ; [debug line = 3:15]

; <label>:10                                      ; preds = %7
  %11 = load i32* %i, align 4, !dbg !39           ; [#uses=1 type=i32] [debug line = 4:3]
  %12 = sext i32 %11 to i64, !dbg !39             ; [#uses=1 type=i64] [debug line = 4:3]
  %13 = load i32** %1, align 8, !dbg !39          ; [#uses=1 type=i32*] [debug line = 4:3]
  %14 = getelementptr inbounds i32* %13, i64 %12, !dbg !39 ; [#uses=1 type=i32*] [debug line = 4:3]
  %15 = load i32* %14, align 4, !dbg !39          ; [#uses=1 type=i32] [debug line = 4:3]
  store i32 %15, i32* %x, align 4, !dbg !39       ; [debug line = 4:3]
  %16 = load i32* %2, align 4, !dbg !41           ; [#uses=1 type=i32] [debug line = 5:3]
  %17 = load i32* %x, align 4, !dbg !41           ; [#uses=1 type=i32] [debug line = 5:3]
  %18 = mul nsw i32 %16, %17, !dbg !41            ; [#uses=1 type=i32] [debug line = 5:3]
  %19 = load i32* %3, align 4, !dbg !41           ; [#uses=1 type=i32] [debug line = 5:3]
  %20 = add nsw i32 %18, %19, !dbg !41            ; [#uses=1 type=i32] [debug line = 5:3]
  store i32 %20, i32* %y, align 4, !dbg !41       ; [debug line = 5:3]
  %21 = load i32* %y, align 4, !dbg !42           ; [#uses=1 type=i32] [debug line = 6:3]
  %22 = load i32* %i, align 4, !dbg !42           ; [#uses=1 type=i32] [debug line = 6:3]
  %23 = sext i32 %22 to i64, !dbg !42             ; [#uses=1 type=i64] [debug line = 6:3]
  %24 = load i32** %4, align 8, !dbg !42          ; [#uses=1 type=i32*] [debug line = 6:3]
  %25 = getelementptr inbounds i32* %24, i64 %23, !dbg !42 ; [#uses=1 type=i32*] [debug line = 6:3]
  store i32 %21, i32* %25, align 4, !dbg !42      ; [debug line = 6:3]
  br label %26, !dbg !43                          ; [debug line = 7:2]

; <label>:26                                      ; preds = %10
  %27 = load i32* %i, align 4, !dbg !44           ; [#uses=1 type=i32] [debug line = 3:24]
  %28 = add nsw i32 %27, 1, !dbg !44              ; [#uses=1 type=i32] [debug line = 3:24]
  store i32 %28, i32* %i, align 4, !dbg !44       ; [debug line = 3:24]
  br label %7, !dbg !44                           ; [debug line = 3:24]

; <label>:29                                      ; preds = %7
  ret void, !dbg !45                              ; [debug line = 8:1]
}

; [#uses=7]
declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

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
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"axpy", metadata !"axpy", metadata !"_Z4axpyPiiiS_", metadata !6, i32 1, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32*, i32, i32, i32*)* @_Z4axpyPiiiS_, null, null, metadata !11, i32 1} ; [ DW_TAG_subprogram ]
!6 = metadata !{i32 786473, metadata !"cuckoo-hashing-hls/solution1/src/conv.cpp", metadata !"/home/bollu/work/CuckooHashingHLS/hls", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!8 = metadata !{null, metadata !9, metadata !10, metadata !10, metadata !9}
!9 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ]
!10 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!11 = metadata !{metadata !12}
!12 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!13 = metadata !{void (i32*, i32, i32, i32*)* @_Z4axpyPiiiS_, metadata !14, metadata !15, metadata !16, metadata !17, metadata !18, metadata !19}
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
!31 = metadata !{i32 786688, metadata !29, metadata !"x", metadata !6, i32 2, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!32 = metadata !{i32 2, i32 6, metadata !29, null}
!33 = metadata !{i32 786688, metadata !29, metadata !"y", metadata !6, i32 2, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!34 = metadata !{i32 2, i32 8, metadata !29, null}
!35 = metadata !{i32 786688, metadata !36, metadata !"i", metadata !6, i32 3, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!36 = metadata !{i32 786443, metadata !29, i32 3, i32 2, metadata !6, i32 1} ; [ DW_TAG_lexical_block ]
!37 = metadata !{i32 3, i32 10, metadata !36, null}
!38 = metadata !{i32 3, i32 15, metadata !36, null}
!39 = metadata !{i32 4, i32 3, metadata !40, null}
!40 = metadata !{i32 786443, metadata !36, i32 3, i32 29, metadata !6, i32 2} ; [ DW_TAG_lexical_block ]
!41 = metadata !{i32 5, i32 3, metadata !40, null}
!42 = metadata !{i32 6, i32 3, metadata !40, null}
!43 = metadata !{i32 7, i32 2, metadata !40, null}
!44 = metadata !{i32 3, i32 24, metadata !36, null}
!45 = metadata !{i32 8, i32 1, metadata !29, null}
