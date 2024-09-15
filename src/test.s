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
      addi    sp, sp, -340
main_entry:
      # %__tmp.0 = load i32, ptr @n.0
      la      t1, n.0
      sw      t1, 0(sp)
      lw      t1, 0(sp)
      lw      t0, 0(t1)
      sw      t0, 4(sp)
      # %__tmp.1 = call i32 @getInt()
      sw      ra, 8(sp)
      call    getInt
      mv      t0, a0
      sw      t0, 12(sp)
      lw      ra, 8(sp)
      # store i32 %__tmp.1, ptr @n.0
      la      t1, n.0
      sw      t1, 16(sp)
      lw      t0, 12(sp)
      lw      t1, 16(sp)
      sw      t0, 0(t1)
      # %__tmp.2 = load i32, ptr @p.0
      la      t1, p.0
      sw      t1, 20(sp)
      lw      t1, 20(sp)
      lw      t0, 0(t1)
      sw      t0, 24(sp)
      # %__tmp.3 = call i32 @getInt()
      sw      ra, 28(sp)
      call    getInt
      mv      t0, a0
      sw      t0, 32(sp)
      lw      ra, 28(sp)
      # store i32 %__tmp.3, ptr @p.0
      la      t1, p.0
      sw      t1, 36(sp)
      lw      t0, 32(sp)
      lw      t1, 36(sp)
      sw      t0, 0(t1)
      # %__tmp.4 = load i32, ptr @k.0
      la      t1, k.0
      sw      t1, 40(sp)
      lw      t1, 40(sp)
      lw      t0, 0(t1)
      sw      t0, 44(sp)
      # %__tmp.5 = call i32 @getInt()
      sw      ra, 48(sp)
      call    getInt
      mv      t0, a0
      sw      t0, 52(sp)
      lw      ra, 48(sp)
      # store i32 %__tmp.5, ptr @k.0
      la      t1, k.0
      sw      t1, 56(sp)
      lw      t0, 52(sp)
      lw      t1, 56(sp)
      sw      t0, 0(t1)
      # %__tmp.6 = load i32, ptr @p.0
      la      t1, p.0
      sw      t1, 60(sp)
      lw      t1, 60(sp)
      lw      t0, 0(t1)
      sw      t0, 64(sp)
      # %__tmp.7 = load i32, ptr @k.0
      la      t1, k.0
      sw      t1, 68(sp)
      lw      t1, 68(sp)
      lw      t0, 0(t1)
      sw      t0, 72(sp)
      # %__tmp.8 = sub i32 %__tmp.6, %__tmp.7
      lw      t1, 64(sp)
      lw      t2, 72(sp)
      sub     t0, t1, t2
      sw      t0, 76(sp)
      # %__tmp.9 = icmp sgt i32 %__tmp.8, 1
      li      t2, 1
      sw      t2, 80(sp)
      lw      t1, 76(sp)
      lw      t2, 80(sp)
      sub     t0, t1, t2
      sgtz    t3, t0
      mv      t0, t3
      sw      t0, 84(sp)
      # br i1 %__tmp.9, label %if.then0, label %if.merge0
      lw      t0, 84(sp)
      beqz     t0, main_if.merge0
main_if.then0:
      # call void @print(ptr @_string.0)
      la      t0, _string.0
      sw      t0, 88(sp)
      lw      t0, 88(sp)
      mv      a0, t0
      sw      ra, 92(sp)
      call    print
      lw      ra, 92(sp)
      # br label %if.merge0
      j       main_if.merge0
main_if.merge0:
      # %__tmp.10 = load i32, ptr @i.0
      la      t1, i.0
      sw      t1, 96(sp)
      lw      t1, 96(sp)
      lw      t0, 0(t1)
      sw      t0, 100(sp)
      # %__tmp.11 = load i32, ptr @p.0
      la      t1, p.0
      sw      t1, 104(sp)
      lw      t1, 104(sp)
      lw      t0, 0(t1)
      sw      t0, 108(sp)
      # %__tmp.12 = load i32, ptr @k.0
      la      t1, k.0
      sw      t1, 112(sp)
      lw      t1, 112(sp)
      lw      t0, 0(t1)
      sw      t0, 116(sp)
      # %__tmp.13 = sub i32 %__tmp.11, %__tmp.12
      lw      t1, 108(sp)
      lw      t2, 116(sp)
      sub     t0, t1, t2
      sw      t0, 120(sp)
      # store i32 %__tmp.13, ptr @i.0
      la      t1, i.0
      sw      t1, 124(sp)
      lw      t0, 120(sp)
      lw      t1, 124(sp)
      sw      t0, 0(t1)
      # br label %for.cond0
      j       main_for.cond0
