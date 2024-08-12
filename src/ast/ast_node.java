package ast;
import util.position;

abstract public class ast_node{
    public position pos;
    public ast_node(position pos){
        this.pos = pos;
    }
    public abstract void accept(ast_visitor visitor);

}