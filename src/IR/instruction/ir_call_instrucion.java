package IR.instruction;

import IR.entity.ir_entity;
import IR.IR_visitor;
import IR.basic_block;
import java.util.ArrayList;

public class ir_call_instruction extends ir_instruction{
    public ir_entity result;
    public String function_name;
    public ArrayList<ir_entity> parameters;


    public ir_call_instruction(basic_block parent_block, ir_entity result, String function_name, ArrayList<ir_entity> parameters) {

        super(parent_block);
        this.result = result;
        this.function_name = function_name;
        this.parameters = parameters;

    }

    @Override
    public String toString() {
        StringBuilder string = new StringBuilder();
        string.append(result.toString()).append(" = call ").append(result.type.toString()).append(" @").append(function_name).append("(");
        for (int i = 0; i < parameters.size(); i++) {
            if (i != 0) {
                string.append(", ");
            }
            string.append(parameters.get(i).type.toString()).append(" ").append(parameters.get(i).toString());
        }
        string.append(")");
        return string.toString();
    }

    @Override
    public void accept(IR_visitor visitor) {
        visitor.visit(this);
    }
}
