package asm;

import java.util.ArrayList;
import asm.section.*;

public class asm_program {
    public ArrayList<asm_function> functions = null;
    public ArrayList<asm_val_define> val_defines = null;
    public ArrayList<asm_string_literal> strings = null;
    public asm_program(){
        functions = new ArrayList<asm_function>();
        val_defines = new ArrayList<asm_val_define>();
        strings = new ArrayList<asm_string_literal>();
    }

    public String toString(){
        StringBuilder sb = new StringBuilder();
        for(asm_val_define val_define : val_defines){
            sb.append(val_define);
        }
        for(asm_string_literal string : strings){
            sb.append(string);
        }
        for (asm_function func : functions) {
            sb.append(func);
        }
        return sb.toString();
    }

    public asm_block add_function(String label){
        asm_function func = new asm_function(label);
        asm_block block = new asm_block(label,func);
        func.body.add(block);
        functions.add(func);
        return block;
    }
}
