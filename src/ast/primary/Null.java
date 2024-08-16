package ast.primary;

public class Null extends constant {
    public Null() {
        super();
        this.is_null = true;
    }
    public Null(Null other) {
        super(other);
    }
}
