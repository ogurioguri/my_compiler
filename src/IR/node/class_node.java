package IR.node;

import IR.IR_visitor;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;

import IR.basic_block;
import IR.type.ir_type;
import util.Pair;

public class class_node extends basic_node {
    public String name;
    public ArrayList<ir_type> type_list;
    public ArrayList<String> name_list;
    public HashMap<String,Integer> name_index = new HashMap<>();
    public int size = 0;


    public class_node(String name, ArrayList<ir_type> type_list, ArrayList<String> name_list,HashMap<String,Integer> name_index) {
        this.name = name;
        this.type_list = type_list;
        this.name_list = name_list;
        this.name_index = name_index;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("%struct.").append(name).append(" = type { ");
        for (int i = 0; i < type_list.size(); i++) {
            if (i != 0) sb.append(", ");
            sb.append(type_list.get(i).toString());
        }
        sb.append(" }\n");
        return sb.toString();
    }

    @Override
    public void accept(IR_visitor visitor) {
        visitor.visit(this);
    }
}
