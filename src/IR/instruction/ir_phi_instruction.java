package IR.instruction;

import IR.entity.ir_entity;
import util.Pair;
import IR.IR_visitor;
import IR.basic_block;
import java.lang.reflect.Array;
import java.util.ArrayList;

public class ir_phi_instruction extends ir_instruction{
    public ir_entity result;
    public ArrayList<Pair<ir_entity,basic_block>> values_blocks;

    public ir_phi_instruction(basic_block parent_block , ir_entity result , ArrayList<Pair<ir_entity,basic_block>> values_blocks) {
        super(parent_block);
        this.result = result;
        this.values_blocks = values_blocks;
    }

    public void add_value(ir_entity value_ , basic_block block_){
        values_blocks.add(new Pair<>(value_,block_));
    }

    @Override
    public String toString() {
        StringBuilder string = new StringBuilder();
        string.append(result.toString()).append(" = phi ").append(result.type.toString()).append(" ");
        for (int i = 0; i < values_blocks.size(); i++) {
            if (i != 0) {
                string.append(", ");
            }
            string.append("[ ").append(values_blocks.get(i).getKey().toString()).append(", ").append(values_blocks.get(i).getValue().toString()).append(" ]");
        }
        return string.toString();
    }

    @Override
    public void accept(IR_visitor visitor) {
        visitor.visit(this);
    }
}
