package IR.instruction;

import IR.IR_visitor;
import IR.basic_block;
import IR.entity.*;

public class ir_load_instruction extends ir_instruction{
    public ir_entity result;
    public ir_entity pointer;

    public ir_load_instruction(basic_block parent_block, ir_entity result, ir_entity pointer) {
        super(parent_block);
        this.result = result;
        this.pointer = pointer;
    }

    @Override
    public String toString() {
        return result.toString() + " = load " + result.type.toString() + ", ptr " + pointer.toString();
    }

    @Override
    public void accept(IR_visitor visitor) {
        visitor.visit(this);
    }
}
