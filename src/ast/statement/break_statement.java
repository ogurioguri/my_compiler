package ast.statement;
import ast.ast_node;
import util.position;
import ast.ast_visitor;


public class break_statement extends statement_node {
    public break_statement(position pos) {
        super(pos);
    }

    @Override
    public void accept(ast_visitor visitor) {
        visitor.visit(this);
    }
}
