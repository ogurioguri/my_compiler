package ast;
import java.util.ArrayList;
import util.position;

public class class_defination_node extends ast_node {
    public String class_name;
    public class_construction class_build;
    public ArrayList<val_declaration_node> val_declaration_list;
    public ArrayList<function_def> func_defination_list;

    public class_defination_node(position pos, String class_name_,class_construction class_build_, ArrayList<val_declaration_node> val_declaration_list_, ArrayList<function_def> func_defination_list_) {
        super(pos);
        this.class_name = class_name_;
        this.class_build = class_build_;
        this.val_declaration_list = val_declaration_list_;
        this.func_defination_list = func_defination_list_;
    }
    @Override
    public void accept(ast_visitor visitor) {
        visitor.visit(this);
    }

}