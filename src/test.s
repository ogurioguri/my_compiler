      .section .rodata
      .globl _string.0
_string.0:
      .asciz  "\n"
      .section .text
      .globl main
main:
      addi    sp, sp, -424
main_entry:
      # %_a.0 = alloca i32
      addi    t0, sp, 4
      sw      t0, 0(sp)
      # store i32 10000, ptr %_a.0
      li      t0, 10000
      sw      t0, 8(sp)
      lw      t0, 8(sp)
      lw      t1, 0(sp)
      sw      t0, 0(t1)
      # %_b.0 = alloca i32
      addi    t0, sp, 16
      sw      t0, 12(sp)
      # store i32 0, ptr %_b.0
      li      t0, 0
      sw      t0, 20(sp)
      lw      t0, 20(sp)
      lw      t1, 12(sp)
      sw      t0, 0(t1)
      # %_c.0 = alloca i32
      addi    t0, sp, 28
      sw      t0, 24(sp)
      # store i32 2800, ptr %_c.0
      li      t0, 2800
      sw      t0, 32(sp)
      lw      t0, 32(sp)
      lw      t1, 24(sp)
      sw      t0, 0(t1)
      # %_d.0 = alloca i32
      addi    t0, sp, 40
      sw      t0, 36(sp)
      # store i32 0, ptr %_d.0
      li      t0, 0
      sw      t0, 44(sp)
      lw      t0, 44(sp)
      lw      t1, 36(sp)
      sw      t0, 0(t1)
      # %_e.0 = alloca i32
      addi    t0, sp, 52
      sw      t0, 48(sp)
      # store i32 0, ptr %_e.0
      li      t0, 0
      sw      t0, 56(sp)
      lw      t0, 56(sp)
      lw      t1, 48(sp)
      sw      t0, 0(t1)
      # %_f.0 = alloca ptr
      addi    t0, sp, 64
      sw      t0, 60(sp)
      # %__tmp.0 = call ptr @_malloc_array(i32 4, i32 2801)
      li      t0, 4
      sw      t0, 68(sp)
      lw      t0, 68(sp)
      mv      a0, t0
      li      t0, 2801
      sw      t0, 72(sp)
      lw      t0, 72(sp)
      mv      a1, t0
      sw      ra, 76(sp)
      call    _malloc_array
      mv      t0, a0
      sw      t0, 80(sp)
      lw      ra, 76(sp)
      # store ptr %__tmp.0, ptr %_f.0
      lw      t0, 80(sp)
      lw      t1, 60(sp)
      sw      t0, 0(t1)
      # %_g.0 = alloca i32
      addi    t0, sp, 88
      sw      t0, 84(sp)
      # store i32 0, ptr %_g.0
      li      t0, 0
      sw      t0, 92(sp)
      lw      t0, 92(sp)
      lw      t1, 84(sp)
      sw      t0, 0(t1)
      # br label %for.cond0
      j       main_for.cond0
main_for.cond0:
      # %__tmp.1 = load i32, ptr %_b.0
      lw      t1, 12(sp)
      lw      t0, 0(t1)
      sw      t0, 96(sp)
      # %__tmp.2 = load i32, ptr %_c.0
      lw      t1, 24(sp)
      lw      t0, 0(t1)
      sw      t0, 100(sp)
      # %__tmp.3 = sub i32 %__tmp.1, %__tmp.2
      lw      t1, 96(sp)
      lw      t2, 100(sp)
      sub     t0, t1, t2
      sw      t0, 104(sp)
      # %__tmp.4 = icmp ne i32 %__tmp.3, 0
      li      t2, 0
      sw      t2, 108(sp)
      lw      t1, 104(sp)
      lw      t2, 108(sp)
      sub     t0, t1, t2
      snez    t3, t0
      mv      t0, t3
      sw      t0, 112(sp)
      # br i1 %__tmp.4, label %for.body0, label %for.merge0
      lw      t0, 112(sp)
      beqz     t0, main_for.merge0
