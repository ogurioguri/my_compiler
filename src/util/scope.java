package util;

import java.util.HashMap;

import ast.function_def;
import ast.type.*;
import util.member_struct.*;

public class scope {
    public HashMap<String ,val_type> member_map;
    public scope parent_scope;
    public HashMap<String , class_struct> class_map;
    public HashMap<String , function_struct> function_map;
    public boolean is_class = false;
    public boolean is_function = false;
    public int loop_depth = 0;

    public void init(){
        this.member_map = new HashMap<>();
        this.parent_scope = null;
        this.class_map = new HashMap<>();
        this.function_map = new HashMap<>();
    }

    public scope(scope parent_scope_) {
        this.member_map = new HashMap<>();
        this.parent_scope = parent_scope_;
    }

    public scope(scope parent_scope_,function_def node) {
        this.member_map = new HashMap<>();
        this.parent_scope = parent_scope_;
        this.function_map = new HashMap<>();
        this.class_map = new HashMap<>();
        for(var para : node.parameter_list.type_name_map.keySet()){
            member_map.put(para, node.parameter_list.type_name_map.get(para));
        }
        
    }


    public void add_variable(String name, val_type type) {
        if(member_map.containsKey(name)) {
            throw new RuntimeException("variable " + name + " has already been defined");
        }
        member_map.put(name, type);
    }

    public boolean exist_variable(String name) {
        return member_map.containsKey(name);
    }

    public val_type get_type(String name) {
        if(member_map.containsKey(name)) {
            return member_map.get(name);
        }
        return null;
    }

    public val_type get_variable(String name) {
        if(member_map.containsKey(name)) {
            return member_map.get(name);
        }
        if(parent_scope != null) {
            return parent_scope.get_variable(name);
        }
        return null;
    }

    public void add_function(String name,val_type type , function_struct function_scope) {
        if(member_map.containsKey(name)) {
            throw new RuntimeException("function " + name + " has already been defined");
        }
        member_map.put(name, type);
        function_map.put(name, function_scope);
    }

    public void add_class(String name, class_struct class_scope) {
        if(member_map.containsKey(name)) {
            throw new RuntimeException("class " + name + " has already been defined");
        }
        val_type type = new val_type(name,0);
        member_map.put(name, type);
        class_map.put(name, class_scope);
    }

    public function_struct get_function(String name) {
        if(function_map.containsKey(name)) {
            return function_map.get(name);
        }
        if(parent_scope != null) {
            return parent_scope.get_function(name);
        }
        return null;
    }

    public class_struct get_class(String name) {
        if(class_map.containsKey(name)) {
            return class_map.get(name);
        }
        if(parent_scope != null) {
            return parent_scope.get_class(name);
        }
        return null;
    }

}
