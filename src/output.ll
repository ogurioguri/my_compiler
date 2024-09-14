      .section .data
      .globl n.0
n.0:
      .word  0
      .section .data
      .globl p.0
p.0:
      .word  0
      .section .data
      .globl i.0
i.0:
      .word  0
      .section .data
      .globl k.0
k.0:
      .word  0
      .section .rodata
      .globl _string.0
_string.0:
      .asciz  "<< "
      .section .rodata
      .globl _string.1
_string.1:
      .asciz  "("
      .section .rodata
      .globl _string.2
_string.2:
      .asciz  ") "
      .section .rodata
      .globl _string.3
_string.3:
      .asciz  " "
      .section .rodata
      .globl _string.4
_string.4:
      .asciz  ">> "
      .section .text
      .globl main
main:
      addi    sp, sp, -196
main_entry:
      # %__tmp.0 = load i32, ptr @n.0
      la      t1, n.0
      lw      t0, 0(t1)
      sw      t0, 4(sp)
      # %__tmp.1 = call i32 @getInt()
      sw      ra, 4(sp)
      call    getInt
      mv      t0, a0
      sw      t0, 12(sp)
      lw      ra, 4(sp)
      # store i32 %__tmp.1, ptr @n.0
      la      t1, n.0
      lw      t0, 12(sp)
      sw      t0, 0(t1)
      # %__tmp.2 = load i32, ptr @p.0
      la      t1, p.0
      lw      t0, 0(t1)
      sw      t0, 16(sp)
      # %__tmp.3 = call i32 @getInt()
      sw      ra, 16(sp)
      call    getInt
      mv      t0, a0
      sw      t0, 24(sp)
      lw      ra, 16(sp)
      # store i32 %__tmp.3, ptr @p.0
      la      t1, p.0
      lw      t0, 24(sp)
      sw      t0, 0(t1)
      # %__tmp.4 = load i32, ptr @k.0
      la      t1, k.0
      lw      t0, 0(t1)
      sw      t0, 28(sp)
      # %__tmp.5 = call i32 @getInt()
      sw      ra, 28(sp)
      call    getInt
      mv      t0, a0
      sw      t0, 36(sp)
      lw      ra, 28(sp)
      # store i32 %__tmp.5, ptr @k.0
      la      t1, k.0
      lw      t0, 36(sp)
      sw      t0, 0(t1)
      # %__tmp.6 = load i32, ptr @p.0
      la      t1, p.0
      lw      t0, 0(t1)
      sw      t0, 40(sp)
      # %__tmp.7 = load i32, ptr @k.0
      la      t1, k.0
      lw      t0, 0(t1)
      sw      t0, 44(sp)
      # %__tmp.8 = sub i32 %__tmp.6, %__tmp.7
      lw      t1, 40(sp)
      lw      t2, 44(sp)
      sub     t0, t1, t2
      sw      t0, 48(sp)
      # %__tmp.9 = icmp sgt i32 %__tmp.8, 1
      li      t2, 1
      lw      t1, 48(sp)
      sub     t0, t1, t2
      sgtz    t3, t1
      mv      t0, t3
      sw      t0, 52(sp)
      lw      t0, 52(sp)
      # br i1 %__tmp.9, label %if.then0, label %if.merge0
      beqz     t0, main_if.merge0
main_if.then0:
      # call void @print(ptr @_string.0)
      la      a0, _string.0
      mv      a0, vr21
      sw      ra, 52(sp)
      call    print
      lw      ra, 52(sp)
      # br label %if.merge0
      j       main_if.merge0
