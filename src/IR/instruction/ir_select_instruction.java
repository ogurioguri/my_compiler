package IR.instruction;
import IR.IR_visitor;
import IR.basic_block;
import IR.entity.ir_entity;

//public class ir_select_instruction extends ir_instruction{
//    public ir_entity result;
//    public String cond;
//    public ir_entity true_val;
//    public ir_entity false_val;
//
//
//    public ir_select_instruction(basic_block parent_block , ir_entity result, String cond, ir_entity true_val, ir_entity false_val) {
//        super(parent_block);
//        this.result = result;
//        this.cond = cond;
//        this.true_val = true_val;
//        this.false_val = false_val;
//    }
//
//    @Override
//    public String toString() {
//        return result.toString() + " = select i1 " + cond + ", " + true_val.type.toString() + " " + true_val.toString() + ", " + false_val.toString();
//    }
//
//    @Override
//    public void accept(IR_visitor visitor) {
//        visitor.visit(this);
//    }
//}
