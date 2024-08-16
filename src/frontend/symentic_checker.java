package frontend;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;

import ast.*;
import ast.expression.*;
import ast.primary.Bool;
import ast.primary.Integer_literal;
import ast.primary.Null;
import ast.primary.This;
import ast.primary.array_literal;
import ast.primary.format_string;
import ast.primary.string_literal;
import ast.statement.*;
import ast.type.*;
import util.scope;
import util.member_struct.*;
import util.error;

import static java.lang.Math.max;


public class symentic_checker implements ast_visitor {
    scope globle;
    scope current;

    public symentic_checker(scope globle_) {
        globle = globle_;
        current = globle;
    }

    public void visit(program_node node) {
        function_struct main = globle.get_function("main");
        if (main == null) {
            throw new error(node.pos, "main function not found", "symentic error");
        }
        if (!main.return_type.equals(new val_type("int", 0))) {
            throw new error(node.pos, "main function should return int", "symentic error");
        }
        if (!main.parameter_list_array.isEmpty()) {
            throw new error(node.pos, "main function should not have any parameter", "symentic error");
        }
        for (var def : node.children) {
            def.accept(this);
        }
    }

    public void visit(class_defination_node node) {
        if (current != globle) {
            throw new error(node.pos, "class defination should be in global scope", "symentic error");
        }
        scope new_scope = new scope(current);
        new_scope.is_class = true;
        current = new_scope;
        current.class_name = node.class_name;
        for (var member : node.val_declaration_list) {
            member.accept(this);
        }
        if (node.class_build != null) {
            if (!node.class_build.name.equals(node.class_name)) {
                throw new error(node.pos, "class name should be same as class build name", "symentic error");
            }
            node.class_build.accept(this);
        }
        for (var func : node.func_defination_list) {
            func.accept(this);
        }
        current = current.parent_scope;

    }

    public void visit(class_construction node) {
        if (!current.is_class) {
            throw new error(node.pos, "class construction should be in class scope", "symentic error");
        }
        current = new scope(current);
        current.is_function = true;
        current.return_type = new val_type("null", 0);
        for (var member : node.class_block.statements_list) {
            member.accept(this);
        }
        current = current.parent_scope;
    }

    public void visit(function_def node) {
        if (current.exist_variable(node.name)) {
            throw new error(node.pos, "function " + node.name + " has already been defined", "symentic error");
        }
        if (!current.is_class &&current.get_function(node.name) != null && current.get_function(node.name).is_used) {
            throw new error(node.pos, "function " + node.name + " has already been defined", "symentic error");
        }
        if (current.get_class(node.name) != null) {
            throw new error(node.pos, "function " + node.name + " has already been defined", "Multiple Definitions");
        }
//        current.get_function(node.name).is_used = true;
        if(current.is_class){
            globle.get_class(current.class_name).function_list.get(node.name).is_used = true;
        }
        else{
            globle.get_function(node.name).is_used = true;
        }
        scope new_scope = new scope(current);
        current = new_scope;
        boolean has_return = false;
        current.is_function = true;
        current.return_type = node.return_type;
        if (node.parameter_list != null) {
            node.parameter_list.accept(this);
        }
        if (node.return_type != null) {
            if ((node.return_type).is_void) {
                has_return = true;
            }
        }
        for (var statement : node.body.statements_list) {
            statement.accept(this);
            if (statement instanceof return_statement) {
                has_return = true;
            }
        }
        has_return = globle.has_return;
        globle.has_return = false;
        if (!has_return && !node.name.equals("main") && !node.return_type.equals(new val_type("void", 0))) {
            throw new error(node.pos, "function " + node.name + " has no return statement", "Missing Return Statement");
        }
        current = current.parent_scope;
    }

