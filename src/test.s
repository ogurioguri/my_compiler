      .section .text
      .globl gcd
gcd:
      addi    sp, sp, -832
      mv      t0, a0
      sw      t0, 0(sp)
      mv      t0, a1
      sw      t0, 4(sp)
      mv      t0, a2
      sw      t0, 8(sp)
      mv      t0, a3
      sw      t0, 12(sp)
      mv      t0, a4
      sw      t0, 16(sp)
      mv      t0, a5
      sw      t0, 20(sp)
      mv      t0, a6
      sw      t0, 24(sp)
      mv      t0, a7
      sw      t0, 28(sp)
      lw      t0, 832(sp)
      sw      t0, 32(sp)
      lw      t0, 836(sp)
      sw      t0, 36(sp)
      lw      t0, 840(sp)
      sw      t0, 40(sp)
      lw      t0, 844(sp)
      sw      t0, 44(sp)
      lw      t0, 848(sp)
      sw      t0, 48(sp)
      lw      t0, 852(sp)
      sw      t0, 52(sp)
      lw      t0, 856(sp)
      sw      t0, 56(sp)
      lw      t0, 860(sp)
      sw      t0, 60(sp)
      lw      t0, 864(sp)
      sw      t0, 64(sp)
      lw      t0, 868(sp)
      sw      t0, 68(sp)
      lw      t0, 872(sp)
      sw      t0, 72(sp)
      lw      t0, 876(sp)
      sw      t0, 76(sp)
      lw      t0, 880(sp)
      sw      t0, 80(sp)
      lw      t0, 884(sp)
      sw      t0, 84(sp)
      lw      t0, 888(sp)
      sw      t0, 88(sp)
      lw      t0, 892(sp)
      sw      t0, 92(sp)
      lw      t0, 896(sp)
      sw      t0, 96(sp)
      lw      t0, 900(sp)
      sw      t0, 100(sp)
      lw      t0, 904(sp)
      sw      t0, 104(sp)
      lw      t0, 908(sp)
      sw      t0, 108(sp)
      lw      t0, 912(sp)
      sw      t0, 112(sp)
      lw      t0, 916(sp)
      sw      t0, 116(sp)
      lw      t0, 920(sp)
      sw      t0, 120(sp)
      lw      t0, 924(sp)
      sw      t0, 124(sp)
gcd_entry:
      # %_x.0 = alloca i32
      addi    t0, sp, 132
      sw      t0, 128(sp)
      # store i32 %_x, ptr %_x.0
      lw      t0, 0(sp)
      lw      t1, 128(sp)
      sw      t0, 0(t1)
      # %_y.0 = alloca i32
      addi    t0, sp, 140
      sw      t0, 136(sp)
      # store i32 %_y, ptr %_y.0
      lw      t0, 4(sp)
      lw      t1, 136(sp)
      sw      t0, 0(t1)
      # %_j0.0 = alloca i32
      addi    t0, sp, 148
      sw      t0, 144(sp)
      # store i32 %_j0, ptr %_j0.0
      lw      t0, 8(sp)
      lw      t1, 144(sp)
      sw      t0, 0(t1)
      # %_j1.0 = alloca i32
      addi    t0, sp, 156
      sw      t0, 152(sp)
      # store i32 %_j1, ptr %_j1.0
      lw      t0, 12(sp)
      lw      t1, 152(sp)
      sw      t0, 0(t1)
      # %_j2.0 = alloca i32
      addi    t0, sp, 164
      sw      t0, 160(sp)
      # store i32 %_j2, ptr %_j2.0
      lw      t0, 16(sp)
      lw      t1, 160(sp)
      sw      t0, 0(t1)
      # %_j3.0 = alloca i32
      addi    t0, sp, 172
      sw      t0, 168(sp)
      # store i32 %_j3, ptr %_j3.0
      lw      t0, 20(sp)
      lw      t1, 168(sp)
      sw      t0, 0(t1)
      # %_j4.0 = alloca i32
      addi    t0, sp, 180
      sw      t0, 176(sp)
      # store i32 %_j4, ptr %_j4.0
      lw      t0, 24(sp)
      lw      t1, 176(sp)
      sw      t0, 0(t1)
      # %_j5.0 = alloca i32
      addi    t0, sp, 188
      sw      t0, 184(sp)
      # store i32 %_j5, ptr %_j5.0
      lw      t0, 28(sp)
      lw      t1, 184(sp)
      sw      t0, 0(t1)
      # %_j6.0 = alloca i32
      addi    t0, sp, 196
      sw      t0, 192(sp)
      # store i32 %_j6, ptr %_j6.0
      lw      t0, 32(sp)
      lw      t1, 192(sp)
      sw      t0, 0(t1)
      # %_j7.0 = alloca i32
      addi    t0, sp, 204
      sw      t0, 200(sp)
      # store i32 %_j7, ptr %_j7.0
      lw      t0, 36(sp)
      lw      t1, 200(sp)
      sw      t0, 0(t1)
      # %_j8.0 = alloca i32
      addi    t0, sp, 212
      sw      t0, 208(sp)
      # store i32 %_j8, ptr %_j8.0
      lw      t0, 40(sp)
      lw      t1, 208(sp)
      sw      t0, 0(t1)
      # %_j9.0 = alloca i32
      addi    t0, sp, 220
      sw      t0, 216(sp)
      # store i32 %_j9, ptr %_j9.0
      lw      t0, 44(sp)
      lw      t1, 216(sp)
      sw      t0, 0(t1)
      # %_j10.0 = alloca i32
      addi    t0, sp, 228
      sw      t0, 224(sp)
      # store i32 %_j10, ptr %_j10.0
      lw      t0, 48(sp)
      lw      t1, 224(sp)
      sw      t0, 0(t1)
      # %_j11.0 = alloca i32
      addi    t0, sp, 236
      sw      t0, 232(sp)
      # store i32 %_j11, ptr %_j11.0
      lw      t0, 52(sp)
      lw      t1, 232(sp)
      sw      t0, 0(t1)
      # %_j12.0 = alloca i32
      addi    t0, sp, 244
      sw      t0, 240(sp)
      # store i32 %_j12, ptr %_j12.0
      lw      t0, 56(sp)
      lw      t1, 240(sp)
      sw      t0, 0(t1)
      # %_j13.0 = alloca i32
      addi    t0, sp, 252
      sw      t0, 248(sp)
      # store i32 %_j13, ptr %_j13.0
      lw      t0, 60(sp)
      lw      t1, 248(sp)
      sw      t0, 0(t1)
      # %_j14.0 = alloca i32
      addi    t0, sp, 260
      sw      t0, 256(sp)
      # store i32 %_j14, ptr %_j14.0
      lw      t0, 64(sp)
      lw      t1, 256(sp)
      sw      t0, 0(t1)
      # %_j15.0 = alloca i32
      addi    t0, sp, 268
      sw      t0, 264(sp)
      # store i32 %_j15, ptr %_j15.0
      lw      t0, 68(sp)
      lw      t1, 264(sp)
      sw      t0, 0(t1)
      # %_j16.0 = alloca i32
      addi    t0, sp, 276
      sw      t0, 272(sp)
      # store i32 %_j16, ptr %_j16.0
      lw      t0, 72(sp)
      lw      t1, 272(sp)
      sw      t0, 0(t1)
      # %_j17.0 = alloca i32
      addi    t0, sp, 284
      sw      t0, 280(sp)
      # store i32 %_j17, ptr %_j17.0
      lw      t0, 76(sp)
      lw      t1, 280(sp)
      sw      t0, 0(t1)
      # %_j18.0 = alloca i32
      addi    t0, sp, 292
      sw      t0, 288(sp)
      # store i32 %_j18, ptr %_j18.0
      lw      t0, 80(sp)
      lw      t1, 288(sp)
      sw      t0, 0(t1)
      # %_j19.0 = alloca i32
      addi    t0, sp, 300
      sw      t0, 296(sp)
      # store i32 %_j19, ptr %_j19.0
      lw      t0, 84(sp)
      lw      t1, 296(sp)
      sw      t0, 0(t1)
      # %_j20.0 = alloca i32
      addi    t0, sp, 308
      sw      t0, 304(sp)
      # store i32 %_j20, ptr %_j20.0
      lw      t0, 88(sp)
      lw      t1, 304(sp)
      sw      t0, 0(t1)
      # %_j21.0 = alloca i32
      addi    t0, sp, 316
      sw      t0, 312(sp)
      # store i32 %_j21, ptr %_j21.0
      lw      t0, 92(sp)
      lw      t1, 312(sp)
      sw      t0, 0(t1)
      # %_j22.0 = alloca i32
      addi    t0, sp, 324
      sw      t0, 320(sp)
      # store i32 %_j22, ptr %_j22.0
      lw      t0, 96(sp)
      lw      t1, 320(sp)
      sw      t0, 0(t1)
      # %_j23.0 = alloca i32
      addi    t0, sp, 332
      sw      t0, 328(sp)
      # store i32 %_j23, ptr %_j23.0
      lw      t0, 100(sp)
      lw      t1, 328(sp)
      sw      t0, 0(t1)
      # %_j24.0 = alloca i32
      addi    t0, sp, 340
      sw      t0, 336(sp)
      # store i32 %_j24, ptr %_j24.0
      lw      t0, 104(sp)
      lw      t1, 336(sp)
      sw      t0, 0(t1)
      # %_j25.0 = alloca i32
      addi    t0, sp, 348
      sw      t0, 344(sp)
      # store i32 %_j25, ptr %_j25.0
      lw      t0, 108(sp)
      lw      t1, 344(sp)
      sw      t0, 0(t1)
      # %_j26.0 = alloca i32
      addi    t0, sp, 356
      sw      t0, 352(sp)
      # store i32 %_j26, ptr %_j26.0
      lw      t0, 112(sp)
      lw      t1, 352(sp)
      sw      t0, 0(t1)
      # %_j27.0 = alloca i32
      addi    t0, sp, 364
      sw      t0, 360(sp)
      # store i32 %_j27, ptr %_j27.0
      lw      t0, 116(sp)
      lw      t1, 360(sp)
      sw      t0, 0(t1)
      # %_j28.0 = alloca i32
      addi    t0, sp, 372
      sw      t0, 368(sp)
      # store i32 %_j28, ptr %_j28.0
      lw      t0, 120(sp)
      lw      t1, 368(sp)
      sw      t0, 0(t1)
      # %_j29.0 = alloca i32
      addi    t0, sp, 380
      sw      t0, 376(sp)
      # store i32 %_j29, ptr %_j29.0
      lw      t0, 124(sp)
      lw      t1, 376(sp)
      sw      t0, 0(t1)
      # %_i.0 = alloca i32
      addi    t0, sp, 388
      sw      t0, 384(sp)
      # %_j.0 = alloca i32
      addi    t0, sp, 396
      sw      t0, 392(sp)
      # %__tmp.0 = load i32, ptr %_i.0
      lw      t1, 384(sp)
      lw      t0, 0(t1)
      sw      t0, 400(sp)
      # store i32 0, ptr %_i.0
      li      t0, 0
      lw      t1, 384(sp)
      sw      t0, 0(t1)
      # br label %for.cond0
      j       gcd_for.cond0
gcd_for.cond0:
      # %__tmp.1 = load i32, ptr %_i.0
      lw      t1, 384(sp)
      lw      t0, 0(t1)
      sw      t0, 404(sp)
      # %__tmp.2 = icmp sle i32 %__tmp.1, 10
      li      t2, 10
      lw      t1, 404(sp)
      sub     t0, t1, t2
      sltz    t3, t0
      seqz    t1, t0
      or      t2, t3, t1
      mv      t0, t2
      sw      t0, 408(sp)
      # br i1 %__tmp.2, label %for.body0, label %for.merge0
      lw      t0, 408(sp)
      beqz     t0, gcd_jump0
      j       gcd_for.body0
gcd_jump0:
      j       gcd_for.merge0
