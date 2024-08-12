package ast.statement;
import ast.ast_node;
import util.position;
import ast.ast_visitor;
import ast.expression.basic_expression;


public class return_statement extends statement_node {
    public basic_expression return_value;

    public return_statement(position pos, basic_expression expression_) {
        super(pos);
        this.return_value = expression_;
    }

    @Override
    public void accept(ast_visitor visitor) {
        visitor.visit(this);
    }
}