    public void visit(val_declaration_node node) {
        if (!current.is_function && !current.is_class) {
            if (globle.get_function("main").is_used) {
                throw new error(node.pos, "the type can not be defined after main", "symentic error");
            }
        }
        if (node.type.is_class) {
            if (globle.get_class(node.type.class_name) == null) {
                throw new error(node.pos, "class " + node.type.class_name + " not found", "symentic error");
            }
        }
        if(node.type.is_void){
            throw new error(node.pos, "the type can not be defined after void", "symentic error");
        }
        for (var val : node.name_expression_map.keySet()) {
            if (current.exist_variable(val)) {
                throw new error(node.pos, "variable " + val + " has already been defined", "Multiple Definitions");
            }
            if(!Character.isLetter(val.charAt(0))){
                throw new error(node.pos, "val is invalid", "symentic error");
            }
            var exp = node.name_expression_map.get(val);
            //int i = 0;
            if (exp != null) {
                exp.accept(this);
                //inspect the type of the expression
                if (exp.type.is_void) {
                    throw new error(node.pos, "void type expression in variable declaration", "symentic error");
                }
                if (exp.type.is_int && !node.type.is_int) {
                    throw new error(node.pos, "type mismatch in variable declaration", "symentic error");
                }
                if (exp.type.is_bool && !node.type.is_bool) {
                    throw new error(node.pos, "type mismatch in variable declaration", "symentic error");
                }
                if (exp.type.is_string && !node.type.is_string) {
                    throw new error(node.pos, "type mismatch in variable declaration", "symentic error");
                }
                if (exp.type.is_class && !exp.type.class_name.equals("null") && !node.type.is_class ) {
                    throw new error(node.pos, "type mismatch in variable declaration", "symentic error");
                }
                if (exp.type.is_class && node.type.is_class) {
                    if (!exp.type.class_name.equals(node.type.class_name) && !exp.type.class_name.equals("null")) {
                        throw new error(node.pos, "type mismatch in variable declaration", "symentic error");
                    }
                }
                if (exp.type.dimension != node.type.dimension && !exp.type.class_name.equals("null")) {
                    throw new error(node.pos, "type mismatch in variable declaration", "symentic error");
                }
            }
            current.add_variable(val, node.type);

        }
    }

    public void visit(parameterlist_node node) {
        for (var parameter : node.type_name_map.keySet()) {
            if (current.exist_variable(parameter)) {
                throw new error(node.pos, "variable " + parameter + " has already been defined", "symentic error");
            }
            current.add_variable(parameter, node.type_name_map.get(parameter));
        }
    }

    public void visit(binary_expression node) {
        node.lhs.accept(this);
        node.rhs.accept(this);
        if(node.op.equals("&&") || node.op.equals("||")){
            if(!node.lhs.type.is_bool || !node.rhs.type.is_bool){
                throw new error(node.pos, "type mismatch in binary expression", "symentic error");
            }
        }
        if (node.lhs.type.is_void || node.rhs.type.is_void) {
            throw new error(node.pos, "void type expression in binary expression", "symentic error");
        }
        if (node.lhs.type.is_int && node.rhs.type.is_int) {
            if (node.op.equals("+") || node.op.equals("-") || node.op.equals("*") || node.op.equals("/") || node.op.equals("%") || node.op.equals("&") || node.op.equals("|") || node.op.equals("^") || node.op.equals("<<") || node.op.equals(">>")) {
                node.type = new val_type("int", 0);
            } else {
                node.type = new val_type("bool", 0);
            }
        } else if (node.lhs.type.is_bool && node.rhs.type.is_bool) {
            if (node.op.equals("+") || node.op.equals("-") || node.op.equals("*") || node.op.equals("/") || node.op.equals("%") || node.op.equals("&") || node.op.equals("|") || node.op.equals("^")) {
                node.type = new val_type("int", 0);
            } else {
                node.type = new val_type("bool", 0);
            }
        } else if (node.lhs.type.is_string && node.rhs.type.is_string) {
            if (node.op.equals("-") || node.op.equals("*") || node.op.equals("/") || node.op.equals("%") || node.op.equals("&") || node.op.equals("|") || node.op.equals("^")) {
                throw new error(node.pos, "string type mismatch in binary expression", "symentic error");
            } else {
                node.type = new val_type("bool", 0);
            }
        }else if(node.lhs.type.is_class && node.rhs.type.is_class){
            if(!node.lhs.type.class_name.equals("null") && !node.rhs.type.class_name.equals("null")){
                throw new error(node.pos, "class can't match in binary expression", "symentic error");
            }
            if(node.op.equals("==") || node.op.equals("!=")){
                node.type = new val_type("bool", 0);
            }
        }
        else if(node.lhs.type.dimension >0 && node.rhs.type.class_name.equals("null")){
            if(node.op.equals("==") || node.op.equals("!=")){
                node.type = new val_type("bool", 0);
            }
            else{
                throw new error(node.pos, "type mismatch in binary expression", "symentic error");
            }
        }
        else {
            throw new error(node.pos, "type mismatch in binary expression", "symentic error");
        }

        node.is_lvalue = false;
        node.is_const = node.lhs.is_const && node.rhs.is_const;
    }

