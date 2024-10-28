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
      li      vr0, 4
      mv      a0, vr0
      li      vr1, 20
      mv      a1, vr1
      call    _malloc_array
      mv      vr2, a0
      # store ptr %__tmp.0, ptr @a.0
      la      vr3, a.0
      sw      vr2, 0(vr3)
      # ret void
      addi    sp, sp, 0
      ret
      .section .text
      .globl jud
jud:
      addi    sp, sp, 0
      mv      vr0, a0
jud_entry:
      # br label %for.cond0
      li      vr47, 0
      mv      vr46, vr47
      li      vr48, 0
      mv      vr4, vr48
      li      vr50, 0
      mv      vr49, vr50
      j       jud_for.cond0
jud_for.cond0:
      # %__tmp.3 = load i32, ptr @n.0
      la      vr2, n.0
      lw      vr1, 0(vr2)
      # %__tmp.5 = sdiv i32 %__tmp.3, %_x
      div     vr3, vr1, vr0
      # %__tmp.6 = icmp slt i32 %_i.0.0, %__tmp.5
      sub     vr5, vr4, vr3
      sltz    vr6, vr5
      mv      vr7, vr6
      # br i1 %__tmp.6, label %for.body0, label %for.merge0
      beqz     vr7, jud_for.merge0
jud_for.body0:
      # br label %for.cond1
      li      vr52, 0
      mv      vr39, vr52
      li      vr53, 0
      mv      vr10, vr53
      j       jud_for.cond1
jud_for.cond1:
      # %__tmp.10 = sub i32 %_x, 1
      li      vr8, 1
      sub     vr9, vr0, vr8
      # %__tmp.11 = icmp slt i32 %_j.0.1, %__tmp.10
      sub     vr11, vr10, vr9
      sltz    vr12, vr11
      mv      vr13, vr12
      # br i1 %__tmp.11, label %for.body1, label %for.merge1
      beqz     vr13, jud_for.merge1
jud_for.body1:
      # %__tmp.12 = load ptr, ptr @a.0
      la      vr15, a.0
      lw      vr14, 0(vr15)
      # %__tmp.15 = mul i32 %_i.0.0, %_x
      mul     vr16, vr4, vr0
      # %__tmp.17 = add i32 %__tmp.15, %_j.0.1
      add     vr17, vr16, vr10
      # %__tmp.18 = getelementptr i32, ptr %__tmp.12, i32 %__tmp.17
      li      vr20, 4
      mul     vr18, vr14, vr20
      add     vr19, vr17, vr18
      mv      vr21, vr19
      # %__tmp.19 = load i32, ptr %__tmp.18
      lw      vr22, 0(vr21)
      # %__tmp.20 = load ptr, ptr @a.0
      la      vr24, a.0
      lw      vr23, 0(vr24)
      # %__tmp.23 = mul i32 %_i.0.0, %_x
      mul     vr25, vr4, vr0
      # %__tmp.25 = add i32 %__tmp.23, %_j.0.1
      add     vr26, vr25, vr10
      # %__tmp.26 = add i32 %__tmp.25, 1
      li      vr27, 1
      add     vr28, vr26, vr27
      # %__tmp.27 = getelementptr i32, ptr %__tmp.20, i32 %__tmp.26
      li      vr31, 4
      mul     vr29, vr23, vr31
      add     vr30, vr28, vr29
      mv      vr32, vr30
      # %__tmp.28 = load i32, ptr %__tmp.27
      lw      vr33, 0(vr32)
      # %__tmp.29 = icmp sgt i32 %__tmp.19, %__tmp.28
      sub     vr34, vr22, vr33
      sgtz    vr35, vr34
      mv      vr36, vr35
      # br i1 %__tmp.29, label %if.then0, label %split0
      beqz     vr36, jud_split0
jud_split0:
      # br label %if.merge0
      mv      vr51, vr39
      j       jud_if.merge0
jud_if.then0:
      # br label %if.merge0
      li      vr54, 1
      mv      vr51, vr54
      j       jud_if.merge0
jud_if.merge0:
      # br label %for.step1
      j       jud_for.step1
jud_for.step1:
      # %__tmp.32 = add i32 %_j.0.1, 1
      li      vr37, 1
      add     vr38, vr10, vr37
      # br label %for.cond1
      mv      vr39, vr51
      mv      vr10, vr38
      j       jud_for.cond1
jud_for.merge1:
      # %__tmp.34 = xor i1 %_flag.0.1, 1
      li      vr40, 1
      xor     vr41, vr39, vr40
      # br i1 %__tmp.34, label %if.then1, label %if.merge1
      beqz     vr41, jud_if.merge1
jud_if.then1:
      # ret i32 1
      li      vr42, 1
      mv      a0, vr42
      addi    sp, sp, 0
      ret
jud_if.merge1:
      # br label %for.step0
      j       jud_for.step0
jud_for.step0:
      # %__tmp.36 = add i32 %_i.0.0, 1
      li      vr43, 1
      add     vr44, vr4, vr43
      # br label %for.cond0
      mv      vr46, vr39
      mv      vr4, vr44
      mv      vr49, vr10
      j       jud_for.cond0
