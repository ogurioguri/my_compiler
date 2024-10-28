package middle;

import IR.*;
import IR.instruction.*;
import IR.node.*;
import IR.entity.*;
import IR.type.ir_type;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Stack;

import static java.lang.System.exit;


public class MEm2Reg {
    public ir_program program = null;
    public HashMap<ir_entity, HashSet<basic_block>> def_blocks = new HashMap<>();
    public HashSet<ir_entity> allocated = new HashSet<>();
    HashMap<String, HashMap<ir_entity, Integer>> block_number_map = new HashMap<>();
    HashMap<basic_block, HashMap<ir_entity, ir_entity>> block_newentity_map = new HashMap<>();
    HashMap<ir_entity, ir_type> ptr_type = new HashMap<>();
    HashMap<ir_entity, Integer> entity_stack = new HashMap<>();
    HashMap<ir_entity, ir_entity> entity_newentity = new HashMap<>();
    HashSet<basic_block> visited = new HashSet<>();
    HashMap<String, Stack<ir_entity>> value_stack = new HashMap<>();
    HashMap<ir_entity,String> original_name = new HashMap<>();
    HashSet<ir_entity> original_entity = new HashSet<>();
    int add_number = 0;

    MEm2Reg(ir_program program) {
        this.program = program;
    }


    public void init_(function_definition_node function) {
        for (basic_block block : function.body) {
            for (ir_instruction instruction : block.instructions) {
                if (instruction instanceof ir_alloca_instruction) {
                    ir_entity entity = ((ir_alloca_instruction) instruction).result;
                    allocated.add(entity);
                    ptr_type.put(entity, ((ir_alloca_instruction) instruction).type);
                }
                if (instruction instanceof ir_store_instruction) {
                    ir_entity entity = ((ir_store_instruction) instruction).pointer;
                    if (entity instanceof ir_variable) {
                        if (allocated.contains(entity)) {
                            if (!def_blocks.containsKey(entity)) {
                                def_blocks.put(entity, new HashSet<>());
                            }
                            def_blocks.get(entity).add(block);
                        }
                    }

                }
            }
        }
        for (var entity : allocated) {
            value_stack.put(((ir_variable)entity).name, new Stack<>());
            original_name.put(entity, ((ir_variable)entity).name);
        }
        for (basic_block block : function.body) {
            ArrayList<ir_instruction> copy = new ArrayList<>(block.instructions);
            for (ir_instruction instruction : copy) {
                if (instruction instanceof ir_alloca_instruction && !def_blocks.containsKey(((ir_alloca_instruction) instruction).result)) {
                    block.instructions.remove(instruction);
                }
            }
        }
        HashSet<ir_entity> copy = new HashSet<>(allocated);
        original_entity.addAll(allocated);
        for (var entity : copy) {
            if (!def_blocks.containsKey(entity)) {
                allocated.remove(entity);
            }
        }

    }

    //cope with the alloca instruction
    public void insert_phi(ir_entity entity) {
        ArrayList<basic_block> worklist = new ArrayList<>(def_blocks.get(entity));
        int head = 0;
        while (head < worklist.size()) {
            basic_block current = worklist.get(head);
            head++;
            for (basic_block predecessor : current.dom_frontier) {
                if (!worklist.contains(predecessor)) {
                    worklist.add(predecessor);
                }
                ir_phi_instruction phi = new ir_phi_instruction(predecessor, entity, new ArrayList<>());
                for (var pred : predecessor.predecessors) {
                    phi.add_value(entity, pred);
                }
                if (predecessor.predecessors.size() > 1) {
                    predecessor.phi_map.put(entity, phi);
                }
            }
        }
    }

