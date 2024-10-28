package middle;

import IR.*;
import IR.instruction.*;
import IR.node.*;
import IR.entity.*;

public class IR_optimize {
    public ir_program program;
    public CFG_builder cfg_builder = null;
    public domination domination = null;
    public MEm2Reg mEm2Reg = null;

    public IR_optimize(ir_program program) {
        this.program = program;
        cfg_builder = new CFG_builder(program);
        domination = new domination(program);
        mEm2Reg = new MEm2Reg(program);
    }

    public void work(){
        cfg_builder.work();
        domination.work();
        mEm2Reg.work();
    }
}
