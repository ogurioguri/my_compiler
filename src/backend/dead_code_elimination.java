package backend;

import asm.ingredient.*;
import asm.instruction.*;
import asm.section.*;
import asm.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;

public class dead_code_elimination {
    public void work_on_function(asm_function func, HashMap<register,Integer> begin, HashMap<register,Integer> end){
        for(var block: func.body){
            ArrayList<asm_instruction> copy = new ArrayList<asm_instruction>();
            copy.addAll(block.instructions);
            for(var inst: block.instructions){
                if(inst.def() != null && inst.def() instanceof virtual_register reg){
                    if(!end.containsKey(reg) && begin.containsKey(reg)){
                        copy.remove(inst);
                    }
                }
            }
            block.instructions = copy;
        }
        HashMap<register,Integer> copy = new HashMap<register,Integer>(begin);
        for(var key:copy.keySet()){
            if(!end.containsKey(key)){
                begin.remove(key);
            }
        }
    }
}
