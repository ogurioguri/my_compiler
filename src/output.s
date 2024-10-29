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
      addi    sp, sp, -352
main_entry:
      # %__tmp.0 = load i32, ptr @n.0
      la      t0, n.0
      # %__tmp.1 = call i32 @getInt()
      sw      ra, 0(sp)
      sw      t0, 4(sp)
      sw      t1, 8(sp)
      sw      t2, 12(sp)
      sw      t3, 16(sp)
      sw      t4, 20(sp)
      sw      t5, 24(sp)
      sw      t6, 28(sp)
      call    getInt
      lw      ra, 0(sp)
      lw      t0, 4(sp)
      lw      t1, 8(sp)
      lw      t2, 12(sp)
      lw      t3, 16(sp)
      lw      t4, 20(sp)
      lw      t5, 24(sp)
      lw      t6, 28(sp)
      mv      t0, a0
      # store i32 %__tmp.1, ptr @n.0
      la      t1, n.0
      sw      t0, 0(t1)
      # %__tmp.2 = load i32, ptr @p.0
      la      t0, p.0
      # %__tmp.3 = call i32 @getInt()
      sw      ra, 32(sp)
      sw      t0, 36(sp)
      sw      t1, 40(sp)
      sw      t2, 44(sp)
      sw      t3, 48(sp)
      sw      t4, 52(sp)
      sw      t5, 56(sp)
      sw      t6, 60(sp)
      call    getInt
      lw      ra, 32(sp)
      lw      t0, 36(sp)
      lw      t1, 40(sp)
      lw      t2, 44(sp)
      lw      t3, 48(sp)
      lw      t4, 52(sp)
      lw      t5, 56(sp)
      lw      t6, 60(sp)
      mv      t0, a0
      # store i32 %__tmp.3, ptr @p.0
      la      t1, p.0
      sw      t0, 0(t1)
      # %__tmp.4 = load i32, ptr @k.0
      la      t0, k.0
      # %__tmp.5 = call i32 @getInt()
      sw      ra, 64(sp)
      sw      t0, 68(sp)
      sw      t1, 72(sp)
      sw      t2, 76(sp)
      sw      t3, 80(sp)
      sw      t4, 84(sp)
      sw      t5, 88(sp)
      sw      t6, 92(sp)
      call    getInt
      lw      ra, 64(sp)
      lw      t0, 68(sp)
      lw      t1, 72(sp)
      lw      t2, 76(sp)
      lw      t3, 80(sp)
      lw      t4, 84(sp)
      lw      t5, 88(sp)
      lw      t6, 92(sp)
      mv      t0, a0
      # store i32 %__tmp.5, ptr @k.0
      la      t1, k.0
      sw      t0, 0(t1)
      # %__tmp.6 = load i32, ptr @p.0
      la      t0, p.0
      lw      t1, 0(t0)
      # %__tmp.7 = load i32, ptr @k.0
      la      t0, k.0
      lw      t2, 0(t0)
      # %__tmp.8 = sub i32 %__tmp.6, %__tmp.7
      sub     t0, t1, t2
      # %__tmp.9 = icmp sgt i32 %__tmp.8, 1
      li      t1, 1
      sub     t2, t0, t1
      sgtz    t0, t2
      mv      t1, t0
      # br i1 %__tmp.9, label %if.then0, label %split0
      beqz     t1, main_split0
main_if.then0:
      # call void @print(ptr @_string.0)
      la      t0, _string.0
      mv      a0, t0
      sw      ra, 96(sp)
      sw      t0, 100(sp)
      sw      t1, 104(sp)
      sw      t2, 108(sp)
      sw      t3, 112(sp)
      sw      t4, 116(sp)
      sw      t5, 120(sp)
      sw      t6, 124(sp)
      call    print
      lw      ra, 96(sp)
      lw      t0, 100(sp)
      lw      t1, 104(sp)
      lw      t2, 108(sp)
      lw      t3, 112(sp)
      lw      t4, 116(sp)
      lw      t5, 120(sp)
      lw      t6, 124(sp)
      # br label %if.merge0
      j       main_if.merge0
main_split0:
      # br label %if.merge0
      j       main_if.merge0
main_if.merge0:
      # %__tmp.10 = load i32, ptr @i.0
      la      t0, i.0
      # %__tmp.11 = load i32, ptr @p.0
      la      t0, p.0
      lw      t1, 0(t0)
      # %__tmp.12 = load i32, ptr @k.0
      la      t0, k.0
      lw      t2, 0(t0)
      # %__tmp.13 = sub i32 %__tmp.11, %__tmp.12
      sub     t0, t1, t2
      # store i32 %__tmp.13, ptr @i.0
      la      t1, i.0
      sw      t0, 0(t1)
      # br label %for.cond0
      j       main_for.cond0
