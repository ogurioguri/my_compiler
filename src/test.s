/home/oguricap/.jdks/openjdk-22.0.2/bin/java -Dfile.encoding=UTF-8 -Dsun.stdout.encoding=UTF-8 -Dsun.stderr.encoding=UTF-8 -classpath /home/oguricap/MxCompiler/out/production/MxCompiler:/home/oguricap/Compiler-Design-Implementation-master/lib/antlr-4.13.2-complete Main
      .section text
      .globl main
main:
      addi    sp, sp, 0
main_entry:
      # %_0 = call ptr @_malloc_array(i32 4, i32 100)
      li      vr0, 4
      mv      a0, vr0
      li      vr1, 100
      mv      a1, vr1
      sw      ra, 0(sp)
      call    _malloc_array
      mv      vr2, a0
      lw      ra, 0(sp)
      # br label %for.cond.0
      li      vr186, 0
      mv      vr3, vr186
      li      vr188, 0
      mv      vr187, vr188
      li      vr191, 0
      mv      vr190, vr191
      j       main_for.cond.0
main_for.cond.0:
      # %_3 = icmp slt i32 %_1.0, 100
      li      vr4, 100
      sub     vr5, vr3, vr4
      sltz    vr6, vr5
      mv      vr7, vr6
      # br i1 %_3, label %for.body.0, label %for.end.0
      beqz     vr7, main_for.end.0
main_for.body.0:
      # %_4 = getelementptr ptr, ptr %_0, i32 %_1.0
      li      vr10, 4
      mul     vr8, vr3, vr10
      add     vr9, vr2, vr8
      mv      vr11, vr9
      # %_5 = call ptr @_malloc_array(i32 4, i32 200)
      li      vr12, 4
      mv      a0, vr12
      li      vr13, 200
      mv      a1, vr13
      sw      ra, 4(sp)
      call    _malloc_array
      mv      vr14, a0
      lw      ra, 4(sp)
      # br label %for.cond.1
      mv      vr189, vr187
      li      vr192, 0
      mv      vr15, vr192
      j       main_for.cond.1
main_for.cond.1:
      # %_8 = icmp slt i32 %_6.1, 200
      li      vr16, 200
      sub     vr17, vr15, vr16
      sltz    vr18, vr17
      mv      vr19, vr18
      # br i1 %_8, label %for.body.1, label %for.end.1
      beqz     vr19, main_for.end.1
main_for.body.1:
      # %_9 = getelementptr ptr, ptr %_5, i32 %_6.1
      li      vr22, 4
      mul     vr20, vr15, vr22
      add     vr21, vr14, vr20
      mv      vr23, vr21
      # %_10 = call ptr @_malloc_array(i32 4, i32 300)
      li      vr24, 4
      mv      a0, vr24
      li      vr25, 300
      mv      a1, vr25
      sw      ra, 8(sp)
      call    _malloc_array
      mv      vr26, a0
      lw      ra, 8(sp)
      # br label %for.cond.2
      li      vr193, 0
      mv      vr27, vr193
      j       main_for.cond.2
main_for.cond.2:
      # %_13 = icmp slt i32 %_11.2, 300
      li      vr28, 300
      sub     vr29, vr27, vr28
      sltz    vr30, vr29
      mv      vr31, vr30
      # br i1 %_13, label %for.body.2, label %for.end.2
      beqz     vr31, main_for.end.2
main_for.body.2:
      # %_14 = getelementptr ptr, ptr %_10, i32 %_11.2
      li      vr34, 4
      mul     vr32, vr27, vr34
      add     vr33, vr26, vr32
      mv      vr35, vr33
      # %_15 = call ptr @_malloc_array(i32 4, i32 500)
      li      vr36, 4
      mv      a0, vr36
      li      vr37, 500
      mv      a1, vr37
      sw      ra, 12(sp)
      call    _malloc_array
      mv      vr38, a0
      lw      ra, 12(sp)
      # store ptr %_15, ptr %_14
      sw      vr38, 0(vr35)
      # br label %for.step.2
      j       main_for.step.2
main_for.step.2:
      # %_16 = add i32 %_11.2, 1
      li      vr40, 1
      add     vr39, vr27, vr40
      # br label %for.cond.2
      mv      vr27, vr39
      j       main_for.cond.2
main_for.end.2:
      # store ptr %_10, ptr %_9
      sw      vr26, 0(vr23)
      # br label %for.step.1
      j       main_for.step.1
