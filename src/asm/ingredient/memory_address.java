package asm.ingredient;

public class memory_address {
    public register base;
    public imm offset;

    public memory_address(register base, imm offset) {
        this.base = base;
        this.offset = offset;
    }

    public String toString() {
        return offset.toString() + "(" + base.toString() + ")";
    }
}
