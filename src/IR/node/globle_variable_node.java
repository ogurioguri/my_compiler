package IR.node;

public class globle_variable_node extends basic_node {
    public String name;
    public basic_node type;
    public basic_node value;

    public globle_variable_node(String name, basic_node type, basic_node value) {
        this.name = name;
        this.type = type;
        this.value = value;
    }

    @Override
    public String toString() {
        return "globle_variable_node{" +
                "name='" + name + '\'' +
                ", type=" + type +
                ", value=" + value +
                '}';
    }

    @Override
    public void accept(IR_visitor visitor) {
        visitor.visit(this);
    }
}
