package ast.expression;
import util.position;
import ast.ast_visitor;
import ast.expression.basic_expression;


public class assign_expression extends basic_expression {
    public basic_expression left;
    public basic_expression right;
    public assign_expression(position pos,basic_expression left_,basic_expression right_) {
        super(pos);
        left = left_;
        right = right_;
    }
    @Override
    public void accept(ast_visitor visitor) {
        visitor.visit(this);
    }
}