gcd_for.body0:
      # %__tmp.3 = load i32, ptr %_j.0
      lw      t1, 392(sp)
      lw      t0, 0(t1)
      sw      t0, 412(sp)
      # %__tmp.4 = load i32, ptr %_j0.0
      lw      t1, 144(sp)
      lw      t0, 0(t1)
      sw      t0, 416(sp)
      # %__tmp.5 = load i32, ptr %_j1.0
      lw      t1, 152(sp)
      lw      t0, 0(t1)
      sw      t0, 420(sp)
      # %__tmp.6 = add i32 %__tmp.4, %__tmp.5
      lw      t1, 416(sp)
      lw      t2, 420(sp)
      add     t0, t1, t2
      sw      t0, 424(sp)
      # %__tmp.7 = load i32, ptr %_j2.0
      lw      t1, 160(sp)
      lw      t0, 0(t1)
      sw      t0, 428(sp)
      # %__tmp.8 = add i32 %__tmp.6, %__tmp.7
      lw      t1, 424(sp)
      lw      t2, 428(sp)
      add     t0, t1, t2
      sw      t0, 432(sp)
      # %__tmp.9 = load i32, ptr %_j3.0
      lw      t1, 168(sp)
      lw      t0, 0(t1)
      sw      t0, 436(sp)
      # %__tmp.10 = add i32 %__tmp.8, %__tmp.9
      lw      t1, 432(sp)
      lw      t2, 436(sp)
      add     t0, t1, t2
      sw      t0, 440(sp)
      # %__tmp.11 = load i32, ptr %_j4.0
      lw      t1, 176(sp)
      lw      t0, 0(t1)
      sw      t0, 444(sp)
      # %__tmp.12 = add i32 %__tmp.10, %__tmp.11
      lw      t1, 440(sp)
      lw      t2, 444(sp)
      add     t0, t1, t2
      sw      t0, 448(sp)
      # %__tmp.13 = load i32, ptr %_j5.0
      lw      t1, 184(sp)
      lw      t0, 0(t1)
      sw      t0, 452(sp)
      # %__tmp.14 = add i32 %__tmp.12, %__tmp.13
      lw      t1, 448(sp)
      lw      t2, 452(sp)
      add     t0, t1, t2
      sw      t0, 456(sp)
      # %__tmp.15 = load i32, ptr %_j6.0
      lw      t1, 192(sp)
      lw      t0, 0(t1)
      sw      t0, 460(sp)
      # %__tmp.16 = add i32 %__tmp.14, %__tmp.15
      lw      t1, 456(sp)
      lw      t2, 460(sp)
      add     t0, t1, t2
      sw      t0, 464(sp)
      # %__tmp.17 = load i32, ptr %_j7.0
      lw      t1, 200(sp)
      lw      t0, 0(t1)
      sw      t0, 468(sp)
      # %__tmp.18 = add i32 %__tmp.16, %__tmp.17
      lw      t1, 464(sp)
      lw      t2, 468(sp)
      add     t0, t1, t2
      sw      t0, 472(sp)
      # %__tmp.19 = load i32, ptr %_j8.0
      lw      t1, 208(sp)
      lw      t0, 0(t1)
      sw      t0, 476(sp)
      # %__tmp.20 = add i32 %__tmp.18, %__tmp.19
      lw      t1, 472(sp)
      lw      t2, 476(sp)
      add     t0, t1, t2
      sw      t0, 480(sp)
      # %__tmp.21 = load i32, ptr %_j9.0
      lw      t1, 216(sp)
      lw      t0, 0(t1)
      sw      t0, 484(sp)
      # %__tmp.22 = add i32 %__tmp.20, %__tmp.21
      lw      t1, 480(sp)
      lw      t2, 484(sp)
      add     t0, t1, t2
      sw      t0, 488(sp)
      # %__tmp.23 = load i32, ptr %_j10.0
      lw      t1, 224(sp)
      lw      t0, 0(t1)
      sw      t0, 492(sp)
      # %__tmp.24 = add i32 %__tmp.22, %__tmp.23
      lw      t1, 488(sp)
      lw      t2, 492(sp)
      add     t0, t1, t2
      sw      t0, 496(sp)
      # %__tmp.25 = load i32, ptr %_j11.0
      lw      t1, 232(sp)
      lw      t0, 0(t1)
      sw      t0, 500(sp)
      # %__tmp.26 = add i32 %__tmp.24, %__tmp.25
      lw      t1, 496(sp)
      lw      t2, 500(sp)
      add     t0, t1, t2
      sw      t0, 504(sp)
      # %__tmp.27 = load i32, ptr %_j12.0
      lw      t1, 240(sp)
      lw      t0, 0(t1)
      sw      t0, 508(sp)
      # %__tmp.28 = add i32 %__tmp.26, %__tmp.27
      lw      t1, 504(sp)
      lw      t2, 508(sp)
      add     t0, t1, t2
      sw      t0, 512(sp)
      # %__tmp.29 = load i32, ptr %_j13.0
      lw      t1, 248(sp)
      lw      t0, 0(t1)
      sw      t0, 516(sp)
      # %__tmp.30 = add i32 %__tmp.28, %__tmp.29
      lw      t1, 512(sp)
      lw      t2, 516(sp)
      add     t0, t1, t2
      sw      t0, 520(sp)
      # %__tmp.31 = load i32, ptr %_j14.0
      lw      t1, 256(sp)
      lw      t0, 0(t1)
      sw      t0, 524(sp)
      # %__tmp.32 = add i32 %__tmp.30, %__tmp.31
      lw      t1, 520(sp)
      lw      t2, 524(sp)
      add     t0, t1, t2
      sw      t0, 528(sp)
      # %__tmp.33 = load i32, ptr %_j15.0
      lw      t1, 264(sp)
      lw      t0, 0(t1)
      sw      t0, 532(sp)
      # %__tmp.34 = add i32 %__tmp.32, %__tmp.33
      lw      t1, 528(sp)
      lw      t2, 532(sp)
      add     t0, t1, t2
      sw      t0, 536(sp)
      # %__tmp.35 = load i32, ptr %_j16.0
      lw      t1, 272(sp)
      lw      t0, 0(t1)
      sw      t0, 540(sp)
      # %__tmp.36 = add i32 %__tmp.34, %__tmp.35
      lw      t1, 536(sp)
      lw      t2, 540(sp)
      add     t0, t1, t2
      sw      t0, 544(sp)
      # %__tmp.37 = load i32, ptr %_j17.0
      lw      t1, 280(sp)
      lw      t0, 0(t1)
      sw      t0, 548(sp)
      # %__tmp.38 = add i32 %__tmp.36, %__tmp.37
      lw      t1, 544(sp)
      lw      t2, 548(sp)
      add     t0, t1, t2
      sw      t0, 552(sp)
      # %__tmp.39 = load i32, ptr %_j18.0
      lw      t1, 288(sp)
      lw      t0, 0(t1)
      sw      t0, 556(sp)
      # %__tmp.40 = add i32 %__tmp.38, %__tmp.39
      lw      t1, 552(sp)
      lw      t2, 556(sp)
      add     t0, t1, t2
      sw      t0, 560(sp)
      # %__tmp.41 = load i32, ptr %_j19.0
      lw      t1, 296(sp)
      lw      t0, 0(t1)
      sw      t0, 564(sp)
      # %__tmp.42 = add i32 %__tmp.40, %__tmp.41
      lw      t1, 560(sp)
      lw      t2, 564(sp)
      add     t0, t1, t2
      sw      t0, 568(sp)
      # %__tmp.43 = load i32, ptr %_j20.0
      lw      t1, 304(sp)
      lw      t0, 0(t1)
      sw      t0, 572(sp)
      # %__tmp.44 = add i32 %__tmp.42, %__tmp.43
      lw      t1, 568(sp)
      lw      t2, 572(sp)
      add     t0, t1, t2
      sw      t0, 576(sp)
      # %__tmp.45 = load i32, ptr %_j21.0
      lw      t1, 312(sp)
      lw      t0, 0(t1)
      sw      t0, 580(sp)
      # %__tmp.46 = add i32 %__tmp.44, %__tmp.45
      lw      t1, 576(sp)
      lw      t2, 580(sp)
      add     t0, t1, t2
      sw      t0, 584(sp)
      # %__tmp.47 = load i32, ptr %_j22.0
      lw      t1, 320(sp)
      lw      t0, 0(t1)
      sw      t0, 588(sp)
      # %__tmp.48 = add i32 %__tmp.46, %__tmp.47
      lw      t1, 584(sp)
      lw      t2, 588(sp)
      add     t0, t1, t2
      sw      t0, 592(sp)
      # %__tmp.49 = load i32, ptr %_j23.0
      lw      t1, 328(sp)
      lw      t0, 0(t1)
      sw      t0, 596(sp)
      # %__tmp.50 = add i32 %__tmp.48, %__tmp.49
      lw      t1, 592(sp)
      lw      t2, 596(sp)
      add     t0, t1, t2
      sw      t0, 600(sp)
      # %__tmp.51 = load i32, ptr %_j24.0
      lw      t1, 336(sp)
      lw      t0, 0(t1)
      sw      t0, 604(sp)
      # %__tmp.52 = add i32 %__tmp.50, %__tmp.51
      lw      t1, 600(sp)
      lw      t2, 604(sp)
      add     t0, t1, t2
      sw      t0, 608(sp)
      # %__tmp.53 = load i32, ptr %_j25.0
      lw      t1, 344(sp)
      lw      t0, 0(t1)
      sw      t0, 612(sp)
      # %__tmp.54 = add i32 %__tmp.52, %__tmp.53
      lw      t1, 608(sp)
      lw      t2, 612(sp)
      add     t0, t1, t2
      sw      t0, 616(sp)
      # %__tmp.55 = load i32, ptr %_j26.0
      lw      t1, 352(sp)
      lw      t0, 0(t1)
      sw      t0, 620(sp)
      # %__tmp.56 = add i32 %__tmp.54, %__tmp.55
      lw      t1, 616(sp)
      lw      t2, 620(sp)
      add     t0, t1, t2
      sw      t0, 624(sp)
      # %__tmp.57 = load i32, ptr %_j27.0
      lw      t1, 360(sp)
      lw      t0, 0(t1)
      sw      t0, 628(sp)
      # %__tmp.58 = add i32 %__tmp.56, %__tmp.57
      lw      t1, 624(sp)
      lw      t2, 628(sp)
      add     t0, t1, t2
      sw      t0, 632(sp)
      # %__tmp.59 = load i32, ptr %_j28.0
      lw      t1, 368(sp)
      lw      t0, 0(t1)
      sw      t0, 636(sp)
      # %__tmp.60 = add i32 %__tmp.58, %__tmp.59
      lw      t1, 632(sp)
      lw      t2, 636(sp)
      add     t0, t1, t2
      sw      t0, 640(sp)
      # %__tmp.61 = load i32, ptr %_j29.0
      lw      t1, 376(sp)
      lw      t0, 0(t1)
      sw      t0, 644(sp)
      # %__tmp.62 = add i32 %__tmp.60, %__tmp.61
      lw      t1, 640(sp)
      lw      t2, 644(sp)
      add     t0, t1, t2
      sw      t0, 648(sp)
      # %__tmp.63 = srem i32 %__tmp.62, 100
      li      t2, 100
      lw      t1, 648(sp)
      rem     t0, t1, t2
      sw      t0, 652(sp)
      # store i32 %__tmp.63, ptr %_j.0
      lw      t0, 652(sp)
      lw      t1, 392(sp)
      sw      t0, 0(t1)
      # br label %for.step0
      j       gcd_for.step0
gcd_for.step0:
      # %__tmp.64 = load i32, ptr %_i.0
      lw      t1, 384(sp)
      lw      t0, 0(t1)
      sw      t0, 656(sp)
      # %__tmp.65 = add i32 %__tmp.64, 1
      li      t2, 1
      lw      t1, 656(sp)
      add     t0, t1, t2
      sw      t0, 660(sp)
      # store i32 %__tmp.65, ptr %_i.0
      lw      t0, 660(sp)
      lw      t1, 384(sp)
      sw      t0, 0(t1)
      # br label %for.cond0
      j       gcd_for.cond0
gcd_for.merge0:
      # %__tmp.66 = load i32, ptr %_x.0
      lw      t1, 128(sp)
      lw      t0, 0(t1)
      sw      t0, 664(sp)
      # %__tmp.67 = load i32, ptr %_y.0
      lw      t1, 136(sp)
      lw      t0, 0(t1)
      sw      t0, 668(sp)
      # %__tmp.68 = srem i32 %__tmp.66, %__tmp.67
      lw      t1, 664(sp)
      lw      t2, 668(sp)
      rem     t0, t1, t2
      sw      t0, 672(sp)
      # %__tmp.69 = icmp eq i32 %__tmp.68, 0
      li      t2, 0
      lw      t1, 672(sp)
      sub     t0, t1, t2
      seqz    t3, t0
      mv      t0, t3
      sw      t0, 676(sp)
      # br i1 %__tmp.69, label %if.then0, label %if.else0
      lw      t0, 676(sp)
      beqz     t0, gcd_jump1
      j       gcd_if.then0
gcd_jump1:
      j       gcd_if.else0
gcd_if.then0:
      # %__tmp.70 = load i32, ptr %_y.0
      lw      t1, 136(sp)
      lw      t0, 0(t1)
      sw      t0, 680(sp)
      # ret i32 %__tmp.70
      lw      t0, 680(sp)
      mv      a0, t0
      addi    sp, sp, 832
      ret     
      # br label %if.merge0
      j       gcd_if.merge0
