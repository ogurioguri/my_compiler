package ast.statement;
import ast.ast_node;
import util.position;
import ast.ast_visitor;

public abstract class statement_node extends ast_node {
    public statement_node(position pos) {
        super(pos);
    }
    @Override
    abstract public void accept(ast_visitor visitor) ;
}
