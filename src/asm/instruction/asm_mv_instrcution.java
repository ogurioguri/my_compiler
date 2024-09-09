package asm.instruction;
import asm.section.asm_block;
import asm.instruction.asm_instruction;
import asm.ingredient.*;


public class asm_mv_instrcution extends asm_instruction{
    public register rd;
    public register rs1;

    public asm_mv_instrcution(asm_block parent, register rd, register rs1){
        super(parent);
        this.rd = rd;
        this.rs1 = rs1;
    }

    public String toString(){
        return String.format("%-8s", "mv") + rd + ", " + rs1;
    }

    public register def(){
        return rd;
    }

    public void setDef(register reg){
        rd = reg;
    }

    public register use1(){
        return rs1;
    }

    public void setUse1(register reg){
        rs1 = reg;
    }
}
