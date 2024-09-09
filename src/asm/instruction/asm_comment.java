package asm.instruction;

import asm.instruction.*;
import asm.section.*;
import asm.instruction.*;

public class asm_comment extends asm_instruction{
    public String comment;
    public asm_comment(asm_block parent,String comment){
        super(parent);
        this.comment = comment;
    }
    @Override
    public String toString(){
        return "# " + comment;
    }

}
