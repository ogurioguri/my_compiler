package backend;

import asm.asm_program;
import asm.ingredient.*;
import asm.instruction.*;
import asm.section.*;
import java.util.ArrayList;
import IR.instruction.*;
import IR.*;
import IR.type.*;
import IR.node.*;
import IR.entity.*;
import java.util.HashMap;
import ast.*;
import ast.type.*;
import ast.expression.*;
import ast.statement.*;
import ast.primary.*;

public class asm_builder implements IR_visitor{
    asm_program program = null;
    asm_block current_block = null;
    asm_function current_function = null;
    HashMap<String,virtual_register> register_map = null;
    HashMap<String,asm_block> block_map = null;
    ArrayList<asm_return_instruction> return_instructions = null;
    real_register sp,ra;
    real_register t0,t1,t2,t3,t4;
    real_register[] a_registers = null;
    real_register[] t_registers = null;
    real_register[] s_registers = null;

    public virtual_register get_register(ir_entity entity , real_register object){
        if(entity instanceof ir_variable local_variable){
            String name = local_variable.name;
            if(register_map.containsKey(name)){
                return register_map.get(name);
            }else{
                var tmp = new virtual_register();
                register_map.put(name,tmp);
                return tmp;
            }
        }else if(entity instanceof ir_literal){
            var tmp = new virtual_register();
            current_block.add_instruction(new asm_li_instruction(current_block,object,new imm(((ir_literal) entity).value)));
            if(!current_function.virtual_stack.containsKey(tmp)) {
                current_function.virtual_stack.put(tmp, current_function.stack_size);
                store_register(tmp, object);
                current_function.stack_size += 4;
            }
            return tmp;
        }else if(entity instanceof ir_global_variable global_val){
            var tmp = new virtual_register();
            current_block.add_instruction(new asm_la_instruction(current_block,object,global_val.name));
            if(!current_function.virtual_stack.containsKey(tmp)) {
                current_function.virtual_stack.put(tmp, current_function.stack_size);
                store_register(tmp, object);
                current_function.stack_size += 4;
            }
            return tmp;
        }
        else{
            throw new RuntimeException("get_register error");
        }
    }


    public asm_builder(asm_program program){
        this.program = program;
        register_map = new HashMap<String,virtual_register>();
        block_map = new HashMap<String,asm_block>();
        sp = real_register.get_reg("sp");
        ra = real_register.get_reg("ra");
        t0 = real_register.get_reg("t0");
        t1 = real_register.get_reg("t1");
        t2 = real_register.get_reg("t2");
        t3 = real_register.get_reg("t3");
        t4 = real_register.get_reg("t4");
        a_registers = new real_register[8];
        t_registers = new real_register[7];
        s_registers = new real_register[12];
        for (int i = 0; i < 8; i++) {
            a_registers[i] = real_register.get_reg("a"+i);
        }
        for (int i = 0; i < 7; i++) {
            t_registers[i] = real_register.get_reg("t"+i);
        }
        for (int i = 0; i < 12; i++) {
            s_registers[i] = real_register.get_reg("s"+i);
        }
    }


    @Override
    public void visit(ir_program node) {
        for(var global_variable : node.global_variables.values()){
            global_variable.accept(this);
        }
        for(var string_literal : node.string_literal_list){
            string_literal.accept(this);
        }
        for(var class_node : node.class_definition_nodeHashMap.values()){
            class_node.accept(this);
        }
        for(var function : node.function_definition_nodeHashMap.values()){
            function.accept(this);
        }
    }

    @Override
    public void visit(basic_block node){
        current_block = current_block.parent.add_block(node.parent.name + "_" + node.label);
        block_map.put(node.label,current_block);
        for(var inst : node.instructions) {
            inst.accept(this);
        }
    }

    @Override
    public void visit(class_node node){}

    @Override
    public void visit(function_node node){}

    @Override
    public void visit(function_definition_node node){
        virtual_register.reset();
        block_map = new HashMap<>();
        register_map = new HashMap<>();
        return_instructions = new ArrayList<>();
        current_block = program.add_function(node.name);
        var start_block = current_block;
        current_function = current_block.parent;
        for (int i = 0; i < node.parameters.size(); ++i) {
            var tmp = new virtual_register();
            if (i < 8) {
//                current_block.add_instruction(new asm_mv_instrcution(current_block, tmp, a_registers[i]));
                current_block.add_instruction(new asm_mv_instrcution(current_block, t0, a_registers[i]));
                store_register(tmp, t0);
                current_function.virtual_stack.put(tmp, current_function.stack_size);
                current_function.stack_size += 4;
            }
            else {
                current_function.virtual_stack.put(tmp, current_function.stack_size);
                current_function.stack_size += 4 ;
                current_block.add_instruction(new asm_lw_instruction(current_block, tmp, new memory_address(sp, new imm(-current_function.stack_size))));
            }
            register_map.put(node.parameters.get(i).name,tmp);
        }
        for(var bb : node.body){
            bb.accept(this);
        }

        current_block = start_block;
        var move_sp_inst = new asm_arithimm_instruction(current_block, sp, sp, "+",new imm(-current_function.stack_size));
        current_block.instructions.add(0,move_sp_inst);
        current_function.move_sp_inst = move_sp_inst;

        //restore the return address
        for(var return_inst : return_instructions){
            current_block = return_inst.parent;
            int index = return_inst.parent.instructions.indexOf(return_inst);
            var back = new asm_arithimm_instruction(current_block, sp, sp, "+", new imm(current_function.stack_size));
            current_block.instructions.add(index,back);
        }
        current_function.count = virtual_register.count;
    }

