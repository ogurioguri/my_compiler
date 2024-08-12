package ast.statement;
import ast.ast_node;
import util.position;
import ast.ast_visitor;
import ast.expression.*;


public class while_statement extends statement_node {
    public basic_expression condition;
    public statement_node body;
    public while_statement(position pos, basic_expression condition_, statement_node body_) {
        super(pos);
        this.condition = condition_;
        this.body = body_;
    }
    @Override
    public void accept(ast_visitor visitor) {
        visitor.visit(this);
    }
}
