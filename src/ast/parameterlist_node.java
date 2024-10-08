package ast;
import util.position;
import ast.ast_node;
import ast.ast_visitor;
import java.util.ArrayList;
import java.util.HashMap;
import ast.type.*;


public class parameterlist_node extends ast_node {
    public HashMap<String,val_type> type_name_map;
    public ArrayList<val_type> type_list;
    public ArrayList<String> name_list;
    public parameterlist_node(position pos ,HashMap<String,val_type> type_name_map_,ArrayList<val_type>List,ArrayList<String> name_list_){
        super(pos);
        this.type_name_map = type_name_map_;
        this.type_list = List;
        this.name_list = name_list_;
    }
    @Override
    public void accept(ast_visitor visitor) {
        visitor.visit(this);
    }
}
