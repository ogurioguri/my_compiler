package asm.section;

import java.util.ArrayList;
import asm.ingredient.*;
import asm.instruction.*;

public class asm_block extends asm_section{
    public ArrayList<asm_instruction> instructions = null;
    public asm_function parent = null;

    public asm_block(String label,asm_function parent){
        super(label);
        this.parent = parent;
        instructions = new ArrayList<asm_instruction>();
    }

    public String toString(){
        StringBuilder sb = new StringBuilder();
        sb.append(label).append(":\n");
        for (asm_instruction inst : instructions) {
            sb.append("      ").append(inst.toString()).append("\n");
        }
        return sb.toString();
    }

    public void add_instruction(asm_instruction inst){
        instructions.add(inst);
    }

}
