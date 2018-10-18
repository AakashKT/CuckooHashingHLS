; ModuleID = '/home/aakash/Desktop/CDS/CuckooHashingHLS/hls/hashing/solution1/.autopilot/db/a.o.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; [#uses=0]
define i32 @jenkins_one_at_a_time(i32 %length, i8* %key) nounwind uwtable {
  %1 = alloca i32, align 4                        ; [#uses=2 type=i32*]
  %2 = alloca i8*, align 8                        ; [#uses=3 type=i8**]
  %i = alloca i32, align 4                        ; [#uses=4 type=i32*]
  %hash = alloca i32, align 4                     ; [#uses=19 type=i32*]
  store i32 %length, i32* %1, align 4
  call void @llvm.dbg.declare(metadata !{i32* %1}, metadata !35), !dbg !36 ; [debug line = 6:36] [debug variable = length]
  store i8* %key, i8** %2, align 8
  call void @llvm.dbg.declare(metadata !{i8** %2}, metadata !37), !dbg !38 ; [debug line = 6:55] [debug variable = key]
  %3 = load i8** %2, align 8, !dbg !39            ; [#uses=1 type=i8*] [debug line = 7:2]
  call void (...)* @_ssdm_SpecArrayDimSize(i8* %3, i32 1000) nounwind, !dbg !39 ; [debug line = 7:2]
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !41), !dbg !42 ; [debug line = 8:6] [debug variable = i]
  store i32 0, i32* %i, align 4, !dbg !43         ; [debug line = 8:11]
  call void @llvm.dbg.declare(metadata !{i32* %hash}, metadata !44), !dbg !45 ; [debug line = 9:11] [debug variable = hash]
  store i32 0, i32* %hash, align 4, !dbg !46      ; [debug line = 9:19]
  br label %4, !dbg !47                           ; [debug line = 11:2]

; <label>:4                                       ; preds = %8, %0
  %5 = load i32* %i, align 4, !dbg !47            ; [#uses=1 type=i32] [debug line = 11:2]
  %6 = load i32* %1, align 4, !dbg !47            ; [#uses=1 type=i32] [debug line = 11:2]
  %7 = icmp ne i32 %5, %6, !dbg !47               ; [#uses=1 type=i1] [debug line = 11:2]
  br i1 %7, label %8, label %26, !dbg !47         ; [debug line = 11:2]

; <label>:8                                       ; preds = %4
  %9 = load i32* %i, align 4, !dbg !48            ; [#uses=2 type=i32] [debug line = 13:3]
  %10 = add nsw i32 %9, 1, !dbg !48               ; [#uses=1 type=i32] [debug line = 13:3]
  store i32 %10, i32* %i, align 4, !dbg !48       ; [debug line = 13:3]
  %11 = sext i32 %9 to i64, !dbg !48              ; [#uses=1 type=i64] [debug line = 13:3]
  %12 = load i8** %2, align 8, !dbg !48           ; [#uses=1 type=i8*] [debug line = 13:3]
  %13 = getelementptr inbounds i8* %12, i64 %11, !dbg !48 ; [#uses=1 type=i8*] [debug line = 13:3]
  %14 = load i8* %13, align 1, !dbg !48           ; [#uses=1 type=i8] [debug line = 13:3]
  %15 = sext i8 %14 to i32, !dbg !48              ; [#uses=1 type=i32] [debug line = 13:3]
  %16 = load i32* %hash, align 4, !dbg !48        ; [#uses=1 type=i32] [debug line = 13:3]
  %17 = add i32 %16, %15, !dbg !48                ; [#uses=1 type=i32] [debug line = 13:3]
  store i32 %17, i32* %hash, align 4, !dbg !48    ; [debug line = 13:3]
  %18 = load i32* %hash, align 4, !dbg !50        ; [#uses=1 type=i32] [debug line = 14:3]
  %19 = shl i32 %18, 10, !dbg !50                 ; [#uses=1 type=i32] [debug line = 14:3]
  %20 = load i32* %hash, align 4, !dbg !50        ; [#uses=1 type=i32] [debug line = 14:3]
  %21 = add i32 %20, %19, !dbg !50                ; [#uses=1 type=i32] [debug line = 14:3]
  store i32 %21, i32* %hash, align 4, !dbg !50    ; [debug line = 14:3]
  %22 = load i32* %hash, align 4, !dbg !51        ; [#uses=1 type=i32] [debug line = 15:3]
  %23 = lshr i32 %22, 6, !dbg !51                 ; [#uses=1 type=i32] [debug line = 15:3]
  %24 = load i32* %hash, align 4, !dbg !51        ; [#uses=1 type=i32] [debug line = 15:3]
  %25 = xor i32 %24, %23, !dbg !51                ; [#uses=1 type=i32] [debug line = 15:3]
  store i32 %25, i32* %hash, align 4, !dbg !51    ; [debug line = 15:3]
  br label %4, !dbg !52                           ; [debug line = 16:2]

; <label>:26                                      ; preds = %4
  %27 = load i32* %hash, align 4, !dbg !53        ; [#uses=1 type=i32] [debug line = 18:2]
  %28 = shl i32 %27, 3, !dbg !53                  ; [#uses=1 type=i32] [debug line = 18:2]
  %29 = load i32* %hash, align 4, !dbg !53        ; [#uses=1 type=i32] [debug line = 18:2]
  %30 = add i32 %29, %28, !dbg !53                ; [#uses=1 type=i32] [debug line = 18:2]
  store i32 %30, i32* %hash, align 4, !dbg !53    ; [debug line = 18:2]
  %31 = load i32* %hash, align 4, !dbg !54        ; [#uses=1 type=i32] [debug line = 19:2]
  %32 = lshr i32 %31, 11, !dbg !54                ; [#uses=1 type=i32] [debug line = 19:2]
  %33 = load i32* %hash, align 4, !dbg !54        ; [#uses=1 type=i32] [debug line = 19:2]
  %34 = xor i32 %33, %32, !dbg !54                ; [#uses=1 type=i32] [debug line = 19:2]
  store i32 %34, i32* %hash, align 4, !dbg !54    ; [debug line = 19:2]
  %35 = load i32* %hash, align 4, !dbg !55        ; [#uses=1 type=i32] [debug line = 20:2]
  %36 = shl i32 %35, 15, !dbg !55                 ; [#uses=1 type=i32] [debug line = 20:2]
  %37 = load i32* %hash, align 4, !dbg !55        ; [#uses=1 type=i32] [debug line = 20:2]
  %38 = add i32 %37, %36, !dbg !55                ; [#uses=1 type=i32] [debug line = 20:2]
  store i32 %38, i32* %hash, align 4, !dbg !55    ; [debug line = 20:2]
  %39 = load i32* %hash, align 4, !dbg !56        ; [#uses=1 type=i32] [debug line = 22:2]
  ret i32 %39, !dbg !56                           ; [debug line = 22:2]
}

; [#uses=4]
declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

; [#uses=1]
declare void @_ssdm_SpecArrayDimSize(...) nounwind

!llvm.dbg.cu = !{!0}
!opencl.kernels = !{!28}
!hls.encrypted.func = !{}

!0 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/aakash/Desktop/CDS/CuckooHashingHLS/hls/hashing/solution1/.autopilot/db/jenkins_hash.pragma.2.c", metadata !"/home/aakash/Desktop/CDS/CuckooHashingHLS/hls", metadata !"clang version 3.1 ", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !17} ; [ DW_TAG_compile_unit ]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"jenkins_one_at_a_time", metadata !"jenkins_one_at_a_time", metadata !"", metadata !6, i32 6, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8*)* @jenkins_one_at_a_time, null, null, metadata !15, i32 7} ; [ DW_TAG_subprogram ]
!6 = metadata !{i32 786473, metadata !"hashing/jenkins_hash.c", metadata !"/home/aakash/Desktop/CDS/CuckooHashingHLS/hls", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!8 = metadata !{metadata !9, metadata !11, metadata !12}
!9 = metadata !{i32 786454, null, metadata !"uint32_t", metadata !6, i32 51, i64 0, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_typedef ]
!10 = metadata !{i32 786468, null, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!11 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!12 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !13} ; [ DW_TAG_pointer_type ]
!13 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !14} ; [ DW_TAG_const_type ]
!14 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!15 = metadata !{metadata !16}
!16 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!17 = metadata !{metadata !18}
!18 = metadata !{metadata !19, metadata !22, metadata !23, metadata !24, metadata !26}
!19 = metadata !{i32 786484, i32 0, null, metadata !"_IO_2_1_stdin_", metadata !"_IO_2_1_stdin_", metadata !"", metadata !20, i32 315, metadata !21, i32 0, i32 1, null} ; [ DW_TAG_variable ]
!20 = metadata !{i32 786473, metadata !"/usr/include/libio.h", metadata !"/home/aakash/Desktop/CDS/CuckooHashingHLS/hls", null} ; [ DW_TAG_file_type ]
!21 = metadata !{i32 786451, null, metadata !"_IO_FILE_plus", metadata !20, i32 313, i32 0, i32 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ]
!22 = metadata !{i32 786484, i32 0, null, metadata !"_IO_2_1_stdout_", metadata !"_IO_2_1_stdout_", metadata !"", metadata !20, i32 316, metadata !21, i32 0, i32 1, null} ; [ DW_TAG_variable ]
!23 = metadata !{i32 786484, i32 0, null, metadata !"_IO_2_1_stderr_", metadata !"_IO_2_1_stderr_", metadata !"", metadata !20, i32 317, metadata !21, i32 0, i32 1, null} ; [ DW_TAG_variable ]
!24 = metadata !{i32 786484, i32 0, null, metadata !"sys_nerr", metadata !"sys_nerr", metadata !"", metadata !25, i32 26, metadata !11, i32 0, i32 1, null} ; [ DW_TAG_variable ]
!25 = metadata !{i32 786473, metadata !"/usr/include/x86_64-linux-gnu/bits/sys_errlist.h", metadata !"/home/aakash/Desktop/CDS/CuckooHashingHLS/hls", null} ; [ DW_TAG_file_type ]
!26 = metadata !{i32 786484, i32 0, null, metadata !"signgam", metadata !"signgam", metadata !"", metadata !27, i32 168, metadata !11, i32 0, i32 1, null} ; [ DW_TAG_variable ]
!27 = metadata !{i32 786473, metadata !"/usr/include/math.h", metadata !"/home/aakash/Desktop/CDS/CuckooHashingHLS/hls", null} ; [ DW_TAG_file_type ]
!28 = metadata !{i32 (i32, i8*)* @jenkins_one_at_a_time, metadata !29, metadata !30, metadata !31, metadata !32, metadata !33, metadata !34}
!29 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 1}
!30 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none"}
!31 = metadata !{metadata !"kernel_arg_type", metadata !"int", metadata !"char*"}
!32 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"const"}
!33 = metadata !{metadata !"kernel_arg_name", metadata !"length", metadata !"key"}
!34 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!35 = metadata !{i32 786689, metadata !5, metadata !"length", metadata !6, i32 16777222, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!36 = metadata !{i32 6, i32 36, metadata !5, null}
!37 = metadata !{i32 786689, metadata !5, metadata !"key", metadata !6, i32 33554438, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!38 = metadata !{i32 6, i32 55, metadata !5, null}
!39 = metadata !{i32 7, i32 2, metadata !40, null}
!40 = metadata !{i32 786443, metadata !5, i32 7, i32 1, metadata !6, i32 0} ; [ DW_TAG_lexical_block ]
!41 = metadata !{i32 786688, metadata !40, metadata !"i", metadata !6, i32 8, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!42 = metadata !{i32 8, i32 6, metadata !40, null}
!43 = metadata !{i32 8, i32 11, metadata !40, null}
!44 = metadata !{i32 786688, metadata !40, metadata !"hash", metadata !6, i32 9, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!45 = metadata !{i32 9, i32 11, metadata !40, null}
!46 = metadata !{i32 9, i32 19, metadata !40, null}
!47 = metadata !{i32 11, i32 2, metadata !40, null}
!48 = metadata !{i32 13, i32 3, metadata !49, null}
!49 = metadata !{i32 786443, metadata !40, i32 12, i32 2, metadata !6, i32 1} ; [ DW_TAG_lexical_block ]
!50 = metadata !{i32 14, i32 3, metadata !49, null}
!51 = metadata !{i32 15, i32 3, metadata !49, null}
!52 = metadata !{i32 16, i32 2, metadata !49, null}
!53 = metadata !{i32 18, i32 2, metadata !40, null}
!54 = metadata !{i32 19, i32 2, metadata !40, null}
!55 = metadata !{i32 20, i32 2, metadata !40, null}
!56 = metadata !{i32 22, i32 2, metadata !40, null}
