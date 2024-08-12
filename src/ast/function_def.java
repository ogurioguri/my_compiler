package ast;
import util.position;
import ast.type.val_type;
import java.util.ArrayList;
import ast.parameterlist_node;
import ast.statement.block_statement;

public class function_def extends ast_node {
    public val_type return_type;
    public String name;
    public parameterlist_node parameter_list;
    public block_statement body;
    public function_def(position pos, val_type return_type_, String name_, parameterlist_node parameter_list_, block_statement body_) {
        super(pos);
        this.return_type = return_type_;
        this.name = name_;
        this.parameter_list = parameter_list_;
        this.body = body_;
    }

    @Override
    public void accept(ast_visitor visitor) {
        visitor.visit(this);
    }
}
