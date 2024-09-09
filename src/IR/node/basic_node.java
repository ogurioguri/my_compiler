package IR.node;
import IR.IR_visitor;

public abstract class basic_node {
    public abstract String toString();
    public abstract void accept(IR_visitor visitor);
}
