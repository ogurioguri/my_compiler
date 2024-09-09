package IR;

import IR.type.*;

import java.util.HashMap;


public class ir_scope {
    public ir_scope parent;
    public HashMap<String , ir_type> symbol_table;
    public HashMap<String , Integer> variable_number;
    public int loop_depth;
    public String class_name;
    public boolean is_function = false;
    //for the return and break and continue
    public basic_block cond_block = null;
    public basic_block merge_block = null;

    public ir_scope(ir_scope parent){
        this.parent = parent;
        this.symbol_table = new HashMap<>();
        this.variable_number = new HashMap<>();
        this.loop_depth = 0;

        if(parent != null){
            this.loop_depth = parent.loop_depth;
            this.class_name = parent.class_name;
            this.is_function = parent.is_function;
            this.merge_block = parent.merge_block;
            this.cond_block = parent.cond_block;
        }
    }



    public int get_index(String name){
        if(!variable_number.containsKey(name)){
            return 0;
        }
        else{
            return variable_number.get(name) +1 ;
        }
    }

    public void add_variable(String name , ir_type type) {
        symbol_table.put(name , type);
    }






}
