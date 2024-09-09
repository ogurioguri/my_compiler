package asm.instruction;

import asm.section.asm_block;
import asm.ingredient.*;
import java.util.HashSet;

public class asm_call_instruction extends asm_instruction {
    public String label;
    public HashSet<register> register_set = null;
    public asm_call_instruction(asm_block parent, String label) {
        super(parent);
        this.label = label;
    }

    public String toString() {
        return String.format("%-8s", "call") + label;
    }

}
