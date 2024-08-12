package ast.expression;

import util.position;
import ast.ast_visitor;

public class binary_expression extends basic_expression {
    public basic_expression lhs;
    public basic_expression rhs;
    public String op; // * / % + - << >> < > <= >= == != & ^ | && ||
    public binary_expression(position pos ,basic_expression lhs_,basic_expression rhs_,String op_) {
        super(pos);
        lhs = lhs_;
        rhs = rhs_;
        op = op_;
    }
    @Override
    public void accept(ast_visitor visitor) {
        visitor.visit(this);
    }
}
