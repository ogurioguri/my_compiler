      .section .text
      .globl min
min:
      #0
      addi    sp, sp, -40
      #1
      # caller
      #2
      sw      s0, 0(sp)
      #3
      sw      s1, 4(sp)
      #4
      sw      s2, 8(sp)
      #5
      sw      s3, 12(sp)
      #6
      sw      s4, 16(sp)
      #7
      sw      s5, 20(sp)
      #8
      sw      s6, 24(sp)
      #9
      sw      s7, 28(sp)
      #10
      sw      s8, 32(sp)
      #11
      sw      s9, 36(sp)
      #12
      mv      t0, a0
      #13
      mv      t1, a1
min_entry:
      #14
      # %__tmp.2 = icmp sle i32 %_a, %_b
      #15
      sub     t2, t0, t1
      #16
      sltz    t3, t2
      #17
      seqz    t4, t2
      #18
      or      t2, t3, t4
      #19
      mv      t3, t2
      #20
      # br i1 %__tmp.2, label %if.then0, label %if.merge0
      #21
      beqz     t3, min_if.merge0
min_if.then0:
      #37
      # ret i32 %_a
      #38
      mv      a0, t0
      #39
      lw      s0, 0(sp)
      #40
      lw      s1, 4(sp)
      #41
      lw      s2, 8(sp)
      #42
      lw      s3, 12(sp)
      #43
      lw      s4, 16(sp)
      #44
      lw      s5, 20(sp)
      #45
      lw      s6, 24(sp)
      #46
      lw      s7, 28(sp)
      #47
      lw      s8, 32(sp)
      #48
      lw      s9, 36(sp)
      #49
      addi    sp, sp, 40
      #50
      ret     
      #51
      # caller
min_if.merge0:
      #22
      # ret i32 %_b
      #23
      mv      a0, t1
      #24
      lw      s0, 0(sp)
      #25
      lw      s1, 4(sp)
      #26
      lw      s2, 8(sp)
      #27
      lw      s3, 12(sp)
      #28
      lw      s4, 16(sp)
      #29
      lw      s5, 20(sp)
      #30
      lw      s6, 24(sp)
      #31
      lw      s7, 28(sp)
      #32
      lw      s8, 32(sp)
      #33
      lw      s9, 36(sp)
      #34
      addi    sp, sp, 40
      #35
      ret     
      #36
      # caller
      .section .text
      .globl main
main:
      #0
      addi    sp, sp, -32
main_entry:
      #1
      # %__tmp.6 = add i32 10, 0
      #2
      li      t1, 10
      #3
      li      t3, 0
      #4
      add     t5, t1, t3
      #5
      # %__tmp.7 = add i32 20, 0
      #6
      li      t1, 20
      #7
      li      t3, 0
      #8
      add     s0, t1, t3
      #9
      # %__tmp.5 = call i32 @min(i32 %__tmp.6, i32 %__tmp.7)
      #10
      mv      a0, t5
      #11
      mv      a1, s0
      #12
      sw      ra, 0(sp)
      #13
      sw      t0, 4(sp)
      #14
      sw      t1, 8(sp)
      #15
      sw      t2, 12(sp)
      #16
      sw      t3, 16(sp)
      #17
      sw      t4, 20(sp)
      #18
      sw      t5, 24(sp)
      #19
      sw      t6, 28(sp)
      #20
      call    min
      #21
      lw      ra, 0(sp)
      #22
      lw      t0, 4(sp)
      #23
      lw      t1, 8(sp)
      #24
      lw      t2, 12(sp)
      #25
      lw      t3, 16(sp)
      #26
      lw      t4, 20(sp)
      #27
      lw      t5, 24(sp)
      #28
      lw      t6, 28(sp)
      #29
      mv      t1, a0
      #30
      # ret i32 %__tmp.5
      #31
      mv      a0, t1
      #32
      addi    sp, sp, 32
      #33
      ret     
