package ast.primary;

public class Integer_literal extends constant {
    public int value;
    public Integer_literal(int value) {
        super();
        this.value = value;
        this.is_int = true;
    }
    public Integer_literal(Integer_literal other) {
        super(other);
        this.value = other.value;
    }
}
