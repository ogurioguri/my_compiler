package IR;

import IR.entity.ir_entity;
import IR.entity.ir_variable;
import IR.instruction.*;
import IR.node.class_node;
import ast.ast_visitor;
import ast.*;
import ast.expression.*;
import ast.statement.*;
import ast.type.*;
import util.member_struct.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import IR.entity.*;
import ast.primary.*;

import IR.type.*;
import IR.node.*;
import util.scope;


public class IRBuilder implements ast_visitor {
    public ir_scope current = null;
    public scope global = null;
    public IR.ir_program ir_program = null;
    public basic_block current_block = null;
    public HashMap<String, Integer> variable_number = null;
    public ir_entity current_entity = null;
    public ir_entity current_ptr = null;
    public function_node now_function = null;
    public HashMap<String,Integer> global_index = new HashMap<>();



    public IRBuilder(scope global, IR.ir_program ir_ir_program_) {
        this.global = global;
        this.ir_program = ir_ir_program_;
        variable_number = new HashMap<>();
    }

    public ir_literal init_value(ir_type node){
        if(node.is_int){
            return new ir_literal("0", node);
        }
        else if(node.is_void){
            return new ir_literal("null", node);
        }
        else{
            return new ir_literal("null", node);
        }
    }

    // for the variable number which has been defined
    public int get_index(String name) {
//        if (current != null && current.variable_number.containsKey(name)) {
//            return current.variable_number.get(name);
//        } else {
//            if (current != null && current.parent != null && current.parent.variable_number.get(name)!=null) {
//                return current.parent.variable_number.get(name);
//            } else {
//                return variable_number.get(name);
//            }
//        }
        ir_scope copy = current;
        while(copy != null){
            if(copy.variable_number.get(name) != null){
                return copy.variable_number.get(name);
            }
            copy = copy.parent;
        }
        return global_index.get(name);
    }

    // for the variable number which has not been defined
    public int get_new_index(String name) {
        if (variable_number.containsKey(name)) {
            variable_number.put(name, variable_number.get(name) + 1);
            if(current != null){
                current.variable_number.put(name, variable_number.get(name));
            }
            return variable_number.get(name);
        } else {
            variable_number.put(name, 0);
            if(current ==null){
                global_index.put(name,0);
            }
            if(current != null){
                current.variable_number.put(name,0);
            }
            return 0;
        }
    }

    public int get_size(String name) {
        if(name.equals("int")){
            return 4;
        }
        else if(name.equals("bool")){
            return 4;
        }
        else if(name.equals("ptr")){
            return 4;
        }
        else{
            return ir_program.class_definition_nodeHashMap.get(name).size;
        }
    }


    @Override
    public void visit(program_node node) {
        for (var def : node.children) {
            if(def instanceof class_defination_node){
                add_class((class_defination_node) def);
            }
        }
        for (var def : node.children) {
            def.accept(this);
        }
        // the __init function is wait to be added
        if(ir_program.function_definition_nodeHashMap.get("__init") != null){
           var function = ir_program.function_definition_nodeHashMap.get("__init");
           for(var block : function.body){
               block.parent = function;
           }
           current_block = function.body.get(function.body.size() - 1);
           current_block.add_instruction(new ir_return_instruction(current_block, null));
           current_block = ir_program.function_definition_nodeHashMap.get("main").body.get(0);
           current_block.instructions.add(0,(new ir_call_instruction(current_block, null, "__init", new ArrayList<>())));
        }
        current_block = ir_program.function_definition_nodeHashMap.get("main").body.get(ir_program.function_definition_nodeHashMap.get("main").body.size() - 1);
        if(current_block.instructions.isEmpty() || !(current_block.instructions.get(current_block.instructions.size() - 1) instanceof ir_return_instruction)){
            current_block.add_instruction(new ir_return_instruction(current_block, new ir_literal("0", new ir_type("i32"))));
        }

    }

    private void add_class(class_defination_node node){
        int total_size = 0;
        ArrayList<ir_type> type_list = new ArrayList<>();
        ArrayList<String> name_list = new ArrayList<>();
        HashMap<String, Integer> name_index = new HashMap<>();
        int i = 0;
        for (var member : node.val_declaration_list) {
            for (var name : member.name_expression_map.keySet()) {
                name_list.add(name);
                type_list.add(new ir_type(member.type));
                name_index.put(name, i++);
                if(member.type.dimension == 0){
                    total_size += 4;
                }
                else{
                    total_size += 8; //array pointer is size + address
                }
            }
        }
        ir_program.class_definition_nodeHashMap.put(node.class_name, new class_node(node.class_name, type_list, name_list, name_index));
        ir_program.class_definition_nodeHashMap.get(node.class_name).size = total_size;
//        current = new ir_scope(current);
    }

    @Override
    public void visit(class_defination_node node) {
//        int total_size = 0;
//        ArrayList<ir_type> type_list = new ArrayList<>();
//        ArrayList<String> name_list = new ArrayList<>();
//        HashMap<String, Integer> name_index = new HashMap<>();
//        int i = 0;
        current = new ir_scope(current);
//        for (var member : node.val_declaration_list) {
//            for (var name : member.name_expression_map.keySet()) {
//                int index = get_new_index(name);
//                name_list.add(name);
//                type_list.add(new ir_type(member.type));
//                name_index.put(name, i++);
//                if(member.type.dimension == 0){
//                    total_size += 4;
//                }
//                else{
//                    total_size += 8; //array pointer is size + address
//                }
//            }
//        }
//        ir_program.class_definition_nodeHashMap.put(node.class_name, new class_node(node.class_name, type_list, name_list, name_index));
//        ir_program.class_definition_nodeHashMap.get(node.class_name).size = total_size;
//        current = new ir_scope(current);
        current.class_name = node.class_name;
        // add the variable this

        int class_index = get_new_index("this");
        current.variable_number.put("this", class_index);

        for (var func : node.func_defination_list) {
            func.accept(this);
        }
        if (node.class_build != null) {
            node.class_build.accept(this);
        }
        current = null;
    }