main_for.cond0:
      # %__tmp.14 = load i32, ptr @i.0
      la      t0, i.0
      lw      t1, 0(t0)
      # %__tmp.15 = load i32, ptr @p.0
      la      t0, p.0
      lw      t2, 0(t0)
      # %__tmp.16 = load i32, ptr @k.0
      la      t0, k.0
      lw      t3, 0(t0)
      # %__tmp.17 = add i32 %__tmp.15, %__tmp.16
      add     t0, t2, t3
      # %__tmp.18 = icmp sle i32 %__tmp.14, %__tmp.17
      sub     t2, t1, t0
      sltz    t0, t2
      seqz    t1, t2
      or      t2, t0, t1
      mv      t0, t2
      # br i1 %__tmp.18, label %for.body0, label %for.merge0
      beqz     t0, main_for.merge0
main_for.body0:
      # %__tmp.19 = load i32, ptr @i.0
      la      t0, i.0
      lw      t1, 0(t0)
      # %__tmp.20 = icmp sle i32 1, %__tmp.19
      li      t0, 1
      sub     t2, t0, t1
      sltz    t0, t2
      seqz    t1, t2
      or      t2, t0, t1
      mv      t0, t2
      # br i1 %__tmp.20, label %if.then.1, label %if.else.1
      beqz     t0, main_if.else.1
main_if.then.1:
      # %__tmp.21 = load i32, ptr @i.0
      la      t1, i.0
      lw      t2, 0(t1)
      # %__tmp.22 = load i32, ptr @n.0
      la      t1, n.0
      lw      t3, 0(t1)
      # %__tmp.23 = icmp sle i32 %__tmp.21, %__tmp.22
      sub     t1, t2, t3
      sltz    t2, t1
      seqz    t3, t1
      or      t1, t2, t3
      mv      t2, t1
      # br label %if.end.1
      mv      t1, t2
      j       main_if.end.1
main_if.else.1:
      # br label %if.end.1
      mv      t1, t0
      j       main_if.end.1
main_if.end.1:
      # br i1 %__tmp.24, label %if.then2, label %split2
      beqz     t1, main_split2
main_if.then2:
      # %__tmp.25 = load i32, ptr @i.0
      la      t0, i.0
      lw      t1, 0(t0)
      # %__tmp.26 = load i32, ptr @p.0
      la      t0, p.0
      lw      t2, 0(t0)
      # %__tmp.27 = icmp eq i32 %__tmp.25, %__tmp.26
      sub     t0, t1, t2
      seqz    t1, t0
      mv      t0, t1
      # br i1 %__tmp.27, label %if.then3, label %if.else3
      beqz     t0, main_if.else3
main_if.then3:
      # call void @print(ptr @_string.1)
      la      t0, _string.1
      mv      a0, t0
      sw      ra, 128(sp)
      sw      t0, 132(sp)
      sw      t1, 136(sp)
      sw      t2, 140(sp)
      sw      t3, 144(sp)
      sw      t4, 148(sp)
      sw      t5, 152(sp)
      sw      t6, 156(sp)
      call    print
      lw      ra, 128(sp)
      lw      t0, 132(sp)
      lw      t1, 136(sp)
      lw      t2, 140(sp)
      lw      t3, 144(sp)
      lw      t4, 148(sp)
      lw      t5, 152(sp)
      lw      t6, 156(sp)
      # %__tmp.29 = load i32, ptr @i.0
      la      t0, i.0
      lw      t1, 0(t0)
      # %__tmp.28 = call ptr @toString(i32 %__tmp.29)
      mv      a0, t1
      sw      ra, 160(sp)
      sw      t0, 164(sp)
      sw      t1, 168(sp)
      sw      t2, 172(sp)
      sw      t3, 176(sp)
      sw      t4, 180(sp)
      sw      t5, 184(sp)
      sw      t6, 188(sp)
      call    toString
      lw      ra, 160(sp)
      lw      t0, 164(sp)
      lw      t1, 168(sp)
      lw      t2, 172(sp)
      lw      t3, 176(sp)
      lw      t4, 180(sp)
      lw      t5, 184(sp)
      lw      t6, 188(sp)
      mv      t0, a0
      # call void @print(ptr %__tmp.28)
      mv      a0, t0
      sw      ra, 192(sp)
      sw      t0, 196(sp)
      sw      t1, 200(sp)
      sw      t2, 204(sp)
      sw      t3, 208(sp)
      sw      t4, 212(sp)
      sw      t5, 216(sp)
      sw      t6, 220(sp)
      call    print
      lw      ra, 192(sp)
      lw      t0, 196(sp)
      lw      t1, 200(sp)
      lw      t2, 204(sp)
      lw      t3, 208(sp)
      lw      t4, 212(sp)
      lw      t5, 216(sp)
      lw      t6, 220(sp)
      # call void @print(ptr @_string.2)
      la      t0, _string.2
      mv      a0, t0
      sw      ra, 224(sp)
      sw      t0, 228(sp)
      sw      t1, 232(sp)
      sw      t2, 236(sp)
      sw      t3, 240(sp)
      sw      t4, 244(sp)
      sw      t5, 248(sp)
      sw      t6, 252(sp)
      call    print
      lw      ra, 224(sp)
      lw      t0, 228(sp)
      lw      t1, 232(sp)
      lw      t2, 236(sp)
      lw      t3, 240(sp)
      lw      t4, 244(sp)
      lw      t5, 248(sp)
      lw      t6, 252(sp)
      # br label %if.merge3
      j       main_if.merge3