gcd_if.else0:
      # %__tmp.72 = load i32, ptr %_y.0
      lw      t1, 136(sp)
      lw      t0, 0(t1)
      sw      t0, 684(sp)
      # %__tmp.73 = load i32, ptr %_x.0
      lw      t1, 128(sp)
      lw      t0, 0(t1)
      sw      t0, 688(sp)
      # %__tmp.74 = load i32, ptr %_y.0
      lw      t1, 136(sp)
      lw      t0, 0(t1)
      sw      t0, 692(sp)
      # %__tmp.75 = srem i32 %__tmp.73, %__tmp.74
      lw      t1, 688(sp)
      lw      t2, 692(sp)
      rem     t0, t1, t2
      sw      t0, 696(sp)
      # %__tmp.76 = load i32, ptr %_j.0
      lw      t1, 392(sp)
      lw      t0, 0(t1)
      sw      t0, 700(sp)
      # %__tmp.77 = call i32 @gcd(i32 10, i32 68, i32 0, i32 2, i32 4, i32 6, i32 8, i32 10, i32 12, i32 14, i32 16, i32 18, i32 20, i32 22, i32 24, i32 26, i32 28, i32 30, i32 32, i32 34, i32 36, i32 38, i32 40, i32 42, i32 44, i32 46, i32 48, i32 50, i32 52, i32 54, i32 56, i32 58)
      li      a0, 10
      mv      a0, t0
      li      a1, 68
      mv      a1, t0
      li      a2, 0
      mv      a2, t0
      li      a3, 2
      mv      a3, t0
      li      a4, 4
      mv      a4, t0
      li      a5, 6
      mv      a5, t0
      li      a6, 8
      mv      a6, t0
      li      a7, 10
      mv      a7, t0
      li      t0, 12
      sw      t0, -96(sp)
      li      t0, 14
      sw      t0, -92(sp)
      li      t0, 16
      sw      t0, -88(sp)
      li      t0, 18
      sw      t0, -84(sp)
      li      t0, 20
      sw      t0, -80(sp)
      li      t0, 22
      sw      t0, -76(sp)
      li      t0, 24
      sw      t0, -72(sp)
      li      t0, 26
      sw      t0, -68(sp)
      li      t0, 28
      sw      t0, -64(sp)
      li      t0, 30
      sw      t0, -60(sp)
      li      t0, 32
      sw      t0, -56(sp)
      li      t0, 34
      sw      t0, -52(sp)
      li      t0, 36
      sw      t0, -48(sp)
      li      t0, 38
      sw      t0, -44(sp)
      li      t0, 40
      sw      t0, -40(sp)
      li      t0, 42
      sw      t0, -36(sp)
      li      t0, 44
      sw      t0, -32(sp)
      li      t0, 46
      sw      t0, -28(sp)
      li      t0, 48
      sw      t0, -24(sp)
      li      t0, 50
      sw      t0, -20(sp)
      li      t0, 52
      sw      t0, -16(sp)
      li      t0, 54
      sw      t0, -12(sp)
      li      t0, 56
      sw      t0, -8(sp)
      li      t0, 58
      sw      t0, -4(sp)
      sw      ra, 704(sp)
      addi    sp, sp, -96
      call    gcd
      addi    sp, sp, 96
      mv      t0, a0
      sw      t0, 708(sp)
      lw      ra, 704(sp)
      # %__tmp.78 = load i32, ptr %_j2.0
      lw      t1, 160(sp)
      lw      t0, 0(t1)
      sw      t0, 712(sp)
      # %__tmp.79 = load i32, ptr %_j3.0
      lw      t1, 168(sp)
      lw      t0, 0(t1)
      sw      t0, 716(sp)
      # %__tmp.80 = load i32, ptr %_j4.0
      lw      t1, 176(sp)
      lw      t0, 0(t1)
      sw      t0, 720(sp)
      # %__tmp.81 = load i32, ptr %_j5.0
      lw      t1, 184(sp)
      lw      t0, 0(t1)
      sw      t0, 724(sp)
      # %__tmp.82 = load i32, ptr %_j6.0
      lw      t1, 192(sp)
      lw      t0, 0(t1)
      sw      t0, 728(sp)
      # %__tmp.83 = load i32, ptr %_j7.0
      lw      t1, 200(sp)
      lw      t0, 0(t1)
      sw      t0, 732(sp)
      # %__tmp.84 = load i32, ptr %_j8.0
      lw      t1, 208(sp)
      lw      t0, 0(t1)
      sw      t0, 736(sp)
      # %__tmp.85 = load i32, ptr %_j9.0
      lw      t1, 216(sp)
      lw      t0, 0(t1)
      sw      t0, 740(sp)
      # %__tmp.86 = load i32, ptr %_j10.0
      lw      t1, 224(sp)
      lw      t0, 0(t1)
      sw      t0, 744(sp)
      # %__tmp.87 = load i32, ptr %_j11.0
      lw      t1, 232(sp)
      lw      t0, 0(t1)
      sw      t0, 748(sp)
      # %__tmp.88 = load i32, ptr %_j12.0
      lw      t1, 240(sp)
      lw      t0, 0(t1)
      sw      t0, 752(sp)
      # %__tmp.89 = load i32, ptr %_j13.0
      lw      t1, 248(sp)
      lw      t0, 0(t1)
      sw      t0, 756(sp)
      # %__tmp.90 = load i32, ptr %_j14.0
      lw      t1, 256(sp)
      lw      t0, 0(t1)
      sw      t0, 760(sp)
      # %__tmp.91 = load i32, ptr %_j15.0
      lw      t1, 264(sp)
      lw      t0, 0(t1)
      sw      t0, 764(sp)
      # %__tmp.92 = load i32, ptr %_j16.0
      lw      t1, 272(sp)
      lw      t0, 0(t1)
      sw      t0, 768(sp)
      # %__tmp.93 = load i32, ptr %_j17.0
      lw      t1, 280(sp)
      lw      t0, 0(t1)
      sw      t0, 772(sp)
      # %__tmp.94 = load i32, ptr %_j18.0
      lw      t1, 288(sp)
      lw      t0, 0(t1)
      sw      t0, 776(sp)
      # %__tmp.95 = load i32, ptr %_j19.0
      lw      t1, 296(sp)
      lw      t0, 0(t1)
      sw      t0, 780(sp)
      # %__tmp.96 = load i32, ptr %_j20.0
      lw      t1, 304(sp)
      lw      t0, 0(t1)
      sw      t0, 784(sp)
      # %__tmp.97 = load i32, ptr %_j21.0
      lw      t1, 312(sp)
      lw      t0, 0(t1)
      sw      t0, 788(sp)
      # %__tmp.98 = load i32, ptr %_j22.0
      lw      t1, 320(sp)
      lw      t0, 0(t1)
      sw      t0, 792(sp)
      # %__tmp.99 = load i32, ptr %_j23.0
      lw      t1, 328(sp)
      lw      t0, 0(t1)
      sw      t0, 796(sp)
      # %__tmp.100 = load i32, ptr %_j24.0
      lw      t1, 336(sp)
      lw      t0, 0(t1)
      sw      t0, 800(sp)
      # %__tmp.101 = load i32, ptr %_j25.0
      lw      t1, 344(sp)
      lw      t0, 0(t1)
      sw      t0, 804(sp)
      # %__tmp.102 = load i32, ptr %_j26.0
      lw      t1, 352(sp)
      lw      t0, 0(t1)
      sw      t0, 808(sp)
      # %__tmp.103 = load i32, ptr %_j27.0
      lw      t1, 360(sp)
      lw      t0, 0(t1)
      sw      t0, 812(sp)
      # %__tmp.104 = load i32, ptr %_j28.0
      lw      t1, 368(sp)
      lw      t0, 0(t1)
      sw      t0, 816(sp)
      # %__tmp.105 = load i32, ptr %_j29.0
      lw      t1, 376(sp)
      lw      t0, 0(t1)
      sw      t0, 820(sp)
      # %__tmp.71 = call i32 @gcd1(i32 %__tmp.72, i32 %__tmp.75, i32 %__tmp.76, i32 %__tmp.77, i32 %__tmp.78, i32 %__tmp.79, i32 %__tmp.80, i32 %__tmp.81, i32 %__tmp.82, i32 %__tmp.83, i32 %__tmp.84, i32 %__tmp.85, i32 %__tmp.86, i32 %__tmp.87, i32 %__tmp.88, i32 %__tmp.89, i32 %__tmp.90, i32 %__tmp.91, i32 %__tmp.92, i32 %__tmp.93, i32 %__tmp.94, i32 %__tmp.95, i32 %__tmp.96, i32 %__tmp.97, i32 %__tmp.98, i32 %__tmp.99, i32 %__tmp.100, i32 %__tmp.101, i32 %__tmp.102, i32 %__tmp.103, i32 %__tmp.104, i32 %__tmp.105)
      lw      t0, 684(sp)
      mv      a0, t0
      lw      t0, 696(sp)
      mv      a1, t0
      lw      t0, 700(sp)
      mv      a2, t0
      lw      t0, 708(sp)
      mv      a3, t0
      lw      t0, 712(sp)
      mv      a4, t0
      lw      t0, 716(sp)
      mv      a5, t0
      lw      t0, 720(sp)
      mv      a6, t0
      lw      t0, 724(sp)
      mv      a7, t0
      lw      t0, 728(sp)
      sw      t0, -96(sp)
      lw      t0, 732(sp)
      sw      t0, -92(sp)
      lw      t0, 736(sp)
      sw      t0, -88(sp)
      lw      t0, 740(sp)
      sw      t0, -84(sp)
      lw      t0, 744(sp)
      sw      t0, -80(sp)
      lw      t0, 748(sp)
      sw      t0, -76(sp)
      lw      t0, 752(sp)
      sw      t0, -72(sp)
      lw      t0, 756(sp)
      sw      t0, -68(sp)
      lw      t0, 760(sp)
      sw      t0, -64(sp)
      lw      t0, 764(sp)
      sw      t0, -60(sp)
      lw      t0, 768(sp)
      sw      t0, -56(sp)
      lw      t0, 772(sp)
      sw      t0, -52(sp)
      lw      t0, 776(sp)
      sw      t0, -48(sp)
      lw      t0, 780(sp)
      sw      t0, -44(sp)
      lw      t0, 784(sp)
      sw      t0, -40(sp)
      lw      t0, 788(sp)
      sw      t0, -36(sp)
      lw      t0, 792(sp)
      sw      t0, -32(sp)
      lw      t0, 796(sp)
      sw      t0, -28(sp)
      lw      t0, 800(sp)
      sw      t0, -24(sp)
      lw      t0, 804(sp)
      sw      t0, -20(sp)
      lw      t0, 808(sp)
      sw      t0, -16(sp)
      lw      t0, 812(sp)
      sw      t0, -12(sp)
      lw      t0, 816(sp)
      sw      t0, -8(sp)
      lw      t0, 820(sp)
      sw      t0, -4(sp)
      sw      ra, 824(sp)
      addi    sp, sp, -96
      call    gcd1
      addi    sp, sp, 96
      mv      t0, a0
      sw      t0, 828(sp)
      lw      ra, 824(sp)
      # ret i32 %__tmp.71
      lw      t0, 828(sp)
      mv      a0, t0
      addi    sp, sp, 832
      ret     
      # br label %if.merge0
      j       gcd_if.merge0
gcd_if.merge0:
      # ret i32 0
      li      t0, 0
      mv      a0, t0
      addi    sp, sp, 832
      ret     
      .section .text
      .globl gcd1
gcd1:
      addi    sp, sp, -800
      mv      t0, a0
      sw      t0, 0(sp)
      mv      t0, a1
      sw      t0, 4(sp)
      mv      t0, a2
      sw      t0, 8(sp)
      mv      t0, a3
      sw      t0, 12(sp)
      mv      t0, a4
      sw      t0, 16(sp)
      mv      t0, a5
      sw      t0, 20(sp)
      mv      t0, a6
      sw      t0, 24(sp)
      mv      t0, a7
      sw      t0, 28(sp)
      lw      t0, 800(sp)
      sw      t0, 32(sp)
      lw      t0, 804(sp)
      sw      t0, 36(sp)
      lw      t0, 808(sp)
      sw      t0, 40(sp)
      lw      t0, 812(sp)
      sw      t0, 44(sp)
      lw      t0, 816(sp)
      sw      t0, 48(sp)
      lw      t0, 820(sp)
      sw      t0, 52(sp)
      lw      t0, 824(sp)
      sw      t0, 56(sp)
      lw      t0, 828(sp)
      sw      t0, 60(sp)
      lw      t0, 832(sp)
      sw      t0, 64(sp)
      lw      t0, 836(sp)
      sw      t0, 68(sp)
      lw      t0, 840(sp)
      sw      t0, 72(sp)
      lw      t0, 844(sp)
      sw      t0, 76(sp)
      lw      t0, 848(sp)
      sw      t0, 80(sp)
      lw      t0, 852(sp)
      sw      t0, 84(sp)
      lw      t0, 856(sp)
      sw      t0, 88(sp)
      lw      t0, 860(sp)
      sw      t0, 92(sp)
      lw      t0, 864(sp)
      sw      t0, 96(sp)
      lw      t0, 868(sp)
      sw      t0, 100(sp)
      lw      t0, 872(sp)
      sw      t0, 104(sp)
      lw      t0, 876(sp)
      sw      t0, 108(sp)
      lw      t0, 880(sp)
      sw      t0, 112(sp)
      lw      t0, 884(sp)
      sw      t0, 116(sp)
      lw      t0, 888(sp)
      sw      t0, 120(sp)
      lw      t0, 892(sp)
      sw      t0, 124(sp)
