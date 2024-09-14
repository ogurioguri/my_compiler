package asm.instruction;

import java.util.ArrayList;
import asm.section.asm_block;
import asm.instruction.asm_instruction;
import asm.ingredient.*;

public class asm_set_instruction extends asm_instruction{
    public register rd;
    public register rs1;
    String op = null;

    public asm_set_instruction(asm_block parent, register rd, register rs1, String op){
        super(parent);
        this.rd = rd;
        this.rs1 = rs1;
        this.op = op;
    }

    @Override
    public String toString() {
        String return_string = "";
        if(op.equals("==")){
            return_string = String.format("%-8s", "seqz") + rd + ", " + rs1;
        }
        else if(op.equals("!=")){
            return_string = String.format("%-8s", "snez") + rd + ", " + rs1;
        }
        else if(op.equals("<")){
            return_string = String.format("%-8s", "sltz") + rd + ", " + rs1;
        }
        else if(op.equals(">")){
            return_string = String.format("%-8s", "sgtz") + rd + ", " + rs1;
        }
        return return_string;
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