main_for.step.1:
      # %_17 = add i32 %_6.1, 1
      li      vr42, 1
      add     vr41, vr15, vr42
      # br label %for.cond.1
      mv      vr189, vr27
      mv      vr15, vr41
      j       main_for.cond.1
main_for.end.1:
      # store ptr %_5, ptr %_4
      sw      vr14, 0(vr11)
      # br label %for.step.0
      j       main_for.step.0
main_for.step.0:
      # %_18 = add i32 %_1.0, 1
      li      vr44, 1
      add     vr43, vr3, vr44
      # br label %for.cond.0
      mv      vr3, vr43
      mv      vr187, vr189
      mv      vr190, vr15
      j       main_for.cond.0
main_for.end.0:
      # %_20 = getelementptr ptr, ptr %_0, i32 3
      li      vr45, 3
      li      vr48, 4
      mul     vr46, vr45, vr48
      add     vr47, vr2, vr46
      mv      vr49, vr47
      # %_21 = load ptr, ptr %_20
      lw      vr50, 0(vr49)
      # %_23 = getelementptr ptr, ptr %_21, i32 7
      li      vr51, 7
      li      vr54, 4
      mul     vr52, vr51, vr54
      add     vr53, vr50, vr52
      mv      vr55, vr53
      # %_24 = load ptr, ptr %_23
      lw      vr56, 0(vr55)
      # %_26 = getelementptr ptr, ptr %_21, i32 7
      li      vr57, 7
      li      vr60, 4
      mul     vr58, vr57, vr60
      add     vr59, vr50, vr58
      mv      vr61, vr59
      # %_27 = load ptr, ptr %_26
      lw      vr62, 0(vr61)
      # %_28 = getelementptr ptr, ptr %_27, i32 8
      li      vr63, 8
      li      vr66, 4
      mul     vr64, vr63, vr66
      add     vr65, vr62, vr64
      mv      vr67, vr65
      # %_29 = load ptr, ptr %_28
      lw      vr68, 0(vr67)
      # %_30 = getelementptr i32, ptr %_29, i32 9
      li      vr69, 9
      li      vr72, 4
      mul     vr70, vr69, vr72
      add     vr71, vr68, vr70
      mv      vr73, vr71
      # %_31 = load i32, ptr %_30
      lw      vr74, 0(vr73)
      # %_33 = getelementptr ptr, ptr %_24, i32 2
      li      vr75, 2
      li      vr78, 4
      mul     vr76, vr75, vr78
      add     vr77, vr56, vr76
      mv      vr79, vr77
      # %_34 = load ptr, ptr %_33
      lw      vr80, 0(vr79)
      # %_35 = getelementptr i32, ptr %_34, i32 1
      li      vr81, 1
      li      vr84, 4
      mul     vr82, vr81, vr84
      add     vr83, vr80, vr82
      mv      vr85, vr83
      # %_36 = load i32, ptr %_35
      lw      vr86, 0(vr85)
      # %_38 = getelementptr ptr, ptr %_21, i32 1
      li      vr87, 1
      li      vr90, 4
      mul     vr88, vr87, vr90
      add     vr89, vr50, vr88
      mv      vr91, vr89
      # %_39 = load ptr, ptr %_38
      lw      vr92, 0(vr91)
      # %_40 = getelementptr ptr, ptr %_39, i32 2
      li      vr93, 2
      li      vr96, 4
      mul     vr94, vr93, vr96
      add     vr95, vr92, vr94
      mv      vr97, vr95
      # %_41 = load ptr, ptr %_40
      lw      vr98, 0(vr97)
      # %_42 = getelementptr i32, ptr %_41, i32 3
      li      vr99, 3
      li      vr102, 4
      mul     vr100, vr99, vr102
      add     vr101, vr98, vr100
      mv      vr103, vr101
      # %_43 = load i32, ptr %_42
      lw      vr104, 0(vr103)
      # %_44 = icmp eq i32 %_36, %_43
      sub     vr105, vr86, vr104
      seqz    vr106, vr105
      mv      vr107, vr106
      # br i1 %_44, label %if.then.0, label %if.else.0
      beqz     vr107, main_if.else.0
