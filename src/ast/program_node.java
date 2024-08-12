package ast;
import java.util.ArrayList;
import util.position;
public class program_node extends ast_node {
    public ArrayList<ast_node> children; // list of children,which could be class_node,func_node,decl_node
    public program_node(position pos) {
        super(pos);
        this.children = new ArrayList<ast_node>();
    }
    @Override
    public void accept(ast_visitor visitor) {
        visitor.visit(this);
    }

}
