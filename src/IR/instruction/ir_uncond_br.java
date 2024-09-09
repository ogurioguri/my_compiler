package IR.instruction;


import IR.IR_visitor;
import IR.basic_block;

public class ir_uncond_br extends ir_instruction {
    public basic_block dest;

    public ir_uncond_br(basic_block parent,basic_block dest) {
        super(parent);
        this.dest = dest;
    }

    @Override
    public String toString() {
        return "br label %" + dest.label;
    }

    @Override
    public void accept(IR_visitor visitor) {
        visitor.visit(this);
    }
}