main_if.merge0:
      # %__tmp.10 = load i32, ptr @i.0
      la      t1, i.0
      lw      t0, 0(t1)
      sw      t0, 60(sp)
      # %__tmp.11 = load i32, ptr @p.0
      la      t1, p.0
      lw      t0, 0(t1)
      sw      t0, 64(sp)
      # %__tmp.12 = load i32, ptr @k.0
      la      t1, k.0
      lw      t0, 0(t1)
      sw      t0, 68(sp)
      # %__tmp.13 = sub i32 %__tmp.11, %__tmp.12
      lw      t1, 64(sp)
      lw      t2, 68(sp)
      sub     t0, t1, t2
      sw      t0, 72(sp)
      # store i32 %__tmp.13, ptr @i.0
      la      t1, i.0
      lw      t0, 72(sp)
      sw      t0, 0(t1)
      # br label %for.cond0
      j       main_for.cond0
main_for.cond0:
      # %__tmp.14 = load i32, ptr @i.0
      la      t1, i.0
      lw      t0, 0(t1)
      sw      t0, 76(sp)
      # %__tmp.15 = load i32, ptr @p.0
      la      t1, p.0
      lw      t0, 0(t1)
      sw      t0, 80(sp)
      # %__tmp.16 = load i32, ptr @k.0
      la      t1, k.0
      lw      t0, 0(t1)
      sw      t0, 84(sp)
      # %__tmp.17 = add i32 %__tmp.15, %__tmp.16
      lw      t1, 80(sp)
      lw      t2, 84(sp)
      add     t0, t1, t2
      sw      t0, 88(sp)
      # %__tmp.18 = icmp sle i32 %__tmp.14, %__tmp.17
      lw      t1, 76(sp)
      lw      t2, 88(sp)
      sub     t0, t1, t2
      sltz    t3, t0
      seqz    t1, t0
      or      t2, t3, t1
      mv      t0, t2
      sw      t0, 92(sp)
      lw      t0, 92(sp)
      # br i1 %__tmp.18, label %for.body0, label %for.merge0
      beqz     t0, main_for.merge0
main_for.body0:
      # %__tmp.19 = load i32, ptr @i.0
      la      t1, i.0
      lw      t0, 0(t1)
      sw      t0, 96(sp)
      # %__tmp.20 = icmp sle i32 1, %__tmp.19
      li      t1, 1
      lw      t2, 96(sp)
      sub     t0, t1, t2
      sltz    t3, t0
      seqz    t1, t0
      or      t2, t3, t1
      mv      t0, t2
      sw      t0, 100(sp)
      lw      t0, 100(sp)
      # br i1 %__tmp.20, label %if.then.1, label %if.else.1
      beqz     t0, main_if.else.1
main_if.then.1:
      # %__tmp.21 = load i32, ptr @i.0
      la      t1, i.0
      lw      t0, 0(t1)
      sw      t0, 104(sp)
      # %__tmp.22 = load i32, ptr @n.0
      la      t1, n.0
      lw      t0, 0(t1)
      sw      t0, 108(sp)
      # %__tmp.23 = icmp sle i32 %__tmp.21, %__tmp.22
      lw      t1, 104(sp)
      lw      t2, 108(sp)
      sub     t0, t1, t2
      sltz    t3, t0
      seqz    t1, t0
      or      t2, t3, t1
      mv      t0, t2
      sw      t0, 112(sp)
      # br label %if.end.1
      mv      t0, t1
      j       main_if.end.1
main_if.else.1:
      # br label %if.end.1
      mv      t0, t1
      j       main_if.end.1
main_if.end.1:
      sw      t0, 116(sp)
      lw      t0, 116(sp)
      # br i1 %__tmp.24, label %if.then2, label %if.merge2
      beqz     t0, main_if.merge2
main_if.then2:
      # %__tmp.25 = load i32, ptr @i.0
      la      t1, i.0
      lw      t0, 0(t1)
      sw      t0, 120(sp)
      # %__tmp.26 = load i32, ptr @p.0
      la      t1, p.0
      lw      t0, 0(t1)
      sw      t0, 124(sp)
      # %__tmp.27 = icmp eq i32 %__tmp.25, %__tmp.26
      lw      t1, 120(sp)
      lw      t2, 124(sp)
      sub     t0, t1, t2
      seqz    t3, t1
      mv      t0, t3
      sw      t0, 128(sp)
      lw      t0, 128(sp)
      # br i1 %__tmp.27, label %if.then3, label %if.else3
      beqz     t0, main_if.else3
