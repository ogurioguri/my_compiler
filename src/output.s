      .section .data
      .globl n.0
n.0:
      .word  0
      .section .data
      .globl a.0
a.0:
      .word  0
      .section .data
      .globl i.1
i.1:
      .word  0
      .section .text
      .globl __init
__init:
      addi    sp, sp, 0
__init_entry:
      # %__tmp.0 = call ptr @_malloc_array(i32 4, i32 20)
      li      t0, 4
      mv      a0, t0
      li      t0, 20
      mv      a1, t0
      call    _malloc_array
      mv      t0, a0
      # store ptr %__tmp.0, ptr @a.0
      la      t1, a.0
      sw      t0, 0(t1)
      # ret void
      addi    sp, sp, 0
      ret     
      .section .text
      .globl jud
jud:
      addi    sp, sp, 0
      mv      t1, a0
jud_entry:
      # br label %for.cond0
      li      t2, 0
      li      t2, 0
      mv      t3, t2
      li      t5, 0
      j       jud_for.cond0
jud_for.cond0:
      # %__tmp.3 = load i32, ptr @n.0
      la      t4, n.0
      lw      t4, 0(t4)
      # %__tmp.5 = sdiv i32 %__tmp.3, %_x
      div     t6, t4, t1
      # %__tmp.6 = icmp slt i32 %_i.0.0, %__tmp.5
      sub     t2, t3, t6
      sltz    t4, t2
      mv      t2, t4
      # br i1 %__tmp.6, label %for.body0, label %for.merge0
      beqz     t2, jud_for.merge0
jud_for.body0:
      # br label %for.cond1
      li      t2, 0
      mv      t4, t2
      li      t2, 0
      mv      t5, t2
      j       jud_for.cond1
jud_for.cond1:
      # %__tmp.10 = sub i32 %_x, 1
      li      t2, 1
      sub     t6, t1, t2
      # %__tmp.11 = icmp slt i32 %_j.0.1, %__tmp.10
      sub     t2, t5, t6
      sltz    t6, t2
      mv      t2, t6
      # br i1 %__tmp.11, label %for.body1, label %for.merge1
      beqz     t2, jud_for.merge1
jud_for.body1:
      # %__tmp.12 = load ptr, ptr @a.0
      la      t2, a.0
      lw      t4, 0(t2)
      # %__tmp.15 = mul i32 %_i.0.0, %_x
      mul     t2, t3, t1
      # %__tmp.17 = add i32 %__tmp.15, %_j.0.1
      add     t6, t2, t5
      # %__tmp.18 = getelementptr i32, ptr %__tmp.12, i32 %__tmp.17
      li      t2, 4
      mul     s0, t4, t2
      add     t2, t6, s0
      mv      t4, t2
      # %__tmp.19 = load i32, ptr %__tmp.18
      lw      t2, 0(t4)
      # %__tmp.20 = load ptr, ptr @a.0
      la      t4, a.0
      lw      t6, 0(t4)
      # %__tmp.23 = mul i32 %_i.0.0, %_x
      mul     t4, t3, t1
      # %__tmp.25 = add i32 %__tmp.23, %_j.0.1
      add     t0, t4, t5
      # %__tmp.26 = add i32 %__tmp.25, 1
      li      t1, 1
      add     t3, t0, t1
      # %__tmp.27 = getelementptr i32, ptr %__tmp.20, i32 %__tmp.26
      li      t0, 4
      mul     t1, t6, t0
      add     t0, t3, t1
      mv      t1, t0
      # %__tmp.28 = load i32, ptr %__tmp.27
      lw      t0, 0(t1)
      # %__tmp.29 = icmp sgt i32 %__tmp.19, %__tmp.28
      sub     t1, t2, t0
      sgtz    t0, t1
      mv      t1, t0
      # br i1 %__tmp.29, label %if.then0, label %split0
      beqz     t1, jud_split0
jud_split0:
      # br label %if.merge0
      mv      t1, t4
      j       jud_if.merge0
jud_if.then0:
      # br label %if.merge0
      li      t0, 1
      mv      t1, t0
      j       jud_if.merge0
jud_if.merge0:
      # br label %for.step1
      j       jud_for.step1
jud_for.step1:
      # %__tmp.32 = add i32 %_j.0.1, 1
      li      t0, 1
      add     t2, t5, t0
      # br label %for.cond1
      mv      t4, t1
      mv      t5, t2
      j       jud_for.cond1
jud_for.merge1:
      # %__tmp.34 = xor i1 %_flag.0.1, 1
      li      t2, 1
      xor     t6, t4, t2
      # br i1 %__tmp.34, label %if.then1, label %if.merge1
      beqz     t6, jud_if.merge1
jud_if.then1:
      # ret i32 1
      li      t2, 1
      mv      a0, t2
      addi    sp, sp, 0
      ret     
jud_if.merge1:
      # br label %for.step0
      j       jud_for.step0
jud_for.step0:
      # %__tmp.36 = add i32 %_i.0.0, 1
      li      t2, 1
      add     t4, t3, t2
      # br label %for.cond0
      mv      t3, t4
      j       jud_for.cond0
jud_for.merge0:
      # ret i32 0
      li      t2, 0
      mv      a0, t2
      addi    sp, sp, 0
      ret     
      .section .text
      .globl main
