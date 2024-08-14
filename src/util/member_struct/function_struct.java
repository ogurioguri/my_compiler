package util.member_struct;
import ast.type.*;
import util.error;
import util.position;
import ast.*;

import java.util.HashMap;
import java.lang.reflect.Array;
import java.util.ArrayList;


public class function_struct {
    String name;
    public val_type return_type;
   /*  public HashMap<String,val_type> parameter_list; */
    public ArrayList<val_type> parameter_list_array = new ArrayList<>();


    public function_struct(function_def node) {
        this.return_type = node.return_type;
        /* this.parameter_list = new HashMap<>(); */
        add_parameter(node);
    }


    public void add_parameter(function_def node){
        for(var para : node.parameter_list.type_name_map.keySet()){
           /*  parameter_list.put(para, node.parameter_list.type_name_map.get(para)); */
            parameter_list_array.add(node.parameter_list.type_name_map.get(para));
        }
        name = node.name;
    }
}
