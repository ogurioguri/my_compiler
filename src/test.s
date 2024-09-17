      .section .rodata
      .globl _string.0
_string.0:
      .asciz  "no solution!\n"
      .section .text
      .globl main
main:
      li      t0, -3004
      add     sp, sp, t0
main_entry:
      # %_N.1 = alloca i32
      addi    t0, sp, 4
      sw      t0, 0(sp)
      # %_head.0 = alloca i32
      addi    t0, sp, 12
      sw      t0, 8(sp)
      # %_startx.0 = alloca i32
      addi    t0, sp, 20
      sw      t0, 16(sp)
      # %_starty.0 = alloca i32
      addi    t0, sp, 28
      sw      t0, 24(sp)
      # %_targetx.0 = alloca i32
      addi    t0, sp, 36
      sw      t0, 32(sp)
      # %_targety.0 = alloca i32
      addi    t0, sp, 44
      sw      t0, 40(sp)
      # %_tail.0 = alloca i32
      addi    t0, sp, 52
      sw      t0, 48(sp)
      # %_ok.0 = alloca i32
      addi    t0, sp, 60
      sw      t0, 56(sp)
      # %_now.0 = alloca i32
      addi    t0, sp, 68
      sw      t0, 64(sp)
      # %_x.0 = alloca i32
      addi    t0, sp, 76
      sw      t0, 72(sp)
      # %_y.0 = alloca i32
      addi    t0, sp, 84
      sw      t0, 80(sp)
      # %_xlist.0 = alloca ptr
      addi    t0, sp, 92
      sw      t0, 88(sp)
      # %_ylist.0 = alloca ptr
      addi    t0, sp, 100
      sw      t0, 96(sp)
      # %_step.0 = alloca ptr
      addi    t0, sp, 108
      sw      t0, 104(sp)
      # %_i.0 = alloca i32
      addi    t0, sp, 116
      sw      t0, 112(sp)
      # %_j.0 = alloca i32
      addi    t0, sp, 124
      sw      t0, 120(sp)
      # %__tmp.6 = load i32, ptr %_N.1
      lw      t1, 0(sp)
      lw      t0, 0(t1)
      sw      t0, 128(sp)
      # %__tmp.7 = call i32 @getInt()
      sw      ra, 132(sp)
      call    getInt
      mv      t0, a0
      sw      t0, 152(sp)
      lw      ra, 132(sp)
      lw      t0, 136(sp)
      lw      t1, 140(sp)
      lw      t2, 144(sp)
      lw      t3, 148(sp)
      # store i32 %__tmp.7, ptr %_N.1
      lw      t0, 152(sp)
      lw      t1, 0(sp)
      sw      t0, 0(t1)
      # %__tmp.8 = load i32, ptr %_head.0
      lw      t1, 8(sp)
      lw      t0, 0(t1)
      sw      t0, 156(sp)
      # store i32 0, ptr %_head.0
      li      t0, 0
      lw      t1, 8(sp)
      sw      t0, 0(t1)
      # %__tmp.9 = load i32, ptr %_tail.0
      lw      t1, 48(sp)
      lw      t0, 0(t1)
      sw      t0, 160(sp)
      # store i32 0, ptr %_tail.0
      li      t0, 0
      lw      t1, 48(sp)
      sw      t0, 0(t1)
      # %__tmp.10 = load i32, ptr %_startx.0
      lw      t1, 16(sp)
      lw      t0, 0(t1)
      sw      t0, 164(sp)
      # store i32 0, ptr %_startx.0
      li      t0, 0
      lw      t1, 16(sp)
      sw      t0, 0(t1)
      # %__tmp.11 = load i32, ptr %_starty.0
      lw      t1, 24(sp)
      lw      t0, 0(t1)
      sw      t0, 168(sp)
      # store i32 0, ptr %_starty.0
      li      t0, 0
      lw      t1, 24(sp)
      sw      t0, 0(t1)
      # %__tmp.12 = load i32, ptr %_targetx.0
      lw      t1, 32(sp)
      lw      t0, 0(t1)
      sw      t0, 172(sp)
      # %__tmp.13 = load i32, ptr %_N.1
      lw      t1, 0(sp)
      lw      t0, 0(t1)
      sw      t0, 176(sp)
      # %__tmp.14 = sub i32 %__tmp.13, 1
      li      t2, 1
      lw      t1, 176(sp)
      sub     t0, t1, t2
      sw      t0, 180(sp)
      # store i32 %__tmp.14, ptr %_targetx.0
      lw      t0, 180(sp)
      lw      t1, 32(sp)
      sw      t0, 0(t1)
      # %__tmp.15 = load i32, ptr %_targety.0
      lw      t1, 40(sp)
      lw      t0, 0(t1)
      sw      t0, 184(sp)
      # %__tmp.16 = load i32, ptr %_N.1
      lw      t1, 0(sp)
      lw      t0, 0(t1)
      sw      t0, 188(sp)
      # %__tmp.17 = sub i32 %__tmp.16, 1
      li      t2, 1
      lw      t1, 188(sp)
      sub     t0, t1, t2
      sw      t0, 192(sp)
      # store i32 %__tmp.17, ptr %_targety.0
      lw      t0, 192(sp)
      lw      t1, 40(sp)
      sw      t0, 0(t1)
      # %__tmp.18 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      sw      t0, 196(sp)
      # store i32 0, ptr %_x.0
      li      t0, 0
      lw      t1, 72(sp)
      sw      t0, 0(t1)
      # %__tmp.19 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      sw      t0, 200(sp)
      # store i32 0, ptr %_y.0
      li      t0, 0
      lw      t1, 80(sp)
      sw      t0, 0(t1)
      # %__tmp.20 = load i32, ptr %_now.0
      lw      t1, 64(sp)
      lw      t0, 0(t1)
      sw      t0, 204(sp)
      # store i32 0, ptr %_now.0
      li      t0, 0
      lw      t1, 64(sp)
      sw      t0, 0(t1)
      # %__tmp.21 = load i32, ptr %_ok.0
      lw      t1, 56(sp)
      lw      t0, 0(t1)
      sw      t0, 208(sp)
      # store i32 0, ptr %_ok.0
      li      t0, 0
      lw      t1, 56(sp)
      sw      t0, 0(t1)
      # %__tmp.22 = load ptr, ptr %_xlist.0
      lw      t1, 88(sp)
      lw      t0, 0(t1)
      sw      t0, 212(sp)
      # %__tmp.23 = load i32, ptr %_N.1
      lw      t1, 0(sp)
      lw      t0, 0(t1)
      sw      t0, 216(sp)
      # %__tmp.24 = load i32, ptr %_N.1
      lw      t1, 0(sp)
      lw      t0, 0(t1)
      sw      t0, 220(sp)
      # %__tmp.25 = mul i32 %__tmp.23, %__tmp.24
      lw      t1, 216(sp)
      lw      t2, 220(sp)
      mul     t0, t1, t2
      sw      t0, 224(sp)
      # %__tmp.26 = call ptr @_malloc_array(i32 4, i32 %__tmp.25)
      li      t0, 4
      mv      a0, t0
      lw      t0, 224(sp)
      mv      a1, t0
      sw      ra, 228(sp)
      call    _malloc_array
      mv      t0, a0
      sw      t0, 248(sp)
      lw      ra, 228(sp)
      lw      t0, 232(sp)
      lw      t1, 236(sp)
      lw      t2, 240(sp)
      lw      t3, 244(sp)
      # store ptr %__tmp.26, ptr %_xlist.0
      lw      t0, 248(sp)
      lw      t1, 88(sp)
      sw      t0, 0(t1)
      # %__tmp.27 = load i32, ptr %_i.0
      lw      t1, 112(sp)
      lw      t0, 0(t1)
      sw      t0, 252(sp)
      # store i32 0, ptr %_i.0
      li      t0, 0
      lw      t1, 112(sp)
      sw      t0, 0(t1)
      # br label %for.cond0
      j       main_for.cond0
main_for.cond0:
      # %__tmp.28 = load i32, ptr %_i.0
      lw      t1, 112(sp)
      lw      t0, 0(t1)
      sw      t0, 256(sp)
      # %__tmp.29 = load i32, ptr %_N.1
      lw      t1, 0(sp)
      lw      t0, 0(t1)
      sw      t0, 260(sp)
      # %__tmp.30 = load i32, ptr %_N.1
      lw      t1, 0(sp)
      lw      t0, 0(t1)
      sw      t0, 264(sp)
      # %__tmp.31 = mul i32 %__tmp.29, %__tmp.30
      lw      t1, 260(sp)
      lw      t2, 264(sp)
      mul     t0, t1, t2
      sw      t0, 268(sp)
      # %__tmp.32 = icmp slt i32 %__tmp.28, %__tmp.31
      lw      t1, 256(sp)
      lw      t2, 268(sp)
      sub     t0, t1, t2
      sltz    t3, t0
      mv      t0, t3
      sw      t0, 272(sp)
      # br i1 %__tmp.32, label %for.body0, label %for.merge0
      lw      t0, 272(sp)
      beqz     t0, main_jump0
      j       main_for.body0
main_jump0:
      j       main_for.merge0
