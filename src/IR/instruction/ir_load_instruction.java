package IR.instruction;

import IR.IR_visitor;
import IR.basic_block;
import IR.entity.ir_variable;

public class ir_load_instruction extends ir_instruction{
    public ir_variable result;
    public ir_variable pointer;

    public ir_load_instruction(basic_block parent_block, ir_variable result, ir_variable pointer) {
        super(parent_block);
        this.result = result;
        this.pointer = pointer;
    }

    @Override
    public String toString() {
        return result.toString() + " = load " + pointer.type.toString() + ", " + pointer.toString();
    }

    @Override
    public void accept(IR_visitor visitor) {
        visitor.visit(this);
    }
}
