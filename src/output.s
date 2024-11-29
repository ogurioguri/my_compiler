      .section .data
      .globl N.0
N.0:
      .word  0
      .section .data
      .globl check.0
check.0:
      .word  0
      .section .data
      .globl M.0
M.0:
      .word  0
      .section .text
      .globl main
main:
      addi    sp, sp, -20
main_entry:
      # %__tmp.0 = load i32, ptr @N.0
      la      t3, N.0
      # %__tmp.1 = call i32 @getInt()
      sw      ra, 0(sp)
      sw      t3, 4(sp)
      sw      t4, 8(sp)
      sw      t5, 12(sp)
      sw      t6, 16(sp)
      call    getInt
      lw      ra, 0(sp)
      lw      t3, 4(sp)
      lw      t4, 8(sp)
      lw      t5, 12(sp)
      lw      t6, 16(sp)
      mv      t3, a0
      # store i32 %__tmp.1, ptr @N.0
      la      t4, N.0
      sw      t3, 0(t4)
      # %__tmp.2 = load ptr, ptr @check.0
      la      t3, check.0
      # %__tmp.3 = load i32, ptr @N.0
      la      t3, N.0
      lw      t4, 0(t3)
      # %__tmp.4 = add i32 %__tmp.3, 5
      li      t3, 5
      add     t5, t4, t3
      # %__tmp.5 = call ptr @_malloc_array(i32 4, i32 %__tmp.4)
      li      t3, 4
      mv      a0, t3
      mv      a1, t5
      sw      ra, 0(sp)
      sw      t3, 4(sp)
      sw      t4, 8(sp)
      sw      t5, 12(sp)
      sw      t6, 16(sp)
      call    _malloc_array
      lw      ra, 0(sp)
      lw      t3, 4(sp)
      lw      t4, 8(sp)
      lw      t5, 12(sp)
      lw      t6, 16(sp)
      mv      t3, a0
      # store ptr %__tmp.5, ptr @check.0
      la      t4, check.0
      sw      t3, 0(t4)
      # br label %while.cond0
      li      t3, 0
      mv      t4, t3
      mv      t3, t4
      j       main_while.cond0
main_while.cond0:
      # %__tmp.7 = load i32, ptr @N.0
      la      t4, N.0
      lw      t5, 0(t4)
      # %__tmp.8 = icmp sle i32 %_i.0.0, %__tmp.7
      sub     t4, t3, t5
      sltz    t5, t4
      seqz    t6, t4
      or      t4, t5, t6
      mv      t5, t4
      # br i1 %__tmp.8, label %while.body0, label %while.merge0
      beqz     t5, main_while.merge0
main_while.body0:
      # %__tmp.9 = load ptr, ptr @check.0
      la      t4, check.0
      lw      t5, 0(t4)
      # %__tmp.11 = add i32 %_i.0.0, 1
      li      t4, 1
      add     t6, t3, t4
      # %__tmp.12 = getelementptr i1, ptr %__tmp.9, i32 %_i.0.0
      li      t4, 4
      mul     s0, t3, t4
      add     t4, t5, s0
      mv      t5, t4
      # %__tmp.13 = load i1, ptr %__tmp.12
      # store i1 1, ptr %__tmp.12
      li      t4, 1
      sw      t4, 0(t5)
      # br label %while.cond0
      mv      t4, t6
      mv      t3, t4
      j       main_while.cond0
