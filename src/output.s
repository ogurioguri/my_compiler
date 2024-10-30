      .section .data
      .globl a.0
a.0:
      .word  0
      .section .rodata
      .globl _string.0
_string.0:
      .asciz  ""
      .section .text
      .globl __init
__init:
      addi    sp, sp, -32
__init_entry:
      # %__tmp.0 = call ptr @_malloc_array(i32 4, i32 4)
      li      t0, 4
      mv      a0, t0
      li      t0, 4
      mv      a1, t0
      sw      ra, 0(sp)
      sw      t0, 4(sp)
      sw      t1, 8(sp)
      sw      t2, 12(sp)
      sw      t3, 16(sp)
      sw      t4, 20(sp)
      sw      t5, 24(sp)
      sw      t6, 28(sp)
      call    _malloc_array
      lw      ra, 0(sp)
      lw      t0, 4(sp)
      lw      t1, 8(sp)
      lw      t2, 12(sp)
      lw      t3, 16(sp)
      lw      t4, 20(sp)
      lw      t5, 24(sp)
      lw      t6, 28(sp)
      mv      t0, a0
      # store ptr %__tmp.0, ptr @a.0
      la      t1, a.0
      sw      t0, 0(t1)
      # ret void
      addi    sp, sp, 32
      ret     
      .section .text
      .globl main
main:
      addi    sp, sp, -256
main_entry:
      # call void @__init()
      sw      ra, 0(sp)
      sw      t0, 4(sp)
      sw      t1, 8(sp)
      sw      t2, 12(sp)
      sw      t3, 16(sp)
      sw      t4, 20(sp)
      sw      t5, 24(sp)
      sw      t6, 28(sp)
      call    __init
      lw      ra, 0(sp)
      lw      t0, 4(sp)
      lw      t1, 8(sp)
      lw      t2, 12(sp)
      lw      t3, 16(sp)
      lw      t4, 20(sp)
      lw      t5, 24(sp)
      lw      t6, 28(sp)
      # %__tmp.1 = load ptr, ptr @a.0
      la      t0, a.0
      lw      t1, 0(t0)
      # %__tmp.2 = getelementptr i32, ptr %__tmp.1, i32 -1
      li      t0, -1
      li      t2, 4
      mul     t3, t0, t2
      add     t0, t1, t3
      mv      t1, t0
      # %__tmp.3 = load i32, ptr %__tmp.2
      lw      t0, 0(t1)
      # %__tmp.4 = call ptr @_malloc_array(i32 4, i32 %__tmp.3)
      li      t1, 4
      mv      a0, t1
      mv      a1, t0
      sw      ra, 32(sp)
      sw      t0, 36(sp)
      sw      t1, 40(sp)
      sw      t2, 44(sp)
      sw      t3, 48(sp)
      sw      t4, 52(sp)
      sw      t5, 56(sp)
      sw      t6, 60(sp)
      call    _malloc_array
      lw      ra, 32(sp)
      lw      t0, 36(sp)
      lw      t1, 40(sp)
      lw      t2, 44(sp)
      lw      t3, 48(sp)
      lw      t4, 52(sp)
      lw      t5, 56(sp)
      lw      t6, 60(sp)
      mv      t0, a0
      # br label %for.cond0
      li      t1, 0
      mv      t2, t1
      j       main_for.cond0
main_for.cond0:
      # %__tmp.7 = load ptr, ptr @a.0
      la      t1, a.0
      lw      t3, 0(t1)
      # %__tmp.8 = getelementptr i32, ptr %__tmp.7, i32 -1
      li      t1, -1
      li      t4, 4
      mul     t5, t1, t4
      add     t1, t3, t5
      mv      t3, t1
      # %__tmp.9 = load i32, ptr %__tmp.8
      lw      t1, 0(t3)
      # %__tmp.10 = icmp slt i32 %_i.0.0, %__tmp.9
      sub     t3, t2, t1
      sltz    t1, t3
      mv      t3, t1
      # br i1 %__tmp.10, label %for.body0, label %for.merge0
      beqz     t3, main_for.merge0
main_for.body0:
      # %__tmp.11 = load ptr, ptr @a.0
      la      t1, a.0
      lw      t3, 0(t1)
      # %__tmp.13 = getelementptr i32, ptr %__tmp.11, i32 %_i.0.0
      li      t1, 4
      mul     t4, t2, t1
      add     t1, t3, t4
      mv      t3, t1
      # %__tmp.14 = load i32, ptr %__tmp.13
      # store i32 0, ptr %__tmp.13
      li      t1, 0
      sw      t1, 0(t3)
      # %__tmp.17 = getelementptr i32, ptr %__tmp.4, i32 %_i.0.0
      li      t1, 4
      mul     t3, t2, t1
      add     t1, t0, t3
      mv      t3, t1
      # %__tmp.18 = load i32, ptr %__tmp.17
      # %__tmp.19 = call i32 @getInt()
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
      mv      t1, a0
      # store i32 %__tmp.19, ptr %__tmp.17
      sw      t1, 0(t3)
      # br label %for.step0
      j       main_for.step0
main_for.step0:
      # %__tmp.21 = add i32 %_i.0.0, 1
      li      t1, 1
      add     t3, t2, t1
      # br label %for.cond0
      mv      t2, t3
      j       main_for.cond0
main_for.merge0:
      # br label %for.cond1
      li      t1, 0
      mv      t3, t1
      j       main_for.cond1