main_for.body0:
      # %__tmp.33 = load ptr, ptr %_xlist.0
      lw      t1, 88(sp)
      lw      t0, 0(t1)
      sw      t0, 276(sp)
      # %__tmp.34 = load i32, ptr %_i.0
      lw      t1, 112(sp)
      lw      t0, 0(t1)
      sw      t0, 280(sp)
      # %__tmp.35 = getelementptr i32, ptr %__tmp.33, i32 %__tmp.34
      lw      t0, 280(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 276(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 284(sp)
      # %__tmp.36 = load i32, ptr %__tmp.35
      lw      t1, 284(sp)
      lw      t0, 0(t1)
      sw      t0, 288(sp)
      # store i32 0, ptr %__tmp.35
      li      t0, 0
      lw      t1, 284(sp)
      sw      t0, 0(t1)
      # br label %for.step0
      j       main_for.step0
main_for.step0:
      # %__tmp.37 = load i32, ptr %_i.0
      lw      t1, 112(sp)
      lw      t0, 0(t1)
      sw      t0, 292(sp)
      # %__tmp.38 = add i32 %__tmp.37, 1
      li      t2, 1
      lw      t1, 292(sp)
      add     t0, t1, t2
      sw      t0, 296(sp)
      # store i32 %__tmp.38, ptr %_i.0
      lw      t0, 296(sp)
      lw      t1, 112(sp)
      sw      t0, 0(t1)
      # br label %for.cond0
      j       main_for.cond0
main_for.merge0:
      # %__tmp.39 = load ptr, ptr %_ylist.0
      lw      t1, 96(sp)
      lw      t0, 0(t1)
      sw      t0, 300(sp)
      # %__tmp.40 = load i32, ptr %_N.1
      lw      t1, 0(sp)
      lw      t0, 0(t1)
      sw      t0, 304(sp)
      # %__tmp.41 = load i32, ptr %_N.1
      lw      t1, 0(sp)
      lw      t0, 0(t1)
      sw      t0, 308(sp)
      # %__tmp.42 = mul i32 %__tmp.40, %__tmp.41
      lw      t1, 304(sp)
      lw      t2, 308(sp)
      mul     t0, t1, t2
      sw      t0, 312(sp)
      # %__tmp.43 = call ptr @_malloc_array(i32 4, i32 %__tmp.42)
      li      t0, 4
      mv      a0, t0
      lw      t0, 312(sp)
      mv      a1, t0
      sw      ra, 316(sp)
      call    _malloc_array
      mv      t0, a0
      sw      t0, 336(sp)
      lw      ra, 316(sp)
      lw      t0, 320(sp)
      lw      t1, 324(sp)
      lw      t2, 328(sp)
      lw      t3, 332(sp)
      # store ptr %__tmp.43, ptr %_ylist.0
      lw      t0, 336(sp)
      lw      t1, 96(sp)
      sw      t0, 0(t1)
      # %__tmp.44 = load i32, ptr %_i.0
      lw      t1, 112(sp)
      lw      t0, 0(t1)
      sw      t0, 340(sp)
      # store i32 0, ptr %_i.0
      li      t0, 0
      lw      t1, 112(sp)
      sw      t0, 0(t1)
      # br label %for.cond1
      j       main_for.cond1
main_for.cond1:
      # %__tmp.45 = load i32, ptr %_i.0
      lw      t1, 112(sp)
      lw      t0, 0(t1)
      sw      t0, 344(sp)
      # %__tmp.46 = load i32, ptr %_N.1
      lw      t1, 0(sp)
      lw      t0, 0(t1)
      sw      t0, 348(sp)
      # %__tmp.47 = load i32, ptr %_N.1
      lw      t1, 0(sp)
      lw      t0, 0(t1)
      sw      t0, 352(sp)
      # %__tmp.48 = mul i32 %__tmp.46, %__tmp.47
      lw      t1, 348(sp)
      lw      t2, 352(sp)
      mul     t0, t1, t2
      sw      t0, 356(sp)
      # %__tmp.49 = icmp slt i32 %__tmp.45, %__tmp.48
      lw      t1, 344(sp)
      lw      t2, 356(sp)
      sub     t0, t1, t2
      sltz    t3, t0
      mv      t0, t3
      sw      t0, 360(sp)
      # br i1 %__tmp.49, label %for.body1, label %for.merge1
      lw      t0, 360(sp)
      beqz     t0, main_jump1
      j       main_for.body1
main_jump1:
      j       main_for.merge1
main_for.body1:
      # %__tmp.50 = load ptr, ptr %_ylist.0
      lw      t1, 96(sp)
      lw      t0, 0(t1)
      sw      t0, 364(sp)
      # %__tmp.51 = load i32, ptr %_i.0
      lw      t1, 112(sp)
      lw      t0, 0(t1)
      sw      t0, 368(sp)
      # %__tmp.52 = getelementptr i32, ptr %__tmp.50, i32 %__tmp.51
      lw      t0, 368(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 364(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 372(sp)
      # %__tmp.53 = load i32, ptr %__tmp.52
      lw      t1, 372(sp)
      lw      t0, 0(t1)
      sw      t0, 376(sp)
      # store i32 0, ptr %__tmp.52
      li      t0, 0
      lw      t1, 372(sp)
      sw      t0, 0(t1)
      # br label %for.step1
      j       main_for.step1
main_for.step1:
      # %__tmp.54 = load i32, ptr %_i.0
      lw      t1, 112(sp)
      lw      t0, 0(t1)
      sw      t0, 380(sp)
      # %__tmp.55 = add i32 %__tmp.54, 1
      li      t2, 1
      lw      t1, 380(sp)
      add     t0, t1, t2
      sw      t0, 384(sp)
      # store i32 %__tmp.55, ptr %_i.0
      lw      t0, 384(sp)
      lw      t1, 112(sp)
      sw      t0, 0(t1)
      # br label %for.cond1
      j       main_for.cond1
main_for.merge1:
      # %__tmp.56 = load ptr, ptr %_step.0
      lw      t1, 104(sp)
      lw      t0, 0(t1)
      sw      t0, 388(sp)
      # %__tmp.57 = load i32, ptr %_N.1
      lw      t1, 0(sp)
      lw      t0, 0(t1)
      sw      t0, 392(sp)
      # %__tmp.58 = call ptr @_malloc_array(i32 4, i32 %__tmp.57)
      li      t0, 4
      mv      a0, t0
      lw      t0, 392(sp)
      mv      a1, t0
      sw      ra, 396(sp)
      call    _malloc_array
      mv      t0, a0
      sw      t0, 416(sp)
      lw      ra, 396(sp)
      lw      t0, 400(sp)
      lw      t1, 404(sp)
      lw      t2, 408(sp)
      lw      t3, 412(sp)
      # store ptr %__tmp.58, ptr %_step.0
      lw      t0, 416(sp)
      lw      t1, 104(sp)
      sw      t0, 0(t1)
      # %__tmp.59 = load i32, ptr %_i.0
      lw      t1, 112(sp)
      lw      t0, 0(t1)
      sw      t0, 420(sp)
      # store i32 0, ptr %_i.0
      li      t0, 0
      lw      t1, 112(sp)
      sw      t0, 0(t1)
      # br label %for.cond2
      j       main_for.cond2
main_for.cond2:
      # %__tmp.60 = load i32, ptr %_i.0
      lw      t1, 112(sp)
      lw      t0, 0(t1)
      sw      t0, 424(sp)
      # %__tmp.61 = load i32, ptr %_N.1
      lw      t1, 0(sp)
      lw      t0, 0(t1)
      sw      t0, 428(sp)
      # %__tmp.62 = icmp slt i32 %__tmp.60, %__tmp.61
      lw      t1, 424(sp)
      lw      t2, 428(sp)
      sub     t0, t1, t2
      sltz    t3, t0
      mv      t0, t3
      sw      t0, 432(sp)
      # br i1 %__tmp.62, label %for.body2, label %for.merge2
      lw      t0, 432(sp)
      beqz     t0, main_jump2
      j       main_for.body2
main_jump2:
      j       main_for.merge2
main_for.body2:
      # %__tmp.63 = load ptr, ptr %_step.0
      lw      t1, 104(sp)
      lw      t0, 0(t1)
      sw      t0, 436(sp)
      # %__tmp.64 = load i32, ptr %_i.0
      lw      t1, 112(sp)
      lw      t0, 0(t1)
      sw      t0, 440(sp)
      # %__tmp.65 = getelementptr ptr, ptr %__tmp.63, i32 %__tmp.64
      lw      t0, 440(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 436(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 444(sp)
      # %__tmp.66 = load ptr, ptr %__tmp.65
      lw      t1, 444(sp)
      lw      t0, 0(t1)
      sw      t0, 448(sp)
      # %__tmp.67 = load i32, ptr %_N.1
      lw      t1, 0(sp)
      lw      t0, 0(t1)
      sw      t0, 452(sp)
      # %__tmp.68 = call ptr @_malloc_array(i32 4, i32 %__tmp.67)
      li      t0, 4
      mv      a0, t0
      lw      t0, 452(sp)
      mv      a1, t0
      sw      ra, 456(sp)
      call    _malloc_array
      mv      t0, a0
      sw      t0, 476(sp)
      lw      ra, 456(sp)
      lw      t0, 460(sp)
      lw      t1, 464(sp)
      lw      t2, 468(sp)
      lw      t3, 472(sp)
      # store ptr %__tmp.68, ptr %__tmp.65
      lw      t0, 476(sp)
      lw      t1, 444(sp)
      sw      t0, 0(t1)
      # %__tmp.69 = load i32, ptr %_j.0
      lw      t1, 120(sp)
      lw      t0, 0(t1)
      sw      t0, 480(sp)
      # store i32 0, ptr %_j.0
      li      t0, 0
      lw      t1, 120(sp)
      sw      t0, 0(t1)
      # br label %for.cond3
      j       main_for.cond3
main_for.cond3:
      # %__tmp.70 = load i32, ptr %_j.0
      lw      t1, 120(sp)
      lw      t0, 0(t1)
      sw      t0, 484(sp)
      # %__tmp.71 = load i32, ptr %_N.1
      lw      t1, 0(sp)
      lw      t0, 0(t1)
      sw      t0, 488(sp)
      # %__tmp.72 = icmp slt i32 %__tmp.70, %__tmp.71
      lw      t1, 484(sp)
      lw      t2, 488(sp)
      sub     t0, t1, t2
      sltz    t3, t0
      mv      t0, t3
      sw      t0, 492(sp)
      # br i1 %__tmp.72, label %for.body3, label %for.merge3
      lw      t0, 492(sp)
      beqz     t0, main_jump3
      j       main_for.body3
main_jump3:
      j       main_for.merge3
main_for.body3:
      # %__tmp.73 = load ptr, ptr %_step.0
      lw      t1, 104(sp)
      lw      t0, 0(t1)
      sw      t0, 496(sp)
      # %__tmp.74 = load i32, ptr %_i.0
      lw      t1, 112(sp)
      lw      t0, 0(t1)
      sw      t0, 500(sp)
      # %__tmp.75 = getelementptr ptr, ptr %__tmp.73, i32 %__tmp.74
      lw      t0, 500(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 496(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 504(sp)
      # %__tmp.76 = load ptr, ptr %__tmp.75
      lw      t1, 504(sp)
      lw      t0, 0(t1)
      sw      t0, 508(sp)
      # %__tmp.77 = load i32, ptr %_j.0
      lw      t1, 120(sp)
      lw      t0, 0(t1)
      sw      t0, 512(sp)
      # %__tmp.78 = getelementptr i32, ptr %__tmp.76, i32 %__tmp.77
      lw      t0, 512(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 508(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 516(sp)
      # %__tmp.79 = load i32, ptr %__tmp.78
      lw      t1, 516(sp)
      lw      t0, 0(t1)
      sw      t0, 520(sp)
      # %__tmp.80 = sub i32 0, 1
      li      t1, 0
      li      t2, 1
      sub     t0, t1, t2
      sw      t0, 524(sp)
      # store i32 %__tmp.80, ptr %__tmp.78
      lw      t0, 524(sp)
      lw      t1, 516(sp)
      sw      t0, 0(t1)
      # br label %for.step3
      j       main_for.step3
main_for.step3:
      # %__tmp.81 = load i32, ptr %_j.0
      lw      t1, 120(sp)
      lw      t0, 0(t1)
      sw      t0, 528(sp)
      # %__tmp.82 = add i32 %__tmp.81, 1
      li      t2, 1
      lw      t1, 528(sp)
      add     t0, t1, t2
      sw      t0, 532(sp)
      # store i32 %__tmp.82, ptr %_j.0
      lw      t0, 532(sp)
      lw      t1, 120(sp)
      sw      t0, 0(t1)
      # br label %for.cond3
      j       main_for.cond3
main_for.merge3:
      # br label %for.step2
      j       main_for.step2
main_for.step2:
      # %__tmp.83 = load i32, ptr %_i.0
      lw      t1, 112(sp)
      lw      t0, 0(t1)
      sw      t0, 536(sp)
      # %__tmp.84 = add i32 %__tmp.83, 1
      li      t2, 1
      lw      t1, 536(sp)
      add     t0, t1, t2
      sw      t0, 540(sp)
      # store i32 %__tmp.84, ptr %_i.0
      lw      t0, 540(sp)
      lw      t1, 112(sp)
      sw      t0, 0(t1)
      # br label %for.cond2
      j       main_for.cond2
main_for.merge2:
      # %__tmp.85 = load ptr, ptr %_xlist.0
      lw      t1, 88(sp)
      lw      t0, 0(t1)
      sw      t0, 544(sp)
      # %__tmp.86 = getelementptr i32, ptr %__tmp.85, i32 0
      li      t0, 0
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 544(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 548(sp)
      # %__tmp.87 = load i32, ptr %__tmp.86
      lw      t1, 548(sp)
      lw      t0, 0(t1)
      sw      t0, 552(sp)
      # %__tmp.88 = load i32, ptr %_startx.0
      lw      t1, 16(sp)
      lw      t0, 0(t1)
      sw      t0, 556(sp)
      # store i32 %__tmp.88, ptr %__tmp.86
      lw      t0, 556(sp)
      lw      t1, 548(sp)
      sw      t0, 0(t1)
      # %__tmp.89 = load ptr, ptr %_ylist.0
      lw      t1, 96(sp)
      lw      t0, 0(t1)
      sw      t0, 560(sp)
      # %__tmp.90 = getelementptr i32, ptr %__tmp.89, i32 0
      li      t0, 0
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 560(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 564(sp)
      # %__tmp.91 = load i32, ptr %__tmp.90
      lw      t1, 564(sp)
      lw      t0, 0(t1)
      sw      t0, 568(sp)
      # %__tmp.92 = load i32, ptr %_starty.0
      lw      t1, 24(sp)
      lw      t0, 0(t1)
      sw      t0, 572(sp)
      # store i32 %__tmp.92, ptr %__tmp.90
      lw      t0, 572(sp)
      lw      t1, 564(sp)
      sw      t0, 0(t1)
      # %__tmp.93 = load ptr, ptr %_step.0
      lw      t1, 104(sp)
      lw      t0, 0(t1)
      sw      t0, 576(sp)
      # %__tmp.94 = load i32, ptr %_startx.0
      lw      t1, 16(sp)
      lw      t0, 0(t1)
      sw      t0, 580(sp)
      # %__tmp.95 = getelementptr ptr, ptr %__tmp.93, i32 %__tmp.94
      lw      t0, 580(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 576(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 584(sp)
      # %__tmp.96 = load ptr, ptr %__tmp.95
      lw      t1, 584(sp)
      lw      t0, 0(t1)
      sw      t0, 588(sp)
      # %__tmp.97 = load i32, ptr %_starty.0
      lw      t1, 24(sp)
      lw      t0, 0(t1)
      sw      t0, 592(sp)
      # %__tmp.98 = getelementptr i32, ptr %__tmp.96, i32 %__tmp.97
      lw      t0, 592(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 588(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 596(sp)
      # %__tmp.99 = load i32, ptr %__tmp.98
      lw      t1, 596(sp)
      lw      t0, 0(t1)
      sw      t0, 600(sp)
      # store i32 0, ptr %__tmp.98
      li      t0, 0
      lw      t1, 596(sp)
      sw      t0, 0(t1)
      # br label %while.cond0
      j       main_while.cond0
main_while.cond0:
      # %__tmp.100 = load i32, ptr %_head.0
      lw      t1, 8(sp)
      lw      t0, 0(t1)
      sw      t0, 604(sp)
      # %__tmp.101 = load i32, ptr %_tail.0
      lw      t1, 48(sp)
      lw      t0, 0(t1)
      sw      t0, 608(sp)
      # %__tmp.102 = icmp sle i32 %__tmp.100, %__tmp.101
      lw      t1, 604(sp)
      lw      t2, 608(sp)
      sub     t0, t1, t2
      sltz    t3, t0
      seqz    t1, t0
      or      t2, t3, t1
      mv      t0, t2
      sw      t0, 612(sp)
      # br i1 %__tmp.102, label %while.body0, label %while.merge0
      lw      t0, 612(sp)
      beqz     t0, main_jump4
      j       main_while.body0
main_jump4:
      j       main_while.merge0
main_while.body0:
      # %__tmp.103 = load i32, ptr %_now.0
      lw      t1, 64(sp)
      lw      t0, 0(t1)
      sw      t0, 616(sp)
      # %__tmp.104 = load ptr, ptr %_step.0
      lw      t1, 104(sp)
      lw      t0, 0(t1)
      sw      t0, 620(sp)
      # %__tmp.105 = load ptr, ptr %_xlist.0
      lw      t1, 88(sp)
      lw      t0, 0(t1)
      sw      t0, 624(sp)
      # %__tmp.106 = load i32, ptr %_head.0
      lw      t1, 8(sp)
      lw      t0, 0(t1)
      sw      t0, 628(sp)
      # %__tmp.107 = getelementptr i32, ptr %__tmp.105, i32 %__tmp.106
      lw      t0, 628(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 624(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 632(sp)
      # %__tmp.108 = load i32, ptr %__tmp.107
      lw      t1, 632(sp)
      lw      t0, 0(t1)
      sw      t0, 636(sp)
      # %__tmp.109 = getelementptr ptr, ptr %__tmp.104, i32 %__tmp.108
      lw      t0, 636(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 620(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 640(sp)
      # %__tmp.110 = load ptr, ptr %__tmp.109
      lw      t1, 640(sp)
      lw      t0, 0(t1)
      sw      t0, 644(sp)
      # %__tmp.111 = load ptr, ptr %_ylist.0
      lw      t1, 96(sp)
      lw      t0, 0(t1)
      sw      t0, 648(sp)
      # %__tmp.112 = load i32, ptr %_head.0
      lw      t1, 8(sp)
      lw      t0, 0(t1)
      sw      t0, 652(sp)
      # %__tmp.113 = getelementptr i32, ptr %__tmp.111, i32 %__tmp.112
      lw      t0, 652(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 648(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 656(sp)
      # %__tmp.114 = load i32, ptr %__tmp.113
      lw      t1, 656(sp)
      lw      t0, 0(t1)
      sw      t0, 660(sp)
      # %__tmp.115 = getelementptr i32, ptr %__tmp.110, i32 %__tmp.114
      lw      t0, 660(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 644(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 664(sp)
      # %__tmp.116 = load i32, ptr %__tmp.115
      lw      t1, 664(sp)
      lw      t0, 0(t1)
      sw      t0, 668(sp)
      # store i32 %__tmp.116, ptr %_now.0
      lw      t0, 668(sp)
      lw      t1, 64(sp)
      sw      t0, 0(t1)
      # %__tmp.117 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      sw      t0, 672(sp)
      # %__tmp.118 = load ptr, ptr %_xlist.0
      lw      t1, 88(sp)
      lw      t0, 0(t1)
      sw      t0, 676(sp)
      # %__tmp.119 = load i32, ptr %_head.0
      lw      t1, 8(sp)
      lw      t0, 0(t1)
      sw      t0, 680(sp)
      # %__tmp.120 = getelementptr i32, ptr %__tmp.118, i32 %__tmp.119
      lw      t0, 680(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 676(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 684(sp)
      # %__tmp.121 = load i32, ptr %__tmp.120
      lw      t1, 684(sp)
      lw      t0, 0(t1)
      sw      t0, 688(sp)
      # %__tmp.122 = sub i32 %__tmp.121, 1
      li      t2, 1
      lw      t1, 688(sp)
      sub     t0, t1, t2
      sw      t0, 692(sp)
      # store i32 %__tmp.122, ptr %_x.0
      lw      t0, 692(sp)
      lw      t1, 72(sp)
      sw      t0, 0(t1)
      # %__tmp.123 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      sw      t0, 696(sp)
      # %__tmp.124 = load ptr, ptr %_ylist.0
      lw      t1, 96(sp)
      lw      t0, 0(t1)
      sw      t0, 700(sp)
      # %__tmp.125 = load i32, ptr %_head.0
      lw      t1, 8(sp)
      lw      t0, 0(t1)
      sw      t0, 704(sp)
      # %__tmp.126 = getelementptr i32, ptr %__tmp.124, i32 %__tmp.125
      lw      t0, 704(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 700(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 708(sp)
      # %__tmp.127 = load i32, ptr %__tmp.126
      lw      t1, 708(sp)
      lw      t0, 0(t1)
      sw      t0, 712(sp)
      # %__tmp.128 = sub i32 %__tmp.127, 2
      li      t2, 2
      lw      t1, 712(sp)
      sub     t0, t1, t2
      sw      t0, 716(sp)
      # store i32 %__tmp.128, ptr %_y.0
      lw      t0, 716(sp)
      lw      t1, 80(sp)
      sw      t0, 0(t1)
      # %__tmp.130 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      sw      t0, 720(sp)
      # %__tmp.131 = load i32, ptr %_N.1
      lw      t1, 0(sp)
      lw      t0, 0(t1)
      sw      t0, 724(sp)
      # %__tmp.129 = call i1 @check(i32 %__tmp.130, i32 %__tmp.131)
      lw      t0, 720(sp)
      mv      a0, t0
      lw      t0, 724(sp)
      mv      a1, t0
      sw      ra, 728(sp)
      call    check
      mv      t0, a0
      sw      t0, 748(sp)
      lw      ra, 728(sp)
      lw      t0, 732(sp)
      lw      t1, 736(sp)
      lw      t2, 740(sp)
      lw      t3, 744(sp)
      # br i1 %__tmp.129, label %if.then.1, label %if.else.1
      lw      t0, 748(sp)
      beqz     t0, main_jump5
      j       main_if.then.1
main_jump5:
      j       main_if.else.1
main_if.then.1:
      # %__tmp.133 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      sw      t0, 752(sp)
      # %__tmp.134 = load i32, ptr %_N.1
      lw      t1, 0(sp)
      lw      t0, 0(t1)
      sw      t0, 756(sp)
      # %__tmp.132 = call i1 @check(i32 %__tmp.133, i32 %__tmp.134)
      lw      t0, 752(sp)
      mv      a0, t0
      lw      t0, 756(sp)
      mv      a1, t0
      sw      ra, 760(sp)
      call    check
      mv      t0, a0
      sw      t0, 780(sp)
      lw      ra, 760(sp)
      lw      t0, 764(sp)
      lw      t1, 768(sp)
      lw      t2, 772(sp)
      lw      t3, 776(sp)
      # br label %if.end.1
      lw      t1, 780(sp)
      mv      t0, t1
      j       main_if.end.1
main_if.else.1:
      # br label %if.end.1
      lw      t1, 748(sp)
      mv      t0, t1
      j       main_if.end.1
main_if.end.1:
      sw      t0, 784(sp)
      # br i1 %__tmp.135, label %if.then.2, label %if.else.2
      lw      t0, 784(sp)
      beqz     t0, main_jump6
      j       main_if.then.2
main_jump6:
      j       main_if.else.2
main_if.then.2:
      # %__tmp.136 = load ptr, ptr %_step.0
      lw      t1, 104(sp)
      lw      t0, 0(t1)
      sw      t0, 788(sp)
      # %__tmp.137 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      sw      t0, 792(sp)
      # %__tmp.138 = getelementptr ptr, ptr %__tmp.136, i32 %__tmp.137
      lw      t0, 792(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 788(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 796(sp)
      # %__tmp.139 = load ptr, ptr %__tmp.138
      lw      t1, 796(sp)
      lw      t0, 0(t1)
      sw      t0, 800(sp)
      # %__tmp.140 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      sw      t0, 804(sp)
      # %__tmp.141 = getelementptr i32, ptr %__tmp.139, i32 %__tmp.140
      lw      t0, 804(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 800(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 808(sp)
      # %__tmp.142 = load i32, ptr %__tmp.141
      lw      t1, 808(sp)
      lw      t0, 0(t1)
      sw      t0, 812(sp)
      # %__tmp.143 = sub i32 0, 1
      li      t1, 0
      li      t2, 1
      sub     t0, t1, t2
      sw      t0, 816(sp)
      # %__tmp.144 = icmp eq i32 %__tmp.142, %__tmp.143
      lw      t1, 812(sp)
      lw      t2, 816(sp)
      sub     t0, t1, t2
      seqz    t3, t0
      mv      t0, t3
      sw      t0, 820(sp)
      # br label %if.end.2
      lw      t1, 820(sp)
      mv      t0, t1
      j       main_if.end.2
main_if.else.2:
      # br label %if.end.2
      lw      t1, 784(sp)
      mv      t0, t1
      j       main_if.end.2
main_if.end.2:
      sw      t0, 824(sp)
      # br i1 %__tmp.145, label %if.then3, label %if.merge3
      lw      t0, 824(sp)
      beqz     t0, main_jump7
      j       main_if.then3
main_jump7:
      j       main_if.merge3
main_if.then3:
      # %__tmp.146 = load i32, ptr %_tail.0
      lw      t1, 48(sp)
      lw      t0, 0(t1)
      sw      t0, 828(sp)
      # %__tmp.147 = load i32, ptr %_tail.0
      lw      t1, 48(sp)
      lw      t0, 0(t1)
      sw      t0, 832(sp)
      # %__tmp.148 = add i32 %__tmp.147, 1
      li      t2, 1
      lw      t1, 832(sp)
      add     t0, t1, t2
      sw      t0, 836(sp)
      # store i32 %__tmp.148, ptr %_tail.0
      lw      t0, 836(sp)
      lw      t1, 48(sp)
      sw      t0, 0(t1)
      # %__tmp.149 = load ptr, ptr %_xlist.0
      lw      t1, 88(sp)
      lw      t0, 0(t1)
      sw      t0, 840(sp)
      # %__tmp.150 = load i32, ptr %_tail.0
      lw      t1, 48(sp)
      lw      t0, 0(t1)
      sw      t0, 844(sp)
      # %__tmp.151 = getelementptr i32, ptr %__tmp.149, i32 %__tmp.150
      lw      t0, 844(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 840(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 848(sp)
      # %__tmp.152 = load i32, ptr %__tmp.151
      lw      t1, 848(sp)
      lw      t0, 0(t1)
      sw      t0, 852(sp)
      # %__tmp.153 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      sw      t0, 856(sp)
      # store i32 %__tmp.153, ptr %__tmp.151
      lw      t0, 856(sp)
      lw      t1, 848(sp)
      sw      t0, 0(t1)
      # %__tmp.154 = load ptr, ptr %_ylist.0
      lw      t1, 96(sp)
      lw      t0, 0(t1)
      sw      t0, 860(sp)
      # %__tmp.155 = load i32, ptr %_tail.0
      lw      t1, 48(sp)
      lw      t0, 0(t1)
      sw      t0, 864(sp)
      # %__tmp.156 = getelementptr i32, ptr %__tmp.154, i32 %__tmp.155
      lw      t0, 864(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 860(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 868(sp)
      # %__tmp.157 = load i32, ptr %__tmp.156
      lw      t1, 868(sp)
      lw      t0, 0(t1)
      sw      t0, 872(sp)
      # %__tmp.158 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      sw      t0, 876(sp)
      # store i32 %__tmp.158, ptr %__tmp.156
      lw      t0, 876(sp)
      lw      t1, 868(sp)
      sw      t0, 0(t1)
      # %__tmp.159 = load ptr, ptr %_step.0
      lw      t1, 104(sp)
      lw      t0, 0(t1)
      sw      t0, 880(sp)
      # %__tmp.160 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      sw      t0, 884(sp)
      # %__tmp.161 = getelementptr ptr, ptr %__tmp.159, i32 %__tmp.160
      lw      t0, 884(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 880(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 888(sp)
      # %__tmp.162 = load ptr, ptr %__tmp.161
      lw      t1, 888(sp)
      lw      t0, 0(t1)
      sw      t0, 892(sp)
      # %__tmp.163 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      sw      t0, 896(sp)
      # %__tmp.164 = getelementptr i32, ptr %__tmp.162, i32 %__tmp.163
      lw      t0, 896(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 892(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 900(sp)
      # %__tmp.165 = load i32, ptr %__tmp.164
      lw      t1, 900(sp)
      lw      t0, 0(t1)
      sw      t0, 904(sp)
      # %__tmp.166 = load i32, ptr %_now.0
      lw      t1, 64(sp)
      lw      t0, 0(t1)
      sw      t0, 908(sp)
      # %__tmp.167 = add i32 %__tmp.166, 1
      li      t2, 1
      lw      t1, 908(sp)
      add     t0, t1, t2
      sw      t0, 912(sp)
      # store i32 %__tmp.167, ptr %__tmp.164
      lw      t0, 912(sp)
      lw      t1, 900(sp)
      sw      t0, 0(t1)
      # %__tmp.168 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      sw      t0, 916(sp)
      # %__tmp.169 = load i32, ptr %_targetx.0
      lw      t1, 32(sp)
      lw      t0, 0(t1)
      sw      t0, 920(sp)
      # %__tmp.170 = icmp eq i32 %__tmp.168, %__tmp.169
      lw      t1, 916(sp)
      lw      t2, 920(sp)
      sub     t0, t1, t2
      seqz    t3, t0
      mv      t0, t3
      sw      t0, 924(sp)
      # br i1 %__tmp.170, label %if.then.4, label %if.else.4
      lw      t0, 924(sp)
      beqz     t0, main_jump8
      j       main_if.then.4
main_jump8:
      j       main_if.else.4
main_if.then.4:
      # %__tmp.171 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      sw      t0, 928(sp)
      # %__tmp.172 = load i32, ptr %_targety.0
      lw      t1, 40(sp)
      lw      t0, 0(t1)
      sw      t0, 932(sp)
      # %__tmp.173 = icmp eq i32 %__tmp.171, %__tmp.172
      lw      t1, 928(sp)
      lw      t2, 932(sp)
      sub     t0, t1, t2
      seqz    t3, t0
      mv      t0, t3
      sw      t0, 936(sp)
      # br label %if.end.4
      lw      t1, 936(sp)
      mv      t0, t1
      j       main_if.end.4
main_if.else.4:
      # br label %if.end.4
      lw      t1, 924(sp)
      mv      t0, t1
      j       main_if.end.4
main_if.end.4:
      sw      t0, 940(sp)
      # br i1 %__tmp.174, label %if.then5, label %if.merge5
      lw      t0, 940(sp)
      beqz     t0, main_jump9
      j       main_if.then5
main_jump9:
      j       main_if.merge5
main_if.then5:
      # %__tmp.175 = load i32, ptr %_ok.0
      lw      t1, 56(sp)
      lw      t0, 0(t1)
      sw      t0, 944(sp)
      # store i32 1, ptr %_ok.0
      li      t0, 1
      lw      t1, 56(sp)
      sw      t0, 0(t1)
      # br label %if.merge5
      j       main_if.merge5
main_if.merge5:
      # br label %if.merge3
      j       main_if.merge3
main_if.merge3:
      # %__tmp.176 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      sw      t0, 948(sp)
      # %__tmp.177 = load ptr, ptr %_xlist.0
      lw      t1, 88(sp)
      lw      t0, 0(t1)
      sw      t0, 952(sp)
      # %__tmp.178 = load i32, ptr %_head.0
      lw      t1, 8(sp)
      lw      t0, 0(t1)
      sw      t0, 956(sp)
      # %__tmp.179 = getelementptr i32, ptr %__tmp.177, i32 %__tmp.178
      lw      t0, 956(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 952(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 960(sp)
      # %__tmp.180 = load i32, ptr %__tmp.179
      lw      t1, 960(sp)
      lw      t0, 0(t1)
      sw      t0, 964(sp)
      # %__tmp.181 = sub i32 %__tmp.180, 1
      li      t2, 1
      lw      t1, 964(sp)
      sub     t0, t1, t2
      sw      t0, 968(sp)
      # store i32 %__tmp.181, ptr %_x.0
      lw      t0, 968(sp)
      lw      t1, 72(sp)
      sw      t0, 0(t1)
      # %__tmp.182 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      sw      t0, 972(sp)
      # %__tmp.183 = load ptr, ptr %_ylist.0
      lw      t1, 96(sp)
      lw      t0, 0(t1)
      sw      t0, 976(sp)
      # %__tmp.184 = load i32, ptr %_head.0
      lw      t1, 8(sp)
      lw      t0, 0(t1)
      sw      t0, 980(sp)
      # %__tmp.185 = getelementptr i32, ptr %__tmp.183, i32 %__tmp.184
      lw      t0, 980(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 976(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 984(sp)
      # %__tmp.186 = load i32, ptr %__tmp.185
      lw      t1, 984(sp)
      lw      t0, 0(t1)
      sw      t0, 988(sp)
      # %__tmp.187 = add i32 %__tmp.186, 2
      li      t2, 2
      lw      t1, 988(sp)
      add     t0, t1, t2
      sw      t0, 992(sp)
      # store i32 %__tmp.187, ptr %_y.0
      lw      t0, 992(sp)
      lw      t1, 80(sp)
      sw      t0, 0(t1)
      # %__tmp.189 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      sw      t0, 996(sp)
      # %__tmp.190 = load i32, ptr %_N.1
      lw      t1, 0(sp)
      lw      t0, 0(t1)
      sw      t0, 1000(sp)
      # %__tmp.188 = call i1 @check(i32 %__tmp.189, i32 %__tmp.190)
      lw      t0, 996(sp)
      mv      a0, t0
      lw      t0, 1000(sp)
      mv      a1, t0
      sw      ra, 1004(sp)
      call    check
      mv      t0, a0
      sw      t0, 1024(sp)
      lw      ra, 1004(sp)
      lw      t0, 1008(sp)
      lw      t1, 1012(sp)
      lw      t2, 1016(sp)
      lw      t3, 1020(sp)
      # br i1 %__tmp.188, label %if.then.6, label %if.else.6
      lw      t0, 1024(sp)
      beqz     t0, main_jump10
      j       main_if.then.6
main_jump10:
      j       main_if.else.6
main_if.then.6:
      # %__tmp.192 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      sw      t0, 1028(sp)
      # %__tmp.193 = load i32, ptr %_N.1
      lw      t1, 0(sp)
      lw      t0, 0(t1)
      sw      t0, 1032(sp)
      # %__tmp.191 = call i1 @check(i32 %__tmp.192, i32 %__tmp.193)
      lw      t0, 1028(sp)
      mv      a0, t0
      lw      t0, 1032(sp)
      mv      a1, t0
      sw      ra, 1036(sp)
      call    check
      mv      t0, a0
      sw      t0, 1056(sp)
      lw      ra, 1036(sp)
      lw      t0, 1040(sp)
      lw      t1, 1044(sp)
      lw      t2, 1048(sp)
      lw      t3, 1052(sp)
      # br label %if.end.6
      lw      t1, 1056(sp)
      mv      t0, t1
      j       main_if.end.6
main_if.else.6:
      # br label %if.end.6
      lw      t1, 1024(sp)
      mv      t0, t1
      j       main_if.end.6
main_if.end.6:
      sw      t0, 1060(sp)
      # br i1 %__tmp.194, label %if.then.7, label %if.else.7
      lw      t0, 1060(sp)
      beqz     t0, main_jump11
      j       main_if.then.7
main_jump11:
      j       main_if.else.7
main_if.then.7:
      # %__tmp.195 = load ptr, ptr %_step.0
      lw      t1, 104(sp)
      lw      t0, 0(t1)
      sw      t0, 1064(sp)
      # %__tmp.196 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      sw      t0, 1068(sp)
      # %__tmp.197 = getelementptr ptr, ptr %__tmp.195, i32 %__tmp.196
      lw      t0, 1068(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 1064(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 1072(sp)
      # %__tmp.198 = load ptr, ptr %__tmp.197
      lw      t1, 1072(sp)
      lw      t0, 0(t1)
      sw      t0, 1076(sp)
      # %__tmp.199 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      sw      t0, 1080(sp)
      # %__tmp.200 = getelementptr i32, ptr %__tmp.198, i32 %__tmp.199
      lw      t0, 1080(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 1076(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 1084(sp)
      # %__tmp.201 = load i32, ptr %__tmp.200
      lw      t1, 1084(sp)
      lw      t0, 0(t1)
      sw      t0, 1088(sp)
      # %__tmp.202 = sub i32 0, 1
      li      t1, 0
      li      t2, 1
      sub     t0, t1, t2
      sw      t0, 1092(sp)
      # %__tmp.203 = icmp eq i32 %__tmp.201, %__tmp.202
      lw      t1, 1088(sp)
      lw      t2, 1092(sp)
      sub     t0, t1, t2
      seqz    t3, t0
      mv      t0, t3
      sw      t0, 1096(sp)
      # br label %if.end.7
      lw      t1, 1096(sp)
      mv      t0, t1
      j       main_if.end.7
main_if.else.7:
      # br label %if.end.7
      lw      t1, 1060(sp)
      mv      t0, t1
      j       main_if.end.7
main_if.end.7:
      sw      t0, 1100(sp)
      # br i1 %__tmp.204, label %if.then8, label %if.merge8
      lw      t0, 1100(sp)
      beqz     t0, main_jump12
      j       main_if.then8
main_jump12:
      j       main_if.merge8
main_if.then8:
      # %__tmp.205 = load i32, ptr %_tail.0
      lw      t1, 48(sp)
      lw      t0, 0(t1)
      sw      t0, 1104(sp)
      # %__tmp.206 = load i32, ptr %_tail.0
      lw      t1, 48(sp)
      lw      t0, 0(t1)
      sw      t0, 1108(sp)
      # %__tmp.207 = add i32 %__tmp.206, 1
      li      t2, 1
      lw      t1, 1108(sp)
      add     t0, t1, t2
      sw      t0, 1112(sp)
      # store i32 %__tmp.207, ptr %_tail.0
      lw      t0, 1112(sp)
      lw      t1, 48(sp)
      sw      t0, 0(t1)
      # %__tmp.208 = load ptr, ptr %_xlist.0
      lw      t1, 88(sp)
      lw      t0, 0(t1)
      sw      t0, 1116(sp)
      # %__tmp.209 = load i32, ptr %_tail.0
      lw      t1, 48(sp)
      lw      t0, 0(t1)
      sw      t0, 1120(sp)
      # %__tmp.210 = getelementptr i32, ptr %__tmp.208, i32 %__tmp.209
      lw      t0, 1120(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 1116(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 1124(sp)
      # %__tmp.211 = load i32, ptr %__tmp.210
      lw      t1, 1124(sp)
      lw      t0, 0(t1)
      sw      t0, 1128(sp)
      # %__tmp.212 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      sw      t0, 1132(sp)
      # store i32 %__tmp.212, ptr %__tmp.210
      lw      t0, 1132(sp)
      lw      t1, 1124(sp)
      sw      t0, 0(t1)
      # %__tmp.213 = load ptr, ptr %_ylist.0
      lw      t1, 96(sp)
      lw      t0, 0(t1)
      sw      t0, 1136(sp)
      # %__tmp.214 = load i32, ptr %_tail.0
      lw      t1, 48(sp)
      lw      t0, 0(t1)
      sw      t0, 1140(sp)
      # %__tmp.215 = getelementptr i32, ptr %__tmp.213, i32 %__tmp.214
      lw      t0, 1140(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 1136(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 1144(sp)
      # %__tmp.216 = load i32, ptr %__tmp.215
      lw      t1, 1144(sp)
      lw      t0, 0(t1)
      sw      t0, 1148(sp)
      # %__tmp.217 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      sw      t0, 1152(sp)
      # store i32 %__tmp.217, ptr %__tmp.215
      lw      t0, 1152(sp)
      lw      t1, 1144(sp)
      sw      t0, 0(t1)
      # %__tmp.218 = load ptr, ptr %_step.0
      lw      t1, 104(sp)
      lw      t0, 0(t1)
      sw      t0, 1156(sp)
      # %__tmp.219 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      sw      t0, 1160(sp)
      # %__tmp.220 = getelementptr ptr, ptr %__tmp.218, i32 %__tmp.219
      lw      t0, 1160(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 1156(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 1164(sp)
      # %__tmp.221 = load ptr, ptr %__tmp.220
      lw      t1, 1164(sp)
      lw      t0, 0(t1)
      sw      t0, 1168(sp)
      # %__tmp.222 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      sw      t0, 1172(sp)
      # %__tmp.223 = getelementptr i32, ptr %__tmp.221, i32 %__tmp.222
      lw      t0, 1172(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 1168(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 1176(sp)
      # %__tmp.224 = load i32, ptr %__tmp.223
      lw      t1, 1176(sp)
      lw      t0, 0(t1)
      sw      t0, 1180(sp)
      # %__tmp.225 = load i32, ptr %_now.0
      lw      t1, 64(sp)
      lw      t0, 0(t1)
      sw      t0, 1184(sp)
      # %__tmp.226 = add i32 %__tmp.225, 1
      li      t2, 1
      lw      t1, 1184(sp)
      add     t0, t1, t2
      sw      t0, 1188(sp)
      # store i32 %__tmp.226, ptr %__tmp.223
      lw      t0, 1188(sp)
      lw      t1, 1176(sp)
      sw      t0, 0(t1)
      # %__tmp.227 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      sw      t0, 1192(sp)
      # %__tmp.228 = load i32, ptr %_targetx.0
      lw      t1, 32(sp)
      lw      t0, 0(t1)
      sw      t0, 1196(sp)
      # %__tmp.229 = icmp eq i32 %__tmp.227, %__tmp.228
      lw      t1, 1192(sp)
      lw      t2, 1196(sp)
      sub     t0, t1, t2
      seqz    t3, t0
      mv      t0, t3
      sw      t0, 1200(sp)
      # br i1 %__tmp.229, label %if.then.9, label %if.else.9
      lw      t0, 1200(sp)
      beqz     t0, main_jump13
      j       main_if.then.9
main_jump13:
      j       main_if.else.9
main_if.then.9:
      # %__tmp.230 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      sw      t0, 1204(sp)
      # %__tmp.231 = load i32, ptr %_targety.0
      lw      t1, 40(sp)
      lw      t0, 0(t1)
      sw      t0, 1208(sp)
      # %__tmp.232 = icmp eq i32 %__tmp.230, %__tmp.231
      lw      t1, 1204(sp)
      lw      t2, 1208(sp)
      sub     t0, t1, t2
      seqz    t3, t0
      mv      t0, t3
      sw      t0, 1212(sp)
      # br label %if.end.9
      lw      t1, 1212(sp)
      mv      t0, t1
      j       main_if.end.9
main_if.else.9:
      # br label %if.end.9
      lw      t1, 1200(sp)
      mv      t0, t1
      j       main_if.end.9
main_if.end.9:
      sw      t0, 1216(sp)
      # br i1 %__tmp.233, label %if.then10, label %if.merge10
      lw      t0, 1216(sp)
      beqz     t0, main_jump14
      j       main_if.then10
main_jump14:
      j       main_if.merge10
main_if.then10:
      # %__tmp.234 = load i32, ptr %_ok.0
      lw      t1, 56(sp)
      lw      t0, 0(t1)
      sw      t0, 1220(sp)
      # store i32 1, ptr %_ok.0
      li      t0, 1
      lw      t1, 56(sp)
      sw      t0, 0(t1)
      # br label %if.merge10
      j       main_if.merge10
main_if.merge10:
      # br label %if.merge8
      j       main_if.merge8
main_if.merge8:
      # %__tmp.235 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      sw      t0, 1224(sp)
      # %__tmp.236 = load ptr, ptr %_xlist.0
      lw      t1, 88(sp)
      lw      t0, 0(t1)
      sw      t0, 1228(sp)
      # %__tmp.237 = load i32, ptr %_head.0
      lw      t1, 8(sp)
      lw      t0, 0(t1)
      sw      t0, 1232(sp)
      # %__tmp.238 = getelementptr i32, ptr %__tmp.236, i32 %__tmp.237
      lw      t0, 1232(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 1228(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 1236(sp)
      # %__tmp.239 = load i32, ptr %__tmp.238
      lw      t1, 1236(sp)
      lw      t0, 0(t1)
      sw      t0, 1240(sp)
      # %__tmp.240 = add i32 %__tmp.239, 1
      li      t2, 1
      lw      t1, 1240(sp)
      add     t0, t1, t2
      sw      t0, 1244(sp)
      # store i32 %__tmp.240, ptr %_x.0
      lw      t0, 1244(sp)
      lw      t1, 72(sp)
      sw      t0, 0(t1)
      # %__tmp.241 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      sw      t0, 1248(sp)
      # %__tmp.242 = load ptr, ptr %_ylist.0
      lw      t1, 96(sp)
      lw      t0, 0(t1)
      sw      t0, 1252(sp)
      # %__tmp.243 = load i32, ptr %_head.0
      lw      t1, 8(sp)
      lw      t0, 0(t1)
      sw      t0, 1256(sp)
      # %__tmp.244 = getelementptr i32, ptr %__tmp.242, i32 %__tmp.243
      lw      t0, 1256(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 1252(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 1260(sp)
      # %__tmp.245 = load i32, ptr %__tmp.244
      lw      t1, 1260(sp)
      lw      t0, 0(t1)
      sw      t0, 1264(sp)
      # %__tmp.246 = sub i32 %__tmp.245, 2
      li      t2, 2
      lw      t1, 1264(sp)
      sub     t0, t1, t2
      sw      t0, 1268(sp)
      # store i32 %__tmp.246, ptr %_y.0
      lw      t0, 1268(sp)
      lw      t1, 80(sp)
      sw      t0, 0(t1)
      # %__tmp.248 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      sw      t0, 1272(sp)
      # %__tmp.249 = load i32, ptr %_N.1
      lw      t1, 0(sp)
      lw      t0, 0(t1)
      sw      t0, 1276(sp)
      # %__tmp.247 = call i1 @check(i32 %__tmp.248, i32 %__tmp.249)
      lw      t0, 1272(sp)
      mv      a0, t0
      lw      t0, 1276(sp)
      mv      a1, t0
      sw      ra, 1280(sp)
      call    check
      mv      t0, a0
      sw      t0, 1300(sp)
      lw      ra, 1280(sp)
      lw      t0, 1284(sp)
      lw      t1, 1288(sp)
      lw      t2, 1292(sp)
      lw      t3, 1296(sp)
      # br i1 %__tmp.247, label %if.then.11, label %if.else.11
      lw      t0, 1300(sp)
      beqz     t0, main_jump15
      j       main_if.then.11
main_jump15:
      j       main_if.else.11
main_if.then.11:
      # %__tmp.251 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      sw      t0, 1304(sp)
      # %__tmp.252 = load i32, ptr %_N.1
      lw      t1, 0(sp)
      lw      t0, 0(t1)
      sw      t0, 1308(sp)
      # %__tmp.250 = call i1 @check(i32 %__tmp.251, i32 %__tmp.252)
      lw      t0, 1304(sp)
      mv      a0, t0
      lw      t0, 1308(sp)
      mv      a1, t0
      sw      ra, 1312(sp)
      call    check
      mv      t0, a0
      sw      t0, 1332(sp)
      lw      ra, 1312(sp)
      lw      t0, 1316(sp)
      lw      t1, 1320(sp)
      lw      t2, 1324(sp)
      lw      t3, 1328(sp)
      # br label %if.end.11
      lw      t1, 1332(sp)
      mv      t0, t1
      j       main_if.end.11
main_if.else.11:
      # br label %if.end.11
      lw      t1, 1300(sp)
      mv      t0, t1
      j       main_if.end.11
main_if.end.11:
      sw      t0, 1336(sp)
      # br i1 %__tmp.253, label %if.then.12, label %if.else.12
      lw      t0, 1336(sp)
      beqz     t0, main_jump16
      j       main_if.then.12
main_jump16:
      j       main_if.else.12
main_if.then.12:
      # %__tmp.254 = load ptr, ptr %_step.0
      lw      t1, 104(sp)
      lw      t0, 0(t1)
      sw      t0, 1340(sp)
      # %__tmp.255 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      sw      t0, 1344(sp)
      # %__tmp.256 = getelementptr ptr, ptr %__tmp.254, i32 %__tmp.255
      lw      t0, 1344(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 1340(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 1348(sp)
      # %__tmp.257 = load ptr, ptr %__tmp.256
      lw      t1, 1348(sp)
      lw      t0, 0(t1)
      sw      t0, 1352(sp)
      # %__tmp.258 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      sw      t0, 1356(sp)
      # %__tmp.259 = getelementptr i32, ptr %__tmp.257, i32 %__tmp.258
      lw      t0, 1356(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 1352(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 1360(sp)
      # %__tmp.260 = load i32, ptr %__tmp.259
      lw      t1, 1360(sp)
      lw      t0, 0(t1)
      sw      t0, 1364(sp)
      # %__tmp.261 = sub i32 0, 1
      li      t1, 0
      li      t2, 1
      sub     t0, t1, t2
      sw      t0, 1368(sp)
      # %__tmp.262 = icmp eq i32 %__tmp.260, %__tmp.261
      lw      t1, 1364(sp)
      lw      t2, 1368(sp)
      sub     t0, t1, t2
      seqz    t3, t0
      mv      t0, t3
      sw      t0, 1372(sp)
      # br label %if.end.12
      lw      t1, 1372(sp)
      mv      t0, t1
      j       main_if.end.12
main_if.else.12:
      # br label %if.end.12
      lw      t1, 1336(sp)
      mv      t0, t1
      j       main_if.end.12
main_if.end.12:
      sw      t0, 1376(sp)
      # br i1 %__tmp.263, label %if.then13, label %if.merge13
      lw      t0, 1376(sp)
      beqz     t0, main_jump17
      j       main_if.then13
main_jump17:
      j       main_if.merge13
main_if.then13:
      # %__tmp.264 = load i32, ptr %_tail.0
      lw      t1, 48(sp)
      lw      t0, 0(t1)
      sw      t0, 1380(sp)
      # %__tmp.265 = load i32, ptr %_tail.0
      lw      t1, 48(sp)
      lw      t0, 0(t1)
      sw      t0, 1384(sp)
      # %__tmp.266 = add i32 %__tmp.265, 1
      li      t2, 1
      lw      t1, 1384(sp)
      add     t0, t1, t2
      sw      t0, 1388(sp)
      # store i32 %__tmp.266, ptr %_tail.0
      lw      t0, 1388(sp)
      lw      t1, 48(sp)
      sw      t0, 0(t1)
      # %__tmp.267 = load ptr, ptr %_xlist.0
      lw      t1, 88(sp)
      lw      t0, 0(t1)
      sw      t0, 1392(sp)
      # %__tmp.268 = load i32, ptr %_tail.0
      lw      t1, 48(sp)
      lw      t0, 0(t1)
      sw      t0, 1396(sp)
      # %__tmp.269 = getelementptr i32, ptr %__tmp.267, i32 %__tmp.268
      lw      t0, 1396(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 1392(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 1400(sp)
      # %__tmp.270 = load i32, ptr %__tmp.269
      lw      t1, 1400(sp)
      lw      t0, 0(t1)
      sw      t0, 1404(sp)
      # %__tmp.271 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      sw      t0, 1408(sp)
      # store i32 %__tmp.271, ptr %__tmp.269
      lw      t0, 1408(sp)
      lw      t1, 1400(sp)
      sw      t0, 0(t1)
      # %__tmp.272 = load ptr, ptr %_ylist.0
      lw      t1, 96(sp)
      lw      t0, 0(t1)
      sw      t0, 1412(sp)
      # %__tmp.273 = load i32, ptr %_tail.0
      lw      t1, 48(sp)
      lw      t0, 0(t1)
      sw      t0, 1416(sp)
      # %__tmp.274 = getelementptr i32, ptr %__tmp.272, i32 %__tmp.273
      lw      t0, 1416(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 1412(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 1420(sp)
      # %__tmp.275 = load i32, ptr %__tmp.274
      lw      t1, 1420(sp)
      lw      t0, 0(t1)
      sw      t0, 1424(sp)
      # %__tmp.276 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      sw      t0, 1428(sp)
      # store i32 %__tmp.276, ptr %__tmp.274
      lw      t0, 1428(sp)
      lw      t1, 1420(sp)
      sw      t0, 0(t1)
      # %__tmp.277 = load ptr, ptr %_step.0
      lw      t1, 104(sp)
      lw      t0, 0(t1)
      sw      t0, 1432(sp)
      # %__tmp.278 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      sw      t0, 1436(sp)
      # %__tmp.279 = getelementptr ptr, ptr %__tmp.277, i32 %__tmp.278
      lw      t0, 1436(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 1432(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 1440(sp)
      # %__tmp.280 = load ptr, ptr %__tmp.279
      lw      t1, 1440(sp)
      lw      t0, 0(t1)
      sw      t0, 1444(sp)
      # %__tmp.281 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      sw      t0, 1448(sp)
      # %__tmp.282 = getelementptr i32, ptr %__tmp.280, i32 %__tmp.281
      lw      t0, 1448(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 1444(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 1452(sp)
      # %__tmp.283 = load i32, ptr %__tmp.282
      lw      t1, 1452(sp)
      lw      t0, 0(t1)
      sw      t0, 1456(sp)
      # %__tmp.284 = load i32, ptr %_now.0
      lw      t1, 64(sp)
      lw      t0, 0(t1)
      sw      t0, 1460(sp)
      # %__tmp.285 = add i32 %__tmp.284, 1
      li      t2, 1
      lw      t1, 1460(sp)
      add     t0, t1, t2
      sw      t0, 1464(sp)
      # store i32 %__tmp.285, ptr %__tmp.282
      lw      t0, 1464(sp)
      lw      t1, 1452(sp)
      sw      t0, 0(t1)
      # %__tmp.286 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      sw      t0, 1468(sp)
      # %__tmp.287 = load i32, ptr %_targetx.0
      lw      t1, 32(sp)
      lw      t0, 0(t1)
      sw      t0, 1472(sp)
      # %__tmp.288 = icmp eq i32 %__tmp.286, %__tmp.287
      lw      t1, 1468(sp)
      lw      t2, 1472(sp)
      sub     t0, t1, t2
      seqz    t3, t0
      mv      t0, t3
      sw      t0, 1476(sp)
      # br i1 %__tmp.288, label %if.then.14, label %if.else.14
      lw      t0, 1476(sp)
      beqz     t0, main_jump18
      j       main_if.then.14
main_jump18:
      j       main_if.else.14
main_if.then.14:
      # %__tmp.289 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      sw      t0, 1480(sp)
      # %__tmp.290 = load i32, ptr %_targety.0
      lw      t1, 40(sp)
      lw      t0, 0(t1)
      sw      t0, 1484(sp)
      # %__tmp.291 = icmp eq i32 %__tmp.289, %__tmp.290
      lw      t1, 1480(sp)
      lw      t2, 1484(sp)
      sub     t0, t1, t2
      seqz    t3, t0
      mv      t0, t3
      sw      t0, 1488(sp)
      # br label %if.end.14
      lw      t1, 1488(sp)
      mv      t0, t1
      j       main_if.end.14
main_if.else.14:
      # br label %if.end.14
      lw      t1, 1476(sp)
      mv      t0, t1
      j       main_if.end.14
main_if.end.14:
      sw      t0, 1492(sp)
      # br i1 %__tmp.292, label %if.then15, label %if.merge15
      lw      t0, 1492(sp)
      beqz     t0, main_jump19
      j       main_if.then15
main_jump19:
      j       main_if.merge15
main_if.then15:
      # %__tmp.293 = load i32, ptr %_ok.0
      lw      t1, 56(sp)
      lw      t0, 0(t1)
      sw      t0, 1496(sp)
      # store i32 1, ptr %_ok.0
      li      t0, 1
      lw      t1, 56(sp)
      sw      t0, 0(t1)
      # br label %if.merge15
      j       main_if.merge15
main_if.merge15:
      # br label %if.merge13
      j       main_if.merge13
main_if.merge13:
      # %__tmp.294 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      sw      t0, 1500(sp)
      # %__tmp.295 = load ptr, ptr %_xlist.0
      lw      t1, 88(sp)
      lw      t0, 0(t1)
      sw      t0, 1504(sp)
      # %__tmp.296 = load i32, ptr %_head.0
      lw      t1, 8(sp)
      lw      t0, 0(t1)
      sw      t0, 1508(sp)
      # %__tmp.297 = getelementptr i32, ptr %__tmp.295, i32 %__tmp.296
      lw      t0, 1508(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 1504(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 1512(sp)
      # %__tmp.298 = load i32, ptr %__tmp.297
      lw      t1, 1512(sp)
      lw      t0, 0(t1)
      sw      t0, 1516(sp)
      # %__tmp.299 = add i32 %__tmp.298, 1
      li      t2, 1
      lw      t1, 1516(sp)
      add     t0, t1, t2
      sw      t0, 1520(sp)
      # store i32 %__tmp.299, ptr %_x.0
      lw      t0, 1520(sp)
      lw      t1, 72(sp)
      sw      t0, 0(t1)
      # %__tmp.300 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      sw      t0, 1524(sp)
      # %__tmp.301 = load ptr, ptr %_ylist.0
      lw      t1, 96(sp)
      lw      t0, 0(t1)
      sw      t0, 1528(sp)
      # %__tmp.302 = load i32, ptr %_head.0
      lw      t1, 8(sp)
      lw      t0, 0(t1)
      sw      t0, 1532(sp)
      # %__tmp.303 = getelementptr i32, ptr %__tmp.301, i32 %__tmp.302
      lw      t0, 1532(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 1528(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 1536(sp)
      # %__tmp.304 = load i32, ptr %__tmp.303
      lw      t1, 1536(sp)
      lw      t0, 0(t1)
      sw      t0, 1540(sp)
      # %__tmp.305 = add i32 %__tmp.304, 2
      li      t2, 2
      lw      t1, 1540(sp)
      add     t0, t1, t2
      sw      t0, 1544(sp)
      # store i32 %__tmp.305, ptr %_y.0
      lw      t0, 1544(sp)
      lw      t1, 80(sp)
      sw      t0, 0(t1)
      # %__tmp.307 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      sw      t0, 1548(sp)
      # %__tmp.308 = load i32, ptr %_N.1
      lw      t1, 0(sp)
      lw      t0, 0(t1)
      sw      t0, 1552(sp)
      # %__tmp.306 = call i1 @check(i32 %__tmp.307, i32 %__tmp.308)
      lw      t0, 1548(sp)
      mv      a0, t0
      lw      t0, 1552(sp)
      mv      a1, t0
      sw      ra, 1556(sp)
      call    check
      mv      t0, a0
      sw      t0, 1576(sp)
      lw      ra, 1556(sp)
      lw      t0, 1560(sp)
      lw      t1, 1564(sp)
      lw      t2, 1568(sp)
      lw      t3, 1572(sp)
      # br i1 %__tmp.306, label %if.then.16, label %if.else.16
      lw      t0, 1576(sp)
      beqz     t0, main_jump20
      j       main_if.then.16
main_jump20:
      j       main_if.else.16
main_if.then.16:
      # %__tmp.310 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      sw      t0, 1580(sp)
      # %__tmp.311 = load i32, ptr %_N.1
      lw      t1, 0(sp)
      lw      t0, 0(t1)
      sw      t0, 1584(sp)
      # %__tmp.309 = call i1 @check(i32 %__tmp.310, i32 %__tmp.311)
      lw      t0, 1580(sp)
      mv      a0, t0
      lw      t0, 1584(sp)
      mv      a1, t0
      sw      ra, 1588(sp)
      call    check
      mv      t0, a0
      sw      t0, 1608(sp)
      lw      ra, 1588(sp)
      lw      t0, 1592(sp)
      lw      t1, 1596(sp)
      lw      t2, 1600(sp)
      lw      t3, 1604(sp)
      # br label %if.end.16
      lw      t1, 1608(sp)
      mv      t0, t1
      j       main_if.end.16
main_if.else.16:
      # br label %if.end.16
      lw      t1, 1576(sp)
      mv      t0, t1
      j       main_if.end.16
main_if.end.16:
      sw      t0, 1612(sp)
      # br i1 %__tmp.312, label %if.then.17, label %if.else.17
      lw      t0, 1612(sp)
      beqz     t0, main_jump21
      j       main_if.then.17
main_jump21:
      j       main_if.else.17
main_if.then.17:
      # %__tmp.313 = load ptr, ptr %_step.0
      lw      t1, 104(sp)
      lw      t0, 0(t1)
      sw      t0, 1616(sp)
      # %__tmp.314 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      sw      t0, 1620(sp)
      # %__tmp.315 = getelementptr ptr, ptr %__tmp.313, i32 %__tmp.314
      lw      t0, 1620(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 1616(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 1624(sp)
      # %__tmp.316 = load ptr, ptr %__tmp.315
      lw      t1, 1624(sp)
      lw      t0, 0(t1)
      sw      t0, 1628(sp)
      # %__tmp.317 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      sw      t0, 1632(sp)
      # %__tmp.318 = getelementptr i32, ptr %__tmp.316, i32 %__tmp.317
      lw      t0, 1632(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 1628(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 1636(sp)
      # %__tmp.319 = load i32, ptr %__tmp.318
      lw      t1, 1636(sp)
      lw      t0, 0(t1)
      sw      t0, 1640(sp)
      # %__tmp.320 = sub i32 0, 1
      li      t1, 0
      li      t2, 1
      sub     t0, t1, t2
      sw      t0, 1644(sp)
      # %__tmp.321 = icmp eq i32 %__tmp.319, %__tmp.320
      lw      t1, 1640(sp)
      lw      t2, 1644(sp)
      sub     t0, t1, t2
      seqz    t3, t0
      mv      t0, t3
      sw      t0, 1648(sp)
      # br label %if.end.17
      lw      t1, 1648(sp)
      mv      t0, t1
      j       main_if.end.17
main_if.else.17:
      # br label %if.end.17
      lw      t1, 1612(sp)
      mv      t0, t1
      j       main_if.end.17
main_if.end.17:
      sw      t0, 1652(sp)
      # br i1 %__tmp.322, label %if.then18, label %if.merge18
      lw      t0, 1652(sp)
      beqz     t0, main_jump22
      j       main_if.then18
main_jump22:
      j       main_if.merge18
main_if.then18:
      # %__tmp.323 = load i32, ptr %_tail.0
      lw      t1, 48(sp)
      lw      t0, 0(t1)
      sw      t0, 1656(sp)
      # %__tmp.324 = load i32, ptr %_tail.0
      lw      t1, 48(sp)
      lw      t0, 0(t1)
      sw      t0, 1660(sp)
      # %__tmp.325 = add i32 %__tmp.324, 1
      li      t2, 1
      lw      t1, 1660(sp)
      add     t0, t1, t2
      sw      t0, 1664(sp)
      # store i32 %__tmp.325, ptr %_tail.0
      lw      t0, 1664(sp)
      lw      t1, 48(sp)
      sw      t0, 0(t1)
      # %__tmp.326 = load ptr, ptr %_xlist.0
      lw      t1, 88(sp)
      lw      t0, 0(t1)
      sw      t0, 1668(sp)
      # %__tmp.327 = load i32, ptr %_tail.0
      lw      t1, 48(sp)
      lw      t0, 0(t1)
      sw      t0, 1672(sp)
      # %__tmp.328 = getelementptr i32, ptr %__tmp.326, i32 %__tmp.327
      lw      t0, 1672(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 1668(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 1676(sp)
      # %__tmp.329 = load i32, ptr %__tmp.328
      lw      t1, 1676(sp)
      lw      t0, 0(t1)
      sw      t0, 1680(sp)
      # %__tmp.330 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      sw      t0, 1684(sp)
      # store i32 %__tmp.330, ptr %__tmp.328
      lw      t0, 1684(sp)
      lw      t1, 1676(sp)
      sw      t0, 0(t1)
      # %__tmp.331 = load ptr, ptr %_ylist.0
      lw      t1, 96(sp)
      lw      t0, 0(t1)
      sw      t0, 1688(sp)
      # %__tmp.332 = load i32, ptr %_tail.0
      lw      t1, 48(sp)
      lw      t0, 0(t1)
      sw      t0, 1692(sp)
      # %__tmp.333 = getelementptr i32, ptr %__tmp.331, i32 %__tmp.332
      lw      t0, 1692(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 1688(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 1696(sp)
      # %__tmp.334 = load i32, ptr %__tmp.333
      lw      t1, 1696(sp)
      lw      t0, 0(t1)
      sw      t0, 1700(sp)
      # %__tmp.335 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      sw      t0, 1704(sp)
      # store i32 %__tmp.335, ptr %__tmp.333
      lw      t0, 1704(sp)
      lw      t1, 1696(sp)
      sw      t0, 0(t1)
      # %__tmp.336 = load ptr, ptr %_step.0
      lw      t1, 104(sp)
      lw      t0, 0(t1)
      sw      t0, 1708(sp)
      # %__tmp.337 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      sw      t0, 1712(sp)
      # %__tmp.338 = getelementptr ptr, ptr %__tmp.336, i32 %__tmp.337
      lw      t0, 1712(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 1708(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 1716(sp)
      # %__tmp.339 = load ptr, ptr %__tmp.338
      lw      t1, 1716(sp)
      lw      t0, 0(t1)
      sw      t0, 1720(sp)
      # %__tmp.340 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      sw      t0, 1724(sp)
      # %__tmp.341 = getelementptr i32, ptr %__tmp.339, i32 %__tmp.340
      lw      t0, 1724(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 1720(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 1728(sp)
      # %__tmp.342 = load i32, ptr %__tmp.341
      lw      t1, 1728(sp)
      lw      t0, 0(t1)
      sw      t0, 1732(sp)
      # %__tmp.343 = load i32, ptr %_now.0
      lw      t1, 64(sp)
      lw      t0, 0(t1)
      sw      t0, 1736(sp)
      # %__tmp.344 = add i32 %__tmp.343, 1
      li      t2, 1
      lw      t1, 1736(sp)
      add     t0, t1, t2
      sw      t0, 1740(sp)
      # store i32 %__tmp.344, ptr %__tmp.341
      lw      t0, 1740(sp)
      lw      t1, 1728(sp)
      sw      t0, 0(t1)
      # %__tmp.345 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      sw      t0, 1744(sp)
      # %__tmp.346 = load i32, ptr %_targetx.0
      lw      t1, 32(sp)
      lw      t0, 0(t1)
      sw      t0, 1748(sp)
      # %__tmp.347 = icmp eq i32 %__tmp.345, %__tmp.346
      lw      t1, 1744(sp)
      lw      t2, 1748(sp)
      sub     t0, t1, t2
      seqz    t3, t0
      mv      t0, t3
      sw      t0, 1752(sp)
      # br i1 %__tmp.347, label %if.then.19, label %if.else.19
      lw      t0, 1752(sp)
      beqz     t0, main_jump23
      j       main_if.then.19
main_jump23:
      j       main_if.else.19
main_if.then.19:
      # %__tmp.348 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      sw      t0, 1756(sp)
      # %__tmp.349 = load i32, ptr %_targety.0
      lw      t1, 40(sp)
      lw      t0, 0(t1)
      sw      t0, 1760(sp)
      # %__tmp.350 = icmp eq i32 %__tmp.348, %__tmp.349
      lw      t1, 1756(sp)
      lw      t2, 1760(sp)
      sub     t0, t1, t2
      seqz    t3, t0
      mv      t0, t3
      sw      t0, 1764(sp)
      # br label %if.end.19
      lw      t1, 1764(sp)
      mv      t0, t1
      j       main_if.end.19
main_if.else.19:
      # br label %if.end.19
      lw      t1, 1752(sp)
      mv      t0, t1
      j       main_if.end.19
main_if.end.19:
      sw      t0, 1768(sp)
      # br i1 %__tmp.351, label %if.then20, label %if.merge20
      lw      t0, 1768(sp)
      beqz     t0, main_jump24
      j       main_if.then20
main_jump24:
      j       main_if.merge20
main_if.then20:
      # %__tmp.352 = load i32, ptr %_ok.0
      lw      t1, 56(sp)
      lw      t0, 0(t1)
      sw      t0, 1772(sp)
      # store i32 1, ptr %_ok.0
      li      t0, 1
      lw      t1, 56(sp)
      sw      t0, 0(t1)
      # br label %if.merge20
      j       main_if.merge20
main_if.merge20:
      # br label %if.merge18
      j       main_if.merge18
main_if.merge18:
      # %__tmp.353 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      sw      t0, 1776(sp)
      # %__tmp.354 = load ptr, ptr %_xlist.0
      lw      t1, 88(sp)
      lw      t0, 0(t1)
      sw      t0, 1780(sp)
      # %__tmp.355 = load i32, ptr %_head.0
      lw      t1, 8(sp)
      lw      t0, 0(t1)
      sw      t0, 1784(sp)
      # %__tmp.356 = getelementptr i32, ptr %__tmp.354, i32 %__tmp.355
      lw      t0, 1784(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 1780(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 1788(sp)
      # %__tmp.357 = load i32, ptr %__tmp.356
      lw      t1, 1788(sp)
      lw      t0, 0(t1)
      sw      t0, 1792(sp)
      # %__tmp.358 = sub i32 %__tmp.357, 2
      li      t2, 2
      lw      t1, 1792(sp)
      sub     t0, t1, t2
      sw      t0, 1796(sp)
      # store i32 %__tmp.358, ptr %_x.0
      lw      t0, 1796(sp)
      lw      t1, 72(sp)
      sw      t0, 0(t1)
      # %__tmp.359 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      sw      t0, 1800(sp)
      # %__tmp.360 = load ptr, ptr %_ylist.0
      lw      t1, 96(sp)
      lw      t0, 0(t1)
      sw      t0, 1804(sp)
      # %__tmp.361 = load i32, ptr %_head.0
      lw      t1, 8(sp)
      lw      t0, 0(t1)
      sw      t0, 1808(sp)
      # %__tmp.362 = getelementptr i32, ptr %__tmp.360, i32 %__tmp.361
      lw      t0, 1808(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 1804(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 1812(sp)
      # %__tmp.363 = load i32, ptr %__tmp.362
      lw      t1, 1812(sp)
      lw      t0, 0(t1)
      sw      t0, 1816(sp)
      # %__tmp.364 = sub i32 %__tmp.363, 1
      li      t2, 1
      lw      t1, 1816(sp)
      sub     t0, t1, t2
      sw      t0, 1820(sp)
      # store i32 %__tmp.364, ptr %_y.0
      lw      t0, 1820(sp)
      lw      t1, 80(sp)
      sw      t0, 0(t1)
      # %__tmp.366 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      sw      t0, 1824(sp)
      # %__tmp.367 = load i32, ptr %_N.1
      lw      t1, 0(sp)
      lw      t0, 0(t1)
      sw      t0, 1828(sp)
      # %__tmp.365 = call i1 @check(i32 %__tmp.366, i32 %__tmp.367)
      lw      t0, 1824(sp)
      mv      a0, t0
      lw      t0, 1828(sp)
      mv      a1, t0
      sw      ra, 1832(sp)
      call    check
      mv      t0, a0
      sw      t0, 1852(sp)
      lw      ra, 1832(sp)
      lw      t0, 1836(sp)
      lw      t1, 1840(sp)
      lw      t2, 1844(sp)
      lw      t3, 1848(sp)
      # br i1 %__tmp.365, label %if.then.21, label %if.else.21
      lw      t0, 1852(sp)
      beqz     t0, main_jump25
      j       main_if.then.21
main_jump25:
      j       main_if.else.21
main_if.then.21:
      # %__tmp.369 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      sw      t0, 1856(sp)
      # %__tmp.370 = load i32, ptr %_N.1
      lw      t1, 0(sp)
      lw      t0, 0(t1)
      sw      t0, 1860(sp)
      # %__tmp.368 = call i1 @check(i32 %__tmp.369, i32 %__tmp.370)
      lw      t0, 1856(sp)
      mv      a0, t0
      lw      t0, 1860(sp)
      mv      a1, t0
      sw      ra, 1864(sp)
      call    check
      mv      t0, a0
      sw      t0, 1884(sp)
      lw      ra, 1864(sp)
      lw      t0, 1868(sp)
      lw      t1, 1872(sp)
      lw      t2, 1876(sp)
      lw      t3, 1880(sp)
      # br label %if.end.21
      lw      t1, 1884(sp)
      mv      t0, t1
      j       main_if.end.21
main_if.else.21:
      # br label %if.end.21
      lw      t1, 1852(sp)
      mv      t0, t1
      j       main_if.end.21
main_if.end.21:
      sw      t0, 1888(sp)
      # br i1 %__tmp.371, label %if.then.22, label %if.else.22
      lw      t0, 1888(sp)
      beqz     t0, main_jump26
      j       main_if.then.22
main_jump26:
      j       main_if.else.22
main_if.then.22:
      # %__tmp.372 = load ptr, ptr %_step.0
      lw      t1, 104(sp)
      lw      t0, 0(t1)
      sw      t0, 1892(sp)
      # %__tmp.373 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      sw      t0, 1896(sp)
      # %__tmp.374 = getelementptr ptr, ptr %__tmp.372, i32 %__tmp.373
      lw      t0, 1896(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 1892(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 1900(sp)
      # %__tmp.375 = load ptr, ptr %__tmp.374
      lw      t1, 1900(sp)
      lw      t0, 0(t1)
      sw      t0, 1904(sp)
      # %__tmp.376 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      sw      t0, 1908(sp)
      # %__tmp.377 = getelementptr i32, ptr %__tmp.375, i32 %__tmp.376
      lw      t0, 1908(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 1904(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 1912(sp)
      # %__tmp.378 = load i32, ptr %__tmp.377
      lw      t1, 1912(sp)
      lw      t0, 0(t1)
      sw      t0, 1916(sp)
      # %__tmp.379 = sub i32 0, 1
      li      t1, 0
      li      t2, 1
      sub     t0, t1, t2
      sw      t0, 1920(sp)
      # %__tmp.380 = icmp eq i32 %__tmp.378, %__tmp.379
      lw      t1, 1916(sp)
      lw      t2, 1920(sp)
      sub     t0, t1, t2
      seqz    t3, t0
      mv      t0, t3
      sw      t0, 1924(sp)
      # br label %if.end.22
      lw      t1, 1924(sp)
      mv      t0, t1
      j       main_if.end.22
main_if.else.22:
      # br label %if.end.22
      lw      t1, 1888(sp)
      mv      t0, t1
      j       main_if.end.22
main_if.end.22:
      sw      t0, 1928(sp)
      # br i1 %__tmp.381, label %if.then23, label %if.merge23
      lw      t0, 1928(sp)
      beqz     t0, main_jump27
      j       main_if.then23
main_jump27:
      j       main_if.merge23
main_if.then23:
      # %__tmp.382 = load i32, ptr %_tail.0
      lw      t1, 48(sp)
      lw      t0, 0(t1)
      sw      t0, 1932(sp)
      # %__tmp.383 = load i32, ptr %_tail.0
      lw      t1, 48(sp)
      lw      t0, 0(t1)
      sw      t0, 1936(sp)
      # %__tmp.384 = add i32 %__tmp.383, 1
      li      t2, 1
      lw      t1, 1936(sp)
      add     t0, t1, t2
      sw      t0, 1940(sp)
      # store i32 %__tmp.384, ptr %_tail.0
      lw      t0, 1940(sp)
      lw      t1, 48(sp)
      sw      t0, 0(t1)
      # %__tmp.385 = load ptr, ptr %_xlist.0
      lw      t1, 88(sp)
      lw      t0, 0(t1)
      sw      t0, 1944(sp)
      # %__tmp.386 = load i32, ptr %_tail.0
      lw      t1, 48(sp)
      lw      t0, 0(t1)
      sw      t0, 1948(sp)
      # %__tmp.387 = getelementptr i32, ptr %__tmp.385, i32 %__tmp.386
      lw      t0, 1948(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 1944(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 1952(sp)
      # %__tmp.388 = load i32, ptr %__tmp.387
      lw      t1, 1952(sp)
      lw      t0, 0(t1)
      sw      t0, 1956(sp)
      # %__tmp.389 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      sw      t0, 1960(sp)
      # store i32 %__tmp.389, ptr %__tmp.387
      lw      t0, 1960(sp)
      lw      t1, 1952(sp)
      sw      t0, 0(t1)
      # %__tmp.390 = load ptr, ptr %_ylist.0
      lw      t1, 96(sp)
      lw      t0, 0(t1)
      sw      t0, 1964(sp)
      # %__tmp.391 = load i32, ptr %_tail.0
      lw      t1, 48(sp)
      lw      t0, 0(t1)
      sw      t0, 1968(sp)
      # %__tmp.392 = getelementptr i32, ptr %__tmp.390, i32 %__tmp.391
      lw      t0, 1968(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 1964(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 1972(sp)
      # %__tmp.393 = load i32, ptr %__tmp.392
      lw      t1, 1972(sp)
      lw      t0, 0(t1)
      sw      t0, 1976(sp)
      # %__tmp.394 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      sw      t0, 1980(sp)
      # store i32 %__tmp.394, ptr %__tmp.392
      lw      t0, 1980(sp)
      lw      t1, 1972(sp)
      sw      t0, 0(t1)
      # %__tmp.395 = load ptr, ptr %_step.0
      lw      t1, 104(sp)
      lw      t0, 0(t1)
      sw      t0, 1984(sp)
      # %__tmp.396 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      sw      t0, 1988(sp)
      # %__tmp.397 = getelementptr ptr, ptr %__tmp.395, i32 %__tmp.396
      lw      t0, 1988(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 1984(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 1992(sp)
      # %__tmp.398 = load ptr, ptr %__tmp.397
      lw      t1, 1992(sp)
      lw      t0, 0(t1)
      sw      t0, 1996(sp)
      # %__tmp.399 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      sw      t0, 2000(sp)
      # %__tmp.400 = getelementptr i32, ptr %__tmp.398, i32 %__tmp.399
      lw      t0, 2000(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 1996(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 2004(sp)
      # %__tmp.401 = load i32, ptr %__tmp.400
      lw      t1, 2004(sp)
      lw      t0, 0(t1)
      sw      t0, 2008(sp)
      # %__tmp.402 = load i32, ptr %_now.0
      lw      t1, 64(sp)
      lw      t0, 0(t1)
      sw      t0, 2012(sp)
      # %__tmp.403 = add i32 %__tmp.402, 1
      li      t2, 1
      lw      t1, 2012(sp)
      add     t0, t1, t2
      sw      t0, 2016(sp)
      # store i32 %__tmp.403, ptr %__tmp.400
      lw      t0, 2016(sp)
      lw      t1, 2004(sp)
      sw      t0, 0(t1)
      # %__tmp.404 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      sw      t0, 2020(sp)
      # %__tmp.405 = load i32, ptr %_targetx.0
      lw      t1, 32(sp)
      lw      t0, 0(t1)
      sw      t0, 2024(sp)
      # %__tmp.406 = icmp eq i32 %__tmp.404, %__tmp.405
      lw      t1, 2020(sp)
      lw      t2, 2024(sp)
      sub     t0, t1, t2
      seqz    t3, t0
      mv      t0, t3
      sw      t0, 2028(sp)
      # br i1 %__tmp.406, label %if.then.24, label %if.else.24
      lw      t0, 2028(sp)
      beqz     t0, main_jump28
      j       main_if.then.24
main_jump28:
      j       main_if.else.24
main_if.then.24:
      # %__tmp.407 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      sw      t0, 2032(sp)
      # %__tmp.408 = load i32, ptr %_targety.0
      lw      t1, 40(sp)
      lw      t0, 0(t1)
      sw      t0, 2036(sp)
      # %__tmp.409 = icmp eq i32 %__tmp.407, %__tmp.408
      lw      t1, 2032(sp)
      lw      t2, 2036(sp)
      sub     t0, t1, t2
      seqz    t3, t0
      mv      t0, t3
      sw      t0, 2040(sp)
      # br label %if.end.24
      lw      t1, 2040(sp)
      mv      t0, t1
      j       main_if.end.24
main_if.else.24:
      # br label %if.end.24
      lw      t1, 2028(sp)
      mv      t0, t1
      j       main_if.end.24
main_if.end.24:
      sw      t0, 2044(sp)
      # br i1 %__tmp.410, label %if.then25, label %if.merge25
      lw      t0, 2044(sp)
      beqz     t0, main_jump29
      j       main_if.then25
main_jump29:
      j       main_if.merge25
main_if.then25:
      # %__tmp.411 = load i32, ptr %_ok.0
      lw      t1, 56(sp)
      lw      t0, 0(t1)
      li      t4, 2048
      add     t4, sp, t4
      sw      t0, 0(t4)
      # store i32 1, ptr %_ok.0
      li      t0, 1
      lw      t1, 56(sp)
      sw      t0, 0(t1)
      # br label %if.merge25
      j       main_if.merge25
main_if.merge25:
      # br label %if.merge23
      j       main_if.merge23
main_if.merge23:
      # %__tmp.412 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      li      t4, 2052
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.413 = load ptr, ptr %_xlist.0
      lw      t1, 88(sp)
      lw      t0, 0(t1)
      li      t4, 2056
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.414 = load i32, ptr %_head.0
      lw      t1, 8(sp)
      lw      t0, 0(t1)
      li      t4, 2060
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.415 = getelementptr i32, ptr %__tmp.413, i32 %__tmp.414
      lw      t0, 0(t4)
      li      t1, 4
      mul     t2, t0, t1
      li      t4, 2056
      add     t4, sp, t4
      lw      t0, 0(t4)
      add     t3, t0, t2
      mv      t0, t3
      li      t4, 2064
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.416 = load i32, ptr %__tmp.415
      lw      t1, 0(t4)
      lw      t0, 0(t1)
      li      t4, 2068
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.417 = sub i32 %__tmp.416, 2
      li      t2, 2
      lw      t1, 0(t4)
      sub     t0, t1, t2
      li      t4, 2072
      add     t4, sp, t4
      sw      t0, 0(t4)
      # store i32 %__tmp.417, ptr %_x.0
      lw      t0, 0(t4)
      lw      t1, 72(sp)
      sw      t0, 0(t1)
      # %__tmp.418 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      li      t4, 2076
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.419 = load ptr, ptr %_ylist.0
      lw      t1, 96(sp)
      lw      t0, 0(t1)
      li      t4, 2080
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.420 = load i32, ptr %_head.0
      lw      t1, 8(sp)
      lw      t0, 0(t1)
      li      t4, 2084
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.421 = getelementptr i32, ptr %__tmp.419, i32 %__tmp.420
      lw      t0, 0(t4)
      li      t1, 4
      mul     t2, t0, t1
      li      t4, 2080
      add     t4, sp, t4
      lw      t0, 0(t4)
      add     t3, t0, t2
      mv      t0, t3
      li      t4, 2088
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.422 = load i32, ptr %__tmp.421
      lw      t1, 0(t4)
      lw      t0, 0(t1)
      li      t4, 2092
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.423 = add i32 %__tmp.422, 1
      li      t2, 1
      lw      t1, 0(t4)
      add     t0, t1, t2
      li      t4, 2096
      add     t4, sp, t4
      sw      t0, 0(t4)
      # store i32 %__tmp.423, ptr %_y.0
      lw      t0, 0(t4)
      lw      t1, 80(sp)
      sw      t0, 0(t1)
      # %__tmp.425 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      li      t4, 2100
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.426 = load i32, ptr %_N.1
      lw      t1, 0(sp)
      lw      t0, 0(t1)
      li      t4, 2104
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.424 = call i1 @check(i32 %__tmp.425, i32 %__tmp.426)
      li      t4, 2100
      add     t4, sp, t4
      lw      t0, 0(t4)
      mv      a0, t0
      li      t4, 2104
      add     t4, sp, t4
      lw      t0, 0(t4)
      mv      a1, t0
      li      t4, 2108
      add     t4, sp, t4
      sw      ra, 0(t4)
      sw      t0, 4(t4)
      sw      t1, 8(t4)
      sw      t2, 12(t4)
      sw      t3, 16(t4)
      call    check
      mv      t0, a0
      li      t4, 2128
      add     t4, sp, t4
      sw      t0, 0(t4)
      li      t4, 2108
      add     t4, sp, t4
      lw      ra, 0(t4)
      lw      t0, 4(t4)
      lw      t1, 8(t4)
      lw      t2, 12(t4)
      lw      t3, 16(t4)
      # br i1 %__tmp.424, label %if.then.26, label %if.else.26
      li      t4, 2128
      add     t4, sp, t4
      lw      t0, 0(t4)
      beqz     t0, main_jump30
      j       main_if.then.26
main_jump30:
      j       main_if.else.26
main_if.then.26:
      # %__tmp.428 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      li      t4, 2132
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.429 = load i32, ptr %_N.1
      lw      t1, 0(sp)
      lw      t0, 0(t1)
      li      t4, 2136
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.427 = call i1 @check(i32 %__tmp.428, i32 %__tmp.429)
      li      t4, 2132
      add     t4, sp, t4
      lw      t0, 0(t4)
      mv      a0, t0
      li      t4, 2136
      add     t4, sp, t4
      lw      t0, 0(t4)
      mv      a1, t0
      li      t4, 2140
      add     t4, sp, t4
      sw      ra, 0(t4)
      sw      t0, 4(t4)
      sw      t1, 8(t4)
      sw      t2, 12(t4)
      sw      t3, 16(t4)
      call    check
      mv      t0, a0
      li      t4, 2160
      add     t4, sp, t4
      sw      t0, 0(t4)
      li      t4, 2140
      add     t4, sp, t4
      lw      ra, 0(t4)
      lw      t0, 4(t4)
      lw      t1, 8(t4)
      lw      t2, 12(t4)
      lw      t3, 16(t4)
      # br label %if.end.26
      li      t4, 2160
      add     t4, sp, t4
      lw      t1, 0(t4)
      mv      t0, t1
      j       main_if.end.26
main_if.else.26:
      # br label %if.end.26
      li      t4, 2128
      add     t4, sp, t4
      lw      t1, 0(t4)
      mv      t0, t1
      j       main_if.end.26
main_if.end.26:
      li      t4, 2164
      add     t4, sp, t4
      sw      t0, 0(t4)
      # br i1 %__tmp.430, label %if.then.27, label %if.else.27
      lw      t0, 0(t4)
      beqz     t0, main_jump31
      j       main_if.then.27
main_jump31:
      j       main_if.else.27
main_if.then.27:
      # %__tmp.431 = load ptr, ptr %_step.0
      lw      t1, 104(sp)
      lw      t0, 0(t1)
      li      t4, 2168
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.432 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      li      t4, 2172
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.433 = getelementptr ptr, ptr %__tmp.431, i32 %__tmp.432
      lw      t0, 0(t4)
      li      t1, 4
      mul     t2, t0, t1
      li      t4, 2168
      add     t4, sp, t4
      lw      t0, 0(t4)
      add     t3, t0, t2
      mv      t0, t3
      li      t4, 2176
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.434 = load ptr, ptr %__tmp.433
      lw      t1, 0(t4)
      lw      t0, 0(t1)
      li      t4, 2180
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.435 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      li      t4, 2184
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.436 = getelementptr i32, ptr %__tmp.434, i32 %__tmp.435
      lw      t0, 0(t4)
      li      t1, 4
      mul     t2, t0, t1
      li      t4, 2180
      add     t4, sp, t4
      lw      t0, 0(t4)
      add     t3, t0, t2
      mv      t0, t3
      li      t4, 2188
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.437 = load i32, ptr %__tmp.436
      lw      t1, 0(t4)
      lw      t0, 0(t1)
      li      t4, 2192
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.438 = sub i32 0, 1
      li      t1, 0
      li      t2, 1
      sub     t0, t1, t2
      li      t4, 2196
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.439 = icmp eq i32 %__tmp.437, %__tmp.438
      li      t4, 2192
      add     t4, sp, t4
      lw      t1, 0(t4)
      li      t4, 2196
      add     t4, sp, t4
      lw      t2, 0(t4)
      sub     t0, t1, t2
      seqz    t3, t0
      mv      t0, t3
      li      t4, 2200
      add     t4, sp, t4
      sw      t0, 0(t4)
      # br label %if.end.27
      lw      t1, 0(t4)
      mv      t0, t1
      j       main_if.end.27
main_if.else.27:
      # br label %if.end.27
      li      t4, 2164
      add     t4, sp, t4
      lw      t1, 0(t4)
      mv      t0, t1
      j       main_if.end.27
main_if.end.27:
      li      t4, 2204
      add     t4, sp, t4
      sw      t0, 0(t4)
      # br i1 %__tmp.440, label %if.then28, label %if.merge28
      lw      t0, 0(t4)
      beqz     t0, main_jump32
      j       main_if.then28
main_jump32:
      j       main_if.merge28
main_if.then28:
      # %__tmp.441 = load i32, ptr %_tail.0
      lw      t1, 48(sp)
      lw      t0, 0(t1)
      li      t4, 2208
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.442 = load i32, ptr %_tail.0
      lw      t1, 48(sp)
      lw      t0, 0(t1)
      li      t4, 2212
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.443 = add i32 %__tmp.442, 1
      li      t2, 1
      lw      t1, 0(t4)
      add     t0, t1, t2
      li      t4, 2216
      add     t4, sp, t4
      sw      t0, 0(t4)
      # store i32 %__tmp.443, ptr %_tail.0
      lw      t0, 0(t4)
      lw      t1, 48(sp)
      sw      t0, 0(t1)
      # %__tmp.444 = load ptr, ptr %_xlist.0
      lw      t1, 88(sp)
      lw      t0, 0(t1)
      li      t4, 2220
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.445 = load i32, ptr %_tail.0
      lw      t1, 48(sp)
      lw      t0, 0(t1)
      li      t4, 2224
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.446 = getelementptr i32, ptr %__tmp.444, i32 %__tmp.445
      lw      t0, 0(t4)
      li      t1, 4
      mul     t2, t0, t1
      li      t4, 2220
      add     t4, sp, t4
      lw      t0, 0(t4)
      add     t3, t0, t2
      mv      t0, t3
      li      t4, 2228
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.447 = load i32, ptr %__tmp.446
      lw      t1, 0(t4)
      lw      t0, 0(t1)
      li      t4, 2232
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.448 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      li      t4, 2236
      add     t4, sp, t4
      sw      t0, 0(t4)
      # store i32 %__tmp.448, ptr %__tmp.446
      lw      t0, 0(t4)
      li      t4, 2228
      add     t4, sp, t4
      lw      t1, 0(t4)
      sw      t0, 0(t1)
      # %__tmp.449 = load ptr, ptr %_ylist.0
      lw      t1, 96(sp)
      lw      t0, 0(t1)
      li      t4, 2240
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.450 = load i32, ptr %_tail.0
      lw      t1, 48(sp)
      lw      t0, 0(t1)
      li      t4, 2244
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.451 = getelementptr i32, ptr %__tmp.449, i32 %__tmp.450
      lw      t0, 0(t4)
      li      t1, 4
      mul     t2, t0, t1
      li      t4, 2240
      add     t4, sp, t4
      lw      t0, 0(t4)
      add     t3, t0, t2
      mv      t0, t3
      li      t4, 2248
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.452 = load i32, ptr %__tmp.451
      lw      t1, 0(t4)
      lw      t0, 0(t1)
      li      t4, 2252
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.453 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      li      t4, 2256
      add     t4, sp, t4
      sw      t0, 0(t4)
      # store i32 %__tmp.453, ptr %__tmp.451
      lw      t0, 0(t4)
      li      t4, 2248
      add     t4, sp, t4
      lw      t1, 0(t4)
      sw      t0, 0(t1)
      # %__tmp.454 = load ptr, ptr %_step.0
      lw      t1, 104(sp)
      lw      t0, 0(t1)
      li      t4, 2260
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.455 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      li      t4, 2264
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.456 = getelementptr ptr, ptr %__tmp.454, i32 %__tmp.455
      lw      t0, 0(t4)
      li      t1, 4
      mul     t2, t0, t1
      li      t4, 2260
      add     t4, sp, t4
      lw      t0, 0(t4)
      add     t3, t0, t2
      mv      t0, t3
      li      t4, 2268
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.457 = load ptr, ptr %__tmp.456
      lw      t1, 0(t4)
      lw      t0, 0(t1)
      li      t4, 2272
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.458 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      li      t4, 2276
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.459 = getelementptr i32, ptr %__tmp.457, i32 %__tmp.458
      lw      t0, 0(t4)
      li      t1, 4
      mul     t2, t0, t1
      li      t4, 2272
      add     t4, sp, t4
      lw      t0, 0(t4)
      add     t3, t0, t2
      mv      t0, t3
      li      t4, 2280
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.460 = load i32, ptr %__tmp.459
      lw      t1, 0(t4)
      lw      t0, 0(t1)
      li      t4, 2284
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.461 = load i32, ptr %_now.0
      lw      t1, 64(sp)
      lw      t0, 0(t1)
      li      t4, 2288
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.462 = add i32 %__tmp.461, 1
      li      t2, 1
      lw      t1, 0(t4)
      add     t0, t1, t2
      li      t4, 2292
      add     t4, sp, t4
      sw      t0, 0(t4)
      # store i32 %__tmp.462, ptr %__tmp.459
      lw      t0, 0(t4)
      li      t4, 2280
      add     t4, sp, t4
      lw      t1, 0(t4)
      sw      t0, 0(t1)
      # %__tmp.463 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      li      t4, 2296
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.464 = load i32, ptr %_targetx.0
      lw      t1, 32(sp)
      lw      t0, 0(t1)
      li      t4, 2300
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.465 = icmp eq i32 %__tmp.463, %__tmp.464
      li      t4, 2296
      add     t4, sp, t4
      lw      t1, 0(t4)
      li      t4, 2300
      add     t4, sp, t4
      lw      t2, 0(t4)
      sub     t0, t1, t2
      seqz    t3, t0
      mv      t0, t3
      li      t4, 2304
      add     t4, sp, t4
      sw      t0, 0(t4)
      # br i1 %__tmp.465, label %if.then.29, label %if.else.29
      lw      t0, 0(t4)
      beqz     t0, main_jump33
      j       main_if.then.29
main_jump33:
      j       main_if.else.29
main_if.then.29:
      # %__tmp.466 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      li      t4, 2308
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.467 = load i32, ptr %_targety.0
      lw      t1, 40(sp)
      lw      t0, 0(t1)
      li      t4, 2312
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.468 = icmp eq i32 %__tmp.466, %__tmp.467
      li      t4, 2308
      add     t4, sp, t4
      lw      t1, 0(t4)
      li      t4, 2312
      add     t4, sp, t4
      lw      t2, 0(t4)
      sub     t0, t1, t2
      seqz    t3, t0
      mv      t0, t3
      li      t4, 2316
      add     t4, sp, t4
      sw      t0, 0(t4)
      # br label %if.end.29
      lw      t1, 0(t4)
      mv      t0, t1
      j       main_if.end.29
main_if.else.29:
      # br label %if.end.29
      li      t4, 2304
      add     t4, sp, t4
      lw      t1, 0(t4)
      mv      t0, t1
      j       main_if.end.29
main_if.end.29:
      li      t4, 2320
      add     t4, sp, t4
      sw      t0, 0(t4)
      # br i1 %__tmp.469, label %if.then30, label %if.merge30
      lw      t0, 0(t4)
      beqz     t0, main_jump34
      j       main_if.then30
main_jump34:
      j       main_if.merge30
main_if.then30:
      # %__tmp.470 = load i32, ptr %_ok.0
      lw      t1, 56(sp)
      lw      t0, 0(t1)
      li      t4, 2324
      add     t4, sp, t4
      sw      t0, 0(t4)
      # store i32 1, ptr %_ok.0
      li      t0, 1
      lw      t1, 56(sp)
      sw      t0, 0(t1)
      # br label %if.merge30
      j       main_if.merge30
main_if.merge30:
      # br label %if.merge28
      j       main_if.merge28
main_if.merge28:
      # %__tmp.471 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      li      t4, 2328
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.472 = load ptr, ptr %_xlist.0
      lw      t1, 88(sp)
      lw      t0, 0(t1)
      li      t4, 2332
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.473 = load i32, ptr %_head.0
      lw      t1, 8(sp)
      lw      t0, 0(t1)
      li      t4, 2336
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.474 = getelementptr i32, ptr %__tmp.472, i32 %__tmp.473
      lw      t0, 0(t4)
      li      t1, 4
      mul     t2, t0, t1
      li      t4, 2332
      add     t4, sp, t4
      lw      t0, 0(t4)
      add     t3, t0, t2
      mv      t0, t3
      li      t4, 2340
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.475 = load i32, ptr %__tmp.474
      lw      t1, 0(t4)
      lw      t0, 0(t1)
      li      t4, 2344
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.476 = add i32 %__tmp.475, 2
      li      t2, 2
      lw      t1, 0(t4)
      add     t0, t1, t2
      li      t4, 2348
      add     t4, sp, t4
      sw      t0, 0(t4)
      # store i32 %__tmp.476, ptr %_x.0
      lw      t0, 0(t4)
      lw      t1, 72(sp)
      sw      t0, 0(t1)
      # %__tmp.477 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      li      t4, 2352
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.478 = load ptr, ptr %_ylist.0
      lw      t1, 96(sp)
      lw      t0, 0(t1)
      li      t4, 2356
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.479 = load i32, ptr %_head.0
      lw      t1, 8(sp)
      lw      t0, 0(t1)
      li      t4, 2360
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.480 = getelementptr i32, ptr %__tmp.478, i32 %__tmp.479
      lw      t0, 0(t4)
      li      t1, 4
      mul     t2, t0, t1
      li      t4, 2356
      add     t4, sp, t4
      lw      t0, 0(t4)
      add     t3, t0, t2
      mv      t0, t3
      li      t4, 2364
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.481 = load i32, ptr %__tmp.480
      lw      t1, 0(t4)
      lw      t0, 0(t1)
      li      t4, 2368
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.482 = sub i32 %__tmp.481, 1
      li      t2, 1
      lw      t1, 0(t4)
      sub     t0, t1, t2
      li      t4, 2372
      add     t4, sp, t4
      sw      t0, 0(t4)
      # store i32 %__tmp.482, ptr %_y.0
      lw      t0, 0(t4)
      lw      t1, 80(sp)
      sw      t0, 0(t1)
      # %__tmp.484 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      li      t4, 2376
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.485 = load i32, ptr %_N.1
      lw      t1, 0(sp)
      lw      t0, 0(t1)
      li      t4, 2380
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.483 = call i1 @check(i32 %__tmp.484, i32 %__tmp.485)
      li      t4, 2376
      add     t4, sp, t4
      lw      t0, 0(t4)
      mv      a0, t0
      li      t4, 2380
      add     t4, sp, t4
      lw      t0, 0(t4)
      mv      a1, t0
      li      t4, 2384
      add     t4, sp, t4
      sw      ra, 0(t4)
      sw      t0, 4(t4)
      sw      t1, 8(t4)
      sw      t2, 12(t4)
      sw      t3, 16(t4)
      call    check
      mv      t0, a0
      li      t4, 2404
      add     t4, sp, t4
      sw      t0, 0(t4)
      li      t4, 2384
      add     t4, sp, t4
      lw      ra, 0(t4)
      lw      t0, 4(t4)
      lw      t1, 8(t4)
      lw      t2, 12(t4)
      lw      t3, 16(t4)
      # br i1 %__tmp.483, label %if.then.31, label %if.else.31
      li      t4, 2404
      add     t4, sp, t4
      lw      t0, 0(t4)
      beqz     t0, main_jump35
      j       main_if.then.31
main_jump35:
      j       main_if.else.31
main_if.then.31:
      # %__tmp.487 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      li      t4, 2408
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.488 = load i32, ptr %_N.1
      lw      t1, 0(sp)
      lw      t0, 0(t1)
      li      t4, 2412
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.486 = call i1 @check(i32 %__tmp.487, i32 %__tmp.488)
      li      t4, 2408
      add     t4, sp, t4
      lw      t0, 0(t4)
      mv      a0, t0
      li      t4, 2412
      add     t4, sp, t4
      lw      t0, 0(t4)
      mv      a1, t0
      li      t4, 2416
      add     t4, sp, t4
      sw      ra, 0(t4)
      sw      t0, 4(t4)
      sw      t1, 8(t4)
      sw      t2, 12(t4)
      sw      t3, 16(t4)
      call    check
      mv      t0, a0
      li      t4, 2436
      add     t4, sp, t4
      sw      t0, 0(t4)
      li      t4, 2416
      add     t4, sp, t4
      lw      ra, 0(t4)
      lw      t0, 4(t4)
      lw      t1, 8(t4)
      lw      t2, 12(t4)
      lw      t3, 16(t4)
      # br label %if.end.31
      li      t4, 2436
      add     t4, sp, t4
      lw      t1, 0(t4)
      mv      t0, t1
      j       main_if.end.31
main_if.else.31:
      # br label %if.end.31
      li      t4, 2404
      add     t4, sp, t4
      lw      t1, 0(t4)
      mv      t0, t1
      j       main_if.end.31
main_if.end.31:
      li      t4, 2440
      add     t4, sp, t4
      sw      t0, 0(t4)
      # br i1 %__tmp.489, label %if.then.32, label %if.else.32
      lw      t0, 0(t4)
      beqz     t0, main_jump36
      j       main_if.then.32
main_jump36:
      j       main_if.else.32
main_if.then.32:
      # %__tmp.490 = load ptr, ptr %_step.0
      lw      t1, 104(sp)
      lw      t0, 0(t1)
      li      t4, 2444
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.491 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      li      t4, 2448
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.492 = getelementptr ptr, ptr %__tmp.490, i32 %__tmp.491
      lw      t0, 0(t4)
      li      t1, 4
      mul     t2, t0, t1
      li      t4, 2444
      add     t4, sp, t4
      lw      t0, 0(t4)
      add     t3, t0, t2
      mv      t0, t3
      li      t4, 2452
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.493 = load ptr, ptr %__tmp.492
      lw      t1, 0(t4)
      lw      t0, 0(t1)
      li      t4, 2456
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.494 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      li      t4, 2460
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.495 = getelementptr i32, ptr %__tmp.493, i32 %__tmp.494
      lw      t0, 0(t4)
      li      t1, 4
      mul     t2, t0, t1
      li      t4, 2456
      add     t4, sp, t4
      lw      t0, 0(t4)
      add     t3, t0, t2
      mv      t0, t3
      li      t4, 2464
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.496 = load i32, ptr %__tmp.495
      lw      t1, 0(t4)
      lw      t0, 0(t1)
      li      t4, 2468
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.497 = sub i32 0, 1
      li      t1, 0
      li      t2, 1
      sub     t0, t1, t2
      li      t4, 2472
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.498 = icmp eq i32 %__tmp.496, %__tmp.497
      li      t4, 2468
      add     t4, sp, t4
      lw      t1, 0(t4)
      li      t4, 2472
      add     t4, sp, t4
      lw      t2, 0(t4)
      sub     t0, t1, t2
      seqz    t3, t0
      mv      t0, t3
      li      t4, 2476
      add     t4, sp, t4
      sw      t0, 0(t4)
      # br label %if.end.32
      lw      t1, 0(t4)
      mv      t0, t1
      j       main_if.end.32
main_if.else.32:
      # br label %if.end.32
      li      t4, 2440
      add     t4, sp, t4
      lw      t1, 0(t4)
      mv      t0, t1
      j       main_if.end.32
main_if.end.32:
      li      t4, 2480
      add     t4, sp, t4
      sw      t0, 0(t4)
      # br i1 %__tmp.499, label %if.then33, label %if.merge33
      lw      t0, 0(t4)
      beqz     t0, main_jump37
      j       main_if.then33
main_jump37:
      j       main_if.merge33
main_if.then33:
      # %__tmp.500 = load i32, ptr %_tail.0
      lw      t1, 48(sp)
      lw      t0, 0(t1)
      li      t4, 2484
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.501 = load i32, ptr %_tail.0
      lw      t1, 48(sp)
      lw      t0, 0(t1)
      li      t4, 2488
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.502 = add i32 %__tmp.501, 1
      li      t2, 1
      lw      t1, 0(t4)
      add     t0, t1, t2
      li      t4, 2492
      add     t4, sp, t4
      sw      t0, 0(t4)
      # store i32 %__tmp.502, ptr %_tail.0
      lw      t0, 0(t4)
      lw      t1, 48(sp)
      sw      t0, 0(t1)
      # %__tmp.503 = load ptr, ptr %_xlist.0
      lw      t1, 88(sp)
      lw      t0, 0(t1)
      li      t4, 2496
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.504 = load i32, ptr %_tail.0
      lw      t1, 48(sp)
      lw      t0, 0(t1)
      li      t4, 2500
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.505 = getelementptr i32, ptr %__tmp.503, i32 %__tmp.504
      lw      t0, 0(t4)
      li      t1, 4
      mul     t2, t0, t1
      li      t4, 2496
      add     t4, sp, t4
      lw      t0, 0(t4)
      add     t3, t0, t2
      mv      t0, t3
      li      t4, 2504
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.506 = load i32, ptr %__tmp.505
      lw      t1, 0(t4)
      lw      t0, 0(t1)
      li      t4, 2508
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.507 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      li      t4, 2512
      add     t4, sp, t4
      sw      t0, 0(t4)
      # store i32 %__tmp.507, ptr %__tmp.505
      lw      t0, 0(t4)
      li      t4, 2504
      add     t4, sp, t4
      lw      t1, 0(t4)
      sw      t0, 0(t1)
      # %__tmp.508 = load ptr, ptr %_ylist.0
      lw      t1, 96(sp)
      lw      t0, 0(t1)
      li      t4, 2516
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.509 = load i32, ptr %_tail.0
      lw      t1, 48(sp)
      lw      t0, 0(t1)
      li      t4, 2520
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.510 = getelementptr i32, ptr %__tmp.508, i32 %__tmp.509
      lw      t0, 0(t4)
      li      t1, 4
      mul     t2, t0, t1
      li      t4, 2516
      add     t4, sp, t4
      lw      t0, 0(t4)
      add     t3, t0, t2
      mv      t0, t3
      li      t4, 2524
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.511 = load i32, ptr %__tmp.510
      lw      t1, 0(t4)
      lw      t0, 0(t1)
      li      t4, 2528
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.512 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      li      t4, 2532
      add     t4, sp, t4
      sw      t0, 0(t4)
      # store i32 %__tmp.512, ptr %__tmp.510
      lw      t0, 0(t4)
      li      t4, 2524
      add     t4, sp, t4
      lw      t1, 0(t4)
      sw      t0, 0(t1)
      # %__tmp.513 = load ptr, ptr %_step.0
      lw      t1, 104(sp)
      lw      t0, 0(t1)
      li      t4, 2536
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.514 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      li      t4, 2540
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.515 = getelementptr ptr, ptr %__tmp.513, i32 %__tmp.514
      lw      t0, 0(t4)
      li      t1, 4
      mul     t2, t0, t1
      li      t4, 2536
      add     t4, sp, t4
      lw      t0, 0(t4)
      add     t3, t0, t2
      mv      t0, t3
      li      t4, 2544
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.516 = load ptr, ptr %__tmp.515
      lw      t1, 0(t4)
      lw      t0, 0(t1)
      li      t4, 2548
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.517 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      li      t4, 2552
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.518 = getelementptr i32, ptr %__tmp.516, i32 %__tmp.517
      lw      t0, 0(t4)
      li      t1, 4
      mul     t2, t0, t1
      li      t4, 2548
      add     t4, sp, t4
      lw      t0, 0(t4)
      add     t3, t0, t2
      mv      t0, t3
      li      t4, 2556
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.519 = load i32, ptr %__tmp.518
      lw      t1, 0(t4)
      lw      t0, 0(t1)
      li      t4, 2560
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.520 = load i32, ptr %_now.0
      lw      t1, 64(sp)
      lw      t0, 0(t1)
      li      t4, 2564
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.521 = add i32 %__tmp.520, 1
      li      t2, 1
      lw      t1, 0(t4)
      add     t0, t1, t2
      li      t4, 2568
      add     t4, sp, t4
      sw      t0, 0(t4)
      # store i32 %__tmp.521, ptr %__tmp.518
      lw      t0, 0(t4)
      li      t4, 2556
      add     t4, sp, t4
      lw      t1, 0(t4)
      sw      t0, 0(t1)
      # %__tmp.522 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      li      t4, 2572
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.523 = load i32, ptr %_targetx.0
      lw      t1, 32(sp)
      lw      t0, 0(t1)
      li      t4, 2576
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.524 = icmp eq i32 %__tmp.522, %__tmp.523
      li      t4, 2572
      add     t4, sp, t4
      lw      t1, 0(t4)
      li      t4, 2576
      add     t4, sp, t4
      lw      t2, 0(t4)
      sub     t0, t1, t2
      seqz    t3, t0
      mv      t0, t3
      li      t4, 2580
      add     t4, sp, t4
      sw      t0, 0(t4)
      # br i1 %__tmp.524, label %if.then.34, label %if.else.34
      lw      t0, 0(t4)
      beqz     t0, main_jump38
      j       main_if.then.34
main_jump38:
      j       main_if.else.34
main_if.then.34:
      # %__tmp.525 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      li      t4, 2584
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.526 = load i32, ptr %_targety.0
      lw      t1, 40(sp)
      lw      t0, 0(t1)
      li      t4, 2588
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.527 = icmp eq i32 %__tmp.525, %__tmp.526
      li      t4, 2584
      add     t4, sp, t4
      lw      t1, 0(t4)
      li      t4, 2588
      add     t4, sp, t4
      lw      t2, 0(t4)
      sub     t0, t1, t2
      seqz    t3, t0
      mv      t0, t3
      li      t4, 2592
      add     t4, sp, t4
      sw      t0, 0(t4)
      # br label %if.end.34
      lw      t1, 0(t4)
      mv      t0, t1
      j       main_if.end.34
main_if.else.34:
      # br label %if.end.34
      li      t4, 2580
      add     t4, sp, t4
      lw      t1, 0(t4)
      mv      t0, t1
      j       main_if.end.34
main_if.end.34:
      li      t4, 2596
      add     t4, sp, t4
      sw      t0, 0(t4)
      # br i1 %__tmp.528, label %if.then35, label %if.merge35
      lw      t0, 0(t4)
      beqz     t0, main_jump39
      j       main_if.then35
main_jump39:
      j       main_if.merge35
main_if.then35:
      # %__tmp.529 = load i32, ptr %_ok.0
      lw      t1, 56(sp)
      lw      t0, 0(t1)
      li      t4, 2600
      add     t4, sp, t4
      sw      t0, 0(t4)
      # store i32 1, ptr %_ok.0
      li      t0, 1
      lw      t1, 56(sp)
      sw      t0, 0(t1)
      # br label %if.merge35
      j       main_if.merge35
main_if.merge35:
      # br label %if.merge33
      j       main_if.merge33
main_if.merge33:
      # %__tmp.530 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      li      t4, 2604
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.531 = load ptr, ptr %_xlist.0
      lw      t1, 88(sp)
      lw      t0, 0(t1)
      li      t4, 2608
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.532 = load i32, ptr %_head.0
      lw      t1, 8(sp)
      lw      t0, 0(t1)
      li      t4, 2612
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.533 = getelementptr i32, ptr %__tmp.531, i32 %__tmp.532
      lw      t0, 0(t4)
      li      t1, 4
      mul     t2, t0, t1
      li      t4, 2608
      add     t4, sp, t4
      lw      t0, 0(t4)
      add     t3, t0, t2
      mv      t0, t3
      li      t4, 2616
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.534 = load i32, ptr %__tmp.533
      lw      t1, 0(t4)
      lw      t0, 0(t1)
      li      t4, 2620
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.535 = add i32 %__tmp.534, 2
      li      t2, 2
      lw      t1, 0(t4)
      add     t0, t1, t2
      li      t4, 2624
      add     t4, sp, t4
      sw      t0, 0(t4)
      # store i32 %__tmp.535, ptr %_x.0
      lw      t0, 0(t4)
      lw      t1, 72(sp)
      sw      t0, 0(t1)
      # %__tmp.536 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      li      t4, 2628
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.537 = load ptr, ptr %_ylist.0
      lw      t1, 96(sp)
      lw      t0, 0(t1)
      li      t4, 2632
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.538 = load i32, ptr %_head.0
      lw      t1, 8(sp)
      lw      t0, 0(t1)
      li      t4, 2636
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.539 = getelementptr i32, ptr %__tmp.537, i32 %__tmp.538
      lw      t0, 0(t4)
      li      t1, 4
      mul     t2, t0, t1
      li      t4, 2632
      add     t4, sp, t4
      lw      t0, 0(t4)
      add     t3, t0, t2
      mv      t0, t3
      li      t4, 2640
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.540 = load i32, ptr %__tmp.539
      lw      t1, 0(t4)
      lw      t0, 0(t1)
      li      t4, 2644
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.541 = add i32 %__tmp.540, 1
      li      t2, 1
      lw      t1, 0(t4)
      add     t0, t1, t2
      li      t4, 2648
      add     t4, sp, t4
      sw      t0, 0(t4)
      # store i32 %__tmp.541, ptr %_y.0
      lw      t0, 0(t4)
      lw      t1, 80(sp)
      sw      t0, 0(t1)
      # %__tmp.543 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      li      t4, 2652
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.544 = load i32, ptr %_N.1
      lw      t1, 0(sp)
      lw      t0, 0(t1)
      li      t4, 2656
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.542 = call i1 @check(i32 %__tmp.543, i32 %__tmp.544)
      li      t4, 2652
      add     t4, sp, t4
      lw      t0, 0(t4)
      mv      a0, t0
      li      t4, 2656
      add     t4, sp, t4
      lw      t0, 0(t4)
      mv      a1, t0
      li      t4, 2660
      add     t4, sp, t4
      sw      ra, 0(t4)
      sw      t0, 4(t4)
      sw      t1, 8(t4)
      sw      t2, 12(t4)
      sw      t3, 16(t4)
      call    check
      mv      t0, a0
      li      t4, 2680
      add     t4, sp, t4
      sw      t0, 0(t4)
      li      t4, 2660
      add     t4, sp, t4
      lw      ra, 0(t4)
      lw      t0, 4(t4)
      lw      t1, 8(t4)
      lw      t2, 12(t4)
      lw      t3, 16(t4)
      # br i1 %__tmp.542, label %if.then.36, label %if.else.36
      li      t4, 2680
      add     t4, sp, t4
      lw      t0, 0(t4)
      beqz     t0, main_jump40
      j       main_if.then.36
main_jump40:
      j       main_if.else.36
main_if.then.36:
      # %__tmp.546 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      li      t4, 2684
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.547 = load i32, ptr %_N.1
      lw      t1, 0(sp)
      lw      t0, 0(t1)
      li      t4, 2688
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.545 = call i1 @check(i32 %__tmp.546, i32 %__tmp.547)
      li      t4, 2684
      add     t4, sp, t4
      lw      t0, 0(t4)
      mv      a0, t0
      li      t4, 2688
      add     t4, sp, t4
      lw      t0, 0(t4)
      mv      a1, t0
      li      t4, 2692
      add     t4, sp, t4
      sw      ra, 0(t4)
      sw      t0, 4(t4)
      sw      t1, 8(t4)
      sw      t2, 12(t4)
      sw      t3, 16(t4)
      call    check
      mv      t0, a0
      li      t4, 2712
      add     t4, sp, t4
      sw      t0, 0(t4)
      li      t4, 2692
      add     t4, sp, t4
      lw      ra, 0(t4)
      lw      t0, 4(t4)
      lw      t1, 8(t4)
      lw      t2, 12(t4)
      lw      t3, 16(t4)
      # br label %if.end.36
      li      t4, 2712
      add     t4, sp, t4
      lw      t1, 0(t4)
      mv      t0, t1
      j       main_if.end.36
main_if.else.36:
      # br label %if.end.36
      li      t4, 2680
      add     t4, sp, t4
      lw      t1, 0(t4)
      mv      t0, t1
      j       main_if.end.36
main_if.end.36:
      li      t4, 2716
      add     t4, sp, t4
      sw      t0, 0(t4)
      # br i1 %__tmp.548, label %if.then.37, label %if.else.37
      lw      t0, 0(t4)
      beqz     t0, main_jump41
      j       main_if.then.37
main_jump41:
      j       main_if.else.37
main_if.then.37:
      # %__tmp.549 = load ptr, ptr %_step.0
      lw      t1, 104(sp)
      lw      t0, 0(t1)
      li      t4, 2720
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.550 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      li      t4, 2724
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.551 = getelementptr ptr, ptr %__tmp.549, i32 %__tmp.550
      lw      t0, 0(t4)
      li      t1, 4
      mul     t2, t0, t1
      li      t4, 2720
      add     t4, sp, t4
      lw      t0, 0(t4)
      add     t3, t0, t2
      mv      t0, t3
      li      t4, 2728
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.552 = load ptr, ptr %__tmp.551
      lw      t1, 0(t4)
      lw      t0, 0(t1)
      li      t4, 2732
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.553 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      li      t4, 2736
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.554 = getelementptr i32, ptr %__tmp.552, i32 %__tmp.553
      lw      t0, 0(t4)
      li      t1, 4
      mul     t2, t0, t1
      li      t4, 2732
      add     t4, sp, t4
      lw      t0, 0(t4)
      add     t3, t0, t2
      mv      t0, t3
      li      t4, 2740
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.555 = load i32, ptr %__tmp.554
      lw      t1, 0(t4)
      lw      t0, 0(t1)
      li      t4, 2744
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.556 = sub i32 0, 1
      li      t1, 0
      li      t2, 1
      sub     t0, t1, t2
      li      t4, 2748
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.557 = icmp eq i32 %__tmp.555, %__tmp.556
      li      t4, 2744
      add     t4, sp, t4
      lw      t1, 0(t4)
      li      t4, 2748
      add     t4, sp, t4
      lw      t2, 0(t4)
      sub     t0, t1, t2
      seqz    t3, t0
      mv      t0, t3
      li      t4, 2752
      add     t4, sp, t4
      sw      t0, 0(t4)
      # br label %if.end.37
      lw      t1, 0(t4)
      mv      t0, t1
      j       main_if.end.37
main_if.else.37:
      # br label %if.end.37
      li      t4, 2716
      add     t4, sp, t4
      lw      t1, 0(t4)
      mv      t0, t1
      j       main_if.end.37
main_if.end.37:
      li      t4, 2756
      add     t4, sp, t4
      sw      t0, 0(t4)
      # br i1 %__tmp.558, label %if.then38, label %if.merge38
      lw      t0, 0(t4)
      beqz     t0, main_jump42
      j       main_if.then38
main_jump42:
      j       main_if.merge38
main_if.then38:
      # %__tmp.559 = load i32, ptr %_tail.0
      lw      t1, 48(sp)
      lw      t0, 0(t1)
      li      t4, 2760
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.560 = load i32, ptr %_tail.0
      lw      t1, 48(sp)
      lw      t0, 0(t1)
      li      t4, 2764
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.561 = add i32 %__tmp.560, 1
      li      t2, 1
      lw      t1, 0(t4)
      add     t0, t1, t2
      li      t4, 2768
      add     t4, sp, t4
      sw      t0, 0(t4)
      # store i32 %__tmp.561, ptr %_tail.0
      lw      t0, 0(t4)
      lw      t1, 48(sp)
      sw      t0, 0(t1)
      # %__tmp.562 = load ptr, ptr %_xlist.0
      lw      t1, 88(sp)
      lw      t0, 0(t1)
      li      t4, 2772
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.563 = load i32, ptr %_tail.0
      lw      t1, 48(sp)
      lw      t0, 0(t1)
      li      t4, 2776
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.564 = getelementptr i32, ptr %__tmp.562, i32 %__tmp.563
      lw      t0, 0(t4)
      li      t1, 4
      mul     t2, t0, t1
      li      t4, 2772
      add     t4, sp, t4
      lw      t0, 0(t4)
      add     t3, t0, t2
      mv      t0, t3
      li      t4, 2780
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.565 = load i32, ptr %__tmp.564
      lw      t1, 0(t4)
      lw      t0, 0(t1)
      li      t4, 2784
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.566 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      li      t4, 2788
      add     t4, sp, t4
      sw      t0, 0(t4)
      # store i32 %__tmp.566, ptr %__tmp.564
      lw      t0, 0(t4)
      li      t4, 2780
      add     t4, sp, t4
      lw      t1, 0(t4)
      sw      t0, 0(t1)
      # %__tmp.567 = load ptr, ptr %_ylist.0
      lw      t1, 96(sp)
      lw      t0, 0(t1)
      li      t4, 2792
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.568 = load i32, ptr %_tail.0
      lw      t1, 48(sp)
      lw      t0, 0(t1)
      li      t4, 2796
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.569 = getelementptr i32, ptr %__tmp.567, i32 %__tmp.568
      lw      t0, 0(t4)
      li      t1, 4
      mul     t2, t0, t1
      li      t4, 2792
      add     t4, sp, t4
      lw      t0, 0(t4)
      add     t3, t0, t2
      mv      t0, t3
      li      t4, 2800
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.570 = load i32, ptr %__tmp.569
      lw      t1, 0(t4)
      lw      t0, 0(t1)
      li      t4, 2804
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.571 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      li      t4, 2808
      add     t4, sp, t4
      sw      t0, 0(t4)
      # store i32 %__tmp.571, ptr %__tmp.569
      lw      t0, 0(t4)
      li      t4, 2800
      add     t4, sp, t4
      lw      t1, 0(t4)
      sw      t0, 0(t1)
      # %__tmp.572 = load ptr, ptr %_step.0
      lw      t1, 104(sp)
      lw      t0, 0(t1)
      li      t4, 2812
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.573 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      li      t4, 2816
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.574 = getelementptr ptr, ptr %__tmp.572, i32 %__tmp.573
      lw      t0, 0(t4)
      li      t1, 4
      mul     t2, t0, t1
      li      t4, 2812
      add     t4, sp, t4
      lw      t0, 0(t4)
      add     t3, t0, t2
      mv      t0, t3
      li      t4, 2820
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.575 = load ptr, ptr %__tmp.574
      lw      t1, 0(t4)
      lw      t0, 0(t1)
      li      t4, 2824
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.576 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      li      t4, 2828
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.577 = getelementptr i32, ptr %__tmp.575, i32 %__tmp.576
      lw      t0, 0(t4)
      li      t1, 4
      mul     t2, t0, t1
      li      t4, 2824
      add     t4, sp, t4
      lw      t0, 0(t4)
      add     t3, t0, t2
      mv      t0, t3
      li      t4, 2832
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.578 = load i32, ptr %__tmp.577
      lw      t1, 0(t4)
      lw      t0, 0(t1)
      li      t4, 2836
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.579 = load i32, ptr %_now.0
      lw      t1, 64(sp)
      lw      t0, 0(t1)
      li      t4, 2840
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.580 = add i32 %__tmp.579, 1
      li      t2, 1
      lw      t1, 0(t4)
      add     t0, t1, t2
      li      t4, 2844
      add     t4, sp, t4
      sw      t0, 0(t4)
      # store i32 %__tmp.580, ptr %__tmp.577
      lw      t0, 0(t4)
      li      t4, 2832
      add     t4, sp, t4
      lw      t1, 0(t4)
      sw      t0, 0(t1)
      # %__tmp.581 = load i32, ptr %_x.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      li      t4, 2848
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.582 = load i32, ptr %_targetx.0
      lw      t1, 32(sp)
      lw      t0, 0(t1)
      li      t4, 2852
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.583 = icmp eq i32 %__tmp.581, %__tmp.582
      li      t4, 2848
      add     t4, sp, t4
      lw      t1, 0(t4)
      li      t4, 2852
      add     t4, sp, t4
      lw      t2, 0(t4)
      sub     t0, t1, t2
      seqz    t3, t0
      mv      t0, t3
      li      t4, 2856
      add     t4, sp, t4
      sw      t0, 0(t4)
      # br i1 %__tmp.583, label %if.then.39, label %if.else.39
      lw      t0, 0(t4)
      beqz     t0, main_jump43
      j       main_if.then.39
main_jump43:
      j       main_if.else.39
main_if.then.39:
      # %__tmp.584 = load i32, ptr %_y.0
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      li      t4, 2860
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.585 = load i32, ptr %_targety.0
      lw      t1, 40(sp)
      lw      t0, 0(t1)
      li      t4, 2864
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.586 = icmp eq i32 %__tmp.584, %__tmp.585
      li      t4, 2860
      add     t4, sp, t4
      lw      t1, 0(t4)
      li      t4, 2864
      add     t4, sp, t4
      lw      t2, 0(t4)
      sub     t0, t1, t2
      seqz    t3, t0
      mv      t0, t3
      li      t4, 2868
      add     t4, sp, t4
      sw      t0, 0(t4)
      # br label %if.end.39
      lw      t1, 0(t4)
      mv      t0, t1
      j       main_if.end.39
main_if.else.39:
      # br label %if.end.39
      li      t4, 2856
      add     t4, sp, t4
      lw      t1, 0(t4)
      mv      t0, t1
      j       main_if.end.39
main_if.end.39:
      li      t4, 2872
      add     t4, sp, t4
      sw      t0, 0(t4)
      # br i1 %__tmp.587, label %if.then40, label %if.merge40
      lw      t0, 0(t4)
      beqz     t0, main_jump44
      j       main_if.then40
main_jump44:
      j       main_if.merge40
main_if.then40:
      # %__tmp.588 = load i32, ptr %_ok.0
      lw      t1, 56(sp)
      lw      t0, 0(t1)
      li      t4, 2876
      add     t4, sp, t4
      sw      t0, 0(t4)
      # store i32 1, ptr %_ok.0
      li      t0, 1
      lw      t1, 56(sp)
      sw      t0, 0(t1)
      # br label %if.merge40
      j       main_if.merge40
main_if.merge40:
      # br label %if.merge38
      j       main_if.merge38
main_if.merge38:
      # %__tmp.589 = load i32, ptr %_ok.0
      lw      t1, 56(sp)
      lw      t0, 0(t1)
      li      t4, 2880
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.590 = icmp eq i32 %__tmp.589, 1
      li      t2, 1
      lw      t1, 0(t4)
      sub     t0, t1, t2
      seqz    t3, t0
      mv      t0, t3
      li      t4, 2884
      add     t4, sp, t4
      sw      t0, 0(t4)
      # br i1 %__tmp.590, label %if.then41, label %if.merge41
      lw      t0, 0(t4)
      beqz     t0, main_jump45
      j       main_if.then41
main_jump45:
      j       main_if.merge41
main_if.then41:
      # br label %while.merge0
      j       main_while.merge0
      # br label %if.merge41
      j       main_if.merge41
main_if.merge41:
      # %__tmp.591 = load i32, ptr %_head.0
      lw      t1, 8(sp)
      lw      t0, 0(t1)
      li      t4, 2888
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.592 = load i32, ptr %_head.0
      lw      t1, 8(sp)
      lw      t0, 0(t1)
      li      t4, 2892
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.593 = add i32 %__tmp.592, 1
      li      t2, 1
      lw      t1, 0(t4)
      add     t0, t1, t2
      li      t4, 2896
      add     t4, sp, t4
      sw      t0, 0(t4)
      # store i32 %__tmp.593, ptr %_head.0
      lw      t0, 0(t4)
      lw      t1, 8(sp)
      sw      t0, 0(t1)
      # br label %while.cond0
      j       main_while.cond0
main_while.merge0:
      # %__tmp.594 = load i32, ptr %_ok.0
      lw      t1, 56(sp)
      lw      t0, 0(t1)
      li      t4, 2900
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.595 = icmp eq i32 %__tmp.594, 1
      li      t2, 1
      lw      t1, 0(t4)
      sub     t0, t1, t2
      seqz    t3, t0
      mv      t0, t3
      li      t4, 2904
      add     t4, sp, t4
      sw      t0, 0(t4)
      # br i1 %__tmp.595, label %if.then42, label %if.else42
      lw      t0, 0(t4)
      beqz     t0, main_jump46
      j       main_if.then42
main_jump46:
      j       main_if.else42
main_if.then42:
      # %__tmp.597 = load ptr, ptr %_step.0
      lw      t1, 104(sp)
      lw      t0, 0(t1)
      li      t4, 2908
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.598 = load i32, ptr %_targetx.0
      lw      t1, 32(sp)
      lw      t0, 0(t1)
      li      t4, 2912
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.599 = getelementptr ptr, ptr %__tmp.597, i32 %__tmp.598
      lw      t0, 0(t4)
      li      t1, 4
      mul     t2, t0, t1
      li      t4, 2908
      add     t4, sp, t4
      lw      t0, 0(t4)
      add     t3, t0, t2
      mv      t0, t3
      li      t4, 2916
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.600 = load ptr, ptr %__tmp.599
      lw      t1, 0(t4)
      lw      t0, 0(t1)
      li      t4, 2920
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.601 = load i32, ptr %_targety.0
      lw      t1, 40(sp)
      lw      t0, 0(t1)
      li      t4, 2924
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.602 = getelementptr i32, ptr %__tmp.600, i32 %__tmp.601
      lw      t0, 0(t4)
      li      t1, 4
      mul     t2, t0, t1
      li      t4, 2920
      add     t4, sp, t4
      lw      t0, 0(t4)
      add     t3, t0, t2
      mv      t0, t3
      li      t4, 2928
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.603 = load i32, ptr %__tmp.602
      lw      t1, 0(t4)
      lw      t0, 0(t1)
      li      t4, 2932
      add     t4, sp, t4
      sw      t0, 0(t4)
      # %__tmp.596 = call ptr @toString(i32 %__tmp.603)
      lw      t0, 0(t4)
      mv      a0, t0
      li      t4, 2936
      add     t4, sp, t4
      sw      ra, 0(t4)
      sw      t0, 4(t4)
      sw      t1, 8(t4)
      sw      t2, 12(t4)
      sw      t3, 16(t4)
      call    toString
      mv      t0, a0
      li      t4, 2956
      add     t4, sp, t4
      sw      t0, 0(t4)
      li      t4, 2936
      add     t4, sp, t4
      lw      ra, 0(t4)
      lw      t0, 4(t4)
      lw      t1, 8(t4)
      lw      t2, 12(t4)
      lw      t3, 16(t4)
      # call void @println(ptr %__tmp.596)
      li      t4, 2956
      add     t4, sp, t4
      lw      t0, 0(t4)
      mv      a0, t0
      li      t4, 2960
      add     t4, sp, t4
      sw      ra, 0(t4)
      sw      t0, 4(t4)
      sw      t1, 8(t4)
      sw      t2, 12(t4)
      sw      t3, 16(t4)
      call    println
      li      t4, 2960
      add     t4, sp, t4
      lw      ra, 0(t4)
      lw      t0, 4(t4)
      lw      t1, 8(t4)
      lw      t2, 12(t4)
      lw      t3, 16(t4)
      # br label %if.merge42
      j       main_if.merge42
main_if.else42:
      # call void @print(ptr @_string.0)
      la      t0, _string.0
      li      t4, 2980
      add     t4, sp, t4
      sw      t0, 0(t4)
      lw      t0, 0(t4)
      mv      a0, t0
      li      t4, 2984
      add     t4, sp, t4
      sw      ra, 0(t4)
      sw      t0, 4(t4)
      sw      t1, 8(t4)
      sw      t2, 12(t4)
      sw      t3, 16(t4)
      call    print
      li      t4, 2984
      add     t4, sp, t4
      lw      ra, 0(t4)
      lw      t0, 4(t4)
      lw      t1, 8(t4)
      lw      t2, 12(t4)
      lw      t3, 16(t4)
      # br label %if.merge42
      j       main_if.merge42
main_if.merge42:
      # ret i32 0
      li      t0, 0
      mv      a0, t0
      li      t0, 3004
      add     sp, sp, t0
      ret     
      .section .text
      .globl check
check:
      addi    sp, sp, -48
      mv      t0, a0
      sw      t0, 0(sp)
      mv      t0, a1
      sw      t0, 4(sp)
check_entry:
      # %_a.0 = alloca i32
      addi    t0, sp, 12
      sw      t0, 8(sp)
      # store i32 %_a, ptr %_a.0
      lw      t0, 0(sp)
      lw      t1, 8(sp)
      sw      t0, 0(t1)
      # %_N.0 = alloca i32
      addi    t0, sp, 20
      sw      t0, 16(sp)
      # store i32 %_N, ptr %_N.0
      lw      t0, 4(sp)
      lw      t1, 16(sp)
      sw      t0, 0(t1)
      # %__tmp.0 = load i32, ptr %_a.0
      lw      t1, 8(sp)
      lw      t0, 0(t1)
      sw      t0, 24(sp)
      # %__tmp.1 = load i32, ptr %_N.0
      lw      t1, 16(sp)
      lw      t0, 0(t1)
      sw      t0, 28(sp)
      # %__tmp.2 = icmp slt i32 %__tmp.0, %__tmp.1
      lw      t1, 24(sp)
      lw      t2, 28(sp)
      sub     t0, t1, t2
      sltz    t3, t0
      mv      t0, t3
      sw      t0, 32(sp)
      # br i1 %__tmp.2, label %if.then.0, label %if.else.0
      lw      t0, 32(sp)
      beqz     t0, check_jump47
      j       check_if.then.0
check_jump47:
      j       check_if.else.0
check_if.then.0:
      # %__tmp.3 = load i32, ptr %_a.0
      lw      t1, 8(sp)
      lw      t0, 0(t1)
      sw      t0, 36(sp)
      # %__tmp.4 = icmp sge i32 %__tmp.3, 0
      li      t2, 0
      lw      t1, 36(sp)
      sub     t0, t1, t2
      sgtz    t3, t0
      seqz    t1, t0
      or      t2, t3, t1
      mv      t0, t2
      sw      t0, 40(sp)
      # br label %if.end.0
      lw      t1, 40(sp)
      mv      t0, t1
      j       check_if.end.0
check_if.else.0:
      # br label %if.end.0
      lw      t1, 32(sp)
      mv      t0, t1
      j       check_if.end.0
check_if.end.0:
      sw      t0, 44(sp)
      # ret i1 %__tmp.5
      lw      t0, 44(sp)
      mv      a0, t0
      addi    sp, sp, 48
      ret     
