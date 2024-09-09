package IR.instruction;

import IR.IR_visitor;
import IR.basic_block;
import IR.entity.ir_entity;
import IR.entity.ir_variable;


public class ir_cmp_instruction extends ir_instruction{
    public String op;
    public ir_entity lhs;
    public ir_entity rhs;
    public ir_variable result;

    public ir_cmp_instruction(basic_block parent_block, String op_, ir_entity lhs_, ir_entity rhs_, ir_variable result_) {
        super(parent_block);
        this.op = op_;
        this.lhs = lhs_;
        this.rhs = rhs_;
        this.result = result_;

    }
    @Override
    public String toString() {
        String return_op = "";
        if(this.op.equals("==")){
            return_op = "eq";
        }
        else if(this.op.equals("!=")){
            return_op = "ne";
        }
        else if(this.op.equals("<")){
            return_op = "slt";
        }
        else if(this.op.equals(">")){
            return_op = "sgt";
        }
        else if(this.op.equals("<=")){
            return_op = "sle";
        }
        else if(this.op.equals(">=")){
            return_op = "sge";
        }
        return  result.toString() + " = " + "icmp " +  return_op + " " + lhs.return_type().toString() + " " + lhs.toString() + ", "  +  rhs.toString();
    }

    @Override
    public void accept(IR_visitor visitor) {
        visitor.visit(this);
    }
}
