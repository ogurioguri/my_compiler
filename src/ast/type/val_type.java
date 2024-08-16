package ast.type;

public class val_type extends basic_type {
    public int dimension = 0;
    public val_type() {
        super();
        dimension = 0;
    }

    public val_type(basic_type other) {
        super(other);
        if(other instanceof val_type) {
            dimension = ((val_type) other).dimension;
        } else {
            dimension = 0;
        }
    }
    public val_type(String name , int len) {
        super();
        dimension = len;
        if(name.equals("int")) {
            is_int = true;
            this.class_name = name;
        } else if(name.equals("bool")) {
            is_bool = true;
            this.class_name = name;
        } else if(name.equals("String") || name.equals("string")) {
            is_string = true;
            this.class_name = name;
        } else if(name.equals("void")) {
            is_void = true;
            this.class_name = name;
        } else {
            is_class = true;
            class_name = name;
        }

    }


//    public val_type(String class_name) {
//        super(class_name);
//    }

    public boolean equals(val_type other) {
        return (super.equals(other) && dimension == other.dimension);
    }
}
