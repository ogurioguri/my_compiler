package ast;
import ast.statement.block_statement;
import util.position;
import ast.ast_node;
import ast.ast_visitor;

public class class_construction extends ast_node {
    public String name;
    public block_statement class_block;
    public class_construction(position pos ,String name_,block_statement class_block_) {
        super(pos);
        this.name = name_;
        this.class_block = class_block_;
    }
    @Override
    public void accept(ast_visitor visitor) {
        visitor.visit(this);
    }
}