    @Override
    public void visit(class_construction node) {
        var init_function = new function_definition_node(current.class_name + "." + node.name, new ir_type("void"), new ArrayList<>());
        String now_name = "this." + get_new_index("this");
        int index = get_new_index("this");
        String new_name = "this." + index;
        //引用传递
        init_function.parameters.add(new ir_variable(now_name, new ir_type("ptr")));
        // named the class_construction function
        ir_program.function_definition_nodeHashMap.put(current.class_name + "." + node.name, init_function);
        current = new ir_scope(current);
        current.variable_number.put("this", index);
        current_block = init_function.body.get(0);
        var new_ptr = new ir_variable(new_name, new ir_type("ptr"));
        current_block.add_instruction(new ir_alloca_instruction(current_block, new_ptr, new ir_type("ptr")));
        current_block.add_instruction(new ir_store_instruction(current_block, new ir_variable(now_name, new ir_type("ptr")), new_ptr));
        for (var statement : node.class_block.statements_list) {
            statement.accept(this);
        }
        current_block.add_instruction(new ir_return_instruction(current_block, null));
        current = current.parent;
        current_block = null;
    }

    @Override
    public void visit(function_def node) {
        var new_function = new function_definition_node(node.name, new ir_type(node.return_type), new ArrayList<>());
        if(current != null && current.class_name != null){
            new_function.name = current.class_name + "." + node.name;
        }
        ir_program.function_definition_nodeHashMap.put(node.name, new_function);
        current = new ir_scope(current);
        if(current_block != null){
            current_block.parent = new_function;
        }
        current_block = new_function.body.get(0);
        if((node.parameter_list != null)){
            node.parameter_list.accept(this);
        }
        if(current != null && current.class_name != null){
            int class_index = get_new_index("this");
            String old = "this." + class_index;
            new_function.parameters.add(0,new ir_variable(old, new ir_type("ptr")));
            String new_name = "this." + get_new_index("this");
            current_block.add_instruction(new ir_alloca_instruction(current_block, new ir_variable(new_name, new ir_type("ptr")), new ir_type("ptr")));
            current_block.add_instruction(new ir_store_instruction(current_block, new ir_variable(old, new ir_type("ptr")), new ir_variable(new_name, new ir_type("ptr"))));
            current_entity = new ir_variable(new_name, new ir_type("ptr"));
        }
        for (var statement : node.body.statements_list) {
            statement.accept(this);
        }
        if((current_block.instructions.isEmpty() || !(current_block.instructions.get(current_block.instructions.size() - 1) instanceof ir_return_instruction))){
            if(node.return_type.is_void ){
                current_block.add_instruction(new ir_return_instruction(current_block, null));
            }
            else if(node.return_type.is_int){
                current_block.add_instruction(new ir_return_instruction(current_block, new ir_literal("0", new ir_type("i32"))));
            }
            else if(node.return_type.is_bool){
                current_block.add_instruction(new ir_return_instruction(current_block, new ir_literal("0", new ir_type("i1"))));
            }
            else{
                current_block.add_instruction(new ir_return_instruction(current_block, null));
            }
        }
        for(var block : new_function.body){
            block.parent = new_function;
        }

        current = current.parent;
        current_block = null;

    }

    @Override
    public void visit(parameterlist_node node) {
        var function = current_block.parent;


//        if (current.class_name != null) {
//            int class_index = get_new_index("this");
//            String class_name = "this." + class_index;
//            function.parameters.add(new ir_variable(class_name, new ir_type("ptr")));
//            current.variable_number.put("this", class_index);
//        }

        //add_instruction the parameters to the function
        for (var name : node.name_list) {
            String now_name = name;
            function.parameters.add(new ir_variable(now_name, new ir_type(node.type_name_map.get(name))));
            current.variable_number.put(name, null);
        }

        for (var entity : function.parameters) {
            int new_index = get_new_index(entity.name);
            current.variable_number.put(entity.name, new_index);
            ir_variable old_entity = new ir_variable(entity.name, entity.type);
            function.parameters.set(function.parameters.indexOf(entity), old_entity);
            ir_variable new_entity = new ir_variable(entity.name + "." + new_index, new ir_type("ptr"));
            current_block.add_instruction(new ir_alloca_instruction(current_block, new_entity, entity.type));
            current_block.add_instruction(new ir_store_instruction(current_block, old_entity, new_entity));
        }

    }

    @Override
    public void visit(val_declaration_node node) {
        if (current == null) {
            for (var name : node.name_expression_map.keySet()) {
                int index = get_new_index(name);
                ir_global_variable new_global = new ir_global_variable(name + "." + index,new ir_type(node.type));
                if (node.name_expression_map.get(name) == null) {
                    if(node.type.dimension == 0 && (node.type.is_int || node.type.is_bool)){
                        ir_program.global_variables.put(name + "." + index, new global_variable_node(new_global, new ir_literal("0", new ir_type("i32"))));
                        global_index.put(name, index);
                    }
                    else {
                        ir_program.global_variables.put(name + "." + index, new global_variable_node(new_global, new ir_literal("null", new ir_type("ptr"))));
                        global_index.put(name, index);
                        continue;
                    }
                } else {
                    if (node.name_expression_map.get(name) instanceof primary_expression && ((primary_expression) node.name_expression_map.get(name)).primary_content.is_constant) {
                        constant content = (constant) (((primary_expression) node.name_expression_map.get(name)).primary_content);
                        if (content.is_int || content.is_bool || content.is_null) {
                            if (content.is_int) {
                                ir_program.global_variables.put(name + "." + index, new global_variable_node(new_global, new ir_literal(String.valueOf(((Integer_literal) content).value), new ir_type("i32"))));
                                global_index.put(name, index);
                                continue;
                            } else if (content.is_bool) {
                                ir_program.global_variables.put(name + "." + index, new global_variable_node(new_global, new ir_literal(String.valueOf(((Bool) content).value), new ir_type("i1"))));
                                global_index.put(name, index);
                                continue;
                            } else {
                                ir_program.global_variables.put(name + "." + index, new global_variable_node(new_global, new ir_literal("null", new ir_type("ptr"))));
                                global_index.put(name, index);
                                continue;
                            }
                        }
                        else if(node.type.is_string){
                            new_global = new ir_global_variable("_string." + get_new_index("_string"));
                            StringBuilder string = new StringBuilder();
                            for (int i = 0; i < ((string_literal)content).value.length(); i++) {
                                char c =((string_literal)content).value.charAt(i);
                                if (c == '\\') {
                                    i++;
                                    c = ((string_literal)content).value.charAt(i);
                                    if (c == 'n') {
                                        string.append("\n");
                                    } else if (c == '\\') {
                                        string.append("\\");
                                    } else if (c == '\"') {
                                        string.append("\"");
                                    }
                                } else {
                                    string.append(c);
                                }
                            }
                            ir_program.string_literal_list.add(new ir_stringliteral_node(new_global, string.toString(), ((string_literal)content).value));
                            var this_ = new ir_global_variable(name + "." + index);
                            ir_program.global_variables.put(name + "." + index, new global_variable_node(this_, null));
                            if (!ir_program.function_definition_nodeHashMap.containsKey("__init")) {
                                var init_function = new function_definition_node("__init", new ir_type("void"), new ArrayList<>());
                                ir_program.function_definition_nodeHashMap.put("__init", init_function);
                            }
                            var function = ir_program.function_definition_nodeHashMap.get("__init");
                            current_block = function.body.get(function.body.size() - 1);
                            current_block.parent = function;
                            current_block.add_instruction(new ir_store_instruction(current_block, new_global, this_));
                            global_index.put(name, index);
                            continue;
                        }
                    } else {
                        if (!ir_program.function_definition_nodeHashMap.containsKey("__init")) {
                            var init_function = new function_definition_node("__init", new ir_type("void"), new ArrayList<>());
                            ir_program.function_definition_nodeHashMap.put("__init", init_function);
                        }
                        ir_program.global_variables.put(name + "." + index, new global_variable_node(new_global, init_value(new ir_type(node.type))));
                        global_index.put(name, index);
                        var function = ir_program.function_definition_nodeHashMap.get("__init");
                        current_block = function.body.get(function.body.size() - 1);
                        current_block.parent = function;
                        node.name_expression_map.get(name).accept(this);
                        current_block.add_instruction(new ir_store_instruction(current_block, current_entity, new_global));
                    }
                }
            }
        }
        //local
        else {
            for (var name : node.name_expression_map.keySet()) {
                int index = get_new_index(name);
                current.variable_number.put(name, index);
                ir_variable new_variable = new ir_variable(name + "." + index, new ir_type("ptr"));
                //the alloca instruction
                current_block.add_instruction(new ir_alloca_instruction(current_block, new_variable, new ir_type(node.type)));
                if (node.name_expression_map.get(name) != null) {
                    node.name_expression_map.get(name).accept(this);
                    current_block.add_instruction(new ir_store_instruction(current_block, current_entity, new_variable));
                }
            }

        }
    }

