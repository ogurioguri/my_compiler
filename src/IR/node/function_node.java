package IR.node;

import IR.IR_visitor;
import IR.basic_block;
import IR.entity.ir_variable;
import IR.type.ir_type;

import java.util.ArrayList;
import java.util.HashMap;


public class function_node extends basic_node {
    public ir_type return_type;
    public String name;
    public ArrayList<ir_type> parameter_list;
    public ArrayList<String> name_list = new ArrayList<>();
    public ir_variable this_pointer;
    public function_node(ir_type return_type, String name, ArrayList<ir_type> parameter_list, ir_variable this_pointer) {
        this.return_type = return_type;
        this.name = name;
        this.parameter_list = parameter_list;
        this.this_pointer = this_pointer;
    }

    public function_node(ir_type return_type, String name, String name1,ir_variable this_pointer) {
        this.return_type = return_type;
        this.name = name;
        this.parameter_list = new ArrayList<>();
        this.this_pointer = null;
        this.parameter_list.add(new ir_type(name1));
    }

    public function_node(ir_type return_type, String name, String name1,String name2,ir_variable this_pointer) {
        this.return_type = return_type;
        this.name = name;
        this.parameter_list = new ArrayList<>();
        this.this_pointer = null;
        this.parameter_list.add(new ir_type(name1));
        this.parameter_list.add(new ir_type(name2));
    }

    public function_node(ir_type return_type, String name,ir_variable this_pointer) {
        this.return_type = return_type;
        this.name = name;
        this.parameter_list = new ArrayList<>();
        this.this_pointer = null;

    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("declare ").append(return_type.toString()).append(" @").append(name).append("(");
        for (int i = 0; i < parameter_list.size(); i++) {
            if (i != 0) sb.append(", ");
            sb.append(parameter_list.get(i).toString());
        }
        sb.append(")\n");
        return sb.toString();
    }

    @Override
    public void accept(IR_visitor visitor) {
        visitor.visit(this);
    }
}
