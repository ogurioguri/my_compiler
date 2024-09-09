package IR.node;

import IR.IR_visitor;
import IR.entity.*;
import java.util.ArrayList;
import IR.basic_block;
import IR.type.ir_type;


public class function_definition_node extends basic_node {
    public String name;
    public ir_type return_type;
    public ArrayList<ir_variable> parameters;
    public ArrayList<basic_block> body;

    public function_definition_node(String name, ir_type return_type, ArrayList<ir_variable> parameters) {
        this.name = name;
        this.return_type = return_type;
        this.parameters = parameters;
        this.body = new ArrayList<>();
        this.body.add(new basic_block("entry", this , 0));
    }

    public void add(basic_block bb) {
        body.add(bb);
    }


    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("define ").append(return_type.toString()).append(" @").append(name).append("(");
        for (int i = 0; i < parameters.size(); i++) {
            if (i != 0) sb.append(", ");
            sb.append(parameters.get(i).type.toString()).append(" ").append(parameters.get(i).toString());
        }
        sb.append(") {\n");

        for (basic_block bb : body) {
            sb.append(bb.toString());
        }
        sb.append("}\n");
        return sb.toString();
    }

    @Override
    public void accept(IR_visitor visitor) {
        visitor.visit(this);
    }
}
