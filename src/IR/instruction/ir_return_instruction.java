package IR.instruction;

import IR.IR_visitor;
import IR.basic_block;
import IR.entity.ir_entity;

public class ir_return_instruction extends ir_instruction {
    public ir_entity value;
    public ir_return_instruction(basic_block parent_block, ir_entity value_) {
        super(parent_block);
        this.value = value_;
    }

    @Override
    public String toString() {
        if(value == null) return "ret void";
        return "ret " + value.return_type().toString() + " " + value.toString();
    }

    @Override
    public void accept(IR_visitor visitor) {
        visitor.visit(this);
    }
}