main_for.body0:
      # %__tmp.5 = load ptr, ptr %_f.0
      lw      t1, 60(sp)
      lw      t0, 0(t1)
      sw      t0, 116(sp)
      # %__tmp.6 = load i32, ptr %_b.0
      lw      t1, 12(sp)
      lw      t0, 0(t1)
      sw      t0, 120(sp)
      # %__tmp.7 = getelementptr i32, ptr %__tmp.5, i32 %__tmp.6
      lw      t0, 120(sp)
      li      t1, 4
      sw      t1, 124(sp)
      mul     t2, t0, t1
      lw      t0, 116(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 128(sp)
      # %__tmp.8 = load i32, ptr %__tmp.7
      lw      t1, 128(sp)
      lw      t0, 0(t1)
      sw      t0, 132(sp)
      # %__tmp.9 = load i32, ptr %_a.0
      lw      t1, 0(sp)
      lw      t0, 0(t1)
      sw      t0, 136(sp)
      # %__tmp.10 = sdiv i32 %__tmp.9, 5
      li      t2, 5
      sw      t2, 140(sp)
      lw      t1, 136(sp)
      lw      t2, 140(sp)
      div     t0, t1, t2
      sw      t0, 144(sp)
      # store i32 %__tmp.10, ptr %__tmp.7
      lw      t0, 144(sp)
      lw      t1, 128(sp)
      sw      t0, 0(t1)
      # br label %for.step0
      j       main_for.step0
main_for.step0:
      # %__tmp.11 = load i32, ptr %_b.0
      lw      t1, 12(sp)
      lw      t0, 0(t1)
      sw      t0, 148(sp)
      # %__tmp.12 = add i32 %__tmp.11, 1
      li      t2, 1
      sw      t2, 152(sp)
      lw      t1, 148(sp)
      lw      t2, 152(sp)
      add     t0, t1, t2
      sw      t0, 156(sp)
      # store i32 %__tmp.12, ptr %_b.0
      lw      t0, 156(sp)
      lw      t1, 12(sp)
      sw      t0, 0(t1)
      # br label %for.cond0
      j       main_for.cond0
main_for.merge0:
      # br label %for.cond1
      j       main_for.cond1
main_for.cond1:
      # br label %for.body1
      j       main_for.body1
main_for.body1:
      # %__tmp.13 = load i32, ptr %_d.0
      lw      t1, 36(sp)
      lw      t0, 0(t1)
      sw      t0, 160(sp)
      # store i32 0, ptr %_d.0
      li      t0, 0
      sw      t0, 164(sp)
      lw      t0, 164(sp)
      lw      t1, 36(sp)
      sw      t0, 0(t1)
      # %__tmp.14 = load i32, ptr %_g.0
      lw      t1, 84(sp)
      lw      t0, 0(t1)
      sw      t0, 168(sp)
      # %__tmp.15 = load i32, ptr %_c.0
      lw      t1, 24(sp)
      lw      t0, 0(t1)
      sw      t0, 172(sp)
      # %__tmp.16 = mul i32 %__tmp.15, 2
      li      t2, 2
      sw      t2, 176(sp)
      lw      t1, 172(sp)
      lw      t2, 176(sp)
      mul     t0, t1, t2
      sw      t0, 180(sp)
      # store i32 %__tmp.16, ptr %_g.0
      lw      t0, 180(sp)
      lw      t1, 84(sp)
      sw      t0, 0(t1)
      # %__tmp.17 = load i32, ptr %_g.0
      lw      t1, 84(sp)
      lw      t0, 0(t1)
      sw      t0, 184(sp)
      # %__tmp.18 = icmp eq i32 %__tmp.17, 0
      li      t2, 0
      sw      t2, 188(sp)
      lw      t1, 184(sp)
      lw      t2, 188(sp)
      sub     t0, t1, t2
      seqz    t3, t0
      mv      t0, t3
      sw      t0, 192(sp)
      # br i1 %__tmp.18, label %if.then0, label %if.merge0
      lw      t0, 192(sp)
      beqz     t0, main_if.merge0
main_if.then0:
      # br label %for.merge1
      j       main_for.merge1
      # br label %if.merge0
      j       main_if.merge0
main_if.merge0:
      # %__tmp.19 = load i32, ptr %_b.0
      lw      t1, 12(sp)
      lw      t0, 0(t1)
      sw      t0, 196(sp)
      # %__tmp.20 = load i32, ptr %_c.0
      lw      t1, 24(sp)
      lw      t0, 0(t1)
      sw      t0, 200(sp)
      # store i32 %__tmp.20, ptr %_b.0
      lw      t0, 200(sp)
      lw      t1, 12(sp)
      sw      t0, 0(t1)
      # br label %for.cond2
      j       main_for.cond2
main_for.cond2:
      # br label %for.body2
      j       main_for.body2
main_for.body2:
      # %__tmp.21 = load i32, ptr %_d.0
      lw      t1, 36(sp)
      lw      t0, 0(t1)
      sw      t0, 204(sp)
      # %__tmp.22 = load i32, ptr %_d.0
      lw      t1, 36(sp)
      lw      t0, 0(t1)
      sw      t0, 208(sp)
      # %__tmp.23 = load ptr, ptr %_f.0
      lw      t1, 60(sp)
      lw      t0, 0(t1)
      sw      t0, 212(sp)
      # %__tmp.24 = load i32, ptr %_b.0
      lw      t1, 12(sp)
      lw      t0, 0(t1)
      sw      t0, 216(sp)
      # %__tmp.25 = getelementptr i32, ptr %__tmp.23, i32 %__tmp.24
      lw      t0, 216(sp)
      li      t1, 4
      sw      t1, 220(sp)
      mul     t2, t0, t1
      lw      t0, 212(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 224(sp)
      # %__tmp.26 = load i32, ptr %__tmp.25
      lw      t1, 224(sp)
      lw      t0, 0(t1)
      sw      t0, 228(sp)
      # %__tmp.27 = load i32, ptr %_a.0
      lw      t1, 0(sp)
      lw      t0, 0(t1)
      sw      t0, 232(sp)
      # %__tmp.28 = mul i32 %__tmp.26, %__tmp.27
      lw      t1, 228(sp)
      lw      t2, 232(sp)
      mul     t0, t1, t2
      sw      t0, 236(sp)
      # %__tmp.29 = add i32 %__tmp.22, %__tmp.28
      lw      t1, 208(sp)
      lw      t2, 236(sp)
      add     t0, t1, t2
      sw      t0, 240(sp)
      # store i32 %__tmp.29, ptr %_d.0
      lw      t0, 240(sp)
      lw      t1, 36(sp)
      sw      t0, 0(t1)
      # %__tmp.30 = load ptr, ptr %_f.0
      lw      t1, 60(sp)
      lw      t0, 0(t1)
      sw      t0, 244(sp)
      # %__tmp.31 = load i32, ptr %_b.0
      lw      t1, 12(sp)
      lw      t0, 0(t1)
      sw      t0, 248(sp)
      # %__tmp.32 = getelementptr i32, ptr %__tmp.30, i32 %__tmp.31
      lw      t0, 248(sp)
      li      t1, 4
      sw      t1, 252(sp)
      mul     t2, t0, t1
      lw      t0, 244(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 256(sp)
      # %__tmp.33 = load i32, ptr %__tmp.32
      lw      t1, 256(sp)
      lw      t0, 0(t1)
      sw      t0, 260(sp)
      # %__tmp.34 = load i32, ptr %_d.0
      lw      t1, 36(sp)
      lw      t0, 0(t1)
      sw      t0, 264(sp)
      # %__tmp.35 = load i32, ptr %_g.0
      lw      t1, 84(sp)
      lw      t0, 0(t1)
      sw      t0, 268(sp)
      # %__tmp.36 = sub i32 %__tmp.35, 1
      li      t2, 1
      sw      t2, 272(sp)
      lw      t1, 268(sp)
      lw      t2, 272(sp)
      sub     t0, t1, t2
      sw      t0, 276(sp)
      # store i32 %__tmp.36, ptr %_g.0
      lw      t0, 276(sp)
      lw      t1, 84(sp)
      sw      t0, 0(t1)
      # %__tmp.37 = srem i32 %__tmp.34, %__tmp.36
      lw      t1, 264(sp)
      lw      t2, 276(sp)
      rem     t0, t1, t2
      sw      t0, 280(sp)
      # store i32 %__tmp.37, ptr %__tmp.32
      lw      t0, 280(sp)
      lw      t1, 256(sp)
      sw      t0, 0(t1)
      # %__tmp.38 = load i32, ptr %_d.0
      lw      t1, 36(sp)
      lw      t0, 0(t1)
      sw      t0, 284(sp)
      # %__tmp.39 = load i32, ptr %_d.0
      lw      t1, 36(sp)
      lw      t0, 0(t1)
      sw      t0, 288(sp)
      # %__tmp.40 = load i32, ptr %_g.0
      lw      t1, 84(sp)
      lw      t0, 0(t1)
      sw      t0, 292(sp)
      # %__tmp.41 = sdiv i32 %__tmp.39, %__tmp.40
      lw      t1, 288(sp)
      lw      t2, 292(sp)
      div     t0, t1, t2
      sw      t0, 296(sp)
      # store i32 %__tmp.41, ptr %_d.0
      lw      t0, 296(sp)
      lw      t1, 36(sp)
      sw      t0, 0(t1)
      # %__tmp.42 = load i32, ptr %_g.0
      lw      t1, 84(sp)
      lw      t0, 0(t1)
      sw      t0, 300(sp)
      # %__tmp.43 = sub i32 %__tmp.42, 1
      li      t2, 1
      sw      t2, 304(sp)
      lw      t1, 300(sp)
      lw      t2, 304(sp)
      sub     t0, t1, t2
      sw      t0, 308(sp)
      # store i32 %__tmp.43, ptr %_g.0
      lw      t0, 308(sp)
      lw      t1, 84(sp)
      sw      t0, 0(t1)
      # %__tmp.44 = load i32, ptr %_b.0
      lw      t1, 12(sp)
      lw      t0, 0(t1)
      sw      t0, 312(sp)
      # %__tmp.45 = sub i32 %__tmp.44, 1
      li      t2, 1
      sw      t2, 316(sp)
      lw      t1, 312(sp)
      lw      t2, 316(sp)
      sub     t0, t1, t2
      sw      t0, 320(sp)
      # store i32 %__tmp.45, ptr %_b.0
      lw      t0, 320(sp)
      lw      t1, 12(sp)
      sw      t0, 0(t1)
      # %__tmp.46 = icmp eq i32 %__tmp.45, 0
      li      t2, 0
      sw      t2, 324(sp)
      lw      t1, 320(sp)
      lw      t2, 324(sp)
      sub     t0, t1, t2
      seqz    t3, t0
      mv      t0, t3
      sw      t0, 328(sp)
      # br i1 %__tmp.46, label %if.then1, label %if.merge1
      lw      t0, 328(sp)
      beqz     t0, main_if.merge1
main_if.then1:
      # br label %for.merge2
      j       main_for.merge2
      # br label %if.merge1
      j       main_if.merge1
main_if.merge1:
      # br label %for.step2
      j       main_for.step2
main_for.step2:
      # %__tmp.47 = load i32, ptr %_d.0
      lw      t1, 36(sp)
      lw      t0, 0(t1)
      sw      t0, 332(sp)
      # %__tmp.48 = load i32, ptr %_d.0
      lw      t1, 36(sp)
      lw      t0, 0(t1)
      sw      t0, 336(sp)
      # %__tmp.49 = load i32, ptr %_b.0
      lw      t1, 12(sp)
      lw      t0, 0(t1)
      sw      t0, 340(sp)
      # %__tmp.50 = mul i32 %__tmp.48, %__tmp.49
      lw      t1, 336(sp)
      lw      t2, 340(sp)
      mul     t0, t1, t2
      sw      t0, 344(sp)
      # store i32 %__tmp.50, ptr %_d.0
      lw      t0, 344(sp)
      lw      t1, 36(sp)
      sw      t0, 0(t1)
      # br label %for.cond2
      j       main_for.cond2
main_for.merge2:
      # %__tmp.51 = load i32, ptr %_c.0
      lw      t1, 24(sp)
      lw      t0, 0(t1)
      sw      t0, 348(sp)
      # %__tmp.52 = load i32, ptr %_c.0
      lw      t1, 24(sp)
      lw      t0, 0(t1)
      sw      t0, 352(sp)
      # %__tmp.53 = sub i32 %__tmp.52, 14
      li      t2, 14
      sw      t2, 356(sp)
      lw      t1, 352(sp)
      lw      t2, 356(sp)
      sub     t0, t1, t2
      sw      t0, 360(sp)
      # store i32 %__tmp.53, ptr %_c.0
      lw      t0, 360(sp)
      lw      t1, 24(sp)
      sw      t0, 0(t1)
      # %__tmp.55 = load i32, ptr %_e.0
      lw      t1, 48(sp)
      lw      t0, 0(t1)
      sw      t0, 364(sp)
      # %__tmp.56 = load i32, ptr %_d.0
      lw      t1, 36(sp)
      lw      t0, 0(t1)
      sw      t0, 368(sp)
      # %__tmp.57 = load i32, ptr %_a.0
      lw      t1, 0(sp)
      lw      t0, 0(t1)
      sw      t0, 372(sp)
      # %__tmp.58 = sdiv i32 %__tmp.56, %__tmp.57
      lw      t1, 368(sp)
      lw      t2, 372(sp)
      div     t0, t1, t2
      sw      t0, 376(sp)
      # %__tmp.59 = add i32 %__tmp.55, %__tmp.58
      lw      t1, 364(sp)
      lw      t2, 376(sp)
      add     t0, t1, t2
      sw      t0, 380(sp)
      # %__tmp.54 = call ptr @toString(i32 %__tmp.59)
      lw      t0, 380(sp)
      mv      a0, t0
      sw      ra, 384(sp)
      call    toString
      mv      t0, a0
      sw      t0, 388(sp)
      lw      ra, 384(sp)
      # call void @print(ptr %__tmp.54)
      lw      t0, 388(sp)
      mv      a0, t0
      sw      ra, 392(sp)
      call    print
      lw      ra, 392(sp)
      # br label %for.step1
      j       main_for.step1
main_for.step1:
      # %__tmp.60 = load i32, ptr %_e.0
      lw      t1, 48(sp)
      lw      t0, 0(t1)
      sw      t0, 396(sp)
      # %__tmp.61 = load i32, ptr %_d.0
      lw      t1, 36(sp)
      lw      t0, 0(t1)
      sw      t0, 400(sp)
      # %__tmp.62 = load i32, ptr %_a.0
      lw      t1, 0(sp)
      lw      t0, 0(t1)
      sw      t0, 404(sp)
      # %__tmp.63 = srem i32 %__tmp.61, %__tmp.62
      lw      t1, 400(sp)
      lw      t2, 404(sp)
      rem     t0, t1, t2
      sw      t0, 408(sp)
      # store i32 %__tmp.63, ptr %_e.0
      lw      t0, 408(sp)
      lw      t1, 48(sp)
      sw      t0, 0(t1)
      # br label %for.cond1
      j       main_for.cond1
main_for.merge1:
      # call void @print(ptr @_string.0)
      la      t0, _string.0
      sw      t0, 412(sp)
      lw      t0, 412(sp)
      mv      a0, t0
      sw      ra, 416(sp)
      call    print
      lw      ra, 416(sp)
      # ret i32 0
      li      t0, 0
      sw      t0, 420(sp)
      lw      t0, 420(sp)
      mv      a0, t0
      addi    sp, sp, 424
      ret     
