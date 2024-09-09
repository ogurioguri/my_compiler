package IR;
import IR.instruction.*;
import IR.node.*;


public interface IR_visitor {
    public void visit(ir_store_instruction inst) ;
    public void visit(ir_load_instruction inst) ;
    public void visit(ir_alloca_instruction inst) ;
    public void visit(ir_br_instruction inst) ;
    public void visit(ir_call_instruction inst) ;
//    public void visit(ir_icmp_instruction inst) {}
    public void visit(ir_getelementptr_instruction inst);
    public void visit(ir_phi_instruction inst) ;
    public void visit(ir_return_instruction inst);
    public void visit(ir_binary_instruction inst);
    public void visit(class_node node);
    public void visit(global_variable_node node);
    public void visit(function_definition_node node);
    public void visit(function_node node);
    public void visit(ir_uncond_br node);
    public void visit(ir_stringliteral_node node);
    public void visit(ir_cmp_instruction node);
    public void visit(ir_program node);
    public void visit(basic_block node);

}