main_if.then3:
      # call void @print(ptr @_string.1)
      la      a0, _string.1
      mv      a0, vr67
      sw      ra, 128(sp)
      call    print
      lw      ra, 128(sp)
      # %__tmp.29 = load i32, ptr @i.0
      la      t1, i.0
      lw      t0, 0(t1)
      sw      t0, 136(sp)
      # %__tmp.28 = call ptr @toString(i32 %__tmp.29)
      mv      a0, vr68
      sw      ra, 136(sp)
      call    toString
      mv      t0, a0
      sw      t0, 144(sp)
      lw      ra, 136(sp)
      # call void @print(ptr %__tmp.28)
      mv      a0, vr70
      sw      ra, 144(sp)
      call    print
      lw      ra, 144(sp)
      # call void @print(ptr @_string.2)
      la      a0, _string.2
      mv      a0, vr71
      sw      ra, 148(sp)
      call    print
      lw      ra, 148(sp)
      # br label %if.merge3
      j       main_if.merge3
main_if.else3:
      # %__tmp.30 = load i32, ptr @i.0
      la      t1, i.0
      lw      t0, 0(t1)
      sw      t0, 156(sp)
      # call void @printInt(i32 %__tmp.30)
      mv      a0, vr72
      sw      ra, 156(sp)
      call    printInt
      lw      ra, 156(sp)
      # call void @print(ptr @_string.3)
      la      a0, _string.3
      mv      a0, vr74
      sw      ra, 160(sp)
      call    print
      lw      ra, 160(sp)
      # br label %if.merge3
      j       main_if.merge3
main_if.merge3:
      # br label %if.merge2
      j       main_if.merge2
main_if.merge2:
      # br label %for.step0
      j       main_for.step0
main_for.step0:
      # %__tmp.31 = load i32, ptr @i.0
      la      t1, i.0
      lw      t0, 0(t1)
      sw      t0, 168(sp)
      # %__tmp.32 = add i32 %__tmp.31, 1
      li      t2, 1
      lw      t1, 168(sp)
      add     t0, t1, t2
      sw      t0, 172(sp)
      # store i32 %__tmp.32, ptr @i.0
      la      t1, i.0
      lw      t0, 172(sp)
      sw      t0, 0(t1)
      # br label %for.cond0
      j       main_for.cond0
main_for.merge0:
      # %__tmp.33 = load i32, ptr @p.0
      la      t1, p.0
      lw      t0, 0(t1)
      sw      t0, 176(sp)
      # %__tmp.34 = load i32, ptr @k.0
      la      t1, k.0
      lw      t0, 0(t1)
      sw      t0, 180(sp)
      # %__tmp.35 = add i32 %__tmp.33, %__tmp.34
      lw      t1, 176(sp)
      lw      t2, 180(sp)
      add     t0, t1, t2
      sw      t0, 184(sp)
      # %__tmp.36 = load i32, ptr @n.0
      la      t1, n.0
      lw      t0, 0(t1)
      sw      t0, 188(sp)
      # %__tmp.37 = icmp slt i32 %__tmp.35, %__tmp.36
      lw      t1, 184(sp)
      lw      t2, 188(sp)
      sub     t0, t1, t2
      sltz    t3, t1
      mv      t0, t3
      sw      t0, 192(sp)
      lw      t0, 192(sp)
      # br i1 %__tmp.37, label %if.then4, label %if.merge4
      beqz     t0, main_if.merge4
main_if.then4:
      # call void @print(ptr @_string.4)
      la      a0, _string.4
      mv      a0, vr90
      sw      ra, 192(sp)
      call    print
      lw      ra, 192(sp)
      # br label %if.merge4
      j       main_if.merge4
main_if.merge4:
      # ret i32 0
      li      t0, 0
      mv      a0, t0
      addi    sp, sp, 196
      ret     
