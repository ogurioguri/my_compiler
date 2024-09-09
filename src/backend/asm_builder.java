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
    real_register[] a_registers = null;
    real_register[] t_registers = null;
    real_register[] s_registers = null;

    public virtual_register get_register(ir_entity entity){
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
            current_block.add_instruction(new asm_li_instruction(current_block,tmp,new imm(((ir_literal) entity).value)));
            return tmp;
        }else if(entity instanceof ir_global_variable global_val){
            var tmp = new virtual_register();
            current_block.add_instruction(new asm_la_instruction(current_block,tmp,global_val.name));
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
            if (i < 8)
                current_block.add_instruction(new asm_mv_instrcution(current_block, a_registers[i], tmp));
            else
                current_block.add_instruction(new asm_lw_instruction(current_block, tmp, new memory_address(sp,new imm(4 * (i - 8)))));
            register_map.put(node.parameters.get(i).name,tmp);
        }
        for(var bb : node.body){
            bb.accept(this);
        }

        current_block = start_block;
        var move_sp_inst = new asm_arithimm_instruction(current_block, sp, sp, "+",new imm(0));
        current_block.instructions.add(0,move_sp_inst);
        current_function.move_sp_inst = move_sp_inst;

        //restore the return address
        for(var return_inst : return_instructions){
            current_block = return_inst.parent;
            int index = return_inst.parent.instructions.indexOf(return_inst);
            var back = new asm_arithimm_instruction(current_block, sp, sp, "+", new imm(0));
            current_block.instructions.add(index,back);
        }
        current_function.count = virtual_register.count;
    }

    @Override
    public void visit(global_variable_node node){
        program.val_defines.add(new asm_val_define(node.variable.name,Integer.parseInt(node.value.value)));
    }

    @Override
    public void visit(ir_stringliteral_node node){
        program.strings.add(new asm_string_literal(node.ptr.name,node.value));
    }

    @Override
    public void visit(ir_binary_instruction ins){
        current_block.add_instruction(new asm_comment(current_block,ins.toString()));
        current_block.add_instruction(new asm_arith_instruction(current_block,get_register(ins.result),get_register(ins.lhs),get_register(ins.rhs),ins.op));
    }
    @Override
    public void visit(ir_br_instruction ins){
        current_block.add_instruction(new asm_comment(current_block,ins.toString()));
        current_block.add_instruction(new asm_br_instruction(current_block,get_register(ins.condition),null,ins.parent_block.parent.name+ "_" + ins.else_block.label,"=="));
    }
    @Override
    public void visit(ir_call_instruction ins){
        current_block.add_instruction(new asm_comment(current_block,ins.toString()));
        int offset = 0;
        if(ins.parameters.size()<8){
            for(int i = 0; i < ins.parameters.size(); i++){
                current_block.add_instruction(new asm_mv_instrcution(current_block,a_registers[i],get_register(ins.parameters.get(i))));
            }
        }
        else{
            for(int i = 0; i < 8; i++){
                current_block.add_instruction(new asm_mv_instrcution(current_block,a_registers[i],get_register(ins.parameters.get(i))));
            }
            for(int i = 8; i < ins.parameters.size(); i++){
                current_block.add_instruction(new asm_sw_instruction(current_block,get_register(ins.parameters.get(i)),new memory_address(sp,new imm((-(ins.parameters.size()  - i) * 4)))));
                offset += 4;
            }
        }

        var ra_address = new memory_address(sp,new imm(current_function.stack_size));
        current_function.stack_size += 4;
        var save_ra = new asm_sw_instruction(current_block,ra,ra_address);
        current_block.add_instruction(save_ra);
        if (offset!= 0)
            current_block.add_instruction(new asm_arithimm_instruction(current_block, sp, sp, "-", new imm(offset)));
        // ? call
        var call = new asm_call_instruction(current_block, ins.function_name);
        current_block.add_instruction(call);
        // ! 恢复sp
        if (offset!=0)
            current_block.add_instruction(new asm_arithimm_instruction(current_block, sp, sp, "+", new imm(offset)));
        // ! 从a0中取出返回值
        if (ins.result != null)
            current_block.add_instruction(new asm_mv_instrcution(current_block, get_register(ins.result), a_registers[0]));

        // ! restore ra and t0-t6 and a1-a7
        var restoreRa = new asm_lw_instruction(current_block, ra, ra_address);
        current_block.add_instruction(restoreRa);

//        current_function.callerSaveRa.put(call, saveRa);
//        currentFunc.callerRestoreRa.put(call, restoreRa);

    }
    @Override
    public void visit(ir_cmp_instruction ins) {
        current_block.add_instruction(new asm_comment(current_block,ins.toString()));
        var r1 = get_register(ins.lhs);
        var r2 = get_register(ins.rhs);
        var tmp1 = new virtual_register();
        var tmp2 = new virtual_register();
        current_block.add_instruction(new asm_arith_instruction(current_block,tmp1,r1,r2,"-"));
        if(ins.op.equals(">") || ins.op.equals("!=") || ins.op.equals("==") || ins.op.equals("<")) {
            current_block.add_instruction(new asm_set_instruction(current_block, tmp2, tmp1, ins.op));
            current_block.add_instruction(new asm_mv_instrcution(current_block, get_register(ins.result), tmp2));
            return;
        }
        else if(ins.op.equals(">=")){
            var tmp3 = new virtual_register();
            var tmp4 = new virtual_register();
            current_block.add_instruction(new asm_set_instruction(current_block, tmp2, tmp1, ">"));
            current_block.add_instruction(new asm_set_instruction(current_block, tmp3, tmp1, "=="));
            current_block.add_instruction(new asm_arith_instruction(current_block,tmp4,tmp2,tmp3,"|"));
            current_block.add_instruction(new asm_mv_instrcution(current_block, get_register(ins.result), tmp4));
            return;
        }
        else if(ins.op.equals("<=")){
            var tmp3 = new virtual_register();
            var tmp4 = new virtual_register();
            current_block.add_instruction(new asm_set_instruction(current_block, tmp2, tmp1, "<"));
            current_block.add_instruction(new asm_set_instruction(current_block, tmp3, tmp1, "=="));
            current_block.add_instruction(new asm_arith_instruction(current_block,tmp4,tmp2,tmp3,"|"));
            current_block.add_instruction(new asm_mv_instrcution(current_block, get_register(ins.result), tmp4));
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
        current_block.add_instruction(new asm_lw_instruction(current_block,get_register(ins.result),new memory_address(get_register(ins.pointer),new imm((0)))));
    }
    @Override
    public void visit(ir_return_instruction ins){
        current_block.add_instruction(new asm_comment(current_block,ins.toString()));
        if(ins.value != null){
            current_block.add_instruction(new asm_mv_instrcution(current_block,a_registers[0],get_register(ins.value)));
        }
        var inst = new asm_return_instruction(current_block);
        current_block.add_instruction(inst);
        return_instructions.add(inst);
    }
    @Override
    public void visit(ir_store_instruction ins){
        current_block.add_instruction(new asm_comment(current_block,ins.toString()));
        current_block.add_instruction(new asm_sw_instruction(current_block,get_register(ins.value),new memory_address(get_register(ins.pointer),new imm(0))));
    }
    @Override
    public void visit(ir_getelementptr_instruction ins){
        current_block.add_instruction(new asm_comment(current_block,ins.toString()));
        var ptr_tmp = get_register(ins.ptrval);
        var index = get_register(ins.index.get(ins.index.size()-1));
        var tmp1 = new virtual_register();
        var tmp2 = new virtual_register();
        current_block.add_instruction(new asm_arith_instruction(current_block,tmp1,ptr_tmp,get_register(new ir_literal("4",new ir_type("i32"))),"*"));
        current_block.add_instruction(new asm_arith_instruction(current_block,tmp2,index,tmp1,"+"));
        current_block.add_instruction(new asm_mv_instrcution(current_block,get_register(ins.result),tmp2));
    }

    @Override
    public void visit(ir_phi_instruction ins){
        register result = get_register(ins.result);
        var block_ = current_block;
        // System.err.println("InstSelection.visit(IRPhiInst): " + inst.toString());
        for (var block : ins.values_blocks) {
            // System.err.println("InstSelection.visit(IRPhiInst): " + block.label);
            current_block = block_map.get(block.value.label);
            var exitInst = current_block.instructions.get(current_block.instructions.size() - 1);
            if (exitInst instanceof asm_br_instruction || exitInst instanceof asm_jump_instruction || exitInst instanceof asm_return_instruction)
                current_block.instructions.remove(exitInst);
            current_block.add_instruction(new asm_mv_instrcution(current_block, result, get_register(block.key)));
            if (exitInst instanceof asm_br_instruction || exitInst instanceof asm_jump_instruction || exitInst instanceof asm_return_instruction)
                current_block.add_instruction(exitInst);
        }
        current_block = block_;

    }
    @Override
    public void visit(ir_alloca_instruction ins){
        throw new RuntimeException("alloca error");
    }






}
