package asm.instruction;

import asm.section.asm_block;
import java.util.ArrayList;
import asm.ingredient.*;

public abstract class asm_instruction {
  public asm_block parent;
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
