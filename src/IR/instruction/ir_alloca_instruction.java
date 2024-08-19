package IR.instruction;

import IR.IR_visitor;
import IR.basic_block;
import IR.entity.ir_variable;
import IR.type.ir_type;

public class ir_alloca_instruction extends ir_instruction{
    public ir_variable result;
    public ir_type type = null;
    //if struct
    public String struct_name = null;

    public ir_alloca_instruction(basic_block parent_block, ir_variable result, ir_type type) {
        super(parent_block);
        this.result = result;
        this.type = type;
    }

    public ir_alloca_instruction(basic_block parent_block, ir_variable result, String struct_name) {
        super(parent_block);
        this.result = result;
        this.struct_name = struct_name;
    }

    @Override
    public String toString() {
        return result.toString() + " = alloca " + (type == null ? ("%class." + struct_name ) : type.toString());
    }

    @Override
    public void accept(IR_visitor visitor) {
        visitor.visit(this);
    }

}
