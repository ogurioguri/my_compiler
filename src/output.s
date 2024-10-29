      .section .text
      .globl main
main:
      #0
      addi    sp, sp, -32
main_entry:
      #1
      # %__tmp.0 = call ptr @_malloc(i32 4)
      #2
      li      t0, 4
      #3
      mv      a0, t0
      #4
      sw      ra, 0(sp)
      #5
      sw      t0, 4(sp)
      #6
      sw      t1, 8(sp)
      #7
      sw      t2, 12(sp)
      #8
      sw      t3, 16(sp)
      #9
      sw      t4, 20(sp)
      #10
      sw      t5, 24(sp)
      #11
      sw      t6, 28(sp)
      #12
      call    _malloc
      #13
      lw      ra, 0(sp)
      #14
      lw      t0, 4(sp)
      #15
      lw      t1, 8(sp)
      #16
      lw      t2, 12(sp)
      #17
      lw      t3, 16(sp)
      #18
      lw      t4, 20(sp)
      #19
      lw      t5, 24(sp)
      #20
      lw      t6, 28(sp)
      #21
      mv      t0, a0
      #22
      # %__tmp.2 = getelementptr %struct.C1, ptr %__tmp.0, i32 0, i32 0
      #23
      li      t1, 0
      #24
      li      t2, 4
      #25
      mul     t3, t1, t2
      #26
      add     t1, t0, t3
      #27
      mv      t2, t1
      #28
      # %__tmp.3 = load i32, ptr %__tmp.2
      #30
      # store i32 10, ptr %__tmp.2
      #31
      li      t1, 10
      #32
      sw      t1, 0(t2)
      #33
      # %__tmp.5 = getelementptr %struct.C1, ptr %__tmp.0, i32 0, i32 0
      #34
      li      t1, 0
      #35
      li      t2, 4
      #36
      mul     t3, t1, t2
      #37
      add     t1, t0, t3
      #38
      mv      t0, t1
      #39
      # %__tmp.6 = load i32, ptr %__tmp.5
      #40
      lw      t1, 0(t0)
      #41
      # %__tmp.7 = mul i32 2, %__tmp.6
      #42
      li      t0, 2
      #43
      mul     t2, t0, t1
      #44
      # ret i32 %__tmp.7
      #45
      mv      a0, t2
      #46
      addi    sp, sp, 32
      #47
      ret     
