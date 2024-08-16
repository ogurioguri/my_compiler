package ast.statement;
import util.position;
import ast.ast_visitor;
import java.util.ArrayList;


public class block_statement extends statement_node {
    public ArrayList<statement_node> statements_list;

    public block_statement(position pos ,ArrayList<statement_node> statements_) {
        super(pos);
        this.statements_list = statements_;
    }
    @Override
    public void accept(ast_visitor visitor) {
        visitor.visit(this);
    }
}
