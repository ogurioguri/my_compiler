      .section .text
      .globl main
main:
      addi    sp, sp, -596
main_entry:
      # %_a.0 = alloca ptr
      addi    t0, sp, 4
      sw      t0, 0(sp)
      # %__tmp.0 = call ptr @_malloc_array(i32 4, i32 100)
      li      t0, 4
      sw      t0, 8(sp)
      lw      t0, 8(sp)
      mv      a0, t0
      li      t0, 100
      sw      t0, 12(sp)
      lw      t0, 12(sp)
      mv      a1, t0
      sw      ra, 16(sp)
      call    _malloc_array
      mv      t0, a0
      sw      t0, 20(sp)
      lw      ra, 16(sp)
      # store ptr %__tmp.0, ptr %_a.0
      lw      t0, 20(sp)
      lw      t1, 0(sp)
      sw      t0, 0(t1)
      # %_i.0 = alloca i32
      addi    t0, sp, 28
      sw      t0, 24(sp)
      # %_j.0 = alloca i32
      addi    t0, sp, 36
      sw      t0, 32(sp)
      # %__tmp.1 = load i32, ptr %_i.0
      lw      t1, 24(sp)
      lw      t0, 0(t1)
      sw      t0, 40(sp)
      # store i32 0, ptr %_i.0
      li      t0, 0
      sw      t0, 44(sp)
      lw      t0, 44(sp)
      lw      t1, 24(sp)
      sw      t0, 0(t1)
      # br label %for.cond0
      j       main_for.cond0
main_for.cond0:
      # %__tmp.2 = load i32, ptr %_i.0
      lw      t1, 24(sp)
      lw      t0, 0(t1)
      sw      t0, 48(sp)
      # %__tmp.3 = icmp slt i32 %__tmp.2, 100
      li      t2, 100
      sw      t2, 52(sp)
      lw      t1, 48(sp)
      lw      t2, 52(sp)
      sub     t0, t1, t2
      sltz    t3, t0
      mv      t0, t3
      sw      t0, 56(sp)
      lw      t0, 56(sp)
      # br i1 %__tmp.3, label %for.body0, label %for.merge0
      beqz     t0, main_for.merge0
