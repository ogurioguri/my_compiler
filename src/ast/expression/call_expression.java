package ast.expression;
import util.position;
import ast.ast_visitor;
import java.util.ArrayList;

public class call_expression extends basic_expression {
    public basic_expression function;
    public ArrayList<basic_expression> arguments_list;
    public call_expression(position pos,basic_expression function_,ArrayList<basic_expression> arguments_) {
        super(pos);
        function = function_;
        arguments_list = arguments_;
    }
    @Override
    public void accept(ast_visitor visitor) {
        visitor.visit(this);
    }
}