    @Override
    public void visit(block_statement node) {
        current = new ir_scope(current);
        for (var statement : node.statements_list) {
            statement.accept(this);
        }
        current = current.parent;
    }


    @Override
    public void visit(if_statement node) {
        if(node.pos.row() == 83){
            int c =0;
        }
        node.condition.accept(this);
        int index = get_new_index("if");
        basic_block then_block = new basic_block("if.then" + index, current_block.parent, current_block.loop_depth);
        basic_block else_block = new basic_block("if.else" + index, current_block.parent, current_block.loop_depth);
        basic_block merge_block = new basic_block("if.merge" + index, current_block.parent, current_block.loop_depth);
        if (node.else_body != null) {
            current_block.add_instruction(new ir_br_instruction(current_block, current_entity, then_block, else_block));
        } else {
            current_block.add_instruction(new ir_br_instruction(current_block, current_entity, then_block, merge_block));
        }
        current_block.parent.body.add(then_block);
        current_block = then_block;
        current = new ir_scope(current);
        node.then_body.accept(this);
        current_block.add_instruction(new ir_uncond_br(current_block, merge_block));
        current = current.parent;
        if (node.else_body != null) {
            current = new ir_scope(current);
//            current.merge_block = merge_block;
            current.cond_block = else_block;
            current_block.parent.body.add(else_block);
            current_block = else_block;
            node.else_body.accept(this);
            current_block.add_instruction(new ir_uncond_br(current_block, merge_block));
            current = current.parent;
        }
        current_block.parent.body.add(merge_block);
        current_block = merge_block;
    }


    @Override
    public void visit(while_statement node) {
//        current = new ir_scope(current);
//        current.loop_depth++;
        int index = get_new_index("while");
        basic_block cond_block = new basic_block("while.cond" + index, current_block.parent, current_block.loop_depth + 1);
        basic_block body_block = new basic_block("while.body" + index, current_block.parent, current_block.loop_depth + 1);
        basic_block merge_block = new basic_block("while.merge" + index, current_block.parent, current_block.loop_depth);
        current_block.add_instruction(new ir_uncond_br(current_block, cond_block));
        current_block.parent.body.add(cond_block);
//        current = new ir_scope(current);
        current_block = cond_block;
        node.condition.accept(this);
        current_block.add_instruction(new ir_br_instruction(current_block, current_entity, body_block, merge_block));
        current_block.parent.body.add(body_block);
        current_block = body_block;
        current = new ir_scope(current);
        current.loop_depth++;
        current.cond_block = cond_block;
        current.merge_block = merge_block;
        if (node.body != null) {
            node.body.accept(this);
        }
        current_block.add_instruction(new ir_uncond_br(current_block, cond_block));
        current = current.parent;
        current_block.parent.body.add(merge_block);
        current_block = merge_block;
    }


    @Override
    public void visit(for_statement node) {
        current = new ir_scope(current);
        current.loop_depth++;
        int index = get_new_index("for");
        basic_block cond_block = new basic_block("for.cond" + index, current_block.parent, current_block.loop_depth);
        basic_block body_block = new basic_block("for.body" + index, current_block.parent, current_block.loop_depth);
        basic_block step_block = new basic_block("for.step" + index, current_block.parent, current_block.loop_depth);
        basic_block merge_block = new basic_block("for.merge" + index, current_block.parent, current_block.loop_depth - 1);
        current.merge_block = merge_block;
        current.cond_block = step_block;
        if (node.init != null) {
            node.init.accept(this);
        }
        current_block.add_instruction(new ir_uncond_br(current_block, cond_block));
        current_block.parent.body.add(cond_block);
        current_block = cond_block;
        if (node.condition != null) {
            node.condition.accept(this);
            current_block.add_instruction(new ir_br_instruction(current_block, current_entity, body_block, merge_block));
        } else {
            current_block.add_instruction(new ir_uncond_br(current_block, body_block));
        }
        current_block.parent.body.add(body_block);
        current_block = body_block;
        if (node.body != null) {
            node.body.accept(this);
        }
        current_block.add_instruction(new ir_uncond_br(current_block, step_block));
        current_block.parent.body.add(step_block);
        current_block = step_block;
        if (node.update != null) {
            node.update.accept(this);
        }
        current_block.add_instruction(new ir_uncond_br(current_block, cond_block));
        current = current.parent;
        current_block.parent.body.add(merge_block);
        current_block = merge_block;
    }


