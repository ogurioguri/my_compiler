package ast.statement;
import util.position;
import ast.ast_visitor;


public class empty_statement extends statement_node {
    public empty_statement(position pos) {
        super(pos);
    }
    @Override
    public void accept(ast_visitor visitor) {
        visitor.visit(this);
    }
}
