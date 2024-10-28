package IR.instruction;

import IR.entity.ir_entity;
import util.Pair;
import IR.IR_visitor;
import IR.basic_block;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;

public class ir_phi_instruction extends ir_instruction{
    public ir_entity result;
//    public ArrayList<Pair<ir_entity,basic_block>> values_blocks;
    public HashMap<basic_block,ir_entity> block_map = new HashMap<>();

    public ir_phi_instruction(basic_block parent_block , ir_entity result , ArrayList<Pair<ir_entity,basic_block>> values_blocks) {
        super(parent_block);
        this.result = result;
        for (Pair<ir_entity, basic_block> pair : values_blocks) {
            block_map.put(pair.getValue(),pair.getKey());
        }
    }

    public void add_value(ir_entity value_ , basic_block block_){
        block_map.put(block_,value_);
    }

    @Override
    public String toString() {
        StringBuilder string = new StringBuilder();
        string.append(result.toString()).append(" = phi ").append(result.type.toString()).append(" ");
//        for (int i = 0; i < block_map.size(); i++) {
//            if (i != 0) {
//                string.append(", ");
//            }
//            string.append("[ ").append(values_blocks.get(i).getKey().toString()).append(", %").append(values_blocks.get(i).getValue().label).append(" ]");
//        }
        int i = 0;
        for (basic_block block : block_map.keySet()) {
            if(i++ != 0){
                string.append(", ");
            }
            string.append("[ ").append(block_map.get(block).toString()).append(", %").append(block.label).append(" ]");
        }
        return string.toString();
    }

    @Override
    public void accept(IR_visitor visitor) {
        visitor.visit(this);
    }
}