    public void rename(basic_block block) {
//        System.out.println(block.label);
//        for(var block_ : block.parent.body){
//            if(block_.label.equals("for.cond0")){
//                for(var phi : block_.phi_map.values()){
//                    System.out.println(phi.toString());
//                }
//            }
//        }
        ArrayList<ir_instruction> remove_list = new ArrayList<>();
        for (var entity : block.phi_map.keySet()) {
            if (allocated.contains(entity)) {
                if (entity_stack.containsKey(entity)) {
                    entity_stack.put(entity, entity_stack.get(entity) + 1);
                } else {
                    entity_stack.put(entity, 0);
                }
                int number = entity_stack.get(entity);
//                if(!block_number_map.containsKey(block.label)){
//                    block_number_map.put(block.label, new HashMap<>());
//                }
//                block_number_map.get(block.label).put(entity, number);
                ir_entity new_entity = new ir_variable(((ir_variable) entity).name + "." + number, entity.type);
                original_name.put(new_entity, ((ir_variable) entity).name);
                entity_newentity.put(entity, new_entity);
                block.phi_map.get(entity).result = new_entity;
                value_stack.get(((ir_variable)entity).name).push(new_entity);
            }
        }

        for (var instruction : block.instructions) {
            if (instruction instanceof ir_load_instruction load) {
                if(load.pointer.toString().equals("%_b.0")){
                    int i = 0;
                }
                ir_entity entity = (load).pointer;
                if (entity instanceof ir_variable variable) {
                    if (allocated.contains(variable)) {
                        if (!value_stack.get(variable.name).isEmpty()) {
                            var new_entity = value_stack.get(variable.name).peek();
                            if (new_entity instanceof ir_variable) {
                                ((ir_variable) (load.result)).name = ((ir_variable) new_entity).name;
                                ((ir_variable) (load.result)).type = ((ir_variable) new_entity).type;
                                remove_list.add(instruction);
                            } else if (new_entity instanceof ir_literal) {
                                ir_literal tmp0 = new ir_literal("0", ((ir_load_instruction) instruction).result.type);
                                block.instructions.set(block.instructions.indexOf(instruction), new ir_binary_instruction(block, "+", new_entity, tmp0, ((ir_load_instruction) instruction).result));
                            } else if (new_entity instanceof ir_global_variable) {
                                ir_literal tmp0 = new ir_literal("0", new ir_type("i32"));
                                ArrayList<ir_entity> index = new ArrayList<>();
                                index.add(tmp0);
                                block.instructions.set(block.instructions.indexOf(instruction), new ir_getelementptr_instruction(block, ((ir_load_instruction) instruction).result, "i32", (ir_global_variable) new_entity, index));
                            } else {
                                throw new RuntimeException("Mem2Reg: rename: valueStack.peek() is not LocalVar or IRLiteral or GlobalPtr");
                            }
                        } else {
                            remove_list.add(instruction);
                        }
                    }
                    else{
                        if(original_entity.contains(variable)){
                            exit(0);
                        }
                    }
                }
            }
            if (instruction instanceof ir_store_instruction) {
                var value = ((ir_store_instruction) instruction).value;
                var pointer = ((ir_store_instruction) instruction).pointer;
                if (pointer instanceof ir_variable) {
                    if(value instanceof ir_variable && ((ir_variable)value).name.equals("_tmp.36")){
                        int a = 1;
                    }
                    if (allocated.contains(pointer)) {
                        entity_newentity.put(pointer, value);
                        if (!block_newentity_map.containsKey(block)) {
                            block_newentity_map.put(block, new HashMap<>());
                        }
                        block_newentity_map.get(block).put(pointer, value);
                        remove_list.add(instruction);
                        value_stack.get(((ir_variable)pointer).name).push(value);
                    }
                }
            }
            if (instruction instanceof ir_alloca_instruction) {
                remove_list.add(instruction);
            }
        }
        for (var instruction : remove_list) {
            block.instructions.remove(instruction);
        }

        HashMap<String, Integer> size_ =  new HashMap<>();
        for (var successor : block.successors) {
            for (var phi : successor.phi_map.values()) {
                if (original_name.get(phi.result) == null ||  value_stack.get(original_name.get(phi.result)).isEmpty()) {
                    ir_literal tmp = new ir_literal("0", ptr_type.get(phi.result));
                    if (phi.result.type.is_pointer) {
                        tmp = new ir_literal("null", ptr_type.get(phi.result));
                    }
                    phi.block_map.put(block, tmp);
                } else {
                    var value = value_stack.get(original_name.get(phi.result)).peek();
                    phi.block_map.put(block, value_stack.get(original_name.get(phi.result)).peek());
                }

            }
        }
        for(var entity : value_stack.keySet()){
            size_.put(entity, value_stack.get(entity).size());
        }
        for(var block_ : block.son){
            rename(block_);
            //recover the stack
            for(var entity : value_stack.keySet()){
                if(value_stack.get(entity).size() > size_.get(entity)){
                    value_stack.get(entity).pop();
                }
            }
        }
    }