    @Override
    public void visit(return_statement node) {
//        if(node.pos.row() == 64){
//            int c = 0;
//        }
        if (node.return_value != null) {
            node.return_value.accept(this);
            current_block.add_instruction(new ir_return_instruction(current_block, current_entity));
        } else {
            current_block.add_instruction(new ir_return_instruction(current_block, null));
        }
    }


    @Override
    public void visit(break_statement node) {
        current_block.add_instruction(new ir_uncond_br(current_block, current.merge_block));
    }


    @Override
    public void visit(continue_statement node) {
        current_block.add_instruction(new ir_uncond_br(current_block, current.cond_block));
    }


    @Override
    public void visit(expression_statement node) {
        node.expression.accept(this);
    }

    @Override
    public void visit(val_type valType) {
    }

    @Override
    public void visit(empty_statement node) {
    }

    @Override
    public void visit(declaration_statement node) {
        node.declaration.accept(this);
    }

    @Override
    public void visit(call_expression node) {
        if(node.pos.row() == 84){
            int c = 0;
        }
        node.function.accept(this);
        if(now_function == null){
            return;
        }
        ArrayList<ir_entity> parameters = new ArrayList<>();
        ir_call_instruction call = null;
        if(node.type.is_void){
            call = new ir_call_instruction(current_block, null, now_function.name, parameters);
        }
        else{
            ir_variable retVar = new ir_variable("_tmp." + get_new_index("_tmp"),now_function.return_type);
            call = new ir_call_instruction(current_block, retVar, now_function.name, parameters);
        }
        if(now_function.this_pointer != null){
            parameters.add(now_function.this_pointer);
        }
        for(var expression : node.arguments_list){
            expression.accept(this);
            parameters.add(current_entity);
        }
        current_block.add_instruction(call);

        if(node.type.is_void){
            current_entity = null;
        }
        else{
            current_entity = call.result;
        }
        now_function = null;

    }

    @Override
    public void visit(primary_expression node) {
        if(node.pos.row() == 218){
            int c = 0;
        }
        if(node.primary_content instanceof This){
            current_entity = new ir_variable("this." + get_index("this"), new ir_type("ptr"));
            ir_variable new_entity = new ir_variable("_tmp" + get_new_index("_tmp"), new ir_type("ptr"));
            current_block.add_instruction(new ir_load_instruction(current_block, new_entity, current_entity));
            current_entity = new_entity;
            return;
        }
        if (node.type.is_function) {
            function_node function = null;
            //in the class
            if (current != null && current.class_name != null) {
                var class_member = global.get_class(current.class_name);
                //the class function
                if (class_member.function_list.get(node.primary_content.identified) != null) {
                    int call_index = get_new_index("call");
                    String call_name = "call." + call_index;
                    ir_variable call_entity = new ir_variable(call_name, new ir_type("ptr"));
                    current_block.add_instruction(new ir_load_instruction(current_block, call_entity, new ir_variable("this." + get_index("this"), new ir_type("ptr"))));
                    if(current.class_name.equals("String")){
                        function = new function_node(new ir_type(global.get_class(current.class_name).function_list.get(node.primary_content.identified).return_type), "_string" + "." + node.primary_content.identified, new ArrayList<>(),call_entity);
                    }
                    else{
                        function = new function_node(new ir_type(global.get_class(current.class_name).function_list.get(node.primary_content.identified).return_type), current.class_name + "." + node.primary_content.identified, new ArrayList<>(),call_entity);
                    }
                }
                if(function == null){
                    function = new function_node(new ir_type(global.get_function(node.primary_content.identified).return_type), node.primary_content.identified, new ArrayList<>(),null);
                }
            } else {
                function = new function_node(new ir_type(global.get_function(node.primary_content.identified).return_type), node.primary_content.identified, new ArrayList<>(),null);
            }
            current_entity = null;
            now_function = function;
            return;
        }
        if (node.is_lvalue) {
            if (current != null && current.class_name == null) {
                int index = get_index(node.primary_content.identified);
                if(global_index.get(node.primary_content.identified) != null && global_index.get(node.primary_content.identified) == get_index(node.primary_content.identified)){
                    current_ptr = new ir_global_variable(node.primary_content.identified + "." + index);
                    now_function = null;
                }
                else{
                    current_ptr = new ir_variable(node.primary_content.identified + "." + index, new ir_type("ptr"));
                }
            } else if (current != null && current.class_name != null) {
                if(ir_program.class_definition_nodeHashMap.get(current.class_name).name_index.get(node.primary_content.identified) != null) {
                    int index = get_new_index(node.primary_content.identified);
                    current_ptr = new ir_variable(node.primary_content.identified + "." + index, new ir_type("ptr"));
                    current_block.add_instruction(new ir_load_instruction(current_block, current_ptr, new ir_variable("this." + get_index("this"), new ir_type("ptr"))));
                    var new_ptr = new ir_variable(node.primary_content.identified + "." + get_new_index(node.primary_content.identified), new ir_type("ptr"));
                    var find_member = new ir_getelementptr_instruction(current_block, new_ptr, "%struct." + current.class_name, current_ptr, new ArrayList<>());
                    find_member.add_index(new ir_literal("0", new ir_type("i32")));
                    int class_index = ir_program.class_definition_nodeHashMap.get(current.class_name).name_index.get(node.primary_content.identified);
                    find_member.add_index(new ir_literal(String.valueOf(class_index), new ir_type("i32")));
                    current_ptr = new_ptr;
                    current_block.add_instruction(find_member);
                }
                else{
                    int index = get_index(node.primary_content.identified);
                    if(global_index.get(node.primary_content.identified) != null && global_index.get(node.primary_content.identified) == get_index(node.primary_content.identified)){
                        current_ptr = new ir_global_variable(node.primary_content.identified + "." + index);
                        now_function = null;
                    }
                    else{
                        current_ptr = new ir_variable(node.primary_content.identified + "." + index, new ir_type("ptr"));
                    }
                }

            } else {
                current_ptr = new ir_global_variable(node.primary_content.identified + "." + get_index(node.primary_content.identified));
            }
            var value = new ir_variable("_tmp." + get_new_index("_tmp"), new ir_type(node.type));
            current_block.add_instruction(new ir_load_instruction(current_block, value, current_ptr));
            current_entity = value;
            now_function = null;
            return;
        }
        if (node.primary_content.is_constant) {
            if (((constant) (node.primary_content)).is_string) {
                ir_global_variable new_global = new ir_global_variable("_string." + get_new_index("_string"));
                StringBuilder string = new StringBuilder();
                for (int i = 0; i < ((string_literal)node.primary_content).value.length(); i++) {
                    char c = ((string_literal)node.primary_content).value.charAt(i);
                    if (c == '\\') {
                        i++;
                        c = ((string_literal)node.primary_content).value.charAt(i);
                        if (c == 'n') {
                            string.append("\n");
                        } else if (c == '\\') {
                            string.append("\\");
                        } else if (c == '\"') {
                            string.append("\"");
                        }
                    } else {
                        string.append(c);
                    }
                }
                ir_program.string_literal_list.add(new ir_stringliteral_node(new_global, string.toString(), ((string_literal)node.primary_content).value));
                current_entity = new_global;
                now_function = null;
            } else if (((constant) (node.primary_content)).is_int) {
                current_entity = new ir_literal(String.valueOf(((Integer_literal)node.primary_content).value), new ir_type("i32"));
                now_function = null;
            } else if (((constant) (node.primary_content)).is_bool) {
                current_entity = new ir_literal((((Bool)node.primary_content).value?"1":"0"), new ir_type("i1"));
                now_function = null;
            } else if (((constant) (node.primary_content)).is_null) {
                current_entity = new ir_literal("null", new ir_type("ptr"));
                now_function = null;
            } else if (((constant) (node.primary_content)).is_array_literal) {
                current_entity = new ir_literal("null", new ir_type("ptr"));
            } else if (((constant) (node.primary_content)).is_format_string) {
                ir_entity to_add = null;
                if(!((format_string)node.primary_content).first.equals("")){
                    ir_global_variable first_global = new ir_global_variable("_string." + get_new_index("_string"));
                    String first_ = build_string(((format_string)node.primary_content).first);
                    ir_program.string_literal_list.add(new ir_stringliteral_node(first_global, first_, ((format_string)node.primary_content).first));
                    var first_val = new ir_variable("_tmp." + get_new_index("_tmp"), new ir_type("ptr"));
                    current_block.add_instruction(new ir_load_instruction(current_block,first_val, first_global));
                    current_entity = first_val;
                    to_add = first_val;
                }
                for(int i = 0 ; i<((format_string)node.primary_content).part2.size();++i){
                    ((format_string)node.primary_content).part2.get(i).accept(this);
                    var new_tmp = new ir_variable("_tmp." + get_new_index("_tmp"), new ir_type("ptr"));
                    current_block.add_instruction(new ir_call_instruction(current_block, new_tmp, "toString", new ArrayList<>(List.of(current_entity))));
                    var add_tmp_1 = new ir_variable("_tmp." + get_new_index("_tmp"), new ir_type("ptr"));
                    if(to_add != null){
                        current_block.add_instruction(new ir_call_instruction(current_block, add_tmp_1, "_string.concat", new ArrayList<>(List.of(to_add,new_tmp))));
                        to_add = add_tmp_1;
                        current_entity = add_tmp_1;
                    }
                    else{
                        current_entity = new_tmp;
                        to_add = new_tmp;
                    }
                    if(i < ((format_string)node.primary_content).part1.size()){
                        ir_global_variable global = new ir_global_variable("_string." + get_new_index("_string"));
                        String string = build_string(((format_string)node.primary_content).part1.get(i));
                        ir_program.string_literal_list.add(new ir_stringliteral_node(global, string, ((format_string)node.primary_content).part1.get(i)));
                        var add_tmp_2 = new ir_variable("_tmp." + get_new_index("_tmp"), new ir_type("ptr"));
                        current_block.add_instruction(new ir_call_instruction(current_block, add_tmp_2, "_string.concat", new ArrayList<>(List.of(current_entity,global))));
                        current_entity = add_tmp_2;
                        to_add = add_tmp_2;
                    }
                }
                if(!((format_string)node.primary_content).third.equals("")){
                    ir_global_variable third_global = new ir_global_variable("_string." + get_new_index("_string"));
                    String third_ = build_string(((format_string)node.primary_content).third);
                    ir_program.string_literal_list.add(new ir_stringliteral_node(third_global, third_, ((format_string)node.primary_content).first));
                    var add_tmp_3 = new ir_variable("_tmp." + get_new_index("_tmp"), new ir_type("ptr"));
                    current_block.add_instruction(new ir_call_instruction(current_block, add_tmp_3, "_string.concat", new ArrayList<>(List.of(to_add,third_global))));
                    current_entity = add_tmp_3;
                }
            }
        }
    }
    private String build_string(String init){
        StringBuilder string = new StringBuilder();
        for (int i = 0; i < init.length(); i++) {
            char c = init.charAt(i);
            if (c == '\\') {
                i++;
                c = init.charAt(i);
                if (c == 'n') {
                    string.append("\n");
                } else if (c == '\\') {
                    string.append("\\");
                } else if (c == '\"') {
                    string.append("\"");
                }
            } else {
                string.append(c);
            }
        }
        return string.toString();
    }

