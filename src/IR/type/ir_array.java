package IR.type;

public class ir_array extends ir_type{
    public ir_type type;
    public int size;

    public ir_array(ir_type type, int size) {
        if(size >0){
            this.is_int = false;
            this.is_void = false;
            this.is_pointer = true;
            this.bit_width = 0;
            this.type = new ir_array(type, size-1);
        }
        else{
            this.is_int = false;
            this.is_void = false;
            this.is_pointer = true;
            this.bit_width = 0;
            this.type = type;
        }
    }


    @Override
    public String toString() {
        return "[" + size + " x " + type.toString() + "]";
    }
}
