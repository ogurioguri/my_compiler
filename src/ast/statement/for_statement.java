package ast.statement;
import ast.ast_node;
import util.position;
import ast.ast_visitor;
import ast.expression.*;


public class for_statement extends statement_node {
    public statement_node init;
    public basic_expression condition;
    public basic_expression update;
    public statement_node body;

    public for_statement(position pos, statement_node init_, basic_expression condition_, basic_expression update_, statement_node body_) {
        super(pos);
        this.init = init_;
        this.condition = condition_;
        this.update = update_;
        this.body = body_;
    }

    @Override
    public void accept(ast_visitor visitor) {
        visitor.visit(this);
    }
}
