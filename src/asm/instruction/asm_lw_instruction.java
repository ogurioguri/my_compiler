package asm.instruction;
import asm.section.asm_block;
import asm.instruction.asm_instruction;
import java.util.ArrayList;
import asm.ingredient.*;

public class asm_lw_instruction extends asm_instruction{
    public register rd;
    public memory_address offset;

    public asm_lw_instruction(asm_block parent, register rd, memory_address offset){
        super(parent);
        this.rd = rd;
        this.offset = offset;
    }

    public String toString(){
        return String.format("%-8s", "lw") + rd + ", " + offset;
    }

    public register def(){
        return rd;
    }

    public void setDef(register reg){
        rd = reg;
    }
}
