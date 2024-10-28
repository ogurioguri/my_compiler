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

    public int hashCode() {
        return id;
    }

    public boolean equals(Object obj) {
        if (obj instanceof virtual_register) {
            return ((virtual_register) obj).id == id;
        }
        return false;
    }

}
