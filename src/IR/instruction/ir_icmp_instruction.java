package IR.instruction;

import IR.basic_block;
import IR.entity.ir_entity;
import IR.IR_visitor;

public class ir_icmp_instruction extends ir_instruction{
    public String icmp;
    public ir_entity result;
    public ir_entity lhs;
    public ir_entity rhs;

    public ir_icmp_instruction(basic_block parent_block, String icmp, ir_entity result, ir_entity lhs, ir_entity rhs) {
        super(parent_block);
        this.icmp = icmp;
        this.lhs = lhs;
        this.rhs = rhs;
    }

    @Override
    public String toString() {
        String op = "";
        if(icmp.equals("==")){
            op = "eq";
        }
        else if(icmp.equals("!=")){
            op = "ne";
        }
        else if(icmp.equals("<")){
            op = "slt";
        }
        else if(icmp.equals(">")){
            op = "sgt";
        }
        else if(icmp.equals("<=")){
            op = "sle";
        }
        else if(icmp.equals(">=")){
            op = "sge";
        }
        return result.toString() + " = icmp " + op + " " + lhs.type.toString() + " " + lhs.toString() + ", " + rhs.toString();
    }

    @Override
    public void accept(IR_visitor visitor) {
        visitor.visit(this);
    }
}
