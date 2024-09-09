package asm.instruction;
import java.util.ArrayList;
import asm.section.asm_block;
import asm.instruction.asm_instruction;
import asm.ingredient.*;


public class asm_lui_instruction extends asm_instruction{
    public register rd;
    public imm immediate;

    public asm_lui_instruction(asm_block parent, register rd, imm immediate){
        super(parent);
        this.rd = rd;
        this.immediate = immediate;
    }

    public String toString(){
        return String.format("%-8s", "lui") + rd + ", " + immediate;
    }

    public register def(){
        return rd;
    }

    public void setDef(register reg){
        rd = reg;
    }

}
