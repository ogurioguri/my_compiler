package asm.section;

import asm.section.asm_section;
import asm.instruction.*;

import java.util.ArrayList;
import java.util.HashMap;
import asm.ingredient.*;


public class asm_function extends asm_section{
    public ArrayList<asm_block> body = null;
    public int stack_size = 0;
    public int count = 0;
    public asm_arithimm_instruction move_sp_inst = null;
    public HashMap<virtual_register,Integer> virtual_stack = new HashMap<>(); // virtual register to stack offset


    public asm_function(String label){
        super(label);
        body = new ArrayList<asm_block>();
    }

    @Override
    public String toString(){
        StringBuilder sb = new StringBuilder();
        sb.append("      .section .text\n").append("      .globl ").append(label).append("\n");
        for (asm_block block : body) {
            sb.append(block);
        }
        return sb.toString();
    }

    public asm_block add_block(String label){
        body.add(new asm_block(label,this));
        return body.get(body.size()-1);
    }
}
