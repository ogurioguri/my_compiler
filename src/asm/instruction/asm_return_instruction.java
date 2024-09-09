package asm.instruction;

import java.util.ArrayList;
import asm.section.asm_block;
import  asm.instruction.asm_instruction;
import asm.ingredient.*;

public class asm_return_instruction extends asm_instruction{
    public asm_return_instruction(asm_block parent){
        super(parent);
    }
    @Override
    public String toString() {
        return String.format("%-8s", "ret");
    }
}
