package IR.instruction;

import IR.IR_visitor;
import IR.basic_block;
import IR.entity.ir_entity;
import IR.entity.ir_variable;
import IR.type.ir_type;

public class ir_store_instruction extends ir_instruction {
    public ir_entity value;
    public ir_entity pointer;


    public ir_store_instruction(basic_block parent_block, ir_entity value, ir_entity pointer) {
        super(parent_block);
        this.value = value;
        this.pointer = pointer;
    }

    @Override
    public String toString() {
        return "store " + value.return_type().toString()+' '+ value.toString() + ", ptr " + pointer.toString();
    }

    @Override
    public void accept(IR_visitor visitor) {
        visitor.visit(this);
    }
}