main_if.else3:
      # %__tmp.30 = load i32, ptr @i.0
      la      t0, i.0
      lw      t1, 0(t0)
      # call void @printInt(i32 %__tmp.30)
      mv      a0, t1
      sw      ra, 256(sp)
      sw      t0, 260(sp)
      sw      t1, 264(sp)
      sw      t2, 268(sp)
      sw      t3, 272(sp)
      sw      t4, 276(sp)
      sw      t5, 280(sp)
      sw      t6, 284(sp)
      call    printInt
      lw      ra, 256(sp)
      lw      t0, 260(sp)
      lw      t1, 264(sp)
      lw      t2, 268(sp)
      lw      t3, 272(sp)
      lw      t4, 276(sp)
      lw      t5, 280(sp)
      lw      t6, 284(sp)
      # call void @print(ptr @_string.3)
      la      t0, _string.3
      mv      a0, t0
      sw      ra, 288(sp)
      sw      t0, 292(sp)
      sw      t1, 296(sp)
      sw      t2, 300(sp)
      sw      t3, 304(sp)
      sw      t4, 308(sp)
      sw      t5, 312(sp)
      sw      t6, 316(sp)
      call    print
      lw      ra, 288(sp)
      lw      t0, 292(sp)
      lw      t1, 296(sp)
      lw      t2, 300(sp)
      lw      t3, 304(sp)
      lw      t4, 308(sp)
      lw      t5, 312(sp)
      lw      t6, 316(sp)
      # br label %if.merge3
      j       main_if.merge3
main_if.merge3:
      # br label %if.merge2
      j       main_if.merge2
main_split2:
      # br label %if.merge2
      j       main_if.merge2
main_if.merge2:
      # br label %for.step0
      j       main_for.step0
main_for.step0:
      # %__tmp.31 = load i32, ptr @i.0
      la      t0, i.0
      lw      t1, 0(t0)
      # %__tmp.32 = add i32 %__tmp.31, 1
      li      t0, 1
      add     t2, t1, t0
      # store i32 %__tmp.32, ptr @i.0
      la      t0, i.0
      sw      t2, 0(t0)
      # br label %for.cond0
      j       main_for.cond0
main_for.merge0:
      # %__tmp.33 = load i32, ptr @p.0
      la      t0, p.0
      lw      t1, 0(t0)
      # %__tmp.34 = load i32, ptr @k.0
      la      t0, k.0
      lw      t2, 0(t0)
      # %__tmp.35 = add i32 %__tmp.33, %__tmp.34
      add     t0, t1, t2
      # %__tmp.36 = load i32, ptr @n.0
      la      t1, n.0
      lw      t2, 0(t1)
      # %__tmp.37 = icmp slt i32 %__tmp.35, %__tmp.36
      sub     t1, t0, t2
      sltz    t0, t1
      mv      t1, t0
      # br i1 %__tmp.37, label %if.then4, label %split1
      beqz     t1, main_split1
main_if.then4:
      # call void @print(ptr @_string.4)
      la      t0, _string.4
      mv      a0, t0
      sw      ra, 320(sp)
      sw      t0, 324(sp)
      sw      t1, 328(sp)
      sw      t2, 332(sp)
      sw      t3, 336(sp)
      sw      t4, 340(sp)
      sw      t5, 344(sp)
      sw      t6, 348(sp)
      call    print
      lw      ra, 320(sp)
      lw      t0, 324(sp)
      lw      t1, 328(sp)
      lw      t2, 332(sp)
      lw      t3, 336(sp)
      lw      t4, 340(sp)
      lw      t5, 344(sp)
      lw      t6, 348(sp)
      # br label %if.merge4
      j       main_if.merge4
main_split1:
      # br label %if.merge4
      j       main_if.merge4
main_if.merge4:
      # ret i32 0
      li      t0, 0
      mv      a0, t0
      addi    sp, sp, 352
      ret     
