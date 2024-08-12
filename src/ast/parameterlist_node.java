package ast;
import util.position;
import ast.ast_node;
import ast.ast_visitor;
import java.util.ArrayList;
import java.util.HashMap;
import ast.type.*;


public class parameterlist_node extends ast_node {
    public HashMap<String,val_type> type_name_map;
    public parameterlist_node(position pos ,HashMap<String,val_type> type_name_map_) {
        super(pos);
        this.type_name_map = type_name_map_;
    }
    @Override
    public void accept(ast_visitor visitor) {
        visitor.visit(this);
    }
}
