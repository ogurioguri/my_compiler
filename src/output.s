      .section text
      .globl main
main:
      addi    sp, sp, 0
main_entry:
      # %_0 = load i32, ptr @n
      la      vr1, n
      lw      vr0, 0(vr1)
      # %_1 = call i32 @getInt()
      sw      ra, 0(sp)
      call    getInt
      mv      vr2, a0
      lw      ra, 0(sp)
      # store i32 %_1, ptr @n
      la      vr3, n
      sw      vr2, 0(vr3)
      # %_2 = load i32, ptr @p
      la      vr5, p
      lw      vr4, 0(vr5)
      # %_3 = call i32 @getInt()
      sw      ra, 4(sp)
      call    getInt
      mv      vr6, a0
      lw      ra, 4(sp)
      # store i32 %_3, ptr @p
      la      vr7, p
      sw      vr6, 0(vr7)
      # %_4 = load i32, ptr @k
      la      vr9, k
      lw      vr8, 0(vr9)
      # %_5 = call i32 @getInt()
      sw      ra, 8(sp)
      call    getInt
      mv      vr10, a0
      lw      ra, 8(sp)
      # store i32 %_5, ptr @k
      la      vr11, k
      sw      vr10, 0(vr11)
      # %_6 = load i32, ptr @p
      la      vr13, p
      lw      vr12, 0(vr13)
      # %_7 = load i32, ptr @k
      la      vr15, k
      lw      vr14, 0(vr15)
      # %_8 = sub i32 %_6, %_7
      sub     vr16, vr12, vr14
      # %_9 = icmp sgt i32 %_8, 1
      li      vr17, 1
      sub     vr18, vr16, vr17
      sgtz    vr19, vr18
      mv      vr20, vr19
      # br i1 %_9, label %if.then.0, label %if.end.0
      beqz     vr20, main_if.end.0
main_if.then.0:
      # call void @print(ptr @string.0)
      la      vr21, string.0
      mv      a0, vr21
      sw      ra, 12(sp)
      call    print
      lw      ra, 12(sp)
      # br label %if.end.0
      j       main_if.end.0
main_if.end.0:
      # %_10 = load i32, ptr @i
      la      vr23, i
      lw      vr22, 0(vr23)
      # %_11 = load i32, ptr @p
      la      vr25, p
      lw      vr24, 0(vr25)
      # %_12 = load i32, ptr @k
      la      vr27, k
      lw      vr26, 0(vr27)
      # %_13 = sub i32 %_11, %_12
      sub     vr28, vr24, vr26
      # store i32 %_13, ptr @i
      la      vr29, i
      sw      vr28, 0(vr29)
      # br label %for.cond.0
      j       main_for.cond.0
main_for.cond.0:
      # %_14 = load i32, ptr @i
      la      vr31, i
      lw      vr30, 0(vr31)
      # %_15 = load i32, ptr @p
      la      vr33, p
      lw      vr32, 0(vr33)
      # %_16 = load i32, ptr @k
      la      vr35, k
      lw      vr34, 0(vr35)
      # %_17 = add i32 %_15, %_16
      add     vr36, vr32, vr34
      # %_18 = icmp sle i32 %_14, %_17
      sub     vr37, vr30, vr36
      sltz    vr38, vr37
      seqz    vr39, vr37
      or      vr40, vr38, vr39
      mv      vr41, vr40
      # br i1 %_18, label %for.body.0, label %for.end.0
      beqz     vr41, main_for.end.0
main_for.body.0:
      # %_19 = load i32, ptr @i
      la      vr43, i
      lw      vr42, 0(vr43)
      # %_20 = icmp sle i32 1, %_19
      li      vr44, 1
      sub     vr45, vr44, vr42
      sltz    vr46, vr45
      seqz    vr47, vr45
      or      vr48, vr46, vr47
      mv      vr49, vr48
      # br i1 %_20, label %if.then.1, label %if.else.1
      beqz     vr49, main_if.else.1
main_if.then.1:
      # %_21 = load i32, ptr @i
      la      vr51, i
      lw      vr50, 0(vr51)
      # %_22 = load i32, ptr @n
      la      vr53, n
      lw      vr52, 0(vr53)
      # %_23 = icmp sle i32 %_21, %_22
      sub     vr54, vr50, vr52
      sltz    vr55, vr54
      seqz    vr56, vr54
      or      vr57, vr55, vr56
      mv      vr58, vr57
      # br label %if.end.1
      mv      vr59, vr58
      j       main_if.end.1
