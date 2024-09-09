package asm.section;

public class asm_string_literal extends asm_section {
    public String value = null;

    public asm_string_literal(String label, String value) {
        super(label);
        this.value = value;
    }

    public String toString() {
        return "      .section rodata\n" + "      .globl " + label + "\n" + label + ":\n" + "      .asciz  \"" + value + "\"\n";
    }
}
