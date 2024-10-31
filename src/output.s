      .section .text
      .globl main
main:
      addi    sp, sp, 0
main_entry:
      # br label %for.cond0
      li      t3, 0
      li      t4, 1
      li      t5, 0
      li      t6, 1
      mv      s0, t3
      mv      t3, t4
      mv      t4, t5
      mv      t5, t6
      mv      t6, t5
      mv      t5, t4
      mv      t4, t3
      mv      t3, s0
      j       main_for.cond0
main_for.cond0:
      # %__tmp.2 = add i32 10, 0
      li      s0, 10
      li      s1, 0
      add     s2, s0, s1
      # %__tmp.3 = icmp slt i32 %_i.0.0, %__tmp.2
      sub     s0, t6, s2
      sltz    s1, s0
      mv      s0, s1
      # br i1 %__tmp.3, label %for.body0, label %for.merge0
      beqz     s0, main_for.merge0
main_for.body0:
      # %__tmp.7 = add i32 %_f0.0.0, %_f1.0.0
      add     s0, t5, t4
      # br label %for.step0
      j       main_for.step0
main_for.step0:
      # %__tmp.13 = add i32 %_i.0.0, 1
      li      s1, 1
      add     s2, t6, s1
      # br label %for.cond0
      mv      s1, s0
      mv      s3, s0
      mv      s0, t4
      mv      s4, s2
      mv      t6, s4
      mv      t5, s0
      mv      t4, s3
      mv      t3, s1
      j       main_for.cond0
main_for.merge0:
      # ret i32 %_f2.0.0
      mv      a0, t3
      j       main_return
main_return:
      addi    sp, sp, 0
      ret     
