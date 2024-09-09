package asm.instruction;

import java.util.ArrayList;
import asm.section.asm_block;
import asm.instruction.asm_instruction;
import asm.ingredient.*;

public class asm_sw_instruction extends asm_instruction{
    public register rd;
    public memory_address address;

    public asm_sw_instruction(asm_block parent, register rd, memory_address address){
        super(parent);
        this.rd = rd;
        this.address = address;
    }

    public String toString(){
        return String.format("%-8s", "sw") + rd + ", " + address.toString();
    }

    public ArrayList<register> use(){
        ArrayList<register> use = new ArrayList<>();
        use.add(rd);
        return use;
    }

    public register use1(){
        return rd;
    }

    public void setUse1(register reg){
        rd = reg;
    }

    public register use2(){
        return address.base;
    }

    public void setUse2(register reg){
        address.base = reg;
    }

}
