package ast.expression;
import util.position;
import ast.ast_visitor;


public class member_expression extends basic_expression {
    public basic_expression object;
    public String member;
    public member_expression(position pos,basic_expression object_,String member_) {
        super(pos);
        object = object_;
        member = member_;
    }
    @Override
    public void accept(ast_visitor visitor) {
        visitor.visit(this);
    }
}
