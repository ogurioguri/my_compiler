package asm.section;

public abstract class asm_section {
    public String label = null;
    public asm_section(String label) {
        this.label = label;
    }

    public abstract String toString();
}
