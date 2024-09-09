package asm.instruction;
import asm.ingredient.*;
import asm.section.*;

public class asm_la_instruction extends asm_instruction{
    public register rd;
    public String label;

    public asm_la_instruction(asm_block parent, register rd, String label) {
        super(parent);
        this.rd = rd;
        this.label = label;
    }

    public String toString() {
        return String.format("%-8s", "la") + rd + ", " + label;
    }

    public register def() {
        return rd;
    }

    public void setDef(register reg) {
        rd = reg;
    }
}
