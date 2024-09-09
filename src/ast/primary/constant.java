package ast.primary;

abstract public class constant extends primary {
    public boolean is_int;
    public boolean is_string;
    public boolean is_bool;
    public boolean is_null;
    public boolean is_format_string;
    public boolean is_array_literal;
    public constant() {
        super();
        this.is_constant = true;
        boolean is_int = false;
        boolean is_string = false;
        boolean is_bool = false;
        boolean is_null = false;
        boolean is_format_string = false;
    }
    public constant(constant other) {
        super(other);
        this.is_int = other.is_int;
        this.is_string = other.is_string;
        this.is_bool = other.is_bool;
        this.is_null = other.is_null;
        this.is_format_string = other.is_format_string;
    }
}