main_for.cond0:
      # %__tmp.14 = load i32, ptr @i.0
      la      t1, i.0
      sw      t1, 128(sp)
      lw      t1, 128(sp)
      lw      t0, 0(t1)
      sw      t0, 132(sp)
      # %__tmp.15 = load i32, ptr @p.0
      la      t1, p.0
      sw      t1, 136(sp)
      lw      t1, 136(sp)
      lw      t0, 0(t1)
      sw      t0, 140(sp)
      # %__tmp.16 = load i32, ptr @k.0
      la      t1, k.0
      sw      t1, 144(sp)
      lw      t1, 144(sp)
      lw      t0, 0(t1)
      sw      t0, 148(sp)
      # %__tmp.17 = add i32 %__tmp.15, %__tmp.16
      lw      t1, 140(sp)
      lw      t2, 148(sp)
      add     t0, t1, t2
      sw      t0, 152(sp)
      # %__tmp.18 = icmp sle i32 %__tmp.14, %__tmp.17
      lw      t1, 132(sp)
      lw      t2, 152(sp)
      sub     t0, t1, t2
      sltz    t3, t0
      seqz    t1, t0
      or      t2, t3, t1
      mv      t0, t2
      sw      t0, 156(sp)
      # br i1 %__tmp.18, label %for.body0, label %for.merge0
      lw      t0, 156(sp)
      beqz     t0, main_for.merge0
main_for.body0:
      # %__tmp.19 = load i32, ptr @i.0
      la      t1, i.0
      sw      t1, 160(sp)
      lw      t1, 160(sp)
      lw      t0, 0(t1)
      sw      t0, 164(sp)
      # %__tmp.20 = icmp sle i32 1, %__tmp.19
      li      t1, 1
      sw      t1, 168(sp)
      lw      t1, 168(sp)
      lw      t2, 164(sp)
      sub     t0, t1, t2
      sltz    t3, t0
      seqz    t1, t0
      or      t2, t3, t1
      mv      t0, t2
      sw      t0, 172(sp)
      # br i1 %__tmp.20, label %if.then.1, label %if.else.1
      lw      t0, 172(sp)
      beqz     t0, main_if.else.1
main_if.then.1:
      # %__tmp.21 = load i32, ptr @i.0
      la      t1, i.0
      sw      t1, 176(sp)
      lw      t1, 176(sp)
      lw      t0, 0(t1)
      sw      t0, 180(sp)
      # %__tmp.22 = load i32, ptr @n.0
      la      t1, n.0
      sw      t1, 184(sp)
      lw      t1, 184(sp)
      lw      t0, 0(t1)
      sw      t0, 188(sp)
      # %__tmp.23 = icmp sle i32 %__tmp.21, %__tmp.22
      lw      t1, 180(sp)
      lw      t2, 188(sp)
      sub     t0, t1, t2
      sltz    t3, t0
      seqz    t1, t0
      or      t2, t3, t1
      mv      t0, t2
      sw      t0, 192(sp)
      # br label %if.end.1
      lw      t1, 192(sp)
      mv      t0, t1
      j       main_if.end.1
main_if.else.1:
      # br label %if.end.1
      lw      t1, 172(sp)
      mv      t0, t1
      j       main_if.end.1
main_if.end.1:
      sw      t0, 196(sp)
      # br i1 %__tmp.24, label %if.then2, label %if.merge2
      lw      t0, 196(sp)
      beqz     t0, main_if.merge2
main_if.then2:
      # %__tmp.25 = load i32, ptr @i.0
      la      t1, i.0
      sw      t1, 200(sp)
      lw      t1, 200(sp)
      lw      t0, 0(t1)
      sw      t0, 204(sp)
      # %__tmp.26 = load i32, ptr @p.0
      la      t1, p.0
      sw      t1, 208(sp)
      lw      t1, 208(sp)
      lw      t0, 0(t1)
      sw      t0, 212(sp)
      # %__tmp.27 = icmp eq i32 %__tmp.25, %__tmp.26
      lw      t1, 204(sp)
      lw      t2, 212(sp)
      sub     t0, t1, t2
      seqz    t3, t0
      mv      t0, t3
      sw      t0, 216(sp)
      # br i1 %__tmp.27, label %if.then3, label %if.else3
      lw      t0, 216(sp)
      beqz     t0, main_if.else3
