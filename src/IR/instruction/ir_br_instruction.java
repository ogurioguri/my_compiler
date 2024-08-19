package IR.instruction;

import IR.IR_visitor;
import IR.basic_block;
import IR.type.*;
import IR.entity.*;

public class ir_br_instruction extends ir_instruction {
    public ir_entity condition;
    public basic_block then_block = null;
    public basic_block else_block = null;

    public ir_br_instruction(basic_block parent_block, ir_entity condition, basic_block then_block, basic_block else_block) {
        super(parent_block);
        this.condition = condition;
        this.then_block = then_block;
        this.else_block = else_block;
    }

    @Override
    public String toString() {
        return "br i1 " + condition.toString() + ", label %" + then_block.label + ", label %" + else_block.label;
    }

    @Override
    public void accept(IR_visitor visitor) {
        visitor.visit(this);
    }

}
