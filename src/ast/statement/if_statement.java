package ast.statement;
import ast.expression.*;
import util.position;
import ast.ast_visitor;


public class if_statement extends statement_node {
    public basic_expression condition;
    public statement_node then_body;
    public statement_node else_body;
    public if_statement(position pos, basic_expression condition_, statement_node then_body_, statement_node else_body_) {
        super(pos);
        this.condition = condition_;
        this.then_body = then_body_;
        this.else_body = else_body_;
    }
    @Override
    public void accept(ast_visitor visitor) {
        visitor.visit(this);
    }
}