main_for.body0:
      # %__tmp.4 = load ptr, ptr %_a.0
      lw      t1, 0(sp)
      lw      t0, 0(t1)
      sw      t0, 60(sp)
      # %__tmp.5 = load i32, ptr %_i.0
      lw      t1, 24(sp)
      lw      t0, 0(t1)
      sw      t0, 64(sp)
      # %__tmp.6 = getelementptr ptr, ptr %__tmp.4, i32 %__tmp.5
      lw      t0, 60(sp)
      li      t1, 4
      sw      t1, 68(sp)
      mul     t2, t0, t1
      lw      t0, 64(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 72(sp)
      # %__tmp.7 = load ptr, ptr %__tmp.6
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      sw      t0, 76(sp)
      # %__tmp.8 = call ptr @_malloc_array(i32 4, i32 100)
      li      t0, 4
      sw      t0, 80(sp)
      lw      t0, 80(sp)
      mv      a0, t0
      li      t0, 100
      sw      t0, 84(sp)
      lw      t0, 84(sp)
      mv      a1, t0
      sw      ra, 88(sp)
      call    _malloc_array
      mv      t0, a0
      sw      t0, 92(sp)
      lw      ra, 88(sp)
      # store ptr %__tmp.8, ptr %__tmp.6
      lw      t0, 92(sp)
      lw      t1, 72(sp)
      sw      t0, 0(t1)
      # br label %for.step0
      j       main_for.step0
main_for.step0:
      # %__tmp.9 = load i32, ptr %_i.0
      lw      t1, 24(sp)
      lw      t0, 0(t1)
      sw      t0, 96(sp)
      # %__tmp.10 = add i32 %__tmp.9, 1
      li      t2, 1
      sw      t2, 100(sp)
      lw      t1, 96(sp)
      lw      t2, 100(sp)
      add     t0, t1, t2
      sw      t0, 104(sp)
      # store i32 %__tmp.10, ptr %_i.0
      lw      t0, 104(sp)
      lw      t1, 24(sp)
      sw      t0, 0(t1)
      # br label %for.cond0
      j       main_for.cond0
main_for.merge0:
      # %_sum.0 = alloca i32
      addi    t0, sp, 112
      sw      t0, 108(sp)
      # store i32 0, ptr %_sum.0
      li      t0, 0
      sw      t0, 116(sp)
      lw      t0, 116(sp)
      lw      t1, 108(sp)
      sw      t0, 0(t1)
      # %__tmp.11 = load i32, ptr %_i.0
      lw      t1, 24(sp)
      lw      t0, 0(t1)
      sw      t0, 120(sp)
      # store i32 0, ptr %_i.0
      li      t0, 0
      sw      t0, 124(sp)
      lw      t0, 124(sp)
      lw      t1, 24(sp)
      sw      t0, 0(t1)
      # br label %for.cond1
      j       main_for.cond1
main_for.cond1:
      # %__tmp.12 = load i32, ptr %_i.0
      lw      t1, 24(sp)
      lw      t0, 0(t1)
      sw      t0, 128(sp)
      # %__tmp.13 = icmp slt i32 %__tmp.12, 100
      li      t2, 100
      sw      t2, 132(sp)
      lw      t1, 128(sp)
      lw      t2, 132(sp)
      sub     t0, t1, t2
      sltz    t3, t0
      mv      t0, t3
      sw      t0, 136(sp)
      lw      t0, 136(sp)
      # br i1 %__tmp.13, label %for.body1, label %for.merge1
      beqz     t0, main_for.merge1
main_for.body1:
      # %__tmp.14 = load i32, ptr %_j.0
      lw      t1, 32(sp)
      lw      t0, 0(t1)
      sw      t0, 140(sp)
      # store i32 0, ptr %_j.0
      li      t0, 0
      sw      t0, 144(sp)
      lw      t0, 144(sp)
      lw      t1, 32(sp)
      sw      t0, 0(t1)
      # br label %for.cond2
      j       main_for.cond2
main_for.cond2:
      # %__tmp.15 = load i32, ptr %_j.0
      lw      t1, 32(sp)
      lw      t0, 0(t1)
      sw      t0, 148(sp)
      # %__tmp.16 = icmp slt i32 %__tmp.15, 100
      li      t2, 100
      sw      t2, 152(sp)
      lw      t1, 148(sp)
      lw      t2, 152(sp)
      sub     t0, t1, t2
      sltz    t3, t0
      mv      t0, t3
      sw      t0, 156(sp)
      lw      t0, 156(sp)
      # br i1 %__tmp.16, label %for.body2, label %for.merge2
      beqz     t0, main_for.merge2
main_for.body2:
      # %__tmp.17 = load ptr, ptr %_a.0
      lw      t1, 0(sp)
      lw      t0, 0(t1)
      sw      t0, 160(sp)
      # %__tmp.18 = load i32, ptr %_i.0
      lw      t1, 24(sp)
      lw      t0, 0(t1)
      sw      t0, 164(sp)
      # %__tmp.19 = getelementptr ptr, ptr %__tmp.17, i32 %__tmp.18
      lw      t0, 160(sp)
      li      t1, 4
      sw      t1, 168(sp)
      mul     t2, t0, t1
      lw      t0, 164(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 172(sp)
      # %__tmp.20 = load ptr, ptr %__tmp.19
      lw      t1, 172(sp)
      lw      t0, 0(t1)
      sw      t0, 176(sp)
      # %__tmp.21 = load i32, ptr %_j.0
      lw      t1, 32(sp)
      lw      t0, 0(t1)
      sw      t0, 180(sp)
      # %__tmp.22 = getelementptr i32, ptr %__tmp.20, i32 %__tmp.21
      lw      t0, 176(sp)
      li      t1, 4
      sw      t1, 184(sp)
      mul     t2, t0, t1
      lw      t0, 180(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 188(sp)
      # %__tmp.23 = load i32, ptr %__tmp.22
      lw      t1, 188(sp)
      lw      t0, 0(t1)
      sw      t0, 192(sp)
      # store i32 0, ptr %__tmp.22
      li      t0, 0
      sw      t0, 196(sp)
      lw      t0, 196(sp)
      lw      t1, 188(sp)
      sw      t0, 0(t1)
      # br label %for.step2
      j       main_for.step2
main_for.step2:
      # %__tmp.24 = load i32, ptr %_j.0
      lw      t1, 32(sp)
      lw      t0, 0(t1)
      sw      t0, 200(sp)
      # %__tmp.25 = add i32 %__tmp.24, 1
      li      t2, 1
      sw      t2, 204(sp)
      lw      t1, 200(sp)
      lw      t2, 204(sp)
      add     t0, t1, t2
      sw      t0, 208(sp)
      # store i32 %__tmp.25, ptr %_j.0
      lw      t0, 208(sp)
      lw      t1, 32(sp)
      sw      t0, 0(t1)
      # br label %for.cond2
      j       main_for.cond2
main_for.merge2:
      # br label %for.step1
      j       main_for.step1
main_for.step1:
      # %__tmp.26 = load i32, ptr %_i.0
      lw      t1, 24(sp)
      lw      t0, 0(t1)
      sw      t0, 212(sp)
      # %__tmp.27 = add i32 %__tmp.26, 1
      li      t2, 1
      sw      t2, 216(sp)
      lw      t1, 212(sp)
      lw      t2, 216(sp)
      add     t0, t1, t2
      sw      t0, 220(sp)
      # store i32 %__tmp.27, ptr %_i.0
      lw      t0, 220(sp)
      lw      t1, 24(sp)
      sw      t0, 0(t1)
      # br label %for.cond1
      j       main_for.cond1
main_for.merge1:
      # %_quotient.0 = alloca i32
      addi    t0, sp, 228
      sw      t0, 224(sp)
      # %_remainder.0 = alloca i32
      addi    t0, sp, 236
      sw      t0, 232(sp)
      # %__tmp.28 = load i32, ptr %_i.0
      lw      t1, 24(sp)
      lw      t0, 0(t1)
      sw      t0, 240(sp)
      # store i32 0, ptr %_i.0
      li      t0, 0
      sw      t0, 244(sp)
      lw      t0, 244(sp)
      lw      t1, 24(sp)
      sw      t0, 0(t1)
      # br label %for.cond3
      j       main_for.cond3
main_for.cond3:
      # %__tmp.29 = load i32, ptr %_i.0
      lw      t1, 24(sp)
      lw      t0, 0(t1)
      sw      t0, 248(sp)
      # %__tmp.30 = icmp slt i32 %__tmp.29, 100
      li      t2, 100
      sw      t2, 252(sp)
      lw      t1, 248(sp)
      lw      t2, 252(sp)
      sub     t0, t1, t2
      sltz    t3, t0
      mv      t0, t3
      sw      t0, 256(sp)
      lw      t0, 256(sp)
      # br i1 %__tmp.30, label %for.body3, label %for.merge3
      beqz     t0, main_for.merge3
main_for.body3:
      # %__tmp.31 = load i32, ptr %_i.0
      lw      t1, 24(sp)
      lw      t0, 0(t1)
      sw      t0, 260(sp)
      # %__tmp.32 = icmp sgt i32 %__tmp.31, 20
      li      t2, 20
      sw      t2, 264(sp)
      lw      t1, 260(sp)
      lw      t2, 264(sp)
      sub     t0, t1, t2
      sgtz    t3, t0
      mv      t0, t3
      sw      t0, 268(sp)
      lw      t0, 268(sp)
      # br i1 %__tmp.32, label %if.then.0, label %if.else.0
      beqz     t0, main_if.else.0
main_if.then.0:
      # %__tmp.33 = load i32, ptr %_i.0
      lw      t1, 24(sp)
      lw      t0, 0(t1)
      sw      t0, 272(sp)
      # %__tmp.34 = icmp slt i32 %__tmp.33, 80
      li      t2, 80
      sw      t2, 276(sp)
      lw      t1, 272(sp)
      lw      t2, 276(sp)
      sub     t0, t1, t2
      sltz    t3, t0
      mv      t0, t3
      sw      t0, 280(sp)
      # br label %if.end.0
      mv      t0, t1
      j       main_if.end.0
main_if.else.0:
      # br label %if.end.0
      mv      t0, t1
      j       main_if.end.0
main_if.end.0:
      sw      t0, 284(sp)
      lw      t0, 284(sp)
      # br i1 %__tmp.35, label %if.then1, label %if.merge1
      beqz     t0, main_if.merge1
main_if.then1:
      # %__tmp.36 = load i32, ptr %_j.0
      lw      t1, 32(sp)
      lw      t0, 0(t1)
      sw      t0, 288(sp)
      # store i32 0, ptr %_j.0
      li      t0, 0
      sw      t0, 292(sp)
      lw      t0, 292(sp)
      lw      t1, 32(sp)
      sw      t0, 0(t1)
      # br label %for.cond4
      j       main_for.cond4
main_for.cond4:
      # %__tmp.37 = load i32, ptr %_j.0
      lw      t1, 32(sp)
      lw      t0, 0(t1)
      sw      t0, 296(sp)
      # %__tmp.38 = icmp slt i32 %__tmp.37, 100
      li      t2, 100
      sw      t2, 300(sp)
      lw      t1, 296(sp)
      lw      t2, 300(sp)
      sub     t0, t1, t2
      sltz    t3, t0
      mv      t0, t3
      sw      t0, 304(sp)
      lw      t0, 304(sp)
      # br i1 %__tmp.38, label %for.body4, label %for.merge4
      beqz     t0, main_for.merge4
main_for.body4:
      # %__tmp.39 = load i32, ptr %_j.0
      lw      t1, 32(sp)
      lw      t0, 0(t1)
      sw      t0, 308(sp)
      # %__tmp.40 = icmp sgt i32 %__tmp.39, 5
      li      t2, 5
      sw      t2, 312(sp)
      lw      t1, 308(sp)
      lw      t2, 312(sp)
      sub     t0, t1, t2
      sgtz    t3, t0
      mv      t0, t3
      sw      t0, 316(sp)
      lw      t0, 316(sp)
      # br i1 %__tmp.40, label %if.then.2, label %if.else.2
      beqz     t0, main_if.else.2
main_if.then.2:
      # br label %if.end.2
      mv      t0, t1
      j       main_if.end.2
main_if.else.2:
      # %__tmp.41 = load i32, ptr %_i.0
      lw      t1, 24(sp)
      lw      t0, 0(t1)
      sw      t0, 320(sp)
      # %__tmp.42 = icmp slt i32 %__tmp.41, 90
      li      t2, 90
      sw      t2, 324(sp)
      lw      t1, 320(sp)
      lw      t2, 324(sp)
      sub     t0, t1, t2
      sltz    t3, t0
      mv      t0, t3
      sw      t0, 328(sp)
      # br label %if.end.2
      mv      t0, t1
      j       main_if.end.2
main_if.end.2:
      sw      t0, 332(sp)
      lw      t0, 332(sp)
      # br i1 %__tmp.43, label %if.then3, label %if.merge3
      beqz     t0, main_if.merge3
main_if.then3:
      # %__tmp.44 = load i32, ptr %_quotient.0
      lw      t1, 224(sp)
      lw      t0, 0(t1)
      sw      t0, 336(sp)
      # %__tmp.45 = load i32, ptr %_j.0
      lw      t1, 32(sp)
      lw      t0, 0(t1)
      sw      t0, 340(sp)
      # %__tmp.46 = mul i32 %__tmp.45, 4
      li      t2, 4
      sw      t2, 344(sp)
      lw      t1, 340(sp)
      lw      t2, 344(sp)
      mul     t0, t1, t2
      sw      t0, 348(sp)
      # %__tmp.47 = sdiv i32 %__tmp.46, 100
      li      t2, 100
      sw      t2, 352(sp)
      lw      t1, 348(sp)
      lw      t2, 352(sp)
      div     t0, t1, t2
      sw      t0, 356(sp)
      # store i32 %__tmp.47, ptr %_quotient.0
      lw      t0, 356(sp)
      lw      t1, 224(sp)
      sw      t0, 0(t1)
      # %__tmp.48 = load i32, ptr %_remainder.0
      lw      t1, 232(sp)
      lw      t0, 0(t1)
      sw      t0, 360(sp)
      # %__tmp.49 = load i32, ptr %_j.0
      lw      t1, 32(sp)
      lw      t0, 0(t1)
      sw      t0, 364(sp)
      # %__tmp.50 = mul i32 %__tmp.49, 4
      li      t2, 4
      sw      t2, 368(sp)
      lw      t1, 364(sp)
      lw      t2, 368(sp)
      mul     t0, t1, t2
      sw      t0, 372(sp)
      # %__tmp.51 = srem i32 %__tmp.50, 100
      li      t2, 100
      sw      t2, 376(sp)
      lw      t1, 372(sp)
      lw      t2, 376(sp)
      rem     t0, t1, t2
      sw      t0, 380(sp)
      # store i32 %__tmp.51, ptr %_remainder.0
      lw      t0, 380(sp)
      lw      t1, 232(sp)
      sw      t0, 0(t1)
      # %__tmp.52 = load ptr, ptr %_a.0
      lw      t1, 0(sp)
      lw      t0, 0(t1)
      sw      t0, 384(sp)
      # %__tmp.53 = load i32, ptr %_i.0
      lw      t1, 24(sp)
      lw      t0, 0(t1)
      sw      t0, 388(sp)
      # %__tmp.54 = load i32, ptr %_quotient.0
      lw      t1, 224(sp)
      lw      t0, 0(t1)
      sw      t0, 392(sp)
      # %__tmp.55 = add i32 %__tmp.53, %__tmp.54
      lw      t1, 388(sp)
      lw      t2, 392(sp)
      add     t0, t1, t2
      sw      t0, 396(sp)
      # %__tmp.56 = getelementptr ptr, ptr %__tmp.52, i32 %__tmp.55
      lw      t0, 384(sp)
      li      t1, 4
      sw      t1, 400(sp)
      mul     t2, t0, t1
      lw      t0, 396(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 404(sp)
      # %__tmp.57 = load ptr, ptr %__tmp.56
      lw      t1, 404(sp)
      lw      t0, 0(t1)
      sw      t0, 408(sp)
      # %__tmp.58 = load i32, ptr %_remainder.0
      lw      t1, 232(sp)
      lw      t0, 0(t1)
      sw      t0, 412(sp)
      # %__tmp.59 = getelementptr i32, ptr %__tmp.57, i32 %__tmp.58
      lw      t0, 408(sp)
      li      t1, 4
      sw      t1, 416(sp)
      mul     t2, t0, t1
      lw      t0, 412(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 420(sp)
      # %__tmp.60 = load i32, ptr %__tmp.59
      lw      t1, 420(sp)
      lw      t0, 0(t1)
      sw      t0, 424(sp)
      # %__tmp.61 = load i32, ptr %_j.0
      lw      t1, 32(sp)
      lw      t0, 0(t1)
      sw      t0, 428(sp)
      # %__tmp.62 = add i32 %__tmp.61, 50
      li      t2, 50
      sw      t2, 432(sp)
      lw      t1, 428(sp)
      lw      t2, 432(sp)
      add     t0, t1, t2
      sw      t0, 436(sp)
      # store i32 %__tmp.62, ptr %__tmp.59
      lw      t0, 436(sp)
      lw      t1, 420(sp)
      sw      t0, 0(t1)
      # br label %if.merge3
      j       main_if.merge3
main_if.merge3:
      # br label %for.step4
      j       main_for.step4
main_for.step4:
      # %__tmp.63 = load i32, ptr %_j.0
      lw      t1, 32(sp)
      lw      t0, 0(t1)
      sw      t0, 440(sp)
      # %__tmp.64 = add i32 %__tmp.63, 1
      li      t2, 1
      sw      t2, 444(sp)
      lw      t1, 440(sp)
      lw      t2, 444(sp)
      add     t0, t1, t2
      sw      t0, 448(sp)
      # store i32 %__tmp.64, ptr %_j.0
      lw      t0, 448(sp)
      lw      t1, 32(sp)
      sw      t0, 0(t1)
      # br label %for.cond4
      j       main_for.cond4
main_for.merge4:
      # br label %if.merge1
      j       main_if.merge1
main_if.merge1:
      # br label %for.step3
      j       main_for.step3
main_for.step3:
      # %__tmp.65 = load i32, ptr %_i.0
      lw      t1, 24(sp)
      lw      t0, 0(t1)
      sw      t0, 452(sp)
      # %__tmp.66 = add i32 %__tmp.65, 1
      li      t2, 1
      sw      t2, 456(sp)
      lw      t1, 452(sp)
      lw      t2, 456(sp)
      add     t0, t1, t2
      sw      t0, 460(sp)
      # store i32 %__tmp.66, ptr %_i.0
      lw      t0, 460(sp)
      lw      t1, 24(sp)
      sw      t0, 0(t1)
      # br label %for.cond3
      j       main_for.cond3
main_for.merge3:
      # %__tmp.67 = load i32, ptr %_i.0
      lw      t1, 24(sp)
      lw      t0, 0(t1)
      sw      t0, 464(sp)
      # store i32 0, ptr %_i.0
      li      t0, 0
      sw      t0, 468(sp)
      lw      t0, 468(sp)
      lw      t1, 24(sp)
      sw      t0, 0(t1)
      # br label %for.cond5
      j       main_for.cond5
main_for.cond5:
      # %__tmp.68 = load i32, ptr %_i.0
      lw      t1, 24(sp)
      lw      t0, 0(t1)
      sw      t0, 472(sp)
      # %__tmp.69 = icmp slt i32 %__tmp.68, 100
      li      t2, 100
      sw      t2, 476(sp)
      lw      t1, 472(sp)
      lw      t2, 476(sp)
      sub     t0, t1, t2
      sltz    t3, t0
      mv      t0, t3
      sw      t0, 480(sp)
      lw      t0, 480(sp)
      # br i1 %__tmp.69, label %for.body5, label %for.merge5
      beqz     t0, main_for.merge5
main_for.body5:
      # %__tmp.70 = load i32, ptr %_j.0
      lw      t1, 32(sp)
      lw      t0, 0(t1)
      sw      t0, 484(sp)
      # store i32 0, ptr %_j.0
      li      t0, 0
      sw      t0, 488(sp)
      lw      t0, 488(sp)
      lw      t1, 32(sp)
      sw      t0, 0(t1)
      # br label %for.cond6
      j       main_for.cond6
main_for.cond6:
      # %__tmp.71 = load i32, ptr %_j.0
      lw      t1, 32(sp)
      lw      t0, 0(t1)
      sw      t0, 492(sp)
      # %__tmp.72 = icmp slt i32 %__tmp.71, 100
      li      t2, 100
      sw      t2, 496(sp)
      lw      t1, 492(sp)
      lw      t2, 496(sp)
      sub     t0, t1, t2
      sltz    t3, t0
      mv      t0, t3
      sw      t0, 500(sp)
      lw      t0, 500(sp)
      # br i1 %__tmp.72, label %for.body6, label %for.merge6
      beqz     t0, main_for.merge6
main_for.body6:
      # %__tmp.73 = load i32, ptr %_sum.0
      lw      t1, 108(sp)
      lw      t0, 0(t1)
      sw      t0, 504(sp)
      # %__tmp.74 = load i32, ptr %_sum.0
      lw      t1, 108(sp)
      lw      t0, 0(t1)
      sw      t0, 508(sp)
      # %__tmp.75 = load ptr, ptr %_a.0
      lw      t1, 0(sp)
      lw      t0, 0(t1)
      sw      t0, 512(sp)
      # %__tmp.76 = load i32, ptr %_i.0
      lw      t1, 24(sp)
      lw      t0, 0(t1)
      sw      t0, 516(sp)
      # %__tmp.77 = getelementptr ptr, ptr %__tmp.75, i32 %__tmp.76
      lw      t0, 512(sp)
      li      t1, 4
      sw      t1, 520(sp)
      mul     t2, t0, t1
      lw      t0, 516(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 524(sp)
      # %__tmp.78 = load ptr, ptr %__tmp.77
      lw      t1, 524(sp)
      lw      t0, 0(t1)
      sw      t0, 528(sp)
      # %__tmp.79 = load i32, ptr %_j.0
      lw      t1, 32(sp)
      lw      t0, 0(t1)
      sw      t0, 532(sp)
      # %__tmp.80 = getelementptr i32, ptr %__tmp.78, i32 %__tmp.79
      lw      t0, 528(sp)
      li      t1, 4
      sw      t1, 536(sp)
      mul     t2, t0, t1
      lw      t0, 532(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 540(sp)
      # %__tmp.81 = load i32, ptr %__tmp.80
      lw      t1, 540(sp)
      lw      t0, 0(t1)
      sw      t0, 544(sp)
      # %__tmp.82 = add i32 %__tmp.74, %__tmp.81
      lw      t1, 508(sp)
      lw      t2, 544(sp)
      add     t0, t1, t2
      sw      t0, 548(sp)
      # store i32 %__tmp.82, ptr %_sum.0
      lw      t0, 548(sp)
      lw      t1, 108(sp)
      sw      t0, 0(t1)
      # br label %for.step6
      j       main_for.step6
main_for.step6:
      # %__tmp.83 = load i32, ptr %_j.0
      lw      t1, 32(sp)
      lw      t0, 0(t1)
      sw      t0, 552(sp)
      # %__tmp.84 = add i32 %__tmp.83, 1
      li      t2, 1
      sw      t2, 556(sp)
      lw      t1, 552(sp)
      lw      t2, 556(sp)
      add     t0, t1, t2
      sw      t0, 560(sp)
      # store i32 %__tmp.84, ptr %_j.0
      lw      t0, 560(sp)
      lw      t1, 32(sp)
      sw      t0, 0(t1)
      # br label %for.cond6
      j       main_for.cond6
main_for.merge6:
      # br label %for.step5
      j       main_for.step5
main_for.step5:
      # %__tmp.85 = load i32, ptr %_i.0
      lw      t1, 24(sp)
      lw      t0, 0(t1)
      sw      t0, 564(sp)
      # %__tmp.86 = add i32 %__tmp.85, 1
      li      t2, 1
      sw      t2, 568(sp)
      lw      t1, 564(sp)
      lw      t2, 568(sp)
      add     t0, t1, t2
      sw      t0, 572(sp)
      # store i32 %__tmp.86, ptr %_i.0
      lw      t0, 572(sp)
      lw      t1, 24(sp)
      sw      t0, 0(t1)
      # br label %for.cond5
      j       main_for.cond5
main_for.merge5:
      # %__tmp.88 = load i32, ptr %_sum.0
      lw      t1, 108(sp)
      lw      t0, 0(t1)
      sw      t0, 576(sp)
      # %__tmp.87 = call ptr @toString(i32 %__tmp.88)
      lw      t0, 576(sp)
      mv      a0, t0
      sw      ra, 580(sp)
      call    toString
      mv      t0, a0
      sw      t0, 584(sp)
      lw      ra, 580(sp)
      # call void @println(ptr %__tmp.87)
      lw      t0, 584(sp)
      mv      a0, t0
      sw      ra, 588(sp)
      call    println
      lw      ra, 588(sp)
      # ret i32 0
      li      t0, 0
      sw      t0, 592(sp)
      lw      t0, 592(sp)
      mv      a0, t0
      addi    sp, sp, 596
      ret     
