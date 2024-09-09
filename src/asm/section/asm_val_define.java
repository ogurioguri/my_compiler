package asm.section;

public class asm_val_define extends asm_section {
    int value = 0;

    public asm_val_define(String label, int value) {
        super(label);
        this.value = value;
    }

    @Override
    public String toString() {
        return "      .section data\n" +
                "      .globl " + label + "\n" +
                label + ":\n" +
                "      .word  " + value + "\n";
    }
}
