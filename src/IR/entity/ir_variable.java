package IR.entity;

import IR.type.*;

public class ir_variable extends ir_entity {
    public ir_variable(String name, ir_type type) {
        if(!name.equals("null")){
            this.name = name;
        }
        else{
            this.name = null;
        }
        this.type = type;
    }

    @Override
    public String toString() {
        if (name == null) return "null";
        return "%_" + name;
    }

    public boolean equals(Object obj) {
        if (obj instanceof ir_variable) {
            return ((ir_variable) obj).name.equals(name);
        }
        return false;
    }

    public int hashCode() {
        return name.hashCode();
    }

    @Override
    public ir_type return_type() {
        return type;
    }

    public String name;
}
