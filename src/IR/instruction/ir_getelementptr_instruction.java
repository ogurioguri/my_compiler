package IR.instruction;

import IR.IR_visitor;
import IR.basic_block;
import IR.entity.ir_entity;
import IR.type.ir_type;
import util.Pair;
import java.util.ArrayList;

public class ir_getelementptr_instruction extends ir_instruction{
    public ir_entity result;
    public String type;
    public ir_entity ptrval;
    public ArrayList<ir_entity> index;



    public ir_getelementptr_instruction(basic_block parent_block, ir_entity result_, String type_, ir_entity ptrval_, ArrayList<ir_entity> index_) {
        super(parent_block);
        this.result = result_;
        this.type = type_;
        this.ptrval = ptrval_;
        this.index = index_;
    }

    public void add_index(ir_entity index) {
        this.index.add(index);
    }

    @Override
    public String toString() {
        StringBuilder string = new StringBuilder();
        string.append(result.toString()).append(" = getelementptr ").append(type.toString()).append(" ").append(ptrval.toString());
        for (ir_entity i : index) {
            string.append(", ").append(i.type.toString()).append(" ").append(i.toString());
        }
        return string.toString();
    }

    @Override
    public void accept(IR_visitor visitor) {
        visitor.visit(this);
    }
}