    @Override
    public void visit(global_variable_node node){
        if(node.value.value.equals("null")){
            program.val_defines.add(new asm_val_define(node.variable.name,0));
        }
        else{
            program.val_defines.add(new asm_val_define(node.variable.name,Integer.parseInt(node.value.value)));
        }
    }

    @Override
    public void visit(ir_stringliteral_node node){
        program.strings.add(new asm_string_literal(node.ptr.name,node.value));
    }

    @Override
    public void visit(ir_binary_instruction ins){
        current_block.add_instruction(new asm_comment(current_block,ins.toString()));
        var lhs = get_register(ins.lhs , t1);
        var rhs = get_register(ins.rhs , t2);
        var result = get_register(ins.result,t0);
        load_register(lhs,t1);
        load_register(rhs,t2);
//        current_block.add_instruction(new asm_arith_instruction(current_block,get_register(ins.result),get_register(ins.lhs),get_register(ins.rhs),ins.op));
        current_block.add_instruction(new asm_arith_instruction(current_block,t0,t1,t2,ins.op));
        store_register(result,t0);
    }
    @Override
    public void visit(ir_br_instruction ins){
        var condition = get_register(ins.condition,t0);
        load_register(condition,t0);
        current_block.add_instruction(new asm_comment(current_block,ins.toString()));
//        current_block.add_instruction(new asm_br_instruction(current_block,get_register(ins.condition),null,ins.parent_block.parent.name+ "_" + ins.else_block.label,"=="));
        current_block.add_instruction(new asm_br_instruction(current_block,t0,null,ins.parent_block.parent.name+ "_" + ins.else_block.label,"=="));

    }
    @Override
    public void visit(ir_call_instruction ins){
        current_block.add_instruction(new asm_comment(current_block,ins.toString()));
        int offset = 0;
        if(ins.parameters.size()<8){
            for(int i = 0; i < ins.parameters.size(); i++){
//                current_block.add_instruction(new asm_mv_instrcution(current_block,a_registers[i],get_register(ins.parameters.get(i))));
                var tmp = get_register(ins.parameters.get(i),t0);
                load_register(tmp,t0);
                current_block.add_instruction(new asm_mv_instrcution(current_block,a_registers[i],t0));
            }
        }
        else{
            for(int i = 0; i < 8; i++){
                var tmp = get_register(ins.parameters.get(i),a_registers[i]);
                current_block.add_instruction(new asm_mv_instrcution(current_block,a_registers[i],tmp));
            }
            for(int i = 8; i < ins.parameters.size(); i++){
                var object = get_register(ins.parameters.get(i),t0);
                current_block.add_instruction(new asm_sw_instruction(current_block,object,new memory_address(sp,new imm((-(ins.parameters.size()  - i) * 4)))));
                offset += 4;
            }
        }

        var ra_address = new memory_address(sp,new imm(current_function.stack_size));
        current_function.stack_size += 4;
        var save_ra = new asm_sw_instruction(current_block,ra,ra_address);
        current_block.add_instruction(save_ra);
        if (offset!= 0)
            current_block.add_instruction(new asm_arithimm_instruction(current_block, sp, sp, "+", new imm(-offset)));
        // ? call
        var call = new asm_call_instruction(current_block, ins.function_name);
        current_block.add_instruction(call);
        // ! 恢复sp
        if (offset!=0)
            current_block.add_instruction(new asm_arithimm_instruction(current_block, sp, sp, "+", new imm(offset)));
        // ! 从a0中取出返回值
        if (ins.result != null) {
            var result = get_register(ins.result, t0);
//            current_block.add_instruction(new asm_mv_instrcution(current_block, result, a_registers[0]));
            current_block.add_instruction(new asm_mv_instrcution(current_block, t0, a_registers[0]));
            store_register(result, t0);
        }

        // ! restore ra and t0-t6 and a1-a7
        var restoreRa = new asm_lw_instruction(current_block, ra, ra_address);
        current_block.add_instruction(restoreRa);

//        current_function.callerSaveRa.put(call, saveRa);
//        currentFunc.callerRestoreRa.put(call, restoreRa);

    }
    @Override
    public void visit(ir_cmp_instruction ins) {
        current_block.add_instruction(new asm_comment(current_block,ins.toString()));
        var r1 = get_register(ins.lhs,t1);  // t1
        var r2 = get_register(ins.rhs,t2); // t2
        var tmp1 = new virtual_register(); // t0
        var tmp2 = new virtual_register(); // t3
        load_register(r1,t1);
        load_register(r2,t2);
//        current_block.add_instruction(new asm_ari  th_instruction(current_block,tmp1,r1,r2,"-"));
        current_block.add_instruction(new asm_arith_instruction(current_block,t0,t1,t2,"-"));
        if(ins.op.equals(">") || ins.op.equals("!=") || ins.op.equals("==") || ins.op.equals("<")) {
//            current_block.add_instruction(new asm_set_instruction(current_block, tmp2, tmp1, ins.op));
            current_block.add_instruction(new asm_set_instruction(current_block, t3, t0, ins.op));
//            current_block.add_instruction(new asm_mv_instrcution(current_block, get_register(ins.result), tmp2));
            var result = get_register(ins.result , t0);// new t0
            current_block.add_instruction(new asm_mv_instrcution(current_block, t0, t3));
            store_register(result,t0);
            return;
        }
        else if(ins.op.equals(">=")){
            var tmp3 = new virtual_register();
            var tmp4 = new virtual_register();
//            current_block.add_instruction(new asm_set_instruction(current_block, tmp2, tmp1, ">"));
//            current_block.add_instruction(new asm_set_instruction(current_block, tmp3, tmp1, "=="));
//            current_block.add_instruction(new asm_arith_instruction(current_block,tmp4,tmp2,tmp3,"|"));
//            current_block.add_instruction(new asm_mv_instrcution(current_block, get_register(ins.result), tmp4));
            //tmp2 = t3 , tmp3 = t1 , tmp4 = t2
            current_block.add_instruction(new asm_set_instruction(current_block, t3, t0, ">"));
            current_block.add_instruction(new asm_set_instruction(current_block, t1, t0, "=="));
            current_block.add_instruction(new asm_arith_instruction(current_block,t2,t3,t1,"|"));
            var result = get_register(ins.result,t0); // new t0
            current_block.add_instruction(new asm_mv_instrcution(current_block, t0, t2));
            store_register(result,t0);
            return;
        }
        else if(ins.op.equals("<=")){
            var tmp3 = new virtual_register();
            var tmp4 = new virtual_register();
//            current_block.add_instruction(new asm_set_instruction(current_block, tmp2, tmp1, "<"));
//            current_block.add_instruction(new asm_set_instruction(current_block, tmp3, tmp1, "=="));
//            current_block.add_instruction(new asm_arith_instruction(current_block,tmp4,tmp2,tmp3,"|"));
//            current_block.add_instruction(new asm_mv_instrcution(current_block, get_register(ins.result), tmp4));
            //tmp2 = t3 , tmp3 = t1 , tmp4 = t2
            current_block.add_instruction(new asm_set_instruction(current_block, t3, t0, "<"));
            current_block.add_instruction(new asm_set_instruction(current_block, t1, t0, "=="));
            current_block.add_instruction(new asm_arith_instruction(current_block,t2,t3,t1,"|"));
            var result = get_register(ins.result,t0); // new t0
            current_block.add_instruction(new asm_mv_instrcution(current_block, t0, t2));
            store_register(result,t0);
            return;
        }
        throw new RuntimeException("cmp error");
    }
    @Override
    public void visit(ir_uncond_br ins){
        current_block.add_instruction(new asm_comment(current_block,ins.toString()));
        current_block.add_instruction(new asm_jump_instruction(current_block,ins.parent_block.parent.name + "_" + ins.dest.label));
    }
    @Override
    public void visit(ir_load_instruction ins){
        current_block.add_instruction(new asm_comment(current_block,ins.toString()));
//        current_block.add_instruction(new asm_lw_instruction(current_block,get_register(ins.result),new memory_address(get_register(ins.pointer),new imm((0)))));
        var result = get_register(ins.result,t0); // t0
        var pointer = get_register(ins.pointer,t1); // t1
        load_register(pointer,t1);
        current_block.add_instruction(new asm_lw_instruction(current_block,t0,new memory_address(t1,new imm((0)))));
        store_register(result,t0);
    }
    @Override
    public void visit(ir_return_instruction ins){
        current_block.add_instruction(new asm_comment(current_block,ins.toString()));
        if(ins.value != null){
//            current_block.add_instruction(new asm_mv_instrcution(current_block,a_registers[0],get_register(ins.value)));
            var result = get_register(ins.value,t0);
            load_register(result,t0);
            current_block.add_instruction(new asm_mv_instrcution(current_block,a_registers[0],t0));
        }
        var inst = new asm_return_instruction(current_block);
        current_block.add_instruction(inst);
        return_instructions.add(inst);
    }
    @Override
    public void visit(ir_store_instruction ins){
        current_block.add_instruction(new asm_comment(current_block,ins.toString()));
//        current_block.add_instruction(new asm_sw_instruction(current_block,get_register(ins.value),new memory_address(get_register(ins.pointer),new imm(0))));
        var value = get_register(ins.value ,t0); // t0
        var pointer = get_register(ins.pointer,t1); // t1
        load_register(value,t0);
        load_register(pointer,t1);
        current_block.add_instruction(new asm_sw_instruction(current_block,t0,new memory_address(t1,new imm(0))));
//        store_register(value,t0);
    }
    @Override
    public void visit(ir_getelementptr_instruction ins){
        current_block.add_instruction(new asm_comment(current_block,ins.toString()));
        var ptr_tmp = get_register(ins.ptrval,t0); // t0
        var index = get_register(ins.index.get(ins.index.size()-1),t1); // t1
        var tmp1 = new virtual_register();  // t2
        var tmp2 = new virtual_register();  // t3
//        current_block.add_instruction(new asm_arith_instruction(current_block,tmp1,ptr_tmp,get_register(new ir_literal("4",new ir_type("i32"))),"*"));
//        current_block.add_instruction(new asm_arith_instruction(current_block,tmp2,index,tmp1,"+"));
//        current_block.add_instruction(new asm_mv_instrcution(current_block,get_register(ins.result),tmp2));
        load_register(ptr_tmp,t0);
        var tmp3 = get_register(new ir_literal("4",new ir_type("i32")),t1);
        current_block.add_instruction(new asm_arith_instruction(current_block,t2,t0,t1,"*"));
        load_register(index,t0);
        current_block.add_instruction(new asm_arith_instruction(current_block,t3,t0,t2,"+"));
        var result = get_register(ins.result,t0);
        current_block.add_instruction(new asm_mv_instrcution(current_block,t0,t3));
        store_register(result,t0);
    }
    @Override
    public void visit(ir_phi_instruction ins){
        var result = get_register(ins.result,t0);
        var block_ = current_block;
        // System.err.println("InstSelection.visit(IRPhiInst): " + inst.toString());
        for (var block : ins.values_blocks) {
            // System.err.println("InstSelection.visit(IRPhiInst): " + block.label);
            current_block = block_map.get(block.value.label);
            var exitInst = current_block.instructions.get(current_block.instructions.size() - 1);
            if (exitInst instanceof asm_br_instruction || exitInst instanceof asm_jump_instruction || exitInst instanceof asm_return_instruction)
                current_block.instructions.remove(exitInst);
            var key = get_register(block.key,t1);
            current_block.add_instruction(new asm_mv_instrcution(current_block, t0, t1));
            if (exitInst instanceof asm_br_instruction || exitInst instanceof asm_jump_instruction || exitInst instanceof asm_return_instruction)
                current_block.add_instruction(exitInst);
        }
        current_block = block_;
        store_register(result,t0);
    }
    @Override
    public void visit(ir_alloca_instruction ins){
        current_block.add_instruction(new asm_comment(current_block,ins.toString()));
//        current_function.stack_size += 4;
//        current_function.virtual_stack.put(get_register(ins.result),current_function.stack_size);
        var result = get_register(ins.result,t0);
        current_function.virtual_stack.put(result,current_function.stack_size);
        current_function.stack_size += 4;
        // the value of the ptr
        var tmp = new virtual_register();
        current_function.virtual_stack.put(tmp,current_function.stack_size);
        current_block.add_instruction(new asm_arithimm_instruction(current_block,t0,sp,"+",new imm(current_function.stack_size)));
        current_function.stack_size += 4;
        store_register(result,t0);

    }
    private void store_register(virtual_register vr , real_register object) {
        if(current_function.virtual_stack.containsKey(vr)){
            current_block.add_instruction(new asm_sw_instruction(current_block, object, new memory_address(sp, new imm(current_function.virtual_stack.get(vr)))));
        }
        else{
            current_function.virtual_stack.put(vr, current_function.stack_size);
            current_block.add_instruction(new asm_sw_instruction(current_block, object, new memory_address(sp, new imm(current_function.stack_size))));
            current_function.stack_size += 4;
        }
    }
    private void load_register(virtual_register vr , real_register object) {
        if(current_function.virtual_stack.containsKey(vr)){
            current_block.add_instruction(new asm_lw_instruction(current_block, object, new memory_address(sp, new imm(current_function.virtual_stack.get(vr)))));
        }
    }

}
