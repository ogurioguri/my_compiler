package ast.primary;
import util.position;
import ast.ast_visitor;

public class Null extends constant {
    public Null() {
        super();
        this.is_null = true;
    }
    public Null(Null other) {
        super(other);
    }
}
