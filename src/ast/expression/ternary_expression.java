package ast.expression;
import util.position;
import ast.ast_visitor;


public class ternary_expression extends basic_expression {
    public basic_expression condition;
    public basic_expression true_expression;
    public basic_expression false_expression;
    public ternary_expression(position pos ,basic_expression condition_,basic_expression true_expression_,basic_expression false_expression_) {
        super(pos);
        condition = condition_;
        true_expression = true_expression_;
        false_expression = false_expression_;
    }
    @Override
    public void accept(ast_visitor visitor) {
        visitor.visit(this);
    }
}
