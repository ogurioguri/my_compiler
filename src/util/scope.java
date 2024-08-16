package util;

import java.util.HashMap;

import ast.function_def;
import ast.type.*;
import util.member_struct.*;

public class scope {
    public HashMap<String ,val_type> member_map;
//    public HashMap<String , Boolean>member_is_defined;
    public scope parent_scope;
    public HashMap<String , class_struct> class_map;
    public HashMap<String , function_struct> function_map;
    public boolean is_class = false;
    public boolean is_function = false;
    public int loop_depth = 0;
    public val_type return_type;
    public String class_name;
    public boolean has_return = false;

    public void init(){
        this.member_map = new HashMap<>();
        this.parent_scope = null;
        this.class_map = new HashMap<>();
        this.function_map = new HashMap<>();
//        this.member_is_defined = new HashMap<>();
        class_name = "";
    }

    public scope(scope parent_scope_) {
        this.parent_scope = parent_scope_;
        this.class_map = new HashMap<>();
        this.function_map = new HashMap<>();
        this.member_map = new HashMap<>();
        if(parent_scope_!=null){
            this.loop_depth = parent_scope_.loop_depth;
            this.is_class = parent_scope_.is_class;
            this.is_function = parent_scope_.is_function;
            this.class_name = parent_scope_.class_name;
        }

    }

    public scope(scope parent_scope_,function_def node) {
        this.member_map = new HashMap<>();
        this.parent_scope = parent_scope_;
        this.function_map = new HashMap<>();
        this.class_map = new HashMap<>();
        this.member_map = new HashMap<>();
//        this.member_is_defined = new HashMap<>();
        for(var para : node.parameter_list.type_name_map.keySet()){
            member_map.put(para, node.parameter_list.type_name_map.get(para));
        }
        
    }


    public void add_variable(String name, val_type type) {
        if(member_map.containsKey(name)) {
            throw new RuntimeException("variable " + name + " has already been defined");
        }
        member_map.put(name, type);
//        member_is_defined.put(name, Boolean.FALSE);
    }

    public boolean exist_variable(String name) {
        return (member_map.containsKey(name));
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
//        member_map.put(name, type);
        function_map.put(name, function_scope);
        return_type = type;
    }

    public void add_class(String name, class_struct class_scope) {
        if(class_map.get(name) != null && class_map.get(name).is_used) {
            throw new RuntimeException("class " + name + " has already been defined");
        }
        val_type type = new val_type(name,0);
//        member_map.put(name, type);
        class_map.put(name, class_scope);
        class_map.get(name).is_used = true;
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

    public void init_globe(){
        this.member_map = new HashMap<>();
        this.parent_scope = null;
        this.class_map = new HashMap<>();
        this.function_map = new HashMap<>();
        function_struct Print = new function_struct();
        Print.is_used = true;
        Print.parameter_list_array.add(new val_type("String",0));
        Print.return_type = new val_type("void",0);
        function_map.put("print",Print);

        function_struct PrintIn = new function_struct();
        PrintIn.is_used = true;
        PrintIn.parameter_list_array.add(new val_type("String",0));
        PrintIn.return_type = new val_type("void",0);
        function_map.put("println",PrintIn);

        function_struct PrintInt = new function_struct();
        PrintInt.is_used = true;
        PrintInt.parameter_list_array.add(new val_type("int",0));
        PrintInt.return_type = new val_type("void",0);
        function_map.put("printInt",PrintInt);

        function_struct PrintlnInt = new function_struct();
        PrintlnInt.is_used = true;
        PrintlnInt.parameter_list_array.add(new val_type("int",0));
        PrintlnInt.return_type = new val_type("void",0);
        function_map.put("printlnInt",PrintlnInt);

        function_struct getString = new function_struct();
        getString.is_used = true;
        getString.return_type = new val_type("String",0);
        function_map.put("getString",getString);

        function_struct getInt = new function_struct();
        getInt.is_used = true;
        getInt.return_type = new val_type("int",0);
        function_map.put("getInt",getInt);

        function_struct toString = new function_struct();
        toString.is_used = true;
        toString.parameter_list_array.add(new val_type("int",0));
        toString.return_type = new val_type("String",0);
        function_map.put("toString",toString);

        function_struct size = new function_struct();
        size.is_used = true;
        size.return_type = new val_type("int",0);
        function_map.put("size",size);

        class_struct string = new class_struct();
        string.name = "String";
        string.is_used = true;

        function_struct length = new function_struct();
        length.is_used = true;
        length.return_type = new val_type("int",0);
        string.function_list.put("length",length);

        function_struct substring = new function_struct();
        substring.is_used = true;
        substring.parameter_list_array.add(new val_type("int",0));
        substring.parameter_list_array.add(new val_type("int",0));
        substring.return_type = new val_type("String",0);
        string.function_list.put("substring",substring);

        function_struct parseInt = new function_struct();
        parseInt.is_used = true;
        parseInt.return_type = new val_type("int",0);
        string.function_list.put("parseInt",parseInt);

        function_struct ord = new function_struct();
        ord.is_used = true;
        ord.parameter_list_array.add(new val_type("int",0));
        ord.return_type = new val_type("int",0);
        string.function_list.put("ord",ord);

        class_map.put("String",string);


    }

    public val_type getReturn_type(){
        if(return_type == null){
            if(parent_scope != null) {
                return parent_scope.getReturn_type();
            }
            return null;
        }
        return return_type;
    }

}
