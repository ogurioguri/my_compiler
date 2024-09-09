package asm.instruction;


import java.util.ArrayList;
import asm.section.asm_block;
import asm.ingredient.*;

public class asm_jump_instruction extends asm_instruction {
    String label;
    public asm_jump_instruction(asm_block parent, String label) {
        super(parent);
        this.label = label;
    }
    public String toString() {
        return String.format("%-8s", "j") + label;
    }
}
