package util.member_struct;
import ast.type.*;
import ast.*;

import java.util.HashMap;
import java.lang.reflect.Array;
import java.util.ArrayList;


public class function_struct {
    String name;
    public val_type return_type;
   /*  public HashMap<String,val_type> parameter_list; */
    public ArrayList<val_type> parameter_list_array = new ArrayList<>();
    public boolean is_used = false;

    public function_struct() {}


    public function_struct(function_def node) {
        this.return_type = node.return_type;
        /* this.parameter_list = new HashMap<>(); */
        add_parameter(node);
    }


    public void add_parameter(function_def node){
        if(node.parameter_list == null){
            name = node.name;
            return;
        }
        /*  parameter_list.put(para, node.parameter_list.type_name_map.get(para)); */
        parameter_list_array.addAll(node.parameter_list.type_list);
        name = node.name;
    }
}