gcd1_entry:
      # %_x.1 = alloca i32
      addi    t0, sp, 132
      sw      t0, 128(sp)
      # store i32 %_x, ptr %_x.1
      lw      t0, 0(sp)
      lw      t1, 128(sp)
      sw      t0, 0(t1)
      # %_y.1 = alloca i32
      addi    t0, sp, 140
      sw      t0, 136(sp)
      # store i32 %_y, ptr %_y.1
      lw      t0, 4(sp)
      lw      t1, 136(sp)
      sw      t0, 0(t1)
      # %_j0.1 = alloca i32
      addi    t0, sp, 148
      sw      t0, 144(sp)
      # store i32 %_j0, ptr %_j0.1
      lw      t0, 8(sp)
      lw      t1, 144(sp)
      sw      t0, 0(t1)
      # %_j1.1 = alloca i32
      addi    t0, sp, 156
      sw      t0, 152(sp)
      # store i32 %_j1, ptr %_j1.1
      lw      t0, 12(sp)
      lw      t1, 152(sp)
      sw      t0, 0(t1)
      # %_j2.1 = alloca i32
      addi    t0, sp, 164
      sw      t0, 160(sp)
      # store i32 %_j2, ptr %_j2.1
      lw      t0, 16(sp)
      lw      t1, 160(sp)
      sw      t0, 0(t1)
      # %_j3.1 = alloca i32
      addi    t0, sp, 172
      sw      t0, 168(sp)
      # store i32 %_j3, ptr %_j3.1
      lw      t0, 20(sp)
      lw      t1, 168(sp)
      sw      t0, 0(t1)
      # %_j4.1 = alloca i32
      addi    t0, sp, 180
      sw      t0, 176(sp)
      # store i32 %_j4, ptr %_j4.1
      lw      t0, 24(sp)
      lw      t1, 176(sp)
      sw      t0, 0(t1)
      # %_j5.1 = alloca i32
      addi    t0, sp, 188
      sw      t0, 184(sp)
      # store i32 %_j5, ptr %_j5.1
      lw      t0, 28(sp)
      lw      t1, 184(sp)
      sw      t0, 0(t1)
      # %_j6.1 = alloca i32
      addi    t0, sp, 196
      sw      t0, 192(sp)
      # store i32 %_j6, ptr %_j6.1
      lw      t0, 32(sp)
      lw      t1, 192(sp)
      sw      t0, 0(t1)
      # %_j7.1 = alloca i32
      addi    t0, sp, 204
      sw      t0, 200(sp)
      # store i32 %_j7, ptr %_j7.1
      lw      t0, 36(sp)
      lw      t1, 200(sp)
      sw      t0, 0(t1)
      # %_j8.1 = alloca i32
      addi    t0, sp, 212
      sw      t0, 208(sp)
      # store i32 %_j8, ptr %_j8.1
      lw      t0, 40(sp)
      lw      t1, 208(sp)
      sw      t0, 0(t1)
      # %_j9.1 = alloca i32
      addi    t0, sp, 220
      sw      t0, 216(sp)
      # store i32 %_j9, ptr %_j9.1
      lw      t0, 44(sp)
      lw      t1, 216(sp)
      sw      t0, 0(t1)
      # %_j10.1 = alloca i32
      addi    t0, sp, 228
      sw      t0, 224(sp)
      # store i32 %_j10, ptr %_j10.1
      lw      t0, 48(sp)
      lw      t1, 224(sp)
      sw      t0, 0(t1)
      # %_j11.1 = alloca i32
      addi    t0, sp, 236
      sw      t0, 232(sp)
      # store i32 %_j11, ptr %_j11.1
      lw      t0, 52(sp)
      lw      t1, 232(sp)
      sw      t0, 0(t1)
      # %_j12.1 = alloca i32
      addi    t0, sp, 244
      sw      t0, 240(sp)
      # store i32 %_j12, ptr %_j12.1
      lw      t0, 56(sp)
      lw      t1, 240(sp)
      sw      t0, 0(t1)
      # %_j13.1 = alloca i32
      addi    t0, sp, 252
      sw      t0, 248(sp)
      # store i32 %_j13, ptr %_j13.1
      lw      t0, 60(sp)
      lw      t1, 248(sp)
      sw      t0, 0(t1)
      # %_j14.1 = alloca i32
      addi    t0, sp, 260
      sw      t0, 256(sp)
      # store i32 %_j14, ptr %_j14.1
      lw      t0, 64(sp)
      lw      t1, 256(sp)
      sw      t0, 0(t1)
      # %_j15.1 = alloca i32
      addi    t0, sp, 268
      sw      t0, 264(sp)
      # store i32 %_j15, ptr %_j15.1
      lw      t0, 68(sp)
      lw      t1, 264(sp)
      sw      t0, 0(t1)
      # %_j16.1 = alloca i32
      addi    t0, sp, 276
      sw      t0, 272(sp)
      # store i32 %_j16, ptr %_j16.1
      lw      t0, 72(sp)
      lw      t1, 272(sp)
      sw      t0, 0(t1)
      # %_j17.1 = alloca i32
      addi    t0, sp, 284
      sw      t0, 280(sp)
      # store i32 %_j17, ptr %_j17.1
      lw      t0, 76(sp)
      lw      t1, 280(sp)
      sw      t0, 0(t1)
      # %_j18.1 = alloca i32
      addi    t0, sp, 292
      sw      t0, 288(sp)
      # store i32 %_j18, ptr %_j18.1
      lw      t0, 80(sp)
      lw      t1, 288(sp)
      sw      t0, 0(t1)
      # %_j19.1 = alloca i32
      addi    t0, sp, 300
      sw      t0, 296(sp)
      # store i32 %_j19, ptr %_j19.1
      lw      t0, 84(sp)
      lw      t1, 296(sp)
      sw      t0, 0(t1)
      # %_j20.1 = alloca i32
      addi    t0, sp, 308
      sw      t0, 304(sp)
      # store i32 %_j20, ptr %_j20.1
      lw      t0, 88(sp)
      lw      t1, 304(sp)
      sw      t0, 0(t1)
      # %_j21.1 = alloca i32
      addi    t0, sp, 316
      sw      t0, 312(sp)
      # store i32 %_j21, ptr %_j21.1
      lw      t0, 92(sp)
      lw      t1, 312(sp)
      sw      t0, 0(t1)
      # %_j22.1 = alloca i32
      addi    t0, sp, 324
      sw      t0, 320(sp)
      # store i32 %_j22, ptr %_j22.1
      lw      t0, 96(sp)
      lw      t1, 320(sp)
      sw      t0, 0(t1)
      # %_j23.1 = alloca i32
      addi    t0, sp, 332
      sw      t0, 328(sp)
      # store i32 %_j23, ptr %_j23.1
      lw      t0, 100(sp)
      lw      t1, 328(sp)
      sw      t0, 0(t1)
      # %_j24.1 = alloca i32
      addi    t0, sp, 340
      sw      t0, 336(sp)
      # store i32 %_j24, ptr %_j24.1
      lw      t0, 104(sp)
      lw      t1, 336(sp)
      sw      t0, 0(t1)
      # %_j25.1 = alloca i32
      addi    t0, sp, 348
      sw      t0, 344(sp)
      # store i32 %_j25, ptr %_j25.1
      lw      t0, 108(sp)
      lw      t1, 344(sp)
      sw      t0, 0(t1)
      # %_j26.1 = alloca i32
      addi    t0, sp, 356
      sw      t0, 352(sp)
      # store i32 %_j26, ptr %_j26.1
      lw      t0, 112(sp)
      lw      t1, 352(sp)
      sw      t0, 0(t1)
      # %_j27.1 = alloca i32
      addi    t0, sp, 364
      sw      t0, 360(sp)
      # store i32 %_j27, ptr %_j27.1
      lw      t0, 116(sp)
      lw      t1, 360(sp)
      sw      t0, 0(t1)
      # %_j28.1 = alloca i32
      addi    t0, sp, 372
      sw      t0, 368(sp)
      # store i32 %_j28, ptr %_j28.1
      lw      t0, 120(sp)
      lw      t1, 368(sp)
      sw      t0, 0(t1)
      # %_j29.1 = alloca i32
      addi    t0, sp, 380
      sw      t0, 376(sp)
      # store i32 %_j29, ptr %_j29.1
      lw      t0, 124(sp)
      lw      t1, 376(sp)
      sw      t0, 0(t1)
      # %_j.1 = alloca i32
      addi    t0, sp, 388
      sw      t0, 384(sp)
      # %__tmp.106 = load i32, ptr %_j.1
      lw      t1, 384(sp)
      lw      t0, 0(t1)
      sw      t0, 392(sp)
      # %__tmp.107 = load i32, ptr %_j0.1
      lw      t1, 144(sp)
      lw      t0, 0(t1)
      sw      t0, 396(sp)
      # %__tmp.108 = load i32, ptr %_j1.1
      lw      t1, 152(sp)
      lw      t0, 0(t1)
      sw      t0, 400(sp)
      # %__tmp.109 = add i32 %__tmp.107, %__tmp.108
      lw      t1, 396(sp)
      lw      t2, 400(sp)
      add     t0, t1, t2
      sw      t0, 404(sp)
      # %__tmp.110 = load i32, ptr %_j2.1
      lw      t1, 160(sp)
      lw      t0, 0(t1)
      sw      t0, 408(sp)
      # %__tmp.111 = add i32 %__tmp.109, %__tmp.110
      lw      t1, 404(sp)
      lw      t2, 408(sp)
      add     t0, t1, t2
      sw      t0, 412(sp)
      # %__tmp.112 = load i32, ptr %_j3.1
      lw      t1, 168(sp)
      lw      t0, 0(t1)
      sw      t0, 416(sp)
      # %__tmp.113 = add i32 %__tmp.111, %__tmp.112
      lw      t1, 412(sp)
      lw      t2, 416(sp)
      add     t0, t1, t2
      sw      t0, 420(sp)
      # %__tmp.114 = load i32, ptr %_j4.1
      lw      t1, 176(sp)
      lw      t0, 0(t1)
      sw      t0, 424(sp)
      # %__tmp.115 = add i32 %__tmp.113, %__tmp.114
      lw      t1, 420(sp)
      lw      t2, 424(sp)
      add     t0, t1, t2
      sw      t0, 428(sp)
      # %__tmp.116 = load i32, ptr %_j5.1
      lw      t1, 184(sp)
      lw      t0, 0(t1)
      sw      t0, 432(sp)
      # %__tmp.117 = add i32 %__tmp.115, %__tmp.116
      lw      t1, 428(sp)
      lw      t2, 432(sp)
      add     t0, t1, t2
      sw      t0, 436(sp)
      # %__tmp.118 = load i32, ptr %_j6.1
      lw      t1, 192(sp)
      lw      t0, 0(t1)
      sw      t0, 440(sp)
      # %__tmp.119 = add i32 %__tmp.117, %__tmp.118
      lw      t1, 436(sp)
      lw      t2, 440(sp)
      add     t0, t1, t2
      sw      t0, 444(sp)
      # %__tmp.120 = load i32, ptr %_j7.1
      lw      t1, 200(sp)
      lw      t0, 0(t1)
      sw      t0, 448(sp)
      # %__tmp.121 = add i32 %__tmp.119, %__tmp.120
      lw      t1, 444(sp)
      lw      t2, 448(sp)
      add     t0, t1, t2
      sw      t0, 452(sp)
      # %__tmp.122 = load i32, ptr %_j8.1
      lw      t1, 208(sp)
      lw      t0, 0(t1)
      sw      t0, 456(sp)
      # %__tmp.123 = add i32 %__tmp.121, %__tmp.122
      lw      t1, 452(sp)
      lw      t2, 456(sp)
      add     t0, t1, t2
      sw      t0, 460(sp)
      # %__tmp.124 = load i32, ptr %_j9.1
      lw      t1, 216(sp)
      lw      t0, 0(t1)
      sw      t0, 464(sp)
      # %__tmp.125 = add i32 %__tmp.123, %__tmp.124
      lw      t1, 460(sp)
      lw      t2, 464(sp)
      add     t0, t1, t2
      sw      t0, 468(sp)
      # %__tmp.126 = load i32, ptr %_j10.1
      lw      t1, 224(sp)
      lw      t0, 0(t1)
      sw      t0, 472(sp)
      # %__tmp.127 = add i32 %__tmp.125, %__tmp.126
      lw      t1, 468(sp)
      lw      t2, 472(sp)
      add     t0, t1, t2
      sw      t0, 476(sp)
      # %__tmp.128 = load i32, ptr %_j11.1
      lw      t1, 232(sp)
      lw      t0, 0(t1)
      sw      t0, 480(sp)
      # %__tmp.129 = add i32 %__tmp.127, %__tmp.128
      lw      t1, 476(sp)
      lw      t2, 480(sp)
      add     t0, t1, t2
      sw      t0, 484(sp)
      # %__tmp.130 = load i32, ptr %_j12.1
      lw      t1, 240(sp)
      lw      t0, 0(t1)
      sw      t0, 488(sp)
      # %__tmp.131 = add i32 %__tmp.129, %__tmp.130
      lw      t1, 484(sp)
      lw      t2, 488(sp)
      add     t0, t1, t2
      sw      t0, 492(sp)
      # %__tmp.132 = load i32, ptr %_j13.1
      lw      t1, 248(sp)
      lw      t0, 0(t1)
      sw      t0, 496(sp)
      # %__tmp.133 = add i32 %__tmp.131, %__tmp.132
      lw      t1, 492(sp)
      lw      t2, 496(sp)
      add     t0, t1, t2
      sw      t0, 500(sp)
      # %__tmp.134 = load i32, ptr %_j14.1
      lw      t1, 256(sp)
      lw      t0, 0(t1)
      sw      t0, 504(sp)
      # %__tmp.135 = add i32 %__tmp.133, %__tmp.134
      lw      t1, 500(sp)
      lw      t2, 504(sp)
      add     t0, t1, t2
      sw      t0, 508(sp)
      # %__tmp.136 = load i32, ptr %_j15.1
      lw      t1, 264(sp)
      lw      t0, 0(t1)
      sw      t0, 512(sp)
      # %__tmp.137 = add i32 %__tmp.135, %__tmp.136
      lw      t1, 508(sp)
      lw      t2, 512(sp)
      add     t0, t1, t2
      sw      t0, 516(sp)
      # %__tmp.138 = load i32, ptr %_j16.1
      lw      t1, 272(sp)
      lw      t0, 0(t1)
      sw      t0, 520(sp)
      # %__tmp.139 = add i32 %__tmp.137, %__tmp.138
      lw      t1, 516(sp)
      lw      t2, 520(sp)
      add     t0, t1, t2
      sw      t0, 524(sp)
      # %__tmp.140 = load i32, ptr %_j17.1
      lw      t1, 280(sp)
      lw      t0, 0(t1)
      sw      t0, 528(sp)
      # %__tmp.141 = add i32 %__tmp.139, %__tmp.140
      lw      t1, 524(sp)
      lw      t2, 528(sp)
      add     t0, t1, t2
      sw      t0, 532(sp)
      # %__tmp.142 = load i32, ptr %_j18.1
      lw      t1, 288(sp)
      lw      t0, 0(t1)
      sw      t0, 536(sp)
      # %__tmp.143 = add i32 %__tmp.141, %__tmp.142
      lw      t1, 532(sp)
      lw      t2, 536(sp)
      add     t0, t1, t2
      sw      t0, 540(sp)
      # %__tmp.144 = load i32, ptr %_j19.1
      lw      t1, 296(sp)
      lw      t0, 0(t1)
      sw      t0, 544(sp)
      # %__tmp.145 = add i32 %__tmp.143, %__tmp.144
      lw      t1, 540(sp)
      lw      t2, 544(sp)
      add     t0, t1, t2
      sw      t0, 548(sp)
      # %__tmp.146 = load i32, ptr %_j20.1
      lw      t1, 304(sp)
      lw      t0, 0(t1)
      sw      t0, 552(sp)
      # %__tmp.147 = add i32 %__tmp.145, %__tmp.146
      lw      t1, 548(sp)
      lw      t2, 552(sp)
      add     t0, t1, t2
      sw      t0, 556(sp)
      # %__tmp.148 = load i32, ptr %_j21.1
      lw      t1, 312(sp)
      lw      t0, 0(t1)
      sw      t0, 560(sp)
      # %__tmp.149 = add i32 %__tmp.147, %__tmp.148
      lw      t1, 556(sp)
      lw      t2, 560(sp)
      add     t0, t1, t2
      sw      t0, 564(sp)
      # %__tmp.150 = load i32, ptr %_j22.1
      lw      t1, 320(sp)
      lw      t0, 0(t1)
      sw      t0, 568(sp)
      # %__tmp.151 = add i32 %__tmp.149, %__tmp.150
      lw      t1, 564(sp)
      lw      t2, 568(sp)
      add     t0, t1, t2
      sw      t0, 572(sp)
      # %__tmp.152 = load i32, ptr %_j23.1
      lw      t1, 328(sp)
      lw      t0, 0(t1)
      sw      t0, 576(sp)
      # %__tmp.153 = add i32 %__tmp.151, %__tmp.152
      lw      t1, 572(sp)
      lw      t2, 576(sp)
      add     t0, t1, t2
      sw      t0, 580(sp)
      # %__tmp.154 = load i32, ptr %_j24.1
      lw      t1, 336(sp)
      lw      t0, 0(t1)
      sw      t0, 584(sp)
      # %__tmp.155 = add i32 %__tmp.153, %__tmp.154
      lw      t1, 580(sp)
      lw      t2, 584(sp)
      add     t0, t1, t2
      sw      t0, 588(sp)
      # %__tmp.156 = load i32, ptr %_j25.1
      lw      t1, 344(sp)
      lw      t0, 0(t1)
      sw      t0, 592(sp)
      # %__tmp.157 = add i32 %__tmp.155, %__tmp.156
      lw      t1, 588(sp)
      lw      t2, 592(sp)
      add     t0, t1, t2
      sw      t0, 596(sp)
      # %__tmp.158 = load i32, ptr %_j26.1
      lw      t1, 352(sp)
      lw      t0, 0(t1)
      sw      t0, 600(sp)
      # %__tmp.159 = add i32 %__tmp.157, %__tmp.158
      lw      t1, 596(sp)
      lw      t2, 600(sp)
      add     t0, t1, t2
      sw      t0, 604(sp)
      # %__tmp.160 = load i32, ptr %_j27.1
      lw      t1, 360(sp)
      lw      t0, 0(t1)
      sw      t0, 608(sp)
      # %__tmp.161 = add i32 %__tmp.159, %__tmp.160
      lw      t1, 604(sp)
      lw      t2, 608(sp)
      add     t0, t1, t2
      sw      t0, 612(sp)
      # %__tmp.162 = load i32, ptr %_j28.1
      lw      t1, 368(sp)
      lw      t0, 0(t1)
      sw      t0, 616(sp)
      # %__tmp.163 = add i32 %__tmp.161, %__tmp.162
      lw      t1, 612(sp)
      lw      t2, 616(sp)
      add     t0, t1, t2
      sw      t0, 620(sp)
      # %__tmp.164 = load i32, ptr %_j29.1
      lw      t1, 376(sp)
      lw      t0, 0(t1)
      sw      t0, 624(sp)
      # %__tmp.165 = add i32 %__tmp.163, %__tmp.164
      lw      t1, 620(sp)
      lw      t2, 624(sp)
      add     t0, t1, t2
      sw      t0, 628(sp)
      # %__tmp.166 = srem i32 %__tmp.165, 100
      li      t2, 100
      lw      t1, 628(sp)
      rem     t0, t1, t2
      sw      t0, 632(sp)
      # store i32 %__tmp.166, ptr %_j.1
      lw      t0, 632(sp)
      lw      t1, 384(sp)
      sw      t0, 0(t1)
      # %__tmp.167 = load i32, ptr %_x.1
      lw      t1, 128(sp)
      lw      t0, 0(t1)
      sw      t0, 636(sp)
      # %__tmp.168 = load i32, ptr %_y.1
      lw      t1, 136(sp)
      lw      t0, 0(t1)
      sw      t0, 640(sp)
      # %__tmp.169 = srem i32 %__tmp.167, %__tmp.168
      lw      t1, 636(sp)
      lw      t2, 640(sp)
      rem     t0, t1, t2
      sw      t0, 644(sp)
      # %__tmp.170 = icmp eq i32 %__tmp.169, 0
      li      t2, 0
      lw      t1, 644(sp)
      sub     t0, t1, t2
      seqz    t3, t0
      mv      t0, t3
      sw      t0, 648(sp)
      # br i1 %__tmp.170, label %if.then1, label %if.else1
      lw      t0, 648(sp)
      beqz     t0, gcd1_jump2
      j       gcd1_if.then1
