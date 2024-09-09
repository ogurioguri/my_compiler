package asm.ingredient;

public class virtual_register extends register{
    public static int count = 0;
    int id = 0;

    public virtual_register() {
        id = count++;
    }
    public static void reset() {
        count = 0;
    }

    @Override
    public String toString() {
        return "vr" + id;
    }

}
