package ast.type;

import java.util.ArrayList;

public class basic_type {
    public boolean is_int;
    public boolean is_bool;
    public boolean is_string;
    public boolean is_void;
    public boolean is_class;
    public boolean is_function;

    public String class_name;

    public basic_type() {
        this.is_int = false;
        this.is_bool = false;
        this.is_string = false;
        this.is_void = false;
        this.is_class = false;
        this.is_function = false;
    }

    public basic_type(basic_type other) {
        this.is_int = other.is_int;
        this.is_bool = other.is_bool;
        this.is_string = other.is_string;
        this.is_void = other.is_void;
        this.is_class = other.is_class;
        this.class_name = other.class_name;
        this.is_function = other.is_function;
    }

//    public basic_type(String class_name) {
//        is_int = false;
//        is_bool = false;
//        is_string = false;
//        is_void = false;
//        is_class = true;
//        this.class_name = class_name;
//    }

    public boolean equals(basic_type other) {
        if (this.is_int != other.is_int) return false;
        if (this.is_bool != other.is_bool) return false;
        if (this.is_string != other.is_string) return false;
        if (this.is_void != other.is_void) return false;
        if (this.is_class != other.is_class) return false;
        if (this.is_class) {
            return class_name.equals(other.class_name);
        }
        return true;
    }
}
