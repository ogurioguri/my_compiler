package asm.instruction;

import asm.section.asm_block;
import java.util.ArrayList;
import asm.ingredient.*;

public abstract class asm_instruction {
  public asm_block parent;
  public int index = 0;
  public int add_stack = 0;
  public boolean need_imm = false; // it means that the instruction needs an stack_size to refresh the stack pointer
  public boolean need_final_imm = false; // it means that the instruction needs a final stack_size to refresh the stack pointer
  public int save_address_index = -1;

  public asm_instruction(asm_block parent) {
    this.parent = parent;
  }
  public abstract String toString();
  public void setUse1(register reg){throw new RuntimeException("inst has no use1");}
  public void setUse2(register reg){throw new RuntimeException("inst has no use2");}
  public void setDef(register reg){throw new RuntimeException("inst has no def");}
  public register use1(){return null;}
  public register use2(){return null;}
  public register def(){return null;}
}
