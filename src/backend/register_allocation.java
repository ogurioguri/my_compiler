package backend;

import asm.ingredient.*;
import asm.instruction.*;
import asm.section.*;
import asm.*;

public class register_allocation{
    asm_program program;
    public register_allocation(asm_program program){
        this.program = program;
    }
    public void work(){
        live_analyse la = new live_analyse();
        for(var func: program.functions){
            la.work_on_function(func);
        }
        linear_scan ls = new linear_scan(program);
        for(var func: program.functions){
            ls.work_on_function(func);
        }
    }
}
