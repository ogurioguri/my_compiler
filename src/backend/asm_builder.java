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


public class asm_builder implements IR_visitor {
    asm_program program = null;
    asm_block current_block = null;
    asm_function current_function = null;
    HashMap<String, virtual_register> register_map = null;
    HashMap<String, asm_block> block_map = null;
    ArrayList<asm_return_instruction> return_instructions = null;
    real_register sp, ra;
    real_register t0, t1, t2, t3, t4;
    real_register[] a_registers = null;
    real_register[] t_registers = null;
    real_register[] s_registers = null;
    int number = 111111;
    int save_index = 0; //for call address mapping

    public void caller_begin() {
        current_block.add_instruction(new asm_comment(current_block, "caller"));
        for (int i = 0; i < 10; ++i) {
            var inst = new asm_sw_instruction(current_block, s_registers[i], new memory_address(sp, new imm(4 * i)));
            inst.add_stack = 4;
            current_block.add_instruction(inst);
        }
    }

    public void caller_end(int index) {
        current_block.add_instruction(new asm_comment(current_block, "caller"));
        for (int i = 9; i >=0; --i) {
            var inst = new asm_lw_instruction(current_block, s_registers[i], new memory_address(sp, new imm(4 * i)));
            current_block.instructions.add(index,inst);
        }
    }

    public virtual_register get_register(ir_entity entity) {
        if (entity instanceof ir_variable local_variable) {
            String name = local_variable.name;
            if (register_map.containsKey(name)) {
                return register_map.get(name);
            } else {
                var tmp = new virtual_register();
                register_map.put(name, tmp);
                return tmp;
            }
        } else if (entity instanceof ir_literal) {
            var tmp = new virtual_register();
            if ((((ir_literal) entity).value).equals("null")) {
                current_block.add_instruction(new asm_li_instruction(current_block, tmp, new imm(0)));
            } else {
                current_block.add_instruction(new asm_li_instruction(current_block, tmp, new imm(((ir_literal) entity).value)));
            }
//            if(!current_function.virtual_stack.containsKey(tmp)) {
//                current_function.virtual_stack.put(tmp, current_function.stack_size);
//                store_register(tmp, object);
//                current_function.stack_size += 4;
//            }
            return tmp;
        } else if (entity instanceof ir_global_variable global_val) {
            var tmp = new virtual_register();
            current_block.add_instruction(new asm_la_instruction(current_block, tmp, global_val.name));
            return tmp;
        } else {
            throw new RuntimeException("get_register error");
        }
    }