main_if.else.1:
      # br label %if.end.1
      mv      vr59, vr49
      j       main_if.end.1
main_if.end.1:
      # br i1 %_24, label %if.then.2, label %if.end.2
      beqz     vr59, main_if.end.2
main_if.then.2:
      # %_25 = load i32, ptr @i
      la      vr61, i
      lw      vr60, 0(vr61)
      # %_26 = load i32, ptr @p
      la      vr63, p
      lw      vr62, 0(vr63)
      # %_27 = icmp eq i32 %_25, %_26
      sub     vr64, vr60, vr62
      seqz    vr65, vr64
      mv      vr66, vr65
      # br i1 %_27, label %if.then.3, label %if.else.3
      beqz     vr66, main_if.else.3
main_if.then.3:
      # call void @print(ptr @string.1)
      la      vr67, string.1
      mv      a0, vr67
      sw      ra, 16(sp)
      call    print
      lw      ra, 16(sp)
      # %_29 = load i32, ptr @i
      la      vr69, i
      lw      vr68, 0(vr69)
      # %_28 = call ptr @toString(i32 %_29)
      mv      a0, vr68
      sw      ra, 20(sp)
      call    toString
      mv      vr70, a0
      lw      ra, 20(sp)
      # call void @print(ptr %_28)
      mv      a0, vr70
      sw      ra, 24(sp)
      call    print
      lw      ra, 24(sp)
      # call void @print(ptr @string.2)
      la      vr71, string.2
      mv      a0, vr71
      sw      ra, 28(sp)
      call    print
      lw      ra, 28(sp)
      # br label %if.end.3
      j       main_if.end.3
main_if.else.3:
      # %_30 = load i32, ptr @i
      la      vr73, i
      lw      vr72, 0(vr73)
      # call void @printInt(i32 %_30)
      mv      a0, vr72
      sw      ra, 32(sp)
      call    printInt
      lw      ra, 32(sp)
      # call void @print(ptr @string.3)
      la      vr74, string.3
      mv      a0, vr74
      sw      ra, 36(sp)
      call    print
      lw      ra, 36(sp)
      # br label %if.end.3
      j       main_if.end.3
main_if.end.3:
      # br label %if.end.2
      j       main_if.end.2
main_if.end.2:
      # br label %for.step.0
      j       main_for.step.0
main_for.step.0:
      # %_31 = load i32, ptr @i
      la      vr76, i
      lw      vr75, 0(vr76)
      # %_32 = add i32 %_31, 1
      li      vr78, 1
      add     vr77, vr75, vr78
      # store i32 %_32, ptr @i
      la      vr79, i
      sw      vr77, 0(vr79)
      # br label %for.cond.0
      j       main_for.cond.0
main_for.end.0:
      # %_33 = load i32, ptr @p
      la      vr81, p
      lw      vr80, 0(vr81)
      # %_34 = load i32, ptr @k
      la      vr83, k
      lw      vr82, 0(vr83)
      # %_35 = add i32 %_33, %_34
      add     vr84, vr80, vr82
      # %_36 = load i32, ptr @n
      la      vr86, n
      lw      vr85, 0(vr86)
      # %_37 = icmp slt i32 %_35, %_36
      sub     vr87, vr84, vr85
      sltz    vr88, vr87
      mv      vr89, vr88
      # br i1 %_37, label %if.then.4, label %if.end.4
      beqz     vr89, main_if.end.4
main_if.then.4:
      # call void @print(ptr @string.4)
      la      vr90, string.4
      mv      a0, vr90
      sw      ra, 40(sp)
      call    print
      lw      ra, 40(sp)
      # br label %if.end.4
      j       main_if.end.4
main_if.end.4:
      # ret i32 0
      li      vr91, 0
      mv      a0, vr91
      addi    sp, sp, 0
      ret
      .section data
      .globl p
p:
      .word  0
      .section data
      .globl i
i:
      .word  0
      .section data
      .globl k
k:
      .word  0
      .section data
      .globl n
n:
      .word  0
      .section rodata
      .globl string.0
string.0:
      .asciz  "<< "
      .section rodata
      .globl string.1
string.1:
      .asciz  "("
      .section rodata
      .globl string.2
string.2:
      .asciz  ") "
      .section rodata
      .globl string.3
string.3:
      .asciz  " "
      .section rodata
      .globl string.4
string.4:
      .asciz  ">> "

