package IR.entity;

import IR.IR_visitor;
import IR.type.*;

abstract public class ir_entity {
    public ir_type type;
    public abstract String toString();
    public abstract ir_type return_type();
}
