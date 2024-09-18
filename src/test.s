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
      addi    sp, sp, -544
main_entry:
      # %__tmp.0 = load i32, ptr @n.0
      la      t1, n.0
      sw      t1, 0(sp)
      lw      t1, 0(sp)
      lw      t0, 0(t1)
      sw      t0, 4(sp)
      # %__tmp.1 = call i32 @getInt()
      sw      ra, 8(sp)
      sw      ra, 12(sp)
      sw      t0, 16(sp)
      sw      t1, 20(sp)
      sw      t2, 24(sp)
      sw      t3, 28(sp)
      call    getInt
      mv      t0, a0
      sw      t0, 32(sp)
      lw      ra, 8(sp)
      lw      t0, 12(sp)
      lw      t1, 16(sp)
      lw      t2, 20(sp)
      lw      t3, 24(sp)
      # store i32 %__tmp.1, ptr @n.0
      la      t1, n.0
      sw      t1, 36(sp)
      lw      t0, 32(sp)
      lw      t1, 36(sp)
      sw      t0, 0(t1)
      # %__tmp.2 = load i32, ptr @p.0
      la      t1, p.0
      sw      t1, 40(sp)
      lw      t1, 40(sp)
      lw      t0, 0(t1)
      sw      t0, 44(sp)
      # %__tmp.3 = call i32 @getInt()
      sw      ra, 48(sp)
      sw      ra, 52(sp)
      sw      t0, 56(sp)
      sw      t1, 60(sp)
      sw      t2, 64(sp)
      sw      t3, 68(sp)
      call    getInt
      mv      t0, a0
      sw      t0, 72(sp)
      lw      ra, 48(sp)
      lw      t0, 52(sp)
      lw      t1, 56(sp)
      lw      t2, 60(sp)
      lw      t3, 64(sp)
      # store i32 %__tmp.3, ptr @p.0
      la      t1, p.0
      sw      t1, 76(sp)
      lw      t0, 72(sp)
      lw      t1, 76(sp)
      sw      t0, 0(t1)
      # %__tmp.4 = load i32, ptr @k.0
      la      t1, k.0
      sw      t1, 80(sp)
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      sw      t0, 84(sp)
      # %__tmp.5 = call i32 @getInt()
      sw      ra, 88(sp)
      sw      ra, 92(sp)
      sw      t0, 96(sp)
      sw      t1, 100(sp)
      sw      t2, 104(sp)
      sw      t3, 108(sp)
      call    getInt
      mv      t0, a0
      sw      t0, 112(sp)
      lw      ra, 88(sp)
      lw      t0, 92(sp)
      lw      t1, 96(sp)
      lw      t2, 100(sp)
      lw      t3, 104(sp)
      # store i32 %__tmp.5, ptr @k.0
      la      t1, k.0
      sw      t1, 116(sp)
      lw      t0, 112(sp)
      lw      t1, 116(sp)
      sw      t0, 0(t1)
      # %__tmp.6 = load i32, ptr @p.0
      la      t1, p.0
      sw      t1, 120(sp)
      lw      t1, 120(sp)
      lw      t0, 0(t1)
      sw      t0, 124(sp)
      # %__tmp.7 = load i32, ptr @k.0
      la      t1, k.0
      sw      t1, 128(sp)
      lw      t1, 128(sp)
      lw      t0, 0(t1)
      sw      t0, 132(sp)
      # %__tmp.8 = sub i32 %__tmp.6, %__tmp.7
      lw      t1, 124(sp)
      lw      t2, 132(sp)
      sub     t0, t1, t2
      sw      t0, 136(sp)
      # %__tmp.9 = icmp sgt i32 %__tmp.8, 1
      li      t2, 1
      lw      t1, 136(sp)
      sub     t0, t1, t2
      sgtz    t3, t0
      mv      t0, t3
      sw      t0, 140(sp)
      # br i1 %__tmp.9, label %if.then0, label %if.merge0
      lw      t0, 140(sp)
      beqz     t0, main_jump0
      j       main_if.then0
main_jump0:
      j       main_if.merge0
