package ast.primary;
import util.position;
import ast.ast_visitor;

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
