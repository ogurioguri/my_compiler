package IR;

import java.util.ArrayList;

import IR.node.*;
import IR.type.ir_type;

import java.util.HashMap;


public class ir_program {
    public ArrayList<function_node> functions;
    public HashMap<String, global_variable_node> global_variables;
    public HashMap<String, function_definition_node> function_definition_nodeHashMap;
    public HashMap<String, class_node> class_definition_nodeHashMap;
    public ArrayList<ir_stringliteral_node> string_literal_list;


    public ir_program() {
        this.global_variables = new HashMap<>();
        this.functions = new ArrayList<>();
        this.function_definition_nodeHashMap = new HashMap<>();
        this.class_definition_nodeHashMap = new HashMap<>();
        this.string_literal_list = new ArrayList<>();
        functions.add(new function_node(new ir_type("void"), "print", "ptr", null));
        functions.add(new function_node(new ir_type("ptr"), "_string.concat", "ptr", "ptr", null));
        functions.add(new function_node(new ir_type("ptr"), "_string.copy", "ptr",null));
        functions.add(new function_node(new ir_type("i32"), "_string.compare", "ptr", "ptr",null));
        functions.add(new function_node(new ir_type("ptr"), "_malloc_array", "i32", "i32",null));
        functions.add(new function_node(new ir_type("ptr"), "_malloc", "i32",null));
        functions.add(new function_node(new ir_type("void"), "println", "ptr",null));
        functions.add(new function_node(new ir_type("void"), "printInt", "i32",null));
        functions.add(new function_node(new ir_type("void"), "printlnInt", "i32",null));
        functions.add(new function_node(new ir_type("ptr"), "getString", null));
        functions.add(new function_node(new ir_type("i32"), "getInt", null));
        functions.add(new function_node(new ir_type("ptr"), "toString", "i32",null));
        functions.add(new function_node(new ir_type("i32"), "_string.length", "ptr",null));
        var SubStringFunc = new function_node(new ir_type("ptr"), "_string.substring", "ptr",null);
        SubStringFunc.parameter_list.add(new ir_type("i32"));
        SubStringFunc.parameter_list.add(new ir_type("i32"));
        functions.add(SubStringFunc);

        functions.add(new function_node(new ir_type("i32"), "_string.parseInt", "ptr",null));
        var OrdFunc = new function_node(new ir_type("i32"), "_string.ord", "ptr",null);
        OrdFunc.parameter_list.add(new ir_type("i32"));
        functions.add(OrdFunc);


    }

    public void add(String name, global_variable_node global_variable) {
        this.global_variables.put(name, global_variable);
    }

    public void add(String name, function_definition_node function) {
        this.function_definition_nodeHashMap.put(name, function);
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        for (function_node function : functions) {
            sb.append(function.toString());
        }
        for (global_variable_node global_variable : global_variables.values()) {
            sb.append(global_variable.toString());
        }
        for(ir_stringliteral_node string_literal : string_literal_list){
            sb.append(string_literal.toString());
        }
        for (class_node class_node : class_definition_nodeHashMap.values()) {
            sb.append(class_node.toString());
        }
        for (function_definition_node function : function_definition_nodeHashMap.values()) {
            sb.append(function.toString());
        }
        return sb.toString();
    }

}
