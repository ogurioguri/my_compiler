package util.member_struct;
import ast.type.*;
import ast.*;

import java.util.HashMap;

public class class_struct {

    public String name;
    public HashMap<String,val_type> member_list;
    public HashMap<String, function_struct> function_list;
    public boolean is_used = false;

    public class_struct() {
        this.member_list = new HashMap<>();
        this.function_list = new HashMap<>();
    }

    public class_struct(class_defination_node node) {
        this.member_list = new HashMap<>();
        this.function_list = new HashMap<>();
        add_member(node);
    }

    public void add_member(class_defination_node node){
        for(var member : node.val_declaration_list){
            for(var name : member.name_expression_map.keySet()){
                member_list.put(name, member.type);
            }
        }
        for(var func : node.func_defination_list){
            function_struct new_func = new function_struct(func);
            function_list.put(func.name, new_func);
        }
        name = node.class_name;
    }
    
}
