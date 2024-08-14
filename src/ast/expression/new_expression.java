package ast.expression;
import util.position;
import ast.ast_visitor;
import ast.type.val_type;
import java.util.ArrayList;
import ast.primary.*;

public class new_expression extends basic_expression {
    public ArrayList<basic_expression> expression_list;
    public boolean has_array_literal;
    public array_literal value;
    public new_expression(position pos ,ArrayList<basic_expression> expression_list_,val_type type_) {
        super(pos);
        expression_list = expression_list_;
        type = type_;
        has_array_literal = false;
    }
    public new_expression(position pos ,ArrayList<basic_expression> expression_list_,val_type type_,array_literal value_) {
        super(pos);
        expression_list = expression_list_;
        value = value_;
        type = type_;
        has_array_literal = true;
    }
    @Override
    public void accept(ast_visitor visitor) {
        visitor.visit(this);
    }
}
