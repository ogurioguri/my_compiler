package IR.node;

import IR.IR_visitor;
import IR.entity.*;
import java.util.ArrayList;
import IR.basic_block;



public class function_definition_node extends basic_node {
    public String name;
    public basic_node return_type;
    public ArrayList<ir_entity> parameters;
    public ArrayList<basic_block> body;

    public function_definition_node(String name, basic_node return_type, ArrayList<ir_entity> parameters, ArrayList<basic_block> body) {
        this.name = name;
        this.return_type = return_type;
        this.parameters = parameters;
        this.body = body;
    }

    @Override
    public String toString() {

    }

    @Override
    public void accept(IR_visitor visitor) {
        visitor.visit(this);
    }
}