main_for.cond1:
      # %__tmp.24 = load ptr, ptr @a.0
      la      t1, a.0
      lw      t4, 0(t1)
      # %__tmp.25 = getelementptr i32, ptr %__tmp.24, i32 -1
      li      t1, -1
      li      t5, 4
      mul     t6, t1, t5
      add     t1, t4, t6
      mv      t4, t1
      # %__tmp.26 = load i32, ptr %__tmp.25
      lw      t1, 0(t4)
      # %__tmp.27 = icmp slt i32 %_i.0.1, %__tmp.26
      sub     t4, t3, t1
      sltz    t1, t4
      mv      t4, t1
      # br i1 %__tmp.27, label %for.body1, label %for.merge1
      beqz     t4, main_for.merge1
main_for.body1:
      # %__tmp.29 = load ptr, ptr @a.0
      la      t1, a.0
      lw      t4, 0(t1)
      # %__tmp.31 = getelementptr i32, ptr %__tmp.29, i32 %_i.0.1
      li      t1, 4
      mul     t5, t3, t1
      add     t1, t4, t5
      mv      t4, t1
      # %__tmp.32 = load i32, ptr %__tmp.31
      lw      t1, 0(t4)
      # %__tmp.28 = call ptr @toString(i32 %__tmp.32)
      mv      a0, t1
      sw      ra, 96(sp)
      sw      t0, 100(sp)
      sw      t1, 104(sp)
      sw      t2, 108(sp)
      sw      t3, 112(sp)
      sw      t4, 116(sp)
      sw      t5, 120(sp)
      sw      t6, 124(sp)
      call    toString
      lw      ra, 96(sp)
      lw      t0, 100(sp)
      lw      t1, 104(sp)
      lw      t2, 108(sp)
      lw      t3, 112(sp)
      lw      t4, 116(sp)
      lw      t5, 120(sp)
      lw      t6, 124(sp)
      mv      t1, a0
      # call void @print(ptr %__tmp.28)
      mv      a0, t1
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
      # br label %for.step1
      j       main_for.step1
main_for.step1:
      # %__tmp.34 = add i32 %_i.0.1, 1
      li      t1, 1
      add     t4, t3, t1
      # br label %for.cond1
      mv      t3, t4
      j       main_for.cond1
main_for.merge1:
      # call void @println(ptr @_string.0)
      la      t1, _string.0
      mv      a0, t1
      sw      ra, 160(sp)
      sw      t0, 164(sp)
      sw      t1, 168(sp)
      sw      t2, 172(sp)
      sw      t3, 176(sp)
      sw      t4, 180(sp)
      sw      t5, 184(sp)
      sw      t6, 188(sp)
      call    println
      lw      ra, 160(sp)
      lw      t0, 164(sp)
      lw      t1, 168(sp)
      lw      t2, 172(sp)
      lw      t3, 176(sp)
      lw      t4, 180(sp)
      lw      t5, 184(sp)
      lw      t6, 188(sp)
      # %__tmp.35 = load ptr, ptr @a.0
      la      t1, a.0
      # store ptr %__tmp.4, ptr @a.0
      la      t1, a.0
      sw      t0, 0(t1)
      # br label %for.cond2
      li      t1, 0
      mv      t4, t1
      j       main_for.cond2
main_for.cond2:
      # %__tmp.39 = load ptr, ptr @a.0
      la      t1, a.0
      lw      t5, 0(t1)
      # %__tmp.40 = getelementptr i32, ptr %__tmp.39, i32 -1
      li      t1, -1
      li      t6, 4
      mul     s0, t1, t6
      add     t1, t5, s0
      mv      t5, t1
      # %__tmp.41 = load i32, ptr %__tmp.40
      lw      t1, 0(t5)
      # %__tmp.42 = icmp slt i32 %_i.0.2, %__tmp.41
      sub     t5, t4, t1
      sltz    t1, t5
      mv      t5, t1
      # br i1 %__tmp.42, label %for.body2, label %for.merge2
      beqz     t5, main_for.merge2
main_for.body2:
      # %__tmp.44 = load ptr, ptr @a.0
      la      t1, a.0
      lw      t5, 0(t1)
      # %__tmp.46 = getelementptr i32, ptr %__tmp.44, i32 %_i.0.2
      li      t1, 4
      mul     t6, t4, t1
      add     t1, t5, t6
      mv      t5, t1
      # %__tmp.47 = load i32, ptr %__tmp.46
      lw      t1, 0(t5)
      # %__tmp.43 = call ptr @toString(i32 %__tmp.47)
      mv      a0, t1
      sw      ra, 192(sp)
      sw      t0, 196(sp)
      sw      t1, 200(sp)
      sw      t2, 204(sp)
      sw      t3, 208(sp)
      sw      t4, 212(sp)
      sw      t5, 216(sp)
      sw      t6, 220(sp)
      call    toString
      lw      ra, 192(sp)
      lw      t0, 196(sp)
      lw      t1, 200(sp)
      lw      t2, 204(sp)
      lw      t3, 208(sp)
      lw      t4, 212(sp)
      lw      t5, 216(sp)
      lw      t6, 220(sp)
      mv      t1, a0
      # call void @print(ptr %__tmp.43)
      mv      a0, t1
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
      # br label %for.step2
      j       main_for.step2
main_for.step2:
      # %__tmp.49 = add i32 %_i.0.2, 1
      li      t1, 1
      add     t5, t4, t1
      # br label %for.cond2
      mv      t4, t5
      j       main_for.cond2
main_for.merge2:
      # ret i32 0
      li      t1, 0
      mv      a0, t1
      addi    sp, sp, 256
      ret     
