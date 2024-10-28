package IR;


import java.util.ArrayList;

import IR.entity.ir_entity;
import IR.instruction.*;
import IR.node.function_definition_node;
import asm.section.*;

import java.util.HashMap;
import java.util.HashSet;

public class basic_block {
    public String label;
    public asm_block first_block;
    public function_definition_node parent;
    public ArrayList<ir_instruction> instructions;
    public HashSet<basic_block> successors = new HashSet<>();
    public HashSet<basic_block> predecessors = new HashSet<>(); // CFG
    public HashSet<basic_block> dom = new HashSet<>();
    public basic_block direct_dom_node = null;
    public HashSet<basic_block> son = new HashSet<>();// DomTree
    public HashSet<basic_block> dom_frontier = new HashSet<>(); // the boundary of the dominator
    public int loop_depth;
    public HashMap<ir_entity,ir_phi_instruction> phi_map = new HashMap<>();


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
        for(ir_phi_instruction phi : phi_map.values()){
            sb.append("    ").append(phi.toString()).append("\n");
        }
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
    public boolean equals(basic_block block){
        return this.label.equals(block.label);
    }
    public int hashCode(){
        return label.hashCode();
    }
}