main_if.then0:
      # call void @print(ptr @_string.0)
      la      t0, _string.0
      sw      t0, 144(sp)
      lw      t0, 144(sp)
      mv      a0, t0
      sw      ra, 148(sp)
      sw      ra, 152(sp)
      sw      t0, 156(sp)
      sw      t1, 160(sp)
      sw      t2, 164(sp)
      sw      t3, 168(sp)
      call    print
      lw      ra, 148(sp)
      lw      t0, 152(sp)
      lw      t1, 156(sp)
      lw      t2, 160(sp)
      lw      t3, 164(sp)
      # br label %if.merge0
      j       main_if.merge0
main_if.merge0:
      # %__tmp.10 = load i32, ptr @i.0
      la      t1, i.0
      sw      t1, 172(sp)
      lw      t1, 172(sp)
      lw      t0, 0(t1)
      sw      t0, 176(sp)
      # %__tmp.11 = load i32, ptr @p.0
      la      t1, p.0
      sw      t1, 180(sp)
      lw      t1, 180(sp)
      lw      t0, 0(t1)
      sw      t0, 184(sp)
      # %__tmp.12 = load i32, ptr @k.0
      la      t1, k.0
      sw      t1, 188(sp)
      lw      t1, 188(sp)
      lw      t0, 0(t1)
      sw      t0, 192(sp)
      # %__tmp.13 = sub i32 %__tmp.11, %__tmp.12
      lw      t1, 184(sp)
      lw      t2, 192(sp)
      sub     t0, t1, t2
      sw      t0, 196(sp)
      # store i32 %__tmp.13, ptr @i.0
      la      t1, i.0
      sw      t1, 200(sp)
      lw      t0, 196(sp)
      lw      t1, 200(sp)
      sw      t0, 0(t1)
      # br label %for.cond0
      j       main_for.cond0
main_for.cond0:
      # %__tmp.14 = load i32, ptr @i.0
      la      t1, i.0
      sw      t1, 204(sp)
      lw      t1, 204(sp)
      lw      t0, 0(t1)
      sw      t0, 208(sp)
      # %__tmp.15 = load i32, ptr @p.0
      la      t1, p.0
      sw      t1, 212(sp)
      lw      t1, 212(sp)
      lw      t0, 0(t1)
      sw      t0, 216(sp)
      # %__tmp.16 = load i32, ptr @k.0
      la      t1, k.0
      sw      t1, 220(sp)
      lw      t1, 220(sp)
      lw      t0, 0(t1)
      sw      t0, 224(sp)
      # %__tmp.17 = add i32 %__tmp.15, %__tmp.16
      lw      t1, 216(sp)
      lw      t2, 224(sp)
      add     t0, t1, t2
      sw      t0, 228(sp)
      # %__tmp.18 = icmp sle i32 %__tmp.14, %__tmp.17
      lw      t1, 208(sp)
      lw      t2, 228(sp)
      sub     t0, t1, t2
      sltz    t3, t0
      seqz    t1, t0
      or      t2, t3, t1
      mv      t0, t2
      sw      t0, 232(sp)
      # br i1 %__tmp.18, label %for.body0, label %for.merge0
      lw      t0, 232(sp)
      beqz     t0, main_jump1
      j       main_for.body0
main_jump1:
      j       main_for.merge0
main_for.body0:
      # %__tmp.19 = load i32, ptr @i.0
      la      t1, i.0
      sw      t1, 236(sp)
      lw      t1, 236(sp)
      lw      t0, 0(t1)
      sw      t0, 240(sp)
      # %__tmp.20 = icmp sle i32 1, %__tmp.19
      li      t1, 1
      lw      t2, 240(sp)
      sub     t0, t1, t2
      sltz    t3, t0
      seqz    t1, t0
      or      t2, t3, t1
      mv      t0, t2
      sw      t0, 244(sp)
      # br i1 %__tmp.20, label %if.then.1, label %if.else.1
      lw      t0, 244(sp)
      beqz     t0, main_jump2
      j       main_if.then.1
main_jump2:
      j       main_if.else.1
