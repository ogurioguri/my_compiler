package ast;
import util.position;
import ast.expression.basic_expression;
import ast.type.val_type;
import java.util.ArrayList;
import java.util.HashMap;

public class val_declaration_node extends ast_node {
    public val_type type;
    public HashMap<String,basic_expression> name_expression_map;
    public val_declaration_node(position pos, val_type type_, HashMap<String,basic_expression> name_expression_map_) {
        super(pos);
        this.type = type_;
        this.name_expression_map = name_expression_map_;
    }

    @Override
    public void accept(ast_visitor visitor) {
        visitor.visit(this);
    }
}