gcd1_jump2:
      j       gcd1_if.else1
gcd1_if.then1:
      # %__tmp.171 = load i32, ptr %_y.1
      lw      t1, 136(sp)
      lw      t0, 0(t1)
      sw      t0, 652(sp)
      # ret i32 %__tmp.171
      lw      t0, 652(sp)
      mv      a0, t0
      addi    sp, sp, 800
      ret     
      # br label %if.merge1
      j       gcd1_if.merge1
gcd1_if.else1:
      # %__tmp.173 = load i32, ptr %_y.1
      lw      t1, 136(sp)
      lw      t0, 0(t1)
      sw      t0, 656(sp)
      # %__tmp.174 = load i32, ptr %_x.1
      lw      t1, 128(sp)
      lw      t0, 0(t1)
      sw      t0, 660(sp)
      # %__tmp.175 = load i32, ptr %_y.1
      lw      t1, 136(sp)
      lw      t0, 0(t1)
      sw      t0, 664(sp)
      # %__tmp.176 = srem i32 %__tmp.174, %__tmp.175
      lw      t1, 660(sp)
      lw      t2, 664(sp)
      rem     t0, t1, t2
      sw      t0, 668(sp)
      # %__tmp.177 = load i32, ptr %_j.1
      lw      t1, 384(sp)
      lw      t0, 0(t1)
      sw      t0, 672(sp)
      # %__tmp.178 = load i32, ptr %_j1.1
      lw      t1, 152(sp)
      lw      t0, 0(t1)
      sw      t0, 676(sp)
      # %__tmp.179 = load i32, ptr %_j2.1
      lw      t1, 160(sp)
      lw      t0, 0(t1)
      sw      t0, 680(sp)
      # %__tmp.180 = load i32, ptr %_j3.1
      lw      t1, 168(sp)
      lw      t0, 0(t1)
      sw      t0, 684(sp)
      # %__tmp.181 = load i32, ptr %_j4.1
      lw      t1, 176(sp)
      lw      t0, 0(t1)
      sw      t0, 688(sp)
      # %__tmp.182 = load i32, ptr %_j5.1
      lw      t1, 184(sp)
      lw      t0, 0(t1)
      sw      t0, 692(sp)
      # %__tmp.183 = load i32, ptr %_j6.1
      lw      t1, 192(sp)
      lw      t0, 0(t1)
      sw      t0, 696(sp)
      # %__tmp.184 = load i32, ptr %_j7.1
      lw      t1, 200(sp)
      lw      t0, 0(t1)
      sw      t0, 700(sp)
      # %__tmp.185 = load i32, ptr %_j8.1
      lw      t1, 208(sp)
      lw      t0, 0(t1)
      sw      t0, 704(sp)
      # %__tmp.186 = load i32, ptr %_j9.1
      lw      t1, 216(sp)
      lw      t0, 0(t1)
      sw      t0, 708(sp)
      # %__tmp.187 = load i32, ptr %_j10.1
      lw      t1, 224(sp)
      lw      t0, 0(t1)
      sw      t0, 712(sp)
      # %__tmp.188 = load i32, ptr %_j11.1
      lw      t1, 232(sp)
      lw      t0, 0(t1)
      sw      t0, 716(sp)
      # %__tmp.189 = load i32, ptr %_j12.1
      lw      t1, 240(sp)
      lw      t0, 0(t1)
      sw      t0, 720(sp)
      # %__tmp.190 = load i32, ptr %_j13.1
      lw      t1, 248(sp)
      lw      t0, 0(t1)
      sw      t0, 724(sp)
      # %__tmp.191 = load i32, ptr %_j14.1
      lw      t1, 256(sp)
      lw      t0, 0(t1)
      sw      t0, 728(sp)
      # %__tmp.192 = load i32, ptr %_j15.1
      lw      t1, 264(sp)
      lw      t0, 0(t1)
      sw      t0, 732(sp)
      # %__tmp.193 = load i32, ptr %_j16.1
      lw      t1, 272(sp)
      lw      t0, 0(t1)
      sw      t0, 736(sp)
      # %__tmp.194 = load i32, ptr %_j17.1
      lw      t1, 280(sp)
      lw      t0, 0(t1)
      sw      t0, 740(sp)
      # %__tmp.195 = load i32, ptr %_j18.1
      lw      t1, 288(sp)
      lw      t0, 0(t1)
      sw      t0, 744(sp)
      # %__tmp.196 = load i32, ptr %_j19.1
      lw      t1, 296(sp)
      lw      t0, 0(t1)
      sw      t0, 748(sp)
      # %__tmp.197 = load i32, ptr %_j20.1
      lw      t1, 304(sp)
      lw      t0, 0(t1)
      sw      t0, 752(sp)
      # %__tmp.198 = load i32, ptr %_j21.1
      lw      t1, 312(sp)
      lw      t0, 0(t1)
      sw      t0, 756(sp)
      # %__tmp.199 = load i32, ptr %_j22.1
      lw      t1, 320(sp)
      lw      t0, 0(t1)
      sw      t0, 760(sp)
      # %__tmp.200 = load i32, ptr %_j23.1
      lw      t1, 328(sp)
      lw      t0, 0(t1)
      sw      t0, 764(sp)
      # %__tmp.201 = load i32, ptr %_j24.1
      lw      t1, 336(sp)
      lw      t0, 0(t1)
      sw      t0, 768(sp)
      # %__tmp.202 = load i32, ptr %_j25.1
      lw      t1, 344(sp)
      lw      t0, 0(t1)
      sw      t0, 772(sp)
      # %__tmp.203 = load i32, ptr %_j26.1
      lw      t1, 352(sp)
      lw      t0, 0(t1)
      sw      t0, 776(sp)
      # %__tmp.204 = load i32, ptr %_j27.1
      lw      t1, 360(sp)
      lw      t0, 0(t1)
      sw      t0, 780(sp)
      # %__tmp.205 = load i32, ptr %_j28.1
      lw      t1, 368(sp)
      lw      t0, 0(t1)
      sw      t0, 784(sp)
      # %__tmp.206 = load i32, ptr %_j29.1
      lw      t1, 376(sp)
      lw      t0, 0(t1)
      sw      t0, 788(sp)
      # %__tmp.172 = call i32 @gcd2(i32 %__tmp.173, i32 %__tmp.176, i32 %__tmp.177, i32 %__tmp.178, i32 %__tmp.179, i32 %__tmp.180, i32 %__tmp.181, i32 %__tmp.182, i32 %__tmp.183, i32 %__tmp.184, i32 %__tmp.185, i32 %__tmp.186, i32 %__tmp.187, i32 %__tmp.188, i32 %__tmp.189, i32 %__tmp.190, i32 %__tmp.191, i32 %__tmp.192, i32 %__tmp.193, i32 %__tmp.194, i32 %__tmp.195, i32 %__tmp.196, i32 %__tmp.197, i32 %__tmp.198, i32 %__tmp.199, i32 %__tmp.200, i32 %__tmp.201, i32 %__tmp.202, i32 %__tmp.203, i32 %__tmp.204, i32 %__tmp.205, i32 %__tmp.206)
      lw      t0, 656(sp)
      mv      a0, t0
      lw      t0, 668(sp)
      mv      a1, t0
      lw      t0, 672(sp)
      mv      a2, t0
      lw      t0, 676(sp)
      mv      a3, t0
      lw      t0, 680(sp)
      mv      a4, t0
      lw      t0, 684(sp)
      mv      a5, t0
      lw      t0, 688(sp)
      mv      a6, t0
      lw      t0, 692(sp)
      mv      a7, t0
      lw      t0, 696(sp)
      sw      t0, -96(sp)
      lw      t0, 700(sp)
      sw      t0, -92(sp)
      lw      t0, 704(sp)
      sw      t0, -88(sp)
      lw      t0, 708(sp)
      sw      t0, -84(sp)
      lw      t0, 712(sp)
      sw      t0, -80(sp)
      lw      t0, 716(sp)
      sw      t0, -76(sp)
      lw      t0, 720(sp)
      sw      t0, -72(sp)
      lw      t0, 724(sp)
      sw      t0, -68(sp)
      lw      t0, 728(sp)
      sw      t0, -64(sp)
      lw      t0, 732(sp)
      sw      t0, -60(sp)
      lw      t0, 736(sp)
      sw      t0, -56(sp)
      lw      t0, 740(sp)
      sw      t0, -52(sp)
      lw      t0, 744(sp)
      sw      t0, -48(sp)
      lw      t0, 748(sp)
      sw      t0, -44(sp)
      lw      t0, 752(sp)
      sw      t0, -40(sp)
      lw      t0, 756(sp)
      sw      t0, -36(sp)
      lw      t0, 760(sp)
      sw      t0, -32(sp)
      lw      t0, 764(sp)
      sw      t0, -28(sp)
      lw      t0, 768(sp)
      sw      t0, -24(sp)
      lw      t0, 772(sp)
      sw      t0, -20(sp)
      lw      t0, 776(sp)
      sw      t0, -16(sp)
      lw      t0, 780(sp)
      sw      t0, -12(sp)
      lw      t0, 784(sp)
      sw      t0, -8(sp)
      lw      t0, 788(sp)
      sw      t0, -4(sp)
      sw      ra, 792(sp)
      addi    sp, sp, -96
      call    gcd2
      addi    sp, sp, 96
      mv      t0, a0
      sw      t0, 796(sp)
      lw      ra, 792(sp)
      # ret i32 %__tmp.172
      lw      t0, 796(sp)
      mv      a0, t0
      addi    sp, sp, 800
      ret     
      # br label %if.merge1
      j       gcd1_if.merge1
