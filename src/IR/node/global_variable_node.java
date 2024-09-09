package IR.node;
import IR.IR_visitor;
import IR.entity.*;

public class global_variable_node extends basic_node {
    public ir_global_variable variable;
    public ir_literal value;

    public global_variable_node(ir_global_variable variable, ir_literal value) {
        this.variable = variable;
        this.value = value;
    }

    @Override
    public String toString() {
        if(value == null) return variable.toString() + " = global " + variable.type.toString() + " null\n";
        return variable.toString() + " = global " + value.type.toString() + " " + value.toString() + "\n";
    }

    @Override
    public void accept(IR_visitor visitor) {
        visitor.visit(this);
    }
}