main_if.then.1:
      # %__tmp.21 = load i32, ptr @i.0
      la      t1, i.0
      sw      t1, 248(sp)
      lw      t1, 248(sp)
      lw      t0, 0(t1)
      sw      t0, 252(sp)
      # %__tmp.22 = load i32, ptr @n.0
      la      t1, n.0
      sw      t1, 256(sp)
      lw      t1, 256(sp)
      lw      t0, 0(t1)
      sw      t0, 260(sp)
      # %__tmp.23 = icmp sle i32 %__tmp.21, %__tmp.22
      lw      t1, 252(sp)
      lw      t2, 260(sp)
      sub     t0, t1, t2
      sltz    t3, t0
      seqz    t1, t0
      or      t2, t3, t1
      mv      t0, t2
      sw      t0, 264(sp)
      # br label %if.end.1
      lw      t1, 264(sp)
      mv      t0, t1
      j       main_if.end.1
main_if.else.1:
      # br label %if.end.1
      lw      t1, 244(sp)
      mv      t0, t1
      j       main_if.end.1
main_if.end.1:
      sw      t0, 268(sp)
      # br i1 %__tmp.24, label %if.then2, label %if.merge2
      lw      t0, 268(sp)
      beqz     t0, main_jump3
      j       main_if.then2
main_jump3:
      j       main_if.merge2
main_if.then2:
      # %__tmp.25 = load i32, ptr @i.0
      la      t1, i.0
      sw      t1, 272(sp)
      lw      t1, 272(sp)
      lw      t0, 0(t1)
      sw      t0, 276(sp)
      # %__tmp.26 = load i32, ptr @p.0
      la      t1, p.0
      sw      t1, 280(sp)
      lw      t1, 280(sp)
      lw      t0, 0(t1)
      sw      t0, 284(sp)
      # %__tmp.27 = icmp eq i32 %__tmp.25, %__tmp.26
      lw      t1, 276(sp)
      lw      t2, 284(sp)
      sub     t0, t1, t2
      seqz    t3, t0
      mv      t0, t3
      sw      t0, 288(sp)
      # br i1 %__tmp.27, label %if.then3, label %if.else3
      lw      t0, 288(sp)
      beqz     t0, main_jump4
      j       main_if.then3
main_jump4:
      j       main_if.else3
main_if.then3:
      # call void @print(ptr @_string.1)
      la      t0, _string.1
      sw      t0, 292(sp)
      lw      t0, 292(sp)
      mv      a0, t0
      sw      ra, 296(sp)
      sw      ra, 300(sp)
      sw      t0, 304(sp)
      sw      t1, 308(sp)
      sw      t2, 312(sp)
      sw      t3, 316(sp)
      call    print
      lw      ra, 296(sp)
      lw      t0, 300(sp)
      lw      t1, 304(sp)
      lw      t2, 308(sp)
      lw      t3, 312(sp)
      # %__tmp.29 = load i32, ptr @i.0
      la      t1, i.0
      sw      t1, 320(sp)
      lw      t1, 320(sp)
      lw      t0, 0(t1)
      sw      t0, 324(sp)
      # %__tmp.28 = call ptr @toString(i32 %__tmp.29)
      lw      t0, 324(sp)
      mv      a0, t0
      sw      ra, 328(sp)
      sw      ra, 332(sp)
      sw      t0, 336(sp)
      sw      t1, 340(sp)
      sw      t2, 344(sp)
      sw      t3, 348(sp)
      call    toString
      mv      t0, a0
      sw      t0, 352(sp)
      lw      ra, 328(sp)
      lw      t0, 332(sp)
      lw      t1, 336(sp)
      lw      t2, 340(sp)
      lw      t3, 344(sp)
      # call void @print(ptr %__tmp.28)
      lw      t0, 352(sp)
      mv      a0, t0
      sw      ra, 356(sp)
      sw      ra, 360(sp)
      sw      t0, 364(sp)
      sw      t1, 368(sp)
      sw      t2, 372(sp)
      sw      t3, 376(sp)
      call    print
      lw      ra, 356(sp)
      lw      t0, 360(sp)
      lw      t1, 364(sp)
      lw      t2, 368(sp)
      lw      t3, 372(sp)
      # call void @print(ptr @_string.2)
      la      t0, _string.2
      sw      t0, 380(sp)
      lw      t0, 380(sp)
      mv      a0, t0
      sw      ra, 384(sp)
      sw      ra, 388(sp)
      sw      t0, 392(sp)
      sw      t1, 396(sp)
      sw      t2, 400(sp)
      sw      t3, 404(sp)
      call    print
      lw      ra, 384(sp)
      lw      t0, 388(sp)
      lw      t1, 392(sp)
      lw      t2, 396(sp)
      lw      t3, 400(sp)
      # br label %if.merge3
      j       main_if.merge3
