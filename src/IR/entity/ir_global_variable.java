package IR.entity;

import IR.type.*;

public class ir_global_variable extends ir_entity {
    public String name;
    public ir_global_variable(String name){
        this.name = name;
        type = new ir_type("ptr");
    }
    public ir_global_variable(String name, ir_type type){
        this.name = name;
        this.type = type;
    }
    @Override
    public String toString() {
        return "@" +  name;
    }
    @Override
    public ir_type return_type() {
        return new ir_type("ptr");
    }
}