    public void visit(pre_expression node) {
        node.expression.accept(this);
        if (node.expression.type.is_void) {
            throw new error(node.pos, "void type expression in unary expression", "symentic error");
        }
        if (node.expression.type.is_int) {
            node.type = new val_type("int", 0);
        } else if (node.expression.type.is_bool) {
            node.type = new val_type("bool", 0);
        } else if (node.expression.type.is_string) {
            node.type = new val_type("String", 0);
        } else {
            throw new error(node.pos, "type mismatch in unary expression", "Invalid Type");
        }
        if (node.op.equals("++") || node.op.equals("--")) {
            if (!node.expression.is_lvalue) {
                throw new error(node.pos, "++ or -- should be lvalue", "symentic error");
            }
            node.is_lvalue = true;
        } else {
            node.is_lvalue = false;
        }
        node.is_const = node.expression.is_const;
    }

    public void visit(array_expression node) {
        for (var index : node.index) {
            index.accept(this);
            if (!index.type.is_int) {
                throw new error(node.pos, "index should be int", "symentic error");
            }
            if (index.type.dimension > 0) {
                throw new error(node.pos, "dimension should be 0", "symentic error");
            }
        }
        if (node.array == null) {
            throw new error(node.pos, "array is null", "symentic error");
        }
        node.array.accept(this);
//        if(node.array instanceof  new_expression){
//            throw new error(node.pos, "new expression should be new", "symentic error");
//        }
        val_type array_type = node.array.type;
        if (array_type == null) {
            throw new error(node.pos, "array " + node.array + " not found", "symentic error");
        }
        int size = node.index.size();
        if (size > array_type.dimension) {
            throw new error(node.pos, "array dimension mismatch", "Dimension Out Of Bound");
        }
        node.type = new val_type(array_type.class_name, array_type.dimension - size);
        node.is_lvalue = true;
        node.is_const = false;
    }

    public void visit(assign_expression node) {
        node.left.accept(this);
        node.right.accept(this);
        if (node.left.type.is_void || node.right.type.is_void) {
            throw new error(node.pos, "void type expression in assign expression", "symentic error");
        }
        if (node.left.type.is_int && node.right.type.is_int) {
            node.type = node.left.type;
        } else if (node.left.type.is_bool && node.right.type.is_bool) {
            node.type = node.left.type;
        } else if (node.left.type.is_string && node.right.type.is_string) {
            node.type = node.left.type;
        } else if (node.right.type.class_name.equals("null")) {
            node.type = node.right.type;
        }else if(node.left.type.is_class && node.right.type.is_class && node.left.type.class_name.equals(node.right.type.class_name)){
            node.type = node.left.type;;
        }
        else {
            throw new error(node.pos, "type mismatch in assign expression", "Type Mismatch");
        }
        if (!node.left.is_lvalue) {
            throw new error(node.pos, "lhs should be lvalue", "symentic error");
        }
        if (!node.left.type.equals(node.right.type) && !node.right.type.class_name.equals("null")) {
            throw new error(node.pos, "lhs type dimension mismatch", "Type Mismatch");
        }
        if(node.left.type.dimension == 0 && !node.left.type.is_class && node.right.type.class_name.equals("null")) {
            throw new error(node.pos, "lhs dimension mismatch null", "symentic error");
        }
        node.is_lvalue = false;
        node.is_const = false;
    }

