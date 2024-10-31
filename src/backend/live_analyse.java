package backend;

import asm.instruction.*;
import asm.ingredient.*;
import asm.section.*;
import asm.*;
import IR.node.*;

import java.util.HashSet;

public class live_analyse {
    public void relation(asm_block node) {
        if(node.parent.body.indexOf(node) == 0) {
            node.successors.add(node.parent.body.get(1));
            node.parent.body.get(1).predecessors.add(node);
        } else {
            if(node.ir_block == null){
                return;
            }
            for(var tmp : node.ir_block.predecessors) {
                node.predecessors.add(tmp.first_block);
            }
            for(var tmp : node.ir_block.successors) {
                node.successors.add(tmp.first_block);
            }
        }
    }

    public void compute_use_def(asm_block block){
        for(var inst: block.instructions){
            if(inst.def() != null){
                block.def.add(inst.def());
            }
            if(inst.use1() != null && !block.def.contains(inst.use1())){
                block.use.add(inst.use1());
            }
            if(inst.use2() != null && !block.def.contains(inst.use2())){
                block.use.add(inst.use2());
            }
        }
    }
    public boolean is_live_in(asm_block block, register reg){
        for(var inst: block.instructions){
            if(inst.def() != null && inst.def().equals(reg)){
                return false;
            }
            if(inst.use1() != null && inst.use1().equals(reg)){
                return true;
            }
            if(inst.use2() != null && inst.use2().equals(reg)){
                return true;
            }
        }
        return true;
    }

    public boolean compute_in_out(asm_block block){
        var original_in = new HashSet<>(block.in);
        var original_out = new HashSet<>(block.out);
        for(var succ: block.successors){
            block.out.addAll(succ.in);
        }
        block.in = new HashSet<>(block.use);
        for(var out: block.out){
            if(is_live_in(block, out)){
                block.in.add(out);
            }
        }
        return !original_in.equals(block.in) || !original_out.equals(block.out);
    }


    public void work_on_function(asm_function func) {
        func.body.forEach(this::relation);
        func.body.forEach(this::compute_use_def);
        boolean changed = true;
        while(changed) {
            changed = false;
            for(var block: func.body) {
                changed |= compute_in_out(block);
            }
        }
    }
}