main_if.else3:
      # %__tmp.30 = load i32, ptr @i.0
      la      t1, i.0
      sw      t1, 408(sp)
      lw      t1, 408(sp)
      lw      t0, 0(t1)
      sw      t0, 412(sp)
      # call void @printInt(i32 %__tmp.30)
      lw      t0, 412(sp)
      mv      a0, t0
      sw      ra, 416(sp)
      sw      ra, 420(sp)
      sw      t0, 424(sp)
      sw      t1, 428(sp)
      sw      t2, 432(sp)
      sw      t3, 436(sp)
      call    printInt
      lw      ra, 416(sp)
      lw      t0, 420(sp)
      lw      t1, 424(sp)
      lw      t2, 428(sp)
      lw      t3, 432(sp)
      # call void @print(ptr @_string.3)
      la      t0, _string.3
      sw      t0, 440(sp)
      lw      t0, 440(sp)
      mv      a0, t0
      sw      ra, 444(sp)
      sw      ra, 448(sp)
      sw      t0, 452(sp)
      sw      t1, 456(sp)
      sw      t2, 460(sp)
      sw      t3, 464(sp)
      call    print
      lw      ra, 444(sp)
      lw      t0, 448(sp)
      lw      t1, 452(sp)
      lw      t2, 456(sp)
      lw      t3, 460(sp)
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
      sw      t1, 468(sp)
      lw      t1, 468(sp)
      lw      t0, 0(t1)
      sw      t0, 472(sp)
      # %__tmp.32 = add i32 %__tmp.31, 1
      li      t2, 1
      lw      t1, 472(sp)
      add     t0, t1, t2
      sw      t0, 476(sp)
      # store i32 %__tmp.32, ptr @i.0
      la      t1, i.0
      sw      t1, 480(sp)
      lw      t0, 476(sp)
      lw      t1, 480(sp)
      sw      t0, 0(t1)
      # br label %for.cond0
      j       main_for.cond0
main_for.merge0:
      # %__tmp.33 = load i32, ptr @p.0
      la      t1, p.0
      sw      t1, 484(sp)
      lw      t1, 484(sp)
      lw      t0, 0(t1)
      sw      t0, 488(sp)
      # %__tmp.34 = load i32, ptr @k.0
      la      t1, k.0
      sw      t1, 492(sp)
      lw      t1, 492(sp)
      lw      t0, 0(t1)
      sw      t0, 496(sp)
      # %__tmp.35 = add i32 %__tmp.33, %__tmp.34
      lw      t1, 488(sp)
      lw      t2, 496(sp)
      add     t0, t1, t2
      sw      t0, 500(sp)
      # %__tmp.36 = load i32, ptr @n.0
      la      t1, n.0
      sw      t1, 504(sp)
      lw      t1, 504(sp)
      lw      t0, 0(t1)
      sw      t0, 508(sp)
      # %__tmp.37 = icmp slt i32 %__tmp.35, %__tmp.36
      lw      t1, 500(sp)
      lw      t2, 508(sp)
      sub     t0, t1, t2
      sltz    t3, t0
      mv      t0, t3
      sw      t0, 512(sp)
      # br i1 %__tmp.37, label %if.then4, label %if.merge4
      lw      t0, 512(sp)
      beqz     t0, main_jump5
      j       main_if.then4
main_jump5:
      j       main_if.merge4
main_if.then4:
      # call void @print(ptr @_string.4)
      la      t0, _string.4
      sw      t0, 516(sp)
      lw      t0, 516(sp)
      mv      a0, t0
      sw      ra, 520(sp)
      sw      ra, 524(sp)
      sw      t0, 528(sp)
      sw      t1, 532(sp)
      sw      t2, 536(sp)
      sw      t3, 540(sp)
      call    print
      lw      ra, 520(sp)
      lw      t0, 524(sp)
      lw      t1, 528(sp)
      lw      t2, 532(sp)
      lw      t3, 536(sp)
      # br label %if.merge4
      j       main_if.merge4
main_if.merge4:
      # ret i32 0
      li      t0, 0
      mv      a0, t0
      addi    sp, sp, 544
      ret     
