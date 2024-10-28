package backend;

import asm.instruction.*;
import asm.ingredient.*;
import asm.*;
import asm.section.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.PriorityQueue;

public class linear_scan {
    public asm_program program;
    public dead_code_elimination dce = new dead_code_elimination();
    public HashMap<register, ArrayList<Integer>> register_live_range = new HashMap<>();
    public HashMap<register,ArrayList<asm_instruction>> register_inst = new HashMap<>();
    public HashMap<register, Integer> register_begin = new HashMap<>();
    public HashMap<register, Integer> register_end = new HashMap<>();
    public ArrayList<register> register_list = new ArrayList<>();
    public HashMap<register,register> register_map = new HashMap<>();
    public HashSet<register>register_spill = new HashSet<>();
    public boolean busy_s10 = false;
    public boolean busy_s11 = false;



    public linear_scan(asm_program program) {
        this.program = program;

    }

    public void dfs(asm_block block,ArrayList<asm_block> res){
        if(res.contains(block)){
            return;
        }
        for(int i = block.successors.size()-1 ; i >=0 ; --i){
            var son = block.successors.get(i);
            if(son.tag){
                continue;
            }
            son.tag = true;
            dfs(son,res);
        }
        res.add(block);
    }

    public ArrayList<asm_block> sort_function(asm_function function){
        ArrayList<asm_block> res = new ArrayList<>();
        function.body.get(0).tag = true;
        dfs(function.body.get(0),res);
        ArrayList<asm_block> tmp = new ArrayList<>();
        for(int i = res.size()-1 ; i >= 0 ; --i){
            tmp.add(res.get(i));
        }
        return tmp;
    }




    public void give_index_block(ArrayList<asm_block> res) {
        int index = 0;
        for(var block : res){
            for(var inst : block.instructions){
                inst.index = index;
                index++;
            }
        }
        for(var block : res){
//            if(block.label.equals("jud_for.body1")){
//                int i = 0;
//            }
            for(var inst : block.instructions){
                if(inst.index == 67){
                    int j = 0;
                }
                if(inst.def() != null && inst.def() instanceof virtual_register){
                    if(!register_begin.containsKey(inst.def())){
                        register_begin.put(inst.def(),inst.index);
                    }
                }
                if(inst.use1() != null && inst.use1() instanceof virtual_register reg){
                    if((register_begin.containsKey(reg) && !register_end.containsKey(reg)) || block.out.contains(inst.use1())){
                        register_end.put(reg,inst.index);
                    }
                }
                if(inst.use2() != null && inst.use2() instanceof virtual_register reg){
                    if((register_begin.containsKey(reg) && !register_end.containsKey(reg)) || block.out.contains(inst.use2())){
                        register_end.put(reg,inst.index);
                    }
                }
                //recode the instruction of each register
                if(inst.def()!= null){
                    if(!register_live_range.containsKey(inst.def())){
                        register_live_range.put(inst.def(),new ArrayList<>());
                    }
                    register_live_range.get(inst.def()).add(inst.index);
                }
                if(inst.use1()!= null){
                    if(!register_live_range.containsKey(inst.use1())){
                        register_live_range.put(inst.use1(),new ArrayList<>());
                    }
                    register_live_range.get(inst.use1()).add(inst.index);
                }
                if(inst.use2()!= null){
                    if(!register_live_range.containsKey(inst.use2())){
                        register_live_range.put(inst.use2(),new ArrayList<>());
                    }
                    register_live_range.get(inst.use2()).add(inst.index);
                }
            }
        }
    }

    public int get_spare(ArrayList<register> queue){
        for(int i = 0; i < 17 ; ++i){
            if(queue.get(i) == null){
                return i;
            }
        }
        return -1;
    }

    public void replace(register reg, real_register instead){
        for(var inst : register_inst.get(reg)){
            if(inst.def() == reg){
                inst.setDef(instead);
            }
            if(inst.use1() == reg){
                inst.setUse1(instead);
            }
            if(inst.use2() == reg){
                inst.setUse2(instead);
            }
        }
    }

    //s10 and s11 are used to store the parameter
    public real_register transfer(int index){
        if(index >=0 && index < 7){
            return real_register.get_reg("t" + index);
        }
        else if(index >= 7 && index < 17){
            return real_register.get_reg("s" + (index-7));
        }
//        else if(index >= 17 && index < 25){
//            return real_register.get_reg("a" + (index-17));
//        }
        else{
            throw new RuntimeException("index out of range");
        }
    }