main:
      addi    sp, sp, 0
main_entry:
      # call void @__init()
      call    __init
      # %__tmp.37 = load i32, ptr @n.0
      la      s0, n.0
      lw      t2, 0(s0)
      # %__tmp.38 = call i32 @getInt()
      call    getInt
      mv      s1, a0
      # store i32 %__tmp.38, ptr @n.0
      la      s3, n.0
      sw      s1, 0(s3)
      # %__tmp.39 = load i32, ptr @i.1
      la      t4, i.1
      lw      t6, 0(t4)
      # store i32 0, ptr @i.1
      li      s1, 0
      la      t4, i.1
      sw      s1, 0(t4)
      # br label %for.cond2
      j       main_for.cond2
main_for.cond2:
      # %__tmp.40 = load i32, ptr @i.1
      la      s5, i.1
      lw      t4, 0(s5)
      # %__tmp.41 = load i32, ptr @n.0
      la      t4, n.0
      lw      s3, 0(t4)
      # %__tmp.42 = icmp slt i32 %__tmp.40, %__tmp.41
      sub     s5, t4, s3
      sltz    t4, s5
      mv      s1, t4
      # br i1 %__tmp.42, label %for.body2, label %for.merge2
      beqz     s1, main_for.merge2
main_for.body2:
      # %__tmp.43 = load ptr, ptr @a.0
      la      s4, a.0
      lw      t4, 0(s4)
      # %__tmp.44 = load i32, ptr @i.1
      la      s7, i.1
      lw      s5, 0(s7)
      # %__tmp.45 = getelementptr i32, ptr %__tmp.43, i32 %__tmp.44
      li      s1, 4
      mul     s0, t4, s1
      add     s4, s5, s0
      mv      s0, s4
      # %__tmp.46 = load i32, ptr %__tmp.45
      lw      s5, 0(s0)
      # %__tmp.47 = call i32 @getInt()
      call    getInt
      mv      s1, a0
      # store i32 %__tmp.47, ptr %__tmp.45
      sw      s1, 0(s0)
      # br label %for.step2
      j       main_for.step2
main_for.step2:
      # %__tmp.48 = load i32, ptr @i.1
      la      t2, i.1
      lw      s6, 0(t2)
      # %__tmp.49 = add i32 %__tmp.48, 1
      li      t3, 1
      add     t6, s6, t3
      # store i32 %__tmp.49, ptr @i.1
      la      t3, i.1
      sw      t6, 0(t3)
      # br label %for.cond2
      j       main_for.cond2
main_for.merge2:
      # %__tmp.50 = load i32, ptr @i.1
      la      t2, i.1
      lw      t2, 0(t2)
      # %__tmp.51 = load i32, ptr @n.0
      la      t2, n.0
      lw      t3, 0(t2)
      # store i32 %__tmp.51, ptr @i.1
      la      t3, i.1
      sw      t3, 0(t3)
      # br label %for.cond3
      j       main_for.cond3
main_for.cond3:
      # %__tmp.52 = load i32, ptr @i.1
      la      t3, i.1
      lw      t2, 0(t3)
      # %__tmp.53 = icmp sgt i32 %__tmp.52, 0
      li      t1, 0
      sub     t5, t2, t1
      sgtz    s1, t5
      mv      t4, s1
      # br i1 %__tmp.53, label %for.body3, label %for.merge3
      beqz     t4, main_for.merge3
main_for.body3:
      # %__tmp.55 = load i32, ptr @i.1
      la      t4, i.1
      lw      s5, 0(t4)
      # %__tmp.54 = call i32 @jud(i32 %__tmp.55)
      mv      a0, s5
      call    jud
      mv      t4, a0
      # %__tmp.56 = icmp sgt i32 %__tmp.54, 0
      li      s1, 0
      sub     t4, t4, s1
      sgtz    t3, t4
      mv      t4, t3
      # br i1 %__tmp.56, label %if.then2, label %if.merge2
      beqz     t4, main_if.merge2
main_if.then2:
      # %__tmp.58 = load i32, ptr @i.1
      la      t0, i.1
      lw      t4, 0(t0)
      # %__tmp.57 = call ptr @toString(i32 %__tmp.58)
      mv      a0, t4
      call    toString
      mv      s2, a0
      # call void @print(ptr %__tmp.57)
      mv      a0, s2
      call    print
      # ret i32 0
      li      t3, 0
      mv      a0, t3
      addi    sp, sp, 0
      ret     
main_if.merge2:
      # br label %for.step3
      j       main_for.step3
main_for.step3:
      # %__tmp.59 = load i32, ptr @i.1
      la      t4, i.1
      lw      t4, 0(t4)
      # %__tmp.60 = load i32, ptr @i.1
      la      s4, i.1
      lw      t1, 0(s4)
      # %__tmp.61 = sdiv i32 %__tmp.60, 2
      li      s6, 2
      div     t3, t1, s6
      # store i32 %__tmp.61, ptr @i.1
      la      t0, i.1
      sw      t3, 0(t0)
      # br label %for.cond3
      j       main_for.cond3
main_for.merge3:
      # ret i32 0
      li      t4, 0
      mv      a0, t4
      addi    sp, sp, 0
      ret     