    public void fill_phi(basic_block block) {
        for (var phi : block.phi_map.values()) {
            for (var key : phi.block_map.keySet()) {
                basic_block current = key;
                while (current != null && ((block_newentity_map.get(current) == null) || !block_newentity_map.get(current).containsKey(phi.block_map.get(key)))) {
                    current = current.direct_dom_node;
                }
                if (current != null) {
                    phi.block_map.put(key, block_newentity_map.get(current).get(phi.block_map.get(key)));
                }
            }
        }
        for (var son : block.son) {
            fill_phi(son);
        }
    }

    public void cope_criticaledge(basic_block block) {
        visited.add(block);
        HashSet<basic_block> copy = new HashSet<>(block.successors);
        if (copy.size() > 1) {
            for (var successor : copy) {
                if (visited.contains(successor))
                    continue;
                if (successor.predecessors.size() > 1) {
                    basic_block new_block = new basic_block("split" + add_number, block.parent, block.loop_depth);
                    new_block.instructions.add(new ir_uncond_br(new_block, successor));
                    add_number++;
                    block.parent.body.add(block.parent.body.indexOf(block)+1, new_block);
                    block.successors.remove(successor);
                    block.successors.add(new_block);
                    new_block.predecessors.add(block);
                    new_block.successors.add(successor);
                    successor.predecessors.remove(block);
                    successor.predecessors.add(new_block);
                    for (var phi_key : successor.phi_map.keySet()) {
                        var phi = successor.phi_map.get(phi_key);
                        ir_phi_instruction new_phi = new ir_phi_instruction(new_block, phi.result, new ArrayList<>());
                        for (var key : phi.block_map.keySet()) {
                            if (key == block) {
                                new_phi.add_value(phi.block_map.get(key), new_block);
                            } else {
                                new_phi.add_value(phi.block_map.get(key), key);
                            }
                        }
                        successor.phi_map.put(phi_key, new_phi);
                    }
                    var inst = block.instructions.get(block.instructions.size() - 1);
                    if (inst instanceof ir_uncond_br) {
                        block.instructions.remove(inst);
                        block.instructions.add(new ir_uncond_br(block, new_block));
                    } else if (inst instanceof ir_br_instruction) {
                        ir_br_instruction br = (ir_br_instruction) inst;
                        if (br.condition == null) {
                            block.instructions.remove(inst);
                            block.instructions.add(new ir_br_instruction(block, null, new_block, successor));
                        } else {
                            if (br.else_block == successor) {
                                br.else_block = new_block;
                            } else if (br.then_block == successor) {
                                br.then_block = new_block;
                            } else {
                                throw new RuntimeException("Mem2Reg: cope_criticaledge: exit is not IRJumpInst or IRBrInst");
                            }
                        }
                    }
                }
            }
        }
        for(var successor : block.successors){
            if(!visited.contains(successor)){
                cope_criticaledge(successor);
            }
        }

    }

    public void work_function(function_definition_node function) {
        def_blocks = new HashMap<>();
        block_number_map = new HashMap<>();
        block_newentity_map = new HashMap<>();
        visited = new HashSet<>();
        allocated = new HashSet<>();
        init_(function);
        for (var entity : allocated) {
            insert_phi(new ir_variable(((ir_variable) entity).name, ptr_type.get(entity)));
        }
        rename(function.body.get(0));
//        fill_phi(function.body.get(0));
        cope_criticaledge(function.body.get(0));
    }

    public void work() {
        for (var function : program.function_definition_nodeHashMap.values()) {
            work_function(function);
        }
    }


}