    public void visit(member_expression node) {
        node.object.accept(this);
        if (node.object.type.dimension != 0 && !node.member.equals("size")) {
            throw new error(node.pos, "array object should not have member", "symentic error");
        }
        if (node.object.type.dimension >0) {
            node.type = new val_type("int",0);
            node.type.class_name = "size";
            node.is_lvalue = false;
            node.is_const = false;
            return;
        }
        if (!node.object.type.is_class && !node.object.type.is_string) {
            throw new error(node.pos, "object should be class or string", "symentic error");
        }
//        if(node.object.type.is_string){
//            if(globle.get_function(node.member) == null){
//                throw new error(node.pos, "member " + node.member + " not found", "symentic error");
//            }
//            node.type = globle.get_function(node.member).return_type;
//            node.is_lvalue = false;
//        }
//        if(node.object.type.is_class){
//            class_struct class_ = globle.get_class(node.object.type.class_name);
//            if(class_ == null){
//                throw new error(node.pos, "class " + node.object.type.class_name + " not found", "symentic error");
//            }
//            if(class_.member_list.get(node.member) == null && class_.function_list.get(node.member) == null){
//                throw new error(node.pos, "member " + node.member + " not found", "symentic error");
//            }
//            if(class_.member_list.get(node.member) != null){
//                node.type = class_.member_list.get(node.member);
//                node.is_lvalue = true;
//            }
//            if(class_.function_list.get(node.member) != null){
//                node.type = class_.function_list.get(node.member).return_type;
//                node.is_lvalue = false;
//            }
//        }
        if(node.object.type.is_string){
            node.object.type.class_name = "String";
        }
        class_struct class_ = globle.get_class(node.object.type.class_name);
        if (class_ == null) {
            throw new error(node.pos, "class " + node.object.type.class_name + " not found", "symentic error");
        }
        if (class_.member_list.get(node.member) == null && class_.function_list.get(node.member) == null) {
            throw new error(node.pos, "member " + node.member + " not found", "symentic error");
        }
        if (class_.member_list.get(node.member) != null) {
            node.type = class_.member_list.get(node.member);
            node.is_lvalue = true;
        }
        if (class_.function_list.get(node.member) != null) {
            node.type = class_.function_list.get(node.member).return_type;
            node.is_lvalue = false;
        }
    }

    public void visit(new_expression node) {
        if (node.type.is_class) {
            if (globle.get_class(node.type.class_name) == null) {
                throw new error(node.pos, "class " + node.type.class_name + " not found", "symentic error");
            }
        }
        if (node.expression_list.isEmpty()) {
            if(!node.has_array_literal){
                if (node.type.dimension != 0) {
                    throw new error(node.pos, "array should have size", "symentic error");
                }
            }
            else{
                val_type first = null;
                boolean flag = false;
                int max_ = 0;
                for(var exp : node.value.value){
                    exp.accept(this);
                    if(exp.type == null || exp.type.equals(new val_type("null",0))){
                        continue;
                    }
                    val_type now = exp.type;
                    max_ = max(exp.type.dimension,max_);
                    now.dimension = 0;
                    if (flag) {
                        if (!now.equals(first)) {
                            throw new error(node.pos, "array literal type mismatch", "symentic error");
                        }
                    } else {
                        first = now;
                        flag = true;
                    }
                }
                int dimension_array = max_+1;
                first.dimension = dimension_array;
                if(!node.type.equals(first) && flag){
                    throw new error(node.pos, "array literal type mismatch", "Type Mismatch");
                }
                else{
                    node.is_const = false;
                    node.is_lvalue = false;
                }
                return;
            }
        } else {
            if (node.type.dimension < node.expression_list.size()) {
                throw new error(node.pos, "array size mismatch", "symentic error");
            }
            for (var exp : node.expression_list) {
                exp.accept(this);
                if (!exp.type.is_int) {
                    throw new error(node.pos, "size should be int", "symentic error");
                }
            }
        }
        node.is_lvalue = true;
        node.is_const = false;
    }

