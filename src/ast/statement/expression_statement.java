package ast.statement;
import util.position;
import ast.ast_visitor;
import ast.expression.basic_expression;


public class expression_statement extends statement_node {
    public basic_expression expression;

    public expression_statement(position pos, basic_expression expression_) {
        super(pos);
        this.expression = expression_;
    }

    @Override
    public void accept(ast_visitor visitor) {
        visitor.visit(this);
    }
}