    public void allocate(asm_function function){
        register_list.addAll(register_begin.keySet());
        register_list.sort((a,b)->register_begin.get(a)-register_begin.get(b));
        ArrayList<register> queue = new ArrayList<>();
        PriorityQueue<register> pq = new PriorityQueue<>((a,b)->register_end.get(a)-register_end.get(b));
        for(int i = 0 ; i < 17 ; ++i){
            queue.add(null);
        }
        for(var reg : register_list){
            while(!pq.isEmpty() && register_end.get(pq.peek()) < register_begin.get(reg)){
                var tmp = pq.poll();
                int index = queue.indexOf(tmp);
                queue.set(index,null);
            }
            if(pq.size() < 17){
                int index = get_spare(queue);
                if(index != -1) {
                    queue.set(index, reg);
                    register_map.put(reg, transfer(index));
                    pq.add(reg);
                }
            }
            //准备溢出最后面的那个
            else{
                register_spill.add(reg);
            }
        }
    }

    public void change_imm(asm_instruction inst , asm_function function){
        if(inst instanceof asm_sw_instruction sw){
            sw.address.offset.value += function.stack_size;
            if(inst.neg)
                sw.address.offset.value = -sw.address.offset.value;
        }
        if(inst instanceof asm_lw_instruction lw){
            lw.offset.offset.value += function.stack_size;
            if(inst.neg)
                lw.offset.offset.value = -lw.offset.offset.value;
        }
        if(inst instanceof asm_arithimm_instruction arith){
            arith.immediate.value += function.stack_size;
            if(inst.neg)
                arith.immediate.value = -arith.immediate.value;
        }

    }

    public void execute_function(asm_function function){
        ArrayList<asm_instruction> final_stack_change = new ArrayList<>();
        for(var block : function.body){
            ArrayList<asm_instruction> copy = new ArrayList<>(block.instructions);
            for(var inst : copy){
                if(inst.need_imm){
                    change_imm(inst,function);
                }
                if(inst.need_final_imm){
                    final_stack_change.add(inst);
                }
                function.stack_size += inst.add_stack;
                if(inst.use1() != null){
                    if(inst.use1() instanceof virtual_register virtual) {
                        if (register_spill.contains(virtual)) {
                            int number;
                            if (function.virtual_stack.get(virtual) == null) {
                                function.virtual_stack.put(virtual, function.stack_size);
                                number = function.stack_size;
                                function.stack_size += 4;
                            }
                            else {
                                number = function.virtual_stack.get(virtual);
                            }
                            var tmp = new asm_lw_instruction(block,real_register.get_reg("s10"), new memory_address(real_register.get_reg("sp"), new imm(number)));
                            block.instructions.add(block.instructions.indexOf(inst), tmp);
                            inst.setUse1(real_register.get_reg("s10"));
                            busy_s10 = true;
                        }
                        else{
                            inst.setUse1(register_map.get(inst.use1()));
                        }
                    }
                }
                if(inst.use2() != null){
                    if(inst.use2() instanceof virtual_register virtual) {
                        if (register_spill.contains(virtual)) {
                            int number;
                            if (function.virtual_stack.get(virtual) == null) {
                                function.virtual_stack.put(virtual, function.stack_size);
                                number = function.stack_size;
                                function.stack_size += 4;
                            }
                            else {
                                number = function.virtual_stack.get(virtual);
                            }
                            if(!busy_s10) {
                                var tmp = new asm_lw_instruction(block,real_register.get_reg("s11"), new memory_address(real_register.get_reg("sp"), new imm(number)));
                                block.instructions.add(block.instructions.indexOf(inst), tmp);
                                inst.setUse2(real_register.get_reg("s11"));
                            }
                            else{
                                var tmp = new asm_lw_instruction(block,real_register.get_reg("s10"), new memory_address(real_register.get_reg("sp"), new imm(number)));
                                block.instructions.add(block.instructions.indexOf(inst), tmp);
                                inst.setUse2(real_register.get_reg("s10"));
                            }
                            busy_s10 = false;
                        }
                        else{
                            inst.setUse2(register_map.get(inst.use2()));
                        }
                    }
                }
                if(inst.def() != null){
                    if(inst.def() instanceof virtual_register virtual) {
                        if (register_spill.contains(virtual)) {
                            int number;
                            if (function.virtual_stack.get(virtual) == null) {
                                function.virtual_stack.put(virtual, function.stack_size);
                                number = function.stack_size;
                                function.stack_size += 4;
                            }
                            else {
                                number = function.virtual_stack.get(virtual);
                            }
                            var tmp = new asm_sw_instruction(block,inst.def(), new memory_address(real_register.get_reg("sp"), new imm(number)));
                            block.instructions.add(block.instructions.indexOf(inst)+1, tmp);
                            inst.setDef(real_register.get_reg("s10"));
                        }
                        else{
                            inst.setDef(register_map.get(inst.def()));
                        }
                    }
                }
            }
        }
        for(var inst : final_stack_change){
            change_imm(inst,function);
        }
    }

    public void work_on_function(asm_function function){
        var res = sort_function(function);
        give_index_block(res);
        dce.work_on_function(function,register_begin,register_end);
        allocate(function);
        execute_function(function);
    }











}