    public void visit(primary_expression node) {
        if (node.primary_content instanceof Integer_literal) {
            node.type = new val_type("int", 0);
        } else if (node.primary_content instanceof Bool) {
            node.type = new val_type("bool", 0);
        } else if (node.primary_content instanceof string_literal) {
            node.type = new val_type("String", 0);
        } else if (node.primary_content instanceof Null) {
            node.type = new val_type("null", 0);
        } else if (node.primary_content instanceof This) {
            node.type = new val_type("this", 0);
            if (!current.is_class) {
                throw new error(node.pos, "this should be in class scope", "symentic error");
            }
            node.type = new val_type(current.class_name, 0);
        } else if (node.primary_content instanceof array_literal) {
            val_type first = null;
            boolean flag = false;
            int max_ = 0;
            for (var exp : ((array_literal) node.primary_content).value) {
                exp.accept(this);
                if(exp.type == null || exp.type.equals(new val_type("null", 0))) {
                    continue;
                }
                val_type now = exp.type;
                max_ = max(exp.type.dimension,max_);
                now.dimension = 0;
                if (flag) {
                    if (!now.equals(first) ) {
                        throw new error(node.pos, "array literal type mismatch", "symentic error");
                    }
                } else {
                    first = now;
                    flag = true;
                }
            }
            node.type = first;
            if(first == null){
                node.type = new val_type("null", 0);
                node.is_lvalue = false;
                node.is_const = true;
                return;
            }
            node.type.dimension = max_ + 1;
            node.is_lvalue = false;
            node.is_const = true;
        } else if (node.primary_content instanceof format_string) {
            node.type = new val_type("String", 0);
            for (var exp : ((format_string) node.primary_content).part2) {
                exp.accept(this);
                if (exp.type.is_void) {
                    throw new error(node.pos, "void type expression in format string", "Invalid Type");
                }
                if (exp.type.is_class) {
                    throw new error(node.pos, "class type expression in format string", "symentic error");
                }
            }
            node.is_lvalue = false;
            node.is_const = true;

        } else {
            if (node.primary_content.is_identified) {
                if (current.get_variable(node.primary_content.identified) == null) {
                    throw new error(node.pos, "val has not been defined", "Undefined Identifier");
                }
                node.is_lvalue = true;
                node.is_const = false;
                node.type = current.get_variable(node.primary_content.identified);
            } else {
                throw new error(node.pos, "unknown primary expression", "symentic error");
            }
        }
    }

    public void visit(ternary_expression node) {
        node.condition.accept(this);
        node.true_expression.accept(this);
        node.false_expression.accept(this);
        if (node.condition.type.is_void) {
            throw new error(node.pos, "void type expression in ternary expression", "symentic error");
        }
        if (node.condition.type.is_bool) {
            node.type = node.true_expression.type;
        } else {
            throw new error(node.pos, "type mismatch in ternary expression", "symentic error");
        }
        node.is_lvalue = false;
        node.is_const = node.condition.is_const && node.true_expression.is_const && node.false_expression.is_const;
    }

    public void visit(block_statement node) {
        scope new_scope = new scope(current);
        new_scope.is_class = current.is_class;
        new_scope.is_function = current.is_function;
        new_scope.loop_depth = current.loop_depth;
        current = new_scope;
        for (var statement : node.statements_list) {
            statement.accept(this);
        }
        current = current.parent_scope;
    }

