package ast.primary;
import ast.ast_node;
import util.position;
import ast.ast_visitor;

public class primary {
    public boolean is_this;
    public boolean is_identified;
    public boolean is_constant;
    public String identified;
    public primary(){
        this.is_this = false;
        this.is_identified = false;
        this.is_constant = false;
        this.identified = "";
    }
    public primary(primary other){
        this.is_this = other.is_this;
        this.is_identified = other.is_identified;
        this.is_constant = other.is_constant;
        this.identified = other.identified;
    }
}
