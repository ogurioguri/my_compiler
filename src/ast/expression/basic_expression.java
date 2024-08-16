package ast.expression;

import ast.ast_node;
import util.position;
import ast.ast_visitor;
import ast.type.val_type;

abstract public class basic_expression extends ast_node {
    public val_type type;
    public boolean is_lvalue;
    public boolean is_const;
    public basic_expression(position pos) {
        super(pos);
    }
    @Override
    abstract public void accept(ast_visitor visitor);
}
