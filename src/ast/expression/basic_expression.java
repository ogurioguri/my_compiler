package ast.expression;

import ast.ast_node;
import util.position;
import ast.ast_visitor;

abstract public class basic_expression extends ast_node {
    String type;
    boolean is_lvalue;
    boolean is_const;
    public basic_expression(position pos) {
        super(pos);
    }
    @Override
    abstract public void accept(ast_visitor visitor);
}