    @Override
    public void visit(binary_expression node) {

        node.lhs.accept(this);
        var lhsVar = current_entity;


        if (node.op.equals("&&") || node.op.equals("||")) {
            if (current_entity instanceof ir_literal literal) {
                if (literal.value.equals("0")) {
                    if (node.op.equals("&&")) {
                        current_entity = new ir_literal("0", new ir_type("i1"));
                        now_function = null;
                    }
                    else
                        node.rhs.accept(this);
                } else {
                    if (node.op.equals("||")) {
                        current_entity = new ir_literal("1", new ir_type("i1"));
                        now_function = null;
                    }
                    else
                        node.rhs.accept(this);
                }
                return;
            }

            int index = get_new_index("if");
            basic_block end = new basic_block("if.end." + index, current_block.parent, current.loop_depth);
            basic_block then = new basic_block("if.then." + index, current_block.parent, current.loop_depth);
            basic_block else_ = new basic_block("if.else." + index, current_block.parent, current.loop_depth);

            current_block.add_instruction(new ir_br_instruction(current_block, lhsVar, then, else_));
            current_block.parent.body.add(then);
            current_block = then;
            if (node.op.equals("&&")) node.rhs.accept(this);
            current_block.add_instruction(new ir_uncond_br(current_block, end));
            basic_block thenBlock = current_block;


            current_block.parent.body.add(else_);
            current_block = else_;
            if (!node.op.equals("&&")) node.rhs.accept(this);
            current_block.add_instruction(new ir_uncond_br(current_block, end));
            basic_block elseBlock = current_block;


            current_block.parent.body.add(end);
            current_block = end;
            var return_value = new ir_variable("_tmp." + get_new_index("_tmp"), new ir_type("i1"));
            if (node.op.equals("&&")) {
                var instruction = new ir_phi_instruction(current_block, return_value, new ArrayList<>());
                instruction.add_value(current_entity, thenBlock);
                instruction.add_value(lhsVar, elseBlock);
                current_block.add_instruction(instruction);
            } else {
                var instruction = new ir_phi_instruction(current_block, return_value, new ArrayList<>());
                instruction.add_value(lhsVar, thenBlock);
                instruction.add_value(current_entity, elseBlock);
                current_block.add_instruction(instruction);
            }
            current_entity = return_value;
            return;
        }

        node.rhs.accept(this);
        var rhsVar = current_entity;


        if (node.lhs.type.dimension == 0 && node.lhs.type.is_string) {
            ir_variable retVar = new ir_variable("string." + get_new_index("string"), new ir_type("ptr"));
            if (node.op.equals("+")) {
                ArrayList<ir_entity> parameters = new ArrayList<>();
                parameters.add(lhsVar);
                parameters.add(rhsVar);
                current_block.add_instruction(new ir_call_instruction(current_block, retVar, "_string.concat", parameters));
            } else {
                var _tmp = new ir_variable("_tmp." + get_new_index("_tmp"), new ir_type("i32"));
                retVar.type = new ir_type("i1");
                ArrayList<ir_entity> parameters = new ArrayList<>();
                parameters.add(lhsVar);
                parameters.add(rhsVar);
                current_block.add_instruction(new ir_call_instruction(current_block, _tmp, "_string.compare", parameters));
                current_block.add_instruction(new ir_cmp_instruction(current_block, node.op, _tmp, new ir_literal("0", new ir_type("i32")), retVar));
            }
            current_entity = retVar;
            now_function = null;
            return;
        }

        if (lhsVar instanceof ir_literal lhs && lhs.type.is_int && rhsVar instanceof ir_literal rhs && rhs.type.is_int) {
            int l = Integer.parseInt(lhs.value);
            int r = Integer.parseInt(rhs.value);
            int ans = 0;
            if ((node.op.equals("/") || node.op.equals("%")) && r == 0) {
                current_entity = new ir_variable("0", new ir_type("i32"));
                now_function = null;
                return;
            }
            ans = switch (node.op) {
                case "==" -> l == r ? 1 : 0;
                case "!=" -> l != r ? 1 : 0;
                case ">" -> l > r ? 1 : 0;
                case ">=" -> l >= r ? 1 : 0;
                case "<" -> l < r ? 1 : 0;
                case "<=" -> l <= r ? 1 : 0;
                case "+" -> l + r;
                case "-" -> l - r;
                case "*" -> l * r;
                case "/" -> l / r;
                case "%" -> l % r;
                case "<<" -> l << r;
                case ">>" -> l >> r;
                case "&" -> l & r;
                case "^" -> l ^ r;
                case "|" -> l | r;
                default -> throw new RuntimeException("unknown binary operator");
            };
            current_entity = new ir_literal(String.valueOf(ans), new ir_type("i32"));
            now_function = null;
            return;
        }
        ir_variable retVar = new ir_variable("_tmp." + get_new_index("_tmp"), new ir_type(node.type));
        if(node.op.equals("==") || node.op.equals("!=") || node.op.equals(">") || node.op.equals(">=") || node.op.equals("<") || node.op.equals("<=")){
            current_block.add_instruction(new ir_cmp_instruction(current_block, node.op, lhsVar, rhsVar, retVar));
        }
        else{
            current_block.add_instruction(new ir_binary_instruction(current_block, node.op, lhsVar, rhsVar, retVar));
        }
        current_entity = retVar;
        now_function = null;
    }

