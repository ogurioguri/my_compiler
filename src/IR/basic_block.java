package IR;


import java.util.ArrayList;
import IR.instruction.*;
import IR.node.function_definition_node;

public class basic_block {
    public String label;
    public function_definition_node parent;
    public ArrayList<ir_instruction> instructions;
    public int loop_depth;


    public basic_block(String label, function_definition_node parent,int loop_depth) {
        this.label = label;
        this.parent = parent;
        this.instructions = new ArrayList<>();
        this.loop_depth = loop_depth;
    }

    public void add_instruction(ir_instruction instruction) {
        instructions.add(instruction);
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(label).append(":\n");
        for (ir_instruction instruction : instructions) {
            if(instruction != null){
                sb.append("    ").append(instruction.toString()).append("\n");
            }
        }
        return sb.toString();
    }
    public void accept(IR_visitor visitor) {
        visitor.visit(this);
    }
}
