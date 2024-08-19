package IR.entity;

import IR.type.*;

public class ir_literal extends ir_entity {
    public String value;


    public ir_literal(String value, ir_type type) {
        this.value = value;
        this.type = type;
    }
    @Override
    public String toString() {
        return value;
    }
    @Override
    public ir_type return_type() {
        return type;
    }
}