    @Override
    public void visit(pre_expression node) {
        node.expression.accept(this);
        if (node.op.equals("++") || node.op.equals("--")) {
            ir_variable _tmp = new ir_variable("_tmp." + get_new_index("_tmp"), new ir_type(node.type));
            current_block.add_instruction(new ir_binary_instruction(current_block, node.op.equals("++") ? "+" : "-", current_entity, new ir_literal("1", new ir_type("i32")), _tmp));
            current_block.add_instruction(new ir_store_instruction(current_block, _tmp, current_ptr));
            current_entity = _tmp;
        } else if (node.op.equals("!")) {
            ir_variable _tmp = new ir_variable("_tmp." + get_new_index("_tmp"), new ir_type(node.type));
            current_block.add_instruction(new ir_binary_instruction(current_block, "^", current_entity, new ir_literal("1", new ir_type("i1")), _tmp));
            current_entity = _tmp;
            now_function = null;
        } else if (node.op.equals("~")) {
            ir_variable _tmp = new ir_variable("_tmp." + get_new_index("_tmp"), new ir_type(node.type));
            current_block.add_instruction(new ir_binary_instruction(current_block, "^", current_entity, new ir_literal("-1", new ir_type("i32")), _tmp));
            current_entity = _tmp;
            now_function = null;
        } else if (node.op.equals("-")) {
            ir_variable _tmp = new ir_variable("_tmp." + get_new_index("_tmp"), new ir_type(node.type));
            current_block.add_instruction(new ir_binary_instruction(current_block, "-", new ir_literal("0", new ir_type("i32")), current_entity, _tmp));
            current_entity = _tmp;
            now_function = null;
        }
    }

    @Override
    public void visit(array_expression node) {
        node.array.accept(this);
        ir_variable array = (ir_variable) current_entity;
        ir_variable _tmp = null;
        ir_variable new_array = null;
        int i = 0;
        for (var index : node.index) {
            i++;
            index.accept(this);
            ArrayList<ir_entity> index_list = new ArrayList<>();
            index_list.add( current_entity);
            ir_type new_type = null;
            if (i == node.index.size() && node.type.dimension == 0) {
                new_type = new ir_type(node.type,0);
            } else {
                new_type = new ir_type("ptr");
            }
            new_array = new ir_variable("_tmp." + get_new_index("_tmp"), new_type);
            current_block.add_instruction(new ir_getelementptr_instruction(current_block, new_array, new_type.toString(),array, index_list));
            _tmp = new ir_variable("_tmp." + get_new_index("_tmp"), new_type);
            current_block.add_instruction(new ir_load_instruction(current_block, _tmp, new_array));
            array = _tmp;
        }
        current_entity = _tmp;
        now_function = null;
        current_ptr = new_array;
    }

