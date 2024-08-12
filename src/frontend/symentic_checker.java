package frontend;

import ast.*;
import ast.expression.*;
import ast.statement.*;
import ast.type.*;
import util.scope;
import util.member_struct.*;
import util.error;



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
        if (!main.return_type.equals(new val_type("int",0))) {
            throw new error(node.pos, "main function should return int", "symentic error");
        }
        if (main.parameter_list.size() != 0) {
            throw new error(node.pos, "main function should not have any parameter", "symentic error");
        }
        for (var def : node.children) {
            def.accept(this);
        }
    }

    public void visit(class_defination_node node) {
        if(current != globle){
            throw new error(node.pos, "class defination should be in global scope", "symentic error");
        }
        if(node.class_build != null){
            if(node.class_build.name != node.class_name){
                throw new error(node.pos, "class name should be same as class build name", "symentic error");
            }
       }
        scope new_scope = new scope(current);
        current = new_scope;
        for(var member : node.val_declaration_list){
            member.accept(this);
        }
        for(var func : node.func_defination_list){
            func.accept(this);
        }
        current = current.parent_scope;
    
    }

    public void visit(function_def node) {
        if(current.exist_variable(node.name)){
            throw new error(node.pos, "function " + node.name + " has already been defined", "symentic error");
        }
        if(current.get_function(node.name) != null){
            throw new error(node.pos, "function " + node.name + " has already been defined", "symentic error");
        }
        if(current.get_class(node.name) != null){
            throw new error(node.pos, "function " + node.name + " has already been defined", "symentic error");
        }
    }
}
