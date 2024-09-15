      .section .rodata
      .globl _string.0
_string.0:
      .asciz  "( "
      .section .rodata
      .globl _string.1
_string.1:
      .asciz  ", "
      .section .rodata
      .globl _string.2
_string.2:
      .asciz  " )"
      .section .rodata
      .globl _string.3
_string.3:
      .asciz  "vector x: "
      .section .rodata
      .globl _string.4
_string.4:
      .asciz  "excited!"
      .section .rodata
      .globl _string.5
_string.5:
      .asciz  "vector y: "
      .section .rodata
      .globl _string.6
_string.6:
      .asciz  "x + y: "
      .section .rodata
      .globl _string.7
_string.7:
      .asciz  "x * y: "
      .section .rodata
      .globl _string.8
_string.8:
      .asciz  "(1 << 3) * y: "
      .section .text
      .globl vector.add
vector.add:
      addi    sp, sp, -240
      mv      t0, a0
      sw      t0, 0(sp)
      mv      t0, a1
      sw      t0, 4(sp)
vector.add_entry:
      # %_rhs.1 = alloca ptr
      addi    t0, sp, 12
      sw      t0, 8(sp)
      # store ptr %_rhs, ptr %_rhs.1
      lw      t0, 4(sp)
      lw      t1, 8(sp)
      sw      t0, 0(t1)
      # %_this.10 = alloca ptr
      addi    t0, sp, 20
      sw      t0, 16(sp)
      # store ptr %_this.9, ptr %_this.10
      lw      t0, 0(sp)
      lw      t1, 16(sp)
      sw      t0, 0(t1)
      # %_call.2 = load ptr, ptr %_this.10
      lw      t1, 16(sp)
      lw      t0, 0(t1)
      sw      t0, 24(sp)
      # %__tmp.69 = call i32 @vector.getDim(ptr %_call.2)
      lw      t0, 24(sp)
      mv      a0, t0
      sw      ra, 28(sp)
      call    vector.getDim
      mv      t0, a0
      sw      t0, 32(sp)
      lw      ra, 28(sp)
      # %__tmp.70 = load ptr, ptr %_rhs.1
      lw      t1, 8(sp)
      lw      t0, 0(t1)
      sw      t0, 36(sp)
      # %__tmp.71 = call i32 @vector.getDim(ptr %__tmp.70)
      lw      t0, 36(sp)
      mv      a0, t0
      sw      ra, 40(sp)
      call    vector.getDim
      mv      t0, a0
      sw      t0, 44(sp)
      lw      ra, 40(sp)
      # %__tmp.72 = icmp ne i32 %__tmp.69, %__tmp.71
      lw      t1, 32(sp)
      lw      t2, 44(sp)
      sub     t0, t1, t2
      snez    t3, t0
      mv      t0, t3
      sw      t0, 48(sp)
      # br i1 %__tmp.72, label %if.then.3, label %if.else.3
      lw      t0, 48(sp)
      beqz     t0, vector.add_if.else.3
vector.add_if.then.3:
      # br label %if.end.3
      lw      t1, 48(sp)
      mv      t0, t1
      j       vector.add_if.end.3
vector.add_if.else.3:
      # %_call.3 = load ptr, ptr %_this.10
      lw      t1, 16(sp)
      lw      t0, 0(t1)
      sw      t0, 52(sp)
      # %__tmp.73 = call i32 @vector.getDim(ptr %_call.3)
      lw      t0, 52(sp)
      mv      a0, t0
      sw      ra, 56(sp)
      call    vector.getDim
      mv      t0, a0
      sw      t0, 60(sp)
      lw      ra, 56(sp)
      # %__tmp.74 = icmp eq i32 %__tmp.73, 0
      li      t2, 0
      lw      t1, 60(sp)
      sub     t0, t1, t2
      seqz    t3, t0
      mv      t0, t3
      sw      t0, 64(sp)
      # br label %if.end.3
      lw      t1, 64(sp)
      mv      t0, t1
      j       vector.add_if.end.3
vector.add_if.end.3:
      sw      t0, 68(sp)
      # br i1 %__tmp.75, label %if.then4, label %if.merge4
      lw      t0, 68(sp)
      beqz     t0, vector.add_if.merge4
vector.add_if.then4:
      # ret ptr null
      li      t0, 0
      mv      a0, t0
      addi    sp, sp, 240
      ret     
      # br label %if.merge4
      j       vector.add_if.merge4
