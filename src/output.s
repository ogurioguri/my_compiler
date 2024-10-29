      .section .text
      .globl main
main:
      addi    sp, sp, -32
main_entry:
      # %__tmp.0 = add ptr null, 0
      li      t0, 0
      li      t1, 0
      add     t2, t0, t1
      # %__tmp.1 = call i32 @Array.size(ptr %__tmp.0)
      mv      a0, t2
      sw      ra, 0(sp)
      sw      t0, 4(sp)
      sw      t1, 8(sp)
      sw      t2, 12(sp)
      sw      t3, 16(sp)
      sw      t4, 20(sp)
      sw      t5, 24(sp)
      sw      t6, 28(sp)
      call    Array.size
      lw      ra, 0(sp)
      lw      t0, 4(sp)
      lw      t1, 8(sp)
      lw      t2, 12(sp)
      lw      t3, 16(sp)
      lw      t4, 20(sp)
      lw      t5, 24(sp)
      lw      t6, 28(sp)
      # ret i32 0
      li      t0, 0
      mv      a0, t0
      addi    sp, sp, 32
      ret     
      .section .text
      .globl Array.size
Array.size:
      addi    sp, sp, -40
      # caller
      sw      s0, 0(sp)
      sw      s1, 4(sp)
      sw      s2, 8(sp)
      sw      s3, 12(sp)
      sw      s4, 16(sp)
      sw      s5, 20(sp)
      sw      s6, 24(sp)
      sw      s7, 28(sp)
      sw      s8, 32(sp)
      sw      s9, 36(sp)
Array.size_entry:
      # ret i32 0
      li      t0, 0
      mv      a0, t0
      lw      s0, 0(sp)
      lw      s1, 4(sp)
      lw      s2, 8(sp)
      lw      s3, 12(sp)
      lw      s4, 16(sp)
      lw      s5, 20(sp)
      lw      s6, 24(sp)
      lw      s7, 28(sp)
      lw      s8, 32(sp)
      lw      s9, 36(sp)
      addi    sp, sp, 40
      ret     
      # caller