main_if.then.0:
      # %_46 = getelementptr ptr, ptr %_24, i32 2
      li      vr108, 2
      li      vr111, 4
      mul     vr109, vr108, vr111
      add     vr110, vr56, vr109
      mv      vr112, vr110
      # %_47 = load ptr, ptr %_46
      lw      vr113, 0(vr112)
      # %_48 = getelementptr i32, ptr %_47, i32 2
      li      vr114, 2
      li      vr117, 4
      mul     vr115, vr114, vr117
      add     vr116, vr113, vr115
      mv      vr118, vr116
      # %_49 = load i32, ptr %_48
      lw      vr119, 0(vr118)
      # %_51 = getelementptr ptr, ptr %_0, i32 1
      li      vr120, 1
      li      vr123, 4
      mul     vr121, vr120, vr123
      add     vr122, vr2, vr121
      mv      vr124, vr122
      # %_52 = load ptr, ptr %_51
      lw      vr125, 0(vr124)
      # %_53 = getelementptr ptr, ptr %_52, i32 2
      li      vr126, 2
      li      vr129, 4
      mul     vr127, vr126, vr129
      add     vr128, vr125, vr127
      mv      vr130, vr128
      # %_54 = load ptr, ptr %_53
      lw      vr131, 0(vr130)
      # %_55 = getelementptr ptr, ptr %_54, i32 3
      li      vr132, 3
      li      vr135, 4
      mul     vr133, vr132, vr135
      add     vr134, vr131, vr133
      mv      vr136, vr134
      # %_56 = load ptr, ptr %_55
      lw      vr137, 0(vr136)
      # %_57 = getelementptr i32, ptr %_56, i32 4
      li      vr138, 4
      li      vr141, 4
      mul     vr139, vr138, vr141
      add     vr140, vr137, vr139
      mv      vr142, vr140
      # %_58 = load i32, ptr %_57
      lw      vr143, 0(vr142)
      # %_59 = icmp eq i32 %_49, %_58
      sub     vr144, vr119, vr143
      seqz    vr145, vr144
      mv      vr146, vr145
      # br label %if.end.0
      mv      vr147, vr146
      j       main_if.end.0
main_if.else.0:
      # br label %if.end.0
      mv      vr147, vr107
      j       main_if.end.0
main_if.end.0:
      # br i1 %_60, label %if.then.1, label %if.else.1
      beqz     vr147, main_if.else.1
main_if.then.1:
      # %_62 = getelementptr ptr, ptr %_24, i32 2
      li      vr148, 2
      li      vr151, 4
      mul     vr149, vr148, vr151
      add     vr150, vr56, vr149
      mv      vr152, vr150
      # %_63 = load ptr, ptr %_62
      lw      vr153, 0(vr152)
      # %_64 = getelementptr i32, ptr %_63, i32 3
      li      vr154, 3
      li      vr157, 4
      mul     vr155, vr154, vr157
      add     vr156, vr153, vr155
      mv      vr158, vr156
      # %_65 = load i32, ptr %_64
      lw      vr159, 0(vr158)
      # %_67 = icmp eq i32 %_65, %_66
      sub     vr161, vr159, vr160
      seqz    vr162, vr161
      mv      vr163, vr162
      # br label %if.end.1
      mv      vr164, vr163
      j       main_if.end.1
main_if.else.1:
      # br label %if.end.1
      mv      vr164, vr147
      j       main_if.end.1
main_if.end.1:
      # br i1 %_68, label %if.then.2, label %if.end.2
      beqz     vr164, main_if.end.2
main_if.then.2:
      # %_70 = getelementptr ptr, ptr %_21, i32 1
      li      vr165, 1
      li      vr168, 4
      mul     vr166, vr165, vr168
      add     vr167, vr50, vr166
      mv      vr169, vr167
      # %_71 = load ptr, ptr %_70
      lw      vr170, 0(vr169)
      # %_72 = getelementptr ptr, ptr %_71, i32 2
      li      vr171, 2
      li      vr174, 4
      mul     vr172, vr171, vr174
      add     vr173, vr170, vr172
      mv      vr175, vr173
      # %_73 = load ptr, ptr %_72
      lw      vr176, 0(vr175)
      # %_74 = getelementptr i32, ptr %_73, i32 3
      li      vr177, 3
      li      vr180, 4
      mul     vr178, vr177, vr180
      add     vr179, vr176, vr178
      mv      vr181, vr179
      # %_75 = load i32, ptr %_74
      lw      vr182, 0(vr181)
      # %_76 = add i32 %_75, 1
      li      vr184, 1
      add     vr183, vr182, vr184
      # store i32 %_76, ptr %_74
      sw      vr183, 0(vr181)
      # br label %if.end.2
      j       main_if.end.2
main_if.end.2:
      # ret i32 0
      li      vr185, 0
      mv      a0, vr185
      addi    sp, sp, 0
      ret

Process finished with exit code 0
