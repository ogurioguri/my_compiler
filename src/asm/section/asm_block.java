package asm.section;

import java.util.ArrayList;
import asm.ingredient.*;
import asm.instruction.*;
import java.util.HashSet;
import IR.*;

public class asm_block extends asm_section{
    public ArrayList<asm_instruction> instructions = null;
    public asm_function parent = null;
    public basic_block ir_block = null;
    public HashSet<register> use = null;
    public HashSet<register> def = null;
    public HashSet<register> in = null;
    public HashSet<register> out = null;
    public ArrayList<asm_block> successors = null;
    public HashSet<asm_block> predecessors = null;
    public boolean tag = false;

    public asm_block(asm_block other){
        super(other.label);
        this.instructions = new ArrayList<asm_instruction>();
        for (asm_instruction inst : other.instructions) {
            this.instructions.add(inst);
        }
        this.parent = other.parent;
        this.ir_block = other.ir_block;
        this.use = new HashSet<register>();
        for (register reg : other.use) {
            this.use.add(reg);
        }
        this.def = new HashSet<register>();
        for (register reg : other.def) {
            this.def.add(reg);
        }
        this.in = new HashSet<register>();
        for (register reg : other.in) {
            this.in.add(reg);
        }
        this.out = new HashSet<register>();
        for (register reg : other.out) {
            this.out.add(reg);
        }
        this.successors = new ArrayList<asm_block>();
        for (asm_block block : other.successors) {
            this.successors.add(block);
        }
        this.predecessors = new HashSet<asm_block>();
        for (asm_block block : other.predecessors) {
            this.predecessors.add(block);
        }
        this.tag = other.tag;
    }

    public asm_block(String label,asm_function parent){
        super(label);
        this.parent = parent;
        instructions = new ArrayList<asm_instruction>();
        successors = new ArrayList<asm_block>();
        predecessors = new HashSet<asm_block>();
        in = new HashSet<register>();
        out = new HashSet<register>();
        use = new HashSet<register>();
        def = new HashSet<register>();
    }

    public String toString(){
        StringBuilder sb = new StringBuilder();
        sb.append(label).append(":\n");
        for (asm_instruction inst : instructions) {
            sb.append("      #").append(inst.index).append("\n");
            sb.append("      ").append(inst.toString()).append("\n");
        }
        return sb.toString();
    }

    public void add_instruction(asm_instruction inst){
        instructions.add(inst);
    }

}