    @Override
    public void visit(member_expression node) {
        node.object.accept(this);

        if(node.object.type.dimension == 0){
            String class_name = node.object.type.class_name;
            class_struct class_ = global.get_class(class_name);
            function_struct function = class_.function_list.get(node.member);
            if (function != null) {
                if(current_entity instanceof ir_variable){
                    if(class_name.equals("string") || class_name.equals("String")){
                        now_function = new function_node(new ir_type(function.return_type), "_string." + node.member, new ArrayList<>(),(ir_variable) current_entity);
                    }
                    else{
                        now_function = new function_node(new ir_type(function.return_type), class_name + "." + node.member, new ArrayList<>(),(ir_variable) current_entity);
                    }
                    return;
                }
            }else{
                var class_member = class_.member_list.get(node.member);
                if(class_member != null){
                    int index = ir_program.class_definition_nodeHashMap.get(class_name).name_index.get(node.member);
                    var _tmp = new ir_variable("_tmp." + get_new_index("_tmp"), new ir_type("ptr"));
                    current_block.add_instruction(new ir_getelementptr_instruction(current_block,_tmp, "%struct." + class_name, (ir_variable) current_entity, new ArrayList<>(List.of(new ir_literal("0", new ir_type("i32")), new ir_literal(String.valueOf(index), new ir_type("i32"))))));
                    var new_entity = new ir_variable("_tmp." + get_new_index("_tmp"), new ir_type(class_member.class_name,class_member.dimension));
                    current_block.add_instruction(new ir_load_instruction(current_block, new_entity, _tmp));
                    current_entity = new_entity;
                    current_ptr = _tmp;
                    now_function = null;
                    return;
                }
                else{
                    throw new RuntimeException("unknown member");
                }

            }

        }
        if(node.object.type.dimension > 0){
            ArrayList<ir_entity> index_list = new ArrayList<>();
            index_list.add(new ir_literal("-1", new ir_type("i32")));
            ir_variable new_array = new ir_variable("_tmp." + get_new_index("_tmp"), new ir_type("ptr"));
            current_block.add_instruction(new ir_getelementptr_instruction(current_block, new_array, "i32", current_entity, index_list));
            var return_value = new ir_variable("_tmp." + get_new_index("_tmp"), new ir_type("i32"));
            current_block.add_instruction(new ir_load_instruction(current_block, return_value, new_array));
            current_entity = return_value;
            now_function = null;
        }
    }

    public ir_variable new_array(val_type type, ArrayList<ir_entity> size , int layer,array_literal literal) {
        if(layer == size.size() && literal == null){
            return new ir_variable("_tmp." + get_new_index("_tmp"), new ir_type(type));
        }
        if(literal != null){
            size.add(new ir_literal(String.valueOf(literal.value.size()), new ir_type("i32")));
        }
        if(layer == size.size() - 1){
            var size_entity = size.get(layer);
            ir_variable _tmp = new ir_variable("_tmp." + get_new_index("_tmp"), new ir_type("ptr"));
            String now_type = null;
            if(type.class_name.equals("null")){
                now_type = "ptr";
            }
            else{
                if(type.is_int){
                    now_type = "int";
                }
                else if(type.is_bool){
                    now_type = "bool";
                }
                else if(type.is_string){
                    now_type = "ptr";
                }
                else if(type.is_class){
                    now_type = "ptr";
                }
            }
            ArrayList<ir_entity> parameters = new ArrayList<>();
            parameters.add(new ir_literal(String.valueOf(get_size(now_type)), new ir_type("i32")));
            parameters.add(size_entity);
            current_block.add_instruction(new ir_call_instruction(current_block, _tmp, "_malloc_array" , parameters));
            if(literal != null){
                for(int i = 0; i < literal.value.size(); i++){
                    ir_variable new_entity = new ir_variable("_tmp." + get_new_index("_tmp"), new ir_type(type));
                    current_block.add_instruction(new ir_getelementptr_instruction(current_block, new_entity, "ptr", _tmp, new ArrayList<>(List.of(new ir_literal(String.valueOf(i), new ir_type("i32"))))));
                    literal.value.get(i).accept(this);
                    if(type.is_int){
                        current_block.add_instruction(new ir_store_instruction(current_block, new ir_literal(String.valueOf((ir_literal)current_entity), new ir_type("i32")), new_entity));
                    }
                    else if(type.is_bool){
                        current_block.add_instruction(new ir_store_instruction(current_block, new ir_literal(((ir_literal)current_entity).value.equals("1")?"1":"0", new ir_type("i1")), new_entity));
                    }
                    else if(type.is_string){
                        var new_string = new ir_global_variable("_string." + get_new_index("_string"));
                        ir_program.string_literal_list.add(new ir_stringliteral_node(new_string, ((ir_literal)current_entity).value, ((ir_literal)current_entity).value));
                        StringBuilder string = new StringBuilder();
                        for (int j = 0; j < ((ir_literal)current_entity).value.length(); j++) {
                            char c = ((ir_literal)current_entity).value.charAt(j);
                            if (c == '\\') {
                                j++;
                                c =  ((ir_literal)current_entity).value.charAt(j);
                                if (c == 'n') {
                                    string.append("\n");
                                } else if (c == '\\') {
                                    string.append("\\");
                                } else if (c == '\"') {
                                    string.append("\"");
                                }
                            } else {
                                string.append(c);
                            }
                        }
                        ir_program.string_literal_list.add(new ir_stringliteral_node(new_string, string.toString(),  ((ir_literal)current_entity).value));
                        current_block.add_instruction(new ir_store_instruction(current_block, new_string, new_entity));
                    }
                    else if(type.is_class){
                        current_block.add_instruction(new ir_store_instruction(current_block, new ir_literal("null", new ir_type("ptr")), new_entity));
                    }
                }
            }
            return _tmp;
        }
        var size_entity = size.get(layer);
        ir_variable ret = new ir_variable("_tmp." + get_new_index("_tmp"), new ir_type("ptr"));
        current_block.add_instruction(new ir_call_instruction(current_block, ret, "_malloc_array" , new ArrayList<>(List.of(new ir_literal("4", new ir_type("i32")),size_entity))));

        int index = get_new_index("for");
        basic_block cond_block = new basic_block("for.cond" + index, current_block.parent, current_block.loop_depth+1);
        basic_block body_block = new basic_block("for.body" + index, current_block.parent, current_block.loop_depth+1);
        basic_block step_block = new basic_block("for.step" + index, current_block.parent, current_block.loop_depth+1);
        basic_block merge_block = new basic_block("for.merge" + index, current_block.parent, current_block.loop_depth);

        var _tmp = new ir_variable("_tmp." + get_new_index("_tmp"), new ir_type("i32"));
        current_block.add_instruction(new ir_alloca_instruction(current_block, _tmp, new ir_type("i32")));
        current_block.add_instruction(new ir_store_instruction(current_block, new ir_literal("0", new ir_type("i32")), _tmp));
        current_block.add_instruction(new ir_uncond_br(current_block, cond_block));

        current_block.parent.body.add(cond_block);
        current_block = cond_block;
        var i = new ir_variable("i." + get_new_index("i"), new ir_type("i32"));
        current_block.add_instruction(new ir_load_instruction(current_block, i, _tmp));
        var cond = new ir_variable("cond." + get_new_index("cond"), new ir_type("i32"));
        current_block.add_instruction(new ir_cmp_instruction(current_block, "<", i, size_entity, cond));
        current_block.add_instruction(new ir_br_instruction(current_block, cond, body_block, merge_block));

        current_block.parent.body.add(body_block);
        current_block = body_block;
        if(!type.is_string){
            ArrayList<ir_entity> index_list = new ArrayList<>();
            index_list.add(i);
            var new_ptr = new ir_variable("_tmp." + get_new_index("_tmp"), new ir_type("ptr"));
            current_block.add_instruction(new ir_getelementptr_instruction(current_block, new_ptr, "ptr", ret, index_list));
            var new_array = new_array(type, size, layer + 1,literal);
            current_block.add_instruction(new ir_store_instruction(current_block, new_array, new_ptr));
        }
        current_block.add_instruction(new ir_uncond_br(current_block, step_block));

        current_block.parent.body.add(step_block);
        current_block = step_block;
        var tmp = new ir_variable("_tmp." + get_new_index("_tmp"), new ir_type("i32"));
        current_block.add_instruction(new ir_binary_instruction(current_block, "+", i, new ir_literal("1", new ir_type("i32")), tmp));
        current_block.add_instruction(new ir_store_instruction(current_block, tmp, _tmp));
        current_block.add_instruction(new ir_uncond_br(current_block, cond_block));

        current_block.parent.body.add(merge_block);
        current_block = merge_block;
        return ret;
    }

