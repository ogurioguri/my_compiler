      .section .rodata
      .globl _string.0
_string.0:
      .asciz  "news.learnmore"
      .section .rodata
      .globl _string.1
_string.1:
      .asciz  "+1s"
      .section .text
      .globl naive.Journalist
naive.Journalist:
      addi    sp, sp, -68
      mv      t0, a0
      sw      t0, 0(sp)
      mv      t0, a1
      sw      t0, 8(sp)
naive.Journalist_entry:
      # %_news.0 = alloca ptr
      addi    t0, sp, 20
      sw      t0, 16(sp)
      # store ptr %_news, ptr %_news.0
      lw      t0, 12(sp)
      lw      t1, 16(sp)
      sw      t0, 0(t1)
      # %_this.2 = alloca ptr
      addi    t0, sp, 28
      sw      t0, 24(sp)
      # store ptr %_this.1, ptr %_this.2
      lw      t1, 24(sp)
      sw      t0, 0(t1)
      # %__tmp.0 = load ptr, ptr %_news.0
      lw      t1, 16(sp)
      lw      t0, 0(t1)
      sw      t0, 32(sp)
      # %__tmp.1 = getelementptr %struct.interesting, ptr %__tmp.0, i32 0, i32 0
      li      t1, 0
      sw      t1, 36(sp)
      lw      t0, 32(sp)
      li      t1, 4
      sw      t1, 40(sp)
      mul     t2, t0, t1
      lw      t0, 36(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 44(sp)
      # %__tmp.2 = load ptr, ptr %__tmp.1
      lw      t1, 44(sp)
      lw      t0, 0(t1)
      sw      t0, 48(sp)
      # call void @println(ptr %__tmp.2)
      lw      t0, 48(sp)
      mv      a0, t0
      sw      ra, 52(sp)
      call    println
      lw      ra, 52(sp)
      # call void @println(ptr @_string.0)
      la      t0, _string.0
      sw      t0, 56(sp)
      lw      t0, 56(sp)
      mv      a0, t0
      sw      ra, 60(sp)
      call    println
      lw      ra, 60(sp)
      # ret i32 1
      li      t0, 1
      sw      t0, 64(sp)
      lw      t0, 64(sp)
      mv      a0, t0
      addi    sp, sp, 68
      ret     
      .section .text
      .globl naive.naive
naive.naive:
      addi    sp, sp, -240
      mv      t0, a0
      sw      t0, 0(sp)
naive.naive_entry:
      # %_this.4 = alloca ptr
      addi    t0, sp, 12
      sw      t0, 8(sp)
      # store ptr %_this.3, ptr %_this.4
      lw      t0, 4(sp)
      lw      t1, 8(sp)
      sw      t0, 0(t1)
      # %_HongKong.2 = load ptr, ptr %_this.4
      lw      t1, 8(sp)
      lw      t0, 0(t1)
      sw      t0, 16(sp)
      # %_HongKong.3 = getelementptr %struct.naive, ptr %_HongKong.2, i32 0, i32 0
      li      t1, 0
      sw      t1, 20(sp)
      lw      t0, 16(sp)
      li      t1, 4
      sw      t1, 24(sp)
      mul     t2, t0, t1
      lw      t0, 20(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 28(sp)
      # %__tmp.3 = load ptr, ptr %_HongKong.3
      lw      t1, 28(sp)
      lw      t0, 0(t1)
      sw      t0, 32(sp)
      # %__tmp.4 = call ptr @_malloc_array(i32 4, i32 100)
      li      t0, 4
      sw      t0, 36(sp)
      lw      t0, 36(sp)
      mv      a0, t0
      li      t0, 100
      sw      t0, 40(sp)
      lw      t0, 40(sp)
      mv      a1, t0
      sw      ra, 44(sp)
      call    _malloc_array
      mv      t0, a0
      sw      t0, 48(sp)
      lw      ra, 44(sp)
      # store ptr %__tmp.4, ptr %_HongKong.3
      lw      t0, 48(sp)
      lw      t1, 28(sp)
      sw      t0, 0(t1)
      # %_HongKong.4 = load ptr, ptr %_this.4
      lw      t1, 8(sp)
      lw      t0, 0(t1)
      sw      t0, 52(sp)
      # %_HongKong.5 = getelementptr %struct.naive, ptr %_HongKong.4, i32 0, i32 0
      li      t1, 0
      sw      t1, 56(sp)
      lw      t0, 52(sp)
      li      t1, 4
      sw      t1, 60(sp)
      mul     t2, t0, t1
      lw      t0, 56(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 64(sp)
      # %__tmp.5 = load ptr, ptr %_HongKong.5
      lw      t1, 64(sp)
      lw      t0, 0(t1)
      sw      t0, 68(sp)
      # %__tmp.6 = getelementptr ptr, ptr %__tmp.5, i32 1
      li      t1, 1
      sw      t1, 72(sp)
      lw      t0, 68(sp)
      li      t1, 4
      sw      t1, 76(sp)
      mul     t2, t0, t1
      lw      t0, 72(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 80(sp)
      # %__tmp.7 = load ptr, ptr %__tmp.6
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      sw      t0, 84(sp)
      # store ptr null, ptr %__tmp.6
      li      t0, null
      sw      t0, 88(sp)
      lw      t0, 88(sp)
      lw      t1, 80(sp)
      sw      t0, 0(t1)
      # %_i.0 = alloca i32
      addi    t0, sp, 96
      sw      t0, 92(sp)
      # store i32 0, ptr %_i.0
      li      t0, 0
      sw      t0, 100(sp)
      lw      t0, 100(sp)
      lw      t1, 92(sp)
      sw      t0, 0(t1)
      # %__tmp.8 = load i32, ptr %_i.0
      lw      t1, 92(sp)
      lw      t0, 0(t1)
      sw      t0, 104(sp)
      # store i32 1, ptr %_i.0
      li      t0, 1
      sw      t0, 108(sp)
      lw      t0, 108(sp)
      lw      t1, 92(sp)
      sw      t0, 0(t1)
      # br label %for.cond0
      j       naive.naive_for.cond0
naive.naive_for.cond0:
      # %__tmp.9 = load i32, ptr %_i.0
      lw      t1, 92(sp)
      lw      t0, 0(t1)
      sw      t0, 112(sp)
      # %__tmp.10 = icmp slt i32 %__tmp.9, 99
      li      t2, 99
      sw      t2, 116(sp)
      lw      t1, 112(sp)
      lw      t2, 116(sp)
      sub     t0, t1, t2
      sltz    t3, t0
      mv      t0, t3
      sw      t0, 120(sp)
      lw      t0, 120(sp)
      # br i1 %__tmp.10, label %for.body0, label %for.merge0
      beqz     t0, naive.naive_for.merge0
naive.naive_for.body0:
      # %_HongKong.6 = load ptr, ptr %_this.4
      lw      t1, 8(sp)
      lw      t0, 0(t1)
      sw      t0, 124(sp)
      # %_HongKong.7 = getelementptr %struct.naive, ptr %_HongKong.6, i32 0, i32 0
      li      t1, 0
      sw      t1, 128(sp)
      lw      t0, 124(sp)
      li      t1, 4
      sw      t1, 132(sp)
      mul     t2, t0, t1
      lw      t0, 128(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 136(sp)
      # %__tmp.11 = load ptr, ptr %_HongKong.7
      lw      t1, 136(sp)
      lw      t0, 0(t1)
      sw      t0, 140(sp)
      # %__tmp.12 = load i32, ptr %_i.0
      lw      t1, 92(sp)
      lw      t0, 0(t1)
      sw      t0, 144(sp)
      # %__tmp.13 = getelementptr ptr, ptr %__tmp.11, i32 %__tmp.12
      lw      t0, 140(sp)
      li      t1, 4
      sw      t1, 148(sp)
      mul     t2, t0, t1
      lw      t0, 144(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 152(sp)
      # %__tmp.14 = load ptr, ptr %__tmp.13
      lw      t1, 152(sp)
      lw      t0, 0(t1)
      sw      t0, 156(sp)
      # %__tmp.15 = call ptr @_malloc_array(i32 4, i32 233)
      li      t0, 4
      sw      t0, 160(sp)
      lw      t0, 160(sp)
      mv      a0, t0
      li      t0, 233
      sw      t0, 164(sp)
      lw      t0, 164(sp)
      mv      a1, t0
      sw      ra, 168(sp)
      call    _malloc_array
      mv      t0, a0
      sw      t0, 172(sp)
      lw      ra, 168(sp)
      # store ptr %__tmp.15, ptr %__tmp.13
      lw      t0, 172(sp)
      lw      t1, 152(sp)
      sw      t0, 0(t1)
      # br label %for.step0
      j       naive.naive_for.step0
naive.naive_for.step0:
      # %__tmp.16 = load i32, ptr %_i.0
      lw      t1, 92(sp)
      lw      t0, 0(t1)
      sw      t0, 176(sp)
      # %__tmp.17 = add i32 %__tmp.16, 1
      li      t2, 1
      sw      t2, 180(sp)
      lw      t1, 176(sp)
      lw      t2, 180(sp)
      add     t0, t1, t2
      sw      t0, 184(sp)
      # store i32 %__tmp.17, ptr %_i.0
      lw      t0, 184(sp)
      lw      t1, 92(sp)
      sw      t0, 0(t1)
      # br label %for.cond0
      j       naive.naive_for.cond0
naive.naive_for.merge0:
      # %_HongKong.8 = load ptr, ptr %_this.4
      lw      t1, 8(sp)
      lw      t0, 0(t1)
      sw      t0, 188(sp)
      # %_HongKong.9 = getelementptr %struct.naive, ptr %_HongKong.8, i32 0, i32 0
      li      t1, 0
      sw      t1, 192(sp)
      lw      t0, 188(sp)
      li      t1, 4
      sw      t1, 196(sp)
      mul     t2, t0, t1
      lw      t0, 192(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 200(sp)
      # %__tmp.18 = load ptr, ptr %_HongKong.9
      lw      t1, 200(sp)
      lw      t0, 0(t1)
      sw      t0, 204(sp)
      # %__tmp.19 = getelementptr ptr, ptr %__tmp.18, i32 99
      li      t1, 99
      sw      t1, 208(sp)
      lw      t0, 204(sp)
      li      t1, 4
      sw      t1, 212(sp)
      mul     t2, t0, t1
      lw      t0, 208(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 216(sp)
      # %__tmp.20 = load ptr, ptr %__tmp.19
      lw      t1, 216(sp)
      lw      t0, 0(t1)
      sw      t0, 220(sp)
      # %__tmp.21 = call ptr @_malloc_array(i32 4, i32 1)
      li      t0, 4
      sw      t0, 224(sp)
      lw      t0, 224(sp)
      mv      a0, t0
      li      t0, 1
      sw      t0, 228(sp)
      lw      t0, 228(sp)
      mv      a1, t0
      sw      ra, 232(sp)
      call    _malloc_array
      mv      t0, a0
      sw      t0, 236(sp)
      lw      ra, 232(sp)
      # store ptr %__tmp.21, ptr %__tmp.19
      lw      t0, 236(sp)
      lw      t1, 216(sp)
      sw      t0, 0(t1)
      # ret void
      addi    sp, sp, 240
      ret     
      # ret void
      addi    sp, sp, 240
      ret     
      .section .text
      .globl interesting.interesting
interesting.interesting:
      addi    sp, sp, -144
      mv      t0, a0
      sw      t0, 0(sp)
interesting.interesting_entry:
      # %_this.7 = alloca ptr
      addi    t0, sp, 12
      sw      t0, 8(sp)
      # store ptr %_this.6, ptr %_this.7
      lw      t0, 4(sp)
      lw      t1, 8(sp)
      sw      t0, 0(t1)
      # %_second.2 = load ptr, ptr %_this.7
      lw      t1, 8(sp)
      lw      t0, 0(t1)
      sw      t0, 16(sp)
      # %_second.3 = getelementptr %struct.interesting, ptr %_second.2, i32 0, i32 1
      li      t1, 1
      sw      t1, 20(sp)
      lw      t0, 16(sp)
      li      t1, 4
      sw      t1, 24(sp)
      mul     t2, t0, t1
      lw      t0, 20(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 28(sp)
      # %__tmp.22 = load i32, ptr %_second.3
      lw      t1, 28(sp)
      lw      t0, 0(t1)
      sw      t0, 32(sp)
      # store i32 0, ptr %_second.3
      li      t0, 0
      sw      t0, 36(sp)
      lw      t0, 36(sp)
      lw      t1, 28(sp)
      sw      t0, 0(t1)
      # %_learnmore.2 = load ptr, ptr %_this.7
      lw      t1, 8(sp)
      lw      t0, 0(t1)
      sw      t0, 40(sp)
      # %_learnmore.3 = getelementptr %struct.interesting, ptr %_learnmore.2, i32 0, i32 0
      li      t1, 0
      sw      t1, 44(sp)
      lw      t0, 40(sp)
      li      t1, 4
      sw      t1, 48(sp)
      mul     t2, t0, t1
      lw      t0, 44(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 52(sp)
      # %__tmp.23 = load ptr, ptr %_learnmore.3
      lw      t1, 52(sp)
      lw      t0, 0(t1)
      sw      t0, 56(sp)
      # %__tmp.24 = call ptr @_string.copy(ptr @_string.1)
      la      t0, _string.1
      sw      t0, 60(sp)
      lw      t0, 60(sp)
      mv      a0, t0
      sw      ra, 64(sp)
      call    _string.copy
      mv      t0, a0
      sw      t0, 68(sp)
      lw      ra, 64(sp)
      # store ptr %__tmp.24, ptr %_learnmore.3
      lw      t0, 68(sp)
      lw      t1, 52(sp)
      sw      t0, 0(t1)
      # %_second.4 = load ptr, ptr %_this.7
      lw      t1, 8(sp)
      lw      t0, 0(t1)
      sw      t0, 72(sp)
      # %_second.5 = getelementptr %struct.interesting, ptr %_second.4, i32 0, i32 1
      li      t1, 1
      sw      t1, 76(sp)
      lw      t0, 72(sp)
      li      t1, 4
      sw      t1, 80(sp)
      mul     t2, t0, t1
      lw      t0, 76(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 84(sp)
      # %__tmp.25 = load i32, ptr %_second.5
      lw      t1, 84(sp)
      lw      t0, 0(t1)
      sw      t0, 88(sp)
      # %_learnmore.4 = load ptr, ptr %_this.7
      lw      t1, 8(sp)
      lw      t0, 0(t1)
      sw      t0, 92(sp)
      # %_learnmore.5 = getelementptr %struct.interesting, ptr %_learnmore.4, i32 0, i32 0
      li      t1, 0
      sw      t1, 96(sp)
      lw      t0, 92(sp)
      li      t1, 4
      sw      t1, 100(sp)
      mul     t2, t0, t1
      lw      t0, 96(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 104(sp)
      # %__tmp.26 = load ptr, ptr %_learnmore.5
      lw      t1, 104(sp)
      lw      t0, 0(t1)
      sw      t0, 108(sp)
      # %__tmp.27 = call i32 @_string.length(ptr %__tmp.26)
      lw      t0, 108(sp)
      mv      a0, t0
      sw      ra, 112(sp)
      call    _string.length
      mv      t0, a0
      sw      t0, 116(sp)
      lw      ra, 112(sp)
      # %_second.6 = load ptr, ptr %_this.7
      lw      t1, 8(sp)
      lw      t0, 0(t1)
      sw      t0, 120(sp)
      # %_second.7 = getelementptr %struct.interesting, ptr %_second.6, i32 0, i32 1
      li      t1, 1
      sw      t1, 124(sp)
      lw      t0, 120(sp)
      li      t1, 4
      sw      t1, 128(sp)
      mul     t2, t0, t1
      lw      t0, 124(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 132(sp)
      # %__tmp.28 = load i32, ptr %_second.7
      lw      t1, 132(sp)
      lw      t0, 0(t1)
      sw      t0, 136(sp)
      # %__tmp.29 = add i32 %__tmp.27, %__tmp.28
      lw      t1, 116(sp)
      lw      t2, 136(sp)
      add     t0, t1, t2
      sw      t0, 140(sp)
      # store i32 %__tmp.29, ptr %_second.5
      lw      t0, 140(sp)
      lw      t1, 84(sp)
      sw      t0, 0(t1)
      # ret void
      addi    sp, sp, 144
      ret     
      .section .text
      .globl main
main:
      addi    sp, sp, -108
main_entry:
      # %_Shanghai.0 = alloca ptr
      addi    t0, sp, 4
      sw      t0, 0(sp)
      # %__tmp.30 = call ptr @_malloc_array(i32 4, i32 233)
      li      t0, 4
      sw      t0, 8(sp)
      lw      t0, 8(sp)
      mv      a0, t0
      li      t0, 233
      sw      t0, 12(sp)
      lw      t0, 12(sp)
      mv      a1, t0
      sw      ra, 16(sp)
      call    _malloc_array
      mv      t0, a0
      sw      t0, 20(sp)
      lw      ra, 16(sp)
      # store ptr %__tmp.30, ptr %_Shanghai.0
      lw      t0, 20(sp)
      lw      t1, 0(sp)
      sw      t0, 0(t1)
      # %_Beijing.0 = alloca ptr
      addi    t0, sp, 28
      sw      t0, 24(sp)
      # %__tmp.31 = call ptr @_malloc_array(i32 4, i32 12)
      li      t0, 4
      sw      t0, 32(sp)
      lw      t0, 32(sp)
      mv      a0, t0
      li      t0, 12
      sw      t0, 36(sp)
      lw      t0, 36(sp)
      mv      a1, t0
      sw      ra, 40(sp)
      call    _malloc_array
      mv      t0, a0
      sw      t0, 44(sp)
      lw      ra, 40(sp)
      # %__tmp.32 = alloca i32
      addi    t0, sp, 52
      sw      t0, 48(sp)
      # store i32 0, ptr %__tmp.32
      li      t0, 0
      sw      t0, 56(sp)
      lw      t0, 56(sp)
      lw      t1, 48(sp)
      sw      t0, 0(t1)
      # br label %for.cond1
      j       main_for.cond1
main_for.cond1:
      # %_i.1 = load i32, ptr %__tmp.32
      lw      t1, 48(sp)
      lw      t0, 0(t1)
      sw      t0, 60(sp)
      # %_cond.0 = icmp slt i32 %_i.1, 12
      li      t2, 12
      sw      t2, 64(sp)
      lw      t1, 60(sp)
      lw      t2, 64(sp)
      sub     t0, t1, t2
      sltz    t3, t0
      mv      t0, t3
      sw      t0, 68(sp)
      lw      t0, 68(sp)
      # br i1 %_cond.0, label %for.body1, label %for.merge1
      beqz     t0, main_for.merge1
main_for.body1:
      # %__tmp.33 = getelementptr ptr, ptr %__tmp.31, i32 %_i.1
      lw      t0, 44(sp)
      li      t1, 4
      sw      t1, 72(sp)
      mul     t2, t0, t1
      lw      t0, 60(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 76(sp)
      # %__tmp.34 = call ptr @_malloc_array(i32 4, i32 34)
      li      t0, 4
      sw      t0, 80(sp)
      lw      t0, 80(sp)
      mv      a0, t0
      li      t0, 34
      sw      t0, 84(sp)
      lw      t0, 84(sp)
      mv      a1, t0
      sw      ra, 88(sp)
      call    _malloc_array
      mv      t0, a0
      sw      t0, 92(sp)
      lw      ra, 88(sp)
      # store ptr %__tmp.34, ptr %__tmp.33
      lw      t0, 92(sp)
      lw      t1, 76(sp)
      sw      t0, 0(t1)
      # br label %for.step1
      j       main_for.step1
main_for.step1:
      # %__tmp.35 = add i32 %_i.1, 1
      li      t2, 1
      sw      t2, 96(sp)
      lw      t1, 60(sp)
      lw      t2, 96(sp)
      add     t0, t1, t2
      sw      t0, 100(sp)
      # store i32 %__tmp.35, ptr %__tmp.32
      lw      t0, 100(sp)
      lw      t1, 48(sp)
      sw      t0, 0(t1)
      # br label %for.cond1
      j       main_for.cond1
main_for.merge1:
      # store ptr %__tmp.31, ptr %_Beijing.0
      lw      t0, 44(sp)
      lw      t1, 24(sp)
      sw      t0, 0(t1)
      # ret i32 0
      li      t0, 0
      sw      t0, 104(sp)
      lw      t0, 104(sp)
      mv      a0, t0
      addi    sp, sp, 108
      ret     