gcd1_if.merge1:
      # ret i32 0
      li      t0, 0
      mv      a0, t0
      addi    sp, sp, 800
      ret     
      .section .text
      .globl gcd2
gcd2:
      addi    sp, sp, -800
      mv      t0, a0
      sw      t0, 0(sp)
      mv      t0, a1
      sw      t0, 4(sp)
      mv      t0, a2
      sw      t0, 8(sp)
      mv      t0, a3
      sw      t0, 12(sp)
      mv      t0, a4
      sw      t0, 16(sp)
      mv      t0, a5
      sw      t0, 20(sp)
      mv      t0, a6
      sw      t0, 24(sp)
      mv      t0, a7
      sw      t0, 28(sp)
      lw      t0, 800(sp)
      sw      t0, 32(sp)
      lw      t0, 804(sp)
      sw      t0, 36(sp)
      lw      t0, 808(sp)
      sw      t0, 40(sp)
      lw      t0, 812(sp)
      sw      t0, 44(sp)
      lw      t0, 816(sp)
      sw      t0, 48(sp)
      lw      t0, 820(sp)
      sw      t0, 52(sp)
      lw      t0, 824(sp)
      sw      t0, 56(sp)
      lw      t0, 828(sp)
      sw      t0, 60(sp)
      lw      t0, 832(sp)
      sw      t0, 64(sp)
      lw      t0, 836(sp)
      sw      t0, 68(sp)
      lw      t0, 840(sp)
      sw      t0, 72(sp)
      lw      t0, 844(sp)
      sw      t0, 76(sp)
      lw      t0, 848(sp)
      sw      t0, 80(sp)
      lw      t0, 852(sp)
      sw      t0, 84(sp)
      lw      t0, 856(sp)
      sw      t0, 88(sp)
      lw      t0, 860(sp)
      sw      t0, 92(sp)
      lw      t0, 864(sp)
      sw      t0, 96(sp)
      lw      t0, 868(sp)
      sw      t0, 100(sp)
      lw      t0, 872(sp)
      sw      t0, 104(sp)
      lw      t0, 876(sp)
      sw      t0, 108(sp)
      lw      t0, 880(sp)
      sw      t0, 112(sp)
      lw      t0, 884(sp)
      sw      t0, 116(sp)
      lw      t0, 888(sp)
      sw      t0, 120(sp)
      lw      t0, 892(sp)
      sw      t0, 124(sp)