    @Override
    public void visit(new_expression node) {
        if(node.type.dimension == 0){
            var _tmp = new ir_variable("_tmp." + get_new_index("_tmp"), new ir_type(node.type));
            current_block.add_instruction(new ir_call_instruction(current_block, _tmp, "_malloc", new ArrayList<>(List.of(new ir_literal(String.valueOf(get_size(node.type.class_name)), new ir_type("i32"))))));
            //for class
            if(ir_program.class_definition_nodeHashMap.get(node.type.class_name) != null){
                ArrayList<ir_entity> parameters = new ArrayList<>();
                parameters.add(_tmp);
                if(ir_program.function_definition_nodeHashMap.containsKey(node.type.class_name + "." + node.type.class_name)){
                    current_block.add_instruction(new ir_call_instruction(current_block, null, node.type.class_name + "." + node.type.class_name, parameters));
                }
//                current_block.add_instruction(new ir_call_instruction(current_block, null, node.type.class_name + "." + node.type.class_name, parameters));
            }
            current_entity = _tmp;
            return;
        }
        var size = new ArrayList<ir_entity>();
        for(var expression : node.expression_list){
            expression.accept(this);
            size.add(current_entity);
        }
        if(node.has_array_literal){
            current_entity = new_array(node.type, size, 0, node.value);
        }
        else{
            if(node.type.dimension == size.size()){
                current_entity = new_array(node.type, size, 0,null);
            }
            else{
                current_entity = new_array(new val_type("null",0), size, 0,null);
            }
        }
    }

    @Override
    public void visit(assign_expression node) {
        node.left.accept(this);
        ir_entity lhs = current_ptr;
        node.right.accept(this);

        if (node.left.type.dimension == 0 && node.left.type.is_string) {
            var _tmp = new ir_variable("_tmp." + get_new_index("_tmp"), new ir_type("ptr"));
            current_block.add_instruction(new ir_call_instruction(current_block, _tmp, "_string.copy", new ArrayList<>(List.of(current_entity))));
            current_block.add_instruction(new ir_store_instruction(current_block, _tmp, lhs));
        } else {
            current_block.add_instruction(new ir_store_instruction(current_block, current_entity, lhs));
        }
    }

    @Override
    public void visit(behind_expression node) {
        node.expression.accept(this);
        if (node.op.equals("++") || node.op.equals("--")) {
            ir_variable _tmp = new ir_variable("_tmp." + get_new_index("_tmp"), new ir_type(node.type));
            current_block.add_instruction(new ir_binary_instruction(current_block, node.op.equals("++") ? "+" : "-", current_entity, new ir_literal("1", new ir_type("i32")), _tmp));
            current_block.add_instruction(new ir_store_instruction(current_block, _tmp, current_ptr));
            now_function = null;
        }
    }

    @Override
    public void visit(ternary_expression node) {
        node.condition.accept(this);
        if (current_entity instanceof ir_literal literal) {
            if (literal.value.equals("0")) {
                node.false_expression.accept(this);
            } else {
                node.true_expression.accept(this);
            }
            return;
        }

        int index = get_new_index("cond");
        basic_block then = new basic_block("cond.then." + index, current_block.parent, current_block.loop_depth);
        basic_block end = new basic_block("cond.end." + index, current_block.parent, current_block.loop_depth);
        basic_block else_ = new basic_block("cond.else." + index, current_block.parent, current_block.loop_depth);
        current_block.add_instruction(new ir_br_instruction(current_block, current_entity, then, else_));

        current_block.parent.body.add(then);
        current_block = then;
        node.true_expression.accept(this);
        var thenValue = (!node.type.is_void ? current_entity : null);
        current_block.add_instruction(new ir_uncond_br(current_block, end));
        basic_block thenBlock = current_block;

        current_block.parent.body.add(else_);
        current_block = else_;
        node.false_expression.accept(this);
        var elseValue = (!node.type.is_void) ? current_entity : null;
        current_block.add_instruction(new ir_uncond_br(current_block, end));
        basic_block elseBlock = current_block;

        current_block.parent.body.add(end);
        current_block = end;
        if (!node.type.is_void) {
            var return_value = new ir_variable("_tmp." + get_new_index("_tmp"), new ir_type(node.type));
            var instruction = new ir_phi_instruction(current_block, return_value, new ArrayList<>());
            instruction.add_value(thenValue, thenBlock);
            instruction.add_value(elseValue, elseBlock);
            current_block.add_instruction(instruction);
            current_entity = return_value;
        } else {
            current_entity = null;
            now_function = null;
        }
    }

}