    public void visit(break_statement node) {
        if (current.loop_depth <= 0) {
            throw new error(node.pos, "break statement should be in loop", "Invalid Control Flow");
        }
    }

    public void visit(continue_statement node) {
        if (current.loop_depth <= 0) {
            throw new error(node.pos, "continue statement should be in loop", "symentic error");
        }
    }

    public void visit(for_statement node) {
        scope new_scope = new scope(current);
        current = new_scope;
        current.loop_depth++;
        if (node.init != null) {
            node.init.accept(this);
        }
        if (node.condition != null) {
            node.condition.accept(this);
            if (!node.condition.type.is_bool) {
                throw new error(node.pos, "condition should be bool", "Invalid Type");
            }
        }
        if (node.update != null) {
            node.update.accept(this);
        }
        node.body.accept(this);
        current.loop_depth--;
        current = current.parent_scope;
    }

    public void visit(if_statement node) {
        node.condition.accept(this);
        current = new scope(current);
        if (!node.condition.type.is_bool) {
            throw new error(node.pos, "condition should be bool", "Invalid Type");
        }
        node.then_body.accept(this);
        current =  current.parent_scope;
        if (node.else_body != null) {
            current = new scope(current);
            node.else_body.accept(this);
            current = current.parent_scope;
        }
    }

    public void visit(return_statement node) {
        if (!current.is_function) {
            throw new error(node.pos, "return statement should be in function", "symentic error");
        }
        if (node.return_value != null) {
            node.return_value.accept(this);
            if (!current.getReturn_type().equals(node.return_value.type) && !node.return_value.type.class_name.equals("null")) {
                throw new error(node.pos, "return type mismatch", "Type Mismatch");
            }
        }
        globle.has_return = true;
    }

    public void visit(while_statement node) {
        node.condition.accept(this);
        if (!node.condition.type.is_bool) {
            throw new error(node.pos, "condition should be bool", "symentic error");
        }
        scope new_scope = new scope(current);
        current = new_scope;
        current.loop_depth++;
        node.body.accept(this);
        current.loop_depth--;
        current = current.parent_scope;
    }

    public void visit(expression_statement node) {
        node.expression.accept(this);
    }

    public void visit(empty_statement node) {
    }

    public void visit(declaration_statement node) {
        node.declaration.accept(this);
    }

    public void visit(val_type node) {
    }

    public void visit(behind_expression node) {
        if (node.expression == null) {
            throw new error(node.pos, "behind expression should have expression", "symentic error");
        }
        node.expression.accept(this);
        if (!node.expression.is_lvalue) {
            throw new error(node.pos, "behind expression should be lvalue", "symentic error");
        }
        if (!node.expression.type.is_int) {
            throw new error(node.pos, "behind expression should be int", "symentic error");
        }
        node.type = new val_type("int", 0);
        node.is_lvalue = false;
        node.is_const = false;
    }

