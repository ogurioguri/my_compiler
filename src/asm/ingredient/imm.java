package asm.ingredient;

public class imm {
    int value = 0;
    String global_name = null;

    public imm(int value) {
        this.value = value;
    }

    public imm(String global) {
        this.global_name = global;
    }

    public String toString() {
        if (global_name != null)
            return global_name;
        return Integer.toString(value);
    }

}
