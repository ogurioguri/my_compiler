      .section .text
      .globl main
main:
      #0
      addi    sp, sp, 0
main_entry:
      #1
      # %__tmp.0 = add i32 10, 0
      #2
      li      t0, 10
      #3
      li      t1, 0
      #4
      add     t2, t0, t1
      #5
      # %__tmp.1 = add i32 10, 0
      #6
      li      t0, 10
      #7
      li      t1, 0
      #8
      add     t3, t0, t1
      #9
      # %__tmp.2 = icmp eq i32 %__tmp.1, 10
      #10
      li      t0, 10
      #11
      sub     t1, t3, t0
      #12
      seqz    t0, t1
      #13
      mv      t1, t0
      #14
      # br i1 %__tmp.2, label %if.then0, label %split0
      #15
      beqz     t1, main_split0
main_if.then0:
      #16
      # %__tmp.4 = add i32 20, 0
      #17
      li      t0, 20
      #18
      li      t1, 0
      #19
      add     t3, t0, t1
      #20
      # br label %if.merge0
      #21
      mv      t0, t3
      #22
      li      t1, 20
      #24
      j       main_if.merge0
main_split0:
      #25
      # br label %if.merge0
      #26
      mv      t0, t2
      #27
      li      t1, 0
      #29
      j       main_if.merge0
main_if.merge0:
      #30
      # ret i32 %_y.0.0
      #31
      mv      a0, t0
      #32
      addi    sp, sp, 0
      #33
      ret