jud_for.merge0:
      # ret i32 0
      li      vr45, 0
      mv      a0, vr45
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
      la      vr1, n.0
      lw      vr0, 0(vr1)
      # %__tmp.38 = call i32 @getInt()
      call    getInt
      mv      vr2, a0
      # store i32 %__tmp.38, ptr @n.0
      la      vr3, n.0
      sw      vr2, 0(vr3)
      # %__tmp.39 = load i32, ptr @i.1
      la      vr5, i.1
      lw      vr4, 0(vr5)
      # store i32 0, ptr @i.1
      li      vr6, 0
      la      vr7, i.1
      sw      vr6, 0(vr7)
      # br label %for.cond2
      j       main_for.cond2
main_for.cond2:
      # %__tmp.40 = load i32, ptr @i.1
      la      vr9, i.1
      lw      vr8, 0(vr9)
      # %__tmp.41 = load i32, ptr @n.0
      la      vr11, n.0
      lw      vr10, 0(vr11)
      # %__tmp.42 = icmp slt i32 %__tmp.40, %__tmp.41
      sub     vr12, vr8, vr10
      sltz    vr13, vr12
      mv      vr14, vr13
      # br i1 %__tmp.42, label %for.body2, label %for.merge2
      beqz     vr14, main_for.merge2
main_for.body2:
      # %__tmp.43 = load ptr, ptr @a.0
      la      vr16, a.0
      lw      vr15, 0(vr16)
      # %__tmp.44 = load i32, ptr @i.1
      la      vr18, i.1
      lw      vr17, 0(vr18)
      # %__tmp.45 = getelementptr i32, ptr %__tmp.43, i32 %__tmp.44
      li      vr21, 4
      mul     vr19, vr15, vr21
      add     vr20, vr17, vr19
      mv      vr22, vr20
      # %__tmp.46 = load i32, ptr %__tmp.45
      lw      vr23, 0(vr22)
      # %__tmp.47 = call i32 @getInt()
      call    getInt
      mv      vr24, a0
      # store i32 %__tmp.47, ptr %__tmp.45
      sw      vr24, 0(vr22)
      # br label %for.step2
      j       main_for.step2
main_for.step2:
      # %__tmp.48 = load i32, ptr @i.1
      la      vr26, i.1
      lw      vr25, 0(vr26)
      # %__tmp.49 = add i32 %__tmp.48, 1
      li      vr27, 1
      add     vr28, vr25, vr27
      # store i32 %__tmp.49, ptr @i.1
      la      vr29, i.1
      sw      vr28, 0(vr29)
      # br label %for.cond2
      j       main_for.cond2
main_for.merge2:
      # %__tmp.50 = load i32, ptr @i.1
      la      vr31, i.1
      lw      vr30, 0(vr31)
      # %__tmp.51 = load i32, ptr @n.0
      la      vr33, n.0
      lw      vr32, 0(vr33)
      # store i32 %__tmp.51, ptr @i.1
      la      vr34, i.1
      sw      vr32, 0(vr34)
      # br label %for.cond3
      j       main_for.cond3
main_for.cond3:
      # %__tmp.52 = load i32, ptr @i.1
      la      vr36, i.1
      lw      vr35, 0(vr36)
      # %__tmp.53 = icmp sgt i32 %__tmp.52, 0
      li      vr37, 0
      sub     vr38, vr35, vr37
      sgtz    vr39, vr38
      mv      vr40, vr39
      # br i1 %__tmp.53, label %for.body3, label %for.merge3
      beqz     vr40, main_for.merge3
main_for.body3:
      # %__tmp.55 = load i32, ptr @i.1
      la      vr42, i.1
      lw      vr41, 0(vr42)
      # %__tmp.54 = call i32 @jud(i32 %__tmp.55)
      mv      a0, vr41
      call    jud
      mv      vr43, a0
      # %__tmp.56 = icmp sgt i32 %__tmp.54, 0
      li      vr44, 0
      sub     vr45, vr43, vr44
      sgtz    vr46, vr45
      mv      vr47, vr46
      # br i1 %__tmp.56, label %if.then2, label %if.merge2
      beqz     vr47, main_if.merge2
main_if.then2:
      # %__tmp.58 = load i32, ptr @i.1
      la      vr49, i.1
      lw      vr48, 0(vr49)
      # %__tmp.57 = call ptr @toString(i32 %__tmp.58)
      mv      a0, vr48
      call    toString
      mv      vr50, a0
      # call void @print(ptr %__tmp.57)
      mv      a0, vr50
      call    print
      # ret i32 0
      li      vr51, 0
      mv      a0, vr51
      addi    sp, sp, 0
      ret
main_if.merge2:
      # br label %for.step3
      j       main_for.step3
main_for.step3:
      # %__tmp.59 = load i32, ptr @i.1
      la      vr53, i.1
      lw      vr52, 0(vr53)
      # %__tmp.60 = load i32, ptr @i.1
      la      vr55, i.1
      lw      vr54, 0(vr55)
      # %__tmp.61 = sdiv i32 %__tmp.60, 2
      li      vr56, 2
      div     vr57, vr54, vr56
      # store i32 %__tmp.61, ptr @i.1
      la      vr58, i.1
      sw      vr57, 0(vr58)
      # br label %for.cond3
      j       main_for.cond3
main_for.merge3:
      # ret i32 0
      li      vr59, 0
      mv      a0, vr59
      addi    sp, sp, 0
      ret