gcd2_entry:
      # %_x.2 = alloca i32
      addi    t0, sp, 132
      sw      t0, 128(sp)
      # store i32 %_x, ptr %_x.2
      lw      t0, 0(sp)
      lw      t1, 128(sp)
      sw      t0, 0(t1)
      # %_y.2 = alloca i32
      addi    t0, sp, 140
      sw      t0, 136(sp)
      # store i32 %_y, ptr %_y.2
      lw      t0, 4(sp)
      lw      t1, 136(sp)
      sw      t0, 0(t1)
      # %_j0.2 = alloca i32
      addi    t0, sp, 148
      sw      t0, 144(sp)
      # store i32 %_j0, ptr %_j0.2
      lw      t0, 8(sp)
      lw      t1, 144(sp)
      sw      t0, 0(t1)
      # %_j1.2 = alloca i32
      addi    t0, sp, 156
      sw      t0, 152(sp)
      # store i32 %_j1, ptr %_j1.2
      lw      t0, 12(sp)
      lw      t1, 152(sp)
      sw      t0, 0(t1)
      # %_j2.2 = alloca i32
      addi    t0, sp, 164
      sw      t0, 160(sp)
      # store i32 %_j2, ptr %_j2.2
      lw      t0, 16(sp)
      lw      t1, 160(sp)
      sw      t0, 0(t1)
      # %_j3.2 = alloca i32
      addi    t0, sp, 172
      sw      t0, 168(sp)
      # store i32 %_j3, ptr %_j3.2
      lw      t0, 20(sp)
      lw      t1, 168(sp)
      sw      t0, 0(t1)
      # %_j4.2 = alloca i32
      addi    t0, sp, 180
      sw      t0, 176(sp)
      # store i32 %_j4, ptr %_j4.2
      lw      t0, 24(sp)
      lw      t1, 176(sp)
      sw      t0, 0(t1)
      # %_j5.2 = alloca i32
      addi    t0, sp, 188
      sw      t0, 184(sp)
      # store i32 %_j5, ptr %_j5.2
      lw      t0, 28(sp)
      lw      t1, 184(sp)
      sw      t0, 0(t1)
      # %_j6.2 = alloca i32
      addi    t0, sp, 196
      sw      t0, 192(sp)
      # store i32 %_j6, ptr %_j6.2
      lw      t0, 32(sp)
      lw      t1, 192(sp)
      sw      t0, 0(t1)
      # %_j7.2 = alloca i32
      addi    t0, sp, 204
      sw      t0, 200(sp)
      # store i32 %_j7, ptr %_j7.2
      lw      t0, 36(sp)
      lw      t1, 200(sp)
      sw      t0, 0(t1)
      # %_j8.2 = alloca i32
      addi    t0, sp, 212
      sw      t0, 208(sp)
      # store i32 %_j8, ptr %_j8.2
      lw      t0, 40(sp)
      lw      t1, 208(sp)
      sw      t0, 0(t1)
      # %_j9.2 = alloca i32
      addi    t0, sp, 220
      sw      t0, 216(sp)
      # store i32 %_j9, ptr %_j9.2
      lw      t0, 44(sp)
      lw      t1, 216(sp)
      sw      t0, 0(t1)
      # %_j10.2 = alloca i32
      addi    t0, sp, 228
      sw      t0, 224(sp)
      # store i32 %_j10, ptr %_j10.2
      lw      t0, 48(sp)
      lw      t1, 224(sp)
      sw      t0, 0(t1)
      # %_j11.2 = alloca i32
      addi    t0, sp, 236
      sw      t0, 232(sp)
      # store i32 %_j11, ptr %_j11.2
      lw      t0, 52(sp)
      lw      t1, 232(sp)
      sw      t0, 0(t1)
      # %_j12.2 = alloca i32
      addi    t0, sp, 244
      sw      t0, 240(sp)
      # store i32 %_j12, ptr %_j12.2
      lw      t0, 56(sp)
      lw      t1, 240(sp)
      sw      t0, 0(t1)
      # %_j13.2 = alloca i32
      addi    t0, sp, 252
      sw      t0, 248(sp)
      # store i32 %_j13, ptr %_j13.2
      lw      t0, 60(sp)
      lw      t1, 248(sp)
      sw      t0, 0(t1)
      # %_j14.2 = alloca i32
      addi    t0, sp, 260
      sw      t0, 256(sp)
      # store i32 %_j14, ptr %_j14.2
      lw      t0, 64(sp)
      lw      t1, 256(sp)
      sw      t0, 0(t1)
      # %_j15.2 = alloca i32
      addi    t0, sp, 268
      sw      t0, 264(sp)
      # store i32 %_j15, ptr %_j15.2
      lw      t0, 68(sp)
      lw      t1, 264(sp)
      sw      t0, 0(t1)
      # %_j16.2 = alloca i32
      addi    t0, sp, 276
      sw      t0, 272(sp)
      # store i32 %_j16, ptr %_j16.2
      lw      t0, 72(sp)
      lw      t1, 272(sp)
      sw      t0, 0(t1)
      # %_j17.2 = alloca i32
      addi    t0, sp, 284
      sw      t0, 280(sp)
      # store i32 %_j17, ptr %_j17.2
      lw      t0, 76(sp)
      lw      t1, 280(sp)
      sw      t0, 0(t1)
      # %_j18.2 = alloca i32
      addi    t0, sp, 292
      sw      t0, 288(sp)
      # store i32 %_j18, ptr %_j18.2
      lw      t0, 80(sp)
      lw      t1, 288(sp)
      sw      t0, 0(t1)
      # %_j19.2 = alloca i32
      addi    t0, sp, 300
      sw      t0, 296(sp)
      # store i32 %_j19, ptr %_j19.2
      lw      t0, 84(sp)
      lw      t1, 296(sp)
      sw      t0, 0(t1)
      # %_j20.2 = alloca i32
      addi    t0, sp, 308
      sw      t0, 304(sp)
      # store i32 %_j20, ptr %_j20.2
      lw      t0, 88(sp)
      lw      t1, 304(sp)
      sw      t0, 0(t1)
      # %_j21.2 = alloca i32
      addi    t0, sp, 316
      sw      t0, 312(sp)
      # store i32 %_j21, ptr %_j21.2
      lw      t0, 92(sp)
      lw      t1, 312(sp)
      sw      t0, 0(t1)
      # %_j22.2 = alloca i32
      addi    t0, sp, 324
      sw      t0, 320(sp)
      # store i32 %_j22, ptr %_j22.2
      lw      t0, 96(sp)
      lw      t1, 320(sp)
      sw      t0, 0(t1)
      # %_j23.2 = alloca i32
      addi    t0, sp, 332
      sw      t0, 328(sp)
      # store i32 %_j23, ptr %_j23.2
      lw      t0, 100(sp)
      lw      t1, 328(sp)
      sw      t0, 0(t1)
      # %_j24.2 = alloca i32
      addi    t0, sp, 340
      sw      t0, 336(sp)
      # store i32 %_j24, ptr %_j24.2
      lw      t0, 104(sp)
      lw      t1, 336(sp)
      sw      t0, 0(t1)
      # %_j25.2 = alloca i32
      addi    t0, sp, 348
      sw      t0, 344(sp)
      # store i32 %_j25, ptr %_j25.2
      lw      t0, 108(sp)
      lw      t1, 344(sp)
      sw      t0, 0(t1)
      # %_j26.2 = alloca i32
      addi    t0, sp, 356
      sw      t0, 352(sp)
      # store i32 %_j26, ptr %_j26.2
      lw      t0, 112(sp)
      lw      t1, 352(sp)
      sw      t0, 0(t1)
      # %_j27.2 = alloca i32
      addi    t0, sp, 364
      sw      t0, 360(sp)
      # store i32 %_j27, ptr %_j27.2
      lw      t0, 116(sp)
      lw      t1, 360(sp)
      sw      t0, 0(t1)
      # %_j28.2 = alloca i32
      addi    t0, sp, 372
      sw      t0, 368(sp)
      # store i32 %_j28, ptr %_j28.2
      lw      t0, 120(sp)
      lw      t1, 368(sp)
      sw      t0, 0(t1)
      # %_j29.2 = alloca i32
      addi    t0, sp, 380
      sw      t0, 376(sp)
      # store i32 %_j29, ptr %_j29.2
      lw      t0, 124(sp)
      lw      t1, 376(sp)
      sw      t0, 0(t1)
      # %_j.2 = alloca i32
      addi    t0, sp, 388
      sw      t0, 384(sp)
      # %__tmp.207 = load i32, ptr %_j.2
      lw      t1, 384(sp)
      lw      t0, 0(t1)
      sw      t0, 392(sp)
      # %__tmp.208 = load i32, ptr %_j0.2
      lw      t1, 144(sp)
      lw      t0, 0(t1)
      sw      t0, 396(sp)
      # %__tmp.209 = load i32, ptr %_j1.2
      lw      t1, 152(sp)
      lw      t0, 0(t1)
      sw      t0, 400(sp)
      # %__tmp.210 = add i32 %__tmp.208, %__tmp.209
      lw      t1, 396(sp)
      lw      t2, 400(sp)
      add     t0, t1, t2
      sw      t0, 404(sp)
      # %__tmp.211 = load i32, ptr %_j2.2
      lw      t1, 160(sp)
      lw      t0, 0(t1)
      sw      t0, 408(sp)
      # %__tmp.212 = add i32 %__tmp.210, %__tmp.211
      lw      t1, 404(sp)
      lw      t2, 408(sp)
      add     t0, t1, t2
      sw      t0, 412(sp)
      # %__tmp.213 = load i32, ptr %_j3.2
      lw      t1, 168(sp)
      lw      t0, 0(t1)
      sw      t0, 416(sp)
      # %__tmp.214 = add i32 %__tmp.212, %__tmp.213
      lw      t1, 412(sp)
      lw      t2, 416(sp)
      add     t0, t1, t2
      sw      t0, 420(sp)
      # %__tmp.215 = load i32, ptr %_j4.2
      lw      t1, 176(sp)
      lw      t0, 0(t1)
      sw      t0, 424(sp)
      # %__tmp.216 = add i32 %__tmp.214, %__tmp.215
      lw      t1, 420(sp)
      lw      t2, 424(sp)
      add     t0, t1, t2
      sw      t0, 428(sp)
      # %__tmp.217 = load i32, ptr %_j5.2
      lw      t1, 184(sp)
      lw      t0, 0(t1)
      sw      t0, 432(sp)
      # %__tmp.218 = add i32 %__tmp.216, %__tmp.217
      lw      t1, 428(sp)
      lw      t2, 432(sp)
      add     t0, t1, t2
      sw      t0, 436(sp)
      # %__tmp.219 = load i32, ptr %_j6.2
      lw      t1, 192(sp)
      lw      t0, 0(t1)
      sw      t0, 440(sp)
      # %__tmp.220 = add i32 %__tmp.218, %__tmp.219
      lw      t1, 436(sp)
      lw      t2, 440(sp)
      add     t0, t1, t2
      sw      t0, 444(sp)
      # %__tmp.221 = load i32, ptr %_j7.2
      lw      t1, 200(sp)
      lw      t0, 0(t1)
      sw      t0, 448(sp)
      # %__tmp.222 = add i32 %__tmp.220, %__tmp.221
      lw      t1, 444(sp)
      lw      t2, 448(sp)
      add     t0, t1, t2
      sw      t0, 452(sp)
      # %__tmp.223 = load i32, ptr %_j8.2
      lw      t1, 208(sp)
      lw      t0, 0(t1)
      sw      t0, 456(sp)
      # %__tmp.224 = add i32 %__tmp.222, %__tmp.223
      lw      t1, 452(sp)
      lw      t2, 456(sp)
      add     t0, t1, t2
      sw      t0, 460(sp)
      # %__tmp.225 = load i32, ptr %_j9.2
      lw      t1, 216(sp)
      lw      t0, 0(t1)
      sw      t0, 464(sp)
      # %__tmp.226 = add i32 %__tmp.224, %__tmp.225
      lw      t1, 460(sp)
      lw      t2, 464(sp)
      add     t0, t1, t2
      sw      t0, 468(sp)
      # %__tmp.227 = load i32, ptr %_j10.2
      lw      t1, 224(sp)
      lw      t0, 0(t1)
      sw      t0, 472(sp)
      # %__tmp.228 = add i32 %__tmp.226, %__tmp.227
      lw      t1, 468(sp)
      lw      t2, 472(sp)
      add     t0, t1, t2
      sw      t0, 476(sp)
      # %__tmp.229 = load i32, ptr %_j11.2
      lw      t1, 232(sp)
      lw      t0, 0(t1)
      sw      t0, 480(sp)
      # %__tmp.230 = add i32 %__tmp.228, %__tmp.229
      lw      t1, 476(sp)
      lw      t2, 480(sp)
      add     t0, t1, t2
      sw      t0, 484(sp)
      # %__tmp.231 = load i32, ptr %_j12.2
      lw      t1, 240(sp)
      lw      t0, 0(t1)
      sw      t0, 488(sp)
      # %__tmp.232 = add i32 %__tmp.230, %__tmp.231
      lw      t1, 484(sp)
      lw      t2, 488(sp)
      add     t0, t1, t2
      sw      t0, 492(sp)
      # %__tmp.233 = load i32, ptr %_j13.2
      lw      t1, 248(sp)
      lw      t0, 0(t1)
      sw      t0, 496(sp)
      # %__tmp.234 = add i32 %__tmp.232, %__tmp.233
      lw      t1, 492(sp)
      lw      t2, 496(sp)
      add     t0, t1, t2
      sw      t0, 500(sp)
      # %__tmp.235 = load i32, ptr %_j14.2
      lw      t1, 256(sp)
      lw      t0, 0(t1)
      sw      t0, 504(sp)
      # %__tmp.236 = add i32 %__tmp.234, %__tmp.235
      lw      t1, 500(sp)
      lw      t2, 504(sp)
      add     t0, t1, t2
      sw      t0, 508(sp)
      # %__tmp.237 = load i32, ptr %_j15.2
      lw      t1, 264(sp)
      lw      t0, 0(t1)
      sw      t0, 512(sp)
      # %__tmp.238 = add i32 %__tmp.236, %__tmp.237
      lw      t1, 508(sp)
      lw      t2, 512(sp)
      add     t0, t1, t2
      sw      t0, 516(sp)
      # %__tmp.239 = load i32, ptr %_j16.2
      lw      t1, 272(sp)
      lw      t0, 0(t1)
      sw      t0, 520(sp)
      # %__tmp.240 = add i32 %__tmp.238, %__tmp.239
      lw      t1, 516(sp)
      lw      t2, 520(sp)
      add     t0, t1, t2
      sw      t0, 524(sp)
      # %__tmp.241 = load i32, ptr %_j17.2
      lw      t1, 280(sp)
      lw      t0, 0(t1)
      sw      t0, 528(sp)
      # %__tmp.242 = add i32 %__tmp.240, %__tmp.241
      lw      t1, 524(sp)
      lw      t2, 528(sp)
      add     t0, t1, t2
      sw      t0, 532(sp)
      # %__tmp.243 = load i32, ptr %_j18.2
      lw      t1, 288(sp)
      lw      t0, 0(t1)
      sw      t0, 536(sp)
      # %__tmp.244 = add i32 %__tmp.242, %__tmp.243
      lw      t1, 532(sp)
      lw      t2, 536(sp)
      add     t0, t1, t2
      sw      t0, 540(sp)
      # %__tmp.245 = load i32, ptr %_j19.2
      lw      t1, 296(sp)
      lw      t0, 0(t1)
      sw      t0, 544(sp)
      # %__tmp.246 = add i32 %__tmp.244, %__tmp.245
      lw      t1, 540(sp)
      lw      t2, 544(sp)
      add     t0, t1, t2
      sw      t0, 548(sp)
      # %__tmp.247 = load i32, ptr %_j20.2
      lw      t1, 304(sp)
      lw      t0, 0(t1)
      sw      t0, 552(sp)
      # %__tmp.248 = add i32 %__tmp.246, %__tmp.247
      lw      t1, 548(sp)
      lw      t2, 552(sp)
      add     t0, t1, t2
      sw      t0, 556(sp)
      # %__tmp.249 = load i32, ptr %_j21.2
      lw      t1, 312(sp)
      lw      t0, 0(t1)
      sw      t0, 560(sp)
      # %__tmp.250 = add i32 %__tmp.248, %__tmp.249
      lw      t1, 556(sp)
      lw      t2, 560(sp)
      add     t0, t1, t2
      sw      t0, 564(sp)
      # %__tmp.251 = load i32, ptr %_j22.2
      lw      t1, 320(sp)
      lw      t0, 0(t1)
      sw      t0, 568(sp)
      # %__tmp.252 = add i32 %__tmp.250, %__tmp.251
      lw      t1, 564(sp)
      lw      t2, 568(sp)
      add     t0, t1, t2
      sw      t0, 572(sp)
      # %__tmp.253 = load i32, ptr %_j23.2
      lw      t1, 328(sp)
      lw      t0, 0(t1)
      sw      t0, 576(sp)
      # %__tmp.254 = add i32 %__tmp.252, %__tmp.253
      lw      t1, 572(sp)
      lw      t2, 576(sp)
      add     t0, t1, t2
      sw      t0, 580(sp)
      # %__tmp.255 = load i32, ptr %_j24.2
      lw      t1, 336(sp)
      lw      t0, 0(t1)
      sw      t0, 584(sp)
      # %__tmp.256 = add i32 %__tmp.254, %__tmp.255
      lw      t1, 580(sp)
      lw      t2, 584(sp)
      add     t0, t1, t2
      sw      t0, 588(sp)
      # %__tmp.257 = load i32, ptr %_j25.2
      lw      t1, 344(sp)
      lw      t0, 0(t1)
      sw      t0, 592(sp)
      # %__tmp.258 = add i32 %__tmp.256, %__tmp.257
      lw      t1, 588(sp)
      lw      t2, 592(sp)
      add     t0, t1, t2
      sw      t0, 596(sp)
      # %__tmp.259 = load i32, ptr %_j26.2
      lw      t1, 352(sp)
      lw      t0, 0(t1)
      sw      t0, 600(sp)
      # %__tmp.260 = add i32 %__tmp.258, %__tmp.259
      lw      t1, 596(sp)
      lw      t2, 600(sp)
      add     t0, t1, t2
      sw      t0, 604(sp)
      # %__tmp.261 = load i32, ptr %_j27.2
      lw      t1, 360(sp)
      lw      t0, 0(t1)
      sw      t0, 608(sp)
      # %__tmp.262 = add i32 %__tmp.260, %__tmp.261
      lw      t1, 604(sp)
      lw      t2, 608(sp)
      add     t0, t1, t2
      sw      t0, 612(sp)
      # %__tmp.263 = load i32, ptr %_j28.2
      lw      t1, 368(sp)
      lw      t0, 0(t1)
      sw      t0, 616(sp)
      # %__tmp.264 = add i32 %__tmp.262, %__tmp.263
      lw      t1, 612(sp)
      lw      t2, 616(sp)
      add     t0, t1, t2
      sw      t0, 620(sp)
      # %__tmp.265 = load i32, ptr %_j29.2
      lw      t1, 376(sp)
      lw      t0, 0(t1)
      sw      t0, 624(sp)
      # %__tmp.266 = add i32 %__tmp.264, %__tmp.265
      lw      t1, 620(sp)
      lw      t2, 624(sp)
      add     t0, t1, t2
      sw      t0, 628(sp)
      # %__tmp.267 = srem i32 %__tmp.266, 100
      li      t2, 100
      lw      t1, 628(sp)
      rem     t0, t1, t2
      sw      t0, 632(sp)
      # store i32 %__tmp.267, ptr %_j.2
      lw      t0, 632(sp)
      lw      t1, 384(sp)
      sw      t0, 0(t1)
      # %__tmp.268 = load i32, ptr %_x.2
      lw      t1, 128(sp)
      lw      t0, 0(t1)
      sw      t0, 636(sp)
      # %__tmp.269 = load i32, ptr %_y.2
      lw      t1, 136(sp)
      lw      t0, 0(t1)
      sw      t0, 640(sp)
      # %__tmp.270 = srem i32 %__tmp.268, %__tmp.269
      lw      t1, 636(sp)
      lw      t2, 640(sp)
      rem     t0, t1, t2
      sw      t0, 644(sp)
      # %__tmp.271 = icmp eq i32 %__tmp.270, 0
      li      t2, 0
      lw      t1, 644(sp)
      sub     t0, t1, t2
      seqz    t3, t0
      mv      t0, t3
      sw      t0, 648(sp)
      # br i1 %__tmp.271, label %if.then2, label %if.else2
      lw      t0, 648(sp)
      beqz     t0, gcd2_jump3
      j       gcd2_if.then2
