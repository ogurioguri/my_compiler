package asm.section;

public class asm_string_literal extends asm_section {
    public String value = null;

    public asm_string_literal(String label, String value) {
        super(label);
        this.value = value;
    }
    public String printStr() {
        StringBuilder ret = new StringBuilder();
        for (int i = 0; i < value.length(); ++i) {
            char c = value.charAt(i);
            switch (c) {
                case '\n' -> ret.append("\\n");
                case '\"' -> ret.append("\\\"");
                case '\\' -> ret.append("\\\\");
                default -> ret.append(c);
            }
        }
        return ret.toString();
    }

    public String toString() {
//        return "      .section .rodata\n" + "      .globl " + label + "\n" + label + ":\n" + "      .asciz  \"" + value + "\"\n";
        return "      .section .rodata\n" +
                "      .globl " + label + "\n" +
                label + ":\n" +
                "      .asciz  \"" + printStr() + "\"\n";
    }
}
