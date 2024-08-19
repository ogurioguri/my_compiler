package IR;
import IR.instruction.*;


public class IR_visitor {
    public void visit(ir_select_instruction inst) {}
    public void visit(ir_store_instruction inst) {}
    public void visit(ir_load_instruction inst) {}
    public void visit(ir_alloca_instruction inst) {}
    public void visit(ir_br_instruction inst) {}
    public void visit(ir_call_instruction inst) {}
    public void visit(ir_icmp_instruction inst) {}
    public void visit(ir_getelementptr_instruction inst) {}
    public void visit(ir_phi_instruction inst) {}
    public void visit(ir_return_instruction inst){}
    public void visit(ir_binary_instruction inst){}
}
