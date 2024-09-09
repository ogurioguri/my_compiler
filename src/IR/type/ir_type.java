package IR.type;

import ast.type.basic_type;
import ast.type.val_type;

public class ir_type {
    public boolean is_int;
    public boolean is_void;
    public boolean is_pointer;
    public int bit_width;

    public ir_type() {
        is_int = false;
        is_void = false;
        is_pointer = false;
        bit_width = 0;
    }

    public ir_type(String type,int a){
        if(type.equals("void")){
            is_int = false;
            is_void = true;
            is_pointer = false;
            bit_width = 0;
        }
        else if(type.equals("int") && a == 0){
            is_int = true;
            is_void = false;
            is_pointer = false;
            bit_width = 32;
        }
        else if(type.equals("bool") && a == 0){
            is_int = true;
            is_void = false;
            is_pointer = false;
            bit_width = 1;
        }
        else{
            is_int = false;
            is_void = false;
            is_pointer = true;
            bit_width = 0;
        }
    }

    public ir_type(String type){
        if(type.equals("void")){
            is_int = false;
            is_void = true;
            is_pointer = false;
            bit_width = 0;
        }
        else if(type.equals("ptr") || type.equals("string")){
            is_int = false;
            is_void = false;
            is_pointer = true;
            bit_width = 0;
        }
        else if(type.equals("int")){
            is_int = true;
            is_void = false;
            is_pointer = false;
            bit_width = 32;
        }
        else if(type.equals("bool")){
            is_int = true;
            is_void = false;
            is_pointer = false;
            bit_width = 1;
        }
        else{
            is_int = true;
            is_void = false;
            is_pointer = false;
            bit_width = Integer.parseInt(type.substring(1));
        }
    }

    public ir_type(val_type initial){
        if(initial.is_int && initial.dimension == 0){
            is_int = true;
            is_void = false;
            is_pointer = false;
            bit_width = 32;
        }
        else if(initial.is_bool && initial.dimension == 0){
            is_int = true;
            is_void = false;
            is_pointer = false;
            bit_width = 1;
        }
        else if(initial.is_void){
            is_int = false;
            is_void = true;
            is_pointer = false;
            bit_width = 0;
        }
        else{
            is_int = false;
            is_void = false;
            is_pointer = true;
            bit_width = 0;
        }
    }

    public ir_type(val_type initial, int dimension){
        if(initial.is_int){
            is_int = true;
            is_void = false;
            is_pointer = false;
            this.bit_width = 32;
        }
        else if(initial.is_bool){
            is_int = true;
            is_void = false;
            is_pointer = false;
            this.bit_width = 1;
        }
        else if(initial.is_void){
            is_int = false;
            is_void = true;
            is_pointer = false;
            this.bit_width = 0;
        }
        else{
            is_int = false;
            is_void = false;
            is_pointer = true;
            this.bit_width = 0;
        }
    }

    public String toString(){
        if(is_int){
            return "i" + bit_width;
        }
        else if(is_void){
            return "void";
        }
        else if(is_pointer){
            return "ptr";
        }
        else{
            throw new RuntimeException("ir_type toString error");
        }
    }

    public boolean equals(ir_type other){
        return is_int == other.is_int && is_void == other.is_void && is_pointer == other.is_pointer && bit_width == other.bit_width;
    }




}
