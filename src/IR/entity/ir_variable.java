package IR.entity;

import IR.type.*;

public class ir_variable extends ir_entity {
    public ir_variable(String name, ir_type type) {
        this.name = name;
        this.type = type;
    }

    @Override
    public String toString() {
        return "%_" + name;
    }

    @Override
    public ir_type return_type() {
        return type;
    }

    public String name;
}