main_while.merge0:
      # %__tmp.14 = load i32, ptr @N.0
      la      t3, N.0
      lw      t4, 0(t3)
      # %__tmp.15 = add i32 %__tmp.14, 5
      li      t3, 5
      add     t5, t4, t3
      # %__tmp.16 = call ptr @_malloc_array(i32 4, i32 %__tmp.15)
      li      t3, 4
      mv      a0, t3
      mv      a1, t5
      sw      ra, 0(sp)
      sw      t3, 4(sp)
      sw      t4, 8(sp)
      sw      t5, 12(sp)
      sw      t6, 16(sp)
      call    _malloc_array
      lw      ra, 0(sp)
      lw      t3, 4(sp)
      lw      t4, 8(sp)
      lw      t5, 12(sp)
      lw      t6, 16(sp)
      mv      t3, a0
      # %__tmp.17 = load i32, ptr @N.0
      la      t4, N.0
      lw      t5, 0(t4)
      # %__tmp.18 = add i32 %__tmp.17, 5
      li      t4, 5
      add     t6, t5, t4
      # %__tmp.19 = call ptr @_malloc_array(i32 4, i32 %__tmp.18)
      li      t4, 4
      mv      a0, t4
      mv      a1, t6
      sw      ra, 0(sp)
      sw      t3, 4(sp)
      sw      t4, 8(sp)
      sw      t5, 12(sp)
      sw      t6, 16(sp)
      call    _malloc_array
      lw      ra, 0(sp)
      lw      t3, 4(sp)
      lw      t4, 8(sp)
      lw      t5, 12(sp)
      lw      t6, 16(sp)
      mv      t4, a0
      # %__tmp.21 = getelementptr i32, ptr %__tmp.16, i32 1
      li      t5, 1
      li      t6, 4
      mul     s0, t5, t6
      add     t5, t3, s0
      mv      t6, t5
      # %__tmp.22 = load i32, ptr %__tmp.21
      # store i32 1, ptr %__tmp.21
      li      t5, 1
      sw      t5, 0(t6)
      # br label %for.cond0
      li      t5, 2
      li      t6, 0
      li      s0, 0
      li      s1, 0
      mv      s2, t5
      mv      t5, t6
      mv      t6, s0
      mv      s0, s1
      mv      s1, s2
      mv      t5, t6
      j       main_for.cond0
main_for.cond0:
      # br label %for.body0
      j       main_for.body0
main_for.body0:
      # %__tmp.25 = load i32, ptr @N.0
      la      t6, N.0
      lw      s0, 0(t6)
      # %__tmp.26 = icmp sgt i32 %_i.0.1, %__tmp.25
      sub     t6, s1, s0
      sgtz    s0, t6
      mv      t6, s0
      # br i1 %__tmp.26, label %if.then0, label %if.merge0
      beqz     t6, main_if.merge0
main_if.then0:
      # br label %for.merge0
      j       main_for.merge0
main_if.merge0:
      # %__tmp.27 = load ptr, ptr @check.0
      la      t6, check.0
      lw      s0, 0(t6)
      # %__tmp.29 = getelementptr i1, ptr %__tmp.27, i32 %_i.0.1
      li      t6, 4
      mul     s2, s1, t6
      add     t6, s0, s2
      mv      s0, t6
      # %__tmp.30 = load i1, ptr %__tmp.29
      lw      t6, 0(s0)
      # br i1 %__tmp.30, label %if.then1, label %split0
      beqz     t6, main_split0
main_if.then1:
      # %__tmp.32 = load i32, ptr @M.0
      la      t6, M.0
      lw      s0, 0(t6)
      # %__tmp.33 = add i32 %__tmp.32, 1
      li      t6, 1
      add     s2, s0, t6
      # store i32 %__tmp.33, ptr @M.0
      la      t6, M.0
      sw      s2, 0(t6)
      # %__tmp.34 = getelementptr i32, ptr %__tmp.19, i32 %__tmp.33
      li      t6, 4
      mul     s0, s2, t6
      add     t6, t4, s0
      mv      s0, t6
      # %__tmp.35 = load i32, ptr %__tmp.34
      # store i32 %_i.0.1, ptr %__tmp.34
      sw      s1, 0(s0)
      # %__tmp.39 = getelementptr i32, ptr %__tmp.16, i32 %_i.0.1
      li      t6, 4
      mul     s0, s1, t6
      add     t6, t3, s0
      mv      s0, t6
      # %__tmp.40 = load i32, ptr %__tmp.39
      # %__tmp.42 = sub i32 %_i.0.1, 1
      li      t6, 1
      sub     s2, s1, t6
      # store i32 %__tmp.42, ptr %__tmp.39
      sw      s2, 0(s0)
      # br label %if.merge1
      j       main_if.merge1
main_split0:
      # br label %if.merge1
      j       main_if.merge1
main_if.merge1:
      # br label %for.cond1
      li      t6, 1
      mv      s0, t5
      mv      s2, t6
      mv      t6, s2
      mv      s2, s0
      j       main_for.cond1
main_for.cond1:
      # %__tmp.46 = load i32, ptr @M.0
      la      s0, M.0
      lw      s3, 0(s0)
      # %__tmp.47 = icmp sle i32 %_i.1.1, %__tmp.46
      sub     s0, t6, s3
      sltz    s3, s0
      seqz    s4, s0
      or      s0, s3, s4
      mv      s3, s0
      # br i1 %__tmp.47, label %if.then.2, label %if.else.2
      beqz     s3, main_if.else.2
