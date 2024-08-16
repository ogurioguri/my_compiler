package ast.expression;
import util.position;
import ast.ast_visitor;
import java.util.ArrayList;


public class array_expression extends basic_expression{
    public basic_expression array;
    public ArrayList<basic_expression> index;
    public array_expression(position pos ,basic_expression array_,ArrayList<basic_expression> index_) {
        super(pos);
        array = array_;
        index = index_;
    }
    @Override
    public void accept(ast_visitor visitor) {
        visitor.visit(this);
    }
}