    public asm_builder(asm_program program) {
        this.program = program;
        register_map = new HashMap<String, virtual_register>();
        block_map = new HashMap<String, asm_block>();
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
            a_registers[i] = real_register.get_reg("a" + i);
        }
        for (int i = 0; i < 7; i++) {
            t_registers[i] = real_register.get_reg("t" + i);
        }
        for (int i = 0; i < 12; i++) {
            s_registers[i] = real_register.get_reg("s" + i);
        }
    }


    @Override
    public void visit(ir_program node) {
        for (var global_variable : node.global_variables.values()) {
            global_variable.accept(this);
        }
        for (var string_literal : node.string_literal_list) {
            string_literal.accept(this);
        }
        for (var class_node : node.class_definition_nodeHashMap.values()) {
            class_node.accept(this);
        }
        for (var function : node.function_definition_nodeHashMap.values()) {
            function.accept(this);
        }
    }

    @Override
    public void visit(basic_block node) {
        current_block = current_block.parent.add_block(node.parent.name + "_" + node.label);
        current_block.ir_block = node;
        node.first_block = current_block;
        block_map.put(node.label, current_block);
//        for(var phi : node.phi_map.values()){
//            phi.accept(this);
//        }
        for (var inst : node.instructions) {
            inst.accept(this);
        }
    }

    @Override
    public void visit(class_node node) {
    }

    @Override
    public void visit(function_node node) {
    }

    @Override
    public void visit(function_definition_node node) {
        virtual_register.reset();
        block_map = new HashMap<>();
        register_map = new HashMap<>();
        return_instructions = new ArrayList<>();
        current_block = program.add_function(node.name);
        var start_block = current_block;
        current_function = current_block.parent;
        if (!node.name.equals("main") && !node.name.equals("__init")) {
            caller_begin();
        }
        for (int i = 0; i < node.parameters.size(); ++i) {
            var tmp = new virtual_register();
            if (i < 8) {
                current_block.add_instruction(new asm_mv_instrcution(current_block, tmp, a_registers[i]));
//                current_block.add_instruction(new asm_mv_instrcution(current_block, t0, a_registers[i]));
//                store_register(tmp, t0);
            } else {
                //直接溢出到栈上？
                var inst = new asm_lw_instruction(current_block, tmp, new memory_address(sp, new imm(4 * (i - 8))));
                inst.need_final_imm = true;
                current_block.add_instruction(inst);
//                current_block.add_instruction(new asm_lw_instruction(current_block, tmp, new memory_address(sp, new imm(4 * (i - 8)))));
//                current_function.stack_size += 4;
//                store_register(tmp, t0);
            }
            register_map.put(node.parameters.get(i).name, tmp);
        }
        for (var bb : node.body) {
            bb.accept(this);
        }
        //cope with the phi instructions
        for (var block : node.body) {
            for (var phi : block.phi_map.values()) {
                phi.accept(this);
            }
        }

        current_block = start_block;
        var move_sp_inst = new asm_arithimm_instruction(current_block, sp, sp, "+", new imm(0));
        move_sp_inst.need_final_imm = true;
        move_sp_inst.neg = true;
        current_block.instructions.add(0, move_sp_inst);
        current_function.move_sp_inst = move_sp_inst;

//        if (node.parameters.size() >= 8) {
//            for (int i = 8; i < node.parameters.size(); i++) {
//                // to be change
//                ((asm_lw_instruction) (current_block.instructions.get(i * 2 + 1))).offset.offset.value += current_function.stack_size;
//            }
//        }

        //restore the return address
        for (var return_inst : return_instructions) {
            current_block = return_inst.parent;
            int index = return_inst.parent.instructions.indexOf(return_inst);

            var back = new asm_arithimm_instruction(current_block, sp, sp, "+", new imm(0));
            back.need_final_imm = true;
            current_block.instructions.add(index, back);
            if (!node.name.equals("main") && !node.name.equals("__init")) {
                caller_end(index);
            }

//            var back = new asm_arithimm_instruction(current_block, sp, sp, "+", new imm(current_function.stack_size));
//            current_block.instructions.add(index,back);
        }
        current_function.count = virtual_register.count;
    }

    @Override
    public void visit(global_variable_node node) {
        if (node.value == null || node.value.value.equals("null")) {
            program.val_defines.add(new asm_val_define(node.variable.name, 0));
        } else {
            program.val_defines.add(new asm_val_define(node.variable.name, Integer.parseInt(node.value.value)));
        }
    }

    @Override
    public void visit(ir_stringliteral_node node) {
        program.strings.add(new asm_string_literal(node.ptr.name, node.value));
    }

    @Override
    public void visit(ir_binary_instruction ins) {
        current_block.add_instruction(new asm_comment(current_block, ins.toString()));
        var lhs = get_register(ins.lhs);
        var rhs = get_register(ins.rhs);
        var result = get_register(ins.result);
//        current_block.add_instruction(new asm_arith_instruction(current_block,get_register(ins.result),get_register(ins.lhs),get_register(ins.rhs),ins.op));
        current_block.add_instruction(new asm_arith_instruction(current_block, result, lhs, rhs, ins.op));
    }

    @Override
    public void visit(ir_br_instruction ins) {
        current_block.add_instruction(new asm_comment(current_block, ins.toString()));
        current_block.add_instruction(new asm_br_instruction(current_block, get_register(ins.condition), null, ins.parent_block.parent.name + "_" + ins.else_block.label, "=="));
//        int index = current_function.body.indexOf(current_block);
//        var name = ins.parent_block.parent.name + "_" + "jump" + jump_number;
//        var new_block = new asm_block(name, current_function);
//        jump_number++;
//        new_block.add_instruction(new asm_jump_instruction(new_block, ins.parent_block.parent.name + "_" + ins.else_block.label));
//        current_function.body.add(index + 1, new_block);
//        current_block.add_instruction(new asm_br_instruction(current_block, t0, null, name, "=="));
//        current_block.add_instruction(new asm_jump_instruction(current_block, ins.parent_block.parent.name + "_" + ins.then_block.label));

    }

    public void callee_begin() {
        var inst = new asm_sw_instruction(current_block, ra, new memory_address(sp, new imm(0)));
        inst.save_address_index = save_index;
        inst.add_stack = 4;
        inst.need_imm = true;
        current_block.add_instruction(inst);
        inst = new asm_sw_instruction(current_block, t0, new memory_address(sp, new imm(0)));
        inst.add_stack = 4;
        inst.need_imm = true;
        current_block.add_instruction(inst);
        inst = new asm_sw_instruction(current_block, t1, new memory_address(sp, new imm(0)));
        inst.add_stack = 4;
        inst.need_imm = true;
        current_block.add_instruction(inst);
        inst = new asm_sw_instruction(current_block, t2, new memory_address(sp, new imm(0)));
        inst.add_stack = 4;
        inst.need_imm = true;
        current_block.add_instruction(inst);
        inst = new asm_sw_instruction(current_block, t3, new memory_address(sp, new imm(0)));
        inst.add_stack = 4;
        inst.need_imm = true;
        current_block.add_instruction(inst);
        inst = new asm_sw_instruction(current_block, t4, new memory_address(sp, new imm(0)));
        inst.add_stack = 4;
        inst.need_imm = true;
        current_block.add_instruction(inst);
        inst = new asm_sw_instruction(current_block, real_register.get_reg("t5"), new memory_address(sp, new imm(0)));
        inst.add_stack = 4;
        inst.need_imm = true;
        current_block.add_instruction(inst);
        inst = new asm_sw_instruction(current_block, real_register.get_reg("t6"), new memory_address(sp, new imm(0)));
        inst.add_stack = 4;
        inst.need_imm = true;
        current_block.add_instruction(inst);
    }

    public void callee_end() {
        var inst = new asm_lw_instruction(current_block, ra, new memory_address(sp, new imm(-32)));
        inst.save_address_index = save_index;
        inst.need_imm = true;
        current_block.add_instruction(inst);
        inst = new asm_lw_instruction(current_block, t0, new memory_address(sp, new imm(-28)));
        inst.save_address_index = save_index;
        inst.need_imm = true;
        current_block.add_instruction(inst);
        inst = new asm_lw_instruction(current_block, t1, new memory_address(sp, new imm(-24)));
        inst.save_address_index = save_index;
        inst.need_imm = true;
        current_block.add_instruction(inst);
        inst = new asm_lw_instruction(current_block, t2, new memory_address(sp, new imm(-20)));
        inst.save_address_index = save_index;
        inst.need_imm = true;
        current_block.add_instruction(inst);
        inst = new asm_lw_instruction(current_block, t3, new memory_address(sp, new imm(-16)));
        inst.save_address_index = save_index;
        inst.need_imm = true;
        current_block.add_instruction(inst);
        inst = new asm_lw_instruction(current_block, t4, new memory_address(sp, new imm(-12)));
        inst.save_address_index = save_index;
        inst.need_imm = true;
        current_block.add_instruction(inst);
        inst = new asm_lw_instruction(current_block, real_register.get_reg("t5"), new memory_address(sp, new imm(-8)));
        inst.save_address_index = save_index;
        inst.need_imm = true;
        current_block.add_instruction(inst);
        inst = new asm_lw_instruction(current_block, real_register.get_reg("t6"), new memory_address(sp, new imm(-4)));
        inst.save_address_index = save_index;
        inst.need_imm = true;
        current_block.add_instruction(inst);
    }

    @Override
    public void visit(ir_call_instruction ins) {
        current_block.add_instruction(new asm_comment(current_block, ins.toString()));
        int offset = 0;
        if (ins.parameters.size() <= 8) {
            for (int i = 0; i < ins.parameters.size(); i++) {
//                current_block.add_instruction(new asm_mv_instrcution(current_block,a_registers[i],get_register(ins.parameters.get(i))));
                var tmp = get_register(ins.parameters.get(i));
                current_block.add_instruction(new asm_mv_instrcution(current_block, a_registers[i], tmp));
            }
        } else {
            for (int i = 0; i < 8; i++) {
                var tmp = get_register(ins.parameters.get(i));
                current_block.add_instruction(new asm_mv_instrcution(current_block, a_registers[i], tmp));
//                load_register(tmp, t0);
//                current_block.add_instruction(new asm_mv_instrcution(current_block, a_registers[i], t0));

            }
            for (int i = 8; i < ins.parameters.size(); i++) {
                var object = get_register(ins.parameters.get(i));
                current_block.add_instruction(new asm_sw_instruction(current_block, object, new memory_address(sp, new imm((-(ins.parameters.size() - i) * 4)))));
//                if (-(ins.parameters.size() - i) * 4 < -2048 || -(ins.parameters.size() - i) * 4 > 2047) {
//                    if (number != -(ins.parameters.size() - i) * 4) {
//                        current_block.add_instruction(new asm_li_instruction(current_block, t4, new imm((-(ins.parameters.size() - i) * 4))));
//                        current_block.add_instruction(new asm_arith_instruction(current_block, t4, sp, t4, "+"));
//                        number = -(ins.parameters.size() - i) * 4;
//                    }
//                    current_block.add_instruction(new asm_sw_instruction(current_block, t0, new memory_address(t4, new imm(0))));
//                } else {
//                    current_block.add_instruction(new asm_sw_instruction(current_block, t0, new memory_address(sp, new imm((-(ins.parameters.size() - i) * 4)))));
//                }
                offset += 4;
            }
        }
        callee_begin();

//        current_function.stack_size += 24;
//        var save_ra = new asm_sw_instruction(current_block,ra,ra_address);
//        current_block.add_instruction(save_ra);
        if (offset != 0)
            current_block.add_instruction(new asm_arithimm_instruction(current_block, sp, sp, "+", new imm(-offset)));
        // ? call
        var call = new asm_call_instruction(current_block, ins.function_name);
        current_block.add_instruction(call);


        // ! 恢复sp
        if (offset != 0)
            current_block.add_instruction(new asm_arithimm_instruction(current_block, sp, sp, "+", new imm(offset)));
        // ! 从a0中取出返回值
        callee_end();
        if (ins.result != null) {
            var result = get_register(ins.result);
//            current_block.add_instruction(new asm_mv_instrcution(current_block, result, a_registers[0]));
            current_block.add_instruction(new asm_mv_instrcution(current_block, result, a_registers[0]));
        }

        // ! restore ra and t0-t6 and a1-a7

//        if (address + 20 < -2048 || address + 20 > 2047) {
//
//            current_block.add_instruction(new asm_li_instruction(current_block, t4, new imm(address)));
//            number = address;
//            current_block.add_instruction(new asm_arith_instruction(current_block, t4, sp, t4, "+"));
//
////            current_block.add_instruction(new asm_li_instruction(current_block,t4,new imm(address)));
//            current_block.add_instruction(new asm_lw_instruction(current_block, ra, new memory_address(t4, new imm(0))));
//            current_block.add_instruction(new asm_lw_instruction(current_block, t0, new memory_address(t4, new imm(4))));
//            current_block.add_instruction(new asm_lw_instruction(current_block, t1, new memory_address(t4, new imm(8))));
//            current_block.add_instruction(new asm_lw_instruction(current_block, t2, new memory_address(t4, new imm(12))));
//            current_block.add_instruction(new asm_lw_instruction(current_block, t3, new memory_address(t4, new imm(16))));
//
//        } else {
//            current_block.add_instruction(new asm_lw_instruction(current_block, ra, new memory_address(sp, new imm(address))));
//            current_block.add_instruction(new asm_lw_instruction(current_block, t0, new memory_address(sp, new imm(address + 4))));
//            current_block.add_instruction(new asm_lw_instruction(current_block, t1, new memory_address(sp, new imm(address + 8))));
//            current_block.add_instruction(new asm_lw_instruction(current_block, t2, new memory_address(sp, new imm(address + 12))));
//            current_block.add_instruction(new asm_lw_instruction(current_block, t3, new memory_address(sp, new imm(address + 16))));
//
//        }

    }

    @Override
    public void visit(ir_cmp_instruction ins) {
        current_block.add_instruction(new asm_comment(current_block, ins.toString()));
        var r1 = get_register(ins.lhs);  // t1
        var r2 = get_register(ins.rhs); // t2
        var tmp1 = new virtual_register(); // t0
        var tmp2 = new virtual_register(); // t3
        current_block.add_instruction(new asm_arith_instruction(current_block, tmp1, r1, r2, "-"));
//        current_block.add_instruction(new asm_arith_instruction(current_block, t0, t1, t2, "-"));
        if (ins.op.equals(">") || ins.op.equals("!=") || ins.op.equals("==") || ins.op.equals("<")) {
//            current_block.add_instruction(new asm_set_instruction(current_block, tmp2, tmp1, ins.op));
            current_block.add_instruction(new asm_set_instruction(current_block, tmp2, tmp1, ins.op));
            current_block.add_instruction(new asm_mv_instrcution(current_block, get_register(ins.result), tmp2));
//            var result = get_register(ins.result, t0);// new t0
//            current_block.add_instruction(new asm_mv_instrcution(current_block, t0, t3));
//            store_register(result, t0);
            return;
        } else if (ins.op.equals(">=")) {
            var tmp3 = new virtual_register();
            var tmp4 = new virtual_register();
            current_block.add_instruction(new asm_set_instruction(current_block, tmp2, tmp1, ">"));
            current_block.add_instruction(new asm_set_instruction(current_block, tmp3, tmp1, "=="));
            current_block.add_instruction(new asm_arith_instruction(current_block, tmp4, tmp2, tmp3, "|"));
            current_block.add_instruction(new asm_mv_instrcution(current_block, get_register(ins.result), tmp4));
            //tmp2 = t3 , tmp3 = t1 , tmp4 = t2
            return;
        } else if (ins.op.equals("<=")) {
            var tmp3 = new virtual_register();
            var tmp4 = new virtual_register();
            current_block.add_instruction(new asm_set_instruction(current_block, tmp2, tmp1, "<"));
            current_block.add_instruction(new asm_set_instruction(current_block, tmp3, tmp1, "=="));
            current_block.add_instruction(new asm_arith_instruction(current_block, tmp4, tmp2, tmp3, "|"));
            current_block.add_instruction(new asm_mv_instrcution(current_block, get_register(ins.result), tmp4));
            //tmp2 = t3 , tmp3 = t1 , tmp4 = t2
            return;
        }
        throw new RuntimeException("cmp error");
    }

    @Override
    public void visit(ir_uncond_br ins) {
        current_block.add_instruction(new asm_comment(current_block, ins.toString()));
        current_block.add_instruction(new asm_jump_instruction(current_block, ins.parent_block.parent.name + "_" + ins.dest.label));
    }

    @Override
    public void visit(ir_load_instruction ins) {
        current_block.add_instruction(new asm_comment(current_block, ins.toString()));
        current_block.add_instruction(new asm_lw_instruction(current_block, get_register(ins.result), new memory_address(get_register(ins.pointer), new imm((0)))));
//        var result = get_register(ins.result); // t0
//        var pointer = get_register(ins.pointer); // t1
//        load_register(pointer, t1);
//        current_block.add_instruction(new asm_lw_instruction(current_block, t0, new memory_address(t1, new imm((0)))));
//        store_register(result, t0);
    }

    @Override
    public void visit(ir_return_instruction ins) {
        current_block.add_instruction(new asm_comment(current_block, ins.toString()));
        if (ins.value != null) {
            current_block.add_instruction(new asm_mv_instrcution(current_block, a_registers[0], get_register(ins.value)));
        }
        var inst = new asm_return_instruction(current_block);
        current_block.add_instruction(inst);
        return_instructions.add(inst);
    }


    @Override
    public void visit(ir_store_instruction ins) {
        current_block.add_instruction(new asm_comment(current_block, ins.toString()));
        current_block.add_instruction(new asm_sw_instruction(current_block, get_register(ins.value), new memory_address(get_register(ins.pointer), new imm(0))));
//        var value = get_register(ins.value, t0); // t0
//        var pointer = get_register(ins.pointer, t1); // t1
//        load_register(value, t0);
//        load_register(pointer, t1);
//        current_block.add_instruction(new asm_sw_instruction(current_block, t0, new memory_address(t1, new imm(0))));

//        store_register(value,t0);
    }

    @Override
    public void visit(ir_getelementptr_instruction ins) {
        current_block.add_instruction(new asm_comment(current_block, ins.toString()));
        var ptr_tmp = get_register(ins.ptrval); // t0
        var index = get_register(ins.index.get(ins.index.size() - 1)); // t1
        var tmp1 = new virtual_register();  // t2
        var tmp2 = new virtual_register();  // t3
        current_block.add_instruction(new asm_arith_instruction(current_block, tmp1, index, get_register(new ir_literal("4", new ir_type("i32"))), "*"));
        current_block.add_instruction(new asm_arith_instruction(current_block, tmp2, ptr_tmp, tmp1, "+"));
        current_block.add_instruction(new asm_mv_instrcution(current_block, get_register(ins.result), tmp2));
//        load_register(index, t0);
//        var tmp3 = get_register(new ir_literal("4", new ir_type("i32")), t1);
//        current_block.add_instruction(new asm_arith_instruction(current_block, t2, t0, t1, "*"));
//        load_register(ptr_tmp, t0);
//        current_block.add_instruction(new asm_arith_instruction(current_block, t3, t0, t2, "+"));
//        var result = get_register(ins.result, t0);
//        current_block.add_instruction(new asm_mv_instrcution(current_block, t0, t3));
//        store_register(result, t0);
    }


    @Override
    public void visit(ir_phi_instruction ins) {
        var result = get_register(ins.result);
        var block_ = current_block;
        // System.err.println("InstSelection.visit(IRPhiInst): " + inst.toString());
        for (var block : ins.block_map.keySet()) {
            current_block = block_map.get(block.label);
            var exitInst = current_block.instructions.get(current_block.instructions.size() - 1);
            if (exitInst instanceof asm_br_instruction || exitInst instanceof asm_jump_instruction || exitInst instanceof asm_return_instruction)
                current_block.instructions.remove(exitInst);
            var key = get_register(ins.block_map.get(block));
            current_block.add_instruction(new asm_mv_instrcution(current_block, result, key));
            if (exitInst instanceof asm_br_instruction || exitInst instanceof asm_jump_instruction || exitInst instanceof asm_return_instruction)
                current_block.add_instruction(exitInst);
        }
        current_block = block_;
    }

    @Override
    public void visit(ir_alloca_instruction ins) {
//        current_block.add_instruction(new asm_comment(current_block, ins.toString()));
////        current_function.stack_size += 4;
////        current_function.virtual_stack.put(get_register(ins.result),current_function.stack_size);
//        var result = get_register(ins.result, t0);
//        current_function.virtual_stack.put(result, current_function.stack_size);
//        current_function.stack_size += 4;
//        // the value of the ptr
//        var tmp = new virtual_register();
//        current_function.virtual_stack.put(tmp, current_function.stack_size);
//        current_block.add_instruction(new asm_arithimm_instruction(current_block, t0, sp, "+", new imm(current_function.stack_size)));
//        current_function.stack_size += 4;
//        store_register(result, t0);
        throw new RuntimeException("alloca error");

    }

    private void store_register(virtual_register vr, real_register object) {
        if (current_function.virtual_stack.containsKey(vr)) {
            var address = current_function.virtual_stack.get(vr);
            if (address < -2048 || address > 2047) {
                if (number != address) {
                    current_block.add_instruction(new asm_li_instruction(current_block, t4, new imm(address)));
                    number = address;
                    current_block.add_instruction(new asm_arith_instruction(current_block, t4, sp, t4, "+"));
                }
//                current_block.add_instruction(new asm_li_instruction(current_block,t4,new imm(address)));
                current_block.add_instruction(new asm_sw_instruction(current_block, object, new memory_address(t4, new imm(0))));
            } else {
                current_block.add_instruction(new asm_sw_instruction(current_block, object, new memory_address(sp, new imm(address))));
            }
        } else {
            current_function.virtual_stack.put(vr, current_function.stack_size);
            if (current_function.stack_size < -2048 || current_function.stack_size > 2047) {
                if (number != current_function.stack_size) {
                    current_block.add_instruction(new asm_li_instruction(current_block, t4, new imm(current_function.stack_size)));
                    number = current_function.stack_size;
                    current_block.add_instruction(new asm_arith_instruction(current_block, t4, sp, t4, "+"));
                }
//                current_block.add_instruction(new asm_li_instruction(current_block,t4,new imm(current_function.stack_size)));
                current_block.add_instruction(new asm_sw_instruction(current_block, object, new memory_address(t4, new imm(0))));
            } else {
                current_block.add_instruction(new asm_sw_instruction(current_block, object, new memory_address(sp, new imm(current_function.stack_size))));
            }
//            current_block.add_instruction(new asm_sw_instruction(current_block, object, new memory_address(sp, new imm(current_function.stack_size))));
            current_function.stack_size += 4;
        }
    }

    private void load_register(virtual_register vr, real_register object) {
        if (current_function.virtual_stack.containsKey(vr)) {
            var address = current_function.virtual_stack.get(vr);
            if (address < -2048 || address > 2047) {
                if (number != address) {
                    current_block.add_instruction(new asm_li_instruction(current_block, t4, new imm(address)));
                    number = address;
                    current_block.add_instruction(new asm_arith_instruction(current_block, t4, sp, t4, "+"));
                }
                current_block.add_instruction(new asm_lw_instruction(current_block, object, new memory_address(t4, new imm(0))));
            } else {
                current_block.add_instruction(new asm_lw_instruction(current_block, object, new memory_address(sp, new imm(address))));
            }
//            current_block.add_instruction(new asm_lw_instruction(current_block, object, new memory_address(sp, new imm(current_function.virtual_stack.get(vr)))));
        }
    }
}