main_if.then.2:
      # %__tmp.51 = getelementptr i32, ptr %__tmp.19, i32 %_i.1.1
      li      s0, 4
      mul     s4, t6, s0
      add     s0, t4, s4
      mv      s4, s0
      # %__tmp.52 = load i32, ptr %__tmp.51
      lw      s0, 0(s4)
      # %__tmp.53 = mul i32 %_i.0.1, %__tmp.52
      mul     s4, s1, s0
      # %__tmp.54 = load i32, ptr @N.0
      la      s0, N.0
      lw      s5, 0(s0)
      # %__tmp.55 = icmp sle i32 %__tmp.53, %__tmp.54
      sub     s0, s4, s5
      sltz    s4, s0
      seqz    s5, s0
      or      s0, s4, s5
      mv      s4, s0
      # br label %if.end.2
      mv      s0, s4
      mv      s3, s0
      j       main_if.end.2
main_if.else.2:
      # br label %if.end.2
      mv      s0, s3
      mv      s3, s0
      j       main_if.end.2
main_if.end.2:
      # br i1 %__tmp.56, label %for.body1, label %split1
      beqz     s3, main_split1
main_for.body1:
      # %__tmp.60 = getelementptr i32, ptr %__tmp.19, i32 %_i.1.1
      li      s0, 4
      mul     s4, t6, s0
      add     s0, t4, s4
      mv      s4, s0
      # %__tmp.61 = load i32, ptr %__tmp.60
      lw      s0, 0(s4)
      # %__tmp.62 = mul i32 %_i.0.1, %__tmp.61
      mul     s4, s1, s0
      # %__tmp.64 = load i32, ptr @N.0
      la      s0, N.0
      lw      s5, 0(s0)
      # %__tmp.65 = icmp sgt i32 %__tmp.62, %__tmp.64
      sub     s0, s4, s5
      sgtz    s5, s0
      mv      s0, s5
      # br i1 %__tmp.65, label %if.then3, label %if.merge3
      beqz     s0, main_if.merge3
main_if.then3:
      # br label %for.step1
      j       main_for.step1
main_if.merge3:
      # %__tmp.66 = load ptr, ptr @check.0
      la      s0, check.0
      lw      s5, 0(s0)
      # %__tmp.68 = getelementptr i1, ptr %__tmp.66, i32 %__tmp.62
      li      s0, 4
      mul     s6, s4, s0
      add     s0, s5, s6
      mv      s5, s0
      # %__tmp.69 = load i1, ptr %__tmp.68
      # store i1 0, ptr %__tmp.68
      li      s0, 0
      sw      s0, 0(s5)
      # %__tmp.73 = getelementptr i32, ptr %__tmp.19, i32 %_i.1.1
      li      s0, 4
      mul     s5, t6, s0
      add     s0, t4, s5
      mv      s5, s0
      # %__tmp.74 = load i32, ptr %__tmp.73
      lw      s0, 0(s5)
      # %__tmp.75 = srem i32 %_i.0.1, %__tmp.74
      rem     s5, s1, s0
      # %__tmp.76 = icmp eq i32 %__tmp.75, 0
      li      s0, 0
      sub     s6, s5, s0
      seqz    s0, s6
      mv      s5, s0
      # br i1 %__tmp.76, label %if.then4, label %if.else4
      beqz     s5, main_if.else4
main_if.then4:
      # %__tmp.79 = getelementptr i32, ptr %__tmp.16, i32 %__tmp.62
      li      s0, 4
      mul     s5, s4, s0
      add     s0, t3, s5
      mv      s5, s0
      # %__tmp.80 = load i32, ptr %__tmp.79
      # %__tmp.83 = getelementptr i32, ptr %__tmp.16, i32 %_i.0.1
      li      s0, 4
      mul     s6, s1, s0
      add     s0, t3, s6
      mv      s6, s0
      # %__tmp.84 = load i32, ptr %__tmp.83
      lw      s0, 0(s6)
      # %__tmp.87 = getelementptr i32, ptr %__tmp.19, i32 %_i.1.1
      li      s6, 4
      mul     s7, t6, s6
      add     s6, t4, s7
      mv      s7, s6
      # %__tmp.88 = load i32, ptr %__tmp.87
      lw      s6, 0(s7)
      # %__tmp.89 = mul i32 %__tmp.84, %__tmp.88
      mul     s7, s0, s6
      # store i32 %__tmp.89, ptr %__tmp.79
      sw      s7, 0(s5)
      # br label %for.merge1
      mv      s0, s4
      mv      s5, s0
      j       main_for.merge1
