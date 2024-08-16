package frontend;
import ast.*;
import ast.expression.*;
import ast.statement.*;
import ast.type.*;
import util.scope;
import util.member_struct.*;

public class symbol_collector  implements ast_visitor {
    public scope global_table;
    public symbol_collector() {
        global_table = new scope(null);
    }

    public symbol_collector(scope global_table) {
        this.global_table = global_table;
    }

    public symbol_collector(symbol_collector other) {
        this.global_table = other.global_table;
    }

    public void visit(program_node node) {
        for (var def : node.children) {
            def.accept(this);
        }
    }

    public void visit(class_defination_node node) {
        class_struct new_class = new class_struct(node);
        global_table.add_class(node.class_name,new_class);
    }

    public void visit(function_def node) {
        global_table.add_function(node.name,node.return_type,new function_struct(node));
    }

    public void visit(val_declaration_node node) {}
    public void visit(parameterlist_node node) {}
    public void visit(block_statement node) {}
    public void visit(break_statement node) {}
    public void visit(continue_statement node) {}
    public void visit(return_statement node) {}
    public void visit(expression_statement node) {}
    public void visit(for_statement node) {}
    public void visit(if_statement node) {}
    public void visit(while_statement node) {}
    public void visit(binary_expression node) {}
    public void visit(new_expression node) {}
    public void visit(member_expression node) {}
    public void visit(call_expression node) {}
    public void visit(array_expression node) {}
    public void visit(assign_expression node) {}
    public void visit(ternary_expression node) {}
    public void visit(class_construction node) {}
    public void visit(empty_statement node) {}
    public void visit(primary_expression node) {}
    public void visit(val_type node) {}
    public void visit(pre_expression node) {}
    public void visit(behind_expression node) {}    
    public void visit(declaration_statement node) {}
}