gcd2_jump3:
      j       gcd2_if.else2
gcd2_if.then2:
      # %__tmp.272 = load i32, ptr %_y.2
      lw      t1, 136(sp)
      lw      t0, 0(t1)
      sw      t0, 652(sp)
      # ret i32 %__tmp.272
      lw      t0, 652(sp)
      mv      a0, t0
      addi    sp, sp, 800
      ret     
      # br label %if.merge2
      j       gcd2_if.merge2
gcd2_if.else2:
      # %__tmp.274 = load i32, ptr %_y.2
      lw      t1, 136(sp)
      lw      t0, 0(t1)
      sw      t0, 656(sp)
      # %__tmp.275 = load i32, ptr %_x.2
      lw      t1, 128(sp)
      lw      t0, 0(t1)
      sw      t0, 660(sp)
      # %__tmp.276 = load i32, ptr %_y.2
      lw      t1, 136(sp)
      lw      t0, 0(t1)
      sw      t0, 664(sp)
      # %__tmp.277 = srem i32 %__tmp.275, %__tmp.276
      lw      t1, 660(sp)
      lw      t2, 664(sp)
      rem     t0, t1, t2
      sw      t0, 668(sp)
      # %__tmp.278 = load i32, ptr %_j0.2
      lw      t1, 144(sp)
      lw      t0, 0(t1)
      sw      t0, 672(sp)
      # %__tmp.279 = load i32, ptr %_j1.2
      lw      t1, 152(sp)
      lw      t0, 0(t1)
      sw      t0, 676(sp)
      # %__tmp.280 = load i32, ptr %_j2.2
      lw      t1, 160(sp)
      lw      t0, 0(t1)
      sw      t0, 680(sp)
      # %__tmp.281 = load i32, ptr %_j3.2
      lw      t1, 168(sp)
      lw      t0, 0(t1)
      sw      t0, 684(sp)
      # %__tmp.282 = load i32, ptr %_j4.2
      lw      t1, 176(sp)
      lw      t0, 0(t1)
      sw      t0, 688(sp)
      # %__tmp.283 = load i32, ptr %_j5.2
      lw      t1, 184(sp)
      lw      t0, 0(t1)
      sw      t0, 692(sp)
      # %__tmp.284 = load i32, ptr %_j6.2
      lw      t1, 192(sp)
      lw      t0, 0(t1)
      sw      t0, 696(sp)
      # %__tmp.285 = load i32, ptr %_j7.2
      lw      t1, 200(sp)
      lw      t0, 0(t1)
      sw      t0, 700(sp)
      # %__tmp.286 = load i32, ptr %_j8.2
      lw      t1, 208(sp)
      lw      t0, 0(t1)
      sw      t0, 704(sp)
      # %__tmp.287 = load i32, ptr %_j9.2
      lw      t1, 216(sp)
      lw      t0, 0(t1)
      sw      t0, 708(sp)
      # %__tmp.288 = load i32, ptr %_j10.2
      lw      t1, 224(sp)
      lw      t0, 0(t1)
      sw      t0, 712(sp)
      # %__tmp.289 = load i32, ptr %_j11.2
      lw      t1, 232(sp)
      lw      t0, 0(t1)
      sw      t0, 716(sp)
      # %__tmp.290 = load i32, ptr %_j12.2
      lw      t1, 240(sp)
      lw      t0, 0(t1)
      sw      t0, 720(sp)
      # %__tmp.291 = load i32, ptr %_j13.2
      lw      t1, 248(sp)
      lw      t0, 0(t1)
      sw      t0, 724(sp)
      # %__tmp.292 = load i32, ptr %_j14.2
      lw      t1, 256(sp)
      lw      t0, 0(t1)
      sw      t0, 728(sp)
      # %__tmp.293 = load i32, ptr %_j15.2
      lw      t1, 264(sp)
      lw      t0, 0(t1)
      sw      t0, 732(sp)
      # %__tmp.294 = load i32, ptr %_j16.2
      lw      t1, 272(sp)
      lw      t0, 0(t1)
      sw      t0, 736(sp)
      # %__tmp.295 = load i32, ptr %_j17.2
      lw      t1, 280(sp)
      lw      t0, 0(t1)
      sw      t0, 740(sp)
      # %__tmp.296 = load i32, ptr %_j18.2
      lw      t1, 288(sp)
      lw      t0, 0(t1)
      sw      t0, 744(sp)
      # %__tmp.297 = load i32, ptr %_j19.2
      lw      t1, 296(sp)
      lw      t0, 0(t1)
      sw      t0, 748(sp)
      # %__tmp.298 = load i32, ptr %_j20.2
      lw      t1, 304(sp)
      lw      t0, 0(t1)
      sw      t0, 752(sp)
      # %__tmp.299 = load i32, ptr %_j21.2
      lw      t1, 312(sp)
      lw      t0, 0(t1)
      sw      t0, 756(sp)
      # %__tmp.300 = load i32, ptr %_j22.2
      lw      t1, 320(sp)
      lw      t0, 0(t1)
      sw      t0, 760(sp)
      # %__tmp.301 = load i32, ptr %_j23.2
      lw      t1, 328(sp)
      lw      t0, 0(t1)
      sw      t0, 764(sp)
      # %__tmp.302 = load i32, ptr %_j24.2
      lw      t1, 336(sp)
      lw      t0, 0(t1)
      sw      t0, 768(sp)
      # %__tmp.303 = load i32, ptr %_j25.2
      lw      t1, 344(sp)
      lw      t0, 0(t1)
      sw      t0, 772(sp)
      # %__tmp.304 = load i32, ptr %_j26.2
      lw      t1, 352(sp)
      lw      t0, 0(t1)
      sw      t0, 776(sp)
      # %__tmp.305 = load i32, ptr %_j27.2
      lw      t1, 360(sp)
      lw      t0, 0(t1)
      sw      t0, 780(sp)
      # %__tmp.306 = load i32, ptr %_j28.2
      lw      t1, 368(sp)
      lw      t0, 0(t1)
      sw      t0, 784(sp)
      # %__tmp.307 = load i32, ptr %_j29.2
      lw      t1, 376(sp)
      lw      t0, 0(t1)
      sw      t0, 788(sp)
      # %__tmp.273 = call i32 @gcd(i32 %__tmp.274, i32 %__tmp.277, i32 %__tmp.278, i32 %__tmp.279, i32 %__tmp.280, i32 %__tmp.281, i32 %__tmp.282, i32 %__tmp.283, i32 %__tmp.284, i32 %__tmp.285, i32 %__tmp.286, i32 %__tmp.287, i32 %__tmp.288, i32 %__tmp.289, i32 %__tmp.290, i32 %__tmp.291, i32 %__tmp.292, i32 %__tmp.293, i32 %__tmp.294, i32 %__tmp.295, i32 %__tmp.296, i32 %__tmp.297, i32 %__tmp.298, i32 %__tmp.299, i32 %__tmp.300, i32 %__tmp.301, i32 %__tmp.302, i32 %__tmp.303, i32 %__tmp.304, i32 %__tmp.305, i32 %__tmp.306, i32 %__tmp.307)
      lw      t0, 656(sp)
      mv      a0, t0
      lw      t0, 668(sp)
      mv      a1, t0
      lw      t0, 672(sp)
      mv      a2, t0
      lw      t0, 676(sp)
      mv      a3, t0
      lw      t0, 680(sp)
      mv      a4, t0
      lw      t0, 684(sp)
      mv      a5, t0
      lw      t0, 688(sp)
      mv      a6, t0
      lw      t0, 692(sp)
      mv      a7, t0
      lw      t0, 696(sp)
      sw      t0, -96(sp)
      lw      t0, 700(sp)
      sw      t0, -92(sp)
      lw      t0, 704(sp)
      sw      t0, -88(sp)
      lw      t0, 708(sp)
      sw      t0, -84(sp)
      lw      t0, 712(sp)
      sw      t0, -80(sp)
      lw      t0, 716(sp)
      sw      t0, -76(sp)
      lw      t0, 720(sp)
      sw      t0, -72(sp)
      lw      t0, 724(sp)
      sw      t0, -68(sp)
      lw      t0, 728(sp)
      sw      t0, -64(sp)
      lw      t0, 732(sp)
      sw      t0, -60(sp)
      lw      t0, 736(sp)
      sw      t0, -56(sp)
      lw      t0, 740(sp)
      sw      t0, -52(sp)
      lw      t0, 744(sp)
      sw      t0, -48(sp)
      lw      t0, 748(sp)
      sw      t0, -44(sp)
      lw      t0, 752(sp)
      sw      t0, -40(sp)
      lw      t0, 756(sp)
      sw      t0, -36(sp)
      lw      t0, 760(sp)
      sw      t0, -32(sp)
      lw      t0, 764(sp)
      sw      t0, -28(sp)
      lw      t0, 768(sp)
      sw      t0, -24(sp)
      lw      t0, 772(sp)
      sw      t0, -20(sp)
      lw      t0, 776(sp)
      sw      t0, -16(sp)
      lw      t0, 780(sp)
      sw      t0, -12(sp)
      lw      t0, 784(sp)
      sw      t0, -8(sp)
      lw      t0, 788(sp)
      sw      t0, -4(sp)
      sw      ra, 792(sp)
      addi    sp, sp, -96
      call    gcd
      addi    sp, sp, 96
      mv      t0, a0
      sw      t0, 796(sp)
      lw      ra, 792(sp)
      # ret i32 %__tmp.273
      lw      t0, 796(sp)
      mv      a0, t0
      addi    sp, sp, 800
      ret     
      # br label %if.merge2
      j       gcd2_if.merge2
gcd2_if.merge2:
      # ret i32 0
      li      t0, 0
      mv      a0, t0
      addi    sp, sp, 800
      ret     
      .section .text
      .globl main
main:
      addi    sp, sp, -24
main_entry:
      # %__tmp.309 = call i32 @gcd(i32 10, i32 1, i32 0, i32 2, i32 4, i32 6, i32 8, i32 10, i32 12, i32 14, i32 16, i32 18, i32 20, i32 22, i32 24, i32 26, i32 28, i32 30, i32 32, i32 34, i32 36, i32 38, i32 40, i32 42, i32 44, i32 46, i32 48, i32 50, i32 52, i32 54, i32 56, i32 58)
      li      a0, 10
      mv      a0, t0
      li      a1, 1
      mv      a1, t0
      li      a2, 0
      mv      a2, t0
      li      a3, 2
      mv      a3, t0
      li      a4, 4
      mv      a4, t0
      li      a5, 6
      mv      a5, t0
      li      a6, 8
      mv      a6, t0
      li      a7, 10
      mv      a7, t0
      li      t0, 12
      sw      t0, -96(sp)
      li      t0, 14
      sw      t0, -92(sp)
      li      t0, 16
      sw      t0, -88(sp)
      li      t0, 18
      sw      t0, -84(sp)
      li      t0, 20
      sw      t0, -80(sp)
      li      t0, 22
      sw      t0, -76(sp)
      li      t0, 24
      sw      t0, -72(sp)
      li      t0, 26
      sw      t0, -68(sp)
      li      t0, 28
      sw      t0, -64(sp)
      li      t0, 30
      sw      t0, -60(sp)
      li      t0, 32
      sw      t0, -56(sp)
      li      t0, 34
      sw      t0, -52(sp)
      li      t0, 36
      sw      t0, -48(sp)
      li      t0, 38
      sw      t0, -44(sp)
      li      t0, 40
      sw      t0, -40(sp)
      li      t0, 42
      sw      t0, -36(sp)
      li      t0, 44
      sw      t0, -32(sp)
      li      t0, 46
      sw      t0, -28(sp)
      li      t0, 48
      sw      t0, -24(sp)
      li      t0, 50
      sw      t0, -20(sp)
      li      t0, 52
      sw      t0, -16(sp)
      li      t0, 54
      sw      t0, -12(sp)
      li      t0, 56
      sw      t0, -8(sp)
      li      t0, 58
      sw      t0, -4(sp)
      sw      ra, 0(sp)
      addi    sp, sp, -96
      call    gcd
      addi    sp, sp, 96
      mv      t0, a0
      sw      t0, 4(sp)
      lw      ra, 0(sp)
      # %__tmp.310 = add i32 %__tmp.309, 1024
      li      t2, 1024
      lw      t1, 4(sp)
      add     t0, t1, t2
      sw      t0, 8(sp)
      # %__tmp.308 = call ptr @toString(i32 %__tmp.310)
      lw      t0, 8(sp)
      mv      a0, t0
      sw      ra, 12(sp)
      call    toString
      mv      t0, a0
      sw      t0, 16(sp)
      lw      ra, 12(sp)
      # call void @println(ptr %__tmp.308)
      lw      t0, 16(sp)
      mv      a0, t0
      sw      ra, 20(sp)
      call    println
      lw      ra, 20(sp)
      # ret i32 0
      li      t0, 0
      mv      a0, t0
      addi    sp, sp, 24
      ret     
