package IR.type;

public class ir_struct extends ir_type{
    public String name;

    public ir_struct(String name) {
        this.is_int = false;
        this.is_void = false;
        this.is_pointer = true;
        this.bit_width = 0;
        this.name = name;
    }

    @Override
    public String toString() {
        return "%struct." + name;
    }
}