vector.add_if.merge4:
      # %_temp.0 = alloca ptr
      addi    t0, sp, 76
      sw      t0, 72(sp)
      # %__tmp.76 = call ptr @_malloc(i32 8)
      li      t0, 8
      mv      a0, t0
      sw      ra, 80(sp)
      call    _malloc
      mv      t0, a0
      sw      t0, 84(sp)
      lw      ra, 80(sp)
      # store ptr %__tmp.76, ptr %_temp.0
      lw      t0, 84(sp)
      lw      t1, 72(sp)
      sw      t0, 0(t1)
      # %_i.3 = alloca i32
      addi    t0, sp, 92
      sw      t0, 88(sp)
      # %__tmp.77 = load ptr, ptr %_temp.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      sw      t0, 96(sp)
      # %__tmp.78 = getelementptr %struct.vector, ptr %__tmp.77, i32 0, i32 0
      li      t1, 0
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 96(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 100(sp)
      # %__tmp.79 = load ptr, ptr %__tmp.78
      lw      t1, 100(sp)
      lw      t0, 0(t1)
      sw      t0, 104(sp)
      # %_call.4 = load ptr, ptr %_this.10
      lw      t1, 16(sp)
      lw      t0, 0(t1)
      sw      t0, 108(sp)
      # %__tmp.80 = call i32 @vector.getDim(ptr %_call.4)
      lw      t0, 108(sp)
      mv      a0, t0
      sw      ra, 112(sp)
      call    vector.getDim
      mv      t0, a0
      sw      t0, 116(sp)
      lw      ra, 112(sp)
      # %__tmp.81 = call ptr @_malloc_array(i32 4, i32 %__tmp.80)
      li      t0, 4
      mv      a0, t0
      lw      t0, 116(sp)
      mv      a1, t0
      sw      ra, 120(sp)
      call    _malloc_array
      mv      t0, a0
      sw      t0, 124(sp)
      lw      ra, 120(sp)
      # store ptr %__tmp.81, ptr %__tmp.78
      lw      t0, 124(sp)
      lw      t1, 100(sp)
      sw      t0, 0(t1)
      # %__tmp.82 = load i32, ptr %_i.3
      lw      t1, 88(sp)
      lw      t0, 0(t1)
      sw      t0, 128(sp)
      # store i32 0, ptr %_i.3
      li      t0, 0
      lw      t1, 88(sp)
      sw      t0, 0(t1)
      # br label %for.cond2
      j       vector.add_for.cond2
vector.add_for.cond2:
      # %__tmp.83 = load i32, ptr %_i.3
      lw      t1, 88(sp)
      lw      t0, 0(t1)
      sw      t0, 132(sp)
      # %_call.5 = load ptr, ptr %_this.10
      lw      t1, 16(sp)
      lw      t0, 0(t1)
      sw      t0, 136(sp)
      # %__tmp.84 = call i32 @vector.getDim(ptr %_call.5)
      lw      t0, 136(sp)
      mv      a0, t0
      sw      ra, 140(sp)
      call    vector.getDim
      mv      t0, a0
      sw      t0, 144(sp)
      lw      ra, 140(sp)
      # %__tmp.85 = icmp slt i32 %__tmp.83, %__tmp.84
      lw      t1, 132(sp)
      lw      t2, 144(sp)
      sub     t0, t1, t2
      sltz    t3, t0
      mv      t0, t3
      sw      t0, 148(sp)
      # br i1 %__tmp.85, label %for.body2, label %for.merge2
      lw      t0, 148(sp)
      beqz     t0, vector.add_for.merge2
vector.add_for.body2:
      # %__tmp.86 = load ptr, ptr %_temp.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      sw      t0, 152(sp)
      # %__tmp.87 = getelementptr %struct.vector, ptr %__tmp.86, i32 0, i32 0
      li      t1, 0
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 152(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 156(sp)
      # %__tmp.88 = load ptr, ptr %__tmp.87
      lw      t1, 156(sp)
      lw      t0, 0(t1)
      sw      t0, 160(sp)
      # %__tmp.89 = load i32, ptr %_i.3
      lw      t1, 88(sp)
      lw      t0, 0(t1)
      sw      t0, 164(sp)
      # %__tmp.90 = getelementptr i32, ptr %__tmp.88, i32 %__tmp.89
      lw      t0, 164(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 160(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 168(sp)
      # %__tmp.91 = load i32, ptr %__tmp.90
      lw      t1, 168(sp)
      lw      t0, 0(t1)
      sw      t0, 172(sp)
      # %_data.12 = load ptr, ptr %_this.10
      lw      t1, 16(sp)
      lw      t0, 0(t1)
      sw      t0, 176(sp)
      # %_data.13 = getelementptr %struct.vector, ptr %_data.12, i32 0, i32 0
      li      t1, 0
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 176(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 180(sp)
      # %__tmp.92 = load ptr, ptr %_data.13
      lw      t1, 180(sp)
      lw      t0, 0(t1)
      sw      t0, 184(sp)
      # %__tmp.93 = load i32, ptr %_i.3
      lw      t1, 88(sp)
      lw      t0, 0(t1)
      sw      t0, 188(sp)
      # %__tmp.94 = getelementptr i32, ptr %__tmp.92, i32 %__tmp.93
      lw      t0, 188(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 184(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 192(sp)
      # %__tmp.95 = load i32, ptr %__tmp.94
      lw      t1, 192(sp)
      lw      t0, 0(t1)
      sw      t0, 196(sp)
      # %__tmp.96 = load ptr, ptr %_rhs.1
      lw      t1, 8(sp)
      lw      t0, 0(t1)
      sw      t0, 200(sp)
      # %__tmp.97 = getelementptr %struct.vector, ptr %__tmp.96, i32 0, i32 0
      li      t1, 0
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 200(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 204(sp)
      # %__tmp.98 = load ptr, ptr %__tmp.97
      lw      t1, 204(sp)
      lw      t0, 0(t1)
      sw      t0, 208(sp)
      # %__tmp.99 = load i32, ptr %_i.3
      lw      t1, 88(sp)
      lw      t0, 0(t1)
      sw      t0, 212(sp)
      # %__tmp.100 = getelementptr i32, ptr %__tmp.98, i32 %__tmp.99
      lw      t0, 212(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 208(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 216(sp)
      # %__tmp.101 = load i32, ptr %__tmp.100
      lw      t1, 216(sp)
      lw      t0, 0(t1)
      sw      t0, 220(sp)
      # %__tmp.102 = add i32 %__tmp.95, %__tmp.101
      lw      t1, 196(sp)
      lw      t2, 220(sp)
      add     t0, t1, t2
      sw      t0, 224(sp)
      # store i32 %__tmp.102, ptr %__tmp.90
      lw      t0, 224(sp)
      lw      t1, 168(sp)
      sw      t0, 0(t1)
      # br label %for.step2
      j       vector.add_for.step2
vector.add_for.step2:
      # %__tmp.103 = load i32, ptr %_i.3
      lw      t1, 88(sp)
      lw      t0, 0(t1)
      sw      t0, 228(sp)
      # %__tmp.104 = add i32 %__tmp.103, 1
      li      t2, 1
      lw      t1, 228(sp)
      add     t0, t1, t2
      sw      t0, 232(sp)
      # store i32 %__tmp.104, ptr %_i.3
      lw      t0, 232(sp)
      lw      t1, 88(sp)
      sw      t0, 0(t1)
      # br label %for.cond2
      j       vector.add_for.cond2
vector.add_for.merge2:
      # %__tmp.105 = load ptr, ptr %_temp.0
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      sw      t0, 236(sp)
      # ret ptr %__tmp.105
      lw      t0, 236(sp)
      mv      a0, t0
      addi    sp, sp, 240
      ret     
      .section .text
      .globl vector.init
vector.init:
      addi    sp, sp, -144
      mv      t0, a0
      sw      t0, 0(sp)
      mv      t0, a1
      sw      t0, 4(sp)
vector.init_entry:
      # %_vec.0 = alloca ptr
      addi    t0, sp, 12
      sw      t0, 8(sp)
      # store ptr %_vec, ptr %_vec.0
      lw      t0, 4(sp)
      lw      t1, 8(sp)
      sw      t0, 0(t1)
      # %_this.2 = alloca ptr
      addi    t0, sp, 20
      sw      t0, 16(sp)
      # store ptr %_this.1, ptr %_this.2
      lw      t0, 0(sp)
      lw      t1, 16(sp)
      sw      t0, 0(t1)
      # %__tmp.0 = load ptr, ptr %_vec.0
      lw      t1, 8(sp)
      lw      t0, 0(t1)
      sw      t0, 24(sp)
      # %__tmp.1 = icmp eq ptr %__tmp.0, null
      li      t2, 0
      lw      t1, 24(sp)
      sub     t0, t1, t2
      seqz    t3, t0
      mv      t0, t3
      sw      t0, 28(sp)
      # br i1 %__tmp.1, label %if.then0, label %if.merge0
      lw      t0, 28(sp)
      beqz     t0, vector.init_if.merge0
vector.init_if.then0:
      # ret void
      addi    sp, sp, 144
      ret     
      # br label %if.merge0
      j       vector.init_if.merge0
vector.init_if.merge0:
      # %_data.0 = load ptr, ptr %_this.2
      lw      t1, 16(sp)
      lw      t0, 0(t1)
      sw      t0, 32(sp)
      # %_data.1 = getelementptr %struct.vector, ptr %_data.0, i32 0, i32 0
      li      t1, 0
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 32(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 36(sp)
      # %__tmp.2 = load ptr, ptr %_data.1
      lw      t1, 36(sp)
      lw      t0, 0(t1)
      sw      t0, 40(sp)
      # %__tmp.3 = load ptr, ptr %_vec.0
      lw      t1, 8(sp)
      lw      t0, 0(t1)
      sw      t0, 44(sp)
      # %__tmp.4 = getelementptr i32, ptr %__tmp.3, i32 -1
      li      t1, -1
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 44(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 48(sp)
      # %__tmp.5 = load i32, ptr %__tmp.4
      lw      t1, 48(sp)
      lw      t0, 0(t1)
      sw      t0, 52(sp)
      # %__tmp.6 = call ptr @_malloc_array(i32 4, i32 %__tmp.5)
      li      t0, 4
      mv      a0, t0
      lw      t0, 52(sp)
      mv      a1, t0
      sw      ra, 56(sp)
      call    _malloc_array
      mv      t0, a0
      sw      t0, 60(sp)
      lw      ra, 56(sp)
      # store ptr %__tmp.6, ptr %_data.1
      lw      t0, 60(sp)
      lw      t1, 36(sp)
      sw      t0, 0(t1)
      # %_i.0 = alloca i32
      addi    t0, sp, 68
      sw      t0, 64(sp)
      # %__tmp.7 = load i32, ptr %_i.0
      lw      t1, 64(sp)
      lw      t0, 0(t1)
      sw      t0, 72(sp)
      # store i32 0, ptr %_i.0
      li      t0, 0
      lw      t1, 64(sp)
      sw      t0, 0(t1)
      # br label %for.cond0
      j       vector.init_for.cond0
vector.init_for.cond0:
      # %__tmp.8 = load i32, ptr %_i.0
      lw      t1, 64(sp)
      lw      t0, 0(t1)
      sw      t0, 76(sp)
      # %__tmp.9 = load ptr, ptr %_vec.0
      lw      t1, 8(sp)
      lw      t0, 0(t1)
      sw      t0, 80(sp)
      # %__tmp.10 = getelementptr i32, ptr %__tmp.9, i32 -1
      li      t1, -1
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 80(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 84(sp)
      # %__tmp.11 = load i32, ptr %__tmp.10
      lw      t1, 84(sp)
      lw      t0, 0(t1)
      sw      t0, 88(sp)
      # %__tmp.12 = icmp slt i32 %__tmp.8, %__tmp.11
      lw      t1, 76(sp)
      lw      t2, 88(sp)
      sub     t0, t1, t2
      sltz    t3, t0
      mv      t0, t3
      sw      t0, 92(sp)
      # br i1 %__tmp.12, label %for.body0, label %for.merge0
      lw      t0, 92(sp)
      beqz     t0, vector.init_for.merge0
vector.init_for.body0:
      # %_data.2 = load ptr, ptr %_this.2
      lw      t1, 16(sp)
      lw      t0, 0(t1)
      sw      t0, 96(sp)
      # %_data.3 = getelementptr %struct.vector, ptr %_data.2, i32 0, i32 0
      li      t1, 0
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 96(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 100(sp)
      # %__tmp.13 = load ptr, ptr %_data.3
      lw      t1, 100(sp)
      lw      t0, 0(t1)
      sw      t0, 104(sp)
      # %__tmp.14 = load i32, ptr %_i.0
      lw      t1, 64(sp)
      lw      t0, 0(t1)
      sw      t0, 108(sp)
      # %__tmp.15 = getelementptr i32, ptr %__tmp.13, i32 %__tmp.14
      lw      t0, 108(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 104(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 112(sp)
      # %__tmp.16 = load i32, ptr %__tmp.15
      lw      t1, 112(sp)
      lw      t0, 0(t1)
      sw      t0, 116(sp)
      # %__tmp.17 = load ptr, ptr %_vec.0
      lw      t1, 8(sp)
      lw      t0, 0(t1)
      sw      t0, 120(sp)
      # %__tmp.18 = load i32, ptr %_i.0
      lw      t1, 64(sp)
      lw      t0, 0(t1)
      sw      t0, 124(sp)
      # %__tmp.19 = getelementptr i32, ptr %__tmp.17, i32 %__tmp.18
      lw      t0, 124(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 120(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 128(sp)
      # %__tmp.20 = load i32, ptr %__tmp.19
      lw      t1, 128(sp)
      lw      t0, 0(t1)
      sw      t0, 132(sp)
      # store i32 %__tmp.20, ptr %__tmp.15
      lw      t0, 132(sp)
      lw      t1, 112(sp)
      sw      t0, 0(t1)
      # br label %for.step0
      j       vector.init_for.step0
vector.init_for.step0:
      # %__tmp.21 = load i32, ptr %_i.0
      lw      t1, 64(sp)
      lw      t0, 0(t1)
      sw      t0, 136(sp)
      # %__tmp.22 = add i32 %__tmp.21, 1
      li      t2, 1
      lw      t1, 136(sp)
      add     t0, t1, t2
      sw      t0, 140(sp)
      # store i32 %__tmp.22, ptr %_i.0
      lw      t0, 140(sp)
      lw      t1, 64(sp)
      sw      t0, 0(t1)
      # br label %for.cond0
      j       vector.init_for.cond0
vector.init_for.merge0:
      # ret void
      addi    sp, sp, 144
      ret     
      .section .text
      .globl vector.scalarInPlaceMultiply
vector.scalarInPlaceMultiply:
      addi    sp, sp, -140
      mv      t0, a0
      sw      t0, 0(sp)
      mv      t0, a1
      sw      t0, 4(sp)
vector.scalarInPlaceMultiply_entry:
      # %_c.0 = alloca i32
      addi    t0, sp, 12
      sw      t0, 8(sp)
      # store i32 %_c, ptr %_c.0
      lw      t0, 4(sp)
      lw      t1, 8(sp)
      sw      t0, 0(t1)
      # %_this.8 = alloca ptr
      addi    t0, sp, 20
      sw      t0, 16(sp)
      # store ptr %_this.7, ptr %_this.8
      lw      t0, 0(sp)
      lw      t1, 16(sp)
      sw      t0, 0(t1)
      # %_data.10 = load ptr, ptr %_this.8
      lw      t1, 16(sp)
      lw      t0, 0(t1)
      sw      t0, 24(sp)
      # %_data.11 = getelementptr %struct.vector, ptr %_data.10, i32 0, i32 0
      li      t1, 0
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 24(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 28(sp)
      # %__tmp.46 = load ptr, ptr %_data.11
      lw      t1, 28(sp)
      lw      t0, 0(t1)
      sw      t0, 32(sp)
      # %__tmp.47 = icmp eq ptr %__tmp.46, null
      li      t2, 0
      lw      t1, 32(sp)
      sub     t0, t1, t2
      seqz    t3, t0
      mv      t0, t3
      sw      t0, 36(sp)
      # br i1 %__tmp.47, label %if.then2, label %if.merge2
      lw      t0, 36(sp)
      beqz     t0, vector.scalarInPlaceMultiply_if.merge2
vector.scalarInPlaceMultiply_if.then2:
      # ret ptr null
      li      t0, 0
      mv      a0, t0
      addi    sp, sp, 140
      ret     
      # br label %if.merge2
      j       vector.scalarInPlaceMultiply_if.merge2
vector.scalarInPlaceMultiply_if.merge2:
      # %_i.2 = alloca i32
      addi    t0, sp, 44
      sw      t0, 40(sp)
      # %__tmp.48 = load i32, ptr %_i.2
      lw      t1, 40(sp)
      lw      t0, 0(t1)
      sw      t0, 48(sp)
      # store i32 0, ptr %_i.2
      li      t0, 0
      lw      t1, 40(sp)
      sw      t0, 0(t1)
      # br label %for.cond1
      j       vector.scalarInPlaceMultiply_for.cond1
vector.scalarInPlaceMultiply_for.cond1:
      # %__tmp.49 = load i32, ptr %_i.2
      lw      t1, 40(sp)
      lw      t0, 0(t1)
      sw      t0, 52(sp)
      # %_call.1 = load ptr, ptr %_this.8
      lw      t1, 16(sp)
      lw      t0, 0(t1)
      sw      t0, 56(sp)
      # %__tmp.50 = call i32 @vector.getDim(ptr %_call.1)
      lw      t0, 56(sp)
      mv      a0, t0
      sw      ra, 60(sp)
      call    vector.getDim
      mv      t0, a0
      sw      t0, 64(sp)
      lw      ra, 60(sp)
      # %__tmp.51 = icmp slt i32 %__tmp.49, %__tmp.50
      lw      t1, 52(sp)
      lw      t2, 64(sp)
      sub     t0, t1, t2
      sltz    t3, t0
      mv      t0, t3
      sw      t0, 68(sp)
      # br i1 %__tmp.51, label %for.body1, label %for.merge1
      lw      t0, 68(sp)
      beqz     t0, vector.scalarInPlaceMultiply_for.merge1
vector.scalarInPlaceMultiply_for.body1:
      # %__tmp52 = load ptr, ptr %_this.8
      lw      t1, 16(sp)
      lw      t0, 0(t1)
      sw      t0, 72(sp)
      # %__tmp.53 = getelementptr %struct.vector, ptr %__tmp52, i32 0, i32 0
      li      t1, 0
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 72(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 76(sp)
      # %__tmp.54 = load ptr, ptr %__tmp.53
      lw      t1, 76(sp)
      lw      t0, 0(t1)
      sw      t0, 80(sp)
      # %__tmp.55 = load i32, ptr %_i.2
      lw      t1, 40(sp)
      lw      t0, 0(t1)
      sw      t0, 84(sp)
      # %__tmp.56 = getelementptr i32, ptr %__tmp.54, i32 %__tmp.55
      lw      t0, 84(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 80(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 88(sp)
      # %__tmp.57 = load i32, ptr %__tmp.56
      lw      t1, 88(sp)
      lw      t0, 0(t1)
      sw      t0, 92(sp)
      # %__tmp.58 = load i32, ptr %_c.0
      lw      t1, 8(sp)
      lw      t0, 0(t1)
      sw      t0, 96(sp)
      # %__tmp59 = load ptr, ptr %_this.8
      lw      t1, 16(sp)
      lw      t0, 0(t1)
      sw      t0, 100(sp)
      # %__tmp.60 = getelementptr %struct.vector, ptr %__tmp59, i32 0, i32 0
      li      t1, 0
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 100(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 104(sp)
      # %__tmp.61 = load ptr, ptr %__tmp.60
      lw      t1, 104(sp)
      lw      t0, 0(t1)
      sw      t0, 108(sp)
      # %__tmp.62 = load i32, ptr %_i.2
      lw      t1, 40(sp)
      lw      t0, 0(t1)
      sw      t0, 112(sp)
      # %__tmp.63 = getelementptr i32, ptr %__tmp.61, i32 %__tmp.62
      lw      t0, 112(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 108(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 116(sp)
      # %__tmp.64 = load i32, ptr %__tmp.63
      lw      t1, 116(sp)
      lw      t0, 0(t1)
      sw      t0, 120(sp)
      # %__tmp.65 = mul i32 %__tmp.58, %__tmp.64
      lw      t1, 96(sp)
      lw      t2, 120(sp)
      mul     t0, t1, t2
      sw      t0, 124(sp)
      # store i32 %__tmp.65, ptr %__tmp.56
      lw      t0, 124(sp)
      lw      t1, 88(sp)
      sw      t0, 0(t1)
      # br label %for.step1
      j       vector.scalarInPlaceMultiply_for.step1
vector.scalarInPlaceMultiply_for.step1:
      # %__tmp.66 = load i32, ptr %_i.2
      lw      t1, 40(sp)
      lw      t0, 0(t1)
      sw      t0, 128(sp)
      # %__tmp.67 = add i32 %__tmp.66, 1
      li      t2, 1
      lw      t1, 128(sp)
      add     t0, t1, t2
      sw      t0, 132(sp)
      # store i32 %__tmp.67, ptr %_i.2
      lw      t0, 132(sp)
      lw      t1, 40(sp)
      sw      t0, 0(t1)
      # br label %for.cond1
      j       vector.scalarInPlaceMultiply_for.cond1
vector.scalarInPlaceMultiply_for.merge1:
      # %__tmp68 = load ptr, ptr %_this.8
      lw      t1, 16(sp)
      lw      t0, 0(t1)
      sw      t0, 136(sp)
      # ret ptr %__tmp68
      lw      t0, 136(sp)
      mv      a0, t0
      addi    sp, sp, 140
      ret     
      .section .text
      .globl vector.set
vector.set:
      addi    sp, sp, -84
      mv      t0, a0
      sw      t0, 0(sp)
      mv      t0, a1
      sw      t0, 4(sp)
      mv      t0, a2
      sw      t0, 8(sp)
vector.set_entry:
      # %_idx.0 = alloca i32
      addi    t0, sp, 16
      sw      t0, 12(sp)
      # store i32 %_idx, ptr %_idx.0
      lw      t0, 4(sp)
      lw      t1, 12(sp)
      sw      t0, 0(t1)
      # %_value.0 = alloca i32
      addi    t0, sp, 24
      sw      t0, 20(sp)
      # store i32 %_value, ptr %_value.0
      lw      t0, 8(sp)
      lw      t1, 20(sp)
      sw      t0, 0(t1)
      # %_this.12 = alloca ptr
      addi    t0, sp, 32
      sw      t0, 28(sp)
      # store ptr %_this.11, ptr %_this.12
      lw      t0, 0(sp)
      lw      t1, 28(sp)
      sw      t0, 0(t1)
      # %_call.6 = load ptr, ptr %_this.12
      lw      t1, 28(sp)
      lw      t0, 0(t1)
      sw      t0, 36(sp)
      # %__tmp.106 = call i32 @vector.getDim(ptr %_call.6)
      lw      t0, 36(sp)
      mv      a0, t0
      sw      ra, 40(sp)
      call    vector.getDim
      mv      t0, a0
      sw      t0, 44(sp)
      lw      ra, 40(sp)
      # %__tmp.107 = load i32, ptr %_idx.0
      lw      t1, 12(sp)
      lw      t0, 0(t1)
      sw      t0, 48(sp)
      # %__tmp.108 = icmp slt i32 %__tmp.106, %__tmp.107
      lw      t1, 44(sp)
      lw      t2, 48(sp)
      sub     t0, t1, t2
      sltz    t3, t0
      mv      t0, t3
      sw      t0, 52(sp)
      # br i1 %__tmp.108, label %if.then5, label %if.merge5
      lw      t0, 52(sp)
      beqz     t0, vector.set_if.merge5
vector.set_if.then5:
      # ret i1 0
      li      t0, 0
      mv      a0, t0
      addi    sp, sp, 84
      ret     
      # br label %if.merge5
      j       vector.set_if.merge5
vector.set_if.merge5:
      # %_data.14 = load ptr, ptr %_this.12
      lw      t1, 28(sp)
      lw      t0, 0(t1)
      sw      t0, 56(sp)
      # %_data.15 = getelementptr %struct.vector, ptr %_data.14, i32 0, i32 0
      li      t1, 0
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 56(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 60(sp)
      # %__tmp.109 = load ptr, ptr %_data.15
      lw      t1, 60(sp)
      lw      t0, 0(t1)
      sw      t0, 64(sp)
      # %__tmp.110 = load i32, ptr %_idx.0
      lw      t1, 12(sp)
      lw      t0, 0(t1)
      sw      t0, 68(sp)
      # %__tmp.111 = getelementptr i32, ptr %__tmp.109, i32 %__tmp.110
      lw      t0, 68(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 64(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 72(sp)
      # %__tmp.112 = load i32, ptr %__tmp.111
      lw      t1, 72(sp)
      lw      t0, 0(t1)
      sw      t0, 76(sp)
      # %__tmp.113 = load i32, ptr %_value.0
      lw      t1, 20(sp)
      lw      t0, 0(t1)
      sw      t0, 80(sp)
      # store i32 %__tmp.113, ptr %__tmp.111
      lw      t0, 80(sp)
      lw      t1, 72(sp)
      sw      t0, 0(t1)
      # ret i1 1
      li      t0, 1
      mv      a0, t0
      addi    sp, sp, 84
      ret     
      .section .text
      .globl vector.dot
vector.dot:
      addi    sp, sp, -128
      mv      t0, a0
      sw      t0, 0(sp)
      mv      t0, a1
      sw      t0, 4(sp)
vector.dot_entry:
      # %_rhs.0 = alloca ptr
      addi    t0, sp, 12
      sw      t0, 8(sp)
      # store ptr %_rhs, ptr %_rhs.0
      lw      t0, 4(sp)
      lw      t1, 8(sp)
      sw      t0, 0(t1)
      # %_this.6 = alloca ptr
      addi    t0, sp, 20
      sw      t0, 16(sp)
      # store ptr %_this.5, ptr %_this.6
      lw      t0, 0(sp)
      lw      t1, 16(sp)
      sw      t0, 0(t1)
      # %_i.1 = alloca i32
      addi    t0, sp, 28
      sw      t0, 24(sp)
      # store i32 0, ptr %_i.1
      li      t0, 0
      lw      t1, 24(sp)
      sw      t0, 0(t1)
      # %_result.0 = alloca i32
      addi    t0, sp, 36
      sw      t0, 32(sp)
      # store i32 0, ptr %_result.0
      li      t0, 0
      lw      t1, 32(sp)
      sw      t0, 0(t1)
      # br label %while.cond0
      j       vector.dot_while.cond0
vector.dot_while.cond0:
      # %__tmp.28 = load i32, ptr %_i.1
      lw      t1, 24(sp)
      lw      t0, 0(t1)
      sw      t0, 40(sp)
      # %_call.0 = load ptr, ptr %_this.6
      lw      t1, 16(sp)
      lw      t0, 0(t1)
      sw      t0, 44(sp)
      # %__tmp.29 = call i32 @vector.getDim(ptr %_call.0)
      lw      t0, 44(sp)
      mv      a0, t0
      sw      ra, 48(sp)
      call    vector.getDim
      mv      t0, a0
      sw      t0, 52(sp)
      lw      ra, 48(sp)
      # %__tmp.30 = icmp slt i32 %__tmp.28, %__tmp.29
      lw      t1, 40(sp)
      lw      t2, 52(sp)
      sub     t0, t1, t2
      sltz    t3, t0
      mv      t0, t3
      sw      t0, 56(sp)
      # br i1 %__tmp.30, label %while.body0, label %while.merge0
      lw      t0, 56(sp)
      beqz     t0, vector.dot_while.merge0
vector.dot_while.body0:
      # %__tmp.31 = load i32, ptr %_result.0
      lw      t1, 32(sp)
      lw      t0, 0(t1)
      sw      t0, 60(sp)
      # %_data.8 = load ptr, ptr %_this.6
      lw      t1, 16(sp)
      lw      t0, 0(t1)
      sw      t0, 64(sp)
      # %_data.9 = getelementptr %struct.vector, ptr %_data.8, i32 0, i32 0
      li      t1, 0
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 64(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 68(sp)
      # %__tmp.32 = load ptr, ptr %_data.9
      lw      t1, 68(sp)
      lw      t0, 0(t1)
      sw      t0, 72(sp)
      # %__tmp.33 = load i32, ptr %_i.1
      lw      t1, 24(sp)
      lw      t0, 0(t1)
      sw      t0, 76(sp)
      # %__tmp.34 = getelementptr i32, ptr %__tmp.32, i32 %__tmp.33
      lw      t0, 76(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 72(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 80(sp)
      # %__tmp.35 = load i32, ptr %__tmp.34
      lw      t1, 80(sp)
      lw      t0, 0(t1)
      sw      t0, 84(sp)
      # %__tmp.36 = load ptr, ptr %_rhs.0
      lw      t1, 8(sp)
      lw      t0, 0(t1)
      sw      t0, 88(sp)
      # %__tmp.37 = getelementptr %struct.vector, ptr %__tmp.36, i32 0, i32 0
      li      t1, 0
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 88(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 92(sp)
      # %__tmp.38 = load ptr, ptr %__tmp.37
      lw      t1, 92(sp)
      lw      t0, 0(t1)
      sw      t0, 96(sp)
      # %__tmp.39 = load i32, ptr %_i.1
      lw      t1, 24(sp)
      lw      t0, 0(t1)
      sw      t0, 100(sp)
      # %__tmp.40 = getelementptr i32, ptr %__tmp.38, i32 %__tmp.39
      lw      t0, 100(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 96(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 104(sp)
      # %__tmp.41 = load i32, ptr %__tmp.40
      lw      t1, 104(sp)
      lw      t0, 0(t1)
      sw      t0, 108(sp)
      # %__tmp.42 = mul i32 %__tmp.35, %__tmp.41
      lw      t1, 84(sp)
      lw      t2, 108(sp)
      mul     t0, t1, t2
      sw      t0, 112(sp)
      # store i32 %__tmp.42, ptr %_result.0
      lw      t0, 112(sp)
      lw      t1, 32(sp)
      sw      t0, 0(t1)
      # %__tmp.43 = load i32, ptr %_i.1
      lw      t1, 24(sp)
      lw      t0, 0(t1)
      sw      t0, 116(sp)
      # %__tmp.44 = add i32 %__tmp.43, 1
      li      t2, 1
      lw      t1, 116(sp)
      add     t0, t1, t2
      sw      t0, 120(sp)
      # store i32 %__tmp.44, ptr %_i.1
      lw      t0, 120(sp)
      lw      t1, 24(sp)
      sw      t0, 0(t1)
      # br label %while.cond0
      j       vector.dot_while.cond0
vector.dot_while.merge0:
      # %__tmp.45 = load i32, ptr %_result.0
      lw      t1, 32(sp)
      lw      t0, 0(t1)
      sw      t0, 124(sp)
      # ret i32 %__tmp.45
      lw      t0, 124(sp)
      mv      a0, t0
      addi    sp, sp, 128
      ret     
      .section .text
      .globl vector.getDim
vector.getDim:
      addi    sp, sp, -48
      mv      t0, a0
      sw      t0, 0(sp)
vector.getDim_entry:
      # %_this.4 = alloca ptr
      addi    t0, sp, 8
      sw      t0, 4(sp)
      # store ptr %_this.3, ptr %_this.4
      lw      t0, 0(sp)
      lw      t1, 4(sp)
      sw      t0, 0(t1)
      # %_data.4 = load ptr, ptr %_this.4
      lw      t1, 4(sp)
      lw      t0, 0(t1)
      sw      t0, 12(sp)
      # %_data.5 = getelementptr %struct.vector, ptr %_data.4, i32 0, i32 0
      li      t1, 0
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 12(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 16(sp)
      # %__tmp.23 = load ptr, ptr %_data.5
      lw      t1, 16(sp)
      lw      t0, 0(t1)
      sw      t0, 20(sp)
      # %__tmp.24 = icmp eq ptr %__tmp.23, null
      li      t2, 0
      lw      t1, 20(sp)
      sub     t0, t1, t2
      seqz    t3, t0
      mv      t0, t3
      sw      t0, 24(sp)
      # br i1 %__tmp.24, label %if.then1, label %if.merge1
      lw      t0, 24(sp)
      beqz     t0, vector.getDim_if.merge1
vector.getDim_if.then1:
      # ret i32 0
      li      t0, 0
      mv      a0, t0
      addi    sp, sp, 48
      ret     
      # br label %if.merge1
      j       vector.getDim_if.merge1
vector.getDim_if.merge1:
      # %_data.6 = load ptr, ptr %_this.4
      lw      t1, 4(sp)
      lw      t0, 0(t1)
      sw      t0, 28(sp)
      # %_data.7 = getelementptr %struct.vector, ptr %_data.6, i32 0, i32 0
      li      t1, 0
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 28(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 32(sp)
      # %__tmp.25 = load ptr, ptr %_data.7
      lw      t1, 32(sp)
      lw      t0, 0(t1)
      sw      t0, 36(sp)
      # %__tmp.26 = getelementptr i32, ptr %__tmp.25, i32 -1
      li      t1, -1
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 36(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 40(sp)
      # %__tmp.27 = load i32, ptr %__tmp.26
      lw      t1, 40(sp)
      lw      t0, 0(t1)
      sw      t0, 44(sp)
      # ret i32 %__tmp.27
      lw      t0, 44(sp)
      mv      a0, t0
      addi    sp, sp, 48
      ret     
      .section .text
      .globl main
main:
      addi    sp, sp, -300
main_entry:
      # %_x.0 = alloca ptr
      addi    t0, sp, 4
      sw      t0, 0(sp)
      # %__tmp.167 = call ptr @_malloc(i32 8)
      li      t0, 8
      mv      a0, t0
      sw      ra, 8(sp)
      call    _malloc
      mv      t0, a0
      sw      t0, 12(sp)
      lw      ra, 8(sp)
      # store ptr %__tmp.167, ptr %_x.0
      lw      t0, 12(sp)
      lw      t1, 0(sp)
      sw      t0, 0(t1)
      # %_a.0 = alloca ptr
      addi    t0, sp, 20
      sw      t0, 16(sp)
      # %__tmp.168 = call ptr @_malloc_array(i32 4, i32 10)
      li      t0, 4
      mv      a0, t0
      li      t0, 10
      mv      a1, t0
      sw      ra, 24(sp)
      call    _malloc_array
      mv      t0, a0
      sw      t0, 28(sp)
      lw      ra, 24(sp)
      # store ptr %__tmp.168, ptr %_a.0
      lw      t0, 28(sp)
      lw      t1, 16(sp)
      sw      t0, 0(t1)
      # %_i.6 = alloca i32
      addi    t0, sp, 36
      sw      t0, 32(sp)
      # %__tmp.169 = load i32, ptr %_i.6
      lw      t1, 32(sp)
      lw      t0, 0(t1)
      sw      t0, 40(sp)
      # store i32 0, ptr %_i.6
      li      t0, 0
      lw      t1, 32(sp)
      sw      t0, 0(t1)
      # br label %for.cond5
      j       main_for.cond5
main_for.cond5:
      # %__tmp.170 = load i32, ptr %_i.6
      lw      t1, 32(sp)
      lw      t0, 0(t1)
      sw      t0, 44(sp)
      # %__tmp.171 = icmp slt i32 %__tmp.170, 10
      li      t2, 10
      lw      t1, 44(sp)
      sub     t0, t1, t2
      sltz    t3, t0
      mv      t0, t3
      sw      t0, 48(sp)
      # br i1 %__tmp.171, label %for.body5, label %for.merge5
      lw      t0, 48(sp)
      beqz     t0, main_for.merge5
main_for.body5:
      # %__tmp.172 = load ptr, ptr %_a.0
      lw      t1, 16(sp)
      lw      t0, 0(t1)
      sw      t0, 52(sp)
      # %__tmp.173 = load i32, ptr %_i.6
      lw      t1, 32(sp)
      lw      t0, 0(t1)
      sw      t0, 56(sp)
      # %__tmp.174 = getelementptr i32, ptr %__tmp.172, i32 %__tmp.173
      lw      t0, 56(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 52(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 60(sp)
      # %__tmp.175 = load i32, ptr %__tmp.174
      lw      t1, 60(sp)
      lw      t0, 0(t1)
      sw      t0, 64(sp)
      # %__tmp.176 = load i32, ptr %_i.6
      lw      t1, 32(sp)
      lw      t0, 0(t1)
      sw      t0, 68(sp)
      # %__tmp.177 = sub i32 9, %__tmp.176
      li      t1, 9
      lw      t2, 68(sp)
      sub     t0, t1, t2
      sw      t0, 72(sp)
      # store i32 %__tmp.177, ptr %__tmp.174
      lw      t0, 72(sp)
      lw      t1, 60(sp)
      sw      t0, 0(t1)
      # br label %for.step5
      j       main_for.step5
main_for.step5:
      # %__tmp.178 = load i32, ptr %_i.6
      lw      t1, 32(sp)
      lw      t0, 0(t1)
      sw      t0, 76(sp)
      # %__tmp.179 = add i32 %__tmp.178, 1
      li      t2, 1
      lw      t1, 76(sp)
      add     t0, t1, t2
      sw      t0, 80(sp)
      # store i32 %__tmp.179, ptr %_i.6
      lw      t0, 80(sp)
      lw      t1, 32(sp)
      sw      t0, 0(t1)
      # br label %for.cond5
      j       main_for.cond5
main_for.merge5:
      # %__tmp.180 = load ptr, ptr %_x.0
      lw      t1, 0(sp)
      lw      t0, 0(t1)
      sw      t0, 84(sp)
      # %__tmp.181 = load ptr, ptr %_a.0
      lw      t1, 16(sp)
      lw      t0, 0(t1)
      sw      t0, 88(sp)
      # call void @vector.init(ptr %__tmp.180, ptr %__tmp.181)
      lw      t0, 84(sp)
      mv      a0, t0
      lw      t0, 88(sp)
      mv      a1, t0
      sw      ra, 92(sp)
      call    vector.init
      lw      ra, 92(sp)
      # call void @print(ptr @_string.3)
      la      t0, _string.3
      sw      t0, 96(sp)
      lw      t0, 96(sp)
      mv      a0, t0
      sw      ra, 100(sp)
      call    print
      lw      ra, 100(sp)
      # %__tmp.182 = load ptr, ptr %_x.0
      lw      t1, 0(sp)
      lw      t0, 0(t1)
      sw      t0, 104(sp)
      # %__tmp.183 = call ptr @vector.tostring(ptr %__tmp.182)
      lw      t0, 104(sp)
      mv      a0, t0
      sw      ra, 108(sp)
      call    vector.tostring
      mv      t0, a0
      sw      t0, 112(sp)
      lw      ra, 108(sp)
      # call void @println(ptr %__tmp.183)
      lw      t0, 112(sp)
      mv      a0, t0
      sw      ra, 116(sp)
      call    println
      lw      ra, 116(sp)
      # %_y.0 = alloca ptr
      addi    t0, sp, 124
      sw      t0, 120(sp)
      # %__tmp.184 = call ptr @_malloc(i32 8)
      li      t0, 8
      mv      a0, t0
      sw      ra, 128(sp)
      call    _malloc
      mv      t0, a0
      sw      t0, 132(sp)
      lw      ra, 128(sp)
      # store ptr %__tmp.184, ptr %_y.0
      lw      t0, 132(sp)
      lw      t1, 120(sp)
      sw      t0, 0(t1)
      # %__tmp.185 = load ptr, ptr %_y.0
      lw      t1, 120(sp)
      lw      t0, 0(t1)
      sw      t0, 136(sp)
      # %__tmp.187 = load ptr, ptr %_x.0
      lw      t1, 0(sp)
      lw      t0, 0(t1)
      sw      t0, 140(sp)
      # %__tmp.186 = call i1 @vector.copy(ptr %__tmp.185, ptr %__tmp.187)
      lw      t0, 136(sp)
      mv      a0, t0
      lw      t0, 140(sp)
      mv      a1, t0
      sw      ra, 144(sp)
      call    vector.copy
      mv      t0, a0
      sw      t0, 148(sp)
      lw      ra, 144(sp)
      # %__tmp.188 = load ptr, ptr %_y.0
      lw      t1, 120(sp)
      lw      t0, 0(t1)
      sw      t0, 152(sp)
      # %__tmp.189 = call i1 @vector.set(ptr %__tmp.188, i32 3, i32 817)
      lw      t0, 152(sp)
      mv      a0, t0
      li      t0, 3
      mv      a1, t0
      li      t0, 817
      mv      a2, t0
      sw      ra, 156(sp)
      call    vector.set
      mv      t0, a0
      sw      t0, 160(sp)
      lw      ra, 156(sp)
      # br i1 %__tmp.189, label %if.then9, label %if.merge9
      lw      t0, 160(sp)
      beqz     t0, main_if.merge9
main_if.then9:
      # call void @println(ptr @_string.4)
      la      t0, _string.4
      sw      t0, 164(sp)
      lw      t0, 164(sp)
      mv      a0, t0
      sw      ra, 168(sp)
      call    println
      lw      ra, 168(sp)
      # br label %if.merge9
      j       main_if.merge9
main_if.merge9:
      # call void @print(ptr @_string.5)
      la      t0, _string.5
      sw      t0, 172(sp)
      lw      t0, 172(sp)
      mv      a0, t0
      sw      ra, 176(sp)
      call    print
      lw      ra, 176(sp)
      # %__tmp.190 = load ptr, ptr %_y.0
      lw      t1, 120(sp)
      lw      t0, 0(t1)
      sw      t0, 180(sp)
      # %__tmp.191 = call ptr @vector.tostring(ptr %__tmp.190)
      lw      t0, 180(sp)
      mv      a0, t0
      sw      ra, 184(sp)
      call    vector.tostring
      mv      t0, a0
      sw      t0, 188(sp)
      lw      ra, 184(sp)
      # call void @println(ptr %__tmp.191)
      lw      t0, 188(sp)
      mv      a0, t0
      sw      ra, 192(sp)
      call    println
      lw      ra, 192(sp)
      # call void @print(ptr @_string.6)
      la      t0, _string.6
      sw      t0, 196(sp)
      lw      t0, 196(sp)
      mv      a0, t0
      sw      ra, 200(sp)
      call    print
      lw      ra, 200(sp)
      # %__tmp.192 = load ptr, ptr %_x.0
      lw      t1, 0(sp)
      lw      t0, 0(t1)
      sw      t0, 204(sp)
      # %__tmp.194 = load ptr, ptr %_y.0
      lw      t1, 120(sp)
      lw      t0, 0(t1)
      sw      t0, 208(sp)
      # %__tmp.193 = call ptr @vector.add(ptr %__tmp.192, ptr %__tmp.194)
      lw      t0, 204(sp)
      mv      a0, t0
      lw      t0, 208(sp)
      mv      a1, t0
      sw      ra, 212(sp)
      call    vector.add
      mv      t0, a0
      sw      t0, 216(sp)
      lw      ra, 212(sp)
      # %__tmp.195 = call ptr @vector.tostring(ptr %__tmp.193)
      lw      t0, 216(sp)
      mv      a0, t0
      sw      ra, 220(sp)
      call    vector.tostring
      mv      t0, a0
      sw      t0, 224(sp)
      lw      ra, 220(sp)
      # call void @println(ptr %__tmp.195)
      lw      t0, 224(sp)
      mv      a0, t0
      sw      ra, 228(sp)
      call    println
      lw      ra, 228(sp)
      # call void @print(ptr @_string.7)
      la      t0, _string.7
      sw      t0, 232(sp)
      lw      t0, 232(sp)
      mv      a0, t0
      sw      ra, 236(sp)
      call    print
      lw      ra, 236(sp)
      # %__tmp.197 = load ptr, ptr %_x.0
      lw      t1, 0(sp)
      lw      t0, 0(t1)
      sw      t0, 240(sp)
      # %__tmp.199 = load ptr, ptr %_y.0
      lw      t1, 120(sp)
      lw      t0, 0(t1)
      sw      t0, 244(sp)
      # %__tmp.198 = call i32 @vector.dot(ptr %__tmp.197, ptr %__tmp.199)
      lw      t0, 240(sp)
      mv      a0, t0
      lw      t0, 244(sp)
      mv      a1, t0
      sw      ra, 248(sp)
      call    vector.dot
      mv      t0, a0
      sw      t0, 252(sp)
      lw      ra, 248(sp)
      # %__tmp.196 = call ptr @toString(i32 %__tmp.198)
      lw      t0, 252(sp)
      mv      a0, t0
      sw      ra, 256(sp)
      call    toString
      mv      t0, a0
      sw      t0, 260(sp)
      lw      ra, 256(sp)
      # call void @println(ptr %__tmp.196)
      lw      t0, 260(sp)
      mv      a0, t0
      sw      ra, 264(sp)
      call    println
      lw      ra, 264(sp)
      # call void @print(ptr @_string.8)
      la      t0, _string.8
      sw      t0, 268(sp)
      lw      t0, 268(sp)
      mv      a0, t0
      sw      ra, 272(sp)
      call    print
      lw      ra, 272(sp)
      # %__tmp.200 = load ptr, ptr %_y.0
      lw      t1, 120(sp)
      lw      t0, 0(t1)
      sw      t0, 276(sp)
      # %__tmp.201 = call ptr @vector.scalarInPlaceMultiply(ptr %__tmp.200, i32 8)
      lw      t0, 276(sp)
      mv      a0, t0
      li      t0, 8
      mv      a1, t0
      sw      ra, 280(sp)
      call    vector.scalarInPlaceMultiply
      mv      t0, a0
      sw      t0, 284(sp)
      lw      ra, 280(sp)
      # %__tmp.202 = call ptr @vector.tostring(ptr %__tmp.201)
      lw      t0, 284(sp)
      mv      a0, t0
      sw      ra, 288(sp)
      call    vector.tostring
      mv      t0, a0
      sw      t0, 292(sp)
      lw      ra, 288(sp)
      # call void @println(ptr %__tmp.202)
      lw      t0, 292(sp)
      mv      a0, t0
      sw      ra, 296(sp)
      call    println
      lw      ra, 296(sp)
      # ret i32 0
      li      t0, 0
      mv      a0, t0
      addi    sp, sp, 300
      ret     
      .section .text
      .globl vector.copy
vector.copy:
      addi    sp, sp, -180
      mv      t0, a0
      sw      t0, 0(sp)
      mv      t0, a1
      sw      t0, 4(sp)
vector.copy_entry:
      # %_rhs.2 = alloca ptr
      addi    t0, sp, 12
      sw      t0, 8(sp)
      # store ptr %_rhs, ptr %_rhs.2
      lw      t0, 4(sp)
      lw      t1, 8(sp)
      sw      t0, 0(t1)
      # %_this.16 = alloca ptr
      addi    t0, sp, 20
      sw      t0, 16(sp)
      # store ptr %_this.15, ptr %_this.16
      lw      t0, 0(sp)
      lw      t1, 16(sp)
      sw      t0, 0(t1)
      # %__tmp.141 = load ptr, ptr %_rhs.2
      lw      t1, 8(sp)
      lw      t0, 0(t1)
      sw      t0, 24(sp)
      # %__tmp.142 = icmp eq ptr %__tmp.141, null
      li      t2, 0
      lw      t1, 24(sp)
      sub     t0, t1, t2
      seqz    t3, t0
      mv      t0, t3
      sw      t0, 28(sp)
      # br i1 %__tmp.142, label %if.then7, label %if.merge7
      lw      t0, 28(sp)
      beqz     t0, vector.copy_if.merge7
vector.copy_if.then7:
      # ret i1 0
      li      t0, 0
      mv      a0, t0
      addi    sp, sp, 180
      ret     
      # br label %if.merge7
      j       vector.copy_if.merge7
vector.copy_if.merge7:
      # %__tmp.143 = load ptr, ptr %_rhs.2
      lw      t1, 8(sp)
      lw      t0, 0(t1)
      sw      t0, 32(sp)
      # %__tmp.144 = call i32 @vector.getDim(ptr %__tmp.143)
      lw      t0, 32(sp)
      mv      a0, t0
      sw      ra, 36(sp)
      call    vector.getDim
      mv      t0, a0
      sw      t0, 40(sp)
      lw      ra, 36(sp)
      # %__tmp.145 = icmp eq i32 %__tmp.144, 0
      li      t2, 0
      lw      t1, 40(sp)
      sub     t0, t1, t2
      seqz    t3, t0
      mv      t0, t3
      sw      t0, 44(sp)
      # br i1 %__tmp.145, label %if.then8, label %if.else8
      lw      t0, 44(sp)
      beqz     t0, vector.copy_if.else8
vector.copy_if.then8:
      # %_data.20 = load ptr, ptr %_this.16
      lw      t1, 16(sp)
      lw      t0, 0(t1)
      sw      t0, 48(sp)
      # %_data.21 = getelementptr %struct.vector, ptr %_data.20, i32 0, i32 0
      li      t1, 0
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 48(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 52(sp)
      # %__tmp.146 = load ptr, ptr %_data.21
      lw      t1, 52(sp)
      lw      t0, 0(t1)
      sw      t0, 56(sp)
      # store ptr null, ptr %_data.21
      li      t0, 0
      lw      t1, 52(sp)
      sw      t0, 0(t1)
      # br label %if.merge8
      j       vector.copy_if.merge8
vector.copy_if.else8:
      # %_data.22 = load ptr, ptr %_this.16
      lw      t1, 16(sp)
      lw      t0, 0(t1)
      sw      t0, 60(sp)
      # %_data.23 = getelementptr %struct.vector, ptr %_data.22, i32 0, i32 0
      li      t1, 0
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 60(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 64(sp)
      # %__tmp.147 = load ptr, ptr %_data.23
      lw      t1, 64(sp)
      lw      t0, 0(t1)
      sw      t0, 68(sp)
      # %__tmp.148 = load ptr, ptr %_rhs.2
      lw      t1, 8(sp)
      lw      t0, 0(t1)
      sw      t0, 72(sp)
      # %__tmp.149 = call i32 @vector.getDim(ptr %__tmp.148)
      lw      t0, 72(sp)
      mv      a0, t0
      sw      ra, 76(sp)
      call    vector.getDim
      mv      t0, a0
      sw      t0, 80(sp)
      lw      ra, 76(sp)
      # %__tmp.150 = call ptr @_malloc_array(i32 4, i32 %__tmp.149)
      li      t0, 4
      mv      a0, t0
      lw      t0, 80(sp)
      mv      a1, t0
      sw      ra, 84(sp)
      call    _malloc_array
      mv      t0, a0
      sw      t0, 88(sp)
      lw      ra, 84(sp)
      # store ptr %__tmp.150, ptr %_data.23
      lw      t0, 88(sp)
      lw      t1, 64(sp)
      sw      t0, 0(t1)
      # %_i.5 = alloca i32
      addi    t0, sp, 96
      sw      t0, 92(sp)
      # %__tmp.151 = load i32, ptr %_i.5
      lw      t1, 92(sp)
      lw      t0, 0(t1)
      sw      t0, 100(sp)
      # store i32 0, ptr %_i.5
      li      t0, 0
      lw      t1, 92(sp)
      sw      t0, 0(t1)
      # br label %for.cond4
      j       vector.copy_for.cond4
vector.copy_for.cond4:
      # %__tmp.152 = load i32, ptr %_i.5
      lw      t1, 92(sp)
      lw      t0, 0(t1)
      sw      t0, 104(sp)
      # %_call.9 = load ptr, ptr %_this.16
      lw      t1, 16(sp)
      lw      t0, 0(t1)
      sw      t0, 108(sp)
      # %__tmp.153 = call i32 @vector.getDim(ptr %_call.9)
      lw      t0, 108(sp)
      mv      a0, t0
      sw      ra, 112(sp)
      call    vector.getDim
      mv      t0, a0
      sw      t0, 116(sp)
      lw      ra, 112(sp)
      # %__tmp.154 = icmp slt i32 %__tmp.152, %__tmp.153
      lw      t1, 104(sp)
      lw      t2, 116(sp)
      sub     t0, t1, t2
      sltz    t3, t0
      mv      t0, t3
      sw      t0, 120(sp)
      # br i1 %__tmp.154, label %for.body4, label %for.merge4
      lw      t0, 120(sp)
      beqz     t0, vector.copy_for.merge4
vector.copy_for.body4:
      # %_data.24 = load ptr, ptr %_this.16
      lw      t1, 16(sp)
      lw      t0, 0(t1)
      sw      t0, 124(sp)
      # %_data.25 = getelementptr %struct.vector, ptr %_data.24, i32 0, i32 0
      li      t1, 0
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 124(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 128(sp)
      # %__tmp.155 = load ptr, ptr %_data.25
      lw      t1, 128(sp)
      lw      t0, 0(t1)
      sw      t0, 132(sp)
      # %__tmp.156 = load i32, ptr %_i.5
      lw      t1, 92(sp)
      lw      t0, 0(t1)
      sw      t0, 136(sp)
      # %__tmp.157 = getelementptr i32, ptr %__tmp.155, i32 %__tmp.156
      lw      t0, 136(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 132(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 140(sp)
      # %__tmp.158 = load i32, ptr %__tmp.157
      lw      t1, 140(sp)
      lw      t0, 0(t1)
      sw      t0, 144(sp)
      # %__tmp.159 = load ptr, ptr %_rhs.2
      lw      t1, 8(sp)
      lw      t0, 0(t1)
      sw      t0, 148(sp)
      # %__tmp.160 = getelementptr %struct.vector, ptr %__tmp.159, i32 0, i32 0
      li      t1, 0
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 148(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 152(sp)
      # %__tmp.161 = load ptr, ptr %__tmp.160
      lw      t1, 152(sp)
      lw      t0, 0(t1)
      sw      t0, 156(sp)
      # %__tmp.162 = load i32, ptr %_i.5
      lw      t1, 92(sp)
      lw      t0, 0(t1)
      sw      t0, 160(sp)
      # %__tmp.163 = getelementptr i32, ptr %__tmp.161, i32 %__tmp.162
      lw      t0, 160(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 156(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 164(sp)
      # %__tmp.164 = load i32, ptr %__tmp.163
      lw      t1, 164(sp)
      lw      t0, 0(t1)
      sw      t0, 168(sp)
      # store i32 %__tmp.164, ptr %__tmp.157
      lw      t0, 168(sp)
      lw      t1, 140(sp)
      sw      t0, 0(t1)
      # br label %for.step4
      j       vector.copy_for.step4
vector.copy_for.step4:
      # %__tmp.165 = load i32, ptr %_i.5
      lw      t1, 92(sp)
      lw      t0, 0(t1)
      sw      t0, 172(sp)
      # %__tmp.166 = add i32 %__tmp.165, 1
      li      t2, 1
      lw      t1, 172(sp)
      add     t0, t1, t2
      sw      t0, 176(sp)
      # store i32 %__tmp.166, ptr %_i.5
      lw      t0, 176(sp)
      lw      t1, 92(sp)
      sw      t0, 0(t1)
      # br label %for.cond4
      j       vector.copy_for.cond4
vector.copy_for.merge4:
      # br label %if.merge8
      j       vector.copy_if.merge8
vector.copy_if.merge8:
      # ret i1 1
      li      t0, 1
      mv      a0, t0
      addi    sp, sp, 180
      ret     
      .section .text
      .globl vector.tostring
vector.tostring:
      addi    sp, sp, -232
      mv      t0, a0
      sw      t0, 0(sp)
vector.tostring_entry:
      # %_this.14 = alloca ptr
      addi    t0, sp, 8
      sw      t0, 4(sp)
      # store ptr %_this.13, ptr %_this.14
      lw      t0, 0(sp)
      lw      t1, 4(sp)
      sw      t0, 0(t1)
      # %_temp.1 = alloca ptr
      addi    t0, sp, 16
      sw      t0, 12(sp)
      # store ptr @_string.0, ptr %_temp.1
      la      t0, _string.0
      sw      t0, 20(sp)
      lw      t0, 20(sp)
      lw      t1, 12(sp)
      sw      t0, 0(t1)
      # %_call.7 = load ptr, ptr %_this.14
      lw      t1, 4(sp)
      lw      t0, 0(t1)
      sw      t0, 24(sp)
      # %__tmp.114 = call i32 @vector.getDim(ptr %_call.7)
      lw      t0, 24(sp)
      mv      a0, t0
      sw      ra, 28(sp)
      call    vector.getDim
      mv      t0, a0
      sw      t0, 32(sp)
      lw      ra, 28(sp)
      # %__tmp.115 = icmp sgt i32 %__tmp.114, 0
      li      t2, 0
      lw      t1, 32(sp)
      sub     t0, t1, t2
      sgtz    t3, t0
      mv      t0, t3
      sw      t0, 36(sp)
      # br i1 %__tmp.115, label %if.then6, label %if.merge6
      lw      t0, 36(sp)
      beqz     t0, vector.tostring_if.merge6
vector.tostring_if.then6:
      # %__tmp.116 = load ptr, ptr %_temp.1
      lw      t1, 12(sp)
      lw      t0, 0(t1)
      sw      t0, 40(sp)
      # %__tmp.117 = load ptr, ptr %_temp.1
      lw      t1, 12(sp)
      lw      t0, 0(t1)
      sw      t0, 44(sp)
      # %_data.16 = load ptr, ptr %_this.14
      lw      t1, 4(sp)
      lw      t0, 0(t1)
      sw      t0, 48(sp)
      # %_data.17 = getelementptr %struct.vector, ptr %_data.16, i32 0, i32 0
      li      t1, 0
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 48(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 52(sp)
      # %__tmp.119 = load ptr, ptr %_data.17
      lw      t1, 52(sp)
      lw      t0, 0(t1)
      sw      t0, 56(sp)
      # %__tmp.120 = getelementptr i32, ptr %__tmp.119, i32 0
      li      t1, 0
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 56(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 60(sp)
      # %__tmp.121 = load i32, ptr %__tmp.120
      lw      t1, 60(sp)
      lw      t0, 0(t1)
      sw      t0, 64(sp)
      # %__tmp.118 = call ptr @toString(i32 %__tmp.121)
      lw      t0, 64(sp)
      mv      a0, t0
      sw      ra, 68(sp)
      call    toString
      mv      t0, a0
      sw      t0, 72(sp)
      lw      ra, 68(sp)
      # %_string.0 = call ptr @_string.concat(ptr %__tmp.117, ptr %__tmp.118)
      lw      t0, 44(sp)
      mv      a0, t0
      lw      t0, 72(sp)
      mv      a1, t0
      sw      ra, 76(sp)
      call    _string.concat
      mv      t0, a0
      sw      t0, 80(sp)
      lw      ra, 76(sp)
      # %__tmp.122 = call ptr @_string.copy(ptr %_string.0)
      lw      t0, 80(sp)
      mv      a0, t0
      sw      ra, 84(sp)
      call    _string.copy
      mv      t0, a0
      sw      t0, 88(sp)
      lw      ra, 84(sp)
      # store ptr %__tmp.122, ptr %_temp.1
      lw      t0, 88(sp)
      lw      t1, 12(sp)
      sw      t0, 0(t1)
      # br label %if.merge6
      j       vector.tostring_if.merge6
vector.tostring_if.merge6:
      # %_i.4 = alloca i32
      addi    t0, sp, 96
      sw      t0, 92(sp)
      # %__tmp.123 = load i32, ptr %_i.4
      lw      t1, 92(sp)
      lw      t0, 0(t1)
      sw      t0, 100(sp)
      # store i32 1, ptr %_i.4
      li      t0, 1
      lw      t1, 92(sp)
      sw      t0, 0(t1)
      # br label %for.cond3
      j       vector.tostring_for.cond3
vector.tostring_for.cond3:
      # %__tmp.124 = load i32, ptr %_i.4
      lw      t1, 92(sp)
      lw      t0, 0(t1)
      sw      t0, 104(sp)
      # %_call.8 = load ptr, ptr %_this.14
      lw      t1, 4(sp)
      lw      t0, 0(t1)
      sw      t0, 108(sp)
      # %__tmp.125 = call i32 @vector.getDim(ptr %_call.8)
      lw      t0, 108(sp)
      mv      a0, t0
      sw      ra, 112(sp)
      call    vector.getDim
      mv      t0, a0
      sw      t0, 116(sp)
      lw      ra, 112(sp)
      # %__tmp.126 = icmp slt i32 %__tmp.124, %__tmp.125
      lw      t1, 104(sp)
      lw      t2, 116(sp)
      sub     t0, t1, t2
      sltz    t3, t0
      mv      t0, t3
      sw      t0, 120(sp)
      # br i1 %__tmp.126, label %for.body3, label %for.merge3
      lw      t0, 120(sp)
      beqz     t0, vector.tostring_for.merge3
vector.tostring_for.body3:
      # %__tmp.127 = load ptr, ptr %_temp.1
      lw      t1, 12(sp)
      lw      t0, 0(t1)
      sw      t0, 124(sp)
      # %__tmp.128 = load ptr, ptr %_temp.1
      lw      t1, 12(sp)
      lw      t0, 0(t1)
      sw      t0, 128(sp)
      # %_string.1 = call ptr @_string.concat(ptr %__tmp.128, ptr @_string.1)
      lw      t0, 128(sp)
      mv      a0, t0
      la      t0, _string.1
      sw      t0, 132(sp)
      lw      t0, 132(sp)
      mv      a1, t0
      sw      ra, 136(sp)
      call    _string.concat
      mv      t0, a0
      sw      t0, 140(sp)
      lw      ra, 136(sp)
      # %_data.18 = load ptr, ptr %_this.14
      lw      t1, 4(sp)
      lw      t0, 0(t1)
      sw      t0, 144(sp)
      # %_data.19 = getelementptr %struct.vector, ptr %_data.18, i32 0, i32 0
      li      t1, 0
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 144(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 148(sp)
      # %__tmp.130 = load ptr, ptr %_data.19
      lw      t1, 148(sp)
      lw      t0, 0(t1)
      sw      t0, 152(sp)
      # %__tmp.131 = load i32, ptr %_i.4
      lw      t1, 92(sp)
      lw      t0, 0(t1)
      sw      t0, 156(sp)
      # %__tmp.132 = getelementptr i32, ptr %__tmp.130, i32 %__tmp.131
      lw      t0, 156(sp)
      li      t1, 4
      mul     t2, t0, t1
      lw      t0, 152(sp)
      add     t3, t0, t2
      mv      t0, t3
      sw      t0, 160(sp)
      # %__tmp.133 = load i32, ptr %__tmp.132
      lw      t1, 160(sp)
      lw      t0, 0(t1)
      sw      t0, 164(sp)
      # %__tmp.129 = call ptr @toString(i32 %__tmp.133)
      lw      t0, 164(sp)
      mv      a0, t0
      sw      ra, 168(sp)
      call    toString
      mv      t0, a0
      sw      t0, 172(sp)
      lw      ra, 168(sp)
      # %_string.2 = call ptr @_string.concat(ptr %_string.1, ptr %__tmp.129)
      lw      t0, 140(sp)
      mv      a0, t0
      lw      t0, 172(sp)
      mv      a1, t0
      sw      ra, 176(sp)
      call    _string.concat
      mv      t0, a0
      sw      t0, 180(sp)
      lw      ra, 176(sp)
      # %__tmp.134 = call ptr @_string.copy(ptr %_string.2)
      lw      t0, 180(sp)
      mv      a0, t0
      sw      ra, 184(sp)
      call    _string.copy
      mv      t0, a0
      sw      t0, 188(sp)
      lw      ra, 184(sp)
      # store ptr %__tmp.134, ptr %_temp.1
      lw      t0, 188(sp)
      lw      t1, 12(sp)
      sw      t0, 0(t1)
      # br label %for.step3
      j       vector.tostring_for.step3
vector.tostring_for.step3:
      # %__tmp.135 = load i32, ptr %_i.4
      lw      t1, 92(sp)
      lw      t0, 0(t1)
      sw      t0, 192(sp)
      # %__tmp.136 = add i32 %__tmp.135, 1
      li      t2, 1
      lw      t1, 192(sp)
      add     t0, t1, t2
      sw      t0, 196(sp)
      # store i32 %__tmp.136, ptr %_i.4
      lw      t0, 196(sp)
      lw      t1, 92(sp)
      sw      t0, 0(t1)
      # br label %for.cond3
      j       vector.tostring_for.cond3
vector.tostring_for.merge3:
      # %__tmp.137 = load ptr, ptr %_temp.1
      lw      t1, 12(sp)
      lw      t0, 0(t1)
      sw      t0, 200(sp)
      # %__tmp.138 = load ptr, ptr %_temp.1
      lw      t1, 12(sp)
      lw      t0, 0(t1)
      sw      t0, 204(sp)
      # %_string.3 = call ptr @_string.concat(ptr %__tmp.138, ptr @_string.2)
      lw      t0, 204(sp)
      mv      a0, t0
      la      t0, _string.2
      sw      t0, 208(sp)
      lw      t0, 208(sp)
      mv      a1, t0
      sw      ra, 212(sp)
      call    _string.concat
      mv      t0, a0
      sw      t0, 216(sp)
      lw      ra, 212(sp)
      # %__tmp.139 = call ptr @_string.copy(ptr %_string.3)
      lw      t0, 216(sp)
      mv      a0, t0
      sw      ra, 220(sp)
      call    _string.copy
      mv      t0, a0
      sw      t0, 224(sp)
      lw      ra, 220(sp)
      # store ptr %__tmp.139, ptr %_temp.1
      lw      t0, 224(sp)
      lw      t1, 12(sp)
      sw      t0, 0(t1)
      # %__tmp.140 = load ptr, ptr %_temp.1
      lw      t1, 12(sp)
      lw      t0, 0(t1)
      sw      t0, 228(sp)
      # ret ptr %__tmp.140
      lw      t0, 228(sp)
      mv      a0, t0
      addi    sp, sp, 232
      ret     