main_if.then3:
      # call void @print(ptr @_string.1)
      la      t0, _string.1
      sw      t0, 220(sp)
      lw      t0, 220(sp)
      mv      a0, t0
      sw      ra, 224(sp)
      call    print
      lw      ra, 224(sp)
      # %__tmp.29 = load i32, ptr @i.0
      la      t1, i.0
      sw      t1, 228(sp)
      lw      t1, 228(sp)
      lw      t0, 0(t1)
      sw      t0, 232(sp)
      # %__tmp.28 = call ptr @toString(i32 %__tmp.29)
      lw      t0, 232(sp)
      mv      a0, t0
      sw      ra, 236(sp)
      call    toString
      mv      t0, a0
      sw      t0, 240(sp)
      lw      ra, 236(sp)
      # call void @print(ptr %__tmp.28)
      lw      t0, 240(sp)
      mv      a0, t0
      sw      ra, 244(sp)
      call    print
      lw      ra, 244(sp)
      # call void @print(ptr @_string.2)
      la      t0, _string.2
      sw      t0, 248(sp)
      lw      t0, 248(sp)
      mv      a0, t0
      sw      ra, 252(sp)
      call    print
      lw      ra, 252(sp)
      # br label %if.merge3
      j       main_if.merge3
main_if.else3:
      # %__tmp.30 = load i32, ptr @i.0
      la      t1, i.0
      sw      t1, 256(sp)
      lw      t1, 256(sp)
      lw      t0, 0(t1)
      sw      t0, 260(sp)
      # call void @printInt(i32 %__tmp.30)
      lw      t0, 260(sp)
      mv      a0, t0
      sw      ra, 264(sp)
      call    printInt
      lw      ra, 264(sp)
      # call void @print(ptr @_string.3)
      la      t0, _string.3
      sw      t0, 268(sp)
      lw      t0, 268(sp)
      mv      a0, t0
      sw      ra, 272(sp)
      call    print
      lw      ra, 272(sp)
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
      sw      t1, 276(sp)
      lw      t1, 276(sp)
      lw      t0, 0(t1)
      sw      t0, 280(sp)
      # %__tmp.32 = add i32 %__tmp.31, 1
      li      t2, 1
      sw      t2, 284(sp)
      lw      t1, 280(sp)
      lw      t2, 284(sp)
      add     t0, t1, t2
      sw      t0, 288(sp)
      # store i32 %__tmp.32, ptr @i.0
      la      t1, i.0
      sw      t1, 292(sp)
      lw      t0, 288(sp)
      lw      t1, 292(sp)
      sw      t0, 0(t1)
      # br label %for.cond0
      j       main_for.cond0
main_for.merge0:
      # %__tmp.33 = load i32, ptr @p.0
      la      t1, p.0
      sw      t1, 296(sp)
      lw      t1, 296(sp)
      lw      t0, 0(t1)
      sw      t0, 300(sp)
      # %__tmp.34 = load i32, ptr @k.0
      la      t1, k.0
      sw      t1, 304(sp)
      lw      t1, 304(sp)
      lw      t0, 0(t1)
      sw      t0, 308(sp)
      # %__tmp.35 = add i32 %__tmp.33, %__tmp.34
      lw      t1, 300(sp)
      lw      t2, 308(sp)
      add     t0, t1, t2
      sw      t0, 312(sp)
      # %__tmp.36 = load i32, ptr @n.0
      la      t1, n.0
      sw      t1, 316(sp)
      lw      t1, 316(sp)
      lw      t0, 0(t1)
      sw      t0, 320(sp)
      # %__tmp.37 = icmp slt i32 %__tmp.35, %__tmp.36
      lw      t1, 312(sp)
      lw      t2, 320(sp)
      sub     t0, t1, t2
      sltz    t3, t0
      mv      t0, t3
      sw      t0, 324(sp)
      # br i1 %__tmp.37, label %if.then4, label %if.merge4
      lw      t0, 324(sp)
      beqz     t0, main_if.merge4
main_if.then4:
      # call void @print(ptr @_string.4)
      la      t0, _string.4
      sw      t0, 328(sp)
      lw      t0, 328(sp)
      mv      a0, t0
      sw      ra, 332(sp)
      call    print
      lw      ra, 332(sp)
      # br label %if.merge4
      j       main_if.merge4
main_if.merge4:
      # ret i32 0
      li      t0, 0
      sw      t0, 336(sp)
      lw      t0, 336(sp)
      mv      a0, t0
      addi    sp, sp, 340
      ret     
