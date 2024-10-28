package IR.instruction;

import IR.IR_visitor;
import IR.basic_block;
import IR.type.*;
import IR.entity.*;

public class ir_binary_instruction extends ir_instruction {

    public String op;
    public ir_entity lhs;
    public ir_entity rhs;
    public ir_entity result;


    public ir_binary_instruction(basic_block parent_block, String op_, ir_entity lhs_, ir_entity rhs_, ir_entity result_) {
        super(parent_block);
        this.op = op_;
        this.lhs = lhs_;
        this.rhs = rhs_;
        this.result = result_;

    }
    @Override
    public String toString() {
        String return_op = "";
        if(this.op.equals("+")){
            return_op = "add";
        }
        else if(this.op.equals("-")){
            return_op = "sub";
        }
        else if(this.op.equals("*")){
            return_op = "mul";
        }
        else if(this.op.equals("/")){
            return_op = "sdiv";
        }
        else if(this.op.equals("%")){
            return_op = "srem";
        }
        else if(this.op.equals("<<")){
            return_op = "shl";
        }
        else if(this.op.equals(">>")){
            return_op = "ashr";
        }
        else if(this.op.equals("&")){
            return_op = "and";
        }
        else if(this.op.equals("|")){
            return_op = "or";
        }
        else if(this.op.equals("^")){
            return_op = "xor";
        }
        return  result.toString() + " = " + return_op + " " + lhs.return_type().toString() + " " + lhs.toString() + ", " + rhs.toString();
    }

    @Override
    public void accept(IR_visitor visitor) {
        visitor.visit(this);
    }
}
