package backend;

import asm.instruction.*;
import asm.ingredient.*;
import asm.*;
import asm.section.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.PriorityQueue;

import static java.lang.Math.max;

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
    public boolean busy_t0 =  false;
    public boolean busy_t1 = false;



    public linear_scan(asm_program program) {
        this.program = program;

    }

    public void dfs(asm_block block,ArrayList<asm_block> res){
        block.tag = true;
        block.visiting = true;
        for(int i = 0 ; i < block.successors.size() ; ++i){
            var son = block.successors.get(i);
            if(son.tag){
                if(son.visiting){
                    ArrayList<asm_block> array = new ArrayList<>();
                    var now = son;
                    while(now != block){
                        array.add(now);
                        int k;
                        for(k = 0 ; k < now.successors.size() ; ++k){
                            if(now.successors.get(k).visiting){
                                break;
                            }
                        }
                        now = now.successors.get(k);
                    }
                    for(int j = array.size() -1 ; j >=0 ; --j) {
                        res.add(array.get(j));
                    }
                }
            }
            else{
                dfs(son,res);
            }
        }
        block.visiting = false;
        res.add(block);
    }

    public ArrayList<asm_block> sort_function(asm_function function){
        ArrayList<asm_block> res = new ArrayList<>();
        register_begin.clear();
        register_end.clear();
        register_live_range.clear();
        register_list.clear();
        register_inst.clear();
        function.body.get(0).tag = true;
        dfs(function.body.get(0),res);
        ArrayList<asm_block> tmp = new ArrayList<>();
        for(int i = res.size()-1 ; i >= 0 ; --i){
            tmp.add(res.get(i));
        }
        return tmp;
    }




    public void give_index_block(ArrayList<asm_block> res) {
        int index = 1;
        for(var block : res){
            for(var inst : block.instructions){
                if(inst.index != 0){
                    inst.second_index = index;
                    index++;
                }
                else{
                    inst.index = index;
                    index++;
                }
            }
        }
        for(var block : res){
            if(block.visited){
                continue;
            }
//            if(block.label.equals("main")){
//                int i = 0;
//            }
            HashSet<register> def_register = new HashSet<>();
            for(var inst : block.instructions){
                if(inst.second_index == 51){
                    int j = 0;
                }
                if(inst.def() != null && inst.def() instanceof virtual_register){
                    if(!register_begin.containsKey(inst.def())){
                        register_begin.put(inst.def(),inst.index);
                        def_register.add(inst.def());
                    }
                }
                if(inst.use1() != null && inst.use1() instanceof virtual_register reg){
                    if((register_begin.containsKey(reg) ) || block.out.contains(inst.use1())){
                        if(inst.second_index != 0 && !def_register.contains(reg)){
                            if(register_end.containsKey(reg)){
                                register_end.put(reg,max(register_end.get(reg),inst.second_index));
                            }
                            else{
                                register_end.put(reg,inst.second_index);
                            }
                        }
                        else{
                            if(register_end.containsKey(reg)){
                                register_end.put(reg,max(register_end.get(reg),inst.index));
                            }
                            else{
                                register_end.put(reg,inst.index);
                            }
                        }
                    }
                }
                if(inst.use2() != null && inst.use2() instanceof virtual_register reg){
                    if((register_begin.containsKey(reg) ) || block.out.contains(inst.use2())){
                        if(inst.second_index != 0 && !def_register.contains(reg)){
                            if(register_end.containsKey(reg)){
                                register_end.put(reg,max(register_end.get(reg),inst.second_index));
                            }
                            else{
                                register_end.put(reg,inst.second_index);
                            }
                        }
                        else{
                            if(register_end.containsKey(reg)){
                                register_end.put(reg,max(register_end.get(reg),inst.index));
                            }
                            else{
                                register_end.put(reg,inst.index);
                            }
                        }
                    }
                }
                block.visited = true;
                //recode the instruction of each register
//                if(inst.def()!= null){
//                    if(!register_live_range.containsKey(inst.def())){
//                        register_live_range.put(inst.def(),new ArrayList<>());
//                    }
//                    register_live_range.get(inst.def()).add(inst.index);
//                }
//                if(inst.use1()!= null){
//                    if(!register_live_range.containsKey(inst.use1())){
//                        register_live_range.put(inst.use1(),new ArrayList<>());
//                    }
//                    register_live_range.get(inst.use1()).add(inst.index);
//                }
//                if(inst.use2()!= null){
//                    if(!register_live_range.containsKey(inst.use2())){
//                        register_live_range.put(inst.use2(),new ArrayList<>());
//                    }
//                    register_live_range.get(inst.use2()).add(inst.index);
//                }
            }
        }
    }

    public int get_spare(ArrayList<register> queue){
        for(int i = 0; i < 16 ; ++i){
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
        if(index >=0 && index < 4){
            return real_register.get_reg("t" + (index+3));
        }
        else if(index >= 4 && index < 16){
            return real_register.get_reg("s" + (index-4));
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

        for(int i = 0 ; i < 16 ; ++i){
            queue.add(null);
        }

        if(function.label.equals("main")){
            int i = 0;
        }
        for(var reg : register_list){
            while(!pq.isEmpty() && register_end.get(pq.peek()) < register_begin.get(reg)){
                var tmp = pq.poll();
                int index = queue.indexOf(tmp);
                queue.set(index,null);
            }
            if(pq.size() < 16){
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
            if(sw.address.offset.value < -2048 || sw.address.offset.value > 2047){
                var inst_ = new asm_li_instruction(sw.parent,real_register.get_reg("t2"),new imm(sw.address.offset.value));
                var inst_add = new asm_arith_instruction(sw.parent,real_register.get_reg("t2"),real_register.get_reg("t2"),real_register.get_reg("sp"),"+");
                sw.parent.instructions.add(sw.parent.instructions.indexOf(inst),inst_);
                sw.parent.instructions.add(sw.parent.instructions.indexOf(inst),inst_add);
                sw.address.base = real_register.get_reg("t2");
                sw.address.offset = new imm(0);
            }
        }
        if(inst instanceof asm_lw_instruction lw){
            lw.offset.offset.value += function.stack_size;
            if(inst.neg)
                lw.offset.offset.value = -lw.offset.offset.value;
            if(lw.offset.offset.value < -2048 || lw.offset.offset.value > 2047){
                var inst_ = new asm_li_instruction(lw.parent,real_register.get_reg("t2"),new imm(lw.offset.offset.value));
                var inst_add = new asm_arith_instruction(lw.parent,real_register.get_reg("t2"),real_register.get_reg("t2"),real_register.get_reg("sp"),"+");
                lw.parent.instructions.add(lw.parent.instructions.indexOf(inst),inst_);
                lw.parent.instructions.add(lw.parent.instructions.indexOf(inst),inst_add);
                lw.offset.base = real_register.get_reg("t2");
                lw.offset.offset = new imm(0);
            }
        }
        if(inst instanceof asm_arithimm_instruction arith){
            arith.immediate.value += function.stack_size;
            if(inst.neg)
                arith.immediate.value = -arith.immediate.value;
            if(arith.immediate.value < -2048 || arith.immediate.value > 2047){
                var inst_ = new asm_li_instruction(arith.parent,real_register.get_reg("t2"),new imm(arith.immediate.value));
                var new_arith = new asm_arith_instruction(arith.parent,arith.rd,real_register.get_reg("t2"),arith.rs1,"+");
                arith.parent.instructions.add(arith.parent.instructions.indexOf(inst),inst_);
                arith.parent.instructions.add(arith.parent.instructions.indexOf(inst),new_arith);
                arith.parent.instructions.remove(inst);

            }
        }



    }

    public void change_imm(asm_instruction inst , int size){
        if(inst instanceof asm_sw_instruction sw){
            sw.address.offset.value += size;
            if(inst.neg)
                sw.address.offset.value = -sw.address.offset.value;
            if(sw.address.offset.value < -2048 || sw.address.offset.value > 2047){
                var inst_ = new asm_li_instruction(sw.parent,real_register.get_reg("t2"),new imm(sw.address.offset.value));
                var inst_add = new asm_arith_instruction(sw.parent,real_register.get_reg("t2"),real_register.get_reg("t2"),real_register.get_reg("sp"),"+");
                sw.parent.instructions.add(sw.parent.instructions.indexOf(inst),inst_);
                sw.parent.instructions.add(sw.parent.instructions.indexOf(inst),inst_add);
                sw.address.base = real_register.get_reg("t2");
                sw.address.offset = new imm(0);
            }
        }
        if(inst instanceof asm_lw_instruction lw){
            lw.offset.offset.value +=size;
            if(inst.neg)
                lw.offset.offset.value = -lw.offset.offset.value;
            if(lw.offset.offset.value < -2048 || lw.offset.offset.value > 2047){
                var inst_ = new asm_li_instruction(lw.parent,real_register.get_reg("t2"),new imm(lw.offset.offset.value));
                var inst_add = new asm_arith_instruction(lw.parent,real_register.get_reg("t2"),real_register.get_reg("t2"),real_register.get_reg("sp"),"+");
                lw.parent.instructions.add(lw.parent.instructions.indexOf(inst),inst_);
                lw.parent.instructions.add(lw.parent.instructions.indexOf(inst),inst_add);
                lw.offset.base = real_register.get_reg("t2");
                lw.offset.offset = new imm(0);
            }
        }
        if(inst instanceof asm_arithimm_instruction arith){
            arith.immediate.value += size;
            if(inst.neg)
                arith.immediate.value = -arith.immediate.value;
            if(arith.immediate.value < -2048 || arith.immediate.value > 2047){
                var inst_ = new asm_li_instruction(arith.parent,real_register.get_reg("t2"),new imm(arith.immediate.value));
                var new_arith = new asm_arith_instruction(arith.parent,arith.rd,real_register.get_reg("t2"),arith.rs1,"+");
                arith.parent.instructions.add(arith.parent.instructions.indexOf(inst),inst_);
                arith.parent.instructions.add(arith.parent.instructions.indexOf(inst),new_arith);
                arith.parent.instructions.remove(inst);

            }
        }

    }

    public void execute_function(asm_function function){
        ArrayList<asm_instruction> final_stack_change = new ArrayList<>();
        int max_stack = 0;
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
                max_stack = max(max_stack,function.stack_size);
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
                            var tmp = new asm_lw_instruction(block,real_register.get_reg("t0"), new memory_address(real_register.get_reg("sp"), new imm(number)));
                            block.instructions.add(block.instructions.indexOf(inst), tmp);
                            inst.setUse1(real_register.get_reg("t0"));
                            busy_t0 = true;
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
                            if(busy_t0) {
                                var tmp = new asm_lw_instruction(block,real_register.get_reg("t1"), new memory_address(real_register.get_reg("sp"), new imm(number)));
                                block.instructions.add(block.instructions.indexOf(inst), tmp);
                                inst.setUse2(real_register.get_reg("t1"));
                            }
                            else{
                                var tmp = new asm_lw_instruction(block,real_register.get_reg("t0"), new memory_address(real_register.get_reg("sp"), new imm(number)));
                                block.instructions.add(block.instructions.indexOf(inst), tmp);
                                inst.setUse2(real_register.get_reg("t1"));
                            }
                            busy_t0 = false;
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
                            var tmp = new asm_sw_instruction(block,real_register.get_reg("t0"), new memory_address(real_register.get_reg("sp"), new imm(number)));
                            block.instructions.add(block.instructions.indexOf(inst)+1, tmp);
                            inst.setDef(real_register.get_reg("t0"));
                        }
                        else{
                            inst.setDef(register_map.get(inst.def()));
                        }
                    }
                }
            }
        }
        for(var inst : final_stack_change){
            change_imm(inst,max_stack);
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
