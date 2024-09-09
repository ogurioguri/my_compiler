package IR.instruction;
import IR.IR_visitor;
import IR.basic_block;


abstract public class ir_instruction {
    public basic_block parent_block;
    public ir_instruction(basic_block parent_block) {
        this.parent_block = parent_block;
    }

    abstract public String toString();
    abstract public void accept(IR_visitor visitor);
}
