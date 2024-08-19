package IR.entity;

import IR.type.*;

public class ir_pointer extends ir_entity {
    public String name;
    public ir_pointer(String name){
        this.name = name;
        type = new ir_type("pointer");
    }
    @Override
    public String toString() {
        return "@" +  name;
    }
    @Override
    public ir_type return_type() {
        return new ir_type("pointer");
    }
}
