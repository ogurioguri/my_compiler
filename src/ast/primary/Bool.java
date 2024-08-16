package ast.primary;


public class Bool extends constant {
    public boolean value;
    public Bool(boolean value) {
        super();
        this.value = value;
        this.is_bool = true;
    }
    public Bool(Bool other) {
        super(other);
        this.value = other.value;
    }
}