    public void visit(call_expression node) {
        if (node.function instanceof member_expression) {
            node.function.accept(this);
            if (((member_expression) (node.function)).object.type.is_class ||((member_expression) (node.function)).object.type.is_string ) {
                val_type now = node.function.type;
                if(now.class_name.equals("size")){
                    node.type = new val_type("int", 0);
                    node.is_lvalue = false;
                    node.is_const = false;
                    return;
                }
                ArrayList<val_type> parameter_list = globle.get_class(((member_expression) (node.function)).object.type.class_name).function_list.get(((member_expression) (node.function)).member).parameter_list_array;
                if (parameter_list.size() != node.arguments_list.size()) {
                    throw new error(node.pos, "parameter size mismatch", "symentic error");
                }
                for (int i = 0; i < parameter_list.size(); i++) {
                    node.arguments_list.get(i).accept(this);
                    if (!parameter_list.get(i).equals(node.arguments_list.get(i).type)) {
                        throw new error(node.pos, "parameter type mismatch", "symentic error");
                    }
                }
                node.is_lvalue = false;
                node.type = node.function.type;
            } else {
                if (globle.get_function(((member_expression) (node.function)).member) == null) {
                    throw new error(node.pos, "function " + ((member_expression) (node.function)).member + " not found", "symentic error");
                }
                ArrayList<val_type> parameter_list = globle.get_function(((member_expression) (node.function)).member).parameter_list_array;
                if (parameter_list.size() != node.arguments_list.size()) {
                    throw new error(node.pos, "parameter size mismatch", "symentic error");
                }
                for (int i = 0; i < parameter_list.size(); i++) {
                    if (!parameter_list.get(i).equals(node.arguments_list.get(i).type)) {
                        throw new error(node.pos, "parameter type mismatch", "symentic error");
                    }
                }
                node.is_lvalue = false;
                node.type = globle.get_function(((member_expression) (node.function)).member).return_type;
            }
//
        } else {
            if (!(node.function instanceof primary_expression) && !(node.function instanceof new_expression)) {
                throw new error(node.pos, "function should be primary expression", "symentic error");
            }
            if(node.function instanceof new_expression){
                node.function.accept(this);
                if(node.function.type.dimension != 0){
                    throw new error(node.pos, "call function dimensions mismatch", "symentic error");
                }
                if(!node.arguments_list.isEmpty()){
                    throw new error(node.pos, "call function arguments mismatch", "symentic error");
                }
                node.is_lvalue = false;
                node.is_const = false;
                node.type = node.function.type;
                return ;
            }
            ArrayList<val_type> parameter_list = null;
            if(node.function instanceof primary_expression){
                if(current.is_class){
                    if(globle.get_class(current.class_name).function_list.get(((primary_expression) (node.function)).primary_content.identified) == null &&globle.get_function(((primary_expression) (node.function)).primary_content.identified) == null){
                        throw new error(node.pos, "function can't find in class", "symentic error");
                    }
                    if(globle.get_class(current.class_name).function_list.get(((primary_expression) (node.function)).primary_content.identified) != null){
                        parameter_list = globle.get_class(current.class_name).function_list.get(((primary_expression) (node.function)).primary_content.identified).parameter_list_array;
                        node.type = globle.get_class(current.class_name).function_list.get(((primary_expression) (node.function)).primary_content.identified).return_type;
                    }
                    else{
                        parameter_list = globle.get_function(((primary_expression) (node.function)).primary_content.identified).parameter_list_array;
                        node.type = globle.get_function(((primary_expression) (node.function)).primary_content.identified).return_type;
                    }
                }
                else{
                    if (globle.get_function(((primary_expression) (node.function)).primary_content.identified) == null) {
                        throw new error(node.pos, "function " + ((primary_expression) (node.function)).primary_content.identified + " not found", "symentic error");
                    }
                    parameter_list = globle.get_function(((primary_expression) (node.function)).primary_content.identified).parameter_list_array;
                    node.type = globle.get_function(((primary_expression) (node.function)).primary_content.identified).return_type;
                }
            }
//            if(node.function instanceof primary_expression){
//                parameter_list = globle.get_function(((primary_expression) (node.function)).primary_content.identified).parameter_list_array;
//            }
            if (parameter_list.size() != node.arguments_list.size()) {
                throw new error(node.pos, "parameter size mismatch", "symentic error");
            }
            for (int i = 0; i < parameter_list.size(); i++) {
                node.arguments_list.get(i).accept(this);
                if (!parameter_list.get(i).equals(node.arguments_list.get(i).type) && !node.arguments_list.get(i).type.class_name.equals("null")) {
                    throw new error(node.pos, "parameter type mismatch", "symentic error");
                }
            }
            node.is_lvalue = false;
        }
    }
}
