package ast.statement;
import util.position;
import ast.ast_visitor;
import ast.val_declaration_node;

public class declaration_statement extends statement_node {
    public val_declaration_node declaration;
    public declaration_statement(position pos, val_declaration_node declaration_) {
        super(pos);
        this.declaration = declaration_;
    }
    @Override
    public void accept(ast_visitor visitor) {
        visitor.visit(this);
    }
}
