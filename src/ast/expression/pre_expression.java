package ast.expression;
import util.position;
import ast.ast_visitor;
public class pre_expression extends basic_expression {
    public basic_expression expression;
    public String op; // ++ or -- or ~ or ! or + or -
    public pre_expression(position pos ,basic_expression expression_,String op_) {
        super(pos);
        expression = expression_;
        op = op_;
    }
    @Override
    public void accept(ast_visitor visitor) {
        visitor.visit(this);
    }

}