main_if.else4:
      # %__tmp.94 = getelementptr i32, ptr %__tmp.19, i32 %_i.1.1
      li      s0, 4
      mul     s6, t6, s0
      add     s0, t4, s6
      mv      s6, s0
      # %__tmp.95 = load i32, ptr %__tmp.94
      lw      s0, 0(s6)
      # %__tmp.96 = mul i32 %_i.0.1, %__tmp.95
      mul     s6, s1, s0
      # %__tmp.97 = getelementptr i32, ptr %__tmp.16, i32 %__tmp.96
      li      s0, 4
      mul     s7, s6, s0
      add     s0, t3, s7
      mv      s6, s0
      # %__tmp.98 = load i32, ptr %__tmp.97
      # %__tmp.101 = getelementptr i32, ptr %__tmp.16, i32 %_i.0.1
      li      s0, 4
      mul     s7, s1, s0
      add     s0, t3, s7
      mv      s7, s0
      # %__tmp.102 = load i32, ptr %__tmp.101
      lw      s0, 0(s7)
      # %__tmp.105 = getelementptr i32, ptr %__tmp.19, i32 %_i.1.1
      li      s7, 4
      mul     s8, t6, s7
      add     s7, t4, s8
      mv      s8, s7
      # %__tmp.106 = load i32, ptr %__tmp.105
      lw      s7, 0(s8)
      # %__tmp.107 = sub i32 %__tmp.106, 1
      li      s8, 1
      sub     s9, s7, s8
      # %__tmp.108 = mul i32 %__tmp.102, %__tmp.107
      mul     s7, s0, s9
      # store i32 %__tmp.108, ptr %__tmp.97
      sw      s7, 0(s6)
      # br label %if.merge4
      j       main_if.merge4
main_if.merge4:
      # br label %for.step1
      j       main_for.step1
main_for.step1:
      # %__tmp.110 = add i32 %_i.1.1, 1
      li      s0, 1
      add     s6, t6, s0
      # br label %for.cond1
      mv      s0, s4
      mv      s7, s6
      mv      t6, s7
      mv      s2, s0
      j       main_for.cond1
main_split1:
      # br label %for.merge1
      mv      s0, s2
      mv      s5, s0
      j       main_for.merge1
main_for.merge1:
      # %__tmp.114 = getelementptr i32, ptr %__tmp.16, i32 %_i.0.1
      li      s0, 4
      mul     s4, s1, s0
      add     s0, t3, s4
      mv      s4, s0
      # %__tmp.115 = load i32, ptr %__tmp.114
      lw      s0, 0(s4)
      # %__tmp.111 = call ptr @toString(i32 %__tmp.115)
      mv      a0, s0
      sw      ra, 0(sp)
      sw      t3, 4(sp)
      sw      t4, 8(sp)
      sw      t5, 12(sp)
      sw      t6, 16(sp)
      call    toString
      lw      ra, 0(sp)
      lw      t3, 4(sp)
      lw      t4, 8(sp)
      lw      t5, 12(sp)
      lw      t6, 16(sp)
      mv      s0, a0
      # call void @println(ptr %__tmp.111)
      mv      a0, s0
      sw      ra, 0(sp)
      sw      t3, 4(sp)
      sw      t4, 8(sp)
      sw      t5, 12(sp)
      sw      t6, 16(sp)
      call    println
      lw      ra, 0(sp)
      lw      t3, 4(sp)
      lw      t4, 8(sp)
      lw      t5, 12(sp)
      lw      t6, 16(sp)
      # br label %for.step0
      j       main_for.step0
main_for.step0:
      # %__tmp.117 = add i32 %_i.0.1, 1
      li      s0, 1
      add     s4, s1, s0
      # br label %for.cond0
      mv      s0, s4
      mv      s4, s1
      mv      s6, s5
      mv      s5, t6
      mv      s1, s0
      mv      t5, s6
      j       main_for.cond0
main_for.merge0:
      # ret i32 0
      li      t6, 0
      mv      a0, t6
      j       main_return
main_return:
      addi    sp, sp, 20
      ret     
