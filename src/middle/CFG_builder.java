package middle;


import IR.*;
import IR.node.function_definition_node;
import IR.instruction.*;

public class CFG_builder {
    ir_program program = null;

    public CFG_builder(ir_program program) {
        this.program = program;
    }

    public void work() {
        for(var name : program.function_definition_nodeHashMap.keySet()) {
            work_function(program.function_definition_nodeHashMap.get(name));
        }
    }

    public void work_function(function_definition_node func) {
        func.body.forEach(this::work_block);

        // remove the block that is not entry and has no predecessor
        func.body.forEach(block -> {
            if (block.predecessors.isEmpty() && !block.label.equals("entry")) {
                block.successors.forEach(succ -> succ.predecessors.remove(block));
            }
        });
        func.body.removeIf(block -> block.predecessors.isEmpty() && !block.label.equals("entry"));
    }

    public void work_block(basic_block block) {
        for (var inst : block.instructions) {
            if (inst instanceof ir_return_instruction) {
                // remove the instructions after the return instruction
                block.instructions.removeIf(tmp -> block.instructions.indexOf(tmp) > block.instructions.indexOf(inst));
                return;
            } else if (inst instanceof ir_uncond_br) {
                basic_block successor = ((ir_uncond_br) inst).dest;
                block.successors.add(successor);
                successor.predecessors.add(block);
                block.instructions.removeIf(tmp -> block.instructions.indexOf(tmp) > block.instructions.indexOf(inst));
                return;
            } else if (inst instanceof ir_br_instruction) {
                basic_block successor = ((ir_br_instruction) inst).then_block;
                block.successors.add(successor);
                successor.predecessors.add(block);
                successor = ((ir_br_instruction) inst).else_block;
                block.successors.add(successor);
                successor.predecessors.add(block);
                block.instructions.removeIf(tmp -> block.instructions.indexOf(tmp) > block.instructions.indexOf(inst));
                return;
            }
        }
    }


}
