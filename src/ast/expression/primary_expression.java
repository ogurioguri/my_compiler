package ast.expression;
import util.position;
import ast.ast_visitor;
import ast.primary.*;
public class primary_expression extends basic_expression {
    public primary primary_content;
    public primary_expression(position pos,primary primary_) {
        super(pos);
        primary_content = primary_;
    }
    @Override
    public void accept(ast_visitor visitor) {
        visitor.visit(this);
    }
}
