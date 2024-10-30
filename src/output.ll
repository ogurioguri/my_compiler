      .section .data
      .globl a.0
a.0:
      .word  0
      .section .text
      .globl __init
__init:
      addi    sp, sp, 0
__init_entry:
      # %__tmp.0 = call ptr @_malloc_array(i32 4, i32 4)
      li      vr0, 4
      mv      a0, vr0
      li      vr1, 4
      mv      a1, vr1
      sw      ra, 0(sp)
      sw      t0, 0(sp)
      sw      t1, 0(sp)
      sw      t2, 0(sp)
      sw      t3, 0(sp)
      sw      t4, 0(sp)
      sw      t5, 0(sp)
      sw      t6, 0(sp)
      call    _malloc_array
      lw      ra, -32(sp)
      lw      t0, -28(sp)
      lw      t1, -24(sp)
      lw      t2, -20(sp)
      lw      t3, -16(sp)
      lw      t4, -12(sp)
      lw      t5, -8(sp)
      lw      t6, -4(sp)
      mv      vr2, a0
      # store ptr %__tmp.0, ptr @a.0
      la      vr3, a.0
      sw      vr2, 0(vr3)
      # ret void
      addi    sp, sp, 0
      ret
      .section .text
      .globl main
main:
      addi    sp, sp, 0
main_entry:
      # call void @__init()
      sw      ra, 0(sp)
      sw      t0, 0(sp)
      sw      t1, 0(sp)
      sw      t2, 0(sp)
      sw      t3, 0(sp)
      sw      t4, 0(sp)
      sw      t5, 0(sp)
      sw      t6, 0(sp)
      call    __init
      lw      ra, -32(sp)
      lw      t0, -28(sp)
      lw      t1, -24(sp)
      lw      t2, -20(sp)
      lw      t3, -16(sp)
      lw      t4, -12(sp)
      lw      t5, -8(sp)
      lw      t6, -4(sp)
      # %__tmp.1 = load ptr, ptr @a.0
      la      vr1, a.0
      lw      vr0, 0(vr1)
      # %__tmp.2 = getelementptr i32, ptr %__tmp.1, i32 -1
      li      vr2, -1
      li      vr5, 4
      mul     vr3, vr2, vr5
      add     vr4, vr0, vr3
      mv      vr6, vr4
      # %__tmp.3 = load i32, ptr %__tmp.2
      lw      vr7, 0(vr6)
      # %__tmp.4 = call ptr @_malloc_array(i32 4, i32 %__tmp.3)
      li      vr8, 4
      mv      a0, vr8
      mv      a1, vr7
      sw      ra, 0(sp)
      sw      t0, 0(sp)
      sw      t1, 0(sp)
      sw      t2, 0(sp)
      sw      t3, 0(sp)
      sw      t4, 0(sp)
      sw      t5, 0(sp)
      sw      t6, 0(sp)
      call    _malloc_array
      lw      ra, -32(sp)
      lw      t0, -28(sp)
      lw      t1, -24(sp)
      lw      t2, -20(sp)
      lw      t3, -16(sp)
      lw      t4, -12(sp)
      lw      t5, -8(sp)
      lw      t6, -4(sp)
      mv      vr9, a0
      # br label %for.cond0
      li      vr31, 0
      mv      vr18, vr31
      j       main_for.cond0
main_for.cond0:
      # %__tmp.7 = load ptr, ptr @a.0
      la      vr11, a.0
      lw      vr10, 0(vr11)
      # %__tmp.8 = getelementptr i32, ptr %__tmp.7, i32 -1
      li      vr12, -1
      li      vr15, 4
      mul     vr13, vr12, vr15
      add     vr14, vr10, vr13
      mv      vr16, vr14
      # %__tmp.9 = load i32, ptr %__tmp.8
      lw      vr17, 0(vr16)
      # %__tmp.10 = icmp slt i32 %_i.0.0, %__tmp.9
      sub     vr19, vr18, vr17
      sltz    vr20, vr19
      mv      vr21, vr20
      # br i1 %__tmp.10, label %for.body0, label %for.merge0
      beqz     vr21, main_for.merge0
main_for.body0:
      # %__tmp.13 = getelementptr i32, ptr %__tmp.4, i32 %_i.0.0
      li      vr24, 4
      mul     vr22, vr18, vr24
      add     vr23, vr9, vr22
      mv      vr25, vr23
      # %__tmp.14 = load i32, ptr %__tmp.13
      lw      vr26, 0(vr25)
      # store i32 0, ptr %__tmp.13
      li      vr27, 0
      sw      vr27, 0(vr25)
      # br label %for.step0
      j       main_for.step0
main_for.step0:
      # %__tmp.16 = add i32 %_i.0.0, 1
      li      vr28, 1
      add     vr29, vr18, vr28
      # br label %for.cond0
      mv      vr18, vr29
      j       main_for.cond0
main_for.merge0:
      # ret i32 0
      li      vr30, 0
      mv      a0, vr30
      addi    sp, sp, 0
      ret
